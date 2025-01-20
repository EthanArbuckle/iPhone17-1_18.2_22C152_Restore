@interface HKMedicationLoggingUnit
+ (BOOL)supportsSecureCoding;
+ (id)loggingUnitByResolvingSingularLoggingUnitString:(id)a3 fallbackPluralLoggingUnitString:(id)a4;
+ (uint64_t)_loggingUnitCodeForSingularString:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (HKMedicationLoggingUnit)init;
- (HKMedicationLoggingUnit)initWithCoder:(id)a3;
- (HKMedicationLoggingUnit)initWithLoggingUnitCode:(unint64_t)a3;
- (NSString)fallbackLoggingUnitPluralString;
- (NSString)fallbackLoggingUnitSingularString;
- (id)copyByOverridingFallbackLoggingUnitSingularString:(id)a3 fallbackLoggingUnitPluralString:(id)a4;
- (unint64_t)hash;
- (unint64_t)loggingUnitCode;
- (void)_initWithMedicationLoggingUnitCode:(void *)a3 fallbackLoggingUnitSingularString:(void *)a4 fallbackLoggingUnitPluralString:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationLoggingUnit

- (HKMedicationLoggingUnit)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (void)_initWithMedicationLoggingUnitCode:(void *)a3 fallbackLoggingUnitSingularString:(void *)a4 fallbackLoggingUnitPluralString:
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (a1)
  {
    if (!a2 && (!v7 || !v8))
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:sel__initWithMedicationLoggingUnitCode_fallbackLoggingUnitSingularString_fallbackLoggingUnitPluralString_, a1, @"HKMedicationLoggingUnit.m", 66, @"Invalid parameter not satisfying: %@", @"fallbackLoggingUnitSingularString != nil && fallbackLoggingUnitPluralString != nil" object file lineNumber description];
    }
    v17.receiver = a1;
    v17.super_class = (Class)HKMedicationLoggingUnit;
    v10 = objc_msgSendSuper2(&v17, sel_init);
    a1 = v10;
    if (v10)
    {
      v10[1] = a2;
      if (!a2)
      {
        uint64_t v11 = [v7 copy];
        v12 = (void *)a1[2];
        a1[2] = v11;

        uint64_t v13 = [v9 copy];
        v14 = (void *)a1[3];
        a1[3] = v13;
      }
    }
  }

  return a1;
}

- (HKMedicationLoggingUnit)initWithLoggingUnitCode:(unint64_t)a3
{
  return (HKMedicationLoggingUnit *)-[HKMedicationLoggingUnit _initWithMedicationLoggingUnitCode:fallbackLoggingUnitSingularString:fallbackLoggingUnitPluralString:](self, a3, 0, 0);
}

+ (id)loggingUnitByResolvingSingularLoggingUnitString:(id)a3 fallbackPluralLoggingUnitString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[HKMedicationLoggingUnit _loggingUnitCodeForSingularString:]((uint64_t)a1, v6);
  v9 = [HKMedicationLoggingUnit alloc];
  if (v8) {
    v10 = [(HKMedicationLoggingUnit *)v9 initWithLoggingUnitCode:v8];
  }
  else {
    v10 = (HKMedicationLoggingUnit *)-[HKMedicationLoggingUnit _initWithMedicationLoggingUnitCode:fallbackLoggingUnitSingularString:fallbackLoggingUnitPluralString:](v9, 0, v6, v7);
  }
  uint64_t v11 = v10;

  return v11;
}

+ (uint64_t)_loggingUnitCodeForSingularString:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [&unk_1EECE6540 objectForKeyedSubscript:v2];

  if (v3) {
    uint64_t v4 = [v3 integerValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)copyByOverridingFallbackLoggingUnitSingularString:(id)a3 fallbackLoggingUnitPluralString:(id)a4
{
  id v6 = self;
  uint64_t loggingUnitCode = v6->_loggingUnitCode;

  return -[HKMedicationLoggingUnit _initWithMedicationLoggingUnitCode:fallbackLoggingUnitSingularString:fallbackLoggingUnitPluralString:](v6, loggingUnitCode, a3, a4);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMedicationLoggingUnit *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(HKMedicationLoggingUnit *)v5 loggingUnitCode];
      if (v6 != [(HKMedicationLoggingUnit *)self loggingUnitCode]) {
        goto LABEL_16;
      }
      id v7 = [(HKMedicationLoggingUnit *)v5 fallbackLoggingUnitSingularString];
      uint64_t v8 = [(HKMedicationLoggingUnit *)self fallbackLoggingUnitSingularString];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        uint64_t v10 = [(HKMedicationLoggingUnit *)self fallbackLoggingUnitSingularString];
        if (!v10) {
          goto LABEL_15;
        }
        uint64_t v11 = (void *)v10;
        v12 = [(HKMedicationLoggingUnit *)v5 fallbackLoggingUnitSingularString];
        uint64_t v13 = [(HKMedicationLoggingUnit *)self fallbackLoggingUnitSingularString];
        int v14 = [v12 isEqualToString:v13];

        if (!v14) {
          goto LABEL_16;
        }
      }
      id v7 = [(HKMedicationLoggingUnit *)v5 fallbackLoggingUnitPluralString];
      uint64_t v16 = [(HKMedicationLoggingUnit *)self fallbackLoggingUnitPluralString];
      if (v7 == (void *)v16)
      {

LABEL_20:
        BOOL v15 = 1;
        goto LABEL_17;
      }
      v9 = (void *)v16;
      uint64_t v17 = [(HKMedicationLoggingUnit *)self fallbackLoggingUnitPluralString];
      if (v17)
      {
        v18 = (void *)v17;
        v19 = [(HKMedicationLoggingUnit *)v5 fallbackLoggingUnitPluralString];
        v20 = [(HKMedicationLoggingUnit *)self fallbackLoggingUnitPluralString];
        char v21 = [v19 isEqualToString:v20];

        if (v21) {
          goto LABEL_20;
        }
LABEL_16:
        BOOL v15 = 0;
LABEL_17:

        goto LABEL_18;
      }
LABEL_15:

      goto LABEL_16;
    }
    BOOL v15 = 0;
  }
LABEL_18:

  return v15;
}

- (unint64_t)hash
{
  unint64_t loggingUnitCode = self->_loggingUnitCode;
  NSUInteger v4 = [(NSString *)self->_fallbackLoggingUnitSingularString hash] ^ loggingUnitCode;
  return v4 ^ [(NSString *)self->_fallbackLoggingUnitPluralString hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationLoggingUnit)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"LoggingUnitCodeKey"];
  if (v5)
  {
    unint64_t v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HKMedicationLoggingUnit;
    id v7 = [(HKMedicationLoggingUnit *)&v12 init];
    if (v7) {
      v7->_unint64_t loggingUnitCode = v6;
    }
    self = v7;
    uint64_t v8 = self;
  }
  else
  {
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FallbackLoggingUnitSingularStringKey"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FallbackLoggingUnitPluralStringKey"];
    uint64_t v8 = +[HKMedicationLoggingUnit loggingUnitByResolvingSingularLoggingUnitString:v9 fallbackPluralLoggingUnitString:v10];
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t loggingUnitCode = self->_loggingUnitCode;
  id v5 = a3;
  [v5 encodeInteger:loggingUnitCode forKey:@"LoggingUnitCodeKey"];
  [v5 encodeObject:self->_fallbackLoggingUnitSingularString forKey:@"FallbackLoggingUnitSingularStringKey"];
  [v5 encodeObject:self->_fallbackLoggingUnitPluralString forKey:@"FallbackLoggingUnitPluralStringKey"];
}

- (unint64_t)loggingUnitCode
{
  return self->_loggingUnitCode;
}

- (NSString)fallbackLoggingUnitSingularString
{
  return self->_fallbackLoggingUnitSingularString;
}

- (NSString)fallbackLoggingUnitPluralString
{
  return self->_fallbackLoggingUnitPluralString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackLoggingUnitPluralString, 0);

  objc_storeStrong((id *)&self->_fallbackLoggingUnitSingularString, 0);
}

@end