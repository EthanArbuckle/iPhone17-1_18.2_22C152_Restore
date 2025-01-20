@interface CDMWarmupResponseCommand
- (CDMWarmupResponseCommand)initWithServiceState:(int64_t)a3 serviceName:(id)a4;
- (NSString)serviceName;
- (int64_t)serviceState;
@end

@implementation CDMWarmupResponseCommand

- (int64_t)serviceState
{
  return self->_serviceState;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (CDMWarmupResponseCommand)initWithServiceState:(int64_t)a3 serviceName:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMWarmupResponseCommand;
  v7 = [(CDMBaseCommand *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_serviceState = a3;
    uint64_t v9 = [v6 copy];
    serviceName = v8->_serviceName;
    v8->_serviceName = (NSString *)v9;
  }
  return v8;
}

- (void).cxx_destruct
{
}

@end