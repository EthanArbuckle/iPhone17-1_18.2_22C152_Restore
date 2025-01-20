@interface HKClinicalCoding
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalCoding)init;
- (HKClinicalCoding)initWithCoder:(id)a3;
- (HKClinicalCoding)initWithSystem:(id)a3 version:(id)a4 code:(id)a5;
- (NSString)code;
- (NSString)system;
- (NSString)version;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalCoding

- (HKClinicalCoding)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalCoding)initWithSystem:(id)a3 version:(id)a4 code:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKClinicalCoding;
  v11 = [(HKClinicalCoding *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    system = v11->_system;
    v11->_system = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    version = v11->_version;
    v11->_version = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    code = v11->_code;
    v11->_code = (NSString *)v16;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKClinicalCoding *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HKClinicalCoding *)v5 system];
      uint64_t v7 = [(HKClinicalCoding *)self system];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        id v8 = (void *)v7;
        uint64_t v9 = [(HKClinicalCoding *)self system];
        if (!v9) {
          goto LABEL_19;
        }
        id v10 = (void *)v9;
        v11 = [(HKClinicalCoding *)v5 system];
        uint64_t v12 = [(HKClinicalCoding *)self system];
        int v13 = [v11 isEqualToString:v12];

        if (!v13) {
          goto LABEL_20;
        }
      }
      v6 = [(HKClinicalCoding *)v5 version];
      uint64_t v15 = [(HKClinicalCoding *)self version];
      if (v6 == (void *)v15)
      {
      }
      else
      {
        id v8 = (void *)v15;
        uint64_t v16 = [(HKClinicalCoding *)self version];
        if (!v16) {
          goto LABEL_19;
        }
        v17 = (void *)v16;
        v18 = [(HKClinicalCoding *)v5 version];
        objc_super v19 = [(HKClinicalCoding *)self version];
        int v20 = [v18 isEqualToString:v19];

        if (!v20) {
          goto LABEL_20;
        }
      }
      v6 = [(HKClinicalCoding *)v5 code];
      uint64_t v21 = [(HKClinicalCoding *)self code];
      if (v6 == (void *)v21)
      {

LABEL_24:
        BOOL v14 = 1;
        goto LABEL_21;
      }
      id v8 = (void *)v21;
      uint64_t v22 = [(HKClinicalCoding *)self code];
      if (v22)
      {
        v23 = (void *)v22;
        v24 = [(HKClinicalCoding *)v5 code];
        v25 = [(HKClinicalCoding *)self code];
        char v26 = [v24 isEqualToString:v25];

        if (v26) {
          goto LABEL_24;
        }
LABEL_20:
        BOOL v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    BOOL v14 = 0;
  }
LABEL_22:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_system hash];
  NSUInteger v4 = [(NSString *)self->_version hash] ^ v3;
  return v4 ^ [(NSString *)self->_code hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKClinicalCoding)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKClinicalCoding;
  v5 = [(HKClinicalCoding *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SystemIdentifier"];
    system = v5->_system;
    v5->_system = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Version"];
    version = v5->_version;
    v5->_version = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Code"];
    code = v5->_code;
    v5->_code = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  system = self->_system;
  id v5 = a3;
  [v5 encodeObject:system forKey:@"SystemIdentifier"];
  [v5 encodeObject:self->_version forKey:@"Version"];
  [v5 encodeObject:self->_code forKey:@"Code"];
}

- (NSString)system
{
  return self->_system;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)code
{
  return self->_code;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_code, 0);
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_system, 0);
}

@end