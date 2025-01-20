@interface HMSoftwareUpdateV2
+ (id)shortDescription;
+ (id)softwareUpdateFromDescriptor:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)rampFeatureEnabledOnServer;
- (HMFSoftwareVersion)version;
- (HMSoftwareUpdateDocumentationMetadata)documentationMetadata;
- (HMSoftwareUpdateV2)initWithStatus:(int64_t)a3 error:(id)a4 documentationMetadata:(id)a5 version:(id)a6 downloadSize:(unint64_t)a7 humanReadableUpdateName:(id)a8 rampFeatureEnabledOnServer:(BOOL)a9;
- (NSArray)attributeDescriptions;
- (NSError)error;
- (NSString)description;
- (NSString)humanReadableUpdateName;
- (NSString)shortDescription;
- (double)estimatedTimeRemaining;
- (float)percentageComplete;
- (int64_t)status;
- (unint64_t)downloadSize;
- (unint64_t)hash;
- (void)setDocumentationMetadata:(id)a3;
- (void)setDownloadSize:(unint64_t)a3;
- (void)setError:(id)a3;
- (void)setHumanReadableUpdateName:(id)a3;
- (void)setRampFeatureEnabledOnServer:(BOOL)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation HMSoftwareUpdateV2

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_documentationMetadata, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setRampFeatureEnabledOnServer:(BOOL)a3
{
  self->_rampFeatureEnabledOnServer = a3;
}

- (BOOL)rampFeatureEnabledOnServer
{
  return self->_rampFeatureEnabledOnServer;
}

- (void)setHumanReadableUpdateName:(id)a3
{
}

- (NSString)humanReadableUpdateName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDownloadSize:(unint64_t)a3
{
  self->_downloadSize = a3;
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (void)setVersion:(id)a3
{
}

- (HMFSoftwareVersion)version
{
  return (HMFSoftwareVersion *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDocumentationMetadata:(id)a3
{
}

- (HMSoftwareUpdateDocumentationMetadata)documentationMetadata
{
  return (HMSoftwareUpdateDocumentationMetadata *)objc_getProperty(self, a2, 40, 1);
}

- (double)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (float)percentageComplete
{
  return self->_percentageComplete;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (NSArray)attributeDescriptions
{
  v26[7] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v25 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMSoftwareUpdateV2 status](self, "status"));
  v24 = (void *)[v3 initWithName:@"status" value:v25];
  v26[0] = v24;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v23 = [(HMSoftwareUpdateV2 *)self error];
  v22 = (void *)[v4 initWithName:@"error" value:v23];
  v26[1] = v22;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v21 = [(HMSoftwareUpdateV2 *)self documentationMetadata];
  v6 = (void *)[v5 initWithName:@"documentationMetadata" value:v21];
  v26[2] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMSoftwareUpdateV2 *)self version];
  v9 = (void *)[v7 initWithName:@"version" value:v8];
  v26[3] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMSoftwareUpdateV2 downloadSize](self, "downloadSize"));
  v12 = (void *)[v10 initWithName:@"downloadSize" value:v11];
  v26[4] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  v14 = [(HMSoftwareUpdateV2 *)self humanReadableUpdateName];
  v15 = (void *)[v13 initWithName:@"humanReadableUpdateName" value:v14];
  v26[5] = v15;
  id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSoftwareUpdateV2 rampFeatureEnabledOnServer](self, "rampFeatureEnabledOnServer"));
  v18 = (void *)[v16 initWithName:@"rampFeatureEnabledOnServer" value:v17];
  v26[6] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:7];

  return (NSArray *)v19;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMSoftwareUpdateV2 *)a3;
  if (self == v4)
  {
    LOBYTE(v22) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    v6 = v5;
    if (!v6) {
      goto LABEL_13;
    }
    int64_t v7 = [(HMSoftwareUpdateV2 *)self status];
    if (v7 != [(HMSoftwareUpdateV2 *)v6 status]) {
      goto LABEL_13;
    }
    v8 = [(HMSoftwareUpdateV2 *)self error];
    v9 = [(HMSoftwareUpdateV2 *)v6 error];
    int v10 = HMFEqualObjects();

    if (!v10) {
      goto LABEL_13;
    }
    v11 = [(HMSoftwareUpdateV2 *)self documentationMetadata];
    v12 = [(HMSoftwareUpdateV2 *)v6 documentationMetadata];
    int v13 = HMFEqualObjects();

    if (!v13) {
      goto LABEL_13;
    }
    v14 = [(HMSoftwareUpdateV2 *)self version];
    v15 = [(HMSoftwareUpdateV2 *)v6 version];
    int v16 = HMFEqualObjects();

    if (!v16) {
      goto LABEL_13;
    }
    unint64_t v17 = [(HMSoftwareUpdateV2 *)self downloadSize];
    if (v17 != [(HMSoftwareUpdateV2 *)v6 downloadSize]) {
      goto LABEL_13;
    }
    v18 = [(HMSoftwareUpdateV2 *)self humanReadableUpdateName];
    v19 = [(HMSoftwareUpdateV2 *)v6 humanReadableUpdateName];
    int v20 = HMFEqualObjects();

    if (v20)
    {
      BOOL v21 = [(HMSoftwareUpdateV2 *)self rampFeatureEnabledOnServer];
      BOOL v22 = v21 ^ [(HMSoftwareUpdateV2 *)v6 rampFeatureEnabledOnServer] ^ 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v22) = 0;
    }
  }
  return v22;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMSoftwareUpdateV2 status](self, "status"));
  uint64_t v4 = [v3 hash];
  id v5 = [(HMSoftwareUpdateV2 *)self error];
  uint64_t v6 = [v5 hash];
  int64_t v7 = [(HMSoftwareUpdateV2 *)self documentationMetadata];
  uint64_t v8 = v6 ^ [v7 hash];
  v9 = [(HMSoftwareUpdateV2 *)self version];
  uint64_t v10 = v8 ^ [v9 hash] ^ v4;
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMSoftwareUpdateV2 downloadSize](self, "downloadSize"));
  uint64_t v12 = [v11 hash];
  int v13 = [(HMSoftwareUpdateV2 *)self humanReadableUpdateName];
  uint64_t v14 = v10 ^ v12 ^ [v13 hash];
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[HMSoftwareUpdateV2 rampFeatureEnabledOnServer](self, "rampFeatureEnabledOnServer"));
  unint64_t v16 = v14 ^ [v15 hash];

  return v16;
}

- (HMSoftwareUpdateV2)initWithStatus:(int64_t)a3 error:(id)a4 documentationMetadata:(id)a5 version:(id)a6 downloadSize:(unint64_t)a7 humanReadableUpdateName:(id)a8 rampFeatureEnabledOnServer:(BOOL)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HMSoftwareUpdateV2;
  v19 = [(HMSoftwareUpdateV2 *)&v25 init];
  int v20 = v19;
  if (v19)
  {
    v19->_status = a3;
    objc_storeStrong((id *)&v19->_error, a4);
    objc_storeStrong((id *)&v20->_documentationMetadata, a5);
    objc_storeStrong((id *)&v20->_version, a6);
    v20->_downloadSize = a7;
    uint64_t v21 = [v18 copy];
    humanReadableUpdateName = v20->_humanReadableUpdateName;
    v20->_humanReadableUpdateName = (NSString *)v21;

    v20->_rampFeatureEnabledOnServer = a9;
  }

  return v20;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)softwareUpdateFromDescriptor:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = [HMSoftwareUpdateV2 alloc];
    uint64_t v5 = [v3 status];
    uint64_t v6 = [v3 error];
    int64_t v7 = [v3 documentationMetadata];
    uint64_t v8 = [v3 version];
    v9 = [v3 downloadSize];
    uint64_t v10 = [v9 unsignedIntValue];
    v11 = [v3 humanReadableUpdateName];
    uint64_t v12 = [v3 rampFeatureEnabledOnServer];

    LOBYTE(v15) = [v12 BOOLValue];
    int v13 = [(HMSoftwareUpdateV2 *)v4 initWithStatus:v5 error:v6 documentationMetadata:v7 version:v8 downloadSize:v10 humanReadableUpdateName:v11 rampFeatureEnabledOnServer:v15];
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

@end