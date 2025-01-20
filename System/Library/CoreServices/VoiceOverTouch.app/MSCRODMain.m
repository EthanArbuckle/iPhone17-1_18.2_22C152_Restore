@interface MSCRODMain
+ (id)commandPath;
+ (id)processIdentifier;
+ (id)versionString;
- (MSCRODMain)initWithArgc:(int)a3 argv:(const char *)a4;
- (id)_safeHandlerForType:(int *)a3;
- (int)getValue:(id *)a3 forKey:(int)a4 handlerType:(int)a5 trusted:(BOOL)a6;
- (int)getValue:(id *)a3 forKey:(int)a4 withObject:(id)a5 handlerType:(int)a6 trusted:(BOOL)a7;
- (int)handleEvent:(id)a3 handlerType:(int)a4 trusted:(BOOL)a5;
- (int)performActionForKey:(int)a3 handlerType:(int)a4 trusted:(BOOL)a5;
- (int)registerCallbackForKey:(int)a3 forClientIdentifier:(unsigned int)a4 handlerType:(int)a5 trusted:(BOOL)a6;
- (int)run;
- (int)setValue:(id)a3 forKey:(int)a4 handlerType:(int)a5 trusted:(BOOL)a6;
- (void)_goDogGo:(id)a3;
- (void)_serverTimeoutNotificationHandler:(id)a3;
- (void)dealloc;
- (void)handleCallback:(id)a3;
- (void)stop;
@end

@implementation MSCRODMain

- (MSCRODMain)initWithArgc:(int)a3 argv:(const char *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MSCRODMain;
  v4 = [(MSCRODMain *)&v12 initWithArgc:*(void *)&a3 argv:a4];
  if (v4)
  {
    v5 = +[SCROServer sharedServer];
    unsigned int v6 = [v5 registerWithMach];

    if (!v6)
    {
      v10 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&qword_100019C20, v4);
    v4->_runLoops = (__CFRunLoop **)malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
    v7 = +[NSNotificationCenter defaultCenter];
    uint64_t v8 = kSCROServerTimeoutNotification;
    v9 = +[SCROServer sharedServer];
    [v7 addObserver:v4 selector:"_serverTimeoutNotificationHandler:" name:v8 object:v9];
  }
  v10 = v4;
LABEL_6:

  return v10;
}

- (void)dealloc
{
  v4 = +[SCROServer sharedServer];
  [v4 setDelegate:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  unsigned int v6 = (void *)qword_100019C20;
  qword_100019C20 = 0;

  free(self->_runLoops);
  v7.receiver = self;
  v7.super_class = (Class)MSCRODMain;
  [(MSCRODMain *)&v7 dealloc];
}

+ (id)processIdentifier
{
  return @"com.apple.scrod";
}

+ (id)versionString
{
  return @"Mobile Screen Reader Output Server.  Version 2.0.";
}

+ (id)commandPath
{
  return @"/System/Library/CoreServices/VoiceOverTouch.app/scrod";
}

- (id)_safeHandlerForType:(int *)a3
{
  int v3 = *a3;
  if ((*a3 - 3) < 0xFFFFFFFE) {
    int v3 = 0;
  }
  *a3 = v3;
  return self->_handlers[v3];
}

- (int)run
{
  +[SCRCThread setDefaultThreadPriority:47];
  v21.receiver = self;
  v21.super_class = (Class)MSCRODMain;
  int v3 = [(MSCRODMain *)&v21 run];
  v4 = self->_handlers[0];
  self->_handlers[0] = 0;

  id v5 = objc_allocWithZone((Class)SCROBrailleHandler);
  unsigned int v6 = +[MSCRODBrailleDisplayManager sharedManager];
  objc_super v7 = (SCROHandler *)[v5 initWithBrailleDisplayManager:v6];
  uint64_t v8 = self->_handlers[1];
  self->_handlers[1] = v7;

  v9 = self->_handlers[2];
  self->_handlers[2] = 0;

  for (uint64_t i = 0; i != 2; ++i)
    [(SCROHandler *)self->_handlers[i + 1] setCallbackDelegate:self];
  self->_mainRunLoop = CFRunLoopGetCurrent();
  v11 = +[SCROServer sharedServer];
  [v11 setDelegate:self];

  id v12 = objc_allocWithZone((Class)NSDictionary);
  v13 = +[SCROServer sharedServer];
  id v14 = [v13 serverSource];
  v15 = +[NSNumber numberWithInt:0];
  id v16 = objc_msgSend(v12, "initWithObjectsAndKeys:", v14, @"server", v15, @"index", 0);

  +[NSThread detachNewThreadSelector:"_goDogGo:" toTarget:self withObject:v16];
  [(MSCRODMain *)self _goDogGo:0];
  uint64_t v17 = 0;
  v18 = &self->_handlers[1];
  do
  {
    [(SCROHandler *)v18[v17] lock];
    v19 = v18[v17];
    if (v19 && !*((unsigned char *)v19 + OBJC_IVAR___SCROHandler_isInvalid)) {
      [(SCROHandler *)v19 invalidate];
    }
    [(SCROHandler *)v18[v17++] unlock];
  }
  while (v17 != 2);
  return v3;
}

- (void)_goDogGo:(id)a3
{
  id v10 = a3;
  AXSetThreadPriority();
  id v5 = [v10 objectForKey:@"index"];
  unsigned int v6 = (__CFRunLoopSource *)[v10 objectForKey:@"server"];
  Current = CFRunLoopGetCurrent();
  uint64_t v8 = Current;
  if (Current != self->_mainRunLoop) {
    CFRunLoopAddSource(Current, v6, kCFRunLoopDefaultMode);
  }
  if (v5) {
    self->_runLoops[(void)[v5 integerValue]] = v8;
  }
  while (!self->_stop)
    CFRunLoopRun();
  if (v8 == self->_mainRunLoop)
  {
    v9 = +[SCROServer sharedServer];
    [v9 unregisterWithMach];
  }
}

- (void)stop
{
  v8.receiver = self;
  v8.super_class = (Class)MSCRODMain;
  [(MSCRODMain *)&v8 stop];
  self->_stop = 1;
  runLoops = self->_runLoops;
  v4 = *runLoops;
  *runLoops = 0;
  if (v4) {
    CFRunLoopStop(v4);
  }
  id v5 = +[MSCRODBrailleDisplayManager sharedManager];
  [v5 invalidate];

  unsigned int v6 = AXLogBrailleHW();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopping scrod", v7, 2u);
  }

  CFRunLoopStop(self->_mainRunLoop);
}

- (void)_serverTimeoutNotificationHandler:(id)a3
{
}

- (void)handleCallback:(id)a3
{
}

- (int)handleEvent:(id)a3 handlerType:(int)a4 trusted:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  unsigned int v13 = a4;
  v9 = [(MSCRODMain *)self _safeHandlerForType:&v13];
  id v10 = v9;
  if (v9)
  {
    [v9 lock];
    if (!v10[OBJC_IVAR___SCROHandler_isInvalid]) {
      [v8 performWithHandler:v10 trusted:v5];
    }
    int v11 = 0;
    [v10 unlock];
  }
  else
  {
    NSLog(@"Invalid handler type: %d sent from client.", v13);
    int v11 = 1;
  }

  return v11;
}

- (int)registerCallbackForKey:(int)a3 forClientIdentifier:(unsigned int)a4 handlerType:(int)a5 trusted:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a3;
  unsigned int v12 = a5;
  id v8 = -[MSCRODMain _safeHandlerForType:](self, "_safeHandlerForType:", &v12, *(void *)&a4);
  v9 = v8;
  if (v8)
  {
    [v8 lock];
    if (*((unsigned char *)v9 + OBJC_IVAR___SCROHandler_isInvalid)) {
      int v10 = 1;
    }
    else {
      int v10 = [v9 handleRegisterCallbackForKey:v7 trusted:v6];
    }
    [v9 unlock];
  }
  else
  {
    NSLog(@"Invalid handler type: %d sent from client.", v12);
    int v10 = 1;
  }

  return v10;
}

- (int)setValue:(id)a3 forKey:(int)a4 handlerType:(int)a5 trusted:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  unsigned int v15 = a5;
  int v11 = [(MSCRODMain *)self _safeHandlerForType:&v15];
  unsigned int v12 = v11;
  if (v11)
  {
    [v11 lock];
    if (*((unsigned char *)v12 + OBJC_IVAR___SCROHandler_isInvalid)) {
      int v13 = 1;
    }
    else {
      int v13 = [v12 handleSetValue:v10 forKey:v8 trusted:v6];
    }
    [v12 unlock];
  }
  else
  {
    NSLog(@"Invalid handler type: %d sent from client.", v15);
    int v13 = 1;
  }

  return v13;
}

- (int)getValue:(id *)a3 forKey:(int)a4 handlerType:(int)a5 trusted:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a4;
  unsigned int v13 = a5;
  v9 = [(MSCRODMain *)self _safeHandlerForType:&v13];
  id v10 = v9;
  if (v9)
  {
    [v9 lock];
    if (*((unsigned char *)v10 + OBJC_IVAR___SCROHandler_isInvalid)) {
      int v11 = 1;
    }
    else {
      int v11 = [v10 handleGetValue:a3 forKey:v7 trusted:v6];
    }
    [v10 unlock];
  }
  else
  {
    NSLog(@"Invalid handler type: %d sent from client.", v13);
    int v11 = 1;
  }

  return v11;
}

- (int)getValue:(id *)a3 forKey:(int)a4 withObject:(id)a5 handlerType:(int)a6 trusted:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v9 = *(void *)&a4;
  id v12 = a5;
  unsigned int v17 = a6;
  unsigned int v13 = [(MSCRODMain *)self _safeHandlerForType:&v17];
  id v14 = v13;
  if (v13)
  {
    [v13 lock];
    if (*((unsigned char *)v14 + OBJC_IVAR___SCROHandler_isInvalid)) {
      int v15 = 1;
    }
    else {
      int v15 = [v14 handleGetValue:a3 forKey:v9 withObject:v12 trusted:v7];
    }
    [v14 unlock];
  }
  else
  {
    NSLog(@"Invalid handler type: %d sent from client.", v17);
    int v15 = 1;
  }

  return v15;
}

- (int)performActionForKey:(int)a3 handlerType:(int)a4 trusted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  unsigned int v11 = a4;
  BOOL v7 = [(MSCRODMain *)self _safeHandlerForType:&v11];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 lock];
    if (*((unsigned char *)v8 + OBJC_IVAR___SCROHandler_isInvalid)) {
      int v9 = 1;
    }
    else {
      int v9 = [v8 handlePerformActionForKey:v6 trusted:v5];
    }
    [v8 unlock];
  }
  else
  {
    NSLog(@"Invalid handler type: %d sent from client.", v11);
    int v9 = 1;
  }

  return v9;
}

- (void).cxx_destruct
{
  handlers = self->_handlers;
  for (uint64_t i = 2; i != -1; --i)
    objc_storeStrong((id *)&handlers[i], 0);
}

@end