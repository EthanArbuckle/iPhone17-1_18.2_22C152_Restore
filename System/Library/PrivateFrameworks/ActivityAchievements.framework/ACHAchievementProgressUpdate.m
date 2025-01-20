@interface ACHAchievementProgressUpdate
+ (BOOL)supportsSecureCoding;
- (ACHAchievementProgressUpdate)initWithCodable:(id)a3;
- (ACHAchievementProgressUpdate)initWithCoder:(id)a3;
- (ACHAchievementProgressUpdate)initWithTemplateUniqueName:(id)a3 progressQuantity:(id)a4 goalQuantity:(id)a5;
- (HKQuantity)goalQuantity;
- (HKQuantity)progressQuantity;
- (NSString)templateUniqueName;
- (void)encodeWithCoder:(id)a3;
- (void)setGoalQuantity:(id)a3;
- (void)setProgressQuantity:(id)a3;
- (void)setTemplateUniqueName:(id)a3;
@end

@implementation ACHAchievementProgressUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateUniqueName, 0);
  objc_storeStrong((id *)&self->_goalQuantity, 0);

  objc_storeStrong((id *)&self->_progressQuantity, 0);
}

- (ACHAchievementProgressUpdate)initWithTemplateUniqueName:(id)a3 progressQuantity:(id)a4 goalQuantity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ACHAchievementProgressUpdate;
  v12 = [(ACHAchievementProgressUpdate *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_templateUniqueName, a3);
    objc_storeStrong((id *)&v13->_progressQuantity, a4);
    objc_storeStrong((id *)&v13->_goalQuantity, a5);
  }

  return v13;
}

- (HKQuantity)progressQuantity
{
  return (HKQuantity *)objc_getProperty(self, a2, 8, 1);
}

- (HKQuantity)goalQuantity
{
  return (HKQuantity *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)templateUniqueName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACHAchievementProgressUpdate)initWithCodable:(id)a3
{
  v4 = (void *)MEMORY[0x263F0A830];
  id v5 = a3;
  v6 = [v5 progressQuantityUnit];
  v7 = [v4 unitFromString:v6];

  v8 = (void *)MEMORY[0x263F0A830];
  id v9 = [v5 goalQuantityUnit];
  id v10 = [v8 unitFromString:v9];

  id v11 = (void *)MEMORY[0x263F0A630];
  [v5 progressQuantityValue];
  v12 = objc_msgSend(v11, "quantityWithUnit:doubleValue:", v7);
  v13 = (void *)MEMORY[0x263F0A630];
  [v5 goalQuantityValue];
  v14 = objc_msgSend(v13, "quantityWithUnit:doubleValue:", v10);
  objc_super v15 = [v5 templateUniqueName];

  v16 = [(ACHAchievementProgressUpdate *)self initWithTemplateUniqueName:v15 progressQuantity:v12 goalQuantity:v14];
  return v16;
}

- (ACHAchievementProgressUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v4 decodeObjectOfClass:v5 forKey:v7];

  if ([v8 length])
  {
    id v9 = [[ACHCodableAchievementProgressUpdate alloc] initWithData:v8];
    if (v9)
    {
      self = [(ACHAchievementProgressUpdate *)self initWithCodable:v9];

      id v9 = (ACHCodableAchievementProgressUpdate *)self;
    }
  }
  else
  {
    id v9 = 0;
  }

  return (ACHAchievementProgressUpdate *)v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = ACHCodableFromAchievementProgressUpdate(self);
  uint64_t v5 = [v4 data];
  if ([v5 length])
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [v8 encodeObject:v5 forKey:v7];
  }
}

- (void)setProgressQuantity:(id)a3
{
}

- (void)setGoalQuantity:(id)a3
{
}

- (void)setTemplateUniqueName:(id)a3
{
}

@end