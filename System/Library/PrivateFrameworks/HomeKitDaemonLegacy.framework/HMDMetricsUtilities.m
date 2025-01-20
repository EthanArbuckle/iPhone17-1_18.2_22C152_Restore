@interface HMDMetricsUtilities
+ (BOOL)shouldRedactBundleID:(id)a3;
+ (BOOL)shouldRedactBundleID:(id)a3 isInternalBuild:(BOOL)a4;
+ (id)primaryServiceTypeForHAPAccessory:(id)a3;
+ (id)redactedThirdPartyBundleID:(id)a3;
+ (id)redactedThirdPartyBundleID:(id)a3 isInternalBuild:(BOOL)a4;
@end

@implementation HMDMetricsUtilities

+ (id)primaryServiceTypeForHAPAccessory:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 primaryService];

  if (v4)
  {
    v5 = [v3 primaryService];
    v6 = v5;
LABEL_15:
    v13 = [v5 type];
  }
  else
  {
    v7 = [v3 bridge];
    if (v7)
    {
    }
    else
    {
      v15 = [v3 identifiersForBridgedAccessories];
      uint64_t v16 = [v15 count];

      if (v16)
      {
        v13 = @"Bridge";
        goto LABEL_16;
      }
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v6 = objc_msgSend(v3, "services", 0);
    uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v12 isPrimary])
          {
            v5 = v12;
            goto LABEL_15;
          }
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    v13 = 0;
  }
LABEL_16:

  return v13;
}

+ (BOOL)shouldRedactBundleID:(id)a3 isInternalBuild:(BOOL)a4
{
  BOOL result = 0;
  if (a3)
  {
    if (!a4) {
      return HMDIsFirstPartyClientIdentifier(a3) ^ 1;
    }
  }
  return result;
}

+ (BOOL)shouldRedactBundleID:(id)a3
{
  id v4 = a3;
  LOBYTE(a1) = [a1 shouldRedactBundleID:v4 isInternalBuild:isInternalBuild()];

  return (char)a1;
}

+ (id)redactedThirdPartyBundleID:(id)a3 isInternalBuild:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    if ([a1 shouldRedactBundleID:v6 isInternalBuild:v4]) {
      v7 = @"External";
    }
    else {
      v7 = (__CFString *)[v6 copy];
    }
  }
  else
  {
    v7 = @"Unknown";
  }

  return v7;
}

+ (id)redactedThirdPartyBundleID:(id)a3
{
  id v4 = a3;
  v5 = [a1 redactedThirdPartyBundleID:v4 isInternalBuild:isInternalBuild()];

  return v5;
}

@end