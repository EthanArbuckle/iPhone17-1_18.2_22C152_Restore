@interface _DKObjectType
+ (BOOL)supportsSecureCoding;
+ (Class)associatedObjectClass;
+ (_DKObjectType)objectTypeWithName:(id)a3;
+ (_DKObjectType)objectTypeWithTypeCode:(int64_t)a3;
+ (id)objectTypeFromClass:(Class)a3;
+ (int64_t)typeCodeFromName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (Class)objectClass;
- (_DKObjectType)initWithCoder:(id)a3;
- (_DKObjectType)initWithTypeCode:(int64_t)a3 objectClass:(Class)a4;
- (id)description;
- (int64_t)typeCode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _DKObjectType

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t typeCode = self->_typeCode;
  id v5 = a3;
  [v5 encodeInteger:typeCode forKey:@"typeCode"];
  NSStringFromClass(self->_objectClass);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"objectClass"];
}

+ (id)objectTypeFromClass:(Class)a3
{
  v4 = NSStringFromClass(a3);
  id v5 = [a1 objectTypeWithName:v4];

  return v5;
}

+ (_DKObjectType)objectTypeWithTypeCode:(int64_t)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithTypeCode:objectClass:", a3, objc_msgSend(a1, "associatedObjectClass"));
  return (_DKObjectType *)v3;
}

- (_DKObjectType)initWithTypeCode:(int64_t)a3 objectClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_DKObjectType;
  result = [(_DKObjectType *)&v7 init];
  if (result)
  {
    result->_int64_t typeCode = a3;
    result->_objectClass = a4;
  }
  return result;
}

+ (_DKObjectType)objectTypeWithName:(id)a3
{
  uint64_t v4 = [a1 typeCodeFromName:a3];
  return (_DKObjectType *)[a1 objectTypeWithTypeCode:v4];
}

+ (int64_t)typeCodeFromName:(id)a3
{
  return [a3 hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_typeCode == v4[1] && self->_objectClass == (Class)v4[2];

  return v5;
}

- (Class)objectClass
{
  return self->_objectClass;
}

- (int64_t)typeCode
{
  return self->_typeCode;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = NSStringFromClass(self->_objectClass);
  BOOL v5 = [v3 stringWithFormat:@"%@(%ld)", v4, self->_typeCode];

  return v5;
}

- (_DKObjectType)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_int64_t typeCode = [v4 decodeIntegerForKey:@"typeCode"];
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectClass"];

  self->_objectClass = NSClassFromString(v5);
  return self;
}

+ (Class)associatedObjectClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)hash
{
  return self->_typeCode;
}

@end