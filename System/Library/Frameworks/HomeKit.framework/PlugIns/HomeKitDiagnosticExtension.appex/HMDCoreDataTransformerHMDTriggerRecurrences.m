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
      v18 = (HMDCoreDataTransformerHMDTriggerRecurrences *)_HMFPreconditionFailure();
      return [(HMDCoreDataTransformerHMDTriggerRecurrences *)v18 transformedValue:v20];
    }
    id v10 = [v6 unsignedIntegerValue];
    if (v10)
    {
      int v11 = (int)v10;
      id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:7];
      for (uint64_t i = 1; i != 8; ++i)
      {
        if ((v11 & (1 << (i - 1))) != 0)
        {
          id v14 = objc_alloc_init((Class)NSDateComponents);
          [v14 setWeekday:i];
          [v12 addObject:v14];
        }
      }
      id v15 = [v12 copy];

      v21.receiver = self;
      v21.super_class = (Class)HMDCoreDataTransformerHMDTriggerRecurrences;
      v16 = [(HMDCoreDataTransformerHMDTriggerRecurrences *)&v21 reverseTransformedValue:v15];
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _HMFPreconditionFailure();
    }
    v19.receiver = self;
    v19.super_class = (Class)HMDCoreDataTransformerHMDTriggerRecurrences;
    id v5 = [(HMDSecureUnarchiveFromDataTransformer *)&v19 transformedValue:v4];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v5);
          }
          int v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v12 = [v11 calendar];
          v13 = v12;
          if (!v12 || ([v12 maximumRangeOfUnit:512] == (id)1 ? (BOOL v15 = v14 == 7) : (BOOL v15 = 0), v15))
          {
            v16 = (char *)[v11 weekday];
            if ((unint64_t)(v16 - 8) >= 0xFFFFFFFFFFFFFFF9) {
              v8 |= (1 << ((_BYTE)v16 - 1));
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }
    else
    {
      uint64_t v8 = 0;
    }

    v17 = +[NSNumber numberWithUnsignedInteger:v8];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)allowedTopLevelClasses
{
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

@end