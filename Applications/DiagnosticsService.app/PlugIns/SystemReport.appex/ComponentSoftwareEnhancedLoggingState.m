@interface ComponentSoftwareEnhancedLoggingState
- (BOOL)isPresent;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentSoftwareEnhancedLoggingState

- (BOOL)isPresent
{
  return 1;
}

- (void)populateAttributes:(id)a3
{
  id v3 = a3;
  v4 = +[ELSManager sharedManager];
  v5 = [v4 snapshot];

  v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 status]);
  [v3 setObject:v6 forKeyedSubscript:ELSDefaultStatus];

  v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 consent]);
  [v3 setObject:v7 forKeyedSubscript:ELSDefaultConsent];

  v8 = +[DSDateFormatter sharedFormatter];
  v9 = [v8 formatterWithType:0];

  v10 = [v5 startDate];

  if (v10)
  {
    v11 = [v5 startDate];
    v12 = [v9 stringFromDate:v11];
    [v3 setObject:v12 forKeyedSubscript:ELSSubDefaultDatesStart];
  }
  v13 = [v5 endDate];

  if (v13)
  {
    v14 = [v5 endDate];
    v15 = [v9 stringFromDate:v14];
    [v3 setObject:v15 forKeyedSubscript:ELSSubDefaultDatesEnd];
  }
  v16 = [v5 queue];

  if (v16)
  {
    v36 = v9;
    v38 = v3;
    v40 = +[NSMutableArray array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v37 = v5;
    id obj = [v5 queue];
    id v17 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v42;
      uint64_t v20 = ELSSubDefaultQueueEntryType;
      uint64_t v21 = ELSSubDefaultQueueEntryExecuteAfterDuration;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v42 != v19) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v24 = [v23 type];
          v25 = +[ELSWhitelist findEntryForBundleIdentifier:v24];

          if (v25)
          {
            v45[0] = v20;
            v26 = [v25 parameterName];
            v45[1] = v21;
            v46[0] = v26;
            [v23 executeAfterDuration];
            v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            v46[1] = v27;
            v28 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
            [v40 addObject:v28];
          }
        }
        id v18 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v18);
    }

    id v3 = v38;
    [v38 setObject:v40 forKeyedSubscript:ELSDefaultQueue];

    v9 = v36;
    v5 = v37;
  }
  v29 = [v5 metadata];

  if (v29)
  {
    v30 = [v5 metadata];
    uint64_t v31 = ELSMetadataEnrollmentTicketNumber;
    v32 = [v30 objectForKeyedSubscript:ELSMetadataEnrollmentTicketNumber];

    if (v32) {
      [v3 setObject:v32 forKeyedSubscript:v31];
    }
    v33 = [v5 metadata];
    uint64_t v34 = ELSMetadataGigafilesToken;
    v35 = [v33 objectForKeyedSubscript:ELSMetadataGigafilesToken];

    if (v35) {
      [v3 setObject:v35 forKeyedSubscript:v34];
    }
  }
}

@end