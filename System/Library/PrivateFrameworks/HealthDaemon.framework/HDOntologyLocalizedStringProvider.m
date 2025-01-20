@interface HDOntologyLocalizedStringProvider
+ (id)_localizedLoggingUnitForAttribute:(id)a3 locale:(id)a4 propertyType:(int64_t)a5;
+ (id)_nullLocalizedOntologyStringsWithVersion:(int64_t)a3 localesToDelete:(id)a4 propertyType:(int64_t)a5;
+ (id)localizedLoggingUnitsForConcept:(id)a3;
+ (id)localizedOntologyPreferredNamesForConcept:(id)a3 version:(id)a4 withUserDomainConceptPropertyType:(int64_t)a5;
+ (id)localizedOntologyPreferredNamesForConcept:(id)a3 withUserDomainConceptPropertyType:(int64_t)a4;
+ (id)localizedUserDomainConceptPropertyStringForConceptAttribute:(id)a3 locale:(id)a4 propertyType:(int64_t)a5;
+ (id)nullLocalizedOntologyLoggingUnitsWithVersion:(int64_t)a3 withUserDomainConceptPropertyType:(int64_t)a4;
+ (id)nullLocalizedOntologyPreferredNamesWithVersion:(int64_t)a3 withUserDomainConceptPropertyType:(int64_t)a4;
@end

@implementation HDOntologyLocalizedStringProvider

+ (id)localizedOntologyPreferredNamesForConcept:(id)a3 withUserDomainConceptPropertyType:(int64_t)a4
{
  return (id)[a1 localizedOntologyPreferredNamesForConcept:a3 version:0 withUserDomainConceptPropertyType:a4];
}

+ (id)localizedOntologyPreferredNamesForConcept:(id)a3 version:(id)a4 withUserDomainConceptPropertyType:(int64_t)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v22 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v21 = v6;
  id obj = [v6 attributes];
  uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    v11 = (void *)*MEMORY[0x1E4F2AA60];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v13 type] == 1012)
        {
          v14 = v11;
          if (!v11) {
            continue;
          }
          v15 = v14;
        }
        else
        {
          v15 = @"en_US";
          if ([v13 type] != 960)
          {
            v15 = @"en_GB";
            if ([v13 type] != 961)
            {
              v15 = @"en_CA";
              if ([v13 type] != 962) {
                continue;
              }
            }
          }
        }
        if ([v13 isDeleted])
        {
          v16 = objc_msgSend(MEMORY[0x1E4F2B650], "nullPropertyWithType:locale:version:", a5, v15, objc_msgSend(v13, "version"));
        }
        else
        {
          id v17 = objc_alloc(MEMORY[0x1E4F2B650]);
          v18 = [v13 stringValue];
          if (v22) {
            uint64_t v19 = [v22 integerValue];
          }
          else {
            uint64_t v19 = [v13 version];
          }
          v16 = (void *)[v17 initWithType:a5 stringValue:v18 locale:v15 version:v19];
        }
        [v7 addObject:v16];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  return v7;
}

+ (id)nullLocalizedOntologyPreferredNamesWithVersion:(int64_t)a3 withUserDomainConceptPropertyType:(int64_t)a4
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v10[0] = *MEMORY[0x1E4F2AA60];
  v10[1] = @"en_US";
  v10[2] = @"en_GB";
  v10[3] = @"en_CA";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  uint64_t v8 = [a1 _nullLocalizedOntologyStringsWithVersion:a3 localesToDelete:v7 propertyType:a4];

  return v8;
}

+ (id)nullLocalizedOntologyLoggingUnitsWithVersion:(int64_t)a3 withUserDomainConceptPropertyType:(int64_t)a4
{
  return (id)[a1 _nullLocalizedOntologyStringsWithVersion:a3 localesToDelete:&unk_1F17E9720 propertyType:a4];
}

+ (id)_nullLocalizedOntologyStringsWithVersion:(int64_t)a3 localesToDelete:(id)a4 propertyType:(int64_t)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __107__HDOntologyLocalizedStringProvider__nullLocalizedOntologyStringsWithVersion_localesToDelete_propertyType___block_invoke;
  v7[3] = &__block_descriptor_48_e54___HKUserDomainConceptLocalizedString_16__0__NSString_8l;
  v7[4] = a5;
  v7[5] = a3;
  v5 = objc_msgSend(a4, "hk_map:", v7);

  return v5;
}

uint64_t __107__HDOntologyLocalizedStringProvider__nullLocalizedOntologyStringsWithVersion_localesToDelete_propertyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F2B650] nullPropertyWithType:*(void *)(a1 + 32) locale:a2 version:*(void *)(a1 + 40)];
}

+ (id)localizedLoggingUnitsForConcept:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v5 = objc_msgSend(v4, "attributes", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    id v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v23;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v5);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = [v13 type];
        switch(v14)
        {
          case 795:
            id v18 = v13;
            v16 = v8;
            id v8 = v18;
            break;
          case 796:
            id v17 = v13;
            v16 = v9;
            id v9 = v17;
            break;
          case 802:
            uint64_t v15 = [v13 stringValue];
            v16 = v10;
            uint64_t v10 = (void *)v15;
            break;
          default:
            continue;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (!v7)
      {

        if (v10)
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          if (v8)
          {
            v20 = [a1 _localizedLoggingUnitForAttribute:v8 locale:v10 propertyType:160018];
            [v19 addObject:v20];
          }
          if (v9)
          {
            v5 = [a1 _localizedLoggingUnitForAttribute:v9 locale:v10 propertyType:160017];
            [v19 addObject:v5];
            goto LABEL_21;
          }
        }
        else
        {
          id v19 = (id)MEMORY[0x1E4F1CBF0];
        }
        goto LABEL_23;
      }
    }
  }
  uint64_t v10 = 0;
  id v9 = 0;
  id v8 = 0;
  id v19 = (id)MEMORY[0x1E4F1CBF0];
LABEL_21:

LABEL_23:

  return v19;
}

+ (id)_localizedLoggingUnitForAttribute:(id)a3 locale:(id)a4 propertyType:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 isDeleted])
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F2B650], "nullPropertyWithType:locale:version:", a5, v8, objc_msgSend(v7, "version"));
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F2B650]);
    uint64_t v11 = [v7 stringValue];
    id v9 = objc_msgSend(v10, "initWithType:stringValue:locale:version:", a5, v11, v8, objc_msgSend(v7, "version"));

    id v8 = (id)v11;
  }

  return v9;
}

+ (id)localizedUserDomainConceptPropertyStringForConceptAttribute:(id)a3 locale:(id)a4 propertyType:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 isDeleted])
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F2B650], "nullPropertyWithType:locale:version:", a5, v8, objc_msgSend(v7, "version"));
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F2B650]);
    uint64_t v11 = [v7 stringValue];
    id v9 = objc_msgSend(v10, "initWithType:stringValue:locale:version:", a5, v11, v8, objc_msgSend(v7, "version"));

    id v8 = (id)v11;
  }

  return v9;
}

@end