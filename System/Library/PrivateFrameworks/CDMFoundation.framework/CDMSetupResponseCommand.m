@interface CDMSetupResponseCommand
- (CDMSetupResponseCommand)initWithServiceState:(int64_t)a3 serviceName:(id)a4;
- (NSString)serviceName;
- (int64_t)serviceState;
@end

@implementation CDMSetupResponseCommand

- (void).cxx_destruct
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (int64_t)serviceState
{
  return self->_serviceState;
}

- (CDMSetupResponseCommand)initWithServiceState:(int64_t)a3 serviceName:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMSetupResponseCommand;
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

@end