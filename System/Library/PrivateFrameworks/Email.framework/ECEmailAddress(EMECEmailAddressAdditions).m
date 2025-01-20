@interface ECEmailAddress(EMECEmailAddressAdditions)
+ (id)em_partiallyRedactedPeople:()EMECEmailAddressAdditions;
- (id)em_displayableString;
- (id)em_person;
@end

@implementation ECEmailAddress(EMECEmailAddressAdditions)

- (id)em_displayableString
{
  v2 = [a1 displayName];
  if (v2
    && ([a1 simpleAddress],
        v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v2 localizedCaseInsensitiveCompare:v3],
        v3,
        !v4))
  {
    id v9 = 0;
  }
  else
  {
    v5 = objc_msgSend(v2, "ea_personNameComponents");
    v6 = v5;
    if (v5)
    {
      [v5 setNamePrefix:0];
      [v6 setNameSuffix:0];
      id v7 = objc_alloc_init(MEMORY[0x1E4F28F38]);
      [v7 setStyle:3];
      id v8 = [v7 stringFromPersonNameComponents:v6];
    }
    else if ([v2 length])
    {
      id v8 = v2;
    }
    else
    {
      id v8 = 0;
    }
    if ([v8 length]) {
      v10 = v8;
    }
    else {
      v10 = 0;
    }
    id v9 = v10;
  }
  return v9;
}

- (id)em_person
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 simpleAddress];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F23810]);
    uint64_t v4 = [a1 displayName];
    v5 = [a1 simpleAddress];
    v9[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v7 = (void *)[v3 initWithDisplayName:v4 handles:v6 handleIdentifier:*MEMORY[0x1E4F1ADC8]];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)em_partiallyRedactedPeople:()EMECEmailAddressAdditions
{
  id v3 = objc_msgSend(a3, "ef_compactMap:", &__block_literal_global_11);
  uint64_t v4 = [v3 componentsJoinedByString:@", "];

  return v4;
}

@end