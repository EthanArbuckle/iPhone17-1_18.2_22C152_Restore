@interface _ANEPerformanceStatsIOSurface
+ (id)new;
+ (id)objectWithIOSurface:(id)a3 statType:(int64_t)a4;
- (_ANEIOSurfaceObject)stats;
- (_ANEPerformanceStatsIOSurface)init;
- (_ANEPerformanceStatsIOSurface)initWithIOSurface:(id)a3 statType:(int64_t)a4;
- (id)description;
- (int64_t)statType;
@end

@implementation _ANEPerformanceStatsIOSurface

+ (id)objectWithIOSurface:(id)a3 statType:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithIOSurface:v6 statType:a4];

  return v7;
}

+ (id)new
{
  return 0;
}

- (_ANEPerformanceStatsIOSurface)init
{
  return 0;
}

- (_ANEPerformanceStatsIOSurface)initWithIOSurface:(id)a3 statType:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_ANEPerformanceStatsIOSurface;
  v8 = [(_ANEPerformanceStatsIOSurface *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_stats, a3);
    v9->_statType = a4;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(_ANEPerformanceStatsIOSurface *)self stats];
  objc_msgSend(v3, "stringWithFormat:", @"%@: {stats=%@ ; statType=%lu }",
    v5,
    v6,
  id v7 = [(_ANEPerformanceStatsIOSurface *)self statType]);

  return v7;
}

- (int64_t)statType
{
  return self->_statType;
}

- (_ANEIOSurfaceObject)stats
{
  return self->_stats;
}

- (void).cxx_destruct
{
}

@end