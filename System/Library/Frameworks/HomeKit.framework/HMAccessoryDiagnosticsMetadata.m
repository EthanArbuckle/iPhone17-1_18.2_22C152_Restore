@interface HMAccessoryDiagnosticsMetadata
+ (BOOL)supportsSecureCoding;
- (HMAccessoryDiagnosticsMetadata)initWithCoder:(id)a3;
- (HMAccessoryDiagnosticsMetadata)initWithSnapshotPath:(id)a3 urlParameters:(id)a4 privacyPolicyURL:(id)a5 uploadDestination:(id)a6 consentVersion:(id)a7 uploadType:(id)a8;
- (NSDictionary)urlParameters;
- (NSNumber)consentVersion;
- (NSNumber)uploadType;
- (NSString)snapshotPath;
- (NSURL)privacyPolicyURL;
- (NSURL)uploadDestination;
- (id)attributeDescriptions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMAccessoryDiagnosticsMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadType, 0);
  objc_storeStrong((id *)&self->_consentVersion, 0);
  objc_storeStrong((id *)&self->_uploadDestination, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong((id *)&self->_urlParameters, 0);

  objc_storeStrong((id *)&self->_snapshotPath, 0);
}

- (NSNumber)uploadType
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)consentVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSURL)uploadDestination
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSURL)privacyPolicyURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)urlParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)snapshotPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessoryDiagnosticsMetadata *)self snapshotPath];
  [v4 encodeObject:v5 forKey:@"HMA.diagnostics.ck.sp"];

  v6 = [(HMAccessoryDiagnosticsMetadata *)self urlParameters];
  [v4 encodeObject:v6 forKey:@"HMA.diagnostics.ck.urlp"];

  v7 = [(HMAccessoryDiagnosticsMetadata *)self privacyPolicyURL];
  [v4 encodeObject:v7 forKey:@"HMA.diagnostics.ck.purl"];

  v8 = [(HMAccessoryDiagnosticsMetadata *)self uploadDestination];
  [v4 encodeObject:v8 forKey:@"HMA.diagnostics.ck.udest"];

  v9 = [(HMAccessoryDiagnosticsMetadata *)self consentVersion];
  [v4 encodeObject:v9 forKey:@"HMA.diagnostics.ck.cv"];

  id v10 = [(HMAccessoryDiagnosticsMetadata *)self uploadType];
  [v4 encodeObject:v10 forKey:@"HMA.diagnostics.ck.ut"];
}

- (HMAccessoryDiagnosticsMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.diagnostics.ck.sp"];
  uint64_t v6 = objc_opt_class();
  v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"HMA.diagnostics.ck.urlp"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.diagnostics.ck.purl"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.diagnostics.ck.udest"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.diagnostics.ck.cv"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.diagnostics.ck.ut"];

  v12 = [(HMAccessoryDiagnosticsMetadata *)self initWithSnapshotPath:v5 urlParameters:v7 privacyPolicyURL:v8 uploadDestination:v9 consentVersion:v10 uploadType:v11];
  return v12;
}

- (id)attributeDescriptions
{
  v23[6] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v22 = [(HMAccessoryDiagnosticsMetadata *)self snapshotPath];
  v21 = (void *)[v3 initWithName:@"snapshotPath" value:v22];
  v23[0] = v21;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v20 = [(HMAccessoryDiagnosticsMetadata *)self urlParameters];
  v5 = (void *)[v4 initWithName:@"urlParameters" value:v20];
  v23[1] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMAccessoryDiagnosticsMetadata *)self privacyPolicyURL];
  v8 = (void *)[v6 initWithName:@"privacyPolicyURL" value:v7];
  v23[2] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v10 = [(HMAccessoryDiagnosticsMetadata *)self uploadDestination];
  v11 = (void *)[v9 initWithName:@"uploadDestination" value:v10];
  v23[3] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = [(HMAccessoryDiagnosticsMetadata *)self consentVersion];
  v14 = (void *)[v12 initWithName:@"consentVersion" value:v13];
  v23[4] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  v16 = [(HMAccessoryDiagnosticsMetadata *)self uploadType];
  v17 = (void *)[v15 initWithName:@"uploadType" value:v16];
  v23[5] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:6];

  return v18;
}

- (HMAccessoryDiagnosticsMetadata)initWithSnapshotPath:(id)a3 urlParameters:(id)a4 privacyPolicyURL:(id)a5 uploadDestination:(id)a6 consentVersion:(id)a7 uploadType:(id)a8
{
  id v25 = a3;
  id v15 = a4;
  id v24 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMAccessoryDiagnosticsMetadata;
  v19 = [(HMAccessoryDiagnosticsMetadata *)&v26 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_snapshotPath, a3);
    uint64_t v21 = objc_msgSend(v15, "copy", v24, v25);
    urlParameters = v20->_urlParameters;
    v20->_urlParameters = (NSDictionary *)v21;

    objc_storeStrong((id *)&v20->_privacyPolicyURL, a5);
    objc_storeStrong((id *)&v20->_uploadDestination, a6);
    objc_storeStrong((id *)&v20->_consentVersion, a7);
    objc_storeStrong((id *)&v20->_uploadType, a8);
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end