@interface RAPSubmissionStatusDownloader
- (RAPSubmissionStatusDownloader)init;
- (void)_checkForStatusChangeNotificationsNeededForRapInfos:(id)a3;
- (void)_fetchAndUpdateRAPStatusWithOffset:(int64_t)a3 batchSize:(unint64_t)a4 completion:(id)a5;
- (void)_sendStatusChangeNotificationIfNeeded:(id)a3;
- (void)_updateAllSubmissionStatusWithOffset:(int64_t)a3 batchSize:(unint64_t)a4 completion:(id)a5;
- (void)_updateSubmissionStatusWithIdentifier:(id)a3 completion:(id)a4;
- (void)setNotificationCenter:(id)a3;
- (void)updateSubmissionStatusesWithCompletion:(id)a3;
@end

@implementation RAPSubmissionStatusDownloader

- (RAPSubmissionStatusDownloader)init
{
  v10.receiver = self;
  v10.super_class = (Class)RAPSubmissionStatusDownloader;
  v2 = [(RAPSubmissionStatusDownloader *)&v10 init];
  if (v2)
  {
    v3 = sub_10000D5D0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Initializing submission status downloader from mapspushd", v9, 2u);
    }

    v4 = objc_alloc_init(RAPBatchSubmissionStatusTicket);
    submissionStatusTicket = v2->_submissionStatusTicket;
    v2->_submissionStatusTicket = v4;

    v6 = objc_alloc_init(RAPSubmissionStatusSyncHandler);
    syncHandler = v2->_syncHandler;
    v2->_syncHandler = v6;
  }
  return v2;
}

- (void)setNotificationCenter:(id)a3
{
  id obj = a3;
  p_notificationCenter = &self->_notificationCenter;
  id WeakRetained = objc_loadWeakRetained((id *)p_notificationCenter);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_notificationCenter, obj);
    v6 = obj;
  }
}

- (void)updateSubmissionStatusesWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t UInteger = GEOConfigGetUInteger();
  v6 = sub_10000D5D0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = UInteger;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Start to update submission status with batchSize: %lu", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000D7CC;
  v8[3] = &unk_100038D78;
  id v9 = v4;
  id v7 = v4;
  [(RAPSubmissionStatusDownloader *)self _updateAllSubmissionStatusWithOffset:0 batchSize:UInteger completion:v8];
}

- (void)_updateAllSubmissionStatusWithOffset:(int64_t)a3 batchSize:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  int64_t UInteger = GEOConfigGetUInteger();
  objc_super v10 = sub_10000D5D0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    int64_t v15 = a3;
    __int16 v16 = 2048;
    int64_t v17 = UInteger;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Updating submission status with offset: %lu, totalLimit: %lu", buf, 0x16u);
  }

  if (UInteger >= a3)
  {
    objc_initWeak((id *)buf, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000DAA4;
    v11[3] = &unk_100038DA0;
    objc_copyWeak(v13, (id *)buf);
    id v12 = v8;
    v13[1] = (id)a3;
    v13[2] = (id)a4;
    [(RAPSubmissionStatusDownloader *)self _fetchAndUpdateRAPStatusWithOffset:a3 batchSize:a4 completion:v11];

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

- (void)_fetchAndUpdateRAPStatusWithOffset:(int64_t)a3 batchSize:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = +[NSDate date];
  objc_super v10 = [v9 dateByAddingTimeInterval:-7776000.0];

  objc_initWeak(&location, self);
  syncHandler = self->_syncHandler;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000DC94;
  id v13[3] = &unk_100038DF0;
  objc_copyWeak(&v15, &location);
  id v12 = v8;
  id v14 = v12;
  [(RAPSubmissionStatusSyncHandler *)syncHandler fetchUnresolvedRAPIdentifiersWithBatchSize:a4 offset:a3 oldestDate:v10 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_updateSubmissionStatusWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  submissionStatusTicket = self->_submissionStatusTicket;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000E01C;
  v10[3] = &unk_100038E68;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [(RAPBatchSubmissionStatusTicket *)submissionStatusTicket fetchStatusesForIdentifiers:v6 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_checkForStatusChangeNotificationsNeededForRapInfos:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v9 rapDisplayMenu] & 0xFFFFFFFE) == 2) {
          [(RAPSubmissionStatusDownloader *)self _sendStatusChangeNotificationIfNeeded:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_sendStatusChangeNotificationIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [v4 rapResponse];
  unsigned int v6 = [v5 hasNotification];

  if (v6)
  {
    p_notificationCenter = &self->_notificationCenter;
    id WeakRetained = objc_loadWeakRetained((id *)p_notificationCenter);

    if (WeakRetained)
    {
      id v9 = objc_loadWeakRetained((id *)p_notificationCenter);
      id v10 = [v9 addRAPNotificationForProblemStatusChangeWithRapInfo:v4];

      long long v11 = +[MapsPushManager defaultManager];
      long long v12 = [v4 data];
      [v11 propagateIDSMessageOfType:1 message:v12];

      long long v13 = [v4 rapResponse];
      id v14 = +[GEORPRapResponse RapStateIconAsString:](GEORPRapResponse, "RapStateIconAsString:", [v13 rapStateIcon]);

      id v15 = [v4 rapId];
      __int16 v16 = [v4 rapResponse];
      int64_t v17 = [v16 responseId];
      +[RAPNotificationLogEvent reportNotificationWasShownWithRapId:v15 responseId:v17 notificationType:v14 completion:&stru_100038E88];
    }
    else
    {
      id v14 = sub_10000D5D0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Empty notificationCenter, cannot send a notification", v18, 2u);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationCenter);
  objc_storeStrong((id *)&self->_syncHandler, 0);

  objc_storeStrong((id *)&self->_submissionStatusTicket, 0);
}

@end