@interface _DKQuantity
+ (BOOL)supportsSecureCoding;
+ (id)entityName;
+ (id)fromPBCodable:(id)a3;
+ (id)objectFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6;
+ (id)quantityWithDouble:(double)a3 type:(id)a4;
- (BOOL)copyToManagedObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_DKQuantity)initWithCoder:(id)a3;
- (_DKQuantity)initWithDouble:(double)a3 type:(id)a4;
- (_DKQuantityType)quantityType;
- (double)doubleValue;
- (id)objectType;
- (id)primaryValue;
- (id)stringValue;
- (id)toPBCodable;
- (int64_t)compareValue:(id)a3;
- (int64_t)typeCode;
- (void)encodeWithCoder:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setQuantityType:(id)a3;
@end

@implementation _DKQuantity

- (int64_t)compareValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 quantityType];
    v7 = [(_DKQuantity *)self quantityType];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      [v5 doubleValue];
      double v10 = v9;
      [(_DKQuantity *)self doubleValue];
      if (v10 == v11)
      {
        int64_t v12 = 0;
      }
      else
      {
        [v5 doubleValue];
        double v14 = v13;
        [(_DKQuantity *)self doubleValue];
        if (v14 <= v15) {
          int64_t v12 = 1;
        }
        else {
          int64_t v12 = -1;
        }
      }
    }
    else
    {
      int64_t v12 = -1;
    }
  }
  else
  {
    int64_t v12 = -1;
  }

  return v12;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (_DKQuantityType)quantityType
{
  return (_DKQuantityType *)objc_getProperty(self, a2, 48, 1);
}

- (id)toPBCodable
{
  v3 = objc_alloc_init(_DKPRValue);
  id v4 = objc_alloc_init(_DKPRValueType);
  -[_DKPRValue setType:]((uint64_t)v3, v4);
  id v5 = -[_DKPRValue type]((uint64_t)v3);
  -[_DKPRValueType setType:]((uint64_t)v5, 1);

  v6 = [(_DKQuantity *)self quantityType];
  uint64_t v7 = [v6 typeCode];
  int v8 = -[_DKPRValue type]((uint64_t)v3);
  -[_DKPRValueType setTypeCode:]((uint64_t)v8, v7);

  [(_DKQuantity *)self doubleValue];
  -[_DKPRValue setDoubleValue:]((uint64_t)v3, v9);

  return v3;
}

- (_DKQuantity)initWithDouble:(double)a3 type:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_DKQuantity;
  int v8 = [(_DKObject *)&v11 init];
  double v9 = v8;
  if (v8)
  {
    v8->_doubleValue = a3;
    objc_storeStrong((id *)&v8->_quantityType, a4);
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_DKQuantity;
  id v4 = a3;
  [(_DKObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"doubleValue", self->_doubleValue, v5.receiver, v5.super_class);
  [v4 encodeObject:self->_quantityType forKey:@"quantityType"];
}

- (void).cxx_destruct
{
}

+ (id)objectFromManagedObject:(id)a3 readMetadata:(BOOL)a4 excludedMetadataKeys:(id)a5 cache:(id)a6
{
  id v7 = a3;
  id v8 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    double v10 = +[_DKObjectType objectTypeWithTypeCode:](_DKQuantityType, "objectTypeWithTypeCode:", [v9 quantityType]);
    [v9 doubleValue];
    objc_super v11 = +[_DKQuantity quantityWithDouble:type:](_DKQuantity, "quantityWithDouble:type:", v10);
    if ([v11 copyBaseObjectInfoFromManagedObject:v9 cache:v8]) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)quantityWithDouble:(double)a3 type:(id)a4
{
  id v5 = a4;
  v6 = [[_DKQuantity alloc] initWithDouble:v5 type:a3];

  return v6;
}

+ (id)fromPBCodable:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    double v5 = -[_DKPRValue doubleValue]((uint64_t)v4);
    v6 = -[_DKPRValue type]((uint64_t)v4);

    id v7 = +[_DKObjectType objectTypeWithTypeCode:](_DKQuantityType, "objectTypeWithTypeCode:", -[_DKPRValueType typeCode]((uint64_t)v6));
    id v8 = +[_DKQuantity quantityWithDouble:v7 type:v5];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (_DKQuantity)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DKQuantity;
  double v5 = [(_DKObject *)&v11 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"doubleValue"];
    v5->_doubleValue = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quantityType"];
    quantityType = v5->_quantityType;
    v5->_quantityType = (_DKQuantityType *)v7;

    id v9 = v5;
  }

  return v5;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double doubleValue = self->_doubleValue;
  quantityType = self->_quantityType;
  v11.receiver = self;
  v11.super_class = (Class)_DKQuantity;
  id v8 = [(_DKObject *)&v11 description];
  objc_msgSend(v3, "stringWithFormat:", @"%@: { doubleValue=%f; quantityType=%@; %@ }",
    v5,
    *(void *)&doubleValue,
    quantityType,
  id v9 = v8);

  return (NSString *)v9;
}

- (id)objectType
{
  return self->_quantityType;
}

- (id)primaryValue
{
  return (id)[NSNumber numberWithDouble:self->_doubleValue];
}

- (id)stringValue
{
  v2 = [NSNumber numberWithDouble:self->_doubleValue];
  id v3 = [v2 stringValue];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DKQuantity *)a3;
  double v5 = v4;
  if (self == v4)
  {
    char v14 = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (v16.receiver = self,
             v16.super_class = (Class)_DKQuantity,
             [(_DKObject *)&v16 isEqual:v5]))
  {
    double v6 = v5;
    [(_DKQuantity *)self doubleValue];
    double v8 = v7;
    [(_DKQuantity *)v6 doubleValue];
    if (v8 == v9)
    {
      double v10 = [(_DKQuantity *)self quantityType];
      objc_super v11 = [(_DKQuantity *)v6 quantityType];
      if (v10 == v11)
      {
        char v14 = 1;
      }
      else
      {
        id v12 = [(_DKQuantity *)self quantityType];
        double v13 = [(_DKQuantity *)v6 quantityType];
        char v14 = [v12 isEqual:v13];
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (void)setDoubleValue:(double)a3
{
  self->_double doubleValue = a3;
}

- (void)setQuantityType:(id)a3
{
}

+ (id)entityName
{
  return @"Quantity";
}

- (int64_t)typeCode
{
  v2 = [(_DKQuantity *)self quantityType];
  int64_t v3 = [v2 typeCode];

  return v3;
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)_DKQuantity,
        [(_DKObject *)&v9 copyToManagedObject:v4]))
  {
    id v5 = v4;
    [(_DKQuantity *)self doubleValue];
    objc_msgSend(v5, "setDoubleValue:");
    double v6 = [(_DKQuantity *)self quantityType];
    objc_msgSend(v5, "setQuantityType:", objc_msgSend(v6, "typeCode"));

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end