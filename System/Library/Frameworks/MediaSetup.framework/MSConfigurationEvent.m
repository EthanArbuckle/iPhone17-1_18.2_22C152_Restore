@interface MSConfigurationEvent
- (MSConfigurationEvent)initWithServiceId:(id)a3;
- (NSString)serviceId;
- (void)setServiceId:(id)a3;
@end

@implementation MSConfigurationEvent

- (MSConfigurationEvent)initWithServiceId:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSConfigurationEvent;
  v5 = [(MSConfigurationEvent *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MSConfigurationEvent *)v5 setServiceId:v4];
  }

  return v6;
}

- (NSString)serviceId
{
  return self->_serviceId;
}

- (void)setServiceId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end