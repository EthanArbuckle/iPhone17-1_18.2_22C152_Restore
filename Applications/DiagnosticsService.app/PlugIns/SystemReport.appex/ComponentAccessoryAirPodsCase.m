@interface ComponentAccessoryAirPodsCase
- (BOOL)isPresent;
- (ComponentAccessoryAirPodsCase)init;
- (DSEADevice)device;
- (void)populateAttributes:(id)a3;
- (void)setDevice:(id)a3;
@end

@implementation ComponentAccessoryAirPodsCase

- (ComponentAccessoryAirPodsCase)init
{
  v6.receiver = self;
  v6.super_class = (Class)ComponentAccessoryAirPodsCase;
  v2 = [(ComponentAccessoryAirPodsCase *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[DSEADevice deviceWithModelNumber:@"A1602"];
    device = v2->_device;
    v2->_device = (DSEADevice *)v3;
  }
  return v2;
}

- (BOOL)isPresent
{
  v2 = [(ComponentAccessoryAirPodsCase *)self device];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  id v6 = [(ComponentAccessoryAirPodsCase *)self device];
  v5 = [v6 information];
  [v4 addEntriesFromDictionary:v5];
}

- (DSEADevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end