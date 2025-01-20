@interface IDEDataProvider_SceneKit
+ (id)sharedDataProvider;
- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5;
- (BOOL)captureShadersToDictionary:(id)a3 forPID:(id)a4;
- (IDEDataProvider_SceneKit)init;
- (id)captureAttributes:(id)a3 forPIDs:(id)a4;
- (id)startSamplingForPIDs:(id)a3;
- (id)stopSamplingForPIDs:(id)a3;
- (id)supportedAttributes;
@end

@implementation IDEDataProvider_SceneKit

+ (id)sharedDataProvider
{
  if (qword_15400 != -1) {
    dispatch_once(&qword_15400, &stru_10648);
  }
  v2 = (void *)qword_153F8;
  return v2;
}

- (IDEDataProvider_SceneKit)init
{
  v8.receiver = self;
  v8.super_class = (Class)IDEDataProvider_SceneKit;
  v2 = [(IDEDataProvider_SceneKit *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    collectionStartedForPidDictionary = v2->_collectionStartedForPidDictionary;
    v2->_collectionStartedForPidDictionary = v3;

    dispatch_queue_t v5 = dispatch_queue_create("Lock to protect multithread access during capturing", 0);
    capture_lock = v2->_capture_lock;
    v2->_capture_lock = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (id)supportedAttributes
{
  if (qword_15410 != -1) {
    dispatch_once(&qword_15410, &stru_10668);
  }
  v2 = (void *)qword_15408;
  return v2;
}

- (id)startSamplingForPIDs:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = +[NSMutableSet set];
  capture_lock = self->_capture_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_976C;
  block[3] = &unk_10470;
  id v13 = v4;
  v14 = self;
  id v7 = v5;
  id v15 = v7;
  id v8 = v4;
  dispatch_sync(capture_lock, block);
  v9 = v15;
  id v10 = v7;

  return v10;
}

- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(NSMutableDictionary *)self->_collectionStartedForPidDictionary objectForKey:v8];
  if ([v9 BOOLValue])
  {
    [v8 intValue];
    id v10 = _SCNGetPerformanceStatisticsForPid();
    BOOL v11 = v10 != 0;
    if (v10)
    {
      [v7 addEntriesFromDictionary:v10];
      v12 = [(IDEDataProvider *)self initialQueryTimeForPidDictionary];
      id v13 = [v12 objectForKeyedSubscript:v8];
      +[NSDate date];
      if (v13) {
        v14 = {;
      }
        [v14 timeIntervalSinceDate:v13];
        double v16 = v15;

        v17 = +[NSNumber numberWithUnsignedInteger:vcvtpd_u64_f64(v16)];
        [v7 setObject:v17 forKeyedSubscript:@"kIDEGaugeSecondsSinceInitialQueryKey"];
      }
      else {
        id v13 = {;
      }
        [v12 setObject:v13 forKeyedSubscript:v8];
        [v7 setObject:&off_11950 forKeyedSubscript:@"kIDEGaugeSecondsSinceInitialQueryKey"];
      }
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)captureShadersToDictionary:(id)a3 forPID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_collectionStartedForPidDictionary objectForKey:v7];
  if ([v8 BOOLValue])
  {
    [v7 intValue];
    v9 = _SCNGetCollectedShadersForPid();
    BOOL v10 = v9 != 0;
    if (v9) {
      [v6 addEntriesFromDictionary:v9];
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)stopSamplingForPIDs:(id)a3
{
  id v4 = a3;
  capture_lock = self->_capture_lock;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_9CA4;
  v9[3] = &unk_10498;
  id v6 = v4;
  id v10 = v6;
  BOOL v11 = self;
  dispatch_sync(capture_lock, v9);
  id v7 = v6;

  return v7;
}

- (id)captureAttributes:(id)a3 forPIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableDictionary dictionary];
  capture_lock = self->_capture_lock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_9F34;
  v16[3] = &unk_104C0;
  id v17 = v7;
  id v18 = v6;
  v19 = self;
  id v10 = v8;
  id v20 = v10;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync(capture_lock, v16);
  id v13 = v20;
  id v14 = v10;

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionStartedForPidDictionary, 0);
  objc_storeStrong((id *)&self->_capture_lock, 0);
}

@end