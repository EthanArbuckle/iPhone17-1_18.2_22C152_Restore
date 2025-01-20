@interface DOMPersonality
- (BOOL)require9Pin;
- (BOOL)testAgainstDeviceThreshold;
- (DOMPersonality)initWithPersonality:(id)a3 personalityName:(id)a4 serviceName:(id)a5;
- (NSMutableDictionary)personalityDict;
- (NSNumber)staticProbeScore;
- (NSString)notificationName;
- (NSString)personalityName;
- (NSString)xpcName;
- (id)description;
- (id)makeCommandType:(unint64_t)a3 withIORegEntryID:(unint64_t)a4 context:(void *)a5;
- (id)makeXPCConnection;
- (id)probeXPCServiceWithIORegEntryID:(unint64_t)a3;
- (void)probeIORegEntryID:(unint64_t)a3 forDomDevice:(id)a4;
- (void)startWithDomDevice:(id)a3;
@end

@implementation DOMPersonality

- (DOMPersonality)initWithPersonality:(id)a3 personalityName:(id)a4 serviceName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)DOMPersonality;
  v11 = [(DOMPersonality *)&v26 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_personalityName, a4);
    objc_storeStrong((id *)&v12->_xpcName, a5);
    v13 = (NSMutableDictionary *)[v8 mutableCopy];
    personalityDict = v12->_personalityDict;
    v12->_personalityDict = v13;

    uint64_t v15 = [(NSMutableDictionary *)v12->_personalityDict objectForKey:@"IOProbeScore"];
    staticProbeScore = v12->_staticProbeScore;
    v12->_staticProbeScore = (NSNumber *)v15;

    if (v12->_staticProbeScore)
    {
      [(NSMutableDictionary *)v12->_personalityDict removeObjectForKey:@"IOProbeScore"];
    }
    else if (!v12->_xpcName)
    {
      v17 = (NSNumber *)[objc_alloc((Class)NSNumber) initWithLongLong:1];
      v18 = v12->_staticProbeScore;
      v12->_staticProbeScore = v17;
    }
    uint64_t v19 = [(NSMutableDictionary *)v12->_personalityDict objectForKey:@"DarwinNotificationName"];
    notificationName = v12->_notificationName;
    v12->_notificationName = (NSString *)v19;

    if (v12->_notificationName) {
      [(NSMutableDictionary *)v12->_personalityDict removeObjectForKey:@"DarwinNotificationName"];
    }
    v21 = [(NSMutableDictionary *)v12->_personalityDict objectForKeyedSubscript:@"DOMRequiredDeviceClass"];

    if (v21)
    {
      v12->_testAgainstDeviceThreshold = 1;
      [(NSMutableDictionary *)v12->_personalityDict removeObjectForKey:@"DOMRequiredDeviceClass"];
    }
    else
    {
      v12->_testAgainstDeviceThreshold = 0;
    }
    v12->_require9Pin = 0;
    v22 = [(NSMutableDictionary *)v12->_personalityDict objectForKeyedSubscript:@"DOMRequire9Pin"];

    if (v22)
    {
      v23 = [(NSMutableDictionary *)v12->_personalityDict objectForKeyedSubscript:@"DOMRequire9Pin"];
      unsigned int v24 = [v23 BOOLValue];

      if (v24) {
        v12->_require9Pin = 1;
      }
      [(NSMutableDictionary *)v12->_personalityDict removeObjectForKey:@"DOMRequiredDeviceClass"];
    }
  }

  return v12;
}

- (id)description
{
  return +[NSString stringWithFormat:@"personality: %p, xpcName: %@, personalityDict: %@, personalityName: %@, probeScore: %@", self, self->_xpcName, self->_personalityDict, self->_personalityName, self->_staticProbeScore];
}

- (id)makeCommandType:(unint64_t)a3 withIORegEntryID:(unint64_t)a4 context:(void *)a5
{
  id v8 = [(DOMPersonality *)self personalityDict];
  id v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  if (v9)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    v11 = v10;
    if (v10)
    {
      xpc_dictionary_set_uint64(v10, "_LB_TYPE", a3);
      if (a3 == 1)
      {
        xpc_dictionary_set_int64(v11, "_LB_PROBE_SCORE", (int)a5);
      }
      else if (a3 == 2 && a5)
      {
        v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v11, "_LB_CLAIMED", v12);
      }
      xpc_dictionary_set_uint64(v11, "_LB_SERVICE_ID", a4);
      xpc_dictionary_set_value(v11, "_LB_PERSONALITY", v9);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Can't allocate an xpc dictionary", v14, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to serialize personality", buf, 2u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)makeXPCConnection
{
  id v2 = [(DOMPersonality *)self xpcName];
  v3 = (const char *)[v2 UTF8String];

  if (v3)
  {
    v4 = dispatch_get_global_queue(0, 0);
    mach_service = xpc_connection_create_mach_service(v3, v4, 0);

    if (mach_service)
    {
      xpc_connection_set_event_handler(mach_service, &stru_100010630);
      xpc_connection_resume(mach_service);
      goto LABEL_7;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Can't create connection to %s", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10000A6E8();
  }
  mach_service = 0;
LABEL_7:

  return mach_service;
}

- (id)probeXPCServiceWithIORegEntryID:(unint64_t)a3
{
  v4 = [(DOMPersonality *)self makeCommandType:1 withIORegEntryID:a3 context:0];
  if (v4)
  {
    v5 = [(DOMPersonality *)self makeXPCConnection];
    if (v5)
    {
      dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x3032000000;
      v23 = sub_100003B20;
      unsigned int v24 = sub_100003B30;
      id v25 = 0;
      id v7 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(DOMPersonality *)self personalityName];
        id v9 = [(DOMPersonality *)self xpcName];
        *(_DWORD *)buf = 138412546;
        v27 = v8;
        __int16 v28 = 2112;
        v29 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "probing personality: \"%@\" by messaging xpcService: \"%@\"", buf, 0x16u);
      }
      xpc_object_t v10 = dispatch_get_global_queue(0, 0);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100003B38;
      handler[3] = &unk_100010658;
      handler[4] = self;
      uint64_t v19 = &v20;
      v11 = v6;
      v18 = v11;
      xpc_connection_send_message_with_reply(v5, v4, v10, handler);

      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      id v12 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [(DOMPersonality *)self personalityName];
        v14 = (void *)v21[5];
        *(_DWORD *)buf = 138412546;
        v27 = v13;
        __int16 v28 = 2112;
        v29 = v14;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ returning %@", buf, 0x16u);
      }
      id v15 = (id)v21[5];

      _Block_object_dispose(&v20, 8);
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)probeIORegEntryID:(unint64_t)a3 forDomDevice:(id)a4
{
  id v6 = a4;
  id v7 = [(DOMPersonality *)self xpcName];

  if (v7)
  {
    uint64_t v8 = [(DOMPersonality *)self probeXPCServiceWithIORegEntryID:a3];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(DOMPersonality *)self personalityName];
      xpc_object_t v10 = [(DOMPersonality *)self staticProbeScore];
      int v12 = 138412546;
      v13 = v9;
      __int16 v14 = 2112;
      id v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "no XPC service for %@, using static probe score: %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v8 = [(DOMPersonality *)self staticProbeScore];
  }
  v11 = (void *)v8;
  [v6 evaluateScore:v8 fromDomPersonality:self withIORegEntryID:a3];
}

- (void)startWithDomDevice:(id)a3
{
  id v4 = a3;
  v5 = [(DOMPersonality *)self notificationName];

  if (v5)
  {
    id v6 = [(DOMPersonality *)self notificationName];
    notify_post((const char *)[v6 UTF8String]);
  }
  id v7 = [(DOMPersonality *)self xpcName];

  if (v7)
  {
    uint64_t v8 = -[DOMPersonality makeCommandType:withIORegEntryID:context:](self, "makeCommandType:withIORegEntryID:context:", 2, [v4 winningIORegEntryID], 0);
    if (v8)
    {
      id v9 = [(DOMPersonality *)self makeXPCConnection];
      if (v9)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          xpc_object_t v10 = [(DOMPersonality *)self xpcName];
          v11 = [(DOMPersonality *)self personalityName];
          int v13 = 138412546;
          __int16 v14 = v10;
          __int16 v15 = 2112;
          v16 = v11;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "starting: %@/%@", (uint8_t *)&v13, 0x16u);
        }
        xpc_connection_send_message(v9, v8);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [(DOMPersonality *)self personalityName];
    int v13 = 138412290;
    __int16 v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No xpc service for %@", (uint8_t *)&v13, 0xCu);
  }
}

- (NSString)xpcName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)personalityDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)personalityName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)staticProbeScore
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)notificationName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)require9Pin
{
  return self->_require9Pin;
}

- (BOOL)testAgainstDeviceThreshold
{
  return self->_testAgainstDeviceThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_storeStrong((id *)&self->_staticProbeScore, 0);
  objc_storeStrong((id *)&self->_personalityName, 0);
  objc_storeStrong((id *)&self->_personalityDict, 0);

  objc_storeStrong((id *)&self->_xpcName, 0);
}

@end