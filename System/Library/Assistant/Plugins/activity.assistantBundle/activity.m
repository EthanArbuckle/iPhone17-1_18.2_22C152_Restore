uint64_t sub_19B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t vars8;

  v4 = +[_DKQuery predicateForObjectsWithMetadataKey:a2 andStringValue:a3];
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }

  return _objc_release_x1();
}

id sub_1EF0(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[_DKAnyStringIdentifier type];
  v4 = +[_DKEventStream eventStreamWithName:v2 valueType:v3];

  return v4;
}

void sub_1F70(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = [v6 localizedDescription];
    id v10 = +[NSString stringWithFormat:@"%@ error. %@", v8, v9];

    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR)) {
      sub_744C();
    }
    id v11 = [objc_alloc((Class)SACommandFailed) initWithReason:v10];
    v12 = [v11 dictionary];
  }
  else
  {
    id v10 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 count])
    {
      v43 = +[NSMutableArray array];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v10 = v10;
      id v13 = [v10 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v13)
      {
        id v14 = v13;
        id v41 = v5;
        uint64_t v42 = *(void *)v45;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v45 != v42) {
              objc_enumerationMutation(v10);
            }
            v16 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || ([v16 value],
                  v17 = objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  char isKindOfClass = objc_opt_isKindOfClass(),
                  v17,
                  (isKindOfClass & 1) == 0))
            {
              v27 = +[NSString stringWithFormat:@"Could not create activity from stored value: %@", v16];
              if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR)) {
                sub_744C();
              }
              id v28 = [objc_alloc((Class)SACommandFailed) initWithReason:v27];
              v29 = [v28 dictionary];

              id v5 = v41;
              goto LABEL_21;
            }
            v19 = [v16 value];
            v20 = [v19 stringValue];

            v21 = +[SAActivityObject activityObject];
            v22 = [v16 stream];
            v23 = [v22 name];
            [v21 setStreamType:v23];

            [v21 setType:v20];
            v24 = [v16 startDate];
            [v21 setStartDate:v24];

            v25 = [v16 endDate];
            [v21 setEndDate:v25];

            v26 = [v16 metadata];
            [v21 setMetadata:v26];

            [v43 addObject:v21];
          }
          id v14 = [v10 countByEnumeratingWithState:&v44 objects:v52 count:16];
          id v5 = v41;
          if (v14) {
            continue;
          }
          break;
        }
      }
LABEL_21:

      v30 = AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v49 = "-[ASFetchActivityStream fetchActivityStreamWithPredicate:completion:]_block_invoke";
        __int16 v50 = 2112;
        v51 = v43;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "%s activities retrieved: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 40) setActivities:v43];
      v12 = [*(id *)(a1 + 40) dictionary];
    }
    else
    {
      [*(id *)(a1 + 40) setActivities:&__NSArray0__struct];
      v12 = [*(id *)(a1 + 40) dictionary];
    }
  }

  uint64_t v31 = *(void *)(a1 + 48);
  if (v31)
  {
    if (!v12)
    {
      v32 = AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR)) {
        sub_73C0(v32, v33, v34, v35, v36, v37, v38, v39);
      }
      id v40 = [objc_alloc((Class)SACommandFailed) initWithReason:@"FATAL: Response not constructed!"];
      v12 = [v40 dictionary];

      uint64_t v31 = *(void *)(a1 + 48);
    }
    (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v12);
  }
}

void sub_2450(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_3A34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [a3 localizedDescription];
    id v9 = +[NSString stringWithFormat:@"%@ error. %@", v7, v8];

    id v10 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[ASRemoveFromActivityStream removeFromActivityStreamWithPredicate:completion:]_block_invoke";
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11)
    {
      id v12 = [objc_alloc((Class)SACommandFailed) initWithReason:v9];
LABEL_15:
      v16 = v12;
      v18 = [v12 dictionary];
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v18);

LABEL_16:
    }
  }
  else
  {
    id v9 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 count])
    {
      id v13 = (void *)AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = v13;
        *(_DWORD *)buf = 136315394;
        v24 = "-[ASRemoveFromActivityStream removeFromActivityStreamWithPredicate:completion:]_block_invoke";
        __int16 v25 = 2048;
        id v26 = [v9 count];
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%s asking CoreDuet to remove %zd intents", buf, 0x16u);
      }
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_3D44;
      v19[3] = &unk_C410;
      v15 = *(void **)(a1 + 40);
      id v20 = *(id *)(a1 + 32);
      id v22 = *(id *)(a1 + 48);
      id v9 = v9;
      id v21 = v9;
      [v15 deleteObjects:v9 responseQueue:0 withCompletion:v19];

      v16 = v20;
      goto LABEL_16;
    }
    v17 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[ASRemoveFromActivityStream removeFromActivityStreamWithPredicate:completion:]_block_invoke";
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%s no activities to delete. Returning success", buf, 0xCu);
    }
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11)
    {
      id v12 = objc_alloc_init((Class)SACommandSucceeded);
      goto LABEL_15;
    }
  }
}

void sub_3D44(void *a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 1) == 0)
  {
    uint64_t v12 = a1[4];
    id v13 = [v5 localizedDescription];
    id v10 = +[NSString stringWithFormat:@"%@ error. %@", v12, v13];

    id v14 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[ASRemoveFromActivityStream removeFromActivityStreamWithPredicate:completion:]_block_invoke";
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
    uint64_t v15 = a1[6];
    if (!v15) {
      goto LABEL_11;
    }
    id v11 = [objc_alloc((Class)SACommandFailed) initWithReason:v10];
    v16 = [v11 dictionary];
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

LABEL_10:
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v7 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)a1[5];
    *(_DWORD *)buf = 136315394;
    v18 = "-[ASRemoveFromActivityStream removeFromActivityStreamWithPredicate:completion:]_block_invoke";
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s the following activities were deleted successfully: %@", buf, 0x16u);
  }
  uint64_t v9 = a1[6];
  if (v9)
  {
    id v10 = objc_alloc_init((Class)SACommandSucceeded);
    id v11 = [v10 dictionary];
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v11);
    goto LABEL_10;
  }
LABEL_12:
}

void sub_47EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v8 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 count])
    {
      uint64_t v9 = AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315394;
        id v13 = "-[ASRecordActivity deleteActivitiesOlderThanDays:withCompletion:]_block_invoke";
        __int16 v14 = 2112;
        id v15 = v8;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%s activities to delete: %@", (uint8_t *)&v12, 0x16u);
      }
      if ([v8 count])
      {
        [*(id *)(a1 + 32) deleteObjects:v8 responseQueue:0 withCompletion:*(void *)(a1 + 40)];
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v11 = *(void *)(a1 + 40);
      if (!v11) {
        goto LABEL_16;
      }
    }
    else
    {
      id v10 = AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315394;
        id v13 = "-[ASRecordActivity deleteActivitiesOlderThanDays:withCompletion:]_block_invoke";
        __int16 v14 = 2112;
        id v15 = v8;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "%s result = %@", (uint8_t *)&v12, 0x16u);
      }
      uint64_t v11 = *(void *)(a1 + 40);
    }
    (*(void (**)(uint64_t, uint64_t, void))(v11 + 16))(v11, 1, 0);
    goto LABEL_16;
  }
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR)) {
    sub_764C();
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
  }
LABEL_17:
}

void sub_4B98(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR)) {
      sub_76C0();
    }
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
    }
  }
  else
  {
    id v8 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 count])
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_4E20;
      v13[3] = &unk_C488;
      id v14 = *(id *)(a1 + 32);
      uint64_t v9 = [v8 indexesOfObjectsPassingTest:v13];
      id v10 = [v8 objectsAtIndexes:v9];
      uint64_t v11 = AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[ASRecordActivity deleteOlderSessionActivities:withCompletion:]_block_invoke_2";
        __int16 v17 = 2112;
        id v18 = v10;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%s activities to delete: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 40) deleteObjects:v10 responseQueue:0 withCompletion:*(void *)(a1 + 48)];
    }
    else
    {
      int v12 = AFSiriLogContextService;
      if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[ASRecordActivity deleteOlderSessionActivities:withCompletion:]_block_invoke";
        __int16 v17 = 2112;
        id v18 = v8;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "%s result = %@", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

uint64_t sub_4E20(uint64_t a1, void *a2)
{
  v3 = [a2 metadata];
  v4 = [v3 objectForKey:@"sessionId"];

  if ([v4 length]) {
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_50F4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    int v12 = 136315394;
    id v13 = "-[ASRecordActivity recordActivityWithCompletion:]_block_invoke";
    __int16 v14 = 2112;
    CFStringRef v15 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%s activities deleted -> %@", (uint8_t *)&v12, 0x16u);
  }
  id v8 = (void *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = v8;
    uint64_t v11 = [v9 activity];
    int v12 = 136315394;
    id v13 = "-[ASRecordActivity recordActivityWithCompletion:]_block_invoke";
    __int16 v14 = 2112;
    CFStringRef v15 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s recording %@", (uint8_t *)&v12, 0x16u);
  }
  [*(id *)(a1 + 32) _recordActivityWithCompletion:*(void *)(a1 + 40)];
}

void sub_5464(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    CFStringRef v7 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      id v13 = "-[ASRecordActivity _recordActivityWithCompletion:]_block_invoke";
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s success -> YES", (uint8_t *)&v12, 0xCu);
    }
    id v8 = (__CFString *)objc_alloc_init((Class)SACommandSucceeded);
    uint64_t v9 = [(__CFString *)v8 dictionary];
  }
  else
  {
    if (v5)
    {
      id v8 = [v5 localizedDescription];
    }
    else
    {
      id v8 = @"can't record event";
    }
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR)) {
      sub_77C0();
    }
    id v10 = [objc_alloc((Class)SACommandFailed) initWithReason:v8];
    uint64_t v9 = [v10 dictionary];
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v9);
  }
}

void sub_60EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    [v5 _fetchUserActivityForUUID:a2 withCompletion:v6];
  }
  else
  {
    CFStringRef v7 = +[NSString stringWithFormat:@"Error getting current user activity Error: %@", a4];
    id v8 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[ASFetchUserActivity fetchUserActivityWithCompletion:]_block_invoke";
      __int16 v14 = 2112;
      CFStringRef v15 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
    if (*(void *)(a1 + 40))
    {
      id v9 = [objc_alloc((Class)SACommandFailed) initWithReason:v7];
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = [v9 dictionary];
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
    }
  }
}

void sub_63AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      sub_7940();
    }
    id v7 = objc_alloc((Class)SACommandFailed);
    id v8 = [v6 localizedFailureReason];
    id v9 = [v7 initWithReason:v8];
  }
  else
  {
    id v9 = [v5 clientUserActivity];
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    uint64_t v11 = [v9 dictionary];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
}

void sub_64F8(id a1)
{
  qword_12C58 = +[_DKKnowledgeStore knowledgeStore];

  _objc_release_x1();
}

void sub_658C(id a1)
{
  v1 = AFSharedResourcesDirectory();
  id v4 = [v1 stringByAppendingPathComponent:@"Library/Assistant"];

  uint64_t v2 = +[_DKKnowledgeStorage storageWithDirectory:v4 readOnly:0 localOnly:1];
  v3 = (void *)qword_12C68;
  qword_12C68 = v2;
}

BOOL sub_7074(id a1, NSString *a2, id a3, BOOL *a4)
{
  id v4 = a3;
  id v5 = +[NSNull null];

  return v5 == v4;
}

void sub_734C()
{
  sub_246C();
  sub_2450(&dword_0, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

void sub_73C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_744C()
{
  sub_246C();
  sub_2450(&dword_0, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

void sub_74C0(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[ASDonateSiriQueryToPortrait performWithCompletion:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v2, 0x16u);
}

void sub_754C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[ASStartNavigation startNavigationWithCompletion:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v2, 0x16u);
}

void sub_75D8()
{
  sub_246C();
  sub_2450(&dword_0, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

void sub_764C()
{
  sub_246C();
  sub_2450(&dword_0, v0, v1, "%s error retrieving actvities to delete. %@", v2, v3, v4, v5, 2u);
}

void sub_76C0()
{
  sub_246C();
  sub_2450(&dword_0, v0, v1, "%s error retrieving actvities to delete. %@", v2, v3, v4, v5, 2u);
}

void sub_7734(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_77C0()
{
  sub_246C();
  sub_2450(&dword_0, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

void sub_7834(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[ASDonateRankedQueriesToPortrait performWithCompletion:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v2, 0x16u);
}

void sub_78C0()
{
  v1[0] = 136315394;
  sub_246C();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)v1, 0x16u);
}

void sub_7940()
{
  v1[0] = 136315394;
  sub_246C();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "%s Error getting current user activity from uuid %@", (uint8_t *)v1, 0x16u);
}

void sub_79C0(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[ASRecordLocationActivity recordLocationActivityWithCompletion:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v2, 0x16u);
}

void sub_7A4C(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[ASRecordLocationActivity recordLocationActivityWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v1, 0xCu);
}

uint64_t AFSharedResourcesDirectory()
{
  return _AFSharedResourcesDirectory();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return _CLLocationCoordinate2DIsValid(coord);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__externalMediaContentBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _externalMediaContentBundleIdentifier];
}

id objc_msgSend__uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _uniqueIdentifier];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return [a1 activity];
}

id objc_msgSend_activityObject(void *a1, const char *a2, ...)
{
  return [a1 activityObject];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_addressDictionary(void *a1, const char *a2, ...)
{
  return [a1 addressDictionary];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_ascending(void *a1, const char *a2, ...)
{
  return [a1 ascending];
}

id objc_msgSend_becomeCurrent(void *a1, const char *a2, ...)
{
  return [a1 becomeCurrent];
}

id objc_msgSend_city(void *a1, const char *a2, ...)
{
  return [a1 city];
}

id objc_msgSend_clientUserActivity(void *a1, const char *a2, ...)
{
  return [a1 clientUserActivity];
}

id objc_msgSend_combinedUserInfo(void *a1, const char *a2, ...)
{
  return [a1 combinedUserInfo];
}

id objc_msgSend_contentAttributeSet(void *a1, const char *a2, ...)
{
  return [a1 contentAttributeSet];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_country(void *a1, const char *a2, ...)
{
  return [a1 country];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return [a1 destination];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_directionsType(void *a1, const char *a2, ...)
{
  return [a1 directionsType];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_duetEvent(void *a1, const char *a2, ...)
{
  return [a1 duetEvent];
}

id objc_msgSend_duetEventStream(void *a1, const char *a2, ...)
{
  return [a1 duetEventStream];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return [a1 expirationDate];
}

id objc_msgSend_externalMediaContentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 externalMediaContentIdentifier];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fromDate(void *a1, const char *a2, ...)
{
  return [a1 fromDate];
}

id objc_msgSend_getPortraitQueryResults(void *a1, const char *a2, ...)
{
  return [a1 getPortraitQueryResults];
}

id objc_msgSend_hasLocationData(void *a1, const char *a2, ...)
{
  return [a1 hasLocationData];
}

id objc_msgSend_hasPhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 hasPhoneNumber];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internalGUID(void *a1, const char *a2, ...)
{
  return [a1 internalGUID];
}

id objc_msgSend_isEligibleForHandoff(void *a1, const char *a2, ...)
{
  return [a1 isEligibleForHandoff];
}

id objc_msgSend_isEligibleForPublicIndexing(void *a1, const char *a2, ...)
{
  return [a1 isEligibleForPublicIndexing];
}

id objc_msgSend_isEligibleForSearch(void *a1, const char *a2, ...)
{
  return [a1 isEligibleForSearch];
}

id objc_msgSend_keywords(void *a1, const char *a2, ...)
{
  return [a1 keywords];
}

id objc_msgSend_knowledgeStore(void *a1, const char *a2, ...)
{
  return [a1 knowledgeStore];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_limit(void *a1, const char *a2, ...)
{
  return [a1 limit];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return [a1 localizedFailureReason];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationName(void *a1, const char *a2, ...)
{
  return [a1 locationName];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_mapItem(void *a1, const char *a2, ...)
{
  return [a1 mapItem];
}

id objc_msgSend_mapItemForCurrentLocation(void *a1, const char *a2, ...)
{
  return [a1 mapItemForCurrentLocation];
}

id objc_msgSend_matchingMetadataKeys(void *a1, const char *a2, ...)
{
  return [a1 matchingMetadataKeys];
}

id objc_msgSend_matchingMetadataKeysAndStringValues(void *a1, const char *a2, ...)
{
  return [a1 matchingMetadataKeysAndStringValues];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_namedLocation(void *a1, const char *a2, ...)
{
  return [a1 namedLocation];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_origin(void *a1, const char *a2, ...)
{
  return [a1 origin];
}

id objc_msgSend_originalQuery(void *a1, const char *a2, ...)
{
  return [a1 originalQuery];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return [a1 phoneNumbers];
}

id objc_msgSend_postalCode(void *a1, const char *a2, ...)
{
  return [a1 postalCode];
}

id objc_msgSend_privateDuetStore(void *a1, const char *a2, ...)
{
  return [a1 privateDuetStore];
}

id objc_msgSend_publicDuetStore(void *a1, const char *a2, ...)
{
  return [a1 publicDuetStore];
}

id objc_msgSend_qid(void *a1, const char *a2, ...)
{
  return [a1 qid];
}

id objc_msgSend_queryDonations(void *a1, const char *a2, ...)
{
  return [a1 queryDonations];
}

id objc_msgSend_rank(void *a1, const char *a2, ...)
{
  return [a1 rank];
}

id objc_msgSend_rankerConfidence(void *a1, const char *a2, ...)
{
  return [a1 rankerConfidence];
}

id objc_msgSend_requiredUserInfoKeys(void *a1, const char *a2, ...)
{
  return [a1 requiredUserInfoKeys];
}

id objc_msgSend_sortBy(void *a1, const char *a2, ...)
{
  return [a1 sortBy];
}

id objc_msgSend_sourceType(void *a1, const char *a2, ...)
{
  return [a1 sourceType];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_stateCode(void *a1, const char *a2, ...)
{
  return [a1 stateCode];
}

id objc_msgSend_stateOrProvince(void *a1, const char *a2, ...)
{
  return [a1 stateOrProvince];
}

id objc_msgSend_stream(void *a1, const char *a2, ...)
{
  return [a1 stream];
}

id objc_msgSend_streamType(void *a1, const char *a2, ...)
{
  return [a1 streamType];
}

id objc_msgSend_streamTypes(void *a1, const char *a2, ...)
{
  return [a1 streamTypes];
}

id objc_msgSend_street(void *a1, const char *a2, ...)
{
  return [a1 street];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subThoroughfare(void *a1, const char *a2, ...)
{
  return [a1 subThoroughfare];
}

id objc_msgSend_thoroughfare(void *a1, const char *a2, ...)
{
  return [a1 thoroughfare];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_toDate(void *a1, const char *a2, ...)
{
  return [a1 toDate];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_userActivity(void *a1, const char *a2, ...)
{
  return [a1 userActivity];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_utterance(void *a1, const char *a2, ...)
{
  return [a1 utterance];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_visibility(void *a1, const char *a2, ...)
{
  return [a1 visibility];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return [a1 webpageURL];
}

id objc_msgSend_withValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "withValue:");
}