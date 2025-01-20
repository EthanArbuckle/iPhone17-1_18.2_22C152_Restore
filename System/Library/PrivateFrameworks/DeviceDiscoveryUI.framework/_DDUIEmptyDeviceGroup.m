@interface _DDUIEmptyDeviceGroup
- (NSString)accountAltDSID;
- (NSString)accountIdentifier;
- (NSString)identifier;
- (NSString)name;
- (_DDUIEmptyDeviceGroup)initWithName:(id)a3;
- (unsigned)preferredDeviceType;
@end

@implementation _DDUIEmptyDeviceGroup

- (_DDUIEmptyDeviceGroup)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DDUIEmptyDeviceGroup;
  v5 = [(_DDUIEmptyDeviceGroup *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (NSString)identifier
{
  return (NSString *)@"ddui@empty.device.group.identifier";
}

- (NSString)accountIdentifier
{
  return 0;
}

- (NSString)accountAltDSID
{
  return 0;
}

- (unsigned)preferredDeviceType
{
  return 0;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end