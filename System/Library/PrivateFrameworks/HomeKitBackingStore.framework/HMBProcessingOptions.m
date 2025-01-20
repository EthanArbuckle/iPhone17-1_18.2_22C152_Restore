@interface HMBProcessingOptions
+ (BOOL)supportsSecureCoding;
+ (id)optionsWithLabel:(id)a3;
- (BOOL)disallowsCellularAccessForMirrorOutput;
- (BOOL)disallowsModelCreation;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresModelCreation;
- (BOOL)shouldEnqueueMirrorOutput;
- (BOOL)shouldRollBackIfMirrorOutputFails;
- (HMBProcessingOptions)initWithCoder:(id)a3;
- (HMBProcessingOptions)initWithLabel:(id)a3;
- (HMFActivity)activity;
- (NSString)label;
- (id)attributeDescriptions;
- (int64_t)qualityOfService;
- (unint64_t)hash;
- (unint64_t)transactionItemsBatchLimit;
- (void)encodeWithCoder:(id)a3;
- (void)setActivity:(id)a3;
- (void)setDisallowsCellularAccessForMirrorOutput:(BOOL)a3;
- (void)setDisallowsModelCreation:(BOOL)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRequiresModelCreation:(BOOL)a3;
- (void)setShouldEnqueueMirrorOutput:(BOOL)a3;
- (void)setShouldRollBackIfMirrorOutputFails:(BOOL)a3;
- (void)setTransactionItemsBatchLimit:(unint64_t)a3;
@end

@implementation HMBProcessingOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setDisallowsModelCreation:(BOOL)a3
{
  self->_disallowsModelCreation = a3;
}

- (BOOL)disallowsModelCreation
{
  return self->_disallowsModelCreation;
}

- (void)setRequiresModelCreation:(BOOL)a3
{
  self->_requiresModelCreation = a3;
}

- (BOOL)requiresModelCreation
{
  return self->_requiresModelCreation;
}

- (void)setTransactionItemsBatchLimit:(unint64_t)a3
{
  self->_transactionItemsBatchLimit = a3;
}

- (unint64_t)transactionItemsBatchLimit
{
  return self->_transactionItemsBatchLimit;
}

- (void)setActivity:(id)a3
{
}

- (HMFActivity)activity
{
  return self->_activity;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setDisallowsCellularAccessForMirrorOutput:(BOOL)a3
{
  self->_disallowsCellularAccessForMirrorOutput = a3;
}

- (BOOL)disallowsCellularAccessForMirrorOutput
{
  return self->_disallowsCellularAccessForMirrorOutput;
}

- (void)setShouldRollBackIfMirrorOutputFails:(BOOL)a3
{
  self->_shouldRollBackIfMirrorOutputFails = a3;
}

- (BOOL)shouldRollBackIfMirrorOutputFails
{
  return self->_shouldRollBackIfMirrorOutputFails;
}

- (void)setShouldEnqueueMirrorOutput:(BOOL)a3
{
  self->_shouldEnqueueMirrorOutput = a3;
}

- (BOOL)shouldEnqueueMirrorOutput
{
  return self->_shouldEnqueueMirrorOutput;
}

- (NSString)label
{
  return self->_label;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(HMBProcessingOptions *)self label];
  [v5 encodeObject:v4 forKey:@"HMBPBO.label"];

  objc_msgSend(v5, "encodeBool:forKey:", -[HMBProcessingOptions shouldEnqueueMirrorOutput](self, "shouldEnqueueMirrorOutput"), @"HMBPBO.enqueue");
  objc_msgSend(v5, "encodeInteger:forKey:", -[HMBProcessingOptions qualityOfService](self, "qualityOfService"), @"HMBPBO.qos");
  objc_msgSend(v5, "encodeBool:forKey:", -[HMBProcessingOptions shouldRollBackIfMirrorOutputFails](self, "shouldRollBackIfMirrorOutputFails"), @"HMBPBO.r");
  objc_msgSend(v5, "encodeBool:forKey:", -[HMBProcessingOptions disallowsCellularAccessForMirrorOutput](self, "disallowsCellularAccessForMirrorOutput"), @"HMBPBO.dca");
  objc_msgSend(v5, "encodeBool:forKey:", -[HMBProcessingOptions requiresModelCreation](self, "requiresModelCreation"), @"HMBPBO.rmc");
  objc_msgSend(v5, "encodeBool:forKey:", -[HMBProcessingOptions disallowsModelCreation](self, "disallowsModelCreation"), @"HMBPBO.dmc");
}

- (HMBProcessingOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBPBO.label"];
  v6 = [(HMBProcessingOptions *)self initWithLabel:v5];
  -[HMBProcessingOptions setShouldEnqueueMirrorOutput:](v6, "setShouldEnqueueMirrorOutput:", [v4 decodeBoolForKey:@"HMBPBO.enqueue"]);
  -[HMBProcessingOptions setQualityOfService:](v6, "setQualityOfService:", [v4 decodeIntegerForKey:@"HMBPBO.qos"]);
  -[HMBProcessingOptions setShouldRollBackIfMirrorOutputFails:](v6, "setShouldRollBackIfMirrorOutputFails:", [v4 decodeBoolForKey:@"HMBPBO.r"]);
  -[HMBProcessingOptions setDisallowsCellularAccessForMirrorOutput:](v6, "setDisallowsCellularAccessForMirrorOutput:", [v4 decodeBoolForKey:@"HMBPBO.dca"]);
  -[HMBProcessingOptions setRequiresModelCreation:](v6, "setRequiresModelCreation:", [v4 decodeBoolForKey:@"HMBPBO.rmc"]);
  uint64_t v7 = [v4 decodeBoolForKey:@"HMBPBO.dmc"];

  [(HMBProcessingOptions *)v6 setDisallowsModelCreation:v7];
  return v6;
}

- (unint64_t)hash
{
  v2 = [(HMBProcessingOptions *)self label];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    uint64_t v7 = [(HMBProcessingOptions *)self label];
    v8 = [v6 label];
    if ([v7 isEqualToString:v8]
      && (int v9 = [(HMBProcessingOptions *)self shouldEnqueueMirrorOutput],
          v9 == [v6 shouldEnqueueMirrorOutput])
      && (int64_t v10 = [(HMBProcessingOptions *)self qualityOfService],
          v10 == [v6 qualityOfService])
      && (int v11 = [(HMBProcessingOptions *)self shouldRollBackIfMirrorOutputFails],
          v11 == [v6 shouldRollBackIfMirrorOutputFails])
      && (int v12 = -[HMBProcessingOptions disallowsCellularAccessForMirrorOutput](self, "disallowsCellularAccessForMirrorOutput"), v12 == [v6 disallowsCellularAccessForMirrorOutput])&& (v13 = -[HMBProcessingOptions requiresModelCreation](self, "requiresModelCreation"), v13 == objc_msgSend(v6, "requiresModelCreation")))
    {
      BOOL v16 = [(HMBProcessingOptions *)self disallowsModelCreation];
      int v14 = v16 ^ [v6 disallowsModelCreation] ^ 1;
    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (id)attributeDescriptions
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v5 = [(HMBProcessingOptions *)self label];
  id v6 = (void *)[v4 initWithName:@"Label" value:v5];
  [v3 addObject:v6];

  if (![(HMBProcessingOptions *)self shouldEnqueueMirrorOutput])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMBProcessingOptions *)self shouldEnqueueMirrorOutput];
    v8 = HMFBooleanToString();
    int v9 = (void *)[v7 initWithName:@"Enqueue Mirror Output" value:v8];
    [v3 addObject:v9];
  }
  if ([(HMBProcessingOptions *)self shouldRollBackIfMirrorOutputFails])
  {
    id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMBProcessingOptions *)self shouldRollBackIfMirrorOutputFails];
    int v11 = HMFBooleanToString();
    int v12 = (void *)[v10 initWithName:@"Roll Back" value:v11];
    [v3 addObject:v12];
  }
  if ([(HMBProcessingOptions *)self disallowsCellularAccessForMirrorOutput])
  {
    id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMBProcessingOptions *)self disallowsCellularAccessForMirrorOutput];
    int v14 = HMFBooleanToString();
    v15 = (void *)[v13 initWithName:@"Disallow Cellular" value:v14];
    [v3 addObject:v15];
  }
  if ([(HMBProcessingOptions *)self requiresModelCreation])
  {
    id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMBProcessingOptions *)self requiresModelCreation];
    v17 = HMFBooleanToString();
    v18 = (void *)[v16 initWithName:@"Require Model Creation" value:v17];
    [v3 addObject:v18];
  }
  if ([(HMBProcessingOptions *)self disallowsModelCreation])
  {
    id v19 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMBProcessingOptions *)self disallowsModelCreation];
    v20 = HMFBooleanToString();
    v21 = (void *)[v19 initWithName:@"Disallow Model Creation" value:v20];
    [v3 addObject:v21];
  }
  v22 = (void *)[v3 copy];

  return v22;
}

- (HMBProcessingOptions)initWithLabel:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMBProcessingOptions;
  id v5 = [(HMBProcessingOptions *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_shouldEnqueueMirrorOutput = 1;
    v5->_qualityOfService = 17;
    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)optionsWithLabel:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithLabel:v4];

  return v5;
}

@end