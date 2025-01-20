@interface LNSearchCriteriaValueType
+ (BOOL)supportsSecureCoding;
+ (LNSearchCriteriaValueType)stringValueType;
+ (id)objectClassesForCoding;
+ (id)supportedClassesByTypeIdentifier;
- (BOOL)isEqual:(id)a3;
- (Class)objectClass;
- (LNSearchCriteriaValueType)initWithCoder:(id)a3;
- (LNSearchCriteriaValueType)initWithTypeIdentifier:(int64_t)a3;
- (NSString)typeIdentifierAsString;
- (id)description;
- (int64_t)typeIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNSearchCriteriaValueType

- (int64_t)typeIdentifier
{
  return self->_typeIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNSearchCriteriaValueType *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int64_t v7 = [(LNSearchCriteriaValueType *)self typeIdentifier];
      BOOL v8 = v7 == [(LNSearchCriteriaValueType *)v6 typeIdentifier];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

+ (LNSearchCriteriaValueType)stringValueType
{
  if (stringValueType_onceToken != -1) {
    dispatch_once(&stringValueType_onceToken, &__block_literal_global);
  }
  v2 = (void *)stringValueType_value;
  return (LNSearchCriteriaValueType *)v2;
}

+ (id)objectClassesForCoding
{
  v2 = [a1 supportedClassesByTypeIdentifier];
  v3 = [v2 allValues];

  return v3;
}

+ (id)supportedClassesByTypeIdentifier
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = &unk_1EEDCE3E0;
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNSearchCriteriaValueType typeIdentifier](self, "typeIdentifier"), @"typeIdentifier");
}

- (LNSearchCriteriaValueType)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"typeIdentifier"];
  return [(LNSearchCriteriaValueType *)self initWithTypeIdentifier:v4];
}

- (id)description
{
  return @"String";
}

- (Class)objectClass
{
  v3 = [(id)objc_opt_class() supportedClassesByTypeIdentifier];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[LNSearchCriteriaValueType typeIdentifier](self, "typeIdentifier"));
  v5 = [v3 objectForKeyedSubscript:v4];

  return (Class)v5;
}

- (NSString)typeIdentifierAsString
{
  return (NSString *)@"String";
}

- (LNSearchCriteriaValueType)initWithTypeIdentifier:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LNSearchCriteriaValueType;
  uint64_t v4 = [(LNValueType *)&v8 _init];
  v5 = v4;
  if (v4)
  {
    v4->_typeIdentifier = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __44__LNSearchCriteriaValueType_stringValueType__block_invoke()
{
  stringValueType_value = [[LNSearchCriteriaValueType alloc] initWithTypeIdentifier:0];
  return MEMORY[0x1F41817F8]();
}

@end