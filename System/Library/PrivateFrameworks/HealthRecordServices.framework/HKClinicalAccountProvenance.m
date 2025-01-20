@interface HKClinicalAccountProvenance
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalAccountProvenance)init;
- (HKClinicalAccountProvenance)initWithCoder:(id)a3;
- (HKClinicalAccountProvenance)initWithGateway:(id)a3;
- (HKClinicalAccountProvenance)initWithSignedClinicalDataIssuer:(id)a3;
- (HKClinicalBrand)brand;
- (HKClinicalGateway)gateway;
- (HKSignedClinicalDataIssuer)signedClinicalDataIssuer;
- (NSString)subtitle;
- (NSString)title;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)type;
@end

@implementation HKClinicalAccountProvenance

- (HKClinicalAccountProvenance)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalAccountProvenance)initWithGateway:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKClinicalAccountProvenance;
  v6 = [(HKClinicalAccountProvenance *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_gateway, a3);
  }

  return v7;
}

- (HKClinicalAccountProvenance)initWithSignedClinicalDataIssuer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKClinicalAccountProvenance;
  v6 = [(HKClinicalAccountProvenance *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_signedClinicalDataIssuer, a3);
  }

  return v7;
}

- (int64_t)type
{
  if (self->_gateway) {
    return 0;
  }
  if (!self->_signedClinicalDataIssuer)
  {
    _HKInitializeLogging();
    uint64_t v4 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      [(HKClinicalAccountProvenance *)v4 type];
    }
    return 0;
  }
  return 1;
}

- (NSString)title
{
  int64_t v3 = [(HKClinicalAccountProvenance *)self type];
  uint64_t v4 = 8;
  if (v3 == 1) {
    uint64_t v4 = 16;
  }
  id v5 = [*(id *)((char *)&self->super.isa + v4) title];

  return (NSString *)v5;
}

- (NSString)subtitle
{
  int64_t v3 = [(HKClinicalAccountProvenance *)self type];
  uint64_t v4 = 8;
  if (v3 == 1) {
    uint64_t v4 = 16;
  }
  id v5 = [*(id *)((char *)&self->super.isa + v4) subtitle];

  return (NSString *)v5;
}

- (HKClinicalBrand)brand
{
  if ([(HKClinicalAccountProvenance *)self type] == 1)
  {
    int64_t v3 = 0;
  }
  else
  {
    int64_t v3 = [(HKClinicalGateway *)self->_gateway brand];
  }

  return (HKClinicalBrand *)v3;
}

- (id)description
{
  int64_t v3 = [(HKClinicalAccountProvenance *)self type];
  uint64_t v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v7 = (void *)v6;
  uint64_t v8 = 8;
  if (v3 == 1) {
    uint64_t v8 = 16;
  }
  objc_super v9 = [v4 stringWithFormat:@"<%@ %p: %@>", v6, self, *(Class *)((char *)&self->super.isa + v8)];

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKClinicalGateway *)self->_gateway hash];
  return [(HKSignedClinicalDataIssuer *)self->_signedClinicalDataIssuer hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (HKClinicalAccountProvenance *)a3;
  v7 = v6;
  if (self != v6)
  {
    uint64_t v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
    gateway = self->_gateway;
    v10 = [(HKClinicalAccountProvenance *)v8 gateway];
    if (gateway == v10) {
      goto LABEL_9;
    }
    uint64_t v11 = [(HKClinicalAccountProvenance *)v8 gateway];
    if (!v11)
    {
      char v13 = 0;
LABEL_17:

      goto LABEL_18;
    }
    unint64_t v3 = (void *)v11;
    v12 = self->_gateway;
    uint64_t v4 = [(HKClinicalAccountProvenance *)v8 gateway];
    if ([(HKClinicalGateway *)v12 isEqual:v4])
    {
LABEL_9:
      signedClinicalDataIssuer = self->_signedClinicalDataIssuer;
      uint64_t v15 = [(HKClinicalAccountProvenance *)v8 signedClinicalDataIssuer];
      if (signedClinicalDataIssuer == (HKSignedClinicalDataIssuer *)v15)
      {

        char v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        uint64_t v17 = [(HKClinicalAccountProvenance *)v8 signedClinicalDataIssuer];
        if (v17)
        {
          v18 = (void *)v17;
          v19 = self->_signedClinicalDataIssuer;
          v20 = [(HKClinicalAccountProvenance *)v8 signedClinicalDataIssuer];
          char v13 = [(HKSignedClinicalDataIssuer *)v19 isEqual:v20];
        }
        else
        {

          char v13 = 0;
        }
      }
      if (gateway == v10) {
        goto LABEL_17;
      }
    }
    else
    {
      char v13 = 0;
    }

    goto LABEL_17;
  }
  char v13 = 1;
LABEL_19:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  gateway = self->_gateway;
  id v5 = a3;
  [v5 encodeObject:gateway forKey:@"Gateway"];
  [v5 encodeObject:self->_signedClinicalDataIssuer forKey:@"SignedClinicalDataIssuer"];
}

- (HKClinicalAccountProvenance)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Gateway"];
  if (v5)
  {
    self = [(HKClinicalAccountProvenance *)self initWithGateway:v5];
    uint64_t v6 = self;
  }
  else
  {
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SignedClinicalDataIssuer"];
    if (v7)
    {
      self = [(HKClinicalAccountProvenance *)self initWithSignedClinicalDataIssuer:v7];
      uint64_t v6 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaInvalidValueError");
      uint64_t v6 = 0;
    }
  }
  return v6;
}

- (HKClinicalGateway)gateway
{
  return self->_gateway;
}

- (HKSignedClinicalDataIssuer)signedClinicalDataIssuer
{
  return self->_signedClinicalDataIssuer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedClinicalDataIssuer, 0);

  objc_storeStrong((id *)&self->_gateway, 0);
}

- (void)type
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t v3 = a1;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int v6 = 138543618;
  v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_221D38000, v3, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ has no valid provenance type assigned", (uint8_t *)&v6, 0x16u);
}

@end