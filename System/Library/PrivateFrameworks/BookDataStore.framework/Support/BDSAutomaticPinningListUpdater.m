@interface BDSAutomaticPinningListUpdater
- (BDSAutomaticPinningListUpdater)init;
- (BOOL)_updateCloudDataWithManager:(id)a3;
- (BOOL)jaliscoUpdateSuccessful;
- (BOOL)startUpdateWithManager:(id)a3 jaliscoUpdateSuccessful:(BOOL)a4;
- (NSHashTable)managers;
- (NSProgress)currentProgress;
- (id)observer;
- (unint64_t)currentObserverIdentifier;
- (void)_l_cancelWithManagers:(id)a3;
- (void)_l_finishWithError:(id)a3;
- (void)_l_finishedFetchingCollectionsWithManager:(BOOL)a3;
- (void)_updateAttachmentCompletedFromObserver:(unint64_t)a3 attached:(BOOL)a4;
- (void)cancelWithManager:(id)a3;
- (void)setCurrentObserverIdentifier:(unint64_t)a3;
- (void)setCurrentProgress:(id)a3;
- (void)setJaliscoUpdateSuccessful:(BOOL)a3;
- (void)setManagers:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation BDSAutomaticPinningListUpdater

- (BDSAutomaticPinningListUpdater)init
{
  v7.receiver = self;
  v7.super_class = (Class)BDSAutomaticPinningListUpdater;
  v2 = [(BDSAutomaticPinningListUpdater *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_stateLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSHashTable weakObjectsHashTable];
    managers = v3->_managers;
    v3->_managers = (NSHashTable *)v4;
  }
  return v3;
}

- (BOOL)startUpdateWithManager:(id)a3 jaliscoUpdateSuccessful:(BOOL)a4
{
  id v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_stateLock);
  if (v6)
  {
    objc_super v7 = sub_10000CEB0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AutomaticPinningList startUpdate", buf, 2u);
    }

    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_100040908;
    v13 = &unk_10025FB10;
    v14 = self;
    BOOL v15 = a4;
    os_unfair_lock_lock(&self->_stateLock);
    sub_100040908((uint64_t)&v10);
    os_unfair_lock_unlock(&self->_stateLock);
    BOOL v8 = -[BDSAutomaticPinningListUpdater _updateCloudDataWithManager:](self, "_updateCloudDataWithManager:", v6, v10, v11);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)cancelWithManager:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_stateLock);
  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000409D4;
    v5[3] = &unk_10025F988;
    v5[4] = self;
    id v6 = v4;
    os_unfair_lock_lock(&self->_stateLock);
    sub_1000409D4((uint64_t)v5);
    os_unfair_lock_unlock(&self->_stateLock);
  }
}

- (void)_l_cancelWithManagers:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_stateLock);
  if ([v4 count])
  {
    v5 = +[NSMutableArray array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v32;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          v12 = [(BDSAutomaticPinningListUpdater *)self managers];
          unsigned int v13 = [v12 containsObject:v11];

          if (v13) {
            [v5 addObject:v11];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v8);
    }

    if ([v5 count])
    {
      v14 = [(BDSAutomaticPinningListUpdater *)self managers];
      BOOL v15 = [v14 allObjects];
      id v16 = [v15 count];
      id v17 = [v5 count];

      if (v16 == v17)
      {
        v18 = [(BDSAutomaticPinningListUpdater *)self currentProgress];
        [v18 cancel];

        v19 = [(BDSAutomaticPinningListUpdater *)self observer];

        if (v19) {
          [(BDSAutomaticPinningListUpdater *)self setObserver:0];
        }
      }
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v20 = v5;
      id v21 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v28;
        do
        {
          for (j = 0; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v28 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
            objc_msgSend(v25, "listUpdater:updateDidCompleteWithError:wasCancelled:", self, 0, 1, (void)v27);
            v26 = [(BDSAutomaticPinningListUpdater *)self managers];
            [v26 removeObject:v25];
          }
          id v22 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v22);
      }
    }
  }
}

- (BOOL)_updateCloudDataWithManager:(id)a3
{
  id v4 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_assert_not_owner(&self->_stateLock);
  if (v4)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v10 = sub_100040E24;
    uint64_t v11 = &unk_1002608B0;
    v12 = self;
    v14 = &v15;
    id v13 = v4;
    id v6 = v9;
    os_unfair_lock_lock(p_stateLock);
    v10((uint64_t)v6);
    os_unfair_lock_unlock(p_stateLock);

    BOOL v7 = *((unsigned char *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_updateAttachmentCompletedFromObserver:(unint64_t)a3 attached:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = sub_10000CEB0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v11 = a3;
    __int16 v12 = 2048;
    BOOL v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BDSAutomaticPinningListUpdater updateAttachmentCompleted %lu, attached %lu", buf, 0x16u);
  }

  os_unfair_lock_assert_not_owner(&self->_stateLock);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000414AC;
  v8[3] = &unk_100260F70;
  v8[4] = self;
  v8[5] = a3;
  BOOL v9 = v4;
  os_unfair_lock_lock(&self->_stateLock);
  sub_1000414AC((uint64_t)v8);
  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)_l_finishedFetchingCollectionsWithManager:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_assert_owner(&self->_stateLock);
  v5 = +[BCCloudCollectionsManager sharedManager];
  [v5 setEnableCloudSync:0];

  objc_initWeak(&location, self);
  if (v3)
  {
    id v6 = sub_10000CEB0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "At least one manager wanted to continue, so updating the pinning lists.", buf, 2u);
    }

    BOOL v7 = +[BDSNBPinningManager sharedManager];
    BOOL v8 = [(BDSAutomaticPinningListUpdater *)self jaliscoUpdateSuccessful];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000417E4;
    v11[3] = &unk_100260F98;
    objc_copyWeak(&v12, &location);
    BOOL v9 = [v7 updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful:v8 completion:v11];
    [(BDSAutomaticPinningListUpdater *)self setCurrentProgress:v9];

    objc_destroyWeak(&v12);
  }
  else
  {
    v10 = +[NSError bu_errorWithDomain:@"BDSErrorDomain" code:1003 description:@"Did not attach CloudKit" underlyingError:0];
    [(BDSAutomaticPinningListUpdater *)self _l_finishWithError:v10];
  }
  objc_destroyWeak(&location);
}

- (void)_l_finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(BDSAutomaticPinningListUpdater *)self currentProgress];
  unsigned __int8 v6 = [v5 isCancelled];

  BOOL v7 = sub_10000CEB0();
  BOOL v8 = v7;
  if (v6)
  {
    if (v4)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001E69B4((uint64_t)v4, v8);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating wantToReadAndReadingNow completed but we were already cancelled.", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001E6A2C((uint64_t)v4, v8);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating wantToReadAndReadingNow completed and we were not cancelled.", buf, 2u);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v9 = [(BDSAutomaticPinningListUpdater *)self managers];
    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        BOOL v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) listUpdater:self updateDidCompleteWithError:v4 wasCancelled:0];
          BOOL v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v11);
    }

    BOOL v8 = [(BDSAutomaticPinningListUpdater *)self managers];
    [v8 removeAllObjects];
  }

  [(BDSAutomaticPinningListUpdater *)self setCurrentProgress:0];
}

- (NSProgress)currentProgress
{
  return self->_currentProgress;
}

- (void)setCurrentProgress:(id)a3
{
}

- (NSHashTable)managers
{
  return self->_managers;
}

- (void)setManagers:(id)a3
{
}

- (id)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (unint64_t)currentObserverIdentifier
{
  return self->_currentObserverIdentifier;
}

- (void)setCurrentObserverIdentifier:(unint64_t)a3
{
  self->_currentObserverIdentifier = a3;
}

- (BOOL)jaliscoUpdateSuccessful
{
  return self->_jaliscoUpdateSuccessful;
}

- (void)setJaliscoUpdateSuccessful:(BOOL)a3
{
  self->_jaliscoUpdateSuccessful = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
  objc_storeStrong((id *)&self->_managers, 0);
  objc_storeStrong((id *)&self->_currentProgress, 0);
}

@end