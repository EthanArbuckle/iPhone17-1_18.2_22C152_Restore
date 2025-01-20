@interface GCSElementMapping
+ (BOOL)supportsSecureCoding;
+ (id)archivalClasses;
- (BOOL)isCustomized;
- (GCSElementMapping)initWithCoder:(id)a3;
- (GCSElementMapping)initWithElementKey:(id)a3 mappingKey:(id)a4 remappingOrder:(int)a5;
- (GCSElementMapping)initWithJSONObject:(id)a3;
- (GCSJSONObject)jsonObject;
- (NSString)elementKey;
- (NSString)id;
- (NSString)mappingKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)remappingOrder;
- (void)encodeWithCoder:(id)a3;
- (void)setElementKey:(id)a3;
- (void)setMappingKey:(id)a3;
- (void)setRemappingOrder:(int)a3;
@end

@implementation GCSElementMapping

- (GCSElementMapping)initWithElementKey:(id)a3 mappingKey:(id)a4 remappingOrder:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GCSElementMapping;
  v10 = [(GCSElementMapping *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    elementKey = v10->_elementKey;
    v10->_elementKey = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    mappingKey = v10->_mappingKey;
    v10->_mappingKey = (NSString *)v13;

    v10->_remappingOrder = a5;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(GCSElementMapping *)self elementKey];
  v6 = [(GCSElementMapping *)self mappingKey];
  v7 = objc_msgSend(v4, "initWithElementKey:mappingKey:remappingOrder:", v5, v6, -[GCSElementMapping remappingOrder](self, "remappingOrder"));

  return v7;
}

- (NSString)id
{
  return self->_elementKey;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<GCSElementMapping: elementKey=%@, mappingKey=%@>", self->_elementKey, self->_mappingKey];
}

- (BOOL)isCustomized
{
  return [(NSString *)self->_elementKey isEqual:self->_mappingKey] ^ 1;
}

- (NSString)elementKey
{
  return self->_elementKey;
}

- (void)setElementKey:(id)a3
{
}

- (NSString)mappingKey
{
  return self->_mappingKey;
}

- (void)setMappingKey:(id)a3
{
}

- (int)remappingOrder
{
  return self->_remappingOrder;
}

- (void)setRemappingOrder:(int)a3
{
  self->_remappingOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingKey, 0);
  objc_storeStrong((id *)&self->_elementKey, 0);
}

+ (id)archivalClasses
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return +[NSSet setWithObjects:](&off_26D32CB10, "setWithObjects:", v2, v3, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSElementMapping)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCSElementMapping;
  v5 = [(GCSElementMapping *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_elementKey"];
    elementKey = v5->_elementKey;
    v5->_elementKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mappingKey"];
    mappingKey = v5->_mappingKey;
    v5->_mappingKey = (NSString *)v8;

    v5->_remappingOrder = [v4 decodeIntForKey:@"_remappingOrder"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  elementKey = self->_elementKey;
  id v5 = a3;
  [v5 encodeObject:elementKey forKey:@"_elementKey"];
  [v5 encodeObject:self->_mappingKey forKey:@"_mappingKey"];
  [v5 encodeInt:self->_remappingOrder forKey:@"_remappingOrder"];
}

- (GCSElementMapping)initWithJSONObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v14.receiver = self;
    v14.super_class = (Class)GCSElementMapping;
    uint64_t v6 = [(GCSElementMapping *)&v14 init];
    if (v6)
    {
      uint64_t v7 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"elementKey");
      elementKey = v6->_elementKey;
      v6->_elementKey = (NSString *)v7;

      uint64_t v9 = objc_msgSend(v5, "_gcs_stringForJSONKey:", @"mappingKey");
      mappingKey = v6->_mappingKey;
      v6->_mappingKey = (NSString *)v9;

      objc_super v11 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"remappingOrder");
      v6->_remappingOrder = [v11 intValue];
    }
    self = v6;

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (GCSJSONObject)jsonObject
{
  v6[0] = @"elementKey";
  v6[1] = @"mappingKey";
  mappingKey = self->_mappingKey;
  v7[0] = self->_elementKey;
  v7[1] = mappingKey;
  v6[2] = @"remappingOrder";
  uint64_t v3 = +[NSNumber numberWithInt:self->_remappingOrder];
  v7[2] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return (GCSJSONObject *)v4;
}

@end