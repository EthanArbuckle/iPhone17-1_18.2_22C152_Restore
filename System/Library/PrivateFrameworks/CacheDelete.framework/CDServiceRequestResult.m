@interface CDServiceRequestResult
- (NSString)serviceName;
- (int)urgency;
- (void)setServiceName:(id)a3;
- (void)setUrgency:(int)a3;
@end

@implementation CDServiceRequestResult

- (void)setUrgency:(int)a3
{
  self->_urgency = a3;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (int)urgency
{
  return self->_urgency;
}

- (void).cxx_destruct
{
}

@end