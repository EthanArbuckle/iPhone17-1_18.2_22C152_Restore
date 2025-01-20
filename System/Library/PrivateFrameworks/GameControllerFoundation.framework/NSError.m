@interface NSError
+ (NSError)gc_modelError:(uint64_t)a3 userInfo:;
+ (id)gc_ConfigurationError:(void *)a3 userInfo:;
+ (id)gc_deviceDBError:(void *)a3 userInfo:;
- (id)gc_dbFailingPath;
@end

@implementation NSError

+ (id)gc_deviceDBError:(void *)a3 userInfo:
{
  id v4 = a3;
  self;
  v5 = +[NSError errorWithDomain:@"GCDeviceDBError" code:a2 userInfo:v4];

  return v5;
}

- (id)gc_dbFailingPath
{
  if (a1)
  {
    v1 = [a1 userInfo];
    v2 = objc_msgSend(v1, "gc_objectForKey:ofClass:error:", @"GCDeviceDBErrorFailingPath", objc_opt_class(), 0);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (id)gc_ConfigurationError:(void *)a3 userInfo:
{
  id v4 = a3;
  self;
  v5 = +[NSError errorWithDomain:@"GCConfigurationError" code:a2 userInfo:v4];

  return v5;
}

+ (NSError)gc_modelError:(uint64_t)a3 userInfo:
{
  self;

  return +[NSError errorWithDomain:@"GCModelErrorDomain" code:a2 userInfo:a3];
}

@end