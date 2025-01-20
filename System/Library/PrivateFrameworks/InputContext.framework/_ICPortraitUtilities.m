@interface _ICPortraitUtilities
+ (id)acceptedAlgorithms;
+ (id)acceptedSourceBundleIds;
+ (id)contactFromPortraitContact:(id)a3;
+ (id)contactRecordFromPortraitContactRecord:(id)a3;
+ (id)excludedAlgorithms;
+ (id)filteredNamedEntitiesFromJSONDonations:(id)a3;
+ (id)namedEntityRecordFromPortraitNamedEntityRecord:(id)a3;
+ (unsigned)contactChangeTypeForPortraitChangeType:(unsigned __int8)a3;
+ (unsigned)contactSourceTypeForPortraitSourceType:(unsigned __int8)a3;
@end

@implementation _ICPortraitUtilities

+ (id)contactRecordFromPortraitContactRecord:(id)a3
{
  id v4 = a3;
  v5 = [a1 contactFromPortraitContact:v4];
  uint64_t v6 = objc_msgSend(a1, "contactChangeTypeForPortraitChangeType:", objc_msgSend(v4, "changeType"));
  uint64_t v7 = objc_msgSend(a1, "contactSourceTypeForPortraitSourceType:", objc_msgSend(v4, "source"));
  v8 = [_ICContactRecord alloc];
  v9 = [v4 sourceIdentifier];

  v10 = [(_ICContactRecord *)v8 initWithIdentifier:v9 contact:v5 changeType:v6 source:v7];
  return v10;
}

+ (id)contactFromPortraitContact:(id)a3
{
  id v3 = a3;
  id v4 = [_ICContact alloc];
  v21 = [v3 firstName];
  v5 = [v3 phoneticFirstName];
  v20 = [v3 middleName];
  v19 = [v3 phoneticMiddleName];
  v18 = [v3 lastName];
  v17 = [v3 phoneticLastName];
  v15 = [v3 organizationName];
  v14 = [v3 jobTitle];
  uint64_t v6 = [v3 nickname];
  uint64_t v7 = [v3 relatedNames];
  v8 = [v7 allValues];
  v9 = [v3 streetNames];
  v10 = [v3 cityNames];
  [v3 score];
  double v12 = v11;

  v16 = [(_ICContact *)v4 initWithFirstName:v21 phoneticFirstName:v5 middleName:v20 phoneticMiddleName:v19 lastName:v18 phoneticLastName:v17 organizationName:v12 jobTitle:v15 nickname:v14 relations:v6 streets:v8 cities:v9 score:v10];
  return v16;
}

+ (unsigned)contactChangeTypeForPortraitChangeType:(unsigned __int8)a3
{
  if (a3 >= 4u) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (unsigned)contactSourceTypeForPortraitSourceType:(unsigned __int8)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (id)acceptedSourceBundleIds
{
  v8[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = *MEMORY[0x263F5D510];
  v8[0] = *MEMORY[0x263F5D528];
  v8[1] = v3;
  uint64_t v4 = *MEMORY[0x263F5D518];
  v8[2] = *MEMORY[0x263F5D520];
  v8[3] = v4;
  v8[4] = *MEMORY[0x263F5D508];
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:5];
  uint64_t v6 = [v2 setWithArray:v5];

  return v6;
}

+ (id)acceptedAlgorithms
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_26E8A2878];
}

+ (id)excludedAlgorithms
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  for (uint64_t i = 1; i != 18; ++i)
  {
    uint64_t v4 = [NSNumber numberWithUnsignedLong:i];
    [v2 addObject:v4];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = +[_ICPortraitUtilities acceptedAlgorithms];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t j = 0; j != v7; ++j)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [v2 removeObject:*(void *)(*((void *)&v12 + 1) + 8 * j)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = (void *)[v2 copy];
  return v10;
}

+ (id)namedEntityRecordFromPortraitNamedEntityRecord:(id)a3
{
  id v3 = a3;
  if (isTransientLexiconIngestionV2Enabled())
  {
    uint64_t v4 = [MEMORY[0x263EFF8F0] currentCalendar];
    v5 = [v3 source];
    uint64_t v6 = [v5 date];
    uint64_t v7 = [MEMORY[0x263EFF910] date];
    uint64_t v8 = [v4 components:16 fromDate:v6 toDate:v7 options:0];
    uint64_t v9 = [v8 day];

    v10 = +[_ICPortraitUtilities acceptedSourceBundleIds];
    double v11 = [v3 source];
    long long v12 = [v11 bundleId];
    if ([v10 containsObject:v12])
    {
      long long v13 = +[_ICPortraitUtilities acceptedAlgorithms];
      long long v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "algorithm"));
      unsigned int v15 = [v13 containsObject:v14];
      if (v9 < 8) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }

    v21 = _ICPersNamedEntityOSLogFacility();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      +[_ICPortraitUtilities namedEntityRecordFromPortraitNamedEntityRecord:](v3, v21);
    }

    v22 = [_ICNamedEntityRecord alloc];
    v23 = [v3 entity];
    v24 = [v23 name];
    v25 = [v3 source];
    v26 = [v25 date];
    [v26 timeIntervalSinceReferenceDate];
    v20 = -[_ICNamedEntityRecord initWithName:timestamp:passesFilters:](v22, "initWithName:timestamp:passesFilters:", v24, v16);
  }
  else
  {
    uint64_t v17 = [_ICNamedEntityRecord alloc];
    v18 = [v3 entity];
    v19 = [v18 name];
    v20 = [(_ICNamedEntityRecord *)v17 initWithName:v19];
  }
  return v20;
}

+ (id)filteredNamedEntitiesFromJSONDonations:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v32 = [MEMORY[0x263EFF980] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v3;
  uint64_t v38 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v6 = [v5 objectForKeyedSubscript:@"namedEntities"];
        uint64_t v7 = [v6 objectAtIndexedSubscript:0];
        uint64_t v8 = [v7 objectForKeyedSubscript:@"name"];
        if (v8)
        {
          uint64_t v9 = (void *)v8;
          v10 = [v5 objectForKeyedSubscript:@"source"];
          double v11 = [v10 objectForKeyedSubscript:@"bundleIdentifier"];

          if (!v11) {
            continue;
          }
          long long v12 = [v5 objectForKeyedSubscript:@"namedEntities"];
          long long v13 = [v12 objectAtIndexedSubscript:0];
          uint64_t v6 = [v13 objectForKeyedSubscript:@"name"];

          long long v14 = [v5 objectForKeyedSubscript:@"source"];
          uint64_t v7 = [v14 objectForKeyedSubscript:@"bundleIdentifier"];

          unsigned int v15 = [v5 objectForKeyedSubscript:@"source"];
          uint64_t v16 = [v15 objectForKeyedSubscript:@"date"];

          uint64_t v17 = objc_opt_new();
          [v17 setFormatOptions:1907];
          v18 = [v17 dateFromString:v16];
          v19 = v18;
          v35 = v17;
          v36 = (void *)v16;
          if (v18)
          {
            id v20 = v18;
          }
          else
          {
            id v20 = [MEMORY[0x263EFF910] date];
          }
          id v21 = v20;

          v22 = [v5 objectForKeyedSubscript:@"algorithm"];
          uint64_t v23 = 1;
          while (1)
          {
            v24 = [MEMORY[0x263F5D4B8] describeAlgorithm:v23];
            char v25 = [v22 isEqualToString:v24];

            if (v25) {
              break;
            }
            if (++v23 == 18)
            {
              uint64_t v23 = 0;
              break;
            }
          }
          v26 = (void *)[objc_alloc(MEMORY[0x263F5D4A8]) initWithName:v6 category:0 language:@"en_US"];
          v27 = v21;
          v28 = (void *)[objc_alloc(MEMORY[0x263F5D4F8]) initWithBundleId:v7 groupId:&stru_26E89F4A0 documentId:&stru_26E89F4A0 date:v21];
          id v29 = objc_alloc_init(MEMORY[0x263F5D4A0]);
          [v29 setEntity:v26];
          [v29 setSource:v28];
          [v29 setAlgorithm:v23];
          v30 = [a1 namedEntityRecordFromPortraitNamedEntityRecord:v29];
          if ([v30 passesFilters]) {
            [v32 addObject:v6];
          }
        }
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v38);
  }

  return v32;
}

+ (void)namedEntityRecordFromPortraitNamedEntityRecord:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 entity];
  id v5 = [v4 name];
  uint64_t v6 = [v5 UTF8String];
  uint64_t v7 = [a1 source];
  uint64_t v8 = [v7 bundleId];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "algorithm"));
  int v10 = 136315650;
  uint64_t v11 = v6;
  __int16 v12 = 2112;
  long long v13 = v8;
  __int16 v14 = 2112;
  unsigned int v15 = v9;
  _os_log_debug_impl(&dword_235496000, a2, OS_LOG_TYPE_DEBUG, "Performed local filtering in InputContext on Portrait entity with name %s, %@, %@", (uint8_t *)&v10, 0x20u);
}

@end