@interface HMUserActionPrediction
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqual:(id)a3 ignoreScore:(BOOL)a4 ignoreGroupProperties:(BOOL)a5;
- (BOOL)isEqualIgnoringScore:(id)a3;
- (BOOL)isEqualIgnoringScoreAndGroupProperties:(id)a3;
- (HMUserActionPrediction)initWithCoder:(id)a3;
- (HMUserActionPrediction)initWithPredictionTargetUUID:(id)a3 predictionType:(unint64_t)a4 predictionScore:(double)a5;
- (HMUserActionPrediction)initWithPredictionTargetUUID:(id)a3 targetServiceUUID:(id)a4 predictionType:(unint64_t)a5 predictionScore:(double)a6;
- (HMUserActionPrediction)initWithPredictionTargetUUID:(id)a3 targetServiceUUID:(id)a4 targetGroupUUID:(id)a5 targetGroupType:(unint64_t)a6 predictionType:(unint64_t)a7 predictionScore:(double)a8;
- (HMUserActionPrediction)initWithPredictionTargetUUID:(id)a3 targetServiceUUID:(id)a4 targetServiceGroupUUID:(id)a5 predictionType:(unint64_t)a6 predictionScore:(double)a7;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)predictionTargetUUID;
- (NSUUID)targetGroupUUID;
- (NSUUID)targetServiceUUID;
- (double)predictionScore;
- (id)copyRemovingGroup;
- (unint64_t)hash;
- (unint64_t)predictionType;
- (unint64_t)targetGroupType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMUserActionPrediction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetGroupUUID, 0);
  objc_storeStrong((id *)&self->_targetServiceUUID, 0);

  objc_storeStrong((id *)&self->_predictionTargetUUID, 0);
}

- (unint64_t)targetGroupType
{
  return self->_targetGroupType;
}

- (NSUUID)targetGroupUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (double)predictionScore
{
  return self->_predictionScore;
}

- (unint64_t)predictionType
{
  return self->_predictionType;
}

- (NSUUID)targetServiceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)predictionTargetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v27[6] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v26 = [(HMUserActionPrediction *)self predictionTargetUUID];
  v25 = [MEMORY[0x1E4F65538] defaultFormatter];
  v24 = (void *)[v3 initWithName:@"predictionTargetUUID" value:v26 options:0 formatter:v25];
  v27[0] = v24;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v23 = [(HMUserActionPrediction *)self targetServiceUUID];
  v22 = [MEMORY[0x1E4F65538] defaultFormatter];
  v21 = (void *)[v4 initWithName:@"targetServiceUUID" value:v23 options:0 formatter:v22];
  v27[1] = v21;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v6 = [(HMUserActionPrediction *)self targetGroupUUID];
  v7 = [MEMORY[0x1E4F65538] defaultFormatter];
  v8 = (void *)[v5 initWithName:@"targetGroupUUID" value:v6 options:0 formatter:v7];
  v27[2] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMUserActionPrediction predictionType](self, "predictionType"));
  v11 = (void *)[v9 initWithName:@"predictionType" value:v10];
  v27[3] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMUserActionPrediction targetGroupType](self, "targetGroupType"));
  v14 = (void *)[v12 initWithName:@"predictionGroupType" value:v13];
  v27[4] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  v16 = NSNumber;
  [(HMUserActionPrediction *)self predictionScore];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  v18 = (void *)[v15 initWithName:@"predictionScore" value:v17];
  v27[5] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:6];

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

- (HMUserActionPrediction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.UAPT.ck.pt"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.UAPT.ck.ts"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.UAPT.ck.tsg"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.UAPT.ck.pty"];
  uint64_t v9 = [v8 unsignedIntValue];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.UAPT.ck.tgt"];
  uint64_t v11 = [v10 unsignedIntValue];

  id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.UAPT.ck.ps"];

  [v12 doubleValue];
  double v14 = v13;

  id v15 = [(HMUserActionPrediction *)self initWithPredictionTargetUUID:v5 targetServiceUUID:v6 targetGroupUUID:v7 targetGroupType:v11 predictionType:v9 predictionScore:v14];
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMUserActionPrediction *)self predictionTargetUUID];
  [v4 encodeObject:v5 forKey:@"HM.UAPT.ck.pt"];

  v6 = [(HMUserActionPrediction *)self targetServiceUUID];
  [v4 encodeObject:v6 forKey:@"HM.UAPT.ck.ts"];

  v7 = [(HMUserActionPrediction *)self targetGroupUUID];
  [v4 encodeObject:v7 forKey:@"HM.UAPT.ck.tsg"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMUserActionPrediction predictionType](self, "predictionType"));
  [v4 encodeObject:v8 forKey:@"HM.UAPT.ck.pty"];

  uint64_t v9 = NSNumber;
  [(HMUserActionPrediction *)self predictionScore];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  [v4 encodeObject:v10 forKey:@"HM.UAPT.ck.ps"];

  uint64_t v11 = NSNumber;
  [(HMUserActionPrediction *)self predictionScore];
  objc_msgSend(v11, "numberWithDouble:");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"HM.UAPT.ck.tgt"];
}

- (unint64_t)hash
{
  id v3 = [(HMUserActionPrediction *)self predictionTargetUUID];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(HMUserActionPrediction *)self predictionType] ^ v4;
  v6 = [(HMUserActionPrediction *)self targetServiceUUID];
  uint64_t v7 = [v6 hash];
  v8 = [(HMUserActionPrediction *)self targetGroupUUID];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  unint64_t v10 = v9 ^ [(HMUserActionPrediction *)self targetGroupType];
  uint64_t v11 = NSNumber;
  [(HMUserActionPrediction *)self predictionScore];
  id v12 = objc_msgSend(v11, "numberWithDouble:");
  unint64_t v13 = v10 ^ [v12 hash];

  return v13;
}

- (BOOL)isEqual:(id)a3 ignoreScore:(BOOL)a4 ignoreGroupProperties:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = (HMUserActionPrediction *)a3;
  if (v8 == self)
  {
    BOOL v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    unint64_t v10 = v9;
    if (!v10) {
      goto LABEL_16;
    }
    uint64_t v11 = [(HMUserActionPrediction *)self targetGroupUUID];
    id v12 = [(HMUserActionPrediction *)v10 targetGroupUUID];
    int v13 = HMFEqualObjects();

    if (v13)
    {
      unint64_t v14 = [(HMUserActionPrediction *)self targetGroupType];
      BOOL v15 = v14 == [(HMUserActionPrediction *)v10 targetGroupType];
    }
    else
    {
      BOOL v15 = 0;
    }
    v17 = [(HMUserActionPrediction *)self predictionTargetUUID];
    v18 = [(HMUserActionPrediction *)v10 predictionTargetUUID];
    int v19 = HMFEqualObjects();

    if (v19)
    {
      v20 = [(HMUserActionPrediction *)self targetServiceUUID];
      v21 = [(HMUserActionPrediction *)v10 targetServiceUUID];
      int v22 = HMFEqualObjects();

      BOOL v16 = 0;
      if (v22)
      {
        if (v5 || v15)
        {
          unint64_t v23 = [(HMUserActionPrediction *)self predictionType];
          uint64_t v24 = [(HMUserActionPrediction *)v10 predictionType];
          BOOL v16 = v23 == v24;
          if (v23 == v24 && !a4)
          {
            [(HMUserActionPrediction *)self predictionScore];
            double v26 = v25;
            [(HMUserActionPrediction *)v10 predictionScore];
            BOOL v16 = vabdd_f64(v26, v27) < 2.22044605e-16;
          }
        }
      }
    }
    else
    {
LABEL_16:
      BOOL v16 = 0;
    }
  }
  return v16;
}

- (BOOL)isEqualIgnoringScoreAndGroupProperties:(id)a3
{
  return [(HMUserActionPrediction *)self isEqual:a3 ignoreScore:1 ignoreGroupProperties:1];
}

- (BOOL)isEqualIgnoringScore:(id)a3
{
  return [(HMUserActionPrediction *)self isEqual:a3 ignoreScore:1 ignoreGroupProperties:0];
}

- (BOOL)isEqual:(id)a3
{
  return [(HMUserActionPrediction *)self isEqual:a3 ignoreScore:0 ignoreGroupProperties:0];
}

- (id)copyRemovingGroup
{
  id v3 = [HMUserActionPrediction alloc];
  uint64_t v4 = [(HMUserActionPrediction *)self predictionTargetUUID];
  BOOL v5 = [(HMUserActionPrediction *)self targetServiceUUID];
  unint64_t v6 = [(HMUserActionPrediction *)self predictionType];
  [(HMUserActionPrediction *)self predictionScore];
  uint64_t v7 = -[HMUserActionPrediction initWithPredictionTargetUUID:targetServiceUUID:predictionType:predictionScore:](v3, "initWithPredictionTargetUUID:targetServiceUUID:predictionType:predictionScore:", v4, v5, v6);

  return v7;
}

- (HMUserActionPrediction)initWithPredictionTargetUUID:(id)a3 targetServiceUUID:(id)a4 targetGroupUUID:(id)a5 targetGroupType:(unint64_t)a6 predictionType:(unint64_t)a7 predictionScore:(double)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HMUserActionPrediction;
  v17 = [(HMUserActionPrediction *)&v25 init];
  if (v17)
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v14);
    predictionTargetUUID = v17->_predictionTargetUUID;
    v17->_predictionTargetUUID = (NSUUID *)v18;

    v17->_predictionType = a7;
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v15);
    targetServiceUUID = v17->_targetServiceUUID;
    v17->_targetServiceUUID = (NSUUID *)v20;

    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v16);
    targetGroupUUID = v17->_targetGroupUUID;
    v17->_targetGroupUUID = (NSUUID *)v22;

    v17->_targetGroupType = a6;
    v17->_predictionScore = a8;
  }

  return v17;
}

- (HMUserActionPrediction)initWithPredictionTargetUUID:(id)a3 targetServiceUUID:(id)a4 targetServiceGroupUUID:(id)a5 predictionType:(unint64_t)a6 predictionScore:(double)a7
{
  return [(HMUserActionPrediction *)self initWithPredictionTargetUUID:a3 targetServiceUUID:a4 targetGroupUUID:a5 targetGroupType:1 predictionType:a6 predictionScore:a7];
}

- (HMUserActionPrediction)initWithPredictionTargetUUID:(id)a3 targetServiceUUID:(id)a4 predictionType:(unint64_t)a5 predictionScore:(double)a6
{
  return [(HMUserActionPrediction *)self initWithPredictionTargetUUID:a3 targetServiceUUID:a4 targetGroupUUID:0 targetGroupType:0 predictionType:a5 predictionScore:a6];
}

- (HMUserActionPrediction)initWithPredictionTargetUUID:(id)a3 predictionType:(unint64_t)a4 predictionScore:(double)a5
{
  return [(HMUserActionPrediction *)self initWithPredictionTargetUUID:a3 targetServiceUUID:0 targetGroupUUID:0 targetGroupType:0 predictionType:a4 predictionScore:a5];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1 != -1) {
    dispatch_once(&logCategory__hmf_once_t1, &__block_literal_global_11195);
  }
  v2 = (void *)logCategory__hmf_once_v2;

  return v2;
}

uint64_t __37__HMUserActionPrediction_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2;
  logCategory__hmf_once_v2 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end