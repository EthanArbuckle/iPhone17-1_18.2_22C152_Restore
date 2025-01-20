@interface HMITorsoAnnotation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMIFaceRecognition)faceRecognition;
- (HMITorsoAnnotation)initWithCoder:(id)a3;
- (HMITorsoAnnotation)initWithFaceRecognition:(id)a3 torsoprints:(id)a4;
- (HMITorsoAnnotation)initWithFaceRecognition:(id)a3 torsoprints:(id)a4 torsoModelVersion:(id)a5;
- (NSArray)torsoprints;
- (NSUUID)torsoModelVersion;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMITorsoAnnotation

- (HMITorsoAnnotation)initWithFaceRecognition:(id)a3 torsoprints:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[HMITorsoprinter currentModelUUID];
  v9 = [(HMITorsoAnnotation *)self initWithFaceRecognition:v7 torsoprints:v6 torsoModelVersion:v8];

  return v9;
}

- (HMITorsoAnnotation)initWithFaceRecognition:(id)a3 torsoprints:(id)a4 torsoModelVersion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v10)
  {
LABEL_7:
    v16 = (HMITorsoAnnotation *)_HMFPreconditionFailure();
    return (HMITorsoAnnotation *)[(HMITorsoAnnotation *)v16 isEqual:v18];
  }
  v12 = v11;
  v19.receiver = self;
  v19.super_class = (Class)HMITorsoAnnotation;
  v13 = [(HMITorsoAnnotation *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_faceRecognition, a3);
    objc_storeStrong((id *)&v14->_torsoprints, a4);
    objc_storeStrong((id *)&v14->_torsoModelVersion, a5);
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    id v7 = [(HMITorsoAnnotation *)self faceRecognition];
    v8 = [v6 faceRecognition];
    if ([v7 isEqual:v8])
    {
      id v9 = [(HMITorsoAnnotation *)self torsoprints];
      id v10 = [v6 torsoprints];
      if ([v9 isEqualToArray:v10])
      {
        id v11 = [(HMITorsoAnnotation *)self torsoModelVersion];
        v12 = [v6 torsoModelVersion];
        char v13 = [v11 isEqual:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(HMITorsoAnnotation *)self torsoprints];
  uint64_t v4 = [v3 hash];
  v5 = [(HMITorsoAnnotation *)self faceRecognition];
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
  v5 = [(HMITorsoAnnotation *)self faceRecognition];
  [v4 encodeObject:v5 forKey:@"HMITA.ck.fr"];

  unint64_t v6 = [(HMITorsoAnnotation *)self torsoprints];
  [v4 encodeObject:v6 forKey:@"HMITA.ck.tps"];

  id v7 = [(HMITorsoAnnotation *)self torsoModelVersion];
  [v4 encodeObject:v7 forKey:@"HMITA.ck.tmv"];
}

- (HMITorsoAnnotation)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMITA.ck.fr"];
  unint64_t v6 = (void *)MEMORY[0x263EFFA08];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v8 = [v6 setWithArray:v7];
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HMITA.ck.tps"];

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMITA.ck.tmv"];
  id v11 = (void *)v10;
  if (v5 && v9 && v10)
  {
    v12 = [(HMITorsoAnnotation *)self initWithFaceRecognition:v5 torsoprints:v9 torsoModelVersion:v10];
    char v13 = v12;
  }
  else
  {
    v14 = (void *)MEMORY[0x22A641C70]();
    v12 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v18 = 138544130;
      objc_super v19 = v16;
      __int16 v20 = 2112;
      v21 = v5;
      __int16 v22 = 2112;
      v23 = v9;
      __int16 v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_225DC6000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded faceRecognition: %@ torsoprints: %@ torsoModelVersion: %@", (uint8_t *)&v18, 0x2Au);
    }
    char v13 = 0;
  }

  return v13;
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id v4 = [(HMITorsoAnnotation *)self faceRecognition];
  v5 = (void *)[v3 initWithName:@"Face Recognition" value:v4];
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  id v7 = [(HMITorsoAnnotation *)self torsoprints];
  v8 = (void *)[v6 initWithName:@"Torsoprints" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v10 = [(HMITorsoAnnotation *)self torsoModelVersion];
  id v11 = (void *)[v9 initWithName:@"TorsoModelVersion" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];

  return v12;
}

- (HMIFaceRecognition)faceRecognition
{
  return (HMIFaceRecognition *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)torsoprints
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)torsoModelVersion
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoModelVersion, 0);
  objc_storeStrong((id *)&self->_torsoprints, 0);
  objc_storeStrong((id *)&self->_faceRecognition, 0);
}

@end