@interface ACCOOBBTPairingAccessory
- (ACCOOBBTPairingAccessory)initWithAccessoryUID:(id)a3;
- (NSString)accessoryUID;
- (id)description;
- (void)setAccessoryUID:(id)a3;
@end

@implementation ACCOOBBTPairingAccessory

- (ACCOOBBTPairingAccessory)initWithAccessoryUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACCOOBBTPairingAccessory;
  v6 = [(ACCOOBBTPairingAccessory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accessoryUID, a3);
  }

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ACCOOBBTPairingAccessory>[%@]", self->_accessoryUID];
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void)setAccessoryUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end