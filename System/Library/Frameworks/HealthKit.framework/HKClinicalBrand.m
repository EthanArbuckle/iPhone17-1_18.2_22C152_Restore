@interface HKClinicalBrand
+ (BOOL)supportsSecureCoding;
+ (id)createFakeBrandForTestAccounts;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFakeBrandForTestAccounts;
- (HKClinicalBrand)init;
- (HKClinicalBrand)initWithCoder:(id)a3;
- (HKClinicalBrand)initWithExternalID:(id)a3 batchID:(id)a4;
- (NSString)batchID;
- (NSString)externalID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalBrand

- (HKClinicalBrand)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalBrand)initWithExternalID:(id)a3 batchID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKClinicalBrand;
  v8 = [(HKClinicalBrand *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    externalID = v8->_externalID;
    v8->_externalID = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    batchID = v8->_batchID;
    v8->_batchID = (NSString *)v11;
  }
  return v8;
}

+ (id)createFakeBrandForTestAccounts
{
  v2 = [[HKClinicalBrand alloc] initWithExternalID:@"INVALID_FAKEBRANDID" batchID:@"INVALID_FAKEBRANDBATCHID"];

  return v2;
}

- (BOOL)isFakeBrandForTestAccounts
{
  return [(NSString *)self->_externalID hasSuffix:@"_FAKEBRANDID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(HKClinicalBrand *)self externalID];
    id v7 = [v5 externalID];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(HKClinicalBrand *)self batchID];
      uint64_t v9 = [v5 batchID];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(HKClinicalBrand *)self externalID];
  uint64_t v4 = [v3 hash];
  id v5 = [(HKClinicalBrand *)self batchID];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HKClinicalBrand *)self externalID];
  [v4 encodeObject:v5 forKey:@"externalID"];

  id v6 = [(HKClinicalBrand *)self batchID];
  [v4 encodeObject:v6 forKey:@"batchID"];
}

- (HKClinicalBrand)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalID"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batchID"];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    char v10 = (void *)[v9 initWithDomain:*MEMORY[0x1E4F281F8] code:4865 userInfo:0];
    [v4 failWithError:v10];

    uint64_t v11 = 0;
  }
  else
  {
    self = [(HKClinicalBrand *)self initWithExternalID:v5 batchID:v6];
    uint64_t v11 = self;
  }

  return v11;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)batchID
{
  return self->_batchID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchID, 0);

  objc_storeStrong((id *)&self->_externalID, 0);
}

@end