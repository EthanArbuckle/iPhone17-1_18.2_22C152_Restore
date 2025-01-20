@interface ComponentAccessorySmartKeyboard
- (BOOL)isPresent;
- (ComponentAccessorySmartKeyboard)init;
- (DSIOHIDDevice)device;
- (void)populateAttributes:(id)a3;
- (void)setDevice:(id)a3;
@end

@implementation ComponentAccessorySmartKeyboard

- (ComponentAccessorySmartKeyboard)init
{
  v6.receiver = self;
  v6.super_class = (Class)ComponentAccessorySmartKeyboard;
  v2 = [(ComponentAccessorySmartKeyboard *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[DSIOHIDDevice deviceMatchingAccessories:&off_1000B6E80];
    device = v2->_device;
    v2->_device = (DSIOHIDDevice *)v3;
  }
  return v2;
}

- (BOOL)isPresent
{
  v2 = [(ComponentAccessorySmartKeyboard *)self device];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)populateAttributes:(id)a3
{
  id v7 = a3;
  v4 = [(ComponentAccessorySmartKeyboard *)self device];
  v5 = [v4 stringFromHIDReport:17];

  if (v5)
  {
    [v7 setObject:v5 forKeyedSubscript:@"serialNumber"];
  }
  else
  {
    objc_super v6 = +[NSNull null];
    [v7 setObject:v6 forKeyedSubscript:@"serialNumber"];
  }
}

- (DSIOHIDDevice)device
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