@interface ENExposureDetectionDaemonSessionState
+ (BOOL)supportsSecureCoding;
- (ENExposureDetectionDaemonSessionState)initWithCoder:(id)a3;
- (ENRegion)region;
- (NSDate)infectiousnessForDaysSinceOnsetOfSymptomsChangeDate;
- (NSDictionary)infectiousnessForDaysSinceOnsetOfSymptoms;
- (NSString)clientSigningIdentity;
- (void)encodeWithCoder:(id)a3;
- (void)setClientSigningIdentity:(id)a3;
- (void)setInfectiousnessForDaysSinceOnsetOfSymptoms:(id)a3;
- (void)setInfectiousnessForDaysSinceOnsetOfSymptomsChangeDate:(id)a3;
- (void)setRegion:(id)a3;
@end

@implementation ENExposureDetectionDaemonSessionState

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  clientSigningIdentity = self->_clientSigningIdentity;
  id v9 = v4;
  if (clientSigningIdentity)
  {
    [v4 encodeObject:clientSigningIdentity forKey:@"client"];
    id v4 = v9;
  }
  region = self->_region;
  if (region)
  {
    [v9 encodeObject:region forKey:@"region"];
    id v4 = v9;
  }
  infectiousnessForDaysSinceOnsetOfSymptoms = self->_infectiousnessForDaysSinceOnsetOfSymptoms;
  if (infectiousnessForDaysSinceOnsetOfSymptoms)
  {
    [v9 encodeObject:infectiousnessForDaysSinceOnsetOfSymptoms forKey:@"infectiousnessMap"];
    id v4 = v9;
  }
  infectiousnessForDaysSinceOnsetOfSymptomsChangeDate = self->_infectiousnessForDaysSinceOnsetOfSymptomsChangeDate;
  if (infectiousnessForDaysSinceOnsetOfSymptomsChangeDate)
  {
    [v9 encodeObject:infectiousnessForDaysSinceOnsetOfSymptomsChangeDate forKey:@"infectiousnessMapDate"];
    id v4 = v9;
  }
}

- (ENExposureDetectionDaemonSessionState)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ENExposureDetectionDaemonSessionState;
  v5 = [(ENExposureDetectionDaemonSessionState *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"client"];
    clientSigningIdentity = v5->_clientSigningIdentity;
    v5->_clientSigningIdentity = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];
    region = v5->_region;
    v5->_region = (ENRegion *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v4 decodeDictionaryWithKeysOfClass:v10 objectsOfClass:objc_opt_class() forKey:@"infectiousnessMap"];
    infectiousnessForDaysSinceOnsetOfSymptoms = v5->_infectiousnessForDaysSinceOnsetOfSymptoms;
    v5->_infectiousnessForDaysSinceOnsetOfSymptoms = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"infectiousnessMapDate"];
    infectiousnessForDaysSinceOnsetOfSymptomsChangeDate = v5->_infectiousnessForDaysSinceOnsetOfSymptomsChangeDate;
    v5->_infectiousnessForDaysSinceOnsetOfSymptomsChangeDate = (NSDate *)v13;

    v15 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)clientSigningIdentity
{
  return self->_clientSigningIdentity;
}

- (void)setClientSigningIdentity:(id)a3
{
}

- (ENRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (NSDate)infectiousnessForDaysSinceOnsetOfSymptomsChangeDate
{
  return self->_infectiousnessForDaysSinceOnsetOfSymptomsChangeDate;
}

- (void)setInfectiousnessForDaysSinceOnsetOfSymptomsChangeDate:(id)a3
{
}

- (NSDictionary)infectiousnessForDaysSinceOnsetOfSymptoms
{
  return self->_infectiousnessForDaysSinceOnsetOfSymptoms;
}

- (void)setInfectiousnessForDaysSinceOnsetOfSymptoms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infectiousnessForDaysSinceOnsetOfSymptoms, 0);
  objc_storeStrong((id *)&self->_infectiousnessForDaysSinceOnsetOfSymptomsChangeDate, 0);
  objc_storeStrong((id *)&self->_region, 0);

  objc_storeStrong((id *)&self->_clientSigningIdentity, 0);
}

@end