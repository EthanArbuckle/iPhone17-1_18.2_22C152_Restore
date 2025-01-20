@interface HKClinicalAccount
+ (BOOL)supportsSecureCoding;
- (BOOL)hasClinicalSharingScopes;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserEnabled;
- (BOOL)needsRelogin;
- (BOOL)needsScopeUpgrade;
- (HKClinicalAccount)init;
- (HKClinicalAccount)initWithCoder:(id)a3;
- (HKClinicalAccount)initWithIdentifier:(id)a3 state:(int64_t)a4 userEnabled:(BOOL)a5 lastFetchDate:(id)a6 lastFullFetchDate:(id)a7 lastFailedFetchDate:(id)a8 failedFetchAttemptsCount:(id)a9 clinicalSharingStatus:(id)a10 hasClinicalSharingScopes:(BOOL)a11 provenance:(id)a12;
- (HKClinicalAccountProvenance)provenance;
- (HKClinicalBrand)brand;
- (HKClinicalGateway)gateway;
- (HKClinicalGatewayReference)newerAvailableGateway;
- (HKClinicalSharingStatus)clinicalSharingStatus;
- (NSDate)lastFailedFetchDate;
- (NSDate)lastFetchDate;
- (NSDate)lastFullFetchDate;
- (NSNumber)failedFetchAttemptsCount;
- (NSString)description;
- (NSString)subtitle;
- (NSString)title;
- (NSUUID)identifier;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalAccount

- (HKClinicalAccount)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalAccount)initWithIdentifier:(id)a3 state:(int64_t)a4 userEnabled:(BOOL)a5 lastFetchDate:(id)a6 lastFullFetchDate:(id)a7 lastFailedFetchDate:(id)a8 failedFetchAttemptsCount:(id)a9 clinicalSharingStatus:(id)a10 hasClinicalSharingScopes:(BOOL)a11 provenance:(id)a12
{
  id v18 = a3;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a12;
  v42.receiver = self;
  v42.super_class = (Class)HKClinicalAccount;
  v25 = [(HKClinicalAccount *)&v42 init];
  if (v25)
  {
    uint64_t v26 = [v18 copy];
    identifier = v25->_identifier;
    v25->_identifier = (NSUUID *)v26;

    v25->_state = a4;
    v25->_userEnabled = a5;
    v28 = HKDateMax();
    uint64_t v29 = [v28 copy];
    lastFetchDate = v25->_lastFetchDate;
    v25->_lastFetchDate = (NSDate *)v29;

    uint64_t v31 = [v20 copy];
    lastFullFetchDate = v25->_lastFullFetchDate;
    v25->_lastFullFetchDate = (NSDate *)v31;

    uint64_t v33 = [v21 copy];
    lastFailedFetchDate = v25->_lastFailedFetchDate;
    v25->_lastFailedFetchDate = (NSDate *)v33;

    uint64_t v35 = [v22 copy];
    failedFetchAttemptsCount = v25->_failedFetchAttemptsCount;
    v25->_failedFetchAttemptsCount = (NSNumber *)v35;

    uint64_t v37 = [v23 copy];
    clinicalSharingStatus = v25->_clinicalSharingStatus;
    v25->_clinicalSharingStatus = (HKClinicalSharingStatus *)v37;

    v25->_hasClinicalSharingScopes = a11;
    uint64_t v39 = [v24 copy];
    provenance = v25->_provenance;
    v25->_provenance = (HKClinicalAccountProvenance *)v39;
  }
  return v25;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(NSUUID *)self->_identifier UUIDString];
  v7 = @"false";
  if (self->_userEnabled) {
    v8 = @"true";
  }
  else {
    v8 = @"false";
  }
  long long v15 = *(_OWORD *)&self->_state;
  long long v14 = *(_OWORD *)&self->_lastFullFetchDate;
  failedFetchAttemptsCount = self->_failedFetchAttemptsCount;
  v10 = [(HKClinicalSharingStatus *)self->_clinicalSharingStatus description];
  if (self->_hasClinicalSharingScopes) {
    v7 = @"true";
  }
  v11 = [(HKClinicalAccountProvenance *)self->_provenance description];
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p; identifier: %@; isUserEnabled: %@; state: %ld; lastFetchDate: %@; lastFullFetchDate: %@; lastFailedFetchDate: %@; failedFetchAttemptsCount: %@; clinicalSharingStatus: %@ ; hasClinicalSharingScopes: %@; provenance: %@;>",
    v5,
    self,
    v6,
    v8,
    v15,
    v14,
    failedFetchAttemptsCount,
    v10,
    v7,
  v12 = v11);

  return (NSString *)v12;
}

- (HKClinicalGateway)gateway
{
  return [(HKClinicalAccountProvenance *)self->_provenance gateway];
}

- (HKClinicalGatewayReference)newerAvailableGateway
{
  v2 = [(HKClinicalAccountProvenance *)self->_provenance gateway];
  v3 = [v2 newerSupportedGatewayVersion];

  return (HKClinicalGatewayReference *)v3;
}

- (NSString)title
{
  int64_t v3 = [(HKClinicalAccountProvenance *)self->_provenance type];
  provenance = self->_provenance;
  if (v3 == 1)
  {
    v5 = [(HKClinicalAccountProvenance *)provenance signedClinicalDataIssuer];
    v6 = [v5 title];
  }
  else
  {
    v6 = [(HKClinicalAccountProvenance *)provenance title];
  }

  return (NSString *)v6;
}

- (NSString)subtitle
{
  int64_t v3 = [(HKClinicalAccountProvenance *)self->_provenance type];
  provenance = self->_provenance;
  if (v3 == 1)
  {
    v5 = [(HKClinicalAccountProvenance *)provenance signedClinicalDataIssuer];
    v6 = [v5 subtitle];
  }
  else
  {
    v6 = [(HKClinicalAccountProvenance *)provenance subtitle];
  }

  return (NSString *)v6;
}

- (HKClinicalBrand)brand
{
  return [(HKClinicalAccountProvenance *)self->_provenance brand];
}

- (unint64_t)hash
{
  v2 = [(HKClinicalAccount *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKClinicalAccount *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(HKClinicalAccount *)v4 identifier];
      v6 = [(HKClinicalAccount *)self identifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (BOOL)needsScopeUpgrade
{
  return [(HKClinicalAccount *)self state] == 6;
}

- (BOOL)needsRelogin
{
  return [(HKClinicalAccount *)self state] == 3
      && [(HKClinicalAccountProvenance *)self->_provenance type] == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  provenance = self->_provenance;
  id v5 = a3;
  [v5 encodeObject:provenance forKey:@"provenance"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_lastFetchDate forKey:@"lastFetchDate"];
  [v5 encodeObject:self->_lastFullFetchDate forKey:@"lastFullFetchDate"];
  [v5 encodeObject:self->_lastFailedFetchDate forKey:@"lastFailedFetchDate"];
  [v5 encodeObject:self->_failedFetchAttemptsCount forKey:@"failedFetchAttemptsCount"];
  [v5 encodeObject:self->_clinicalSharingStatus forKey:@"clinicalSharingStatus"];
  [v5 encodeBool:self->_hasClinicalSharingScopes forKey:@"hasClinicalSharingScopes"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeBool:self->_userEnabled forKey:@"userEnabled"];
}

- (HKClinicalAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provenance"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clinicalSharingStatus"];
  v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v5 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = v9 || v7 == 0;
  if (!v10
    && [v4 containsValueForKey:@"state"]
    && [v4 containsValueForKey:@"userEnabled"]
    && ([v4 containsValueForKey:@"hasClinicalSharingScopes"] & 1) != 0)
  {
    uint64_t v20 = [v4 decodeIntegerForKey:@"state"];
    unsigned int v19 = [v4 decodeBoolForKey:@"userEnabled"];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastFetchDate"];
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastFullFetchDate"];
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastFailedFetchDate"];
    long long v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"failedFetchAttemptsCount"];
    long long v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clinicalSharingStatus"];
    LOBYTE(v18) = [v4 decodeBoolForKey:@"hasClinicalSharingScopes"];
    self = [(HKClinicalAccount *)self initWithIdentifier:v6 state:v20 userEnabled:v19 lastFetchDate:v11 lastFullFetchDate:v12 lastFailedFetchDate:v13 failedFetchAttemptsCount:v14 clinicalSharingStatus:v15 hasClinicalSharingScopes:v18 provenance:v5];

    v16 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v16 = 0;
  }

  return v16;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)isUserEnabled
{
  return self->_userEnabled;
}

- (NSDate)lastFetchDate
{
  return self->_lastFetchDate;
}

- (NSDate)lastFullFetchDate
{
  return self->_lastFullFetchDate;
}

- (NSDate)lastFailedFetchDate
{
  return self->_lastFailedFetchDate;
}

- (NSNumber)failedFetchAttemptsCount
{
  return self->_failedFetchAttemptsCount;
}

- (HKClinicalSharingStatus)clinicalSharingStatus
{
  return self->_clinicalSharingStatus;
}

- (BOOL)hasClinicalSharingScopes
{
  return self->_hasClinicalSharingScopes;
}

- (HKClinicalAccountProvenance)provenance
{
  return self->_provenance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provenance, 0);
  objc_storeStrong((id *)&self->_clinicalSharingStatus, 0);
  objc_storeStrong((id *)&self->_failedFetchAttemptsCount, 0);
  objc_storeStrong((id *)&self->_lastFailedFetchDate, 0);
  objc_storeStrong((id *)&self->_lastFullFetchDate, 0);
  objc_storeStrong((id *)&self->_lastFetchDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end