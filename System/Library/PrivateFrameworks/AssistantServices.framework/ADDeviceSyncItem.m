@interface ADDeviceSyncItem
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncItem)init;
- (ADDeviceSyncItem)initWithBuilder:(id)a3;
- (ADDeviceSyncItem)initWithCoder:(id)a3;
- (ADDeviceSyncItem)initWithUUID:(id)a3 properties:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)properties;
- (NSUUID)UUID;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"ADDeviceSyncItem::UUID"];
  [v5 encodeObject:self->_properties forKey:@"ADDeviceSyncItem::properties"];
}

- (ADDeviceSyncItem)initWithCoder:(id)a3
{
  id v3 = a3;
  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncItem::UUID"];
  uint64_t v17 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v4, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v14 = [v3 decodeObjectOfClasses:v13 forKey:@"ADDeviceSyncItem::properties"];

  v15 = [(ADDeviceSyncItem *)self initWithUUID:v18 properties:v14];
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ADDeviceSyncItem *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(ADDeviceSyncItem *)v5 UUID];
      UUID = self->_UUID;
      if (UUID == v6 || [(NSUUID *)UUID isEqual:v6])
      {
        uint64_t v8 = [(ADDeviceSyncItem *)v5 properties];
        properties = self->_properties;
        BOOL v10 = properties == v8 || [(NSDictionary *)properties isEqual:v8];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSUUID *)self->_UUID hash];
  return (unint64_t)[(NSDictionary *)self->_properties hash] ^ v3;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADDeviceSyncItem;
  uint64_t v5 = [(ADDeviceSyncItem *)&v8 description];
  id v6 = [v4 initWithFormat:@"%@ {UUID = %@, properties = %@}", v5, self->_UUID, self->_properties];

  return v6;
}

- (id)description
{
  return [(ADDeviceSyncItem *)self _descriptionWithIndent:0];
}

- (ADDeviceSyncItem)initWithUUID:(id)a3 properties:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100308988;
  v10[3] = &unk_10050BCA8;
  id v11 = a3;
  id v12 = a4;
  id v6 = v12;
  id v7 = v11;
  objc_super v8 = [(ADDeviceSyncItem *)self initWithBuilder:v10];

  return v8;
}

- (ADDeviceSyncItem)init
{
  return [(ADDeviceSyncItem *)self initWithBuilder:0];
}

- (ADDeviceSyncItem)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceSyncItemMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)ADDeviceSyncItem;
  uint64_t v5 = [(ADDeviceSyncItem *)&v15 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_ADDeviceSyncItemMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADDeviceSyncItemMutation *)v7 isDirty])
    {
      objc_super v8 = [(_ADDeviceSyncItemMutation *)v7 getUUID];
      uint64_t v9 = (NSUUID *)[v8 copy];
      UUID = v6->_UUID;
      v6->_UUID = v9;

      id v11 = [(_ADDeviceSyncItemMutation *)v7 getProperties];
      id v12 = (NSDictionary *)[v11 copy];
      properties = v6->_properties;
      v6->_properties = v12;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceSyncItemMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_ADDeviceSyncItemMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADDeviceSyncItemMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADDeviceSyncItem);
      id v7 = [(_ADDeviceSyncItemMutation *)v5 getUUID];
      objc_super v8 = (NSUUID *)[v7 copy];
      UUID = v6->_UUID;
      v6->_UUID = v8;

      BOOL v10 = [(_ADDeviceSyncItemMutation *)v5 getProperties];
      id v11 = (NSDictionary *)[v10 copy];
      properties = v6->_properties;
      v6->_properties = v11;
    }
    else
    {
      id v6 = (ADDeviceSyncItem *)[(ADDeviceSyncItem *)self copy];
    }
  }
  else
  {
    id v6 = (ADDeviceSyncItem *)[(ADDeviceSyncItem *)self copy];
  }

  return v6;
}

@end