@interface ASDonateRankedQueriesToPortrait
- (id)getPortraitQueryResults;
- (void)performWithCompletion:(id)a3;
@end

@implementation ASDonateRankedQueriesToPortrait

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(ASDonateRankedQueriesToPortrait *)self utterance];
  if (v5)
  {
    uint64_t v6 = [(ASDonateRankedQueriesToPortrait *)self queryDonations];
    if (v6
      && (v7 = (void *)v6,
          [(ASDonateRankedQueriesToPortrait *)self queryDonations],
          v8 = objc_claimAutoreleasedReturnValue(),
          id v9 = [v8 count],
          v8,
          v7,
          v9))
    {
      v10 = [(ASDonateRankedQueriesToPortrait *)self getPortraitQueryResults];
      id v20 = 0;
      unsigned int v11 = +[PPCustomDonation donateSiriQuery:v5 results:v10 error:&v20];
      id v12 = v20;
      v13 = v12;
      if (v11)
      {

LABEL_14:
        if (!v4)
        {
          v14 = 0;
          goto LABEL_12;
        }
        v19 = AFSiriLogContextService;
        if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v22 = "-[ASDonateRankedQueriesToPortrait performWithCompletion:]";
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "%s Donation to Portrait successful", buf, 0xCu);
        }
        id v16 = objc_alloc_init((Class)SACommandSucceeded);
        v14 = 0;
        goto LABEL_11;
      }
      v18 = [v12 localizedDescription];
      v14 = +[NSString stringWithFormat:@"donation failed: %@", v18];

      if (!v14) {
        goto LABEL_14;
      }
    }
    else
    {
      v14 = @"queryDonations is missing or empty";
    }
  }
  else
  {
    v14 = @"utterance is missing";
  }
  v15 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
  {
    sub_7834((uint64_t)v14, v15);
    if (!v4) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (v4)
  {
LABEL_10:
    id v16 = [objc_alloc((Class)SACommandFailed) initWithReason:v14];
LABEL_11:
    v17 = [v16 dictionary];
    v4[2](v4, v17);
  }
LABEL_12:
}

- (id)getPortraitQueryResults
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"rank" ascending:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = [(ASDonateRankedQueriesToPortrait *)self queryDonations];
  v19 = v4;
  id v25 = v4;
  uint64_t v6 = +[NSArray arrayWithObjects:&v25 count:1];
  v7 = [v5 sortedArrayUsingDescriptors:v6];

  id obj = v7;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v13 = objc_alloc((Class)PPSiriQueryResult);
        v14 = [v12 qid];
        v15 = [v12 domain];
        id v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 rank]);
        id v17 = [v13 initWithQid:v14 domain:v15 confidence:v16];

        [v3 addObject:v17];
      }
      id v9 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  return v3;
}

@end