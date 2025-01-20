@interface SGDeduper
+ (BOOL)eventsHaveSimilarTitles:(id)a3 ekEventFromStore:(id)a4;
+ (id)_dedupeGenericContactDetails:(id)a3;
+ (id)_dedupePostalAddresses:(id)a3;
+ (id)bucketerWithEqualityTest:(id)a3;
+ (id)bucketerWithLabeledBuckets:(id)a3;
+ (id)bucketerWithMapping:(id)a3;
+ (id)dedupe:(id)a3 bucketer:(id)a4 resolver:(id)a5;
+ (id)dedupeContactDetails:(id)a3;
+ (id)resolveByPairs:(id)a3;
+ (id)resolveByScoreBreakTiesArbitrarily:(id)a3;
+ (id)resolveSGContactDetailsPreferringPhraseExtractionsAndLabels;
+ (id)splitContactDetailsByType:(id)a3;
+ (unsigned)eventsHaveIdenticalReservationIds:(id)a3 ekEventFromStore:(id)a4;
+ (void)enumerateEKEventsForPseudoEventBySimilarStartAndEndTime:(id)a3 store:(id)a4 usingBlock:(id)a5;
@end

@implementation SGDeduper

+ (id)splitContactDetailsByType:(id)a3
{
  id v3 = a3;
  v4 = +[SGDeduper bucketerWithLabeledBuckets:&__block_literal_global_46];
  v5 = ((void (**)(void, id))v4)[2](v4, v3);

  return v5;
}

uint64_t __39__SGDeduper_splitContactDetailsByType___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 type];
  return [v2 numberWithUnsignedInteger:v3];
}

+ (id)dedupeContactDetails:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"SGDeduper.m", 340, @"Invalid parameter not satisfying: %@", @"details" object file lineNumber description];
  }
  v6 = +[SGDeduper bucketerWithMapping:&__block_literal_global_40];
  v7 = +[SGDeduper resolveSGContactDetailsPreferringPhraseExtractionsAndLabels];
  v8 = +[SGDeduper dedupe:v5 bucketer:v6 resolver:v7];

  v9 = objc_opt_new();
  v10 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v16 type] == 1) {
          v17 = v10;
        }
        else {
          v17 = v9;
        }
        [v17 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  v18 = [a1 _dedupeGenericContactDetails:v9];
  v19 = (void *)[v18 mutableCopy];

  v20 = [a1 _dedupePostalAddresses:v10];
  [v19 addObjectsFromArray:v20];

  return v19;
}

id __34__SGDeduper_dedupeContactDetails___block_invoke(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 label];
  v4 = (void *)v3;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  else {
    id v5 = &stru_1F24EEF20;
  }
  v10[0] = v5;
  v6 = [v2 value];

  if (v6) {
    v7 = v6;
  }
  else {
    v7 = &stru_1F24EEF20;
  }
  v10[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  return v8;
}

+ (id)_dedupeGenericContactDetails:(id)a3
{
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __42__SGDeduper__dedupeGenericContactDetails___block_invoke;
  id v11 = &__block_descriptor_48_e35___NSString_16__0__SGContactDetail_8l;
  SEL v12 = a2;
  id v13 = a1;
  id v3 = a3;
  v4 = +[SGDeduper bucketerWithMapping:&v8];
  id v5 = +[SGDeduper resolveSGContactDetailsPreferringPhraseExtractionsAndLabels];
  v6 = +[SGDeduper dedupe:v3 bucketer:v4 resolver:v5];

  return v6;
}

id __42__SGDeduper__dedupeGenericContactDetails___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 1)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"SGDeduper.m" lineNumber:329 description:@"postal address details should be filtered out"];
  }
  v4 = [v3 normalizedValue];

  return v4;
}

+ (id)_dedupePostalAddresses:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] > 0x14) {
    +[SGDeduper bucketerWithMapping:&__block_literal_global_24];
  }
  else {
  v4 = +[SGDeduper bucketerWithEqualityTest:&__block_literal_global_21];
  }
  id v5 = +[SGDeduper resolveSGContactDetailsPreferringPhraseExtractionsAndLabels];
  v6 = +[SGDeduper dedupe:v3 bucketer:v4 resolver:v5];

  return v6;
}

id __36__SGDeduper__dedupePostalAddresses___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 value];
  id v3 = SGNormalizeAddress(v2);
  v4 = [v3 lowercaseString];

  return v4;
}

uint64_t __36__SGDeduper__dedupePostalAddresses___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 value];
  v6 = [v4 value];

  uint64_t v7 = SGPostalAddressesMatchWithParsed(v5, v6, 0, 0, 0, 0, 1);
  return v7;
}

+ (void)enumerateEKEventsForPseudoEventBySimilarStartAndEndTime:(id)a3 store:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 timeRange];
  SEL v12 = [v11 absoluteRange];
  [v12 start];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v13];

  v15 = [v8 timeRange];
  v16 = [v15 absoluteRange];
  [v16 end];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v17];

  v19 = [v10 predicateForEventsWithStartDate:v14 endDate:v18 calendars:0];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __86__SGDeduper_enumerateEKEventsForPseudoEventBySimilarStartAndEndTime_store_usingBlock___block_invoke;
  v23[3] = &unk_1E65B66F8;
  id v24 = v14;
  id v25 = v8;
  id v26 = v9;
  id v27 = a1;
  id v20 = v9;
  id v21 = v8;
  id v22 = v14;
  [v10 enumerateEventsMatchingPredicate:v19 usingBlock:v23];
}

void __86__SGDeduper_enumerateEKEventsForPseudoEventBySimilarStartAndEndTime_store_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v6 = v3;
  id v5 = [v3 startDate];
  LODWORD(v4) = [v4 isEqualToDate:v5];

  if (v4
    && ([*(id *)(a1 + 56) eventsHaveIdenticalReservationIds:*(void *)(a1 + 40) ekEventFromStore:v6] == 2|| objc_msgSend(*(id *)(a1 + 56), "eventsHaveSimilarTitles:ekEventFromStore:", *(void *)(a1 + 40), v6)&& objc_msgSend(v6, "status") != 3))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

+ (BOOL)eventsHaveSimilarTitles:(id)a3 ekEventFromStore:(id)a4
{
  id v5 = a4;
  id v6 = [a3 title];
  uint64_t v7 = [v5 title];
  if (([v6 isEqualToString:v7] & 1) == 0)
  {
    unint64_t v10 = +[SGLevenshtein distanceBetweenStrings:v6 and:v7];
    unint64_t v11 = [v6 length];
    unint64_t v12 = [v7 length];
    if (v11 <= v12) {
      unint64_t v13 = v12;
    }
    else {
      unint64_t v13 = v11;
    }
    if ((double)v10 / (double)v13 < 0.5)
    {
      _PASGetNounsAndNames();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v14 = v7;
      if ([v8 count])
      {
        v15 = _PASGetNounsAndNames();
        if ([v8 isEqualToArray:v15])
        {
LABEL_10:

          goto LABEL_3;
        }
        unint64_t v16 = [v8 count];
        unint64_t v17 = [v15 count];
        if (v16 >= v17) {
          v18 = v15;
        }
        else {
          v18 = v8;
        }
        if (v16 >= v17) {
          v19 = v8;
        }
        else {
          v19 = v15;
        }
        id v20 = v18;
        id v21 = v19;
        if ((unint64_t)[v20 count] >= 3)
        {
          uint64_t v22 = [v20 count] + 1;
          if (v22 == [v21 count])
          {
            if (![v21 count])
            {

              goto LABEL_10;
            }
            id v31 = v5;
            v32 = v15;
            v33 = v14;
            unint64_t v23 = 0;
            unint64_t v24 = 0;
            do
            {
              if (v24 < [v20 count])
              {
                id v25 = [v20 objectAtIndexedSubscript:v24];
                id v26 = [v21 objectAtIndexedSubscript:v23];
                id v27 = v21;
                id v28 = v20;
                unsigned int v29 = [v25 isEqualToString:v26];

                v24 += v29;
                id v20 = v28;
                id v21 = v27;
              }
              ++v23;
            }
            while (v23 < [v21 count]);

            if (v23 - v24 < 2)
            {
              BOOL v9 = 1;
              id v5 = v31;
              goto LABEL_30;
            }
            id v5 = v31;
LABEL_29:
            BOOL v9 = 0;
            goto LABEL_30;
          }
        }
      }
      goto LABEL_29;
    }
    id v8 = 0;
    goto LABEL_29;
  }
  id v8 = 0;
LABEL_3:
  BOOL v9 = 1;
LABEL_30:

  return v9;
}

+ (unsigned)eventsHaveIdenticalReservationIds:(id)a3 ekEventFromStore:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = objc_msgSend(a3, "tags", 0);
  uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v6);
      }
      unint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
      if ([v10 isEventMetadata])
      {
        unint64_t v11 = [v10 eventMetadata];
        if (v11) {
          break;
        }
      }
      if (v7 == (void *)++v9)
      {
        uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v14 = v11;
    v15 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F5DED0]];
    unint64_t v16 = [v15 firstObject];
    uint64_t v7 = [v16 objectForKeyedSubscript:@"reservationId"];

    if (!v7)
    {
      unint64_t v12 = 0;
      char v13 = 1;
      goto LABEL_18;
    }
    id v6 = [MEMORY[0x1E4F5DA18] eventMetadataFromEKEvent:v5];
    unint64_t v17 = [v6 schemaOrg];
    v18 = [v17 firstObject];
    unint64_t v12 = [v18 objectForKeyedSubscript:@"reservationId"];

    if (v12 && [v7 isEqualToString:v12])
    {

      unsigned __int8 v19 = 2;
      goto LABEL_21;
    }
    char v13 = 0;
  }
  else
  {
LABEL_10:
    unint64_t v12 = 0;
    char v13 = 1;
  }

LABEL_18:
  if (v12) {
    unsigned __int8 v19 = v13;
  }
  else {
    unsigned __int8 v19 = 1;
  }
LABEL_21:

  return v19;
}

+ (id)resolveSGContactDetailsPreferringPhraseExtractionsAndLabels
{
  return +[SGDeduper resolveByScoreBreakTiesArbitrarily:&__block_literal_global_5256];
}

uint64_t __72__SGDeduper_resolveSGContactDetailsPreferringPhraseExtractionsAndLabels__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 label];
  uint64_t v4 = [v3 length];

  if (v4) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = [v2 extractionInfo];
  uint64_t v7 = [v6 extractionType];

  if (v7)
  {
    uint64_t v8 = [v2 extractionInfo];
    uint64_t v9 = [v8 extractionType];

    if (v9 == 2) {
      uint64_t v5 = (v5 + 2);
    }
    else {
      uint64_t v5 = (v5 + 1);
    }
  }

  return v5;
}

+ (id)resolveByScoreBreakTiesArbitrarily:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SGDeduper_resolveByScoreBreakTiesArbitrarily___block_invoke;
  v7[3] = &unk_1E65B66B0;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x1CB79B4C0](v7);

  return v5;
}

id __48__SGDeduper_resolveByScoreBreakTiesArbitrarily___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (!v4) {
    goto LABEL_12;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  uint64_t v7 = *(void *)v17;
  signed int v8 = 0x80000000;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v3);
      }
      unint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      signed int v11 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
      if (v11 > v8)
      {
        signed int v12 = v11;
        id v13 = v10;

        signed int v8 = v12;
        id v6 = v13;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  }
  while (v5);
  if (v6)
  {
    id v20 = v6;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  }
  else
  {
LABEL_12:
    id v14 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

+ (id)resolveByPairs:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__SGDeduper_resolveByPairs___block_invoke;
  v7[3] = &unk_1E65B66B0;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x1CB79B4C0](v7);

  return v5;
}

id __28__SGDeduper_resolveByPairs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (!v4) {
    goto LABEL_13;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  uint64_t v7 = *(void *)v13;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v3);
      }
      if (v6)
      {
        uint64_t v9 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

        id v6 = (id)v9;
      }
      else
      {
        id v6 = *(id *)(*((void *)&v12 + 1) + 8 * i);
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
  }
  while (v5);
  if (v6)
  {
    id v16 = v6;
    unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  }
  else
  {
LABEL_13:
    unint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

+ (id)bucketerWithEqualityTest:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__SGDeduper_bucketerWithEqualityTest___block_invoke;
  v7[3] = &unk_1E65B6688;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x1CB79B4C0](v7);

  return v5;
}

id __38__SGDeduper_bucketerWithEqualityTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v18 = (id)objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v3;
  uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v6 = v18;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v21 != v9) {
                objc_enumerationMutation(v6);
              }
              signed int v11 = *(void **)(*((void *)&v20 + 1) + 8 * j);
              uint64_t v12 = *(void *)(a1 + 32);
              long long v13 = [v11 objectAtIndexedSubscript:0];
              LODWORD(v12) = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v5, v13);

              if (v12)
              {
                [v11 addObject:v5];
                goto LABEL_16;
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v8) {
              continue;
            }
            break;
          }
        }

        uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v5, 0);
        [v6 addObject:v14];
        id v6 = (id)v14;
LABEL_16:
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }

  return v18;
}

+ (id)bucketerWithLabeledBuckets:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__SGDeduper_bucketerWithLabeledBuckets___block_invoke;
  v7[3] = &unk_1E65B6660;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x1CB79B4C0](v7);

  return v5;
}

id __40__SGDeduper_bucketerWithLabeledBuckets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
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
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        signed int v11 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        uint64_t v12 = objc_msgSend(v4, "objectForKeyedSubscript:", v11, (void)v14);
        if (!v12)
        {
          uint64_t v12 = objc_opt_new();
          [v4 setObject:v12 forKeyedSubscript:v11];
        }
        [v12 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)bucketerWithMapping:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__SGDeduper_bucketerWithMapping___block_invoke;
  v7[3] = &unk_1E65B6638;
  id v8 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1CB79B4C0](v7);

  return v5;
}

id __33__SGDeduper_bucketerWithMapping___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * v9);
        signed int v11 = (void *)MEMORY[0x1CB79B230](v6);
        uint64_t v12 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        long long v13 = objc_msgSend(v4, "objectForKeyedSubscript:", v12, (void)v17);
        if (!v13)
        {
          long long v13 = objc_opt_new();
          [v4 setObject:v13 forKeyedSubscript:v12];
        }
        [v13 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  long long v14 = (void *)MEMORY[0x1CB79B230]();
  long long v15 = [v4 allValues];

  return v15;
}

+ (id)dedupe:(id)a3 bucketer:(id)a4 resolver:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v30 = (void (**)(id, void *))a5;
  CFMutableSetRef Mutable = CFSetCreateMutable(0, 16, 0);
  if (!Mutable)
  {
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v26);
  }
  uint64_t v10 = Mutable;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v28 = v8;
  unsigned int v29 = v7;
  signed int v11 = (*((void (**)(id, id))v8 + 2))(v8, v7);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if ((unint64_t)[v15 count] < 2)
        {
          long long v16 = [v15 objectAtIndexedSubscript:0];
          CFSetAddValue(v10, v16);
        }
        else
        {
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v16 = v30[2](v30, v15);
          uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v36;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v36 != v18) {
                  objc_enumerationMutation(v16);
                }
                CFSetAddValue(v10, *(const void **)(*((void *)&v35 + 1) + 8 * j));
              }
              uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
            }
            while (v17);
          }
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v12);
  }

  long long v20 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v21 = v29;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v21);
        }
        long long v25 = *(const void **)(*((void *)&v31 + 1) + 8 * k);
        if (CFSetContainsValue(v10, v25))
        {
          [v20 addObject:v25];
          CFSetRemoveValue(v10, v25);
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v22);
  }

  CFRelease(v10);
  return v20;
}

@end