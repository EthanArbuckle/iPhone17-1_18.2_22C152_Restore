@interface ASFetchActivityStream
- (ASFetchActivityStream)fetchActivityStreamWithPredicate:(id)a3 completion:(id)a4;
- (void)performWithCompletion:(id)a3;
@end

@implementation ASFetchActivityStream

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(ASFetchActivityStream *)self fromDate];
  v6 = [(ASFetchActivityStream *)self toDate];
  v7 = +[ASDateUtils predicateForEventsWithDateRangeFromDate:v5 toDate:v6];

  if (v7)
  {
    v8 = +[NSMutableArray array];
    [v8 addObject:v7];
    v9 = [(ASFetchActivityStream *)self activityType];

    if (v9)
    {
      v10 = [(ASFetchActivityStream *)self activityType];
      v11 = +[_DKAnyStringIdentifier withValue:v10];
      v12 = +[_DKQuery predicateForEventsWithIdentifierValue:v11];

      if (v12) {
        [v8 addObject:v12];
      }
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v13 = [(ASFetchActivityStream *)self matchingMetadataKeys];
    id v14 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = +[_DKQuery predicateForObjectsWithMetadataKey:*(void *)(*((void *)&v27 + 1) + 8 * (void)v17)];
          if (v18) {
            [v8 addObject:v18];
          }

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v15);
    }

    v19 = [(ASFetchActivityStream *)self matchingMetadataKeysAndStringValues];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_19B0;
    v25[3] = &unk_C3B0;
    id v20 = v8;
    id v26 = v20;
    [v19 enumerateKeysAndObjectsUsingBlock:v25];

    v21 = +[NSCompoundPredicate andPredicateWithSubpredicates:v20];
    v22 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[ASFetchActivityStream performWithCompletion:]";
      __int16 v33 = 2112;
      v34 = v21;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "%s fetch activity predicate %@", buf, 0x16u);
    }
    [(ASFetchActivityStream *)self fetchActivityStreamWithPredicate:v21 completion:v4];

    id v23 = v26;
    goto LABEL_21;
  }
  id v20 = +[NSString stringWithFormat:@"Invalid ace command %@", self];
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
  {
    sub_734C();
    if (!v4) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  if (v4)
  {
LABEL_20:
    id v23 = [objc_alloc((Class)SACommandFailed) initWithReason:v20];
    v24 = [v23 dictionary];
    v4[2](v4, v24);

LABEL_21:
  }
LABEL_22:
}

- (ASFetchActivityStream)fetchActivityStreamWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[ASStorageUtils duetStoreForCommand:self];
  v9 = [(ASFetchActivityStream *)self limit];
  id v10 = [v9 integerValue];

  if (!v10)
  {
    v11 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v55 = "-[ASFetchActivityStream fetchActivityStreamWithPredicate:completion:]";
      __int16 v56 = 2048;
      id v10 = &stru_3D8 + 16;
      uint64_t v57 = 1000;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%s limit is 0. Defaulting to kMaxActivityStreamSize = %zu", buf, 0x16u);
    }
    else
    {
      id v10 = &stru_3D8 + 16;
    }
  }
  id v45 = objc_alloc_init((Class)SAActivityStream);
  v12 = &AFSharedResourcesDirectory_ptr;
  v13 = [(ASFetchActivityStream *)self streamTypes];
  id v14 = [v13 count];
  if ((unint64_t)v14 <= 1) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = (uint64_t)v14;
  }
  uint64_t v16 = +[NSMutableArray arrayWithCapacity:v15];

  v17 = [(ASFetchActivityStream *)self streamTypes];
  id v18 = [v17 count];

  if (v18)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v20 = [(ASFetchActivityStream *)self streamTypes];
    id v21 = [v20 countByEnumeratingWithState:&v50 objects:v64 count:16];
    if (v21)
    {
      id v22 = v21;
      id v44 = v7;
      id v23 = v8;
      id v24 = v6;
      uint64_t v25 = *(void *)v51;
      do
      {
        id v26 = 0;
        do
        {
          if (*(void *)v51 != v25) {
            objc_enumerationMutation(v20);
          }
          long long v27 = sub_1EF0((uint64_t)v21, *(void **)(*((void *)&v50 + 1) + 8 * (void)v26));
          [v16 addObject:v27];

          id v26 = (char *)v26 + 1;
        }
        while (v22 != v26);
        id v21 = [v20 countByEnumeratingWithState:&v50 objects:v64 count:16];
        id v22 = v21;
      }
      while (v21);
      id v6 = v24;
      v8 = v23;
      id v7 = v44;
      v12 = &AFSharedResourcesDirectory_ptr;
    }
  }
  else
  {
    id v20 = sub_1EF0(v19, @"com.apple.internal.siri.guidance");
    [v16 addObject:v20];
  }

  id v28 = objc_alloc_init((Class)v12[67]);
  long long v29 = [(ASFetchActivityStream *)self sortBy];
  unsigned int v30 = [v29 isEqualToString:SAActivityStreamSortDescriptorStartDateValue];

  if (v30)
  {
    uint64_t v31 = +[_DKQuery startDateSortDescriptorAscending:[(ASFetchActivityStream *)self ascending]];
  }
  else
  {
    v32 = [(ASFetchActivityStream *)self sortBy];
    unsigned int v33 = [v32 isEqualToString:SAActivityStreamSortDescriptorEndDateValue];

    if (!v33) {
      goto LABEL_23;
    }
    uint64_t v31 = +[_DKQuery endDateSortDescriptorAscending:[(ASFetchActivityStream *)self ascending]];
  }
  v34 = (void *)v31;
  [v28 addObject:v31];

LABEL_23:
  v35 = (void *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
  {
    v36 = v35;
    uint64_t v37 = [(ASFetchActivityStream *)self streamTypes];
    v38 = (void *)v37;
    CFStringRef v39 = @"com.apple.internal.siri.guidance";
    if (v37) {
      CFStringRef v39 = (const __CFString *)v37;
    }
    *(_DWORD *)buf = 136316162;
    v55 = "-[ASFetchActivityStream fetchActivityStreamWithPredicate:completion:]";
    __int16 v56 = 2112;
    uint64_t v57 = (uint64_t)v39;
    __int16 v58 = 2112;
    id v59 = v6;
    __int16 v60 = 2048;
    id v61 = v10;
    __int16 v62 = 2112;
    id v63 = v28;
    _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "%s querying streams [%@] with predicate [%@] limit [%zd] sortDescriptors [%@]", buf, 0x34u);
  }
  +[_DKEventQuery eventQueryWithPredicate:v6 eventStreams:v16 offset:0 limit:v10 sortDescriptors:v28];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1F70;
  v46[3] = &unk_C3D8;
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  id v48 = v45;
  id v49 = v7;
  id v40 = v7;
  id v41 = v45;
  id v42 = v47;
  [v8 executeQuery:v42 responseQueue:0 withCompletion:v46];

  return result;
}

@end