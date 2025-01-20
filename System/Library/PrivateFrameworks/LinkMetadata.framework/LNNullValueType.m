@interface LNNullValueType
+ (BOOL)supportsSecureCoding;
+ (id)objectClassesForCoding;
- (BOOL)isEqual:(id)a3;
- (Class)objectClass;
- (LNNullValueType)init;
- (id)description;
- (unint64_t)hash;
@end

@implementation LNNullValueType

- (id)description
{
  return @"Null";
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNNullValueType *)a3;
  v5 = v4;
  if (self == v4)
  {
    char isKindOfClass = 1;
  }
  else if (v4)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return 303030;
}

- (Class)objectClass
{
  return (Class)objc_opt_class();
}

- (LNNullValueType)init
{
  v3.receiver = self;
  v3.super_class = (Class)LNNullValueType;
  return (LNNullValueType *)[(LNValueType *)&v3 _init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectClassesForCoding
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 arrayWithObject:v3];
}

@end