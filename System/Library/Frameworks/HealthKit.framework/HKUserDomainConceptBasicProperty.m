@interface HKUserDomainConceptBasicProperty
+ (BOOL)supportsSecureCoding;
+ (id)nullPropertyWithType:(int64_t)a3 version:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (HKUserDomainConceptBasicProperty)init;
- (HKUserDomainConceptBasicProperty)initWithCoder:(id)a3;
- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 BOOLValue:(BOOL)a5;
- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 doubleValue:(double)a5;
- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 integerValue:(int64_t)a5;
- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6;
- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 valueType:(int64_t)a6 value:(id)a7;
- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 value:(id)a5;
- (NSCopying)value;
- (NSData)dataValue;
- (NSDate)dateValue;
- (NSNumber)numberValue;
- (NSString)stringValue;
- (NSUUID)UUIDValue;
- (id)_valueDescription;
- (id)valueDescription;
- (int64_t)valueType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKUserDomainConceptBasicProperty

- (HKUserDomainConceptBasicProperty)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6
{
  v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  v9 = NSStringFromSelector(a2);
  [v7 raise:v8, @"The -%@ method is not available on %@", v9, objc_opt_class() format];

  return 0;
}

- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 valueType:(int64_t)a6 value:(id)a7
{
  id v13 = a7;
  if ((HKIsValidUserDomainConceptPropertyValueType(a6, v13) & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = HKStringFromUserDomainConceptPropertyValueType(a6);
    [v18 handleFailureInMethod:a2, self, @"HKUserDomainConceptBasicProperty.m", 36, @"/'%@/' is not a valid type for class /'%@/'", v19, objc_opt_class() object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)HKUserDomainConceptBasicProperty;
  v14 = [(HKUserDomainConceptProperty *)&v20 initWithType:a3 version:a4 timestamp:a6 == 0 deleted:a5];
  if (v14)
  {
    uint64_t v15 = [v13 copyWithZone:0];
    value = v14->_value;
    v14->_value = (NSCopying *)v15;

    v14->_valueType = a6;
  }

  return v14;
}

- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 value:(id)a5
{
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = 5;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = 6;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = 7;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v9 = 0;
          }
          else {
            uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
      }
    }
  }
  v10 = [(HKUserDomainConceptBasicProperty *)self initWithType:a3 version:a4 timestamp:v9 valueType:v8 value:CFAbsoluteTimeGetCurrent()];

  return v10;
}

- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 integerValue:(int64_t)a5
{
  double Current = CFAbsoluteTimeGetCurrent();
  v10 = [NSNumber numberWithInteger:a5];
  v11 = [(HKUserDomainConceptBasicProperty *)self initWithType:a3 version:a4 timestamp:3 valueType:v10 value:Current];

  return v11;
}

- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 doubleValue:(double)a5
{
  double Current = CFAbsoluteTimeGetCurrent();
  v10 = [NSNumber numberWithDouble:a5];
  v11 = [(HKUserDomainConceptBasicProperty *)self initWithType:a3 version:a4 timestamp:2 valueType:v10 value:Current];

  return v11;
}

- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 BOOLValue:(BOOL)a5
{
  BOOL v5 = a5;
  double Current = CFAbsoluteTimeGetCurrent();
  v10 = [NSNumber numberWithBool:v5];
  v11 = [(HKUserDomainConceptBasicProperty *)self initWithType:a3 version:a4 timestamp:4 valueType:v10 value:Current];

  return v11;
}

+ (id)nullPropertyWithType:(int64_t)a3 version:(int64_t)a4
{
  id v6 = objc_alloc((Class)a1);
  v7 = [MEMORY[0x1E4F1CA98] null];
  id v8 = (void *)[v6 initWithType:a3 version:a4 value:v7];

  return v8;
}

- (id)valueDescription
{
  v3 = NSString;
  uint64_t v4 = HKStringFromUserDomainConceptPropertyValueType(self->_valueType);
  BOOL v5 = [(HKUserDomainConceptBasicProperty *)self _valueDescription];
  id v6 = [v3 stringWithFormat:@"'%@' %@", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)HKUserDomainConceptBasicProperty;
  unint64_t v3 = [(HKUserDomainConceptProperty *)&v5 hash];
  return [(NSCopying *)self->_value hash] ^ v3 ^ self->_valueType;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKUserDomainConceptBasicProperty *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      v13.receiver = self;
      v13.super_class = (Class)HKUserDomainConceptBasicProperty;
      if ([(HKUserDomainConceptProperty *)&v13 isEqual:v5])
      {
        value = self->_value;
        v7 = [(HKUserDomainConceptBasicProperty *)v5 value];
        if (value == v7)
        {
          BOOL v11 = self->_valueType == v5->_valueType;
        }
        else
        {
          id v8 = [(HKUserDomainConceptBasicProperty *)v5 value];
          if (v8)
          {
            uint64_t v9 = self->_value;
            v10 = [(HKUserDomainConceptBasicProperty *)v5 value];
            if ([(NSCopying *)v9 isEqual:v10]) {
              BOOL v11 = self->_valueType == v5->_valueType;
            }
            else {
              BOOL v11 = 0;
            }
          }
          else
          {
            BOOL v11 = 0;
          }
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKUserDomainConceptBasicProperty;
  id v4 = a3;
  [(HKUserDomainConceptProperty *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_value, @"value", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_valueType forKey:@"valueType"];
}

- (HKUserDomainConceptBasicProperty)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKUserDomainConceptBasicProperty;
  objc_super v5 = [(HKUserDomainConceptProperty *)&v16 initWithCoder:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSCopying *)v13;

    v5->_valueType = [v4 decodeIntegerForKey:@"valueType"];
  }

  return v5;
}

- (NSString)stringValue
{
  v2 = [(HKUserDomainConceptBasicProperty *)self value];
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  objc_super v5 = v4;

  return v5;
}

- (NSNumber)numberValue
{
  v2 = [(HKUserDomainConceptBasicProperty *)self value];
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  objc_super v5 = v4;

  return v5;
}

- (NSDate)dateValue
{
  v2 = [(HKUserDomainConceptBasicProperty *)self value];
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  objc_super v5 = v4;

  return v5;
}

- (NSUUID)UUIDValue
{
  v2 = [(HKUserDomainConceptBasicProperty *)self value];
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  objc_super v5 = v4;

  return v5;
}

- (NSData)dataValue
{
  v2 = [(HKUserDomainConceptBasicProperty *)self value];
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  objc_super v5 = v4;

  return v5;
}

- (id)_valueDescription
{
  switch(self->_valueType)
  {
    case 0:
      v2 = [(HKUserDomainConceptBasicProperty *)self value];
      uint64_t v3 = [v2 description];
      goto LABEL_17;
    case 1:
      v2 = [(HKUserDomainConceptBasicProperty *)self stringValue];
      unint64_t v4 = [v2 length];
      if (v4 >= 0x50) {
        unint64_t v5 = 80;
      }
      else {
        unint64_t v5 = v4;
      }
      id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"%lu '", objc_msgSend(v2, "length"));
      uint64_t v7 = [v2 substringToIndex:v5];
      [v6 appendString:v7];

      if (v5 < [v2 length]) {
        [v6 appendString:@"..."];
      }
      [v6 appendString:@"'"];
      goto LABEL_18;
    case 2:
      uint64_t v8 = NSString;
      v2 = [(HKUserDomainConceptBasicProperty *)self numberValue];
      [v2 doubleValue];
      objc_msgSend(v8, "stringWithFormat:", @"%f", v9);
      goto LABEL_13;
    case 3:
      uint64_t v10 = NSString;
      v2 = [(HKUserDomainConceptBasicProperty *)self numberValue];
      objc_msgSend(v10, "stringWithFormat:", @"%lld", objc_msgSend(v2, "longLongValue"));
      goto LABEL_13;
    case 4:
      v2 = [(HKUserDomainConceptBasicProperty *)self numberValue];
      uint64_t v3 = HKStringFromBool([v2 BOOLValue]);
      goto LABEL_17;
    case 5:
      v2 = [(HKUserDomainConceptBasicProperty *)self dateValue];
      uint64_t v3 = HKDiagnosticStringFromDate(v2);
      goto LABEL_17;
    case 6:
      v2 = [(HKUserDomainConceptBasicProperty *)self UUIDValue];
      uint64_t v3 = [v2 UUIDString];
      goto LABEL_17;
    case 7:
      uint64_t v11 = NSString;
      v2 = [(HKUserDomainConceptBasicProperty *)self dataValue];
      objc_msgSend(v11, "stringWithFormat:", @"(%lu bytes)", objc_msgSend(v2, "length"));
      uint64_t v3 = LABEL_13:;
LABEL_17:
      id v6 = (void *)v3;
LABEL_18:

      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

- (NSCopying)value
{
  return self->_value;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (void).cxx_destruct
{
}

@end