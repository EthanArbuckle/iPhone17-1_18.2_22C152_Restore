@interface DTSysmonTapConfig
- (BOOL)sampleCPUUsage;
- (DTSysmonTapConfig)init;
- (NSArray)coalitionAttributes;
- (NSArray)processAttributes;
- (NSArray)systemAttributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)pids;
- (id)sessionHandler;
- (unint64_t)sampleInterval;
- (void)addPid:(int)a3;
- (void)setCoalitionAttributes:(id)a3;
- (void)setPids:(id)a3;
- (void)setProcessAttributes:(id)a3;
- (void)setSampleCPUUsage:(BOOL)a3;
- (void)setSampleInterval:(unint64_t)a3;
- (void)setSessionHandler:(id)a3;
- (void)setSystemAttributes:(id)a3;
@end

@implementation DTSysmonTapConfig

- (DTSysmonTapConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)DTSysmonTapConfig;
  return [(DTTapConfig *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DTSysmonTapConfig;
  v4 = [(DTTapConfig *)&v8 copyWithZone:a3];
  v5 = _Block_copy(self->_sessionHandler);
  v6 = (void *)v4[10];
  v4[10] = v5;

  return v4;
}

- (void)setSessionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  id sessionHandler = self->_sessionHandler;
  self->_id sessionHandler = v4;
}

- (unint64_t)sampleInterval
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"sampleInterval"];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (void)setSampleInterval:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"sampleInterval"];
}

- (NSArray)processAttributes
{
  return (NSArray *)[(DTTapConfig *)self _getSerializableObjectForKey:@"procAttrs"];
}

- (void)setProcessAttributes:(id)a3
{
  id v4 = (id)[a3 copy];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"procAttrs"];
}

- (NSArray)systemAttributes
{
  return (NSArray *)[(DTTapConfig *)self _getSerializableObjectForKey:@"sysAttrs"];
}

- (void)setSystemAttributes:(id)a3
{
  id v4 = (id)[a3 copy];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"sysAttrs"];
}

- (NSArray)coalitionAttributes
{
  return (NSArray *)[(DTTapConfig *)self _getSerializableObjectForKey:@"coalAttrs"];
}

- (void)setCoalitionAttributes:(id)a3
{
  id v4 = (id)[a3 copy];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"coalAttrs"];
}

- (BOOL)sampleCPUUsage
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"cpuUsage"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSampleCPUUsage:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"cpuUsage"];
}

- (id)pids
{
  return [(DTTapConfig *)self _getSerializableObjectForKey:@"pids"];
}

- (void)setPids:(id)a3
{
  id v4 = (id)[a3 mutableCopy];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"pids"];
}

- (void)addPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v6 = [(DTTapConfig *)self _getSerializableObjectForKey:@"pids"];
  if (!v6)
  {
    id v6 = (id)objc_opt_new();
    -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:");
  }
  v5 = [NSNumber numberWithInt:v3];
  [v6 addObject:v5];
}

- (id)sessionHandler
{
  return self->_sessionHandler;
}

- (void).cxx_destruct
{
}

@end