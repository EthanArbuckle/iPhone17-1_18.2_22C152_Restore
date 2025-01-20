@interface ADAnalyticsStore
- (ADAnalyticsStore)initWithPath:(id)a3;
- (BOOL)_deleteEventRecordsBeforeOrEqualToTimestamp:(unint64_t)a3 deliveryStream:(unint64_t)a4 eventStreamUID:(id)a5 streamSpeechId:(id)a6 error:(id *)a7;
- (BOOL)_deleteEventRecordsFromStartTime:(unint64_t)a3 toEndTime:(unint64_t)a4 eventStreamUID:(id)a5 error:(id *)a6;
- (BOOL)_deleteEventRecordsWithRecordIDs:(id)a3 error:(id *)a4;
- (BOOL)_insertEventRecords:(id)a3 error:(id *)a4;
- (BOOL)_purgeDeletedEventRecordsBeforeOrEqualToDate:(id)a3 error:(id *)a4;
- (BOOL)_resetForReason:(id)a3 error:(id *)a4;
- (BOOL)_updateRecordsWithSpeechId:(id)a3 toUpdatedSpeechId:(id)a4 error:(id *)a5;
- (NSString)path;
- (id)_fetchEventRecords:(unint64_t)a3 afterTimestamp:(unint64_t)a4 eventStreamUID:(id)a5 streamSpeechId:(id)a6 deliveryStream:(unint64_t)a7 error:(id *)a8;
- (id)_fetchEventRecordsCreatedAfterDate:(id)a3 error:(id *)a4;
- (id)_fetchEventStreamUIDsWithError:(id *)a3;
- (id)_preparedDatabaseWithError:(id *)a3;
- (void)_countQueuedEventRecordsWithCriteria:(id)a3 withCompletion:(id)a4;
- (void)checkpointWithCompletion:(id)a3;
- (void)countQueuedEventRecordsForDeliveryStream:(unint64_t)a3 withCompletion:(id)a4;
- (void)countQueuedEventRecordsWithCompletion:(id)a3;
- (void)dealloc;
- (void)deleteEventRecordsBeforeOrEqualToTimestamp:(unint64_t)a3 deliveryStream:(unint64_t)a4 eventStreamUID:(id)a5 streamSpeechId:(id)a6 completion:(id)a7;
- (void)deleteEventRecordsFromStartTime:(unint64_t)a3 toEndTime:(unint64_t)a4 eventStreamUID:(id)a5 completion:(id)a6;
- (void)deleteEventRecordsWithRecordIDs:(id)a3 completion:(id)a4;
- (void)fetchEventRecords:(unint64_t)a3 afterTimestamp:(unint64_t)a4 eventStreamUID:(id)a5 streamSpeechId:(id)a6 deliveryStream:(unint64_t)a7 completion:(id)a8;
- (void)fetchEventRecords:(unint64_t)a3 eventStreamUID:(id)a4 streamSpeechId:(id)a5 deliveryStream:(unint64_t)a6 completion:(id)a7;
- (void)fetchEventRecordsCreatedAfterDate:(id)a3 completion:(id)a4;
- (void)fetchEventStreamUIDsWithCompletion:(id)a3;
- (void)insertEventRecords:(id)a3 completion:(id)a4;
- (void)purgeDeletedEventRecordsBeforeOrEqualToDate:(id)a3 completion:(id)a4;
- (void)purgeWithCompletion:(id)a3;
- (void)resetWithCompletion:(id)a3;
- (void)updateRecordsWithSpeechId:(id)a3 toUpdatedSpeechId:(id)a4 withCompletion:(id)a5;
@end

@implementation ADAnalyticsStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_eventRecordBuilder, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSString)path
{
  return self->_path;
}

- (BOOL)_updateRecordsWithSpeechId:(id)a3 toUpdatedSpeechId:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (a5) {
      *a5 = 0;
    }
    id v21 = 0;
    v10 = [(ADAnalyticsStore *)self _preparedDatabaseWithError:&v21];
    id v11 = v21;
    v12 = v11;
    if (!v10)
    {
      if (a5)
      {
        id v15 = v11;
        unsigned __int8 v14 = 0;
        *a5 = v15;
      }
      else
      {
        unsigned __int8 v14 = 0;
        id v15 = v11;
      }
      goto LABEL_18;
    }
    if (v8) {
      +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:@"assistant_id" value:v8 negation:0];
    }
    else {
    v16 = +[SiriCoreSQLiteQueryCriterion isNullQueryCriterionWithColumnName:@"assistant_id" negation:0];
    }
    CFStringRef v30 = @"assistant_id";
    id v31 = v9;
    v17 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v20 = v12;
    unsigned __int8 v14 = [v10 updateTableWithName:@"events" valueMap:v17 criterion:v16 error:&v20];
    id v15 = v20;

    if ((v14 & 1) == 0)
    {
      v18 = AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v23 = "-[ADAnalyticsStore _updateRecordsWithSpeechId:toUpdatedSpeechId:error:]";
        __int16 v24 = 2112;
        id v25 = v8;
        __int16 v26 = 2112;
        id v27 = v9;
        __int16 v28 = 2112;
        id v29 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Failed to update database records with speechId (%@) to speechId (%@) due to error %@", buf, 0x2Au);
        if (!a5) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      if (a5) {
LABEL_16:
      }
        *a5 = v15;
    }
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  v13 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[ADAnalyticsStore _updateRecordsWithSpeechId:toUpdatedSpeechId:error:]";
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Attempting to updated event records to NULL speechId", buf, 0xCu);
  }
  unsigned __int8 v14 = 0;
LABEL_19:

  return v14;
}

- (void)_countQueuedEventRecordsWithCriteria:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  id v15 = 0;
  id v8 = [(ADAnalyticsStore *)self _preparedDatabaseWithError:&v15];
  id v9 = v15;
  v10 = v9;
  if (v8)
  {
    id v14 = v9;
    id v11 = [v8 countValuesInTableWithName:@"events" columnName:@"timestamp" behavior:2 indexedBy:0 criterion:v6 range:0 error:&v14];
    id v12 = v14;

    if (v12) {
      id v13 = 0;
    }
    else {
      id v13 = v11;
    }
    ((void (**)(id, id, id))v7)[2](v7, v13, v12);
    v10 = v12;
  }
  else
  {
    v7[2](v7, 0, v9);
  }
}

- (void)countQueuedEventRecordsForDeliveryStream:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013C7F4;
  block[3] = &unk_10050C148;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)countQueuedEventRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013C9B8;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_fetchEventRecordsCreatedAfterDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v25 = 0;
  v7 = [(ADAnalyticsStore *)self _preparedDatabaseWithError:&v25];
  id v8 = v25;
  id v9 = v8;
  if (v7)
  {
    id v10 = +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:@"status" value:&off_100523660 negation:0];
    if (v6)
    {
      [v6 timeIntervalSince1970];
      unint64_t v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v12 = +[SiriCoreSQLiteQueryCriterion greaterThanOrEqualToQueryCriterionWithColumnName:@"date_created" value:v11];
      v31[0] = v12;
      v31[1] = v10;
      id v13 = +[NSArray arrayWithObjects:v31 count:2];
      uint64_t v14 = +[SiriCoreSQLiteQueryCriterion andQueryCriterionWithSubcriteria:v13];

      id v10 = (void *)v14;
    }
    id v15 = objc_alloc((Class)SiriCoreSQLiteQueryOrder);
    v30[0] = @"stream_uid";
    v30[1] = @"timestamp";
    v16 = +[NSArray arrayWithObjects:v30 count:2];
    id v17 = [v15 initWithColumnNames:v16 mode:1];

    eventRecordBuilder = self->_eventRecordBuilder;
    id v24 = v9;
    v19 = [v7 selectRecordsFromTableWithName:@"events" columnNames:0 behavior:0 indexedBy:0 criterion:v10 order:v17 range:0 recordBuilder:eventRecordBuilder error:&v24];
    id v20 = v24;

    if (!v20)
    {
      id v22 = v19;
      goto LABEL_16;
    }
    id v21 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v27 = "-[ADAnalyticsStore _fetchEventRecordsCreatedAfterDate:error:]";
      __int16 v28 = 2112;
      id v29 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s Failed to select database records due to error %@", buf, 0x16u);
      if (a4) {
        goto LABEL_9;
      }
    }
    else if (a4)
    {
LABEL_9:
      id v22 = 0;
      *a4 = v20;
LABEL_16:

      goto LABEL_17;
    }
    id v22 = 0;
    goto LABEL_16;
  }
  if (a4)
  {
    id v20 = v8;
    id v22 = 0;
    *a4 = v20;
  }
  else
  {
    id v22 = 0;
    id v20 = v8;
  }
LABEL_17:

  return v22;
}

- (id)_fetchEventRecords:(unint64_t)a3 afterTimestamp:(unint64_t)a4 eventStreamUID:(id)a5 streamSpeechId:(id)a6 deliveryStream:(unint64_t)a7 error:(id *)a8
{
  id v14 = a5;
  id v15 = a6;
  if (a8) {
    *a8 = 0;
  }
  id v45 = 0;
  v16 = [(ADAnalyticsStore *)self _preparedDatabaseWithError:&v45];
  id v17 = v45;
  if (v16)
  {
    v39 = v17;
    v41 = v16;
    id v42 = v15;
    unint64_t v38 = a3;
    if (v15) {
      +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:@"assistant_id" value:v15 negation:0];
    }
    else {
    uint64_t v20 = +[SiriCoreSQLiteQueryCriterion isNullQueryCriterionWithColumnName:@"assistant_id" negation:0];
    }
    id v43 = v14;
    id v21 = +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:@"stream_uid" value:v14 negation:0];
    v51[0] = v21;
    v51[1] = v20;
    v40 = (void *)v20;
    id v22 = +[NSNumber numberWithUnsignedLongLong:a4];
    v23 = +[SiriCoreSQLiteQueryCriterion greaterThanQueryCriterionWithColumnName:@"timestamp" value:v22];
    v51[2] = v23;
    id v24 = +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:@"status" value:&off_100523660 negation:0];
    v51[3] = v24;
    id v25 = +[NSNumber numberWithUnsignedInteger:a7];
    __int16 v26 = +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:@"delivery_stream" value:v25 negation:0];
    v51[4] = v26;
    id v27 = +[NSArray arrayWithObjects:v51 count:5];
    uint64_t v28 = +[SiriCoreSQLiteQueryCriterion andQueryCriterionWithSubcriteria:v27];

    id v29 = (void *)v28;
    id v30 = objc_alloc((Class)SiriCoreSQLiteQueryOrder);
    CFStringRef v50 = @"timestamp";
    id v31 = +[NSArray arrayWithObjects:&v50 count:1];
    id v32 = [v30 initWithColumnNames:v31 mode:1];

    id v33 = [objc_alloc((Class)SiriCoreSQLiteQueryRange) initWithLimit:v38];
    eventRecordBuilder = self->_eventRecordBuilder;
    id v44 = v39;
    v16 = v41;
    v35 = [v41 selectRecordsFromTableWithName:@"events" columnNames:0 behavior:0 indexedBy:@"events_index_event_batch" criterion:v29 order:v32 range:v33 recordBuilder:eventRecordBuilder error:&v44];
    id v18 = v44;

    if (v18)
    {
      v36 = AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "-[ADAnalyticsStore _fetchEventRecords:afterTimestamp:eventStreamUID:streamSpeechId:deliveryStream:error:]";
        __int16 v48 = 2112;
        id v49 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s Failed to select database records due to error %@", buf, 0x16u);
      }
      id v15 = v42;
      id v14 = v43;
      id v19 = 0;
      if (a8) {
        *a8 = v18;
      }
    }
    else
    {
      id v19 = v35;
      id v15 = v42;
      id v14 = v43;
    }
  }
  else if (a8)
  {
    id v18 = v17;
    id v19 = 0;
    *a8 = v18;
  }
  else
  {
    id v19 = 0;
    id v18 = v17;
  }

  return v19;
}

- (id)_fetchEventStreamUIDsWithError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  id v32 = 0;
  id v4 = [(ADAnalyticsStore *)self _preparedDatabaseWithError:&v32];
  id v5 = v32;
  id v6 = v5;
  if (v4)
  {
    v7 = +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:@"status" value:&off_100523660 negation:0];
    v38[0] = @"stream_uid";
    v38[1] = @"assistant_id";
    id v8 = +[NSArray arrayWithObjects:v38 count:2];
    id v31 = v6;
    id v9 = [v4 selectValueTuplesFromTableWithName:@"events" columnNames:v8 behavior:1 indexedBy:@"events_index_covering_status_stream_uid" criterion:v7 order:0 range:0 error:&v31];
    id v10 = v31;

    if (!v10)
    {
      id v25 = v7;
      __int16 v26 = v4;
      id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v9, "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v13 = v9;
      id v14 = [v13 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v28;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            id v19 = [v18 firstObject];
            uint64_t v20 = objc_msgSend(v19, "siriCoreSQLiteValue_toString");

            id v21 = [v18 objectAtIndex:1];
            id v22 = objc_msgSend(v21, "siriCoreSQLiteValue_toString");

            if (v20)
            {
              v23 = objc_alloc_init(ADAnalyticsCompositeStreamId);
              [(ADAnalyticsCompositeStreamId *)v23 setStreamUID:v20];
              [(ADAnalyticsCompositeStreamId *)v23 setSpeechId:v22];
              [v12 addObject:v23];
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v27 objects:v33 count:16];
        }
        while (v15);
      }

      v7 = v25;
      id v4 = v26;
      goto LABEL_23;
    }
    unint64_t v11 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[ADAnalyticsStore _fetchEventStreamUIDsWithError:]";
      __int16 v36 = 2112;
      id v37 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Failed to select database records due to error %@", buf, 0x16u);
      if (a3) {
        goto LABEL_7;
      }
    }
    else if (a3)
    {
LABEL_7:
      id v12 = 0;
      *a3 = v10;
LABEL_23:

      goto LABEL_24;
    }
    id v12 = 0;
    goto LABEL_23;
  }
  if (a3)
  {
    id v10 = v5;
    id v12 = 0;
    *a3 = v10;
  }
  else
  {
    id v12 = 0;
    id v10 = v5;
  }
LABEL_24:

  return v12;
}

- (BOOL)_purgeDeletedEventRecordsBeforeOrEqualToDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v20 = 0;
  v7 = [(ADAnalyticsStore *)self _preparedDatabaseWithError:&v20];
  id v8 = v20;
  id v9 = v8;
  if (v7)
  {
    [v6 timeIntervalSince1970];
    id v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    unint64_t v11 = +[SiriCoreSQLiteQueryCriterion lessThanOrEqualToQueryCriterionWithColumnName:@"date_created" value:v10];
    v25[0] = v11;
    id v12 = +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:@"status" value:&off_100523678 negation:0];
    v25[1] = v12;
    id v13 = +[NSArray arrayWithObjects:v25 count:2];
    id v14 = +[SiriCoreSQLiteQueryCriterion andQueryCriterionWithSubcriteria:v13];

    id v19 = v9;
    unsigned __int8 v15 = [v7 deleteFromTableWithName:@"events" indexedBy:@"events_index_date_created_status" criterion:v14 error:&v19];
    id v16 = v19;

    if ((v15 & 1) == 0)
    {
      id v17 = AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v22 = "-[ADAnalyticsStore _purgeDeletedEventRecordsBeforeOrEqualToDate:error:]";
        __int16 v23 = 2112;
        id v24 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Failed to purge database records with deleted state due to error %@", buf, 0x16u);
        if (!a4) {
          goto LABEL_8;
        }
        goto LABEL_7;
      }
      if (a4) {
LABEL_7:
      }
        *a4 = v16;
    }
LABEL_8:

    goto LABEL_12;
  }
  if (a4)
  {
    id v16 = v8;
    unsigned __int8 v15 = 0;
    *a4 = v16;
  }
  else
  {
    unsigned __int8 v15 = 0;
    id v16 = v8;
  }
LABEL_12:

  return v15;
}

- (BOOL)_deleteEventRecordsWithRecordIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (!a4)
  {
    if (![v6 count]) {
      goto LABEL_18;
    }
LABEL_5:
    id v32 = 0;
    id v8 = [(ADAnalyticsStore *)self _preparedDatabaseWithError:&v32];
    id v9 = v32;
    if (!v8)
    {
      if (a4)
      {
        id v20 = v9;
        unsigned __int8 v19 = 0;
        *a4 = v20;
      }
      else
      {
        unsigned __int8 v19 = 0;
        id v20 = v9;
      }
      goto LABEL_22;
    }
    id v25 = v9;
    __int16 v26 = v8;
    id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    unint64_t v11 = [v7 allObjects];
    id v12 = [v11 countByEnumeratingWithState:&v28 objects:v41 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:@"record_id" value:*(void *)(*((void *)&v28 + 1) + 8 * i) negation:0];
          [v10 addObject:v16];
        }
        id v13 = [v11 countByEnumeratingWithState:&v28 objects:v41 count:16];
      }
      while (v13);
    }

    id v17 = +[SiriCoreSQLiteQueryCriterion orQueryCriterionWithSubcriteria:v10];
    CFStringRef v39 = @"status";
    v40 = &off_100523678;
    id v18 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    id v8 = v26;
    id v27 = v25;
    unsigned __int8 v19 = [v26 updateTableWithName:@"events" valueMap:v18 criterion:v17 error:&v27];
    id v20 = v27;

    if ((v19 & 1) == 0)
    {
      id v21 = (void *)AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = v21;
        id v24 = [v10 count];
        *(_DWORD *)buf = 136315650;
        v34 = "-[ADAnalyticsStore _deleteEventRecordsWithRecordIDs:error:]";
        __int16 v35 = 2048;
        id v36 = v24;
        __int16 v37 = 2112;
        id v38 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s Failed to update %lu database records with deleted state due to error %@", buf, 0x20u);

        if (!a4) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      if (a4) {
LABEL_16:
      }
        *a4 = v20;
    }
LABEL_17:

LABEL_22:
    goto LABEL_23;
  }
  *a4 = 0;
  if ([v6 count]) {
    goto LABEL_5;
  }
  *a4 = 0;
LABEL_18:
  unsigned __int8 v19 = 1;
LABEL_23:

  return v19;
}

- (BOOL)_deleteEventRecordsFromStartTime:(unint64_t)a3 toEndTime:(unint64_t)a4 eventStreamUID:(id)a5 error:(id *)a6
{
  id v10 = a5;
  if (a6) {
    *a6 = 0;
  }
  id v29 = 0;
  unint64_t v11 = [(ADAnalyticsStore *)self _preparedDatabaseWithError:&v29];
  id v12 = v29;
  id v13 = v12;
  if (v11)
  {
    uint64_t v14 = +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:@"stream_uid" value:v10 negation:0];
    unsigned __int8 v15 = (void *)v14;
    if (!a3 || a4)
    {
      v36[0] = v14;
      id v16 = +[NSNumber numberWithUnsignedLongLong:a3];
      id v27 = v10;
      id v17 = +[SiriCoreSQLiteQueryCriterion greaterThanOrEqualToQueryCriterionWithColumnName:@"timestamp" value:v16];
      v36[1] = v17;
      id v18 = +[NSNumber numberWithUnsignedLongLong:a4];
      id v22 = +[SiriCoreSQLiteQueryCriterion lessThanOrEqualToQueryCriterionWithColumnName:@"timestamp" value:v18];
      v36[2] = v22;
      __int16 v23 = +[NSArray arrayWithObjects:v36 count:3];
      unsigned __int8 v19 = +[SiriCoreSQLiteQueryCriterion andQueryCriterionWithSubcriteria:v23];

      id v10 = v27;
    }
    else
    {
      v37[0] = v14;
      id v16 = +[NSNumber numberWithUnsignedLongLong:a3];
      id v17 = +[SiriCoreSQLiteQueryCriterion greaterThanOrEqualToQueryCriterionWithColumnName:@"timestamp" value:v16];
      v37[1] = v17;
      id v18 = +[NSArray arrayWithObjects:v37 count:2];
      unsigned __int8 v19 = +[SiriCoreSQLiteQueryCriterion andQueryCriterionWithSubcriteria:v18];
    }

    CFStringRef v34 = @"status";
    __int16 v35 = &off_100523678;
    id v24 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    id v28 = v13;
    unsigned __int8 v21 = [v11 updateTableWithName:@"events" valueMap:v24 criterion:v19 error:&v28];
    id v20 = v28;

    if (v21) {
      goto LABEL_14;
    }
    id v25 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v31 = "-[ADAnalyticsStore _deleteEventRecordsFromStartTime:toEndTime:eventStreamUID:error:]";
      __int16 v32 = 2112;
      id v33 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s Failed to update database records with deleted state due to error %@", buf, 0x16u);
      if (!a6) {
        goto LABEL_14;
      }
    }
    else if (!a6)
    {
LABEL_14:

      goto LABEL_15;
    }
    *a6 = v20;
    goto LABEL_14;
  }
  if (a6)
  {
    id v20 = v12;
    unsigned __int8 v21 = 0;
    *a6 = v20;
  }
  else
  {
    unsigned __int8 v21 = 0;
    id v20 = v12;
  }
LABEL_15:

  return v21;
}

- (BOOL)_deleteEventRecordsBeforeOrEqualToTimestamp:(unint64_t)a3 deliveryStream:(unint64_t)a4 eventStreamUID:(id)a5 streamSpeechId:(id)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a6;
  if (a7) {
    *a7 = 0;
  }
  id v35 = 0;
  uint64_t v14 = [(ADAnalyticsStore *)self _preparedDatabaseWithError:&v35];
  id v15 = v35;
  id v16 = v15;
  if (v14)
  {
    long long v31 = v14;
    id v32 = v13;
    if (v13) {
      +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:@"assistant_id" value:v13 negation:0];
    }
    else {
    uint64_t v19 = +[SiriCoreSQLiteQueryCriterion isNullQueryCriterionWithColumnName:@"assistant_id" negation:0];
    }
    id v33 = v12;
    id v20 = +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:@"stream_uid" value:v12 negation:0];
    v42[0] = v20;
    v42[1] = v19;
    long long v30 = (void *)v19;
    unsigned __int8 v21 = +[NSNumber numberWithUnsignedInteger:a4];
    id v22 = +[SiriCoreSQLiteQueryCriterion isQueryCriterionWithColumnName:@"delivery_stream" value:v21 negation:0];
    v42[2] = v22;
    __int16 v23 = +[NSNumber numberWithUnsignedLongLong:a3];
    id v24 = +[SiriCoreSQLiteQueryCriterion lessThanOrEqualToQueryCriterionWithColumnName:@"timestamp" value:v23];
    v42[3] = v24;
    id v25 = +[NSArray arrayWithObjects:v42 count:4];
    __int16 v26 = +[SiriCoreSQLiteQueryCriterion andQueryCriterionWithSubcriteria:v25];

    CFStringRef v40 = @"status";
    v41 = &off_100523678;
    id v27 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    id v34 = v16;
    uint64_t v14 = v31;
    unsigned __int8 v18 = [v31 updateTableWithName:@"events" valueMap:v27 criterion:v26 error:&v34];
    id v17 = v34;

    if (v18) {
      goto LABEL_13;
    }
    id v28 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v37 = "-[ADAnalyticsStore _deleteEventRecordsBeforeOrEqualToTimestamp:deliveryStream:eventStreamUID:streamSpeechId:error:]";
      __int16 v38 = 2112;
      id v39 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s Failed to update database records with deleted state due to error %@", buf, 0x16u);
      if (!a7) {
        goto LABEL_13;
      }
    }
    else if (!a7)
    {
LABEL_13:

      id v13 = v32;
      id v12 = v33;
      goto LABEL_14;
    }
    *a7 = v17;
    goto LABEL_13;
  }
  if (a7)
  {
    id v17 = v15;
    unsigned __int8 v18 = 0;
    *a7 = v17;
  }
  else
  {
    unsigned __int8 v18 = 0;
    id v17 = v15;
  }
LABEL_14:

  return v18;
}

- (BOOL)_insertEventRecords:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v43 = 0;
  v7 = [(ADAnalyticsStore *)self _preparedDatabaseWithError:&v43];
  id v8 = v43;
  id v9 = v8;
  if (!v7)
  {
    if (!a4)
    {
      BOOL v28 = 0;
      goto LABEL_40;
    }
    goto LABEL_36;
  }
  id v42 = v8;
  unsigned __int8 v10 = [v7 beginTransactionWithError:&v42];
  id v11 = v42;

  if ((v10 & 1) == 0)
  {
    id v29 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v45 = "-[ADAnalyticsStore _insertEventRecords:error:]";
      __int16 v46 = 2112;
      id v47 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s Failed to begin database transaction due to error %@", buf, 0x16u);
      if (a4) {
        goto LABEL_35;
      }
    }
    else if (a4)
    {
LABEL_35:
      id v8 = v11;
LABEL_36:
      id v9 = v8;
      BOOL v28 = 0;
      *a4 = v9;
      goto LABEL_40;
    }
    BOOL v28 = 0;
    id v9 = v11;
    goto LABEL_40;
  }
  long long v31 = v11;
  id v32 = v6;
  id v12 = [v6 mutableCopy];
  if ([v12 count])
  {
    id v33 = v12;
    do
    {
      if ((unint64_t)[v12 count] >= 0x11)
      {
        objc_msgSend(v12, "subarrayWithRange:", 0, 16);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObjectsInRange:", 0, 16);
      }
      else
      {
        id v13 = [v12 copy];
        [v12 removeAllObjects];
      }
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v14 = v13;
      id v15 = [v14 countByEnumeratingWithState:&v38 objects:v52 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v39;
        do
        {
          unsigned __int8 v18 = 0;
          do
          {
            if (*(void *)v39 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v18);
            id v37 = 0;
            unsigned __int8 v20 = [v7 insertIntoTableWithName:@"events" record:v19 error:&v37];
            id v21 = v37;
            if ((v20 & 1) == 0)
            {
              id v22 = AFSiriLogContextAnalytics;
              if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                id v45 = "-[ADAnalyticsStore _insertEventRecords:error:]";
                __int16 v46 = 2112;
                id v47 = v19;
                __int16 v48 = 2112;
                CFStringRef v49 = @"events";
                __int16 v50 = 2112;
                id v51 = v21;
                _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Failed to insert event record %@ into %@ table due to error %@", buf, 0x2Au);
              }
            }

            unsigned __int8 v18 = (char *)v18 + 1;
          }
          while (v16 != v18);
          id v16 = [v14 countByEnumeratingWithState:&v38 objects:v52 count:16];
        }
        while (v16);
      }

      id v12 = v33;
    }
    while ([v33 count]);
  }
  id v36 = v31;
  unsigned __int8 v23 = [v7 commitTransactionWithError:&v36];
  id v9 = v36;

  if ((v23 & 1) == 0)
  {
    id v24 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v45 = "-[ADAnalyticsStore _insertEventRecords:error:]";
      __int16 v46 = 2112;
      id v47 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s Failed to commit database transaction due to error %@", buf, 0x16u);
    }
    id v35 = 0;
    unsigned __int8 v25 = [v7 rollbackTransactionWithError:&v35];
    id v26 = v35;
    if ((v25 & 1) == 0)
    {
      id v27 = AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v45 = "-[ADAnalyticsStore _insertEventRecords:error:]";
        __int16 v46 = 2112;
        id v47 = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s Failed to rollback database transaction due to error %@", buf, 0x16u);
      }
    }
  }
  if (a4) {
    *a4 = v9;
  }
  BOOL v28 = v9 == 0;

  id v6 = v32;
LABEL_40:

  return v28;
}

- (id)_preparedDatabaseWithError:(id *)a3
{
  v3 = self;
  if (a3) {
    *a3 = 0;
  }
  database = self->_database;
  if (database) {
    goto LABEL_4;
  }
  id v6 = +[ADPreferences sharedPreferences];
  id v7 = [v6 lastKnownAnalyticsStoreState];

  id v8 = &HMAccessoryCategoryTypeAirPort_ptr;
  if (v7)
  {
    id v9 = +[AFAnalytics sharedAnalytics];
    [v9 logEventWithType:4301 context:0];

    unsigned __int8 v10 = +[NSFileManager defaultManager];
    unsigned int v11 = [v10 fileExistsAtPath:v3->_path];

    id v12 = 0;
    if (v11)
    {
      id v13 = +[NSFileManager defaultManager];
      path = v3->_path;
      id v164 = 0;
      unsigned __int8 v15 = [v13 removeItemAtPath:path error:&v164];
      id v12 = v164;

      if ((v15 & 1) == 0)
      {
        id v16 = AFSiriLogContextAnalytics;
        if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
        {
          CFStringRef v17 = (const __CFString *)v3->_path;
          *(_DWORD *)buf = 136315650;
          v187 = "-[ADAnalyticsStore _preparedDatabaseWithError:]";
          __int16 v188 = 2112;
          CFStringRef v189 = v17;
          __int16 v190 = 2112;
          uint64_t v191 = (uint64_t)v12;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Failed to remove database at path %@ due to %@.", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    id v12 = 0;
  }
  unsigned __int8 v18 = +[ADPreferences sharedPreferences];
  [v18 setLastKnownAnalyticsStoreState:1];

  id v19 = 0;
  CFStringRef v20 = 0;
  v143 = v3;
  do
  {
    id v21 = v19;
    id v19 = [objc_alloc((Class)SiriCoreSQLiteDatabase) initWithPath:v3->_path dataProtectionClass:2 options:3];

    id v22 = [v8[418] defaultManager];
    unsigned __int8 v23 = [v22 fileExistsAtPath:v3->_path];

    id v163 = 0;
    unsigned int v24 = [v19 openWithError:&v163];
    id v25 = v163;
    if (!v24)
    {
      id v27 = +[AFAnalytics sharedAnalytics];
      BOOL v28 = AFAnalyticsContextCreateWithError();
      v198[0] = v28;
      CFStringRef v196 = @"retryCount";
      id v29 = +[NSNumber numberWithUnsignedInteger:v20];
      v197 = v29;
      long long v30 = +[NSDictionary dictionaryWithObjects:&v197 forKeys:&v196 count:1];
      v198[1] = v30;
      long long v31 = +[NSArray arrayWithObjects:v198 count:2];
      id v32 = AFAnalyticsContextsMerge();
      [v27 logEventWithType:4302 context:v32];

      v3 = v143;
      id v33 = AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        v54 = v143->_path;
        *(_DWORD *)buf = 136316162;
        v187 = "-[ADAnalyticsStore _preparedDatabaseWithError:]";
        __int16 v188 = 2048;
        CFStringRef v189 = v20;
        __int16 v190 = 2048;
        uint64_t v191 = 3;
        __int16 v192 = 2112;
        v193 = (__CFString *)v54;
        __int16 v194 = 2112;
        id v195 = v25;
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s Failed to open analytics database (retry %tu/%tu) at path %@ with error %@.", buf, 0x34u);
        if (v25) {
          goto LABEL_21;
        }
        goto LABEL_18;
      }
LABEL_17:
      if (v25) {
        goto LABEL_21;
      }
      goto LABEL_18;
    }
    if (v23) {
      goto LABEL_17;
    }
    id v26 = +[AFAnalytics sharedAnalytics];
    [v26 logEventWithType:4307 context:0];

    if (v25) {
      goto LABEL_21;
    }
LABEL_18:
    id v162 = 0;
    unsigned __int8 v34 = [v19 performIntegrityCheckWithError:&v162];
    id v25 = v162;
    if (v34) {
      goto LABEL_20;
    }
    id v35 = +[AFAnalytics sharedAnalytics];
    id v36 = AFAnalyticsContextCreateWithError();
    v185[0] = v36;
    CFStringRef v183 = @"retryCount";
    id v37 = +[NSNumber numberWithUnsignedInteger:v20];
    v184 = v37;
    long long v38 = +[NSDictionary dictionaryWithObjects:&v184 forKeys:&v183 count:1];
    v185[1] = v38;
    long long v39 = +[NSArray arrayWithObjects:v185 count:2];
    long long v40 = AFAnalyticsContextsMerge();
    [v35 logEventWithType:4303 context:v40];

    v3 = v143;
    long long v41 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      v55 = v143->_path;
      *(_DWORD *)buf = 136316162;
      v187 = "-[ADAnalyticsStore _preparedDatabaseWithError:]";
      __int16 v188 = 2048;
      CFStringRef v189 = v20;
      __int16 v190 = 2048;
      uint64_t v191 = 3;
      __int16 v192 = 2112;
      v193 = (__CFString *)v55;
      __int16 v194 = 2112;
      id v195 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s Failed to perform integrity check on analytics database (retry %tu/%tu) at path %@ with error %@.", buf, 0x34u);
      if (!v25) {
        goto LABEL_39;
      }
    }
    else
    {
LABEL_20:
      if (!v25) {
        goto LABEL_39;
      }
    }
LABEL_21:
    [v19 closeWithError:0];
    if (SiriCoreSQLiteDatabaseIsErrorUnrecoverable())
    {
      id v42 = +[AFAnalytics sharedAnalytics];
      id v43 = AFAnalyticsContextCreateWithError();
      v182[0] = v43;
      CFStringRef v180 = @"retryCount";
      id v44 = +[NSNumber numberWithUnsignedInteger:v20];
      v181 = v44;
      id v45 = +[NSDictionary dictionaryWithObjects:&v181 forKeys:&v180 count:1];
      v182[1] = v45;
      __int16 v46 = +[NSArray arrayWithObjects:v182 count:2];
      id v47 = AFAnalyticsContextsMerge();
      [v42 logEventWithType:4304 context:v47];

      v3 = v143;
      id v8 = &HMAccessoryCategoryTypeAirPort_ptr;
      __int16 v48 = +[NSFileManager defaultManager];
      LODWORD(v44) = [v48 fileExistsAtPath:v143->_path];

      if (v44)
      {
        CFStringRef v49 = +[NSFileManager defaultManager];
        __int16 v50 = v143->_path;
        id v161 = v25;
        unsigned __int8 v51 = [v49 removeItemAtPath:v50 error:&v161];
        id v12 = v161;

        if ((v51 & 1) == 0)
        {
          v52 = AFSiriLogContextAnalytics;
          if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
          {
            v53 = v143->_path;
            *(_DWORD *)buf = 136316162;
            v187 = "-[ADAnalyticsStore _preparedDatabaseWithError:]";
            __int16 v188 = 2048;
            CFStringRef v189 = v20;
            __int16 v190 = 2048;
            uint64_t v191 = 3;
            __int16 v192 = 2112;
            v193 = (__CFString *)v53;
            __int16 v194 = 2112;
            id v195 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%s Failed to remove database (retry %tu out of %tu) at path %@ due to %@.", buf, 0x34u);
          }
        }
      }
      else
      {
        id v12 = v25;
      }
    }
    else
    {
      id v12 = v25;
      id v8 = &HMAccessoryCategoryTypeAirPort_ptr;
    }
    CFStringRef v20 = (const __CFString *)((char *)v20 + 1);
  }
  while (v20 != (const __CFString *)3);
  if (v12)
  {
    v56 = +[AFAnalytics sharedAnalytics];
    v57 = AFAnalyticsContextCreateWithError();
    v179[0] = v57;
    CFStringRef v177 = @"retryCount";
    v58 = +[NSNumber numberWithUnsignedInteger:3];
    v178 = v58;
    v59 = +[NSDictionary dictionaryWithObjects:&v178 forKeys:&v177 count:1];
    v179[1] = v59;
    v60 = +[NSArray arrayWithObjects:v179 count:2];
    v61 = AFAnalyticsContextsMerge();
    [v56 logEventWithType:4305 context:v61];

    v62 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v187 = "-[ADAnalyticsStore _preparedDatabaseWithError:]";
      __int16 v188 = 2048;
      CFStringRef v189 = (const __CFString *)3;
      __int16 v190 = 2112;
      uint64_t v191 = (uint64_t)v12;
      _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%s Failed to prepare analytics database after %tu retries due to %@.", buf, 0x20u);
      if (a3) {
LABEL_37:
      }
        *a3 = v12;
    }
    else if (a3)
    {
      goto LABEL_37;
    }

LABEL_98:
    id v5 = 0;
    goto LABEL_99;
  }
LABEL_39:
  id v137 = objc_alloc((Class)SiriCoreSQLiteTableDescription);
  id objb = [objc_alloc((Class)SiriCoreSQLiteColumnDescription) initWithName:@"stream_uid" type:@"TEXT" constraints:0];
  v176[0] = objb;
  id v63 = objc_alloc((Class)SiriCoreSQLiteColumnDescription);
  v134 = +[SiriCoreSQLiteColumnConstraint defaultColumnConstraintWithName:0 value:&off_100523660];
  v175 = v134;
  v133 = +[NSArray arrayWithObjects:&v175 count:1];
  id v132 = [v63 initWithName:@"delivery_stream" type:@"INTEGER" constraints:v133];
  v176[1] = v132;
  id v131 = [objc_alloc((Class)SiriCoreSQLiteColumnDescription) initWithName:@"type" type:@"INTEGER" constraints:0];
  v176[2] = v131;
  id v130 = [objc_alloc((Class)SiriCoreSQLiteColumnDescription) initWithName:@"timestamp" type:@"INTEGER" constraints:0];
  v176[3] = v130;
  id v129 = [objc_alloc((Class)SiriCoreSQLiteColumnDescription) initWithName:@"context_data" type:@"BLOB" constraints:0];
  v176[4] = v129;
  id v64 = [objc_alloc((Class)SiriCoreSQLiteColumnDescription) initWithName:@"context_data_type" type:@"INTEGER" constraints:0];
  v176[5] = v64;
  id v65 = [objc_alloc((Class)SiriCoreSQLiteColumnDescription) initWithName:@"date_created" type:@"REAL" constraints:0];
  v176[6] = v65;
  id v66 = objc_alloc((Class)SiriCoreSQLiteColumnDescription);
  v67 = +[SiriCoreSQLiteColumnConstraint defaultColumnConstraintWithName:0 value:&off_100523660];
  v174 = v67;
  v68 = +[NSArray arrayWithObjects:&v174 count:1];
  id v69 = [v66 initWithName:@"status" type:@"INTEGER" constraints:v68];
  v176[7] = v69;
  id v70 = [objc_alloc((Class)SiriCoreSQLiteColumnDescription) initWithName:@"assistant_id" type:@"TEXT" constraints:0];
  v176[8] = v70;
  id v71 = [objc_alloc((Class)SiriCoreSQLiteColumnDescription) initWithName:@"record_id" type:@"TEXT" constraints:0];
  v176[9] = v71;
  v72 = +[NSArray arrayWithObjects:v176 count:10];
  id v138 = [v137 initWithName:@"events" columns:v72 constraints:0];

  v73 = [v19 fetchTableWithName:@"events" error:0];
  v74 = v73;
  if (v73)
  {
    v75 = [v73 columns];
    v76 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v75 count]);

    long long v159 = 0u;
    long long v160 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    v77 = [v74 columns];
    id v78 = [v77 countByEnumeratingWithState:&v157 objects:v173 count:16];
    if (v78)
    {
      id v79 = v78;
      uint64_t v80 = *(void *)v158;
      do
      {
        for (i = 0; i != v79; i = (char *)i + 1)
        {
          if (*(void *)v158 != v80) {
            objc_enumerationMutation(v77);
          }
          v82 = objc_msgSend(*(id *)(*((void *)&v157 + 1) + 8 * i), "name", v129);
          [v76 addObject:v82];
        }
        id v79 = [v77 countByEnumeratingWithState:&v157 objects:v173 count:16];
      }
      while (v79);
    }
    v135 = v74;

    v83 = [v138 columns];
    v84 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v83 count]);

    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    v85 = [v138 columns];
    id v86 = [v85 countByEnumeratingWithState:&v153 objects:v172 count:16];
    if (v86)
    {
      id v87 = v86;
      uint64_t v88 = *(void *)v154;
      do
      {
        for (j = 0; j != v87; j = (char *)j + 1)
        {
          if (*(void *)v154 != v88) {
            objc_enumerationMutation(v85);
          }
          v90 = *(void **)(*((void *)&v153 + 1) + 8 * (void)j);
          v91 = objc_msgSend(v90, "name", v129);
          unsigned __int8 v92 = [v76 containsObject:v91];

          if ((v92 & 1) == 0) {
            [v84 addObject:v90];
          }
        }
        id v87 = [v85 countByEnumeratingWithState:&v153 objects:v172 count:16];
      }
      while (v87);
    }

    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    id obj = v84;
    id v93 = [obj countByEnumeratingWithState:&v149 objects:v171 count:16];
    if (v93)
    {
      id v94 = v93;
      char v95 = 0;
      v96 = 0;
      uint64_t v97 = *(void *)v150;
      while (2)
      {
        v98 = 0;
        v99 = v96;
        do
        {
          if (*(void *)v150 != v97) {
            objc_enumerationMutation(obj);
          }
          v100 = *(void **)(*((void *)&v149 + 1) + 8 * (void)v98);
          v101 = objc_msgSend(v100, "name", v129);
          unsigned int v102 = [v101 isEqualToString:@"record_id"];

          if (v102) {
            char v95 = 1;
          }
          v148 = v99;
          unsigned __int8 v103 = [v19 alterTableWithName:@"events" addColumn:v100 error:&v148];
          v96 = v148;

          if ((v103 & 1) == 0)
          {
            v104 = (void *)AFSiriLogContextAnalytics;
            if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
            {
              v127 = v104;
              v128 = [v100 name];
              *(_DWORD *)buf = 136315906;
              v187 = "-[ADAnalyticsStore _preparedDatabaseWithError:]";
              __int16 v188 = 2112;
              CFStringRef v189 = v128;
              __int16 v190 = 2112;
              uint64_t v191 = @"events";
              __int16 v192 = 2112;
              v193 = v96;
              _os_log_error_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, "%s Failed to add column '%@' to '%@' table with error %@", buf, 0x2Au);
            }
            if (a3)
            {
              v96 = v96;
              char v105 = 0;
              *a3 = v96;
            }
            else
            {
              char v105 = 0;
            }
            goto LABEL_81;
          }
          v98 = (char *)v98 + 1;
          v99 = v96;
        }
        while (v94 != v98);
        id v94 = [obj countByEnumeratingWithState:&v149 objects:v171 count:16];
        if (v94) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v95 = 0;
      v96 = 0;
    }
    char v105 = 1;
LABEL_81:
    v74 = v135;
    v106 = v138;

    if (v105)
    {
      int v136 = v95 & 1;
LABEL_83:
      objc_msgSend(v19, "dropIndexWithName:error:", @"events_index_date_inserted", 0, v129);
      [v19 dropIndexWithName:@"status" error:0];
      [v19 dropIndexWithName:@"delivery_stream" error:0];
      [v19 dropIndexWithName:@"events_index_date_created" error:0];
      v145[0] = _NSConcreteStackBlock;
      v145[1] = 3221225472;
      v145[2] = sub_10013F990;
      v145[3] = &unk_1005036F8;
      id obja = v19;
      id v146 = obja;
      v111 = objc_retainBlock(v145);
      v170[0] = @"stream_uid";
      v170[1] = @"assistant_id";
      v112 = +[NSArray arrayWithObjects:v170 count:2];
      ((void (*)(void *, const __CFString *, void *))v111[2])(v111, @"events_index_stream_uid", v112);

      CFStringRef v169 = @"timestamp";
      v113 = +[NSArray arrayWithObjects:&v169 count:1];
      ((void (*)(void *, const __CFString *, void *))v111[2])(v111, @"events_index_timestamp", v113);

      v168[0] = @"status";
      v168[1] = @"date_created";
      v114 = +[NSArray arrayWithObjects:v168 count:2];
      ((void (*)(void *, const __CFString *, void *))v111[2])(v111, @"events_index_date_created_status", v114);

      v167[0] = @"status";
      v167[1] = @"stream_uid";
      v115 = +[NSArray arrayWithObjects:v167 count:2];
      ((void (*)(void *, const __CFString *, void *))v111[2])(v111, @"events_index_covering_status_stream_uid", v115);

      v166[0] = @"timestamp";
      v166[1] = @"stream_uid";
      v166[2] = @"assistant_id";
      v166[3] = @"status";
      v166[4] = @"delivery_stream";
      v116 = +[NSArray arrayWithObjects:v166 count:5];
      ((void (*)(void *, const __CFString *, void *))v111[2])(v111, @"events_index_event_batch", v116);

      CFStringRef v165 = @"record_id";
      v117 = +[NSArray arrayWithObjects:&v165 count:1];
      ((void (*)(void *, const __CFString *, void *))v111[2])(v111, @"events_index_record_uuid", v117);

      if (v136)
      {
        v118 = AFSiriLogContextAnalytics;
        if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v187 = "-[ADAnalyticsStore _preparedDatabaseWithError:]";
          __int16 v188 = 2112;
          CFStringRef v189 = @"record_id";
          _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_INFO, "%s %@ column added as part of DB migration, performing column value uniquification", buf, 0x16u);
        }
        v119 = +[SiriCoreSQLiteQueryCriterion isNullQueryCriterionWithColumnName:@"record_id" negation:0];
        v144 = v96;
        v120 = obja;
        unsigned __int8 v121 = [obja updateTableWithName:@"events" columnName:@"record_id" columnValue:@"UUID()" criterion:v119 error:&v144];
        v122 = v144;

        if (v121)
        {

          v106 = v138;
          goto LABEL_90;
        }
        v125 = AFSiriLogContextAnalytics;
        v106 = v138;
        if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v187 = "-[ADAnalyticsStore _preparedDatabaseWithError:]";
          __int16 v188 = 2112;
          CFStringRef v189 = v122;
          _os_log_error_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_ERROR, "%s Failed to update database records with UUIDs due to error %@", buf, 0x16u);
        }
        if (a3)
        {
          v122 = v122;
          *a3 = v122;
        }
        int v110 = 1;
        v109 = v143;
      }
      else
      {
        v122 = v96;
        v106 = v138;
        v120 = obja;
LABEL_90:
        v123 = +[ADPreferences sharedPreferences];
        [v123 setLastKnownAnalyticsStoreState:0];

        v124 = v120;
        int v110 = 0;
        v109 = v143;
        v119 = v143->_database;
        v143->_database = v124;
      }

      v96 = v122;
    }
    else
    {
      int v110 = 1;
      v109 = v143;
    }
  }
  else
  {
    id v147 = 0;
    v106 = v138;
    unsigned __int8 v107 = [v19 createTable:v138 error:&v147];
    v96 = (__CFString *)v147;
    if (v107)
    {
      int v136 = 0;
      goto LABEL_83;
    }
    v108 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v187 = "-[ADAnalyticsStore _preparedDatabaseWithError:]";
      __int16 v188 = 2112;
      CFStringRef v189 = @"events";
      __int16 v190 = 2112;
      uint64_t v191 = (uint64_t)v96;
      _os_log_error_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "%s Failed to create '%@' table with error %@", buf, 0x20u);
    }
    v109 = v143;
    if (a3)
    {
      v96 = v96;
      *a3 = v96;
    }
    int v110 = 1;
  }

  if (v110) {
    goto LABEL_98;
  }
  database = v109->_database;
LABEL_4:
  id v5 = database;
LABEL_99:
  return v5;
}

- (BOOL)_resetForReason:(id)a3 error:(id *)a4
{
  id v6 = (__CFString *)a3;
  if (a4) {
    *a4 = 0;
  }
  database = self->_database;
  if (database)
  {
    id v32 = 0;
    unsigned __int8 v8 = [(SiriCoreSQLiteDatabase *)database closeWithError:&v32];
    id v9 = v32;
    if ((v8 & 1) == 0)
    {
      unsigned __int8 v10 = AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        path = self->_path;
        *(_DWORD *)buf = 136315650;
        id v37 = "-[ADAnalyticsStore _resetForReason:error:]";
        __int16 v38 = 2112;
        long long v39 = path;
        __int16 v40 = 2112;
        id v41 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Failed to close database (%@) due to %@.", buf, 0x20u);
      }
    }
    unsigned int v11 = self->_database;
    self->_database = 0;
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v12 = mach_absolute_time();
  id v13 = +[NSFileManager defaultManager];
  unsigned int v14 = [v13 fileExistsAtPath:self->_path];

  if (v14)
  {
    unsigned __int8 v15 = +[NSFileManager defaultManager];
    id v16 = self->_path;
    id v31 = 0;
    unsigned __int8 v17 = [v15 removeItemAtPath:v16 error:&v31];
    id v18 = v31;

    if ((v17 & 1) == 0)
    {
      id v19 = AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v20 = self->_path;
        *(_DWORD *)buf = 136315650;
        id v37 = "-[ADAnalyticsStore _resetForReason:error:]";
        __int16 v38 = 2112;
        long long v39 = v20;
        __int16 v40 = 2112;
        id v41 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Failed to remove database (%@) due to %@.", buf, 0x20u);
      }
    }
  }
  else
  {
    id v18 = 0;
  }
  if (v9) {
    id v21 = v9;
  }
  else {
    id v21 = v18;
  }
  if (a4) {
    *a4 = v21;
  }
  if (v6) {
    CFStringRef v22 = v6;
  }
  else {
    CFStringRef v22 = @"unknown";
  }
  CFStringRef v33 = @"reason";
  CFStringRef v34 = v22;
  id v23 = v21;
  unsigned int v24 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  v35[0] = v24;
  id v25 = AFAnalyticsContextCreateWithError();
  v35[1] = v25;
  id v26 = +[NSArray arrayWithObjects:v35 count:2];
  id v27 = AFAnalyticsContextsMerge();

  BOOL v28 = +[AFAnalytics sharedAnalytics];
  [v28 logEventWithType:4306 machAbsoluteTime:v12 context:v27];

  return v23 == 0;
}

- (void)updateRecordsWithSpeechId:(id)a3 toUpdatedSpeechId:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v21 = "-[ADAnalyticsStore updateRecordsWithSpeechId:toUpdatedSpeechId:withCompletion:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Updating records with speechId value (%@) to (%@)", buf, 0x20u);
  }
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10013FEC0;
  v16[3] = &unk_10050E228;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(queue, v16);
}

- (void)checkpointWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    path = self->_path;
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[ADAnalyticsStore checkpointWithCompletion:]";
    __int16 v13 = 2112;
    id v14 = path;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Checkpointing write-ahead log (%@)...", buf, 0x16u);
  }
  id v7 = +[ADDaemon sharedDaemon];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100140080;
  v9[3] = &unk_10050E188;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 scheduleUnlockedWork:v9];
}

- (void)resetWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    path = self->_path;
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[ADAnalyticsStore resetWithCompletion:]";
    __int16 v13 = 2112;
    id v14 = path;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Resetting analytics store (%@)...", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100140358;
  v9[3] = &unk_10050E188;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(queue, v9);
}

- (void)purgeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    path = self->_path;
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[ADAnalyticsStore purgeWithCompletion:]";
    __int16 v13 = 2112;
    id v14 = path;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Purging data from analytics store (%@)...", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001405A0;
  v9[3] = &unk_10050E188;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(queue, v9);
}

- (void)fetchEventRecordsCreatedAfterDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001409E0;
  block[3] = &unk_10050E1D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)purgeDeletedEventRecordsBeforeOrEqualToDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[ADAnalyticsStore purgeDeletedEventRecordsBeforeOrEqualToDate:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Purging deleted records before date %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100140BC0;
  block[3] = &unk_10050E1D8;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)deleteEventRecordsFromStartTime:(unint64_t)a3 toEndTime:(unint64_t)a4 eventStreamUID:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100140D0C;
  block[3] = &unk_10050BC30;
  unint64_t v18 = a3;
  unint64_t v19 = a4;
  block[4] = self;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, block);
}

- (void)deleteEventRecordsWithRecordIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    *(_DWORD *)buf = 136315394;
    id v17 = "-[ADAnalyticsStore deleteEventRecordsWithRecordIDs:completion:]";
    __int16 v18 = 2048;
    id v19 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Will delete %lu records", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100140EF8;
  block[3] = &unk_10050E1D8;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(queue, block);
}

- (void)deleteEventRecordsBeforeOrEqualToTimestamp:(unint64_t)a3 deliveryStream:(unint64_t)a4 eventStreamUID:(id)a5 streamSpeechId:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  queue = self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100141070;
  v19[3] = &unk_10050CBB0;
  unint64_t v23 = a3;
  unint64_t v24 = a4;
  v19[4] = self;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(queue, v19);
}

- (void)fetchEventRecords:(unint64_t)a3 eventStreamUID:(id)a4 streamSpeechId:(id)a5 deliveryStream:(unint64_t)a6 completion:(id)a7
{
}

- (void)fetchEventRecords:(unint64_t)a3 afterTimestamp:(unint64_t)a4 eventStreamUID:(id)a5 streamSpeechId:(id)a6 deliveryStream:(unint64_t)a7 completion:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100141218;
  block[3] = &unk_1005036D0;
  unint64_t v25 = a3;
  unint64_t v26 = a4;
  block[4] = self;
  id v22 = v14;
  unint64_t v27 = a7;
  id v23 = v15;
  id v24 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  dispatch_async(queue, block);
}

- (void)fetchEventStreamUIDsWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100141344;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)insertEventRecords:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ADDaemon sharedDaemon];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001414A8;
  v11[3] = &unk_10050E1D8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 scheduleUnlockedWork:v11];
}

- (ADAnalyticsStore)initWithPath:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ADAnalyticsStore;
  id v5 = [(ADAnalyticsStore *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 stringByStandardizingPath];
    path = v5->_path;
    v5->_path = (NSString *)v6;

    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.assistant.analytics-store", v9);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    id v12 = objc_alloc_init(ADAnalyticsEventRecordBuilder);
    eventRecordBuilder = v5->_eventRecordBuilder;
    v5->_eventRecordBuilder = v12;
  }
  return v5;
}

- (void)dealloc
{
  [(SiriCoreSQLiteDatabase *)self->_database closeWithError:0];
  v3.receiver = self;
  v3.super_class = (Class)ADAnalyticsStore;
  [(ADAnalyticsStore *)&v3 dealloc];
}

@end