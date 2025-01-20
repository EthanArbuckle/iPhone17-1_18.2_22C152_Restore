@interface OSAGPUEventReport
- (OSAGPUEventReport)initWithDictionary:(id)a3;
- (id)appleCareDetails;
- (id)problemType;
- (id)reportNamePrefix;
- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4;
@end

@implementation OSAGPUEventReport

- (OSAGPUEventReport)initWithDictionary:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)OSAGPUEventReport;
  v6 = [(OSAGPUEventReport *)&v20 init];
  if (v6)
  {
    *(CFAbsoluteTime *)&v6->OSAReport_opaque[OBJC_IVAR___OSAReport__capture_time] = CFAbsoluteTimeGetCurrent();
    objc_storeStrong((id *)&v6->_event, a3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      NSUInteger v7 = [(NSDictionary *)v6->_event count];
      *(_DWORD *)buf = 134217984;
      NSUInteger v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "GPURestartReport: event with %lu keys", buf, 0xCu);
    }
    id v8 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.osanalytics"];
    v9 = +[OSASystemConfiguration sharedInstance];
    if ([v9 appleInternal])
    {
      unsigned int v10 = [v8 BOOLForKey:@"includeTailspinWithGPUEvents"];

      if (v10)
      {
        if (qword_100042F78 != -1) {
          dispatch_once(&qword_100042F78, &stru_100034DF8);
        }
        v11 = [(OSAGPUEventReport *)v6 reportNamePrefix];
        v12 = OSADateFormat();
        v13 = +[NSString stringWithFormat:@"%@-%@.tailspin", v11, v12];

        uint64_t v14 = [@"/var/root/Library/Logs/tailspin" stringByAppendingPathComponent:v13];
        tailspinPath = v6->_tailspinPath;
        v6->_tailspinPath = (NSString *)v14;

        v16 = qword_100042F70;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000022DC;
        block[3] = &unk_100034E20;
        v19 = v6;
        dispatch_async(v16, block);

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100023884();
    }
    goto LABEL_12;
  }
LABEL_13:

  return v6;
}

- (id)problemType
{
  return @"284";
}

- (id)reportNamePrefix
{
  v2 = [(NSDictionary *)self->_event objectForKeyedSubscript:@"process_name"];
  CFStringRef v3 = @"unknown";
  if (v2) {
    CFStringRef v3 = v2;
  }
  v4 = +[NSString stringWithFormat:@"gpuEvent-%@", v3];

  return v4;
}

- (id)appleCareDetails
{
  return 0;
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  v9 = (void (**)(id, void *))a4;
  if (self->_tailspinPath)
  {
    id v5 = (NSDictionary *)[(NSDictionary *)self->_event mutableCopy];
    [(NSDictionary *)v5 setObject:self->_tailspinPath forKeyedSubscript:@"tailspin_pathname"];
    event = self->_event;
    self->_event = v5;
  }
  NSUInteger v7 = [(OSAGPUEventReport *)self problemType];
  id v8 = +[OSALog commonFieldsForBody:v7];
  v9[2](v9, v8);

  v9[2](v9, self->_event);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tailspinPath, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end