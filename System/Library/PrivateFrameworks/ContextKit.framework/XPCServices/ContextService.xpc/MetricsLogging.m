@interface MetricsLogging
+ (id)instance;
- (NSString)abGroupLoggingKey;
- (id)_init;
- (id)debugStatus;
- (void)_postInit;
- (void)_updateABGroupKey;
- (void)recordAssetInfo:(id)a3;
- (void)recordFindResultsMsec:(double)a3 queryType:(unint64_t)a4 requestType:(unint64_t)a5 indexId:(id)a6;
- (void)recordInputLength:(unint64_t)a3 languageTag:(id)a4 languageSupported:(BOOL)a5 requestType:(unint64_t)a6 indexId:(id)a7;
- (void)recordQueryEngagementWithUserInputLength:(unint64_t)a3 completionLength:(unint64_t)a4 result:(id)a5 rank:(unint64_t)a6 indexId:(id)a7 requestType:(unint64_t)a8 logType:(unint64_t)a9;
- (void)recordQueryEventWithLuceneResultCount:(unint64_t)a3 error:(id)a4 requestType:(unint64_t)a5 indexId:(id)a6;
- (void)recordQueryLuceneMsec:(double)a3 queryType:(unint64_t)a4 requestType:(unint64_t)a5 indexId:(id)a6;
- (void)recordResultsShownWithUserInputLength:(unint64_t)a3 count:(unint64_t)a4 couldHaveShown:(unint64_t)a5 topicIds:(id)a6 serverOverride:(BOOL)a7 indexId:(id)a8 requestType:(unint64_t)a9 logType:(unint64_t)a10;
- (void)recordSlowFindResults:(BOOL)a3 requestType:(unint64_t)a4 indexId:(id)a5 coldEngine:(BOOL)a6;
- (void)recordTransactionSuccessfulWithUserInputLength:(unint64_t)a3 completionLength:(unint64_t)a4 indexId:(id)a5 requestType:(unint64_t)a6 logType:(unint64_t)a7;
- (void)recordURLLookupSucceeded:(unint64_t)a3 bundleId:(BOOL)a4 indexId:(id)a5 requestType:(unint64_t)a6;
- (void)runInBackground:(id)a3;
- (void)setAbGroupLoggingKey:(id)a3;
@end

@implementation MetricsLogging

- (id)_init
{
  v4.receiver = self;
  v4.super_class = (Class)MetricsLogging;
  v2 = [(MetricsLogging *)&v4 init];
  if (v2 && qword_100562F78 != -1) {
    dispatch_once(&qword_100562F78, &stru_10048B7E0);
  }
  return v2;
}

- (void)_postInit
{
  [(MetricsLogging *)self _updateABGroupKey];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002A081C;
  v3[3] = &unk_10048B808;
  v3[4] = self;
  +[ContextConfiguration registerUpdateHandler:v3];
}

- (void)_updateABGroupKey
{
  v3 = objc_opt_new();
  [v3 appendFormat:@"default"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v4 = +[ContextConfiguration sharedInstance];
  v5 = [v4 matchedABGroups];

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [v3 appendFormat:@"_%@", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(MetricsLogging *)self setAbGroupLoggingKey:v3];
}

+ (id)instance
{
  if (qword_100562F90 != -1) {
    dispatch_once(&qword_100562F90, &stru_10048B828);
  }
  v2 = (void *)qword_100562F88;
  return v2;
}

- (void)recordFindResultsMsec:(double)a3 queryType:(unint64_t)a4 requestType:(unint64_t)a5 indexId:(id)a6
{
  id v10 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    long long v12 = [(MetricsLogging *)self abGroupLoggingKey];
    int v13 = 134219010;
    double v14 = a3;
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    v18 = v12;
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    __int16 v21 = 2048;
    unint64_t v22 = a5;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "recordFindResultsMsec:%f indexId:%@ ab:%@ queryType:%lu requestType:%li", (uint8_t *)&v13, 0x34u);
  }
  if (a5 == 15 || a5 == 1)
  {
    unint64_t v11 = 104;
    if (a4 - 1 < 3) {
      unint64_t v11 = 4 * (a4 - 1) + 108;
    }
    atomic_fetch_add((atomic_uint *volatile)((char *)self + v11), 1u);
  }
}

- (void)recordQueryLuceneMsec:(double)a3 queryType:(unint64_t)a4 requestType:(unint64_t)a5 indexId:(id)a6
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v11 = [(MetricsLogging *)self abGroupLoggingKey];
    int v12 = 134219010;
    double v13 = a3;
    __int16 v14 = 2112;
    id v15 = a6;
    __int16 v16 = 2112;
    __int16 v17 = v11;
    __int16 v18 = 2048;
    unint64_t v19 = a4;
    __int16 v20 = 2048;
    unint64_t v21 = a5;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "recordQueryLuceneMsec:%f indexId:%@ ab:%@ queryType:%lu requestType:%li", (uint8_t *)&v12, 0x34u);
  }
}

- (void)recordInputLength:(unint64_t)a3 languageTag:(id)a4 languageSupported:(BOOL)a5 requestType:(unint64_t)a6 indexId:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v15 = [(MetricsLogging *)self abGroupLoggingKey];
    int v16 = 134218754;
    unint64_t v17 = a3;
    __int16 v18 = 2112;
    id v19 = v13;
    __int16 v20 = 2112;
    unint64_t v21 = v15;
    __int16 v22 = 2048;
    unint64_t v23 = a6;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "recordInputLength:%lu indexId:%@ ab:%@ requestType:%li", (uint8_t *)&v16, 0x2Au);
  }
  BOOL v14 = a6 == 15 || a6 == 1;
  if (v14 && !a5) {
    atomic_fetch_add(&self->countSafariLanguageNotSupported, 1u);
  }
}

- (void)recordQueryEventWithLuceneResultCount:(unint64_t)a3 error:(id)a4 requestType:(unint64_t)a5 indexId:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [(MetricsLogging *)self abGroupLoggingKey];
    int v13 = 134219010;
    unint64_t v14 = a3;
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    __int16 v21 = 2048;
    unint64_t v22 = a5;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "recordQueryEventWithLuceneResultCount:%lu error:%@, indexId:%@ ab:%@ requestType:%li", (uint8_t *)&v13, 0x34u);
  }
  if (a5 == 15 || a5 == 1) {
    atomic_fetch_add(&self->countSafariQueryEvents, 1u);
  }
}

- (void)recordResultsShownWithUserInputLength:(unint64_t)a3 count:(unint64_t)a4 couldHaveShown:(unint64_t)a5 topicIds:(id)a6 serverOverride:(BOOL)a7 indexId:(id)a8 requestType:(unint64_t)a9 logType:(unint64_t)a10
{
  BOOL v11 = a7;
  id v16 = a6;
  id v17 = a8;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v18 = [(MetricsLogging *)self abGroupLoggingKey];
    int v21 = 134219778;
    unint64_t v22 = a3;
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    __int16 v25 = 2048;
    unint64_t v26 = a5;
    __int16 v27 = 1024;
    BOOL v28 = v11;
    __int16 v29 = 2112;
    id v30 = v17;
    __int16 v31 = 2112;
    v32 = v18;
    __int16 v33 = 2048;
    unint64_t v34 = a9;
    __int16 v35 = 2048;
    unint64_t v36 = a10;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "recordResultsShownWithUserInputLength:%lu count:%lu/%lu serverOverride:%i indexId:%@ ab:%@ requestType:%lu logType:%lu", (uint8_t *)&v21, 0x4Eu);

    if (a10) {
      goto LABEL_3;
    }
LABEL_5:
    if (a9 == 15)
    {
      atomic_fetch_add(&self->countSafariLikelyUnsolicitedResultsShownCalled, 1u);
      if (a4)
      {
        atomic_fetch_add(&self->countSafariLikelyUnsolicitedResultsShownSomething, 1u);
        if (!a3) {
          goto LABEL_3;
        }
        uint64_t v19 = 88;
      }
      else
      {
        if (!a5)
        {
          if (!a3) {
            goto LABEL_3;
          }
          uint64_t v19 = 84;
          goto LABEL_22;
        }
        atomic_fetch_add(&self->countSafariLikelyUnsolicitedResultsShownSuppressed, 1u);
        if (!a3) {
          goto LABEL_3;
        }
        uint64_t v19 = 92;
      }
      uint64_t v20 = 84;
    }
    else
    {
      if (a9 != 1) {
        goto LABEL_3;
      }
      atomic_fetch_add(&self->countSafariResultsShownCalled, 1u);
      if (a4)
      {
        atomic_fetch_add(&self->countSafariResultsShownSomething, 1u);
        if (!a3) {
          goto LABEL_3;
        }
        uint64_t v19 = 48;
      }
      else
      {
        if (!a5)
        {
          if (!a3) {
            goto LABEL_3;
          }
          uint64_t v19 = 44;
          goto LABEL_22;
        }
        atomic_fetch_add(&self->countSafariResultsShownSuppressed, 1u);
        if (!a3) {
          goto LABEL_3;
        }
        uint64_t v19 = 52;
      }
      uint64_t v20 = 44;
    }
    atomic_fetch_add((atomic_uint *volatile)((char *)self + v20), 1u);
LABEL_22:
    atomic_fetch_add((atomic_uint *volatile)((char *)self + v19), 1u);
    goto LABEL_3;
  }
  if (!a10) {
    goto LABEL_5;
  }
LABEL_3:
}

- (void)recordQueryEngagementWithUserInputLength:(unint64_t)a3 completionLength:(unint64_t)a4 result:(id)a5 rank:(unint64_t)a6 indexId:(id)a7 requestType:(unint64_t)a8 logType:(unint64_t)a9
{
  id v15 = a5;
  id v16 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v18 = [(MetricsLogging *)self abGroupLoggingKey];
    int v19 = 134219522;
    unint64_t v20 = a3;
    __int16 v21 = 2048;
    unint64_t v22 = a4;
    __int16 v23 = 2048;
    unint64_t v24 = a6;
    __int16 v25 = 2112;
    id v26 = v16;
    __int16 v27 = 2112;
    BOOL v28 = v18;
    __int16 v29 = 2048;
    unint64_t v30 = a8;
    __int16 v31 = 2048;
    unint64_t v32 = a9;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "recordQueryEngagementWithUserInputLength:%lu completionLength:%lu, rank:%lu, indexId:%@ ab:%@ requestType:%lu logType:%lu", (uint8_t *)&v19, 0x48u);
  }
  if (a8 == 15)
  {
    atomic_fetch_add(&self->countSafariLikelyUnsolicitedEngagements, 1u);
    if (a3)
    {
      uint64_t v17 = 96;
      goto LABEL_9;
    }
  }
  else if (a8 == 1)
  {
    atomic_fetch_add(&self->countSafariEngagements, 1u);
    if (a3)
    {
      uint64_t v17 = 56;
LABEL_9:
      atomic_fetch_add((atomic_uint *volatile)((char *)self + v17), 1u);
    }
  }
}

- (void)recordTransactionSuccessfulWithUserInputLength:(unint64_t)a3 completionLength:(unint64_t)a4 indexId:(id)a5 requestType:(unint64_t)a6 logType:(unint64_t)a7
{
  id v12 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v14 = [(MetricsLogging *)self abGroupLoggingKey];
    int v15 = 134219266;
    unint64_t v16 = a3;
    __int16 v17 = 2048;
    unint64_t v18 = a4;
    __int16 v19 = 2112;
    id v20 = v12;
    __int16 v21 = 2112;
    unint64_t v22 = v14;
    __int16 v23 = 2048;
    unint64_t v24 = a6;
    __int16 v25 = 2048;
    unint64_t v26 = a7;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "recordTransactionSuccessfulWithUserInputLength:%lu completionLength:%lu indexId:%@ ab:%@ requestType:%lu logType:%lu", (uint8_t *)&v15, 0x3Eu);
  }
  if (a6 == 15)
  {
    atomic_fetch_add(&self->countSafariLikelyUnsolicitedTransactionSuccessful, 1u);
    if (a3)
    {
      uint64_t v13 = 100;
      goto LABEL_9;
    }
  }
  else if (a6 == 1)
  {
    atomic_fetch_add(&self->countSafariTransactionSuccessful, 1u);
    if (a3)
    {
      uint64_t v13 = 60;
LABEL_9:
      atomic_fetch_add((atomic_uint *volatile)((char *)self + v13), 1u);
    }
  }
}

- (void)recordAssetInfo:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(MetricsLogging *)self abGroupLoggingKey];
    int v6 = 138412546;
    id v7 = a3;
    __int16 v8 = 2112;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "recordAssetInfo: %@ ab:%@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)recordSlowFindResults:(BOOL)a3 requestType:(unint64_t)a4 indexId:(id)a5 coldEngine:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a3;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [(MetricsLogging *)self abGroupLoggingKey];
    v13[0] = 67110146;
    v13[1] = v8;
    __int16 v14 = 2112;
    id v15 = v10;
    __int16 v16 = 2112;
    __int16 v17 = v12;
    __int16 v18 = 2048;
    unint64_t v19 = a4;
    __int16 v20 = 1024;
    BOOL v21 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "recordSlowFindResults: hard timeout reached?=%i indexId:%@ ab:%@ requestType:%li cold:%i", (uint8_t *)v13, 0x2Cu);
  }
  if (a4 == 15 || a4 == 1)
  {
    uint64_t v11 = 16;
    if (v8) {
      uint64_t v11 = 20;
    }
    atomic_fetch_add((atomic_uint *volatile)((char *)self + v11), 1u);
  }
}

- (void)recordURLLookupSucceeded:(unint64_t)a3 bundleId:(BOOL)a4 indexId:(id)a5 requestType:(unint64_t)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [(MetricsLogging *)self abGroupLoggingKey];
    int v13 = 134219010;
    unint64_t v14 = a3;
    __int16 v15 = 1024;
    BOOL v16 = v7;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    __int16 v21 = 2048;
    unint64_t v22 = a6;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "recordURLLookupSucceeded: success=%lu bundleId:%i indexId:%@ ab:%@ requestType:%li", (uint8_t *)&v13, 0x30u);
  }
  if (a6 == 15)
  {
LABEL_6:
    atomic_fetch_add(&self->countSafariURLLookupTotal, 1u);
    if (a3)
    {
      atomic_fetch_add(&self->countSafariURLLookupSuccess, 1u);
      if (a3 == 2)
      {
        uint64_t v11 = 128;
LABEL_16:
        atomic_fetch_add((atomic_uint *volatile)((char *)self + v11), 1u);
        goto LABEL_17;
      }
    }
    goto LABEL_17;
  }
  if (a6 != 6)
  {
    if (a6 != 1) {
      goto LABEL_17;
    }
    goto LABEL_6;
  }
  if (v7)
  {
    atomic_fetch_add(&self->countDHURLLookupBundleTotal, 1u);
    if (a3)
    {
      atomic_fetch_add(&self->countDHURLLookupBundleSuccess, 1u);
      if (a3 == 2)
      {
        uint64_t v11 = 140;
        goto LABEL_16;
      }
    }
  }
  else
  {
    atomic_fetch_add(&self->countDHURLLookupWebTotal, 1u);
    if (a3)
    {
      atomic_fetch_add(&self->countDHURLLookupWebSuccess, 1u);
      if (a3 == 2)
      {
        uint64_t v11 = 152;
        goto LABEL_16;
      }
    }
  }
LABEL_17:
}

- (id)debugStatus
{
  uint64_t v3 = atomic_load((unsigned int *)&self->countSafariQueryEvents);
  uint64_t v48 = v3;
  v49 = NSString;
  uint64_t v4 = atomic_load((unsigned int *)&self->countSafariLanguageNotSupported);
  uint64_t v47 = v4;
  uint64_t v5 = atomic_load((unsigned int *)&self->countSafariSlowSoft);
  uint64_t v46 = v5;
  uint64_t v6 = atomic_load((unsigned int *)&self->countSafariSlowTimeout);
  uint64_t v45 = v6;
  uint64_t v7 = atomic_load((unsigned int *)&self->countSafariResultsShownCalled);
  uint64_t v44 = v7;
  uint64_t v8 = atomic_load((unsigned int *)&self->countSafariResultsShownSomething);
  uint64_t v43 = v8;
  uint64_t v9 = atomic_load((unsigned int *)&self->countSafariResultsShownSuppressed);
  uint64_t v42 = v9;
  uint64_t v10 = atomic_load((unsigned int *)&self->countSafariEngagements);
  uint64_t v41 = v10;
  uint64_t v11 = atomic_load((unsigned int *)&self->countSafariTransactionSuccessful);
  uint64_t v12 = atomic_load((unsigned int *)&self->countSafariResultsShownCalledCompletion);
  uint64_t v13 = atomic_load((unsigned int *)&self->countSafariResultsShownSomethingCompletion);
  uint64_t v14 = atomic_load((unsigned int *)&self->countSafariResultsShownSuppressedCompletion);
  uint64_t v15 = atomic_load((unsigned int *)&self->countSafariEngagementsCompletion);
  uint64_t v16 = atomic_load((unsigned int *)&self->countSafariTransactionSuccessfulCompletion);
  uint64_t v17 = atomic_load((unsigned int *)&self->countSafariLikelyUnsolicitedResultsShownCalled);
  uint64_t v18 = atomic_load((unsigned int *)&self->countSafariLikelyUnsolicitedResultsShownSomething);
  uint64_t v19 = atomic_load((unsigned int *)&self->countSafariLikelyUnsolicitedResultsShownSuppressed);
  uint64_t v20 = atomic_load((unsigned int *)&self->countSafariLikelyUnsolicitedEngagements);
  uint64_t v21 = atomic_load((unsigned int *)&self->countSafariLikelyUnsolicitedTransactionSuccessful);
  uint64_t v22 = atomic_load((unsigned int *)&self->countSafariLikelyUnsolicitedResultsShownCalledCompletion);
  uint64_t v23 = atomic_load((unsigned int *)&self->countSafariLikelyUnsolicitedResultsShownSomethingCompletion);
  uint64_t v24 = atomic_load((unsigned int *)&self->countSafariLikelyUnsolicitedResultsShownSuppressedCompletion);
  uint64_t v25 = atomic_load((unsigned int *)&self->countSafariLikelyUnsolicitedEngagementsCompletion);
  uint64_t v26 = atomic_load((unsigned int *)&self->countSafariLikelyUnsolicitedTransactionSuccessfulCompletion);
  uint64_t v27 = atomic_load((unsigned int *)&self->countSafariQueryEventsUnknown);
  uint64_t v28 = atomic_load((unsigned int *)&self->countSafariQueryEventsURLOnly);
  uint64_t v29 = atomic_load((unsigned int *)&self->countSafariQueryEventsMainText);
  uint64_t v30 = atomic_load((unsigned int *)&self->countSafariQueryEventsRawText);
  uint64_t v31 = atomic_load((unsigned int *)&self->countSafariURLLookupSuccess);
  uint64_t v32 = atomic_load((unsigned int *)&self->countSafariURLLookupSuccessStrong);
  uint64_t v33 = atomic_load((unsigned int *)&self->countSafariURLLookupTotal);
  uint64_t v34 = atomic_load((unsigned int *)&self->countDHURLLookupWebSuccess);
  uint64_t v35 = atomic_load((unsigned int *)&self->countDHURLLookupWebSuccessStrong);
  uint64_t v36 = atomic_load((unsigned int *)&self->countDHURLLookupWebTotal);
  uint64_t v37 = atomic_load((unsigned int *)&self->countDHURLLookupBundleSuccess);
  uint64_t v38 = atomic_load((unsigned int *)&self->countDHURLLookupBundleSuccessStrong);
  uint64_t v39 = atomic_load((unsigned int *)&self->countDHURLLookupBundleTotal);
  return objc_msgSend(v49, "stringWithFormat:", @"countSafariQueryEvents: %i\ncountSafariLanguageNotSupported: %i\ncountSafariSlowSoft: %i\ncountSafariSlowTimeout: %i\ncountSafariResultsShownCalled: %i\ncountSafariResultsShownSomething: %i\ncountSafariResultsShownSuppressed: %i\ncountSafariEngagements: %i\ncountSafariTransactionSuccessful: %i\ncountSafariResultsShownCalledCompletion: %i\ncountSafariResultsShownSomethingCompletion: %i\ncountSafariResultsShownSuppressedCompletion: %i\ncountSafariEngagementsCompletion: %i\ncountSafariTransactionSuccessfulCompletion: %i\ncountSafariLikelyUnsolicitedResultsShownCalled: %i\ncountSafariLikelyUnsolicitedResultsShownSomething: %i\ncountSafariLikelyUnsolicitedResultsShownSuppressed: %i\ncountSafariLikelyUnsolicitedEngagements: %i\ncountSafariLikelyUnsolicitedTransactionSuccessful: %i\ncountSafariLikelyUnsolicitedResultsShownCalledCompletion: %i\ncountSafariLikelyUnsolicitedResultsShownSomethingCompletion: %i\ncountSafariLikelyUnsolicitedResultsShownSuppressedCompletion: %i\ncountSafariLikelyUnsolicitedEngagementsCompletion: %i\ncountSafariLikelyUnsolicitedTransactionSuccessfulCompletion: %i\ncountSafariQueryEventsUnknown: %i\ncountSafariQueryEventsURLOnly: %i\ncountSafariQueryEventsMainText: %i\ncountSafariQueryEventsRawText: %i\ncountSafariURLLookupSuccess: %i\ncountSafariURLLookupSuccessStrong: %i\ncountSafariURLLookupTotal: %i\ncountDHURLLookupWebSuccess: %i\ncountDHURLLookupWebSuccessStrong: %i\ncountDHURLLookupWebTotal: %i\ncountDHURLLookupBundleSuccess: %i\ncountDHURLLookupBundleSuccessStrong: %i\ncountDHURLLookupBundleTotal: %i\n", v48, v47, v46, v45, v44, v43, v42, v41, v11, v12, v13, v14, v15, v16, v17, v18,
           v19,
           v20,
           v21,
           v22,
           v23,
           v24,
           v25,
           v26,
           v27,
           v28,
           v29,
           v30,
           v31,
           v32,
           v33,
           v34,
           v35,
           v36,
           v37,
           v38,
           v39);
}

- (void)runInBackground:(id)a3
{
}

- (NSString)abGroupLoggingKey
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAbGroupLoggingKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end