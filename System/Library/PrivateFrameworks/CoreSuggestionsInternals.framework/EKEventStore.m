@interface EKEventStore
@end

@implementation EKEventStore

id __53__EKEventStore_Suggestions__eventsPerWeekAroundDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 calendar];
  if ([v3 isSubscribedHolidayCalendar]) {
    goto LABEL_8;
  }
  v4 = [v2 calendar];
  if ([v4 isFacebookBirthdayCalendar])
  {
LABEL_7:

LABEL_8:
LABEL_9:
    id v7 = 0;
    goto LABEL_10;
  }
  v5 = [v2 calendar];
  if ([v5 isSuggestedEventCalendar])
  {
LABEL_6:

    goto LABEL_7;
  }
  v6 = [v2 calendar];
  if ([v6 isNaturalLanguageSuggestedEventCalendar])
  {

    goto LABEL_6;
  }
  v9 = [v2 calendar];
  uint64_t v10 = [v9 type];

  if (v10 == 4) {
    goto LABEL_9;
  }
  id v7 = v2;
LABEL_10:

  return v7;
}

uint64_t __81__EKEventStore_Suggestions__sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 calendar];
  uint64_t v3 = [v2 isNaturalLanguageSuggestedEventCalendar];

  return v3;
}

uint64_t __81__EKEventStore_Suggestions__sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction___block_invoke()
{
  sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__lock = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

void __82__EKEventStore_Suggestions___sg_fetchEKEventsForPseudoNLEvent_title_participants___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 calendar];
  if ([v4 isSuggestedEventCalendar]) {
    goto LABEL_27;
  }
  v5 = [v3 calendar];
  char v6 = [v5 isNaturalLanguageSuggestedEventCalendar];

  if ((v6 & 1) == 0)
  {
    v4 = [v3 title];
    if (([v4 isEqualToString:*(void *)(a1 + 32)] & 1) == 0
      && ((unint64_t)[v4 length] < 2
       || (unint64_t)[*(id *)(a1 + 40) length] < 2
       || ([*(id *)(a1 + 40) localizedCaseInsensitiveContainsString:v4] & 1) == 0))
    {
      id v7 = [v3 attendees];
      if (![v7 count])
      {

        goto LABEL_27;
      }
      uint64_t v8 = *(void *)(a1 + 48);

      if (!v8) {
        goto LABEL_27;
      }
      v20 = v4;
      v9 = objc_opt_new();
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v10 = [v3 attendees];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (objc_msgSend(v15, "participantType", v20) == 1)
            {
              v16 = [v15 URL];
              v17 = [v16 absoluteString];

              if (v17 && ([@"invalid:nomail" isEqual:v17] & 1) == 0)
              {
                if ([v17 hasPrefix:@"mailto:"])
                {
                  uint64_t v18 = [v17 substringFromIndex:7];

                  v17 = (void *)v18;
                }
                [v9 addObject:v17];
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v12);
      }

      int v19 = [*(id *)(a1 + 48) isEqual:v9];
      v4 = v20;
      if (!v19) {
        goto LABEL_27;
      }
    }
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "addObject:", v3, v20);
LABEL_27:
  }
}

void __86__EKEventStore_Suggestions__sg_fetchEKEventsForPseudoEventBySimilarTitleAndStartTime___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 calendar];
  if ([v3 isSuggestedEventCalendar])
  {
  }
  else
  {
    v4 = [v6 calendar];
    char v5 = [v4 isNaturalLanguageSuggestedEventCalendar];

    if ((v5 & 1) == 0) {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
    }
  }
}

void __63__EKEventStore_Suggestions__sg_usingSharedStoreForReadingOnly___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F93B60]) initWithBlock:&__block_literal_global_7_34073 idleTimeout:1.0];
  id v2 = (void *)sg_usingSharedStoreForReadingOnly___pasExprOnceResult;
  sg_usingSharedStoreForReadingOnly___pasExprOnceResult = v1;
}

uint64_t __63__EKEventStore_Suggestions__sg_usingSharedStoreForReadingOnly___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E4F25550], "sg_newStore");
}

@end