@interface HMIVideoAnalyzerDynamicConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)recognizeFaces;
- (HMIVideoAnalyzerDynamicConfiguration)init;
- (HMIVideoAnalyzerDynamicConfiguration)initWithCoder:(id)a3;
- (NSArray)activityZones;
- (id)attributeDescriptions;
- (int64_t)eventTriggers;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityZones:(id)a3;
- (void)setEventTriggers:(int64_t)a3;
- (void)setRecognizeFaces:(BOOL)a3;
@end

@implementation HMIVideoAnalyzerDynamicConfiguration

- (HMIVideoAnalyzerDynamicConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMIVideoAnalyzerDynamicConfiguration;
  v2 = [(HMIVideoAnalyzerDynamicConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_eventTriggers = 0;
    activityZones = v2->_activityZones;
    v2->_activityZones = (NSArray *)MEMORY[0x263EFFA68];

    v3->_recognizeFaces = 0;
  }
  return v3;
}

- (id)attributeDescriptions
{
  v16[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMIVideoAnalyzerDynamicConfiguration *)self eventTriggers];
  v4 = HMIVideoAnalyzerEventTriggersAsString();
  v5 = (void *)[v3 initWithName:@"Event Triggers" value:v4];
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMIVideoAnalyzerDynamicConfiguration *)self recognizeFaces];
  v7 = HMFBooleanToString();
  v8 = (void *)[v6 initWithName:@"Recognize Faces" value:v7];
  v16[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = NSNumber;
  v11 = [(HMIVideoAnalyzerDynamicConfiguration *)self activityZones];
  v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v13 = (void *)[v9 initWithName:@"Activity Zone Count" value:v12];
  v16[2] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMIVideoAnalyzerDynamicConfiguration *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(HMIVideoAnalyzerDynamicConfiguration *)self eventTriggers];
      BOOL v7 = v6 == [(HMIVideoAnalyzerDynamicConfiguration *)v5 eventTriggers];
      LODWORD(v6) = [(HMIVideoAnalyzerDynamicConfiguration *)self recognizeFaces];
      int v8 = v7 & ~(v6 ^ [(HMIVideoAnalyzerDynamicConfiguration *)v5 recognizeFaces]);
      id v9 = [(HMIVideoAnalyzerDynamicConfiguration *)self activityZones];
      v10 = [(HMIVideoAnalyzerDynamicConfiguration *)v5 activityZones];

      LOBYTE(v5) = HMFEqualObjects();
      char v11 = v8 & v5;
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIVideoAnalyzerDynamicConfiguration)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMIVideoAnalyzerDynamicConfiguration *)self init];
  int64_t v6 = (void *)MEMORY[0x263EFFA08];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  int v8 = [v6 setWithArray:v7];
  id v9 = NSStringFromSelector(sel_activityZones);
  v10 = [v4 decodeObjectOfClasses:v8 forKey:v9];
  [(HMIVideoAnalyzerDynamicConfiguration *)v5 setActivityZones:v10];

  char v11 = NSStringFromSelector(sel_eventTriggers);
  -[HMIVideoAnalyzerDynamicConfiguration setEventTriggers:](v5, "setEventTriggers:", [v4 decodeIntegerForKey:v11]);

  v12 = NSStringFromSelector(sel_recognizeFaces);
  uint64_t v13 = [v4 decodeBoolForKey:v12];

  [(HMIVideoAnalyzerDynamicConfiguration *)v5 setRecognizeFaces:v13];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMIVideoAnalyzerDynamicConfiguration *)self activityZones];
  int64_t v6 = NSStringFromSelector(sel_activityZones);
  [v4 encodeObject:v5 forKey:v6];

  int64_t v7 = [(HMIVideoAnalyzerDynamicConfiguration *)self eventTriggers];
  int v8 = NSStringFromSelector(sel_eventTriggers);
  [v4 encodeInteger:v7 forKey:v8];

  BOOL v9 = [(HMIVideoAnalyzerDynamicConfiguration *)self recognizeFaces];
  NSStringFromSelector(sel_recognizeFaces);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v9 forKey:v10];
}

- (BOOL)recognizeFaces
{
  return self->_recognizeFaces;
}

- (void)setRecognizeFaces:(BOOL)a3
{
  self->_recognizeFaces = a3;
}

- (int64_t)eventTriggers
{
  return self->_eventTriggers;
}

- (void)setEventTriggers:(int64_t)a3
{
  self->_eventTriggers = a3;
}

- (NSArray)activityZones
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActivityZones:(id)a3
{
}

- (void).cxx_destruct
{
}

@end