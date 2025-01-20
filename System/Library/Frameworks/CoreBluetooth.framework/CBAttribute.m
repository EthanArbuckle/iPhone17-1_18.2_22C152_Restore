@interface CBAttribute
- (CBAttribute)initWithUUID:(id)a3;
- (CBUUID)UUID;
@end

@implementation CBAttribute

- (CBAttribute)initWithUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CBAttribute;
  v6 = [(CBAttribute *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_UUID, a3);
  }

  return v7;
}

- (CBUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
}

@end