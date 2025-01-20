@interface CRKASMCredentialManifestEntry
+ (id)validityIntervalWithDictionary:(id)a3;
- (BOOL)isFullyPopulated;
- (CRKASMCredentialManifestEntry)init;
- (CRKASMCredentialManifestEntry)initWithDictionary:(id)a3;
- (CRKASMCredentialManifestEntry)initWithUserIdentifier:(id)a3 validityInterval:(id)a4 fingerprint:(id)a5;
- (NSDateInterval)validityInterval;
- (NSString)fingerprint;
- (NSString)stringValue;
- (NSString)userIdentifier;
- (id)dictionaryValue;
@end

@implementation CRKASMCredentialManifestEntry

- (CRKASMCredentialManifestEntry)init
{
  return [(CRKASMCredentialManifestEntry *)self initWithUserIdentifier:0 validityInterval:0 fingerprint:0];
}

- (CRKASMCredentialManifestEntry)initWithUserIdentifier:(id)a3 validityInterval:(id)a4 fingerprint:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKASMCredentialManifestEntry;
  v11 = [(CRKASMCredentialManifestEntry *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    userIdentifier = v11->_userIdentifier;
    v11->_userIdentifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_validityInterval, a4);
    uint64_t v14 = [v10 copy];
    fingerprint = v11->_fingerprint;
    v11->_fingerprint = (NSString *)v14;
  }
  return v11;
}

- (BOOL)isFullyPopulated
{
  v3 = [(CRKASMCredentialManifestEntry *)self userIdentifier];
  if (v3)
  {
    v4 = [(CRKASMCredentialManifestEntry *)self validityInterval];
    if (v4)
    {
      v5 = [(CRKASMCredentialManifestEntry *)self fingerprint];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSString)stringValue
{
  v3 = NSString;
  v4 = [(CRKASMCredentialManifestEntry *)self userIdentifier];
  v5 = [(CRKASMCredentialManifestEntry *)self validityInterval];
  BOOL v6 = [(CRKASMCredentialManifestEntry *)self fingerprint];
  v7 = [v3 stringWithFormat:@"{ userIdentifier = %@, validityInterval = %@, fingerprint = %@ }", v4, v5, v6];

  return (NSString *)v7;
}

- (CRKASMCredentialManifestEntry)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"UserIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  id v7 = v6;

  id v8 = [(id)objc_opt_class() validityIntervalWithDictionary:v4];
  id v9 = [v4 objectForKeyedSubscript:@"Fingerprint"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = [(CRKASMCredentialManifestEntry *)self initWithUserIdentifier:v7 validityInterval:v8 fingerprint:v11];
  return v12;
}

- (id)dictionaryValue
{
  v3 = objc_opt_new();
  id v4 = [(CRKASMCredentialManifestEntry *)self userIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"UserIdentifier"];

  v5 = [(CRKASMCredentialManifestEntry *)self validityInterval];
  BOOL v6 = [v5 startDate];
  [v3 setObject:v6 forKeyedSubscript:@"ValidityStartDate"];

  id v7 = [(CRKASMCredentialManifestEntry *)self validityInterval];
  id v8 = [v7 endDate];
  [v3 setObject:v8 forKeyedSubscript:@"ValidityEndDate"];

  id v9 = [(CRKASMCredentialManifestEntry *)self fingerprint];
  [v3 setObject:v9 forKeyedSubscript:@"Fingerprint"];

  id v10 = (void *)[v3 copy];

  return v10;
}

+ (id)validityIntervalWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"ValidityStartDate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  id v7 = [v3 objectForKeyedSubscript:@"ValidityEndDate"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = 0;
  if (v6) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11) {
    id v10 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v6 endDate:v9];
  }

  return v10;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSDateInterval)validityInterval
{
  return self->_validityInterval;
}

- (NSString)fingerprint
{
  return self->_fingerprint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerprint, 0);
  objc_storeStrong((id *)&self->_validityInterval, 0);

  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end