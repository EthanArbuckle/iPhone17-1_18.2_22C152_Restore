@interface NSPropertyDescription(VSSubscriptionAdditions)
- (BOOL)vs_isSuitableForPurpose:()VSSubscriptionAdditions;
- (id)vs_JSONKey;
- (id)vs_JSONValueTransformer;
- (id)vs_JSONValueTransformerName;
- (id)vs_expectedJSONValueClasses;
- (id)vs_propertyListKey;
- (id)vs_propertyListValueTransformer;
- (id)vs_propertyListValueTransformerName;
- (id)vs_subscriptionKeyPath;
- (uint64_t)vs_isRequiredJSONValue;
- (uint64_t)vs_suitablePurposes;
- (void)vs_setExpectedJSONValueClasses:()VSSubscriptionAdditions;
- (void)vs_setJSONKey:()VSSubscriptionAdditions;
- (void)vs_setJSONValueTransformerName:()VSSubscriptionAdditions;
- (void)vs_setPropertyListKey:()VSSubscriptionAdditions;
- (void)vs_setPropertyListValueTransformerName:()VSSubscriptionAdditions;
- (void)vs_setRequiredJSONValue:()VSSubscriptionAdditions;
- (void)vs_setSubscriptionKeyPath:()VSSubscriptionAdditions;
- (void)vs_setSuitablePurposes:()VSSubscriptionAdditions;
- (void)vs_setUserInfoValue:()VSSubscriptionAdditions forKey:;
@end

@implementation NSPropertyDescription(VSSubscriptionAdditions)

- (void)vs_setUserInfoValue:()VSSubscriptionAdditions forKey:
{
  id v10 = a3;
  id v6 = a4;
  v7 = [a1 userInfo];
  id v8 = (id)[v7 mutableCopy];

  if (!v8) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  if (v10)
  {
    [v8 setObject:v10 forKey:v6];
  }
  else
  {
    v9 = [v8 objectForKey:v6];

    if (v9) {
      [v8 removeObjectForKey:v6];
    }
  }
  [a1 setUserInfo:v8];
}

- (id)vs_subscriptionKeyPath
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"VSSubscriptionKeyPathUserInfoKey"];

  return v2;
}

- (void)vs_setSubscriptionKeyPath:()VSSubscriptionAdditions
{
  id v4 = (id)[a3 copy];
  objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v4, @"VSSubscriptionKeyPathUserInfoKey");
}

- (uint64_t)vs_suitablePurposes
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"VSSubscriptionSuitablePurposesInfoKey"];

  if (v2) {
    uint64_t v3 = [v2 integerValue];
  }
  else {
    uint64_t v3 = 7;
  }

  return v3;
}

- (void)vs_setSuitablePurposes:()VSSubscriptionAdditions
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v2, @"VSSubscriptionSuitablePurposesInfoKey");
}

- (BOOL)vs_isSuitableForPurpose:()VSSubscriptionAdditions
{
  return (objc_msgSend(a1, "vs_suitablePurposes") & a3) != 0;
}

- (id)vs_propertyListKey
{
  v1 = [a1 userInfo];
  id v2 = [v1 objectForKey:@"VSPropertyListKeyUserInfoKey"];

  return v2;
}

- (void)vs_setPropertyListKey:()VSSubscriptionAdditions
{
  id v4 = (id)[a3 copy];
  objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v4, @"VSPropertyListKeyUserInfoKey");
}

- (id)vs_propertyListValueTransformerName
{
  v1 = [a1 userInfo];
  id v2 = [v1 objectForKey:@"VSPropertyListValueTransformerUserInfoKey"];

  return v2;
}

- (void)vs_setPropertyListValueTransformerName:()VSSubscriptionAdditions
{
  id v4 = (id)[a3 copy];
  objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v4, @"VSPropertyListValueTransformerUserInfoKey");
}

- (id)vs_propertyListValueTransformer
{
  v1 = objc_msgSend(a1, "vs_propertyListValueTransformerName");
  if (v1)
  {
    id v2 = [MEMORY[0x1E4F29248] valueTransformerForName:v1];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)vs_JSONKey
{
  v1 = [a1 userInfo];
  id v2 = [v1 objectForKey:@"VSJSONKeyUserInfoKey"];

  return v2;
}

- (void)vs_setJSONKey:()VSSubscriptionAdditions
{
  id v4 = (id)[a3 copy];
  objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v4, @"VSJSONKeyUserInfoKey");
}

- (uint64_t)vs_isRequiredJSONValue
{
  v1 = [a1 userInfo];
  id v2 = [v1 objectForKey:@"VSRequiredJSONValueUserInfoKey"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (void)vs_setRequiredJSONValue:()VSSubscriptionAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v2, @"VSRequiredJSONValueUserInfoKey");
}

- (id)vs_expectedJSONValueClasses
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = [a1 userInfo];
  id v4 = [v3 objectForKey:@"VSExpectedJSONValueClassUserInfoKey"];

  if ([v4 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          Class v10 = NSClassFromString(*(NSString **)(*((void *)&v12 + 1) + 8 * i));
          if (v10) {
            objc_msgSend(v2, "addObject:", v10, (void)v12);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  if (!objc_msgSend(v2, "count", (void)v12)) {
    [v2 addObject:objc_opt_class()];
  }

  return v2;
}

- (void)vs_setExpectedJSONValueClasses:()VSSubscriptionAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = NSStringFromClass(*(Class *)(*((void *)&v14 + 1) + 8 * v10));
        long long v12 = objc_msgSend(v11, "copy", (void)v14);
        [v5 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v13 = (void *)[v5 copy];
  objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v13, @"VSExpectedJSONValueClassUserInfoKey");
}

- (id)vs_JSONValueTransformerName
{
  v1 = [a1 userInfo];
  id v2 = [v1 objectForKey:@"VSJSONValueTransformerUserInfoKey"];

  return v2;
}

- (void)vs_setJSONValueTransformerName:()VSSubscriptionAdditions
{
  id v4 = (id)[a3 copy];
  objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v4, @"VSJSONValueTransformerUserInfoKey");
}

- (id)vs_JSONValueTransformer
{
  v1 = objc_msgSend(a1, "vs_JSONValueTransformerName");
  if (v1)
  {
    id v2 = [MEMORY[0x1E4F29248] valueTransformerForName:v1];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

@end