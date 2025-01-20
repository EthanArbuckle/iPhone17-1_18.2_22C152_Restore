@interface NSDictionary(HMFDeprecated)
- (id)arrayOfDateComponentsFromDataForKey:()HMFDeprecated;
- (id)calendarFromDataForKey:()HMFDeprecated;
- (id)dateComponentsForKey:()HMFDeprecated;
- (id)dateComponentsFromDataForKey:()HMFDeprecated;
- (id)errorFromDataForKey:()HMFDeprecated;
- (id)predicateFromDataForKey:()HMFDeprecated;
- (id)secureDescriptionWithIndent:()HMFDeprecated newLine:blacklistedKeys:;
- (id)timeZoneFromDataForKey:()HMFDeprecated;
- (id)uuidFromStringForKey:()HMFDeprecated;
- (uint64_t)secureDescriptionWithBlacklistKeys:()HMFDeprecated;
@end

@implementation NSDictionary(HMFDeprecated)

- (id)errorFromDataForKey:()HMFDeprecated
{
  v1 = objc_msgSend(a1, "hmf_dataForKey:");
  if (v1)
  {
    v2 = (void *)MEMORY[0x1E4F28DC0];
    v3 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    v4 = [v2 deserializeObjectWithData:v1 allowedClasses:v3];

    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (uint64_t)secureDescriptionWithBlacklistKeys:()HMFDeprecated
{
  return [a1 secureDescriptionWithIndent:0 newLine:1 blacklistedKeys:a3];
}

- (id)secureDescriptionWithIndent:()HMFDeprecated newLine:blacklistedKeys:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v7 = a3;
  id v8 = a5;
  v9 = [MEMORY[0x1E4F28E78] string];
  v10 = @"\n";
  if (!a4) {
    v10 = &stru_1EEF0F5E0;
  }
  v11 = v10;
  v31 = v11;
  if (v7)
  {
    [v9 appendFormat:@"%@%@{\n", v11, v7];
    [(__CFString *)v7 indentationByLevels:1];
  }
  else
  {
    [v9 appendFormat:@"%@{\n", v11];
    +[HMFStringIndentation indentation];
  v12 = };
  [a1 allKeys];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v13);
        }
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v18 = v13;
          goto LABEL_17;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  v18 = [v13 sortedArrayUsingSelector:sel_compare_];
LABEL_17:

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * v23);
        if (([v8 containsObject:v24] & 1) == 0)
        {
          [v9 appendFormat:@"%@%@ = ", v12, v24];
          v25 = [a1 objectForKeyedSubscript:v24];
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            uint64_t v26 = [v25 secureDescriptionWithIndent:v12 newLine:1 blacklistedKeys:v8];
          }
          else if ([v25 conformsToProtocol:&unk_1EEF248E0] {
                 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          }
          {
            uint64_t v26 = [v25 shortDescription];
          }
          else
          {
            uint64_t v26 = [v25 description];
          }
          v27 = (void *)v26;
          [v9 appendString:v26];

          [v9 appendString:@",\n"];
        }
        ++v23;
      }
      while (v21 != v23);
      uint64_t v28 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
      uint64_t v21 = v28;
    }
    while (v28);
  }

  v29 = &stru_1EEF0F5E0;
  if (v7) {
    v29 = v7;
  }
  [v9 appendFormat:@"%@}", v29];

  return v9;
}

- (id)uuidFromStringForKey:()HMFDeprecated
{
  v1 = objc_msgSend(a1, "hmf_stringForKey:");
  if (v1) {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v1];
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (id)timeZoneFromDataForKey:()HMFDeprecated
{
  v1 = objc_msgSend(a1, "hmf_dataForKey:");
  v2 = [v1 decodeTimeZone];

  return v2;
}

- (id)dateComponentsForKey:()HMFDeprecated
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "hmf_dateComponentsForKey:", v4);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [a1 dateComponentsFromDataForKey:v4];
  }
  id v8 = v7;

  return v8;
}

- (id)dateComponentsFromDataForKey:()HMFDeprecated
{
  v1 = objc_msgSend(a1, "hmf_dataForKey:");
  v2 = [v1 decodeDateComponents];

  return v2;
}

- (id)calendarFromDataForKey:()HMFDeprecated
{
  v1 = objc_msgSend(a1, "hmf_dataForKey:");
  v2 = [v1 decodeCalendar];

  return v2;
}

- (id)predicateFromDataForKey:()HMFDeprecated
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend(a1, "hmf_dataForKey:");
  if (v1)
  {
    v2 = (void *)MEMORY[0x1E4F28DC0];
    v3 = (void *)MEMORY[0x1E4F1CAD0];
    v9[0] = objc_opt_class();
    v9[1] = objc_opt_class();
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    id v5 = [v3 setWithArray:v4];
    v6 = [v2 deserializeObjectWithData:v1 allowedClasses:v5];

    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)arrayOfDateComponentsFromDataForKey:()HMFDeprecated
{
  v1 = objc_msgSend(a1, "hmf_dataForKey:");
  v2 = [v1 decodeArrayOfDateComponents];

  return v2;
}

@end