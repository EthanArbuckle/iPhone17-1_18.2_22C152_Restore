@interface _CDSpotlightQuerier
+ (id)mdSearchableQueryAttributes;
+ (id)orQueryStrings:(uint64_t)a1;
+ (id)querySpotlightForPredicateString:(void *)a3 startDate:(void *)a4 endDate:;
+ (id)queryStringWithPredicateStr:(void *)a3 userEmails:(void *)a4 startDate:(void *)a5 endDate:;
+ (uint64_t)queryStringForMail;
+ (uint64_t)queryStringForMessages;
- (NSMutableArray)requestQuery:(uint64_t)a1;
@end

@implementation _CDSpotlightQuerier

- (NSMutableArray)requestQuery:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(_CDMDSearchQueryDelegate);
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    -[_DKPredictionTimeline setStartDate:]((uint64_t)v4, v5);

    [v3 setDelegate:v4];
    [v3 start];
    if (v4)
    {
      v6 = v4->_mdQuerySem;
      dispatch_time_t v7 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v6, v7);

      [v3 cancel];
      recentMDSearchQueryResults = v4->_recentMDSearchQueryResults;
    }
    else
    {
      dispatch_time_t v11 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(0, v11);
      [v3 cancel];
      recentMDSearchQueryResults = 0;
    }
    v9 = recentMDSearchQueryResults;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)querySpotlightForPredicateString:(void *)a3 startDate:(void *)a4 endDate:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = self;
  v10 = objc_alloc_init(_CDSpotlightQuerier);
  dispatch_time_t v11 = +[_CDSpotlightQuerier queryStringWithPredicateStr:userEmails:startDate:endDate:](v9, v8, 0, v7, v6);

  v12 = +[_CDSpotlightQuerier mdSearchableQueryAttributes]();
  if (v12)
  {
    v13 = getMDSearchQueryOptionFetchAttributes();
    v19 = v13;
    v20[0] = v12;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F1CC08];
  }
  MDSearchQueryClass = (objc_class *)getMDSearchQueryClass();
  if (MDSearchQueryClass)
  {
    v16 = (void *)[[MDSearchQueryClass alloc] initWithQueryString:v11 options:v14];
    v17 = -[_CDSpotlightQuerier requestQuery:]((uint64_t)v10, v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)queryStringWithPredicateStr:(void *)a3 userEmails:(void *)a4 startDate:(void *)a5 endDate:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v38 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  self;
  id v11 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v36 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  objc_msgSend(v11, "setLocale:");
  [v11 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
  v12 = NSString;
  v13 = [v11 stringFromDate:v9];
  v37 = v11;
  v14 = [v11 stringFromDate:v10];
  v35 = [v12 stringWithFormat:@"(InRange(kMDItemContentCreationDate, $time.iso(%@), $time.iso(%@)))", v13, v14];

  v15 = [MEMORY[0x1E4F28E78] string];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v44 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        if ([v15 length]) {
          v22 = @" || ";
        }
        else {
          v22 = &stru_1EDDE58B8;
        }
        [v15 appendFormat:@"%@%@=\"%@\"", v22, 0, v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v18);
  }

  v23 = [MEMORY[0x1E4F28E78] string];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v24 = v16;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v39 + 1) + 8 * j);
        if ([v23 length]) {
          v30 = @" || ";
        }
        else {
          v30 = &stru_1EDDE58B8;
        }
        [v23 appendFormat:@"%@%@=\"%@\"", v30, 0, v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v26);
  }

  v31 = [NSString stringWithFormat:@"(%@ || %@)", v15, v23];
  v32 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@ && (%@)", v35, v38];
  v33 = v32;
  if (v24) {
    [v32 appendFormat:@" && %@", v31];
  }

  return v33;
}

+ (id)mdSearchableQueryAttributes
{
  v20[16] = *MEMORY[0x1E4F143B8];
  self;
  v0 = (void *)mdSearchableQueryAttributes_mdSearchQueryAttributes;
  if (!mdSearchableQueryAttributes_mdSearchQueryAttributes)
  {
    uint64_t v19 = getMDItemContentType();
    v20[0] = v19;
    uint64_t v18 = getMDItemContentCreationDate();
    v20[1] = v18;
    uint64_t v17 = getMDItemAccountIdentifier();
    void v20[2] = v17;
    id v16 = getMDItemAuthorPersons();
    v20[3] = v16;
    v15 = getMDItemRecipientEmailAddresses();
    v20[4] = v15;
    v14 = getMDItemPrimaryRecipientPersons();
    v20[5] = v14;
    v1 = getMDItemRecipients();
    v20[6] = v1;
    v2 = getMDItemSubject();
    v20[7] = v2;
    id v3 = getMDItemDisplayName();
    v20[8] = v3;
    v4 = getMDItemMailboxes();
    v20[9] = v4;
    dispatch_semaphore_t v5 = getMDItemEmailHeadersDictionary();
    v20[10] = v5;
    id v6 = getMDItemPrimaryRecipientPersons();
    v20[11] = v6;
    id v7 = getMDItemAdditionalRecipientPersons();
    v20[12] = v7;
    id v8 = getMDItemHiddenAdditionalRecipientPersons();
    v20[13] = v8;
    id v9 = getMDItemAccountHandles();
    v20[14] = v9;
    id v10 = getMDItemAccountIdentifier();
    v20[15] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:16];
    v12 = (void *)mdSearchableQueryAttributes_mdSearchQueryAttributes;
    mdSearchableQueryAttributes_mdSearchQueryAttributes = v11;

    v0 = (void *)mdSearchableQueryAttributes_mdSearchQueryAttributes;
  }
  return v0;
}

+ (uint64_t)queryStringForMail
{
  return [NSString stringWithFormat:@"(%@=com.apple.mail.emlx || %@=public.email-message)", @"kMDItemContentType", @"kMDItemContentType"];
}

+ (uint64_t)queryStringForMessages
{
  return [NSString stringWithFormat:@"(%@=public.message || %@=public.email-message || %@= com.apple.mail.emlx)", @"kMDItemContentType", @"kMDItemContentType", @"kMDItemContentType"];
}

+ (id)orQueryStrings:(uint64_t)a1
{
  id v2 = a2;
  self;
  if ([v2 count])
  {
    id v3 = [v2 componentsJoinedByString:@" || "];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

@end