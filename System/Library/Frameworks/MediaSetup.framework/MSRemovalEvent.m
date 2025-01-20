@interface MSRemovalEvent
- (MSRemovalEvent)initWithServiceId:(id)a3;
- (NSString)serviceId;
- (void)setServiceId:(id)a3;
@end

@implementation MSRemovalEvent

- (MSRemovalEvent)initWithServiceId:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSRemovalEvent;
  v5 = [(MSRemovalEvent *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MSRemovalEvent *)v5 setServiceId:v4];
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