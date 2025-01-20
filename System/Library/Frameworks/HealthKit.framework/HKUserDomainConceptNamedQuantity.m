@interface HKUserDomainConceptNamedQuantity
+ (BOOL)supportsSecureCoding;
+ (id)nullPropertyWithType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HKQuantity)quantity;
- (HKUserDomainConceptNamedQuantity)init;
- (HKUserDomainConceptNamedQuantity)initWithCoder:(id)a3;
- (HKUserDomainConceptNamedQuantity)initWithName:(id)a3 quantity:(id)a4 type:(int64_t)a5;
- (HKUserDomainConceptNamedQuantity)initWithName:(id)a3 value:(double)a4 unitString:(id)a5 type:(int64_t)a6 version:(int64_t)a7 timestamp:(double)a8 deleted:(BOOL)a9;
- (HKUserDomainConceptNamedQuantity)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6;
- (NSString)name;
- (NSString)unitString;
- (double)value;
- (id)valueDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)quantity;
@end

@implementation HKUserDomainConceptNamedQuantity

- (HKUserDomainConceptNamedQuantity)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKUserDomainConceptNamedQuantity)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6
{
  v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  v9 = NSStringFromSelector(a2);
  [v7 raise:v8, @"The -%@ method is not available on %@", v9, objc_opt_class() format];

  return 0;
}

- (HKUserDomainConceptNamedQuantity)initWithName:(id)a3 quantity:(id)a4 type:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  [v8 _value];
  double v11 = v10;
  v12 = [v8 _unit];

  v13 = [v12 unitString];
  v14 = [(HKUserDomainConceptNamedQuantity *)self initWithName:v9 value:v13 unitString:a5 type:1 version:0 timestamp:v11 deleted:CFAbsoluteTimeGetCurrent()];

  return v14;
}

- (HKUserDomainConceptNamedQuantity)initWithName:(id)a3 value:(double)a4 unitString:(id)a5 type:(int64_t)a6 version:(int64_t)a7 timestamp:(double)a8 deleted:(BOOL)a9
{
  BOOL v9 = a9;
  id v17 = a3;
  id v18 = a5;
  v19 = v18;
  if (!v18 || ![v18 length])
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HKUserDomainConceptNamedQuantity.m", 56, @"Invalid parameter not satisfying: %@", @"unitString && unitString.length > 0" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)HKUserDomainConceptNamedQuantity;
  v20 = [(HKUserDomainConceptProperty *)&v27 initWithType:a6 version:a7 timestamp:v9 deleted:a8];
  if (v20)
  {
    uint64_t v21 = [v17 copy];
    name = v20->_name;
    v20->_name = (NSString *)v21;

    v20->_value = a4;
    uint64_t v23 = [v19 copy];
    unitString = v20->_unitString;
    v20->_unitString = (NSString *)v23;

    v20->_lock._os_unfair_lock_opaque = 0;
  }

  return v20;
}

+ (id)nullPropertyWithType:(int64_t)a3
{
  v5 = +[HKUnit _nullUnit];
  id v6 = objc_alloc((Class)a1);
  v7 = [v5 unitString];
  id v8 = (void *)[v6 initWithName:0 value:v7 unitString:a3 type:1 version:1 timestamp:0.0 deleted:CFAbsoluteTimeGetCurrent()];

  return v8;
}

- (HKQuantity)quantity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_quantity = self->_lock_quantity;
  if (!lock_quantity)
  {
    v5 = +[HKUnit unitFromString:self->_unitString];
    if (v5)
    {
      id v6 = +[HKQuantity quantityWithUnit:v5 doubleValue:self->_value];
      v7 = self->_lock_quantity;
      self->_lock_quantity = v6;
    }
    lock_quantity = self->_lock_quantity;
  }
  id v8 = lock_quantity;
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)HKUserDomainConceptNamedQuantity;
  unint64_t v3 = [(HKUserDomainConceptProperty *)&v7 hash];
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  unint64_t value = (unint64_t)self->_value;
  return v4 ^ [(NSString *)self->_unitString hash] ^ value;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HKUserDomainConceptNamedQuantity *)a3;
  if (self == v5)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23.receiver = self;
      v23.super_class = (Class)HKUserDomainConceptNamedQuantity;
      if ([(HKUserDomainConceptProperty *)&v23 isEqual:v5])
      {
        id v6 = v5;
        uint64_t v7 = 56;
        name = self->_name;
        BOOL v9 = [(HKUserDomainConceptNamedQuantity *)v6 name];
        if (name != v9)
        {
          uint64_t v10 = [(HKUserDomainConceptNamedQuantity *)v6 name];
          if (!v10)
          {
            char v12 = 0;
            goto LABEL_20;
          }
          unint64_t v3 = (void *)v10;
          double v11 = self->_name;
          uint64_t v7 = [(HKUserDomainConceptNamedQuantity *)v6 name];
          if (![(NSString *)v11 isEqual:v7])
          {
            char v12 = 0;
LABEL_19:

            goto LABEL_20;
          }
        }
        double value = self->_value;
        [(HKUserDomainConceptNamedQuantity *)v6 value];
        if (value == v14)
        {
          unitString = self->_unitString;
          uint64_t v16 = [(HKUserDomainConceptNamedQuantity *)v6 unitString];
          if (unitString == (NSString *)v16)
          {

            char v12 = 1;
            goto LABEL_18;
          }
          id v17 = (void *)v16;
          uint64_t v18 = [(HKUserDomainConceptNamedQuantity *)v6 unitString];
          if (v18)
          {
            v19 = (void *)v18;
            v20 = self->_unitString;
            uint64_t v21 = [(HKUserDomainConceptNamedQuantity *)v6 unitString];
            char v12 = [(NSString *)v20 isEqual:v21];

            goto LABEL_18;
          }
        }
        char v12 = 0;
LABEL_18:
        if (name != v9) {
          goto LABEL_19;
        }
LABEL_20:

        goto LABEL_21;
      }
    }
    char v12 = 0;
  }
LABEL_21:

  return v12;
}

- (id)valueDescription
{
  return (id)[NSString stringWithFormat:@"'(%@, %f, %@)'", self->_name, *(void *)&self->_value, self->_unitString];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKUserDomainConceptNamedQuantity;
  id v4 = a3;
  [(HKUserDomainConceptProperty *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, @"name", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"value" forKey:self->_value];
  [v4 encodeObject:self->_unitString forKey:@"unit"];
}

- (HKUserDomainConceptNamedQuantity)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKUserDomainConceptNamedQuantity;
  objc_super v5 = [(HKUserDomainConceptProperty *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    [v4 decodeDoubleForKey:@"value"];
    v5->_double value = v8;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unit"];
    unitString = v5->_unitString;
    v5->_unitString = (NSString *)v9;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (double)value
{
  return self->_value;
}

- (NSString)unitString
{
  return self->_unitString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_lock_quantity, 0);
}

- (void)quantity
{
  uint64_t v4 = *a2;
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = v4;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "<%@>: Tried to instantiate an HKUnit with an unknown unit string: %@", buf, 0x16u);
}

@end