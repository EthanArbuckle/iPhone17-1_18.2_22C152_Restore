@interface HKAttributeConceptSelection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKAttributeConceptSelection)init;
- (HKAttributeConceptSelection)initWithAttribute:(int64_t)a3 operatorType:(unint64_t)a4 value:(id)a5;
- (HKAttributeConceptSelection)initWithCoder:(id)a3;
- (NSCopying)value;
- (id)description;
- (int64_t)type;
- (unint64_t)operatorType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKAttributeConceptSelection

- (HKAttributeConceptSelection)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKAttributeConceptSelection)initWithAttribute:(int64_t)a3 operatorType:(unint64_t)a4 value:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKAttributeConceptSelection;
  v9 = [(HKConceptSelection *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    v9->_operatorType = a4;
    uint64_t v11 = [v8 copyWithZone:0];
    value = v10->_value;
    v10->_value = (NSCopying *)v11;
  }
  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t type = self->_type;
  v6 = HKStringFromPredicateOperatorType(self->_operatorType);
  v7 = [v3 stringWithFormat:@"<%@: %lld '%@' %@>", v4, type, v6, self->_value];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKAttributeConceptSelection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"AttributeTypeKey"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"AttributeOperatorTypeKey"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AttributeValueKey"];

  if (v7)
  {
    self = [(HKAttributeConceptSelection *)self initWithAttribute:v5 operatorType:v6 value:v7];
    id v8 = self;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInt64:type forKey:@"AttributeTypeKey"];
  [v5 encodeInteger:self->_operatorType forKey:@"AttributeOperatorTypeKey"];
  [v5 encodeObject:self->_value forKey:@"AttributeValueKey"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKAttributeConceptSelection;
  if ([(HKConceptSelection *)&v18 isEqual:v4])
  {
    id v5 = v4;
    int64_t v6 = [(HKAttributeConceptSelection *)self type];
    if (v6 != [v5 type]) {
      goto LABEL_12;
    }
    unint64_t v7 = [(HKAttributeConceptSelection *)self operatorType];
    if (v7 != [v5 operatorType]) {
      goto LABEL_12;
    }
    id v8 = [(HKAttributeConceptSelection *)self value];
    uint64_t v9 = [v5 value];
    if (v8 == (void *)v9)
    {
    }
    else
    {
      v10 = (void *)v9;
      uint64_t v11 = [v5 value];
      if (!v11)
      {

LABEL_12:
        BOOL v16 = 0;
        goto LABEL_13;
      }
      v12 = (void *)v11;
      v13 = [(HKAttributeConceptSelection *)self value];
      objc_super v14 = [v5 value];
      char v15 = [v13 isEqual:v14];

      if ((v15 & 1) == 0) {
        goto LABEL_12;
      }
    }
    BOOL v16 = 1;
LABEL_13:

    goto LABEL_14;
  }
  BOOL v16 = 0;
LABEL_14:

  return v16;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)operatorType
{
  return self->_operatorType;
}

- (NSCopying)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end