@interface DOMAccessoryArbitrator
+ (BOOL)isInF5Mode;
+ (id)sharedDomAccessoryArbitrator;
- (DOMAccessoryArbitrator)init;
- (IONotificationPort)ioNotificationPort;
- (IONotificationPort)ioOvercurrentNotificationPort;
- (NSMutableArray)personalities;
- (id)createUserNotificationDict;
- (id)jobType:(id)a3 jobType:(int *)a4;
- (int64_t)iOSDeviceThreshold;
- (unsigned)io_overcurrentNotification;
- (void)addBadDevicesToDialogDictBody:(id)a3;
- (void)addMatchJobServiceNamed:(id)a3 info:(id)a4 jobType:(int)a5;
- (void)addMatchingThings:(id)a3 matchJob:(id)a4;
- (void)addNotification:(id)a3 matchJob:(id)a4;
- (void)addPersonality:(id)a3 matchJob:(id)a4;
- (void)dealloc;
- (void)deviceArrived:(unsigned int)a3;
- (void)displayDialog;
- (void)displayOverCurrentDialog;
- (void)loadLaunchdJobsAtPath:(id)a3;
- (void)matchDevice:(id)a3;
- (void)overcurrentCondition:(unsigned int)a3;
- (void)probePersonalitiesForService:(unsigned int)a3 ofDevice:(id)a4 inGroup:(id)a5;
- (void)registerOffendingDomDevice:(id)a3;
- (void)releaseOverCurrentDialog;
- (void)scanPlistsAtPath:(id)a3 execBlock:(id)a4;
- (void)scheduleDialog;
- (void)setIoNotificationPort:(IONotificationPort *)a3;
- (void)setIoOvercurrentNotificationPort:(IONotificationPort *)a3;
- (void)setIo_overcurrentNotification:(unsigned int)a3;
- (void)setPersonalities:(id)a3;
- (void)unregisterOffendingDomDevice:(id)a3;
- (void)userDismissedNotification:(__CFUserNotification *)a3;
- (void)userDismissedOvercurrentNotification:(__CFUserNotification *)a3;
@end

@implementation DOMAccessoryArbitrator

+ (id)sharedDomAccessoryArbitrator
{
  if (qword_100014FF8 != -1) {
    dispatch_once(&qword_100014FF8, &stru_100010698);
  }
  v2 = (void *)qword_100014FF0;

  return v2;
}

- (DOMAccessoryArbitrator)init
{
  v13.receiver = self;
  v13.super_class = (Class)DOMAccessoryArbitrator;
  v2 = [(DOMAccessoryArbitrator *)&v13 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    personalities = v2->_personalities;
    v2->_personalities = v3;

    v5 = IONotificationPortCreate(kIOMainPortDefault);
    v2->_ioNotificationPort = v5;
    if (v5)
    {
      IONotificationPortSetDispatchQueue(v5, (dispatch_queue_t)&_dispatch_main_q);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10000A7E4();
    }
    objc_storeStrong((id *)&v2->mainQ, &_dispatch_main_q);
    [(DOMAccessoryArbitrator *)v2 loadLaunchdJobsAtPath:@"/System/Library/LaunchDaemons/"];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100004580;
    v11[3] = &unk_1000106C0;
    v6 = v2;
    v12 = v6;
    [(DOMAccessoryArbitrator *)v6 scanPlistsAtPath:@"/System/Library/DeviceOMatic/" execBlock:v11];
    v6->_iOSDeviceThreshold = 0;
    v7 = (void *)MGCopyAnswer();
    v8 = v7;
    if (v7)
    {
      if (([v7 isEqualToString:@"iPad"] & 1) == 0) {
        v6->_iOSDeviceThreshold = 32766;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not lookup the iOS device class?", (uint8_t *)&v10, 2u);
    }
  }
  return v2;
}

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ENTRY", buf, 2u);
  }
  ioNotificationPort = self->_ioNotificationPort;
  if (ioNotificationPort) {
    IONotificationPortDestroy(ioNotificationPort);
  }
  v4.receiver = self;
  v4.super_class = (Class)DOMAccessoryArbitrator;
  [(DOMAccessoryArbitrator *)&v4 dealloc];
}

- (void)registerOffendingDomDevice:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->mainQ);
  badDevices = self->badDevices;
  if (!badDevices)
  {
    v5 = +[NSMutableArray arrayWithCapacity:0];
    v6 = self->badDevices;
    self->badDevices = v5;

    badDevices = self->badDevices;
  }
  [(NSMutableArray *)badDevices addObject:v7];
  [(DOMAccessoryArbitrator *)self scheduleDialog];
}

- (void)unregisterOffendingDomDevice:(id)a3
{
  mainQ = self->mainQ;
  id v5 = a3;
  dispatch_assert_queue_V2(mainQ);
  [(NSMutableArray *)self->badDevices removeObject:v5];

  [(DOMAccessoryArbitrator *)self displayDialog];
}

- (void)addBadDevicesToDialogDictBody:(id)a3
{
  id v16 = a3;
  objc_super v4 = +[NSMutableArray arrayWithCapacity:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->badDevices;
  id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        __int16 v10 = [v9 dialogBodyKey];
        v11 = [v9 name];

        if (v11) {
          [v9 name];
        }
        else {
        v12 = sub_100008CE0(@"Accessory");
        }
        objc_super v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v12);
        [v4 addObject:v13];

        if ([v9 isThunderboltDevice])
        {
          v14 = sub_100008CE0(@"Cannot Use Thunderbolt Accessory");
          [v16 setObject:v14 forKey:kCFUserNotificationAlertHeaderKey];
        }
      }
      id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  v15 = [v4 componentsJoinedByString:@"\n"];
  [v16 setObject:v15 forKey:kCFUserNotificationAlertMessageKey];
}

- (id)createUserNotificationDict
{
  v3 = +[NSMutableDictionary dictionaryWithCapacity:0];
  objc_super v4 = +[NSNumber numberWithBool:1];
  [v3 setValue:v4 forKey:kCFUserNotificationAlertTopMostKey];

  id v5 = sub_100008CE0(@"Cannot Use Accessory");
  [v3 setObject:v5 forKey:kCFUserNotificationAlertHeaderKey];

  [(DOMAccessoryArbitrator *)self addBadDevicesToDialogDictBody:v3];
  id v6 = sub_100008CE0(@"OK");
  [v3 setObject:v6 forKey:kCFUserNotificationDefaultButtonTitleKey];

  return v3;
}

- (void)userDismissedNotification:(__CFUserNotification *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->mainQ);
  if (a3)
  {
    if (self->notificationRef != a3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      notificationRef = self->notificationRef;
      int v6 = 134218240;
      uint64_t v7 = a3;
      __int16 v8 = 2048;
      v9 = notificationRef;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification %p is not the same as notificationRef %p", (uint8_t *)&v6, 0x16u);
    }
    [(NSMutableArray *)self->badDevices removeAllObjects];
    [(DOMAccessoryArbitrator *)self displayDialog];
  }
}

- (void)userDismissedOvercurrentNotification:(__CFUserNotification *)a3
{
  if (a3)
  {
    if (self->overcurrentNotificationRef != a3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      overcurrentNotificationRef = self->overcurrentNotificationRef;
      int v6 = 134218240;
      uint64_t v7 = a3;
      __int16 v8 = 2048;
      v9 = overcurrentNotificationRef;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "notification %p is not the same as overcurrentNotificationRef %p", (uint8_t *)&v6, 0x16u);
    }
    [(DOMAccessoryArbitrator *)self releaseOverCurrentDialog];
  }
}

- (void)displayDialog
{
  if (sub_100004DFC())
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->mainQ);
    id v3 = [(NSMutableArray *)self->badDevices count];
    notificationRef = self->notificationRef;
    if (v3)
    {
      BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (notificationRef)
      {
        if (v5)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "dialog already up, refresh", buf, 2u);
        }
        CFUserNotificationUpdate(self->notificationRef, 0.0, 3uLL, (CFDictionaryRef)[(DOMAccessoryArbitrator *)self createUserNotificationDict]);
      }
      else
      {
        if (v5)
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "displaying unsupported dialog", v26, 2u);
        }
        Main = CFRunLoopGetMain();
        uint64_t v7 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, 0, (CFDictionaryRef)[(DOMAccessoryArbitrator *)self createUserNotificationDict]);
        self->notificationRef = v7;
        if (v7)
        {
          RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v7, (CFUserNotificationCallBack)sub_100004EE4, 0);
          if (RunLoopSource)
          {
            v9 = RunLoopSource;
            CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopCommonModes);
            CFRelease(v9);
          }
          else
          {
            CFRelease(self->notificationRef);
            self->notificationRef = 0;
            BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v18) {
              sub_10000A89C(v18, v19, v20, v21, v22, v23, v24, v25);
            }
          }
        }
        else
        {
          BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v10) {
            sub_10000A860(v10, v11, v12, v13, v14, v15, v16, v17);
          }
        }
      }
    }
    else if (notificationRef)
    {
      CFUserNotificationCancel(self->notificationRef);
      CFRelease(self->notificationRef);
      self->notificationRef = 0;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device-O-Matic dialogs are disabled, we'll not bother the user.", v28, 2u);
  }
}

- (void)releaseOverCurrentDialog
{
  overcurrentNotificationRef = self->overcurrentNotificationRef;
  if (overcurrentNotificationRef)
  {
    CFUserNotificationCancel(overcurrentNotificationRef);
    CFRelease(self->overcurrentNotificationRef);
    self->overcurrentNotificationRef = 0;
  }
  ioOvercurrentNotificationPort = self->_ioOvercurrentNotificationPort;
  if (ioOvercurrentNotificationPort)
  {
    IONotificationPortDestroy(ioOvercurrentNotificationPort);
    self->_ioOvercurrentNotificationPort = 0;
  }
  io_object_t io_overcurrentNotification = self->_io_overcurrentNotification;
  if (io_overcurrentNotification)
  {
    IOObjectRelease(io_overcurrentNotification);
    self->_io_object_t io_overcurrentNotification = 0;
  }
}

- (void)displayOverCurrentDialog
{
  if (sub_100004DFC())
  {
    id v3 = +[NSMutableDictionary dictionary];
    objc_super v4 = +[NSNumber numberWithBool:1];
    [v3 setValue:v4 forKey:kCFUserNotificationAlertTopMostKey];

    BOOL v5 = sub_100008CE0(@"Cannot Use Accessory");
    [v3 setObject:v5 forKey:kCFUserNotificationAlertHeaderKey];

    int v6 = sub_100008CE0(@"This accessory uses too much power");
    [v3 setObject:v6 forKey:kCFUserNotificationAlertMessageKey];

    overcurrentNotificationRef = self->overcurrentNotificationRef;
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (overcurrentNotificationRef)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "dialog already up, refresh", buf, 2u);
      }
      CFUserNotificationUpdate(self->overcurrentNotificationRef, 0.0, 3uLL, (CFDictionaryRef)v3);
    }
    else
    {
      if (v8)
      {
        *(_WORD *)v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "displaying unsupported dialog", v29, 2u);
      }
      Main = CFRunLoopGetMain();
      BOOL v10 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, 0, (CFDictionaryRef)v3);
      self->overcurrentNotificationRef = v10;
      if (v10)
      {
        RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v10, (CFUserNotificationCallBack)sub_10000521C, 0);
        if (RunLoopSource)
        {
          uint64_t v12 = RunLoopSource;
          CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopCommonModes);
          CFRelease(v12);
        }
        else
        {
          CFRelease(self->overcurrentNotificationRef);
          self->overcurrentNotificationRef = 0;
          BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v21) {
            sub_10000A89C(v21, v22, v23, v24, v25, v26, v27, v28);
          }
        }
      }
      else
      {
        BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v13) {
          sub_10000A8D8(v13, v14, v15, v16, v17, v18, v19, v20);
        }
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device-O-Matic dialogs are disabled, we'll not bother the user.", v31, 2u);
  }
}

- (void)scheduleDialog
{
  id v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->mainQ);
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005348;
  v6[3] = &unk_1000106E8;
  v6[4] = self;
  uint64_t v7 = v3;
  BOOL v5 = v3;
  dispatch_source_set_event_handler(v5, v6);
  dispatch_resume(v5);
}

- (void)addPersonality:(id)a3 matchJob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  io_iterator_t notification = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    IOServiceAddMatchingNotification([(DOMAccessoryArbitrator *)self ioNotificationPort], "IOServiceFirstMatch", (CFDictionaryRef)v6, (IOServiceMatchingCallback)sub_100005438, v7, &notification);
    sub_100005438(v7, notification);
  }
}

- (void)addNotification:(id)a3 matchJob:(id)a4
{
  name = (__CFString *)a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_1000055A4, name, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)addMatchingThings:(id)a3 matchJob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v12);
          if (objc_msgSend(v7, "jobType", (void)v14) == 1)
          {
            [(DOMAccessoryArbitrator *)self addNotification:v13 matchJob:v7];
          }
          else if (![v7 jobType])
          {
            [(DOMAccessoryArbitrator *)self addPersonality:v13 matchJob:v7];
          }
          uint64_t v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  else if ([v7 jobType] == 1)
  {
    [(DOMAccessoryArbitrator *)self addNotification:v6 matchJob:v7];
  }
  else if (![v7 jobType])
  {
    [(DOMAccessoryArbitrator *)self addPersonality:v6 matchJob:v7];
  }
}

- (void)addMatchJobServiceNamed:(id)a3 info:(id)a4 jobType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = v9;
  switch(v5)
  {
    case 2:
      uint64_t v12 = [v9 objectForKey:@"IOKitPersonalities"];
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_100005A60;
          v17[3] = &unk_100010710;
          v17[4] = self;
          uint64_t v18 = v8;
          [v13 enumerateKeysAndObjectsUsingBlock:v17];
        }
      }
      break;
    case 0xFFFFFFFF:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000A984();
      }
      uint64_t v11 = 0;
      goto LABEL_23;
    case 1:
      CFStringRef v14 = @"Notification";
      break;
    default:
      CFStringRef v14 = @"IOKitPersonalities";
      break;
  }
  uint64_t v11 = [v10 objectForKey:v14];
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*** WARNING!! ***  adding a JT_IOKIT personality!", v16, 2u);
  }
  if (v8 && v11)
  {
    long long v15 = objc_alloc_init(DOMMatchJob);
    [(DOMMatchJob *)v15 setJobType:v5];
    [(DOMMatchJob *)v15 setKickMe:CFMessagePortCreateRemote(kCFAllocatorDefault, v8)];
    [(DOMMatchJob *)v15 setName:v8];
    if ([(DOMMatchJob *)v15 kickMe])
    {
      [(DOMAccessoryArbitrator *)self addMatchingThings:v11 matchJob:v15];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10000A914();
    }
  }
LABEL_23:
}

- (void)scanPlistsAtPath:(id)a3 execBlock:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = +[NSFileManager defaultManager];
  id v8 = [v7 enumeratorAtPath:v5];

  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [v5 stringByAppendingPathComponent:*(void *)(*((void *)&v15 + 1) + 8 * (void)v12)];
        CFStringRef v14 = +[NSDictionary dictionaryWithContentsOfFile:v13];
        if (v14)
        {
          v6[2](v6, v14);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_10000A9F4(buf, (uint64_t)v13, &v20);
          }
        }

        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v10);
  }
}

- (id)jobType:(id)a3 jobType:(int *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 objectForKey:@"LaunchBuddyIOServiceMatching"];
  if (v6)
  {
    id v7 = (void *)v6;
    int v8 = 2;
  }
  else
  {
    uint64_t v9 = [v5 objectForKey:@"LaunchBuddyNotificationLaunching"];
    if (v9)
    {
      id v7 = (void *)v9;
      int v8 = 1;
    }
    else
    {
      id v7 = [v5 objectForKey:@"LaunchBuddyIOKitLaunching"];
      if (!v7) {
        goto LABEL_8;
      }
      int v8 = 0;
    }
  }
  *a4 = v8;
LABEL_8:

  return v7;
}

- (void)loadLaunchdJobsAtPath:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005E08;
  v3[3] = &unk_1000106C0;
  v3[4] = self;
  [(DOMAccessoryArbitrator *)self scanPlistsAtPath:a3 execBlock:v3];
}

- (void)probePersonalitiesForService:(unsigned int)a3 ofDevice:(id)a4 inGroup:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(DOMAccessoryArbitrator *)self personalities];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000609C;
  v13[3] = &unk_100010788;
  unsigned int v16 = a3;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 enumerateObjectsUsingBlock:v13];
}

- (void)matchDevice:(id)a3
{
  id v4 = a3;
  group = dispatch_group_create();
  io_iterator_t iterator = 0;
  id v38 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = sub_100006918;
  v58 = sub_100006928;
  id v59 = 0;
  v40 = v4;
  if (IORegistryEntryCreateIterator((io_registry_entry_t)objc_msgSend(v4, "io_service"), "IOService", 1u, &iterator))
  {
    id v34 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v35 = __error();
      v36 = strerror(*v35);
      sub_10000AA40((uint64_t)v36, buf);
    }

    uint64_t v19 = 0;
  }
  else
  {
    v37 = self;
    do
    {
      IOIteratorReset(iterator);
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v5 = v38;
      id v6 = [v5 countByEnumeratingWithState:&v50 objects:v74 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v51;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v51 != v7) {
              objc_enumerationMutation(v5);
            }
            IOObjectRelease((io_object_t)objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * i), "unsignedIntValue", v37));
          }
          id v6 = [v5 countByEnumeratingWithState:&v50 objects:v74 count:16];
        }
        while (v6);
      }

      [v5 removeAllObjects];
      [(id)v55[5] removeAllObjects];
      while (1)
      {
        uint64_t v9 = IOIteratorNext(iterator);
        if (!v9) {
          break;
        }
        id v10 = +[NSNumber numberWithUnsignedInt:v9];
        [v5 addObject:v10];

        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v46 = sub_100006930;
        v47 = &unk_1000107B0;
        v48 = &v54;
        int v49 = v9;
        id v11 = v45;
        uint64_t v12 = sub_100008F08();
        if (v12)
        {
          if (*(int *)(v12 + 44) >= 5) {
            v46((uint64_t)v11);
          }
        }
      }
    }
    while (!IOIteratorIsValid(iterator));
    IOObjectRelease(iterator);
    uint64_t v13 = v37;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v14 = v5;
    id v15 = [v14 countByEnumeratingWithState:&v41 objects:v73 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v42;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v14);
          }
          id v18 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * (void)j), "unsignedIntValue", v37);
          IOServiceWaitQuiet((io_service_t)v18, 0);
          [(DOMAccessoryArbitrator *)v13 probePersonalitiesForService:v18 ofDevice:v40 inGroup:group];
          IOObjectRelease((io_object_t)v18);
        }
        id v15 = [v14 countByEnumeratingWithState:&v41 objects:v73 count:16];
      }
      while (v15);
    }

    -[DOMAccessoryArbitrator probePersonalitiesForService:ofDevice:inGroup:](v37, "probePersonalitiesForService:ofDevice:inGroup:", objc_msgSend(v40, "io_service"), v40, group);
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v19 = [v40 winningDomPersonality];
    id v20 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v21 = [v40 name];
      if (v19)
      {
        uint64_t v22 = [v19 personalityName];
      }
      else
      {
        uint64_t v22 = @"nobody";
      }
      uint64_t v23 = objc_msgSend(v40, "winningScore", v37);
      int64_t v24 = [(DOMAccessoryArbitrator *)v37 iOSDeviceThreshold];
      uint64_t v25 = [v40 properties];
      sub_100008FF4(v25);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = sub_100008FF4((void *)v55[5]);
      *(_DWORD *)buf = 138413570;
      v62 = v21;
      __int16 v63 = 2112;
      v64 = v22;
      __int16 v65 = 2112;
      v66 = v23;
      __int16 v67 = 2048;
      int64_t v68 = v24;
      __int16 v69 = 2112;
      id v70 = v26;
      __int16 v71 = 2112;
      v72 = v27;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device: %@, winner: %@, probeScore: %@, iOSDeviceThreshold: %lld, properties: %@ children: %@", buf, 0x3Eu);

      if (v19) {
    }
      }

    uint64_t v28 = v37;
    if (!v19
      || [v19 testAgainstDeviceThreshold]
      && ([v40 winningScore],
          v29 = objc_claimAutoreleasedReturnValue(),
          id v30 = [v29 longLongValue],
          BOOL v31 = (uint64_t)v30 < [(DOMAccessoryArbitrator *)v37 iOSDeviceThreshold],
          v29,
          uint64_t v28 = v37,
          v31)
      || objc_msgSend(v19, "require9Pin", v37) && !MGGetBoolAnswer())
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ignoring 'Cannot Use Device' dialog...", buf, 2u);
      }
    }
    else
    {
      [(DOMAccessoryArbitrator *)v28 unregisterOffendingDomDevice:v40];
      id v32 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [v19 personalityName];
        *(_DWORD *)buf = 138412290;
        v62 = v33;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "starting winner: %@", buf, 0xCu);
      }
      [v19 startWithDomDevice:v40];
    }
  }
  _Block_object_dispose(&v54, 8);
}

- (void)deviceArrived:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  IOServiceWaitQuiet(a3, 0);
  id v5 = [[DOMDevice alloc] initWithIOService:v3 notificationPort:[(DOMAccessoryArbitrator *)self ioNotificationPort]];
  int v6 = MGGetBoolAnswer();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    uint64_t v16 = "-[DOMAccessoryArbitrator deviceArrived:]";
    __int16 v17 = 1024;
    int v18 = v6;
    __int16 v19 = 1024;
    unsigned int v20 = [(DOMDevice *)v5 isThunderboltDevice];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s hostSupportsThunderbolt:%d deviceThunderbolt:%d", (uint8_t *)&v15, 0x18u);
  }
  if (![(DOMDevice *)v5 isThunderboltDevice] && [(DOMDevice *)v5 powerHog])
  {
    uint64_t v7 = @"%@: This accessory requires too much power.";
    goto LABEL_29;
  }
  if ([(DOMDevice *)v5 isThunderboltDevice])
  {
    id v8 = sub_100008CE0(@"Cannot Use Thunderbolt Accessory");
    [(DOMDevice *)v5 setDialogTitleKey:v8];

    if (!v6)
    {
      id v10 = (void *)MGCopyAnswer();
      if ([v10 isEqualToString:@"iPad"])
      {
        id v11 = @"Thunderbolt accessories are not supported on this iPad.";
      }
      else if ([v10 isEqualToString:@"iPhone"])
      {
        id v11 = @"Thunderbolt accessories are not supported on this iPhone.";
      }
      else if ([v10 isEqualToString:@"iPod"])
      {
        id v11 = @"Thunderbolt accessories are not supported on this iPod.";
      }
      else
      {
        id v11 = @"Thunderbolt accessories are not supported on this device.";
      }
      id v14 = sub_100008CE0(v11);
      [(DOMDevice *)v5 setDialogBodyKey:v14];

      goto LABEL_34;
    }
    if ([(DOMDevice *)v5 powerHog])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v9 = [(DOMDevice *)v5 powerHog];
        int v15 = 67109120;
        LODWORD(v16) = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "hostSupportsThunderbolt, powerHog:%d", (uint8_t *)&v15, 8u);
      }
      uint64_t v7 = @"This accessory requires too much power.";
    }
    else if ([(DOMDevice *)v5 tbtAccessoryWithIncompatibleCable])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v12 = [(DOMDevice *)v5 tbtAccessoryWithIncompatibleCable];
        int v15 = 67109120;
        LODWORD(v16) = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "hostSupportsThunderbolt, Incompatible cable:%d", (uint8_t *)&v15, 8u);
      }
      uint64_t v7 = @"Connect accessory using a Thunderbolt capable cable.";
    }
    else
    {
      if (![(DOMDevice *)v5 tbtAccessoryWithIncompatiblePort])
      {
LABEL_35:
        [(DOMAccessoryArbitrator *)self registerOffendingDomDevice:v5];
        goto LABEL_36;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v13 = [(DOMDevice *)v5 tbtAccessoryWithIncompatibleCable];
        int v15 = 67109120;
        LODWORD(v16) = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "hostSupportsThunderbolt, Incompatible Port:%d", (uint8_t *)&v15, 8u);
      }
      uint64_t v7 = @"Connect accessory to a Thunderbolt port.";
    }
LABEL_29:
    id v10 = sub_100008CE0(v7);
    [(DOMDevice *)v5 setDialogBodyKey:v10];
LABEL_34:

    goto LABEL_35;
  }
  if ([(DOMDevice *)v5 isBillboardDevice])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "billboard device, but not a Thunderbolt device, don't do anything", (uint8_t *)&v15, 2u);
    }
  }
  else if ([(DOMDevice *)v5 shouldMatchDevice])
  {
    [(DOMAccessoryArbitrator *)self matchDevice:v5];
  }
LABEL_36:
}

- (void)overcurrentCondition:(unsigned int)a3
{
  if (!self->_ioOvercurrentNotificationPort)
  {
    IOServiceWaitQuiet(a3, 0);
    id v5 = IONotificationPortCreate(kIOMainPortDefault);
    self->_ioOvercurrentNotificationPort = v5;
    if (v5)
    {
      IONotificationPortSetDispatchQueue(v5, (dispatch_queue_t)&_dispatch_main_q);
      CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"OvercurrentCount", kCFAllocatorDefault, 0);
      if ([CFProperty unsignedIntValue])
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136315138;
          id v8 = "-[DOMAccessoryArbitrator overcurrentCondition:]";
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: OCP active. Putting up dialog", (uint8_t *)&v7, 0xCu);
        }
        if (!self->_io_overcurrentNotification
          && IOServiceAddInterestNotification(self->_ioOvercurrentNotificationPort, a3, "IOGeneralInterest", (IOServiceInterestCallback)sub_100007070, self, &self->_io_overcurrentNotification)&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10000AB94();
        }
        [(DOMAccessoryArbitrator *)self displayOverCurrentDialog];
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10000A7E4();
    }
  }
}

+ (BOOL)isInF5Mode
{
  if (qword_100015000 != -1) {
    dispatch_once(&qword_100015000, &stru_1000107D0);
  }
  return byte_100015008;
}

- (NSMutableArray)personalities
{
  return self->_personalities;
}

- (void)setPersonalities:(id)a3
{
}

- (IONotificationPort)ioNotificationPort
{
  return self->_ioNotificationPort;
}

- (void)setIoNotificationPort:(IONotificationPort *)a3
{
  self->_ioNotificationPort = a3;
}

- (IONotificationPort)ioOvercurrentNotificationPort
{
  return self->_ioOvercurrentNotificationPort;
}

- (void)setIoOvercurrentNotificationPort:(IONotificationPort *)a3
{
  self->_ioOvercurrentNotificationPort = a3;
}

- (unsigned)io_overcurrentNotification
{
  return self->_io_overcurrentNotification;
}

- (void)setIo_overcurrentNotification:(unsigned int)a3
{
  self->_io_object_t io_overcurrentNotification = a3;
}

- (int64_t)iOSDeviceThreshold
{
  return self->_iOSDeviceThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalities, 0);
  objc_storeStrong((id *)&self->mainQ, 0);

  objc_storeStrong((id *)&self->badDevices, 0);
}

@end