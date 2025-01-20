@interface NSArray(HKFeatureAvailabilityRequirementsProviding)
- (id)_hk_featureAvailabilityRequirements;
@end

@implementation NSArray(HKFeatureAvailabilityRequirementsProviding)

- (id)_hk_featureAvailabilityRequirements
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([a1 count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = a1;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            v11 = objc_msgSend(v10, "_hk_featureAvailabilityRequirements");
            [v4 addObjectsFromArray:v11];
          }
          else
          {
            v11 = [MEMORY[0x1E4F28B00] currentHandler];
            [v11 handleFailureInMethod:a2, v5, @"HKFeatureAvailabilityRequirementProviding.m", 26, @"Unexpected array element %@ does not respond to @selector(_hk_featureAvailabilityRequirements)", v10 object file lineNumber description];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    id v12 = (id)[v4 copy];
  }
  else
  {
    id v12 = a1;
  }

  return v12;
}

@end