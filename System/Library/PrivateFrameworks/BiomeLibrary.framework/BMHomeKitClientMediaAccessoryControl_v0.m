@interface BMHomeKitClientMediaAccessoryControl_v0
- (id)accessoryState;
@end

@implementation BMHomeKitClientMediaAccessoryControl_v0

- (id)accessoryState
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)BMHomeKitClientMediaAccessoryControl_v0;
  v2 = [(BMHomeKitClientMediaAccessoryControl *)&v23 accessoryState];
  id v18 = (id)objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v8 = [BMHomeKitAccessoryState_v0 alloc];
        v9 = [v7 mediaPropertyType];
        uint64_t v10 = [v7 valueType];
        v11 = [v7 dataValue];
        v12 = [v7 stringValue];
        v13 = NSNumber;
        [v7 numValue];
        v14 = objc_msgSend(v13, "numberWithDouble:");
        v15 = [(BMHomeKitAccessoryState *)v8 initWithMediaPropertyType:v9 valueType:v10 dataValue:v11 stringValue:v12 numValue:v14];
        [v18 addObject:v15];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }

  return v18;
}

@end