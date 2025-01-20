@interface CLBSoundController
+ (id)sharedInstance;
- (BOOL)_playSystemSound:(id)a3;
- (BOOL)_playToneAlert:(id)a3;
- (BOOL)isPlaying:(id)a3;
- (BOOL)isPlayingAnySound;
- (BOOL)playSound:(id)a3 completion:(id)a4;
- (BOOL)stopAllSounds;
- (BOOL)stopSound:(id)a3;
- (CLBSoundController)init;
- (void)_beginPendingCallbacksBlock;
- (void)_cleanupSystemSound:(unsigned int)a3 andKill:(BOOL)a4;
- (void)_cleanupToneAlertForSound:(id)a3 andKill:(BOOL)a4;
- (void)_endPendingCallbacksBlock;
- (void)_enqueueCallback:(id)a3;
@end

@implementation CLBSoundController

+ (id)sharedInstance
{
  if (qword_100181000 != -1) {
    dispatch_once(&qword_100181000, &stru_10015C140);
  }
  v2 = (void *)qword_100180FF8;

  return v2;
}

- (CLBSoundController)init
{
  v10.receiver = self;
  v10.super_class = (Class)CLBSoundController;
  v2 = [(CLBSoundController *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    soundsBySystemSoundIDs = v2->_soundsBySystemSoundIDs;
    v2->_soundsBySystemSoundIDs = v3;

    v5 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:0 capacity:0];
    toneAlertsBySounds = v2->_toneAlertsBySounds;
    v2->_toneAlertsBySounds = v5;

    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendedCallbacks = v2->_pendedCallbacks;
    v2->_pendedCallbacks = v7;
  }
  return v2;
}

- (BOOL)isPlayingAnySound
{
  if (!+[NSThread isMainThread]) {
    sub_1000FF544();
  }
  return [(NSMutableDictionary *)self->_soundsBySystemSoundIDs count]
      || [(NSMapTable *)self->_toneAlertsBySounds count] != 0;
}

- (BOOL)isPlaying:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread]) {
    sub_1000FF570();
  }
  id v5 = [v4 soundType];
  if (v5 == (id)1)
  {
    v6 = [(NSMapTable *)self->_toneAlertsBySounds objectForKey:v4];
    unsigned __int8 v8 = v6 != 0;
  }
  else
  {
    if (v5)
    {
      unsigned __int8 v8 = 0;
      goto LABEL_8;
    }
    v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 systemSoundID]);
    v7 = [(NSMutableDictionary *)self->_soundsBySystemSoundIDs objectForKey:v6];
    unsigned __int8 v8 = [v7 isEqual:v4];
  }
LABEL_8:

  return v8;
}

- (BOOL)playSound:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    LOBYTE(v10) = 0;
    goto LABEL_18;
  }
  if (!+[NSThread isMainThread]) {
    sub_1000FF59C();
  }
  [(CLBSoundController *)self stopSound:v6];
  id v8 = [v6 soundType];
  if (v8 == (id)1)
  {
    unsigned int v9 = [(CLBSoundController *)self _playToneAlert:v6];
  }
  else
  {
    if (v8)
    {
      v11 = +[CLFLog commonLog];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Don't know how to play this sound type: %@", (uint8_t *)&v15, 0xCu);
      }

      BOOL v10 = 0;
      goto LABEL_12;
    }
    unsigned int v9 = [(CLBSoundController *)self _playSystemSound:v6];
  }
  BOOL v10 = v9;
LABEL_12:
  v12 = +[CLFLog commonLog];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = " NOT";
    if (v10) {
      v13 = "";
    }
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2080;
    v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Sound %@ DID%s play", (uint8_t *)&v15, 0x16u);
  }

  if (v10)
  {
    [v6 setCompletionBlock:v7];
    LOBYTE(v10) = 1;
  }
LABEL_18:

  return v10;
}

- (BOOL)stopSound:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread]) {
    sub_1000FF5C8();
  }
  BOOL v5 = [(CLBSoundController *)self isPlaying:v4];
  if (v5)
  {
    id v6 = [v4 soundType];
    if (v6 == (id)1)
    {
      [(CLBSoundController *)self _cleanupToneAlertForSound:v4 andKill:1];
    }
    else if (v6)
    {
      id v7 = +[CLFLog commonLog];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Don't know how to kill this sound type: %@", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      -[CLBSoundController _cleanupSystemSound:andKill:](self, "_cleanupSystemSound:andKill:", [v4 systemSoundID], 1);
    }
  }

  return v5;
}

- (BOOL)stopAllSounds
{
  if (!+[NSThread isMainThread]) {
    sub_1000FF5F4();
  }
  if ([(NSMutableDictionary *)self->_soundsBySystemSoundIDs count]) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = [(NSMapTable *)self->_toneAlertsBySounds count] != 0;
  }
  [(CLBSoundController *)self _beginPendingCallbacksBlock];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(NSMutableDictionary *)self->_soundsBySystemSoundIDs allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        -[CLBSoundController _cleanupSystemSound:andKill:](self, "_cleanupSystemSound:andKill:", [*(id *)(*((void *)&v20 + 1) + 8 * i) unsignedIntValue], 1);
      }
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = [(NSMapTable *)self->_toneAlertsBySounds copy];
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        [(CLBSoundController *)self _cleanupToneAlertForSound:*(void *)(*((void *)&v16 + 1) + 8 * (void)j) andKill:0];
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }

  unsigned __int8 v14 = +[TLAlert _stopAllAlerts];
  [(CLBSoundController *)self _endPendingCallbacksBlock];
  return v14 | v3;
}

- (void)_cleanupSystemSound:(unsigned int)a3 andKill:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  if (!+[NSThread isMainThread]) {
    sub_1000FF620();
  }
  id v8 = +[NSNumber numberWithUnsignedInt:v5];
  AudioServicesRemoveSystemSoundCompletion(v5);
  if (v4) {
    AudioServicesStopSystemSound();
  }
  uint64_t v7 = [(NSMutableDictionary *)self->_soundsBySystemSoundIDs objectForKey:v8];
  if (v7) {
    [(NSMutableDictionary *)self->_soundsBySystemSoundIDs removeObjectForKey:v8];
  }
}

- (void)_cleanupToneAlertForSound:(id)a3 andKill:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = -[NSMapTable objectForKey:](self->_toneAlertsBySounds, "objectForKey:");
  uint64_t v7 = v6;
  if (v6)
  {
    if (v4) {
      [v6 stop];
    }
    [(NSMapTable *)self->_toneAlertsBySounds removeObjectForKey:v8];
  }
}

- (BOOL)_playSystemSound:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 systemSoundID];
  id v6 = [v4 vibrationPattern];
  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    uint64_t v8 = 4095;
  }
  else {
    uint64_t v8 = v5;
  }
  id v9 = +[NSNumber numberWithInt:v8];
  [(CLBSoundController *)self _cleanupSystemSound:v8 andKill:1];
  Current = CFRunLoopGetCurrent();
  OSStatus v11 = AudioServicesAddSystemSoundCompletion(v8, Current, kCFRunLoopCommonModes, (AudioServicesSystemSoundCompletionProc)sub_100009D5C, 0);
  if (!v11) {
    [(NSMutableDictionary *)self->_soundsBySystemSoundIDs setObject:v4 forKey:v9];
  }

  return v11 == 0;
}

- (BOOL)_playToneAlert:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 alertConfiguration];
  id v6 = +[TLAlert alertWithConfiguration:v5];
  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100009F08;
    v11[3] = &unk_10015C190;
    BOOL v7 = v4;
    uint64_t v12 = v7;
    id v13 = v5;
    unsigned __int8 v14 = self;
    [v6 playWithCompletionHandler:v11];
    [(NSMapTable *)self->_toneAlertsBySounds setObject:v6 forKey:v7];

    uint64_t v8 = v12;
  }
  else
  {
    uint64_t v8 = +[CLFLog commonLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "ToneLibrary: no tone or vibration to play", (uint8_t *)&v10, 2u);
    }
  }

  return v6 != 0;
}

- (void)_beginPendingCallbacksBlock
{
}

- (void)_endPendingCallbacksBlock
{
  unint64_t v2 = self->_pendingCallbacks - 1;
  self->_pendingCallbacks = v2;
  if (!v2)
  {
    id v4 = [(NSMutableArray *)self->_pendedCallbacks copy];
    [(NSMutableArray *)self->_pendedCallbacks removeAllObjects];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_enqueueCallback:(id)a3
{
  if (self->_pendingCallbacks)
  {
    id v7 = [a3 copy];
    pendedCallbacks = self->_pendedCallbacks;
    id v5 = objc_retainBlock(v7);
    [(NSMutableArray *)pendedCallbacks addObject:v5];
  }
  else
  {
    id v6 = (void (*)(id))*((void *)a3 + 2);
    v6(a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendedCallbacks, 0);
  objc_storeStrong((id *)&self->_toneAlertsBySounds, 0);

  objc_storeStrong((id *)&self->_soundsBySystemSoundIDs, 0);
}

@end