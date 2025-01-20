@interface ASRemoveFromActivityStream
- (ASRemoveFromActivityStream)removeFromActivityStreamWithPredicate:(id)a3 completion:(id)a4;
- (void)performWithCompletion:(id)a3;
@end

@implementation ASRemoveFromActivityStream

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(ASRemoveFromActivityStream *)self fromDate];
  v6 = [(ASRemoveFromActivityStream *)self toDate];
  v7 = +[ASDateUtils predicateForEventsWithDateRangeFromDate:v5 toDate:v6];

  if (v7)
  {
    v8 = [(ASRemoveFromActivityStream *)self activityType];

    if (v8)
    {
      v9 = [(ASRemoveFromActivityStream *)self activityType];
      v10 = +[_DKAnyStringIdentifier withValue:v9];
      v11 = +[_DKQuery predicateForEventsWithIdentifierValue:v10];

      v22[0] = v7;
      v22[1] = v11;
      v12 = +[NSArray arrayWithObjects:v22 count:2];
      id v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];
    }
    else
    {
      id v13 = v7;
    }
    v17 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[ASRemoveFromActivityStream performWithCompletion:]";
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "%s remove activity predicate %@", buf, 0x16u);
    }
    [(ASRemoveFromActivityStream *)self removeFromActivityStreamWithPredicate:v13 completion:v4];
  }
  else
  {
    id v13 = +[NSString stringWithFormat:@"Invalid ace command %@", self];
    v14 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[ASRemoveFromActivityStream performWithCompletion:]";
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
    if (v4)
    {
      id v15 = [objc_alloc((Class)SACommandFailed) initWithReason:v13];
      v16 = [v15 dictionary];
      v4[2](v4, v16);
    }
  }
}

- (ASRemoveFromActivityStream)removeFromActivityStreamWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[ASStorageUtils duetStoreForCommand:self];
  uint64_t v9 = [(ASRemoveFromActivityStream *)self streamType];
  v10 = (void *)v9;
  v11 = @"com.apple.internal.siri.guidance";
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v12 = v11;

  id v13 = +[_DKAnyStringIdentifier type];
  v14 = +[_DKEventStream eventStreamWithName:v12 valueType:v13];

  id v15 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "-[ASRemoveFromActivityStream removeFromActivityStreamWithPredicate:completion:]";
    __int16 v29 = 2112;
    v30 = v14;
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%s deleting activities from streams [%@] with predicate [%@]", buf, 0x20u);
  }
  v26 = v14;
  v16 = +[NSArray arrayWithObjects:&v26 count:1];
  v17 = +[_DKEventQuery eventQueryWithPredicate:v6 eventStreams:v16 offset:0 limit:0 sortDescriptors:0];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  void v22[2] = sub_3A34;
  v22[3] = &unk_C438;
  id v24 = v8;
  id v25 = v7;
  id v23 = v17;
  id v18 = v8;
  id v19 = v7;
  id v20 = v17;
  [v18 executeQuery:v20 responseQueue:0 withCompletion:v22];

  return result;
}

@end