@interface HKConceptAttribute
+ (BOOL)supportsSecureCoding;
- (BOOL)BOOLValue;
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (HKConceptAttribute)init;
- (HKConceptAttribute)initWithCoder:(id)a3;
- (HKConceptAttribute)initWithType:(int64_t)a3 BOOLValue:(BOOL)a4;
- (HKConceptAttribute)initWithType:(int64_t)a3 numberValue:(id)a4;
- (HKConceptAttribute)initWithType:(int64_t)a3 stringValue:(id)a4;
- (HKConceptAttribute)initWithType:(int64_t)a3 value:(id)a4 version:(int64_t)a5 deleted:(BOOL)a6;
- (NSNumber)numberValue;
- (NSString)stringValue;
- (id)description;
- (int64_t)longLongValue;
- (int64_t)type;
- (int64_t)version;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKConceptAttribute

- (HKConceptAttribute)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKConceptAttribute)initWithType:(int64_t)a3 value:(id)a4 version:(int64_t)a5 deleted:(BOOL)a6
{
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKConceptAttribute;
  v11 = [(HKConceptAttribute *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    uint64_t v13 = [v10 copy];
    stringValue = v12->_stringValue;
    v12->_stringValue = (NSString *)v13;

    v12->_version = a5;
    v12->_deleted = a6;
  }

  return v12;
}

- (HKConceptAttribute)initWithType:(int64_t)a3 stringValue:(id)a4
{
  return [(HKConceptAttribute *)self initWithType:a3 value:a4 version:0 deleted:0];
}

- (HKConceptAttribute)initWithType:(int64_t)a3 numberValue:(id)a4
{
  v6 = [a4 stringValue];
  v7 = [(HKConceptAttribute *)self initWithType:a3 stringValue:v6];

  return v7;
}

- (HKConceptAttribute)initWithType:(int64_t)a3 BOOLValue:(BOOL)a4
{
  uint64_t v4 = HKConceptAttributeValueTrue;
  if (!a4) {
    uint64_t v4 = HKConceptAttributeValueFalse;
  }
  return [(HKConceptAttribute *)self initWithType:a3 stringValue:*v4];
}

- (NSNumber)numberValue
{
  v2 = [(HKConceptAttribute *)self stringValue];
  if (v2)
  {
    if (numberValue_onceToken != -1) {
      dispatch_once(&numberValue_onceToken, &__block_literal_global_25);
    }
    v3 = [(id)numberValue_numberFormatter numberFromString:v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSNumber *)v3;
}

uint64_t __33__HKConceptAttribute_numberValue__block_invoke()
{
  numberValue_numberFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28EE0]);

  return MEMORY[0x1F41817F8]();
}

- (BOOL)BOOLValue
{
  v2 = [(HKConceptAttribute *)self stringValue];
  char v3 = [v2 isEqualToString:@"true"];

  return v3;
}

- (int64_t)longLongValue
{
  v2 = [(HKConceptAttribute *)self numberValue];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p (%lld, '%@')>", objc_opt_class(), self, self->_type, self->_stringValue];
}

- (unint64_t)hash
{
  int64_t type = self->_type;
  return [(NSString *)self->_stringValue hash] ^ type;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKConceptAttribute *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self->_type != v5->_type) {
        goto LABEL_9;
      }
      stringValue = self->_stringValue;
      v7 = v5->_stringValue;
      if (stringValue == v7)
      {
        char v8 = 1;
        goto LABEL_11;
      }
      if (v7) {
        char v8 = -[NSString isEqual:](stringValue, "isEqual:");
      }
      else {
LABEL_9:
      }
        char v8 = 0;
LABEL_11:

      goto LABEL_12;
    }
    char v8 = 0;
  }
LABEL_12:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKConceptAttribute)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKConceptAttribute;
  v5 = [(HKConceptAttribute *)&v9 init];
  if (v5)
  {
    v5->_int64_t type = [v4 decodeIntegerForKey:@"Type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Value"];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

    v5->_version = [v4 decodeInt64ForKey:@"Version"];
    v5->_deleted = [v4 decodeBoolForKey:@"Deleted"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"Type"];
  [v5 encodeObject:self->_stringValue forKey:@"Value"];
  [v5 encodeInt64:self->_version forKey:@"Version"];
  [v5 encodeBool:self->_deleted forKey:@"Deleted"];
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
}

@end