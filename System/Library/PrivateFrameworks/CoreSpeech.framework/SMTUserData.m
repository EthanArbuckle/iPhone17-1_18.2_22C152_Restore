@interface SMTUserData
+ (id)checkDataAmountQuickly:(unint64_t)a3;
+ (id)getDictationEventsWithMaxAge:(double)a3 minAge:(double)a4;
+ (int64_t)getDataTypeFromDictationEvent:(id)a3 sentMessageTime:(double)a4;
+ (void)enumerateCoreDuetSentMessagesWithLimit:(unint64_t)a3 block:(id)a4;
+ (void)enumerateDocumentSources:(id)a3 limit:(unint64_t)a4 maxAge:(double)a5 minAge:(double)a6 block:(id)a7;
+ (void)enumerateSentMessagesWithLimit:(unint64_t)a3 maxAge:(double)a4 minAge:(double)a5 block:(id)a6;
+ (void)initialize;
@end

@implementation SMTUserData

+ (id)checkDataAmountQuickly:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001FEB0;
    v9[3] = &unk_10003D1A0;
    v9[4] = &v10;
    v9[5] = a3;
    v4 = objc_retainBlock(v9);
    +[SMTUserData enumerateSentMessagesWithLimit:10 * v3 maxAge:v4 minAge:0.0 block:0.0];
    if (v11[3] >= v3)
    {

      _Block_object_dispose(&v10, 8);
      unint64_t v3 = 0;
    }
    else
    {
      v6 = +[NSString stringWithFormat:@"Insufficient data (%lu)", v11[3]];
      NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
      v15 = v6;
      v7 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      unint64_t v3 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:2 userInfo:v7];

      _Block_object_dispose(&v10, 8);
    }
  }
  return (id)v3;
}

+ (void)enumerateSentMessagesWithLimit:(unint64_t)a3 maxAge:(double)a4 minAge:(double)a5 block:(id)a6
{
  v9 = (void (**)(id, void *, void *, void *, unsigned char *))a6;
  if (a3)
  {
    unint64_t v61 = a3;
    uint64_t v10 = [(id)objc_opt_class() getDictationEventsWithMaxAge:a4 minAge:a5];
    if (a4 <= 0.0)
    {
      v11 = 0;
    }
    else
    {
      v11 = +[NSDate dateWithTimeIntervalSinceNow:-a4];
      uint64_t v12 = qword_1000443F0;
      if (os_log_type_enabled((os_log_t)qword_1000443F0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v70 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Filtering for messages after date %@", buf, 0xCu);
      }
    }
    if (a5 <= 0.0)
    {
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = +[NSDate dateWithTimeIntervalSinceNow:-a5];
      NSErrorUserInfoKey v14 = qword_1000443F0;
      if (os_log_type_enabled((os_log_t)qword_1000443F0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v70 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Filtering for messages before date %@", buf, 0xCu);
      }
    }
    unint64_t v15 = v61;
    if (qword_1000443F8 != -1) {
      dispatch_once(&qword_1000443F8, &stru_10003D178);
    }
    if (qword_100044408)
    {
      id v16 = objc_alloc_init((Class)qword_100044408);
      v17 = v16;
      if (v16)
      {
        v58 = v13;
        v59 = v11;
        v57 = v10;
        char v67 = 0;
        uint64_t v18 = (uint64_t)[v16 lastDatabaseRowID];
        if (v18 < 1) {
          goto LABEL_60;
        }
        uint64_t v19 = v18;
        char v20 = 0;
        uint64_t v21 = 0;
        uint64_t v48 = EARDocumentDataTypeKey;
        v49 = v9;
        v52 = v17;
        while (1)
        {
          if (v19 <= 1001) {
            uint64_t v22 = 1001;
          }
          else {
            uint64_t v22 = v19;
          }
          unint64_t v50 = v22;
          [v17 setNextRowID:v22 - 1000];
          v23 = [v17 nextOutgoingMessageBatch];
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          v54 = v23;
          id obj = [v23 reverseObjectEnumerator];
          id v24 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
          if (!v24) {
            goto LABEL_50;
          }
          id v25 = v24;
          uint64_t v26 = *(void *)v64;
          uint64_t v60 = *(void *)v64;
          while (2)
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v64 != v26) {
                objc_enumerationMutation(obj);
              }
              v28 = *(void **)(*((void *)&v63 + 1) + 8 * i);
              if ((v20 & 1) == 0)
              {
                id v29 = v28;
                if ((objc_opt_respondsToSelector() & 1) == 0)
                {

LABEL_57:
                  v47 = qword_1000443F0;
                  if (os_log_type_enabled((os_log_t)qword_1000443F0, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Incompatible Messages plugin message", buf, 2u);
                  }
LABEL_59:

                  v17 = v52;
                  goto LABEL_60;
                }
                char v30 = objc_opt_respondsToSelector();

                if ((v30 & 1) == 0) {
                  goto LABEL_57;
                }
              }
              if ((uint64_t)[v28 rowID] <= v19)
              {
                uint64_t v31 = [v28 dateSent];
                if (!v31) {
                  goto LABEL_46;
                }
                v32 = (void *)v31;
                v33 = [v28 body];
                if (!v33 || ![v28 fromMe]) {
                  goto LABEL_45;
                }
                if (v59)
                {
                  v51 = [v28 dateSent];
                  v34 = [v51 earlierDate:v59];
                  BOOL v56 = v34 == v59;
                  if (v34 != v59 || (v53 = v59, !v58))
                  {
LABEL_38:

                    v53 = v34;
                    uint64_t v26 = v60;
                    unint64_t v15 = v61;
                    if (!v56) {
                      goto LABEL_46;
                    }
LABEL_44:
                    v39 = [v28 dateSent];
                    [v39 timeIntervalSinceReferenceDate];
                    double v41 = v40;

                    id v42 = [(id)objc_opt_class() getDataTypeFromDictationEvent:v57 sentMessageTime:v41];
                    v32 = +[NSMutableDictionary dictionary];
                    v43 = +[NSNumber numberWithInteger:v42];
                    [v32 setObject:v43 forKey:v48];

                    v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Message_%lu", [v28 rowID]);
                    v44 = [v28 body];
                    v9[2](v9, v33, v44, v32, &v67);

                    unint64_t v15 = v61;
LABEL_45:

                    uint64_t v26 = v60;
LABEL_46:
                    if (++v21 >= v15 || v67) {
                      goto LABEL_59;
                    }
                    goto LABEL_48;
                  }
                }
                else if (!v58)
                {

                  goto LABEL_44;
                }
                v35 = [v28 dateSent];
                v36 = [v35 earlierDate:v58];
                v37 = [v28 dateSent];
                BOOL v56 = v36 == v37;

                if (v59)
                {
                  v34 = v53;
                  v9 = v49;
                  goto LABEL_38;
                }

                BOOL v38 = v36 == v37;
                v9 = v49;
                uint64_t v26 = v60;
                unint64_t v15 = v61;
                if (v38) {
                  goto LABEL_44;
                }
                goto LABEL_46;
              }
LABEL_48:
              char v20 = 1;
            }
            id v25 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
            if (v25) {
              continue;
            }
            break;
          }
LABEL_50:

          uint64_t v19 = v50 - 1001;
          v17 = v52;
          if (v50 <= 0x3E9)
          {
LABEL_60:
            uint64_t v10 = v57;
            uint64_t v13 = v58;
            v11 = v59;
            goto LABEL_61;
          }
        }
      }
      v46 = qword_1000443F0;
      if (os_log_type_enabled((os_log_t)qword_1000443F0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Failed to load Messages plugin data source", buf, 2u);
      }
LABEL_61:
    }
    else
    {
      v45 = qword_1000443F0;
      if (os_log_type_enabled((os_log_t)qword_1000443F0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "No Messages plugin data source", buf, 2u);
      }
    }
  }
}

+ (void)enumerateCoreDuetSentMessagesWithLimit:(unint64_t)a3 block:(id)a4
{
  v5 = (void (**)(void, void *, void *, void *, uint8_t *))a4;
  if (a3)
  {
    v45 = [(id)objc_opt_class() getDictationEventsWithMaxAge:0.0 minAge:0.0];
    v6 = +[_DKKnowledgeStore knowledgeStore];
    v7 = +[_DKIntentMetadataKey intentClass];
    v44 = +[_DKQuery predicateForObjectsWithMetadataKey:v7 inValues:&off_10003F330];

    v43 = +[_DKEventQuery startDateSortDescriptorAscending:0];
    unint64_t v8 = 0;
    uint64_t v42 = EARDocumentDataTypeKey;
    v46 = v5;
    unint64_t v38 = a3;
    double v40 = v6;
    do
    {
      if (a3 - v8 >= 0x3E8) {
        uint64_t v9 = 1000;
      }
      else {
        uint64_t v9 = a3 - v8;
      }
      uint64_t v10 = +[_DKSystemEventStreams appIntentsStream];
      v58 = v10;
      v11 = +[NSArray arrayWithObjects:&v58 count:1];
      v57 = v43;
      uint64_t v12 = +[NSArray arrayWithObjects:&v57 count:1];
      uint64_t v13 = +[_DKEventQuery eventQueryWithPredicate:v44 eventStreams:v11 offset:v8 limit:v9 sortDescriptors:v12];

      id v53 = 0;
      NSErrorUserInfoKey v14 = [v6 executeQuery:v13 error:&v53];
      id v15 = v53;
      if (v15)
      {
        id v16 = qword_1000443F0;
        if (os_log_type_enabled((os_log_t)qword_1000443F0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Could not get messages from CoreDuet %@", buf, 0xCu);
        }
      }
      else if (v14)
      {
        v39 = v14;
        double v41 = v13;
        buf[0] = 0;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id obj = v14;
        id v17 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v50;
          while (2)
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v50 != v19) {
                objc_enumerationMutation(obj);
              }
              uint64_t v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
              uint64_t v22 = [v21 interaction];
              v23 = INTypedInteractionWithInteraction();
              id v24 = [v23 intent];

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v25 = v24;
                uint64_t v26 = [v25 sender];
                unsigned int v27 = [v26 isMe];

                if (v27)
                {
                  v28 = [v21 startDate];
                  [v28 timeIntervalSinceReferenceDate];
                  double v30 = v29;

                  id v31 = [(id)objc_opt_class() getDataTypeFromDictationEvent:v45 sentMessageTime:v30];
                  v32 = +[NSMutableDictionary dictionary];
                  v33 = +[NSNumber numberWithInteger:v31];
                  [v32 setObject:v33 forKey:v42];

                  v34 = [v21 source];
                  v35 = [v34 itemID];
                  v36 = [v25 content];
                  v46[2](v46, v35, v36, v32, buf);
                }
              }
              int v37 = buf[0];

              if (v37)
              {

                v5 = v46;
                v6 = v40;
                goto LABEL_26;
              }
            }
            id v18 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        v5 = v46;
        a3 = v38;
        id v15 = 0;
        v6 = v40;
        uint64_t v13 = v41;
        NSErrorUserInfoKey v14 = v39;
      }

      v8 += 1000;
    }
    while (v8 < a3);
LABEL_26:
  }
}

+ (void)enumerateDocumentSources:(id)a3 limit:(unint64_t)a4 maxAge:(double)a5 minAge:(double)a6 block:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v13)
  {
    id v15 = v13;
    uint64_t v16 = *(void *)v22;
    *(void *)&long long v14 = 138412290;
    long long v20 = v14;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v11);
        }
        id v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v18, "isEqualToString:", @"coreduet-sent-messages", v20))
        {
          [(id)objc_opt_class() enumerateCoreDuetSentMessagesWithLimit:a4 block:v12];
        }
        else if ([v18 isEqualToString:@"sent-messages"])
        {
          [(id)objc_opt_class() enumerateSentMessagesWithLimit:a4 maxAge:v12 minAge:a5 block:a6];
        }
        else
        {
          uint64_t v19 = qword_1000443F0;
          if (os_log_type_enabled((os_log_t)qword_1000443F0, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v20;
            uint64_t v26 = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Ignoring unknown document source: %@", buf, 0xCu);
          }
        }
      }
      id v15 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v15);
  }
}

+ (int64_t)getDataTypeFromDictationEvent:(id)a3 sentMessageTime:(double)a4
{
  id v5 = a3;
  if (CFAbsoluteTimeGetCurrent() + -15552000.0 <= a4)
  {
    v7 = (char *)[v5 count] - 1;
    if ((uint64_t)v7 < 0)
    {
LABEL_16:
      int64_t v6 = 2;
    }
    else
    {
      uint64_t v8 = 0;
      int64_t v6 = 1;
      while (1)
      {
        uint64_t v9 = (uint64_t)&v7[-v8];
        if ((uint64_t)v7 < v8) {
          ++v9;
        }
        uint64_t v10 = v8 + (v9 >> 1);
        id v11 = [v5 objectAtIndexedSubscript:v10];
        [v11 absoluteTimestamp];
        double v13 = v12;

        if (v13 <= a4 && a4 - v13 <= 30.0) {
          break;
        }
        if (v13 > a4) {
          v7 = (char *)(v10 - 1);
        }
        else {
          uint64_t v8 = v10 + 1;
        }
        if (v8 > (uint64_t)v7) {
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

+ (id)getDictationEventsWithMaxAge:(double)a3 minAge:(double)a4
{
  id v6 = objc_alloc_init((Class)NSMutableArray);
  double Current = CFAbsoluteTimeGetCurrent();
  double v8 = 0.0;
  if (a3 > 0.0)
  {
    double v9 = CFAbsoluteTimeGetCurrent();
    if (a3 <= 15552000.0) {
      double v8 = v9 - a3;
    }
    else {
      double v8 = v9 + -15552000.0;
    }
  }
  double v10 = 15552000.0;
  if (a4 <= 15552000.0) {
    double v10 = a4;
  }
  if (a4 > a3) {
    double v10 = 0.0;
  }
  double v11 = Current - v10;
  double v12 = objc_opt_new();
  double v13 = qword_1000443F0;
  if (os_log_type_enabled((os_log_t)qword_1000443F0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    double v28 = v8;
    __int16 v29 = 2048;
    double v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Biome Dictation: Fetching dictation events from startTime=%f to endTime=%f", buf, 0x16u);
  }
  long long v14 = [v12 publisherFromStartTime:v8];
  long long v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  long long v23 = sub_100021028;
  long long v24 = &unk_10003D138;
  double v26 = v11;
  id v15 = v6;
  id v25 = v15;
  id v16 = [v14 sinkWithCompletion:&stru_10003D110 receiveInput:&v21];
  id v17 = (void *)qword_1000443F0;
  if (os_log_type_enabled((os_log_t)qword_1000443F0, OS_LOG_TYPE_INFO))
  {
    id v18 = v17;
    id v19 = objc_msgSend(v15, "count", v21, v22, v23, v24);
    *(_DWORD *)buf = 134217984;
    double v28 = *(double *)&v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Biome Dictation: Fetched %zu dictation events in total", buf, 0xCu);
  }
  return v15;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_1000443F0 = (uint64_t)os_log_create("com.apple.speech.speechmodeltraining", "SMTUserData");
    _objc_release_x1();
  }
}

@end