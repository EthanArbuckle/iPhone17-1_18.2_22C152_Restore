@interface HFConcreteTimeTriggerBuilder
+ (id)builderForExistingTrigger:(id)a3 inHome:(id)a4 context:(id)a5;
@end

@implementation HFConcreteTimeTriggerBuilder

+ (id)builderForExistingTrigger:(id)a3 inHome:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  id v10 = v7;
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    v13 = [[HFTimerBasedTimeTriggerBuilder alloc] initWithExistingObject:v12 inHome:v8 context:v9];
  }
  else
  {
    objc_opt_class();
    id v14 = v10;
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;

    if (v16)
    {
      v13 = [[HFEventTriggerBuilder alloc] initWithExistingObject:v16 inHome:v8 context:v9];
    }
    else
    {
      NSLog(&cfstr_UnknownOrNilTr.isa, v14);
      v13 = 0;
    }
  }
  return v13;
}

@end