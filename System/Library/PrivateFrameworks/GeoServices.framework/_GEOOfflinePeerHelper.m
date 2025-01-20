@interface _GEOOfflinePeerHelper
- (id)description;
- (void)geoXPCConnectionIsReadyToSend:(id)a3;
@end

@implementation _GEOOfflinePeerHelper

- (void)geoXPCConnectionIsReadyToSend:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peer);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained connection];

    if (v7 == v4)
    {
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x2020000000;
      char v33 = 0;
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2020000000;
      uint64_t v29 = 4;
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      geo_isolate_sync_data();
      switch(v27[3])
      {
        case 0:
          id v8 = objc_alloc_init((Class)GEOOfflineServiceSubscriptionStateChanged);
          objc_msgSend(v8, "setIsSubscribed:", *((unsigned __int8 *)v31 + 24), _NSConcreteStackBlock, 3221225472, sub_100022A14, &unk_100071E68, self, &v30, &v26, &v22);
          if (*((unsigned char *)v31 + 24))
          {
            v9 = +[GEOOfflineStateManager shared];
            objc_msgSend(v8, "setCurrentState:", objc_msgSend(v9, "currentSuggestedStateForCohortId:", self->_cohortId));
          }
          else
          {
            [v8 setCurrentState:0];
          }
          v11 = GEOGetOfflineServiceLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            int v17 = *((unsigned __int8 *)v31 + 24);
            unsigned int v18 = [v8 currentState];
            v19 = "YES";
            *(_DWORD *)buf = 136446722;
            if (!v17) {
              v19 = "NO";
            }
            *(void *)v35 = v19;
            *(_WORD *)&v35[8] = 1026;
            *(_DWORD *)&v35[10] = v18;
            *(_WORD *)&v35[14] = 2114;
            *(void *)&v35[16] = self;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Notifying peer of subscription state change to: %{public}s - state: %{public}d - %{public}@", buf, 0x1Cu);
          }
          goto LABEL_17;
        case 1:
          id v8 = objc_alloc_init((Class)GEOOfflineServiceSuggestedStateChanged);
          v10 = +[GEOOfflineStateManager shared];
          objc_msgSend(v8, "setCurrentState:", objc_msgSend(v10, "currentSuggestedStateForCohortId:", self->_cohortId));

          v11 = GEOGetOfflineServiceLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v12 = [v8 currentState];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v35 = v12;
            *(_WORD *)&v35[4] = 2114;
            *(void *)&v35[6] = self;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Notifying peer of suggestion change to %d - %{public}@", buf, 0x12u);
          }
          goto LABEL_17;
        case 2:
          id v8 = objc_alloc_init((Class)GEOOfflineServiceOfflineStateChanged);
          v13 = +[GEOOfflineStateManager shared];
          objc_msgSend(v8, "setCurrentState:", objc_msgSend(v13, "currentStateForCohortId:", self->_cohortId));

          v14 = +[GEOOfflineStateManager shared];
          objc_msgSend(v8, "setSavedState:", objc_msgSend(v14, "savedStateForCohortId:", self->_cohortId));

          v11 = GEOGetOfflineServiceLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            [v8 currentState];
            GEOOfflineStateAsString();
            id v15 = (id)objc_claimAutoreleasedReturnValue();
            [v8 savedState];
            v16 = GEOOfflineStateAsString();
            *(_DWORD *)buf = 138543874;
            *(void *)v35 = v15;
            *(_WORD *)&v35[8] = 2114;
            *(void *)&v35[10] = v16;
            *(_WORD *)&v35[18] = 2114;
            *(void *)&v35[20] = self;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Notifying peer of state change to current: %{public}@, saved: %{public}@ - %{public}@", buf, 0x20u);
          }
LABEL_17:

          v20 = [v6 connection];
          [v8 send:v20];

          goto LABEL_18;
        case 3:
        case 4:
          goto LABEL_20;
        default:
LABEL_18:
          if (*((unsigned char *)v23 + 24))
          {
            v21 = [v6 connection];
            [v21 initiateBarrierIfNecessary:0 delegate:self];
          }
LABEL_20:
          _Block_object_dispose(&v22, 8);
          _Block_object_dispose(&v26, 8);
          _Block_object_dispose(&v30, 8);
          break;
      }
    }
  }
}

- (id)description
{
  p_peer = &self->_peer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peer);
  v5 = [WeakRetained peerID];
  id v6 = objc_loadWeakRetained((id *)p_peer);
  id v7 = [v6 bundleIdentifier];
  id v8 = +[NSString stringWithFormat:@"<Helper %p: peerId: %@ - %@>", self, v5, v7];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cohortId, 0);
  objc_destroyWeak((id *)&self->_peer);

  objc_storeStrong((id *)&self->_isolater, 0);
}

@end