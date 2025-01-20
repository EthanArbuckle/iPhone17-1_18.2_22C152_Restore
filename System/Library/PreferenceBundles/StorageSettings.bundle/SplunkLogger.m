@interface SplunkLogger
- (BOOL)allowInvalidCert;
- (NSMutableArray)events;
- (NSURL)splunkUploadURL;
- (OS_dispatch_queue)queue;
- (SplunkLogger)init;
- (void)flush;
- (void)logEventNamed:(id)a3 value:(id)a4 unique:(BOOL)a5;
- (void)postEvents;
- (void)setAllowInvalidCert:(BOOL)a3;
- (void)setEvents:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SplunkLogger

- (SplunkLogger)init
{
  v9.receiver = self;
  v9.super_class = (Class)SplunkLogger;
  v2 = [(SplunkLogger *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    events = v2->_events;
    v2->_events = v3;

    v2->_allowInvalidCert = 0;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("iosStorage.SplunkLogger", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (NSURL)splunkUploadURL
{
  v3 = [(SplunkLogger *)self queue];
  dispatch_assert_queue_V2(v3);

  splunkUploadURL = self->_splunkUploadURL;
  if (!splunkUploadURL)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = sub_1498C;
    v21[4] = sub_1499C;
    id v22 = 0;
    objc_initWeak(&location, self);
    dispatch_queue_t v6 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    id v7 = objc_loadWeakRetained(&location);
    v8 = +[NSURLSession sessionWithConfiguration:v6 delegate:v7 delegateQueue:0];

    id v9 = [objc_alloc((Class)NSURL) initWithString:@"https://init.itunes.apple.com/bag.xml?ix=5"];
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_149A4;
    v16 = &unk_2CFD0;
    v19 = v21;
    v17 = self;
    v10 = v5;
    v18 = v10;
    v11 = [v8 dataTaskWithURL:v9 completionHandler:&v13];
    objc_msgSend(v11, "resume", v13, v14, v15, v16, v17);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

    objc_destroyWeak(&location);
    _Block_object_dispose(v21, 8);

    splunkUploadURL = self->_splunkUploadURL;
  }

  return splunkUploadURL;
}

- (void)postEvents
{
  v3 = [(SplunkLogger *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_14D14;
  block[3] = &unk_2CA90;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)logEventNamed:(id)a3 value:(id)a4 unique:(BOOL)a5
{
  id v7 = a3;
  id v8 = [a4 mutableCopy];
  id v9 = +[NSDate date];
  [v9 timeIntervalSince1970];
  v11 = +[NSNumber numberWithLong:1000 * (uint64_t)v10];

  [v8 setObject:v11 forKeyedSubscript:@"eventTime"];
  [v8 setObject:@"xp_ios_storage_mgmt" forKeyedSubscript:@"topic"];
  [v8 setObject:v7 forKeyedSubscript:@"eventType"];

  v12 = [(SplunkLogger *)self queue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_152BC;
  v14[3] = &unk_2CA28;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  dispatch_async(v12, v14);
}

- (void)flush
{
}

- (NSMutableArray)events
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEvents:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
}

- (BOOL)allowInvalidCert
{
  return self->_allowInvalidCert;
}

- (void)setAllowInvalidCert:(BOOL)a3
{
  self->_allowInvalidCert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_events, 0);

  objc_storeStrong((id *)&self->_splunkUploadURL, 0);
}

@end