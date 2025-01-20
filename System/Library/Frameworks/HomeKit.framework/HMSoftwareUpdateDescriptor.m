@interface HMSoftwareUpdateDescriptor
+ (id)descriptorFromEvent:(id)a3;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMFSoftwareVersion)version;
- (HMSoftwareUpdateDescriptor)initWithProtoPayload:(id)a3;
- (HMSoftwareUpdateDescriptor)initWithStatus:(int64_t)a3 downloadSize:(id)a4 humanReadableUpdateName:(id)a5 rampEnabled:(id)a6 errorCode:(id)a7 serverAssetURL:(id)a8 serverAssetAlgorithm:(id)a9 serverAssetMeasurement:(id)a10 majorVersion:(id)a11 minorVersion:(id)a12 updateVersion:(id)a13 buildVersion:(id)a14 softwareVersionRequiresMetadata:(BOOL)a15;
- (HMSoftwareUpdateDescriptor)initWithStatus:(int64_t)a3 error:(id)a4 documentationMetadata:(id)a5 version:(id)a6 downloadSize:(id)a7 humanReadableUpdateName:(id)a8 rampFeatureEnabledOnServer:(id)a9;
- (HMSoftwareUpdateDocumentationMetadata)documentationMetadata;
- (NSError)error;
- (NSNumber)downloadSize;
- (NSNumber)rampFeatureEnabledOnServer;
- (NSString)humanReadableUpdateName;
- (id)attributeDescriptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)protoPayload;
- (id)shortDescription;
- (int64_t)status;
- (unint64_t)hash;
- (void)setRampFeatureEnabledOnServer:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation HMSoftwareUpdateDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rampFeatureEnabledOnServer, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);
  objc_storeStrong((id *)&self->_downloadSize, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_documentationMetadata, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setRampFeatureEnabledOnServer:(id)a3
{
}

- (NSNumber)rampFeatureEnabledOnServer
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)humanReadableUpdateName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)downloadSize
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (HMFSoftwareVersion)version
{
  return (HMFSoftwareVersion *)objc_getProperty(self, a2, 32, 1);
}

- (HMSoftwareUpdateDocumentationMetadata)documentationMetadata
{
  return (HMSoftwareUpdateDocumentationMetadata *)objc_getProperty(self, a2, 24, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (id)attributeDescriptions
{
  v26[7] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v25 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMSoftwareUpdateDescriptor status](self, "status"));
  v24 = (void *)[v3 initWithName:@"status" value:v25];
  v26[0] = v24;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v23 = [(HMSoftwareUpdateDescriptor *)self error];
  v22 = (void *)[v4 initWithName:@"error" value:v23];
  v26[1] = v22;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v21 = [(HMSoftwareUpdateDescriptor *)self documentationMetadata];
  v6 = (void *)[v5 initWithName:@"documentationMetadata" value:v21];
  v26[2] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMSoftwareUpdateDescriptor *)self version];
  v9 = (void *)[v7 initWithName:@"version" value:v8];
  v26[3] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMSoftwareUpdateDescriptor *)self downloadSize];
  v12 = (void *)[v10 initWithName:@"downloadSize" value:v11];
  v26[4] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  v14 = [(HMSoftwareUpdateDescriptor *)self humanReadableUpdateName];
  v15 = (void *)[v13 initWithName:@"humanReadableUpdateName" value:v14];
  v26[5] = v15;
  id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
  v17 = [(HMSoftwareUpdateDescriptor *)self rampFeatureEnabledOnServer];
  v18 = (void *)[v16 initWithName:@"rampFeatureEnabledOnServer" value:v17];
  v26[6] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:7];

  return v19;
}

- (id)description
{
  return (id)MEMORY[0x1F411CB90](self, a2);
}

- (id)shortDescription
{
  v2 = objc_opt_class();

  return (id)[v2 shortDescription];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HMSoftwareUpdateDescriptor alloc];
  id v5 = [(HMSoftwareUpdateDescriptor *)self protoPayload];
  v6 = [(HMSoftwareUpdateDescriptor *)v4 initWithProtoPayload:v5];

  return v6;
}

- (unint64_t)hash
{
  int64_t v3 = [(HMSoftwareUpdateDescriptor *)self status];
  id v4 = [(HMSoftwareUpdateDescriptor *)self downloadSize];
  uint64_t v5 = [v4 unsignedIntegerValue] ^ v3;
  v6 = [(HMSoftwareUpdateDescriptor *)self version];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_12;
  }
  unint64_t v7 = [(HMSoftwareUpdateDescriptor *)self version];
  v8 = [v6 version];
  int v9 = HMFEqualObjects();

  if (!v9) {
    goto LABEL_12;
  }
  int64_t v10 = [(HMSoftwareUpdateDescriptor *)self status];
  if (v10 != [v6 status]) {
    goto LABEL_12;
  }
  v11 = [(HMSoftwareUpdateDescriptor *)self documentationMetadata];
  v12 = [v6 documentationMetadata];
  int v13 = HMFEqualObjects();

  if (!v13) {
    goto LABEL_12;
  }
  v14 = [(HMSoftwareUpdateDescriptor *)self downloadSize];
  v15 = [v6 downloadSize];
  int v16 = HMFEqualObjects();

  if (!v16) {
    goto LABEL_12;
  }
  v17 = [(HMSoftwareUpdateDescriptor *)self humanReadableUpdateName];
  v18 = [v6 humanReadableUpdateName];
  int v19 = HMFEqualObjects();

  if (!v19) {
    goto LABEL_12;
  }
  v20 = [(HMSoftwareUpdateDescriptor *)self rampFeatureEnabledOnServer];
  v21 = [v6 rampFeatureEnabledOnServer];
  int v22 = HMFEqualObjects();

  if (v22)
  {
    v23 = [(HMSoftwareUpdateDescriptor *)self error];
    v24 = [v6 error];
    char v25 = HMFEqualObjects();
  }
  else
  {
LABEL_12:
    char v25 = 0;
  }

  return v25;
}

- (HMSoftwareUpdateDescriptor)initWithStatus:(int64_t)a3 downloadSize:(id)a4 humanReadableUpdateName:(id)a5 rampEnabled:(id)a6 errorCode:(id)a7 serverAssetURL:(id)a8 serverAssetAlgorithm:(id)a9 serverAssetMeasurement:(id)a10 majorVersion:(id)a11 minorVersion:(id)a12 updateVersion:(id)a13 buildVersion:(id)a14 softwareVersionRequiresMetadata:(BOOL)a15
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v47 = a4;
  id v50 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v54 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  v27 = v26;
  v52 = v21;
  v53 = v20;
  v48 = v23;
  if (v26 && v25 && v24 && v54 && v21 && v22 && v23)
  {
    uint64_t v28 = HMFDigestAlgorithmFromString();
    if (v28)
    {
      v29 = (void *)[objc_alloc(MEMORY[0x1E4F65418]) initWithAlgorithm:v28 value:v23];
      v30 = [[HMSoftwareUpdateDocumentationMetadata alloc] initWithURL:v21 digest:v29];
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F65558]), "initWithMajorVersion:minorVersion:updateVersion:buildVersion:", objc_msgSend(v54, "unsignedIntValue"), objc_msgSend(v24, "unsignedIntValue"), objc_msgSend(v25, "unsignedIntValue"), v27);
    }
    else
    {
      v38 = (void *)MEMORY[0x19F3A64A0]();
      v39 = self;
      v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v56 = v41;
        __int16 v57 = 2112;
        id v58 = v22;
        _os_log_impl(&dword_19D1A8000, v40, OS_LOG_TYPE_ERROR, "%{public}@Invalid algorithm string: %@", buf, 0x16u);
      }
      v31 = 0;
      v30 = 0;
    }
    v32 = v47;
    id v20 = v53;
  }
  else
  {
    v31 = 0;
    if (v26)
    {
      v32 = v47;
      if (v25 && v24 && v54)
      {
        v30 = 0;
        if (!a15)
        {
          id v33 = objc_alloc(MEMORY[0x1E4F65558]);
          uint64_t v34 = [v54 unsignedIntValue];
          uint64_t v35 = [v24 unsignedIntValue];
          unsigned int v36 = [v25 unsignedIntValue];
          uint64_t v37 = v34;
          id v20 = v53;
          v31 = (void *)[v33 initWithMajorVersion:v37 minorVersion:v35 updateVersion:v36 buildVersion:v27];
          v30 = 0;
        }
      }
      else
      {
        v30 = 0;
      }
    }
    else
    {
      v30 = 0;
      v32 = v47;
    }
  }
  if (v20 && ((unint64_t v42 = [v20 integerValue], v42 > 0x3B) ? (v43 = -1) : (v43 = v42), v43))
  {
    v44 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMSoftwareUpdateV2ErrorDomain" code:v43 userInfo:0];
  }
  else
  {
    v44 = 0;
  }
  v45 = [(HMSoftwareUpdateDescriptor *)self initWithStatus:a3 error:v44 documentationMetadata:v30 version:v31 downloadSize:v32 humanReadableUpdateName:v50 rampFeatureEnabledOnServer:v19];

  return v45;
}

- (HMSoftwareUpdateDescriptor)initWithProtoPayload:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasStatus])
  {
    uint64_t v26 = [v4 status];
    int v30 = [v4 hasDownloadSize];
    if (v30)
    {
      unsigned int v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "downloadSize"));
    }
    else
    {
      unsigned int v36 = 0;
    }
    int v29 = [v4 hasHumanReadableUpdateName];
    if (v29)
    {
      uint64_t v35 = [v4 humanReadableUpdateName];
    }
    else
    {
      uint64_t v35 = 0;
    }
    int v28 = [v4 hasRampEnabled];
    if (v28)
    {
      uint64_t v34 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "rampEnabled"));
    }
    else
    {
      uint64_t v34 = 0;
    }
    int v27 = [v4 hasErrorCode];
    if (v27)
    {
      id v33 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "errorCode"));
    }
    else
    {
      id v33 = 0;
    }
    int v25 = [v4 hasServerAssetURL];
    if (v25)
    {
      int64_t v10 = (void *)MEMORY[0x1E4F1CB10];
      id v22 = [v4 serverAssetURL];
      v11 = objc_msgSend(v10, "URLWithString:");
    }
    else
    {
      v11 = 0;
    }
    int v24 = [v4 hasServerAssetAlgorithm];
    if (v24)
    {
      v32 = [v4 serverAssetAlgorithm];
    }
    else
    {
      v32 = 0;
    }
    int v23 = [v4 hasServerAssetMeasurement];
    if (v23)
    {
      v31 = [v4 serverAssetMeasurement];
    }
    else
    {
      v31 = 0;
    }
    int v12 = [v4 hasMajorVersion];
    if (v12)
    {
      int v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "majorVersion"));
    }
    else
    {
      int v13 = 0;
    }
    int v14 = [v4 hasMinorVersion];
    if (v14)
    {
      v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "minorVersion"));
    }
    else
    {
      v15 = 0;
    }
    int v16 = [v4 hasUpdateVersion];
    if (v16)
    {
      v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "updateVersion"));
    }
    else
    {
      v17 = 0;
    }
    if ([v4 hasBuildVersion])
    {
      [v4 buildVersion];
      id v19 = v18 = v11;
      LOBYTE(v21) = 0;
      id v6 = [(HMSoftwareUpdateDescriptor *)self initWithStatus:v26 downloadSize:v36 humanReadableUpdateName:v35 rampEnabled:v34 errorCode:v33 serverAssetURL:v18 serverAssetAlgorithm:v32 serverAssetMeasurement:v31 majorVersion:v13 minorVersion:v15 updateVersion:v17 buildVersion:v19 softwareVersionRequiresMetadata:v21];

      v11 = v18;
      if (!v16)
      {
LABEL_40:
        if (v14)
        {

          if (!v12) {
            goto LABEL_43;
          }
        }
        else if (!v12)
        {
LABEL_43:
          if (v23) {

          }
          if (v24) {
          if (v25)
          }
          {
          }
          if (v27) {

          }
          if (v28) {
          if (v29)
          }

          if (v30) {
          int v9 = v6;
          }
          goto LABEL_58;
        }

        goto LABEL_43;
      }
    }
    else
    {
      LOBYTE(v21) = 0;
      id v6 = [(HMSoftwareUpdateDescriptor *)self initWithStatus:v26 downloadSize:v36 humanReadableUpdateName:v35 rampEnabled:v34 errorCode:v33 serverAssetURL:v11 serverAssetAlgorithm:v32 serverAssetMeasurement:v31 majorVersion:v13 minorVersion:v15 updateVersion:v17 buildVersion:0 softwareVersionRequiresMetadata:v21];
      if (!v16) {
        goto LABEL_40;
      }
    }

    goto LABEL_40;
  }
  uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  unint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v38 = v8;
    __int16 v39 = 2112;
    id v40 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Proto payload HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor is missing data: %@", buf, 0x16u);
  }
  int v9 = 0;
LABEL_58:

  return v9;
}

- (id)protoPayload
{
  int64_t v3 = objc_alloc_init(HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor);
  [(HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *)v3 setStatus:[(HMSoftwareUpdateDescriptor *)self status]];
  id v4 = [(HMSoftwareUpdateDescriptor *)self downloadSize];

  if (v4)
  {
    uint64_t v5 = [(HMSoftwareUpdateDescriptor *)self downloadSize];
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setDownloadSize:](v3, "setDownloadSize:", [v5 unsignedLongLongValue]);
  }
  id v6 = [(HMSoftwareUpdateDescriptor *)self humanReadableUpdateName];

  if (v6)
  {
    unint64_t v7 = [(HMSoftwareUpdateDescriptor *)self humanReadableUpdateName];
    [(HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *)v3 setHumanReadableUpdateName:v7];
  }
  v8 = [(HMSoftwareUpdateDescriptor *)self rampFeatureEnabledOnServer];

  if (v8)
  {
    int v9 = [(HMSoftwareUpdateDescriptor *)self rampFeatureEnabledOnServer];
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setRampEnabled:](v3, "setRampEnabled:", [v9 BOOLValue]);
  }
  int64_t v10 = [(HMSoftwareUpdateDescriptor *)self error];

  if (v10)
  {
    v11 = [(HMSoftwareUpdateDescriptor *)self error];
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setErrorCode:](v3, "setErrorCode:", [v11 code]);
  }
  int v12 = [(HMSoftwareUpdateDescriptor *)self documentationMetadata];

  if (v12)
  {
    int v13 = [(HMSoftwareUpdateDescriptor *)self documentationMetadata];
    int v14 = [v13 URL];
    v15 = [v14 absoluteString];
    [(HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *)v3 setServerAssetURL:v15];

    int v16 = [(HMSoftwareUpdateDescriptor *)self documentationMetadata];
    v17 = [v16 digest];
    [v17 algorithm];
    v18 = HMFDigestAlgorithmToString();
    [(HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *)v3 setServerAssetAlgorithm:v18];

    id v19 = [(HMSoftwareUpdateDescriptor *)self documentationMetadata];
    id v20 = [v19 digest];
    uint64_t v21 = [v20 value];
    [(HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *)v3 setServerAssetMeasurement:v21];
  }
  id v22 = [(HMSoftwareUpdateDescriptor *)self version];

  if (v22)
  {
    int v23 = [(HMSoftwareUpdateDescriptor *)self version];
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setMajorVersion:](v3, "setMajorVersion:", [v23 majorVersion]);

    int v24 = [(HMSoftwareUpdateDescriptor *)self version];
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setMinorVersion:](v3, "setMinorVersion:", [v24 minorVersion]);

    int v25 = [(HMSoftwareUpdateDescriptor *)self version];
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setUpdateVersion:](v3, "setUpdateVersion:", [v25 updateVersion]);

    uint64_t v26 = [(HMSoftwareUpdateDescriptor *)self version];
    int v27 = [v26 buildVersion];
    [(HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *)v3 setBuildVersion:v27];
  }

  return v3;
}

- (HMSoftwareUpdateDescriptor)initWithStatus:(int64_t)a3 error:(id)a4 documentationMetadata:(id)a5 version:(id)a6 downloadSize:(id)a7 humanReadableUpdateName:(id)a8 rampFeatureEnabledOnServer:(id)a9
{
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)HMSoftwareUpdateDescriptor;
  id v19 = [(HMSoftwareUpdateDescriptor *)&v27 init];
  id v20 = v19;
  if (v19)
  {
    v19->_status = a3;
    objc_storeStrong((id *)&v19->_error, a4);
    objc_storeStrong((id *)&v20->_documentationMetadata, a5);
    objc_storeStrong((id *)&v20->_version, a6);
    objc_storeStrong((id *)&v20->_downloadSize, a7);
    uint64_t v21 = [v17 copy];
    humanReadableUpdateName = v20->_humanReadableUpdateName;
    v20->_humanReadableUpdateName = (NSString *)v21;

    objc_storeStrong((id *)&v20->_rampFeatureEnabledOnServer, a9);
  }

  return v20;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)descriptorFromEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor alloc];
  id v6 = [v4 encodedData];
  unint64_t v7 = [(HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *)v5 initWithData:v6];

  if (v7)
  {
    v8 = [[HMSoftwareUpdateDescriptor alloc] initWithProtoPayload:v7];
  }
  else
  {
    int v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = a1;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      int v14 = 138543618;
      v15 = v12;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor from event: %@", (uint8_t *)&v14, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

@end