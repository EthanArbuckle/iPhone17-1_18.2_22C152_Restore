@interface SKGEventsProfiler
+ (id)sharedInstance;
+ (void)initialize;
- (BOOL)enabled;
- (BOOL)profileCodeWithType:(id)a3 kind:(int)a4 block:(id)a5;
- (SKGEventsProfiler)initWithEnabled:(BOOL)a3;
- (unint64_t)convertMachTimeToMilliseconds:(unint64_t)a3;
- (void)endProfilingWithType:(id)a3 outcome:(id)a4;
- (void)logResultWithType:(id)a3 outcome:(id)a4 elapsedTime:(unint64_t)a5 kind:(int)a6;
- (void)setEnabled:(BOOL)a3;
- (void)setupTimebaseInfo;
- (void)startProfilingWithType:(id)a3 kind:(int)a4;
@end

@implementation SKGEventsProfiler

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007AD84;
  block[3] = &unk_1000D9FB0;
  block[4] = a1;
  if (qword_1000F91B0 != -1) {
    dispatch_once(&qword_1000F91B0, block);
  }
  v2 = (void *)qword_1000F91A8;

  return v2;
}

- (void)setupTimebaseInfo
{
}

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    uint64_t v4 = +[NSMutableDictionary dictionary];
    v5 = (void *)qword_1000F91C0;
    qword_1000F91C0 = v4;
  }
}

- (SKGEventsProfiler)initWithEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKGEventsProfiler;
  v5 = [(SKGEventsProfiler *)&v7 init];
  if (v5 == self) {
    [(SKGEventsProfiler *)self setEnabled:v3];
  }
  return v5;
}

- (BOOL)profileCodeWithType:(id)a3 kind:(int)a4 block:(id)a5
{
  id v8 = a3;
  v9 = (uint64_t (**)(id, void *))a5;
  if ([(SKGEventsProfiler *)self enabled])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10007B024;
    v12[3] = &unk_1000DC130;
    uint64_t v14 = mach_absolute_time();
    v12[4] = self;
    id v13 = v8;
    int v15 = a4;
    char v10 = v9[2](v9, v12);
  }
  else
  {
    char v10 = ((uint64_t (**)(id, Block_layout *))v9)[2](v9, &stru_1000DC108);
  }

  return v10;
}

- (void)startProfilingWithType:(id)a3 kind:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if ([(SKGEventsProfiler *)self enabled])
  {
    uint64_t v7 = mach_absolute_time();
    id v8 = self;
    objc_sync_enter(v8);
    v9 = (void *)qword_1000F91C0;
    char v10 = +[NSNumber numberWithUnsignedLongLong:v7];
    v13[0] = @"type";
    v13[1] = @"kind";
    v14[0] = v6;
    v11 = +[NSNumber numberWithUnsignedInt:v4];
    v14[1] = v11;
    v12 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    [v9 setObject:v10 forKey:v12];

    objc_sync_exit(v8);
  }
}

- (void)endProfilingWithType:(id)a3 outcome:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if ([(SKGEventsProfiler *)self enabled])
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    id v8 = [(id)qword_1000F91C0 objectForKey:v14];
    v9 = [v8 objectForKeyedSubscript:@"type"];
    id v10 = [v9 unsignedLongLongValue];

    v11 = [(id)qword_1000F91C0 objectForKey:v14];
    v12 = [v11 objectForKeyedSubscript:@"kind"];
    id v13 = [v12 unsignedIntValue];

    [(id)qword_1000F91C0 removeObjectForKey:v14];
    objc_sync_exit(v7);

    if (v10) {
      [(SKGEventsProfiler *)v7 logResultWithType:v14 outcome:v6 elapsedTime:[(SKGEventsProfiler *)v7 convertMachTimeToMilliseconds:mach_absolute_time() - (void)v10] kind:v13];
    }
    else {
      NSLog(@"No session found for type: %@", v14);
    }
  }
}

- (unint64_t)convertMachTimeToMilliseconds:(unint64_t)a3
{
  return (unint64_t)((double)(dword_1000F91B8 * a3 / *(unsigned int *)algn_1000F91BC) / 1000000.0);
}

- (void)logResultWithType:(id)a3 outcome:(id)a4 elapsedTime:(unint64_t)a5 kind:(int)a6
{
  id v9 = a4;
  id v10 = a3;
  id v11 = +[SKGActivityJournal sharedJournal];
  [v11 addProfilingEventWithType:v10 outcome:v9 duration:a5 kind:a6];
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end