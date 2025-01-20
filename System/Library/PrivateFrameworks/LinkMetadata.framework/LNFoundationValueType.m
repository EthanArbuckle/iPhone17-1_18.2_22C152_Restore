@interface LNFoundationValueType
+ (BOOL)supportsSecureCoding;
+ (LNFoundationValueType)recurrenceRuleType;
+ (id)objectClassesForCoding;
+ (id)supportedClassesByTypeIdentifier;
- (BOOL)isEqual:(id)a3;
- (Class)objectClass;
- (LNFoundationValueType)initWithCoder:(id)a3;
- (LNFoundationValueType)initWithTypeIdentifier:(int64_t)a3;
- (NSString)typeIdentifierAsString;
- (int64_t)typeIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNFoundationValueType

+ (id)objectClassesForCoding
{
  v2 = [a1 supportedClassesByTypeIdentifier];
  v3 = [v2 allValues];

  return v3;
}

+ (id)supportedClassesByTypeIdentifier
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = &unk_1EEDCE3F8;
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (int64_t)typeIdentifier
{
  return self->_typeIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNFoundationValueType *)a3;
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
      int64_t v7 = [(LNFoundationValueType *)self typeIdentifier];
      BOOL v8 = v7 == [(LNFoundationValueType *)v6 typeIdentifier];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNFoundationValueType typeIdentifier](self, "typeIdentifier"), @"typeIdentifier");
}

- (LNFoundationValueType)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"typeIdentifier"];
  return [(LNFoundationValueType *)self initWithTypeIdentifier:v4];
}

- (LNFoundationValueType)initWithTypeIdentifier:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LNFoundationValueType;
  result = [(LNValueType *)&v5 _init];
  if (result) {
    result->_typeIdentifier = a3;
  }
  return result;
}

- (Class)objectClass
{
  v3 = [(id)objc_opt_class() supportedClassesByTypeIdentifier];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[LNFoundationValueType typeIdentifier](self, "typeIdentifier"));
  objc_super v5 = [v3 objectForKeyedSubscript:v4];

  return (Class)v5;
}

- (NSString)typeIdentifierAsString
{
  return (NSString *)@"RecurrenceRule";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (LNFoundationValueType)recurrenceRuleType
{
  if (recurrenceRuleType_onceToken[0] != -1) {
    dispatch_once(recurrenceRuleType_onceToken, &__block_literal_global_151);
  }
  v2 = (void *)recurrenceRuleType_value;
  return (LNFoundationValueType *)v2;
}

uint64_t __43__LNFoundationValueType_recurrenceRuleType__block_invoke()
{
  recurrenceRuleType_value = [[LNFoundationValueType alloc] initWithTypeIdentifier:0];
  return MEMORY[0x1F41817F8]();
}

@end