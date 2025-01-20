@interface CSEventListenerTasksManager
+ (BOOL)allowed;
+ (BOOL)alwaysAllowed:(int)a3;
+ (BOOL)isTaskCancelled:(int)a3 indexType:(int)a4;
+ (BOOL)turboMode;
+ (int64_t)taskPreviousCost;
+ (void)eventListenerCleanup:(int)a3 indexType:(int)a4 queue:(id)a5;
+ (void)eventListenerJobEnd:(int)a3;
+ (void)eventListenerManagerPowerStateInit;
+ (void)eventListenerManagerSetupScheduler;
+ (void)eventListenerStart:(int)a3 indexType:(int)a4 queue:(id)a5;
+ (void)setTurboMode:(BOOL)a3;
@end

@implementation CSEventListenerTasksManager

+ (void)setTurboMode:(BOOL)a3
{
  int v3 = a3;
  v4 = sub_100050698();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "### Toggling Turbo mode", buf, 2u);
  }

  v5 = sub_10000F2B8();
  v6 = [v5 stringByAppendingPathComponent:@".turbo"];

  if (v3)
  {
    id v29 = 0;
    [&stru_1000DD7E8 writeToFile:v6 atomically:1 encoding:4 error:&v29];
    id v7 = v29;
    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
    v9 = +[NSFileManager defaultManager];
    id v28 = 0;
    [v9 removeItemAtPath:v6 error:&v28];
    id v7 = v28;

    if (!v7) {
      goto LABEL_10;
    }
  }
  v10 = sub_100050698();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1000A0814((uint64_t)v7, v10);
  }

LABEL_10:
  if (byte_1000F8CF8 != v3)
  {
    byte_1000F8CF8 = v3;
    if (v3)
    {
      v11 = +[SKGProcessorContext sharedContext];
      unsigned int v12 = [v11 enableEmbeddings];

      if (v12)
      {
        if (qword_1000F8DC0 != -1) {
          dispatch_once(&qword_1000F8DC0, &stru_1000D9F10);
        }
        sub_100036A50((uint64_t)&unk_1000F8D98, 1);
        if (qword_1000F8DF0 != -1) {
          dispatch_once(&qword_1000F8DF0, &stru_1000D9F50);
        }
        sub_100036B7C((uint64_t)&unk_1000F8DC8, 1);
      }
      v13 = +[SKGProcessorContext sharedContext];
      unsigned int v14 = [v13 enableKeyphrases];

      if (v14)
      {
        if (qword_1000F8E20 != -1) {
          dispatch_once(&qword_1000F8E20, &stru_1000D9F70);
        }
        sub_100036CA8((uint64_t)&unk_1000F8DF8, 1);
      }
      v15 = +[SKGProcessorContext sharedContext];
      if ([v15 enableSuggestedEvents])
      {
      }
      else
      {
        v23 = +[SKGProcessorContext sharedContext];
        unsigned int v24 = [v23 enableDocumentUnderstanding];

        if (!v24) {
          goto LABEL_48;
        }
      }
      if (qword_1000F8E50 != -1) {
        dispatch_once(&qword_1000F8E50, &stru_1000D9F90);
      }
      sub_100036DD4((uint64_t)&unk_1000F8E28, 1);
    }
    else
    {
      unsigned int v16 = 0;
      *(void *)&long long v8 = 67109120;
      long long v27 = v8;
      do
      {
        v17 = sub_100050698();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v27;
          unsigned int v31 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "### changing throttle state for turbo events %d", buf, 8u);
        }

        sub_100036128(v16++, 0);
      }
      while (v16 != 8);
      v18 = +[SKGProcessorContext sharedContext];
      unsigned __int8 v19 = [v18 enableEmbeddings];

      if (v19)
      {
        if (qword_1000F8DF0 != -1) {
          dispatch_once(&qword_1000F8DF0, &stru_1000D9F50);
        }
        sub_100036F00((uint64_t)&unk_1000F8DC8);
        if (qword_1000F8DC0 != -1) {
          dispatch_once(&qword_1000F8DC0, &stru_1000D9F10);
        }
        sub_1000371C4((uint64_t)&unk_1000F8D98);
      }
      v20 = +[SKGProcessorContext sharedContext];
      unsigned int v21 = [v20 enableKeyphrases];

      if (v21)
      {
        if (qword_1000F8E20 != -1) {
          dispatch_once(&qword_1000F8E20, &stru_1000D9F70);
        }
        sub_100037470((uint64_t)&unk_1000F8DF8);
      }
      v22 = +[SKGProcessorContext sharedContext];
      if ([v22 enableDocumentUnderstanding])
      {
      }
      else
      {
        v25 = +[SKGProcessorContext sharedContext];
        unsigned int v26 = [v25 enableSuggestedEvents];

        if (!v26) {
          goto LABEL_48;
        }
      }
      if (qword_1000F8E50 != -1) {
        dispatch_once(&qword_1000F8E50, &stru_1000D9F90);
      }
      sub_100037734((uint64_t)&unk_1000F8E28);
    }
  }
LABEL_48:
}

+ (BOOL)turboMode
{
  return byte_1000F8CF8;
}

+ (int64_t)taskPreviousCost
{
  return (int64_t *)&unk_1000F8D00;
}

+ (void)eventListenerStart:(int)a3 indexType:(int)a4 queue:(id)a5
{
  id v7 = a5;
  if (a3 < 8)
  {
    if ((unint64_t)a3 - 3 >= 3)
    {
      if (a3 == 2)
      {
        v9 = sub_100037C08();
      }
      else if (a3 == 1)
      {
        v9 = sub_100037BB4();
      }
      else if (a3)
      {
        if ((a3 & 0xFFFFFFFE) != 6) {
          goto LABEL_16;
        }
        v9 = sub_100037C5C();
      }
      else
      {
        v9 = sub_100037B60();
      }
      v10 = v9;
      if (v9)
      {
        dispatch_group_enter(v9);
      }
    }
  }
  else
  {
    long long v8 = sub_100050698();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412802;
      id v12 = v7;
      __int16 v13 = 1024;
      int v14 = a3;
      __int16 v15 = 1024;
      int v16 = a4;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "### Invalid listener %@ %d %d", (uint8_t *)&v11, 0x18u);
    }
  }
LABEL_16:
}

+ (void)eventListenerCleanup:(int)a3 indexType:(int)a4 queue:(id)a5
{
  id v7 = a5;
  if (a3 < 8)
  {
    if ((unint64_t)a3 - 3 >= 3)
    {
      if (a3 == 2)
      {
        v9 = sub_100037C08();
      }
      else if (a3 == 1)
      {
        v9 = sub_100037BB4();
      }
      else if (a3)
      {
        if ((a3 & 0xFFFFFFFE) != 6) {
          goto LABEL_16;
        }
        v9 = sub_100037C5C();
      }
      else
      {
        v9 = sub_100037B60();
      }
      v10 = v9;
      if (v9)
      {
        dispatch_group_leave(v9);
      }
    }
  }
  else
  {
    long long v8 = sub_100050698();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412802;
      id v12 = v7;
      __int16 v13 = 1024;
      int v14 = a3;
      __int16 v15 = 1024;
      int v16 = a4;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "### Invalid listener %@ %d %d", (uint8_t *)&v11, 0x18u);
    }
  }
LABEL_16:
}

+ (void)eventListenerJobEnd:(int)a3
{
  if (!byte_1000F8CF8 && (unint64_t)a3 - 3 >= 3)
  {
    switch(a3)
    {
      case 0:
        if (qword_1000F8DC0 != -1) {
          dispatch_once(&qword_1000F8DC0, &stru_1000D9F10);
        }
        v4 = &unk_1000F8D98;
        goto LABEL_19;
      case 1:
        if (qword_1000F8DF0 != -1) {
          dispatch_once(&qword_1000F8DF0, &stru_1000D9F50);
        }
        v4 = &unk_1000F8DC8;
        goto LABEL_19;
      case 2:
        if (qword_1000F8E20 != -1) {
          dispatch_once(&qword_1000F8E20, &stru_1000D9F70);
        }
        v4 = &unk_1000F8DF8;
        goto LABEL_19;
      case 6:
      case 7:
        if (qword_1000F8E50 != -1) {
          dispatch_once(&qword_1000F8E50, &stru_1000D9F90);
        }
        v4 = &unk_1000F8E28;
LABEL_19:
        os_unfair_lock_lock((os_unfair_lock_t)v4 + 2);
        if (atomic_fetch_add((atomic_uint *volatile)v4 + 1, 0xFFFFFFFF) == 1)
        {
          v6 = *((void *)v4 + 2);
          v7[0] = _NSConcreteStackBlock;
          v7[1] = 3221225472;
          v7[2] = sub_100038010;
          v7[3] = &unk_1000D9ED0;
          int v8 = a3;
          v7[4] = v4;
          dispatch_async(v6, v7);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)v4 + 2);
        break;
      default:
        v5 = sub_100050698();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_1000A0A4C(a3, v5);
        }

        break;
    }
  }
}

+ (BOOL)isTaskCancelled:(int)a3 indexType:(int)a4
{
  if (byte_1000F8CF8) {
    return 0;
  }
  unsigned __int8 v5 = atomic_load(&byte_1000F8D40[a3]);
  return (v5 & 1) == 0;
}

+ (void)eventListenerManagerPowerStateInit
{
  v2 = sub_10000F2B8();
  int v3 = [v2 stringByAppendingPathComponent:@".turbo"];

  memset(&v6, 0, sizeof(v6));
  id v4 = v3;
  byte_1000F8CF8 = stat((const char *)objc_msgSend(v4, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0,
                                     0),
                     &v6) == 0;
  unsigned __int8 v5 = sub_100050698();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v8 = byte_1000F8CF8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "**** sTurboMode = %d", buf, 8u);
  }

  if (qword_1000F8D48 != -1) {
    dispatch_once(&qword_1000F8D48, &stru_1000D9EF0);
  }
}

+ (void)eventListenerManagerSetupScheduler
{
  v2 = +[SKGProcessorContext sharedContext];
  unsigned int v3 = [v2 enableEmbeddings];

  if (v3)
  {
    if (qword_1000F8DF0 != -1) {
      dispatch_once(&qword_1000F8DF0, &stru_1000D9F50);
    }
    id v4 = sub_100050698();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "### setting up embeddings task handler", (uint8_t *)&v24, 2u);
    }

    unsigned __int8 v5 = +[BGSystemTaskScheduler sharedScheduler];
    unsigned int v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    unsigned int v26 = sub_1000392D4;
    long long v27 = &unk_1000DA050;
    id v28 = &unk_1000F8DC8;
    [v5 registerForTaskWithIdentifier:@"com.apple.spotlightknowledged.task" usingQueue:qword_1000F8DD8 launchHandler:&v24];

    if (qword_1000F8DC0 != -1) {
      dispatch_once(&qword_1000F8DC0, &stru_1000D9F10);
    }
    stat v6 = sub_100050698();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "### setting up priority task handler", (uint8_t *)&v24, 2u);
    }

    id v7 = +[BGSystemTaskScheduler sharedScheduler];
    unsigned int v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    unsigned int v26 = sub_100039774;
    long long v27 = &unk_1000DA050;
    id v28 = &unk_1000F8D98;
    [v7 registerForTaskWithIdentifier:@"com.apple.spotlightknowledged.task.priority" usingQueue:qword_1000F8DA8 launchHandler:&v24];
  }
  int v8 = +[SKGProcessorContext sharedContext];
  unsigned int v9 = [v8 enableKeyphrases];

  if (v9)
  {
    if (qword_1000F8E20 != -1) {
      dispatch_once(&qword_1000F8E20, &stru_1000D9F70);
    }
    v10 = sub_100050698();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "### setting up keyphrases task handler", (uint8_t *)&v24, 2u);
    }

    int v11 = +[BGSystemTaskScheduler sharedScheduler];
    unsigned int v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    unsigned int v26 = sub_100039C14;
    long long v27 = &unk_1000DA050;
    id v28 = &unk_1000F8DF8;
    [v11 registerForTaskWithIdentifier:@"com.apple.spotlightknowledged.task.keyphrases" usingQueue:qword_1000F8E08 launchHandler:&v24];
  }
  id v12 = +[SKGProcessorContext sharedContext];
  if ([v12 enableDocumentUnderstanding])
  {
  }
  else
  {
    __int16 v13 = +[SKGProcessorContext sharedContext];
    unsigned int v14 = [v13 enableSuggestedEvents];

    if (!v14) {
      goto LABEL_25;
    }
  }
  if (qword_1000F8E50 != -1) {
    dispatch_once(&qword_1000F8E50, &stru_1000D9F90);
  }
  __int16 v15 = sub_100050698();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "### setting up pre-extraction task handler", (uint8_t *)&v24, 2u);
  }

  int v16 = +[BGSystemTaskScheduler sharedScheduler];
  unsigned int v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  unsigned int v26 = sub_10003A0B4;
  long long v27 = &unk_1000DA050;
  id v28 = &unk_1000F8E28;
  [v16 registerForTaskWithIdentifier:@"com.apple.spotlightknowledged.task.preextraction" usingQueue:qword_1000F8E38 launchHandler:&v24];

LABEL_25:
  if (byte_1000F8CF8) {
    return;
  }
  v17 = +[SKGProcessorContext sharedContext];
  unsigned int v18 = [v17 enableEmbeddings];

  if (v18)
  {
    if (qword_1000F8DF0 != -1) {
      dispatch_once(&qword_1000F8DF0, &stru_1000D9F50);
    }
    sub_100036F00((uint64_t)&unk_1000F8DC8);
    if (qword_1000F8DC0 != -1) {
      dispatch_once(&qword_1000F8DC0, &stru_1000D9F10);
    }
    sub_1000371C4((uint64_t)&unk_1000F8D98);
  }
  unsigned __int8 v19 = +[SKGProcessorContext sharedContext];
  unsigned int v20 = [v19 enableKeyphrases];

  if (v20)
  {
    if (qword_1000F8E20 != -1) {
      dispatch_once(&qword_1000F8E20, &stru_1000D9F70);
    }
    sub_100037470((uint64_t)&unk_1000F8DF8);
  }
  unsigned int v21 = +[SKGProcessorContext sharedContext];
  if ([v21 enableDocumentUnderstanding])
  {
  }
  else
  {
    v22 = +[SKGProcessorContext sharedContext];
    unsigned int v23 = [v22 enableSuggestedEvents];

    if (!v23) {
      return;
    }
  }
  if (qword_1000F8E50 != -1) {
    dispatch_once(&qword_1000F8E50, &stru_1000D9F90);
  }
  sub_100037734((uint64_t)&unk_1000F8E28);
}

+ (BOOL)allowed
{
  return (BOOL *)byte_1000F8D40;
}

+ (BOOL)alwaysAllowed:(int)a3
{
  return (unint64_t)a3 - 3 < 3;
}

@end