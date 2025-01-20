@interface SRSensorsCache
+ (void)initialize;
+ (void)setDefaultCache:(id)a3;
- (SRSensorsCache)init;
- (SRSensorsCache)initWithDirectories:(id)a3;
- (void)dealloc;
@end

@implementation SRSensorsCache

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_11180 = (uint64_t)os_log_create("com.apple.SensorKit", "SensorsCache");
  }
}

+ (void)setDefaultCache:(id)a3
{
  if ((id)qword_11188 != a3)
  {

    qword_11188 = (uint64_t)a3;
  }
}

- (SRSensorsCache)init
{
  Class v3 = NSClassFromString(@"SRSensorReader");
  if (!v3
    || (v4 = [+[NSBundle bundleForClass:v3] bundleURL]) == 0)
  {
    v5 = [+[NSFileManager defaultManager] URLForDirectory:5 inDomain:8 appropriateForURL:0 create:0 error:&v13];
    if (!v5)
    {
      v6 = qword_11180;
      if (os_log_type_enabled((os_log_t)qword_11180, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v13;
        _os_log_fault_impl(&dword_0, v6, OS_LOG_TYPE_FAULT, "Failed to locate the /System/Library directory because %{public}@", buf, 0xCu);
      }
      v5 = +[NSURL fileURLWithPath:@"/System/Library"];
    }
    v4 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", +[NSString pathWithComponents:&off_CC28], 1, v5);
  }
  v7 = +[NSURL fileURLWithPath:@"SensorDescriptions" isDirectory:1 relativeToURL:v4];
  v8 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", @"SensorKit", 1, +[NSURL fileURLWithPath:@"/var/mobile/Library" isDirectory:1]);
  if (v8)
  {
    v9 = +[NSURL fileURLWithPath:@"SensorDescriptions" isDirectory:1 relativeToURL:v8];
    v15[0] = v7;
    v15[1] = v9;
    v10 = (NSURL **)v15;
    uint64_t v11 = 2;
  }
  else
  {
    v14 = v7;
    v10 = &v14;
    uint64_t v11 = 1;
  }
  return [(SRSensorsCache *)self initWithDirectories:+[NSArray arrayWithObjects:v10 count:v11]];
}

- (SRSensorsCache)initWithDirectories:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRSensorsCache;
  v4 = [(SRSensorsCache *)&v6 init];
  if (v4)
  {
    v4->_sensorsCache = (NSCache *)objc_alloc_init((Class)NSCache);
    v4->_sensorDescriptionsDirs = (NSArray *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_sensorDescriptionsDirs = 0;
  self->_sensorsCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRSensorsCache;
  [(SRSensorsCache *)&v3 dealloc];
}

@end