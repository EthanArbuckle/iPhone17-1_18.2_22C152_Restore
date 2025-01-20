@interface HMDCoreDataTransformerHMDTriggerRecurrences
+ (id)allowedTopLevelClasses;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation HMDCoreDataTransformerHMDTriggerRecurrences

- (id)reverseTransformedValue:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
    objc_opt_class();
    int v7 = objc_opt_isKindOfClass() & 1;
    if (v7) {
      v8 = v6;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    if (!v7)
    {
      v13 = (HMDCoreDataTransformerHMDTriggerRecurrences *)_HMFPreconditionFailure();
      return [(HMDCoreDataTransformerHMDTriggerRecurrences *)v13 transformedValue:v15];
    }
    if ([v6 unsignedIntegerValue])
    {
      v10 = HMDaysOfTheWeekToDateComponents();
      v16.receiver = self;
      v16.super_class = (Class)HMDCoreDataTransformerHMDTriggerRecurrences;
      v11 = [(NSSecureUnarchiveFromDataTransformer *)&v16 reverseTransformedValue:v10];
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = (void *)_HMFPreconditionFailure();
      return +[HMDCoreDataTransformerHMDTriggerRecurrences allowedTopLevelClasses];
    }
    v10.receiver = self;
    v10.super_class = (Class)HMDCoreDataTransformerHMDTriggerRecurrences;
    v5 = [(HMDSecureUnarchiveFromDataTransformer *)&v10 transformedValue:v4];
    id v6 = [NSNumber numberWithUnsignedInteger:HMDaysOfTheWeekFromDateComponents()];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)allowedTopLevelClasses
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

@end