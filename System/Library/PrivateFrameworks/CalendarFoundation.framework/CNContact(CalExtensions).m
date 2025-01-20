@interface CNContact(CalExtensions)
+ (id)CalDefaultBirthdayString;
+ (id)CalKeys;
- (id)CalBirthdayStringForDate:()CalExtensions;
- (id)CalDisplayName;
- (id)CalEmailAddresses;
- (id)CalFirstValueForKey:()CalExtensions;
- (id)CalPhoneNumbers;
- (id)CalValueForKey:()CalExtensions withLabel:;
@end

@implementation CNContact(CalExtensions)

- (id)CalDisplayName
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1B910]);
  v3 = [v2 stringFromContact:a1];

  return v3;
}

+ (id)CalDefaultBirthdayString
{
  v0 = +[CalFoundationBundle bundle];
  v1 = [v0 localizedStringForKey:@"Birthday" value:&stru_1EE0C39E0 table:0];

  return v1;
}

- (id)CalEmailAddresses
{
  v1 = [a1 emailAddresses];
  id v2 = [v1 valueForKeyPath:@"value"];

  return v2;
}

- (id)CalPhoneNumbers
{
  v1 = [a1 phoneNumbers];
  id v2 = [v1 valueForKeyPath:@"value"];

  return v2;
}

- (id)CalBirthdayStringForDate:()CalExtensions
{
  id v4 = a3;
  v5 = [a1 CalDisplayName];
  uint64_t v6 = [a1 birthday];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [a1 nonGregorianBirthday];

    if (!v8) {
      goto LABEL_12;
    }
  }
  uint64_t v9 = [a1 nonGregorianBirthday];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [a1 birthday];

    if (!v11)
    {
      uint64_t v24 = [a1 nonGregorianBirthday];
      goto LABEL_15;
    }
  }
  uint64_t v12 = [a1 birthday];
  if (!v12
    || (v13 = (void *)v12,
        [a1 nonGregorianBirthday],
        v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        !v14))
  {
    v25 = [MEMORY[0x1E4F1B8F8] CalDefaultBirthdayString];
    goto LABEL_21;
  }
  if (!v4) {
    goto LABEL_12;
  }
  v15 = [a1 birthday];
  v16 = [v15 calendar];
  v17 = [v16 components:30 fromDate:v4];

  if (!v17)
  {
LABEL_12:
    uint64_t v24 = [a1 birthday];
LABEL_15:
    v26 = (void *)v24;
    goto LABEL_16;
  }
  uint64_t v18 = [v17 day];
  v19 = [a1 birthday];
  if (v18 != [v19 day])
  {

    goto LABEL_25;
  }
  uint64_t v20 = [v17 month];
  v21 = [a1 birthday];
  uint64_t v22 = [v21 month];

  if (v20 != v22)
  {
LABEL_25:
    uint64_t v23 = [a1 nonGregorianBirthday];
    goto LABEL_26;
  }
  uint64_t v23 = [a1 birthday];
LABEL_26:
  v26 = (void *)v23;

LABEL_16:
  v27 = [v26 calendar];
  v28 = [v27 calendarIdentifier];

  uint64_t v29 = [v5 length];
  if (v26 && v29)
  {
    v30 = [v26 calendar];
    v31 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    [v30 setTimeZone:v31];

    v32 = [v30 dateFromComponents:v26];
    v25 = +[CalContactsProvider birthdayStringForContactName:v5 eventDate:v4 birthDate:v32 lunarCalendar:v28];
  }
  else
  {
    v25 = [MEMORY[0x1E4F1B8F8] CalDefaultBirthdayString];
  }

LABEL_21:

  return v25;
}

- (id)CalFirstValueForKey:()CalExtensions
{
  v1 = objc_msgSend(a1, "valueForKey:");
  if ([v1 count])
  {
    id v2 = [v1 firstObject];
    v3 = [v2 value];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)CalValueForKey:()CalExtensions withLabel:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [a1 valueForKey:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "label", (void)v15);
        char v13 = [v12 isEqualToString:v6];

        if (v13)
        {
          v8 = [v11 value];
          goto LABEL_11;
        }
      }
      v8 = (void *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

+ (id)CalKeys
{
  v6[7] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v1 = *MEMORY[0x1E4F1ADC8];
  v6[0] = v0;
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1AFB0];
  v6[2] = *MEMORY[0x1E4F1AEE0];
  v6[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AD90];
  v6[4] = *MEMORY[0x1E4F1AD98];
  v6[5] = v3;
  v6[6] = *MEMORY[0x1E4F1AEC8];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:7];

  return v4;
}

@end