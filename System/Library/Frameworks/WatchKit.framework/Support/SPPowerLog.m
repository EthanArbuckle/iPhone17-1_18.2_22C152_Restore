@interface SPPowerLog
+ (id)sharedInstance;
- (NSMutableDictionary)eventsByBundleID;
- (OS_dispatch_queue)logQueue;
- (OS_dispatch_source)logUpdateTimer;
- (SPPowerLog)init;
- (id)newEventFromEvent:(id)a3 usingLogEvent:(id)a4;
- (void)cancelLogUpdateTimer;
- (void)logEvent:(id)a3 withName:(id)a4;
- (void)setEventsByBundleID:(id)a3;
- (void)setLogQueue:(id)a3;
- (void)setLogUpdateTimer:(id)a3;
- (void)startLogUpdateTimer;
- (void)updatePowerLogs;
@end

@implementation SPPowerLog

+ (id)sharedInstance
{
  if (qword_1000524C0 != -1) {
    dispatch_once(&qword_1000524C0, &stru_100044778);
  }
  v2 = (void *)qword_1000524C8;

  return v2;
}

- (SPPowerLog)init
{
  v8.receiver = self;
  v8.super_class = (Class)SPPowerLog;
  v2 = [(SPPowerLog *)&v8 init];
  uint64_t v3 = +[NSMutableDictionary dictionaryWithCapacity:0];
  eventsByBundleID = v2->_eventsByBundleID;
  v2->_eventsByBundleID = (NSMutableDictionary *)v3;

  dispatch_queue_t v5 = dispatch_queue_create("com.apple.watchkit.powerlog.queue", 0);
  logQueue = v2->_logQueue;
  v2->_logQueue = (OS_dispatch_queue *)v5;

  return v2;
}

- (void)cancelLogUpdateTimer
{
  logUpdateTimer = self->_logUpdateTimer;
  if (logUpdateTimer)
  {
    dispatch_source_cancel((dispatch_source_t)logUpdateTimer);
    v4 = self->_logUpdateTimer;
    self->_logUpdateTimer = 0;
  }
}

- (void)startLogUpdateTimer
{
  uint64_t v3 = [(SPPowerLog *)self logQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003C34;
  block[3] = &unk_1000447A0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)logEvent:(id)a3 withName:(id)a4
{
  id v5 = a3;
  v6 = [(SPPowerLog *)self logQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003E3C;
  v8[3] = &unk_1000447C8;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

- (id)newEventFromEvent:(id)a3 usingLogEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 mutableCopy];
  if (v7)
  {
    id v8 = v7;
    id v9 = [v5 objectForKeyedSubscript:@"count"];
    v10 = (char *)[v9 unsignedIntegerValue] + 1;

    v11 = [v6 objectForKeyedSubscript:@"length"];
    v12 = (char *)[v11 unsignedIntegerValue];

    v13 = [v5 objectForKeyedSubscript:@"length"];
    id v14 = [v13 unsignedIntegerValue];

    v15 = +[NSNumber numberWithUnsignedInteger:&v12[(void)v14]];
    [v8 setObject:v15 forKeyedSubscript:@"length"];

    v16 = +[NSNumber numberWithUnsignedInteger:v10];
    [v8 setObject:v16 forKeyedSubscript:@"count"];
  }
  else
  {
    id v8 = [v6 mutableCopy];
    [v8 setObject:&off_10004AC60 forKeyedSubscript:@"count"];
  }

  return v8;
}

- (void)updatePowerLogs
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_eventsByBundleID;
  id v2 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v15 = *(void *)v22;
    do
    {
      v4 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        id v5 = [(NSMutableDictionary *)self->_eventsByBundleID objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * (void)v4)];
        if (PLShouldLogRegisteredEvent())
        {
          id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v7 = v5;
          id v8 = [v7 countByEnumeratingWithState:&v17 objects:v27 count:16];
          if (v8)
          {
            id v9 = v8;
            uint64_t v10 = *(void *)v18;
            do
            {
              v11 = 0;
              do
              {
                if (*(void *)v18 != v10) {
                  objc_enumerationMutation(v7);
                }
                v12 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * (void)v11)];
                [v6 addObject:v12];

                v11 = (char *)v11 + 1;
              }
              while (v9 != v11);
              id v9 = [v7 countByEnumeratingWithState:&v17 objects:v27 count:16];
            }
            while (v9);
          }

          CFStringRef v25 = @"1";
          v26 = v6;
          v13 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          PLLogRegisteredEvent();
        }
        v4 = (char *)v4 + 1;
      }
      while (v4 != v3);
      id v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v3);
  }

  [(NSMutableDictionary *)self->_eventsByBundleID removeAllObjects];
}

- (NSMutableDictionary)eventsByBundleID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEventsByBundleID:(id)a3
{
}

- (OS_dispatch_source)logUpdateTimer
{
  return self->_logUpdateTimer;
}

- (void)setLogUpdateTimer:(id)a3
{
}

- (OS_dispatch_queue)logQueue
{
  return self->_logQueue;
}

- (void)setLogQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logQueue, 0);
  objc_storeStrong((id *)&self->_logUpdateTimer, 0);

  objc_storeStrong((id *)&self->_eventsByBundleID, 0);
}

@end