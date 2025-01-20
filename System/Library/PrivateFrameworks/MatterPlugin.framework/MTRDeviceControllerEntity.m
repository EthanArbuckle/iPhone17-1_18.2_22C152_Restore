@interface MTRDeviceControllerEntity
- (BOOL)isEqual:(id)a3;
- (MTRDeviceController)controller;
- (MTRDeviceControllerEntity)initWithController:(id)a3 entityIdentifier:(id)a4;
- (NSUUID)entityIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)setController:(id)a3;
- (void)setEntityIdentifier:(id)a3;
@end

@implementation MTRDeviceControllerEntity

- (MTRDeviceControllerEntity)initWithController:(id)a3 entityIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MTRDeviceControllerEntity;
  v8 = [(MTRDeviceControllerEntity *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(MTRDeviceControllerEntity *)v8 setController:v6];
    v10 = (void *)[v7 copy];
    [(MTRDeviceControllerEntity *)v9 setEntityIdentifier:v10];
  }
  return v9;
}

- (unint64_t)hash
{
  v3 = [(MTRDeviceControllerEntity *)self controller];
  uint64_t v4 = [v3 hash];
  v5 = [(MTRDeviceControllerEntity *)self entityIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MTRDeviceControllerEntity *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(MTRDeviceControllerEntity *)self controller];
      id v7 = [v6 uniqueIdentifier];
      v8 = [(MTRDeviceControllerEntity *)v5 controller];
      v9 = [v8 uniqueIdentifier];
      if ([v7 isEqual:v9])
      {
        v10 = [(MTRDeviceControllerEntity *)self entityIdentifier];
        v11 = [(MTRDeviceControllerEntity *)v5 entityIdentifier];
        char v12 = [v10 isEqual:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(MTRDeviceControllerEntity *)self controller];
  id v7 = [(MTRDeviceControllerEntity *)self entityIdentifier];
  v8 = [v3 stringWithFormat:@"<%@: %@, entityIdentifier: %@>", v5, v6, v7];

  return v8;
}

- (MTRDeviceController)controller
{
  return (MTRDeviceController *)objc_getProperty(self, a2, 8, 1);
}

- (void)setController:(id)a3
{
}

- (NSUUID)entityIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEntityIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end