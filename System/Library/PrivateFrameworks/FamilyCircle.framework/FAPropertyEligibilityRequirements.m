@interface FAPropertyEligibilityRequirements
+ (BOOL)supportsSecureCoding;
- (BOOL)hasRecommendedMembers;
- (BOOL)serverEligibility;
- (FAPropertyEligibilityRequirements)initWithCoder:(id)a3;
- (FAPropertyEligibilityRequirements)initWithPropertyName:(id)a3 dictionaryRepresentation:(id)a4;
- (FAPropertyEligibilityRequirements)initWithPropertyName:(id)a3 hasRecommendedMembers:(BOOL)a4 expectedMediaAltDSID:(id)a5 serverEligibility:(BOOL)a6 activeBundleIDs:(id)a7 serverPayload:(id)a8;
- (NSArray)activeBundleIDs;
- (NSString)expectedMediaAltDSID;
- (NSString)propertyName;
- (id)serverPayload;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FAPropertyEligibilityRequirements

- (void)encodeWithCoder:(id)a3
{
  propertyName = self->_propertyName;
  id v5 = a3;
  [v5 encodeObject:propertyName forKey:@"propertyName"];
  [v5 encodeBool:self->_hasRecommendedMembers forKey:@"has-recommended-members"];
  [v5 encodeObject:self->_expectedMediaAltDSID forKey:@"media-altDSID-matches"];
  [v5 encodeBool:self->_serverEligibility forKey:@"server-journey-eligibility"];
  [v5 encodeObject:self->_activeBundleIDs forKey:@"active-apps"];
  [v5 encodeObject:self->_serverPayload forKey:@"serverPayload"];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serverPayload, 0);
  objc_storeStrong((id *)&self->_activeBundleIDs, 0);
  objc_storeStrong((id *)&self->_expectedMediaAltDSID, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

- (FAPropertyEligibilityRequirements)initWithPropertyName:(id)a3 dictionaryRepresentation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 objectForKeyedSubscript:@"has-recommended-members"];
  uint64_t v9 = [v8 BOOLValue];
  v10 = [v6 objectForKeyedSubscript:@"media-altDSID-matches"];
  v11 = [v6 objectForKeyedSubscript:@"server-journey-eligibility"];
  uint64_t v12 = [v11 BOOLValue];
  v13 = [v6 objectForKeyedSubscript:@"active-apps"];
  v14 = [v6 objectForKeyedSubscript:@"serverPayload"];

  v15 = [(FAPropertyEligibilityRequirements *)self initWithPropertyName:v7 hasRecommendedMembers:v9 expectedMediaAltDSID:v10 serverEligibility:v12 activeBundleIDs:v13 serverPayload:v14];
  return v15;
}

- (FAPropertyEligibilityRequirements)initWithPropertyName:(id)a3 hasRecommendedMembers:(BOOL)a4 expectedMediaAltDSID:(id)a5 serverEligibility:(BOOL)a6 activeBundleIDs:(id)a7 serverPayload:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)FAPropertyEligibilityRequirements;
  v18 = [(FAPropertyEligibilityRequirements *)&v26 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    propertyName = v18->_propertyName;
    v18->_propertyName = (NSString *)v19;

    v18->_hasRecommendedMembers = a4;
    uint64_t v21 = [v15 copy];
    expectedMediaAltDSID = v18->_expectedMediaAltDSID;
    v18->_expectedMediaAltDSID = (NSString *)v21;

    v18->_serverEligibility = a6;
    uint64_t v23 = [v16 copy];
    activeBundleIDs = v18->_activeBundleIDs;
    v18->_activeBundleIDs = (NSArray *)v23;

    objc_storeStrong(&v18->_serverPayload, a8);
  }

  return v18;
}

- (FAPropertyEligibilityRequirements)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FAPropertyEligibilityRequirements *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"propertyName"];
    propertyName = v5->_propertyName;
    v5->_propertyName = (NSString *)v6;

    v5->_hasRecommendedMembers = [v4 decodeBoolForKey:@"has-recommended-members"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"media-altDSID-matches"];
    expectedMediaAltDSID = v5->_expectedMediaAltDSID;
    v5->_expectedMediaAltDSID = (NSString *)v8;

    v5->_serverEligibility = [v4 decodeBoolForKey:@"server-journey-eligibility"];
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"active-apps"];
    activeBundleIDs = v5->_activeBundleIDs;
    v5->_activeBundleIDs = (NSArray *)v13;

    id v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"serverPayload"];
    id serverPayload = v5->_serverPayload;
    v5->_id serverPayload = (id)v20;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (BOOL)hasRecommendedMembers
{
  return self->_hasRecommendedMembers;
}

- (NSString)expectedMediaAltDSID
{
  return self->_expectedMediaAltDSID;
}

- (BOOL)serverEligibility
{
  return self->_serverEligibility;
}

- (NSArray)activeBundleIDs
{
  return self->_activeBundleIDs;
}

- (id)serverPayload
{
  return self->_serverPayload;
}

@end