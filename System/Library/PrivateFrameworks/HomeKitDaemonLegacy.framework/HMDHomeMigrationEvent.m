@interface HMDHomeMigrationEvent
- (HMDHomeMigrationEvent)initWithModel:(id)a3 reason:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)model;
- (NSString)reason;
- (id)attributeDescriptions;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDHomeMigrationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDHomeMigrationEvent *)self model];
  v5 = (void *)[v3 initWithName:@"model" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDHomeMigrationEvent *)self reason];
  v8 = (void *)[v6 initWithName:@"reason" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"modelClass";
  id v3 = [(HMDHomeMigrationEvent *)self model];
  v7[1] = @"reason";
  v8[0] = v3;
  v4 = [(HMDHomeMigrationEvent *)self reason];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.HMDHomeMigrationEvent";
}

- (HMDHomeMigrationEvent)initWithModel:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    uint64_t v14 = _HMFPreconditionFailure();
    return (HMDHomeMigrationEvent *)-[HAPCharacteristicValueActiveTransitionContext(Validator) isValid](v14);
  }
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v15.receiver = self;
  v15.super_class = (Class)HMDHomeMigrationEvent;
  v11 = [(HMMLogEvent *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_model, v10);
    objc_storeStrong((id *)&v12->_reason, a4);
  }

  return v12;
}

@end