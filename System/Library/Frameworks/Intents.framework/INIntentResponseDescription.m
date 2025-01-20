@interface INIntentResponseDescription
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrivate;
- (Class)dataClass;
- (Class)facadeClass;
- (INIntentResponseDescription)initWithName:(id)a3 facadeClass:(Class)a4 dataClass:(Class)a5 type:(id)a6 isPrivate:(BOOL)a7 slotsByName:(id)a8;
- (NSDictionary)slotsByName;
- (NSString)name;
- (NSString)type;
- (unint64_t)hash;
@end

@implementation INIntentResponseDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotsByName, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSDictionary)slotsByName
{
  return self->_slotsByName;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (NSString)type
{
  return self->_type;
}

- (Class)dataClass
{
  return self->_dataClass;
}

- (Class)facadeClass
{
  return self->_facadeClass;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (NSDictionary **)v4;
    name = self->_name;
    BOOL v7 = 0;
    if ((name == (NSString *)v5[2] || -[NSString isEqualToString:](name, "isEqualToString:"))
      && (NSDictionary *)self->_facadeClass == v5[3]
      && (NSDictionary *)self->_dataClass == v5[4])
    {
      type = self->_type;
      if ((type == (NSString *)v5[5] || -[NSString isEqualToString:](type, "isEqualToString:"))
        && self->_isPrivate == *((unsigned __int8 *)v5 + 8))
      {
        slotsByName = self->_slotsByName;
        if (slotsByName == v5[6] || -[NSDictionary isEqualToDictionary:](slotsByName, "isEqualToDictionary:")) {
          BOOL v7 = 1;
        }
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  id v4 = NSStringFromClass(self->_facadeClass);
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = NSStringFromClass(self->_dataClass);
  uint64_t v7 = [v6 hash];
  NSUInteger v8 = v5 ^ v7 ^ [(NSString *)self->_type hash];
  BOOL isPrivate = self->_isPrivate;
  unint64_t v10 = v8 ^ isPrivate ^ [(NSDictionary *)self->_slotsByName hash];

  return v10;
}

- (INIntentResponseDescription)initWithName:(id)a3 facadeClass:(Class)a4 dataClass:(Class)a5 type:(id)a6 isPrivate:(BOOL)a7 slotsByName:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  v25.receiver = self;
  v25.super_class = (Class)INIntentResponseDescription;
  v17 = [(INIntentResponseDescription *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    name = v17->_name;
    v17->_name = (NSString *)v18;

    v17->_facadeClass = a4;
    v17->_dataClass = a5;
    uint64_t v20 = [v15 copy];
    type = v17->_type;
    v17->_type = (NSString *)v20;

    v17->_BOOL isPrivate = a7;
    uint64_t v22 = [v16 copy];
    slotsByName = v17->_slotsByName;
    v17->_slotsByName = (NSDictionary *)v22;
  }
  return v17;
}

@end