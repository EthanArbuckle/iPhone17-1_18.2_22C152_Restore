@interface _GEODefaultsNotificationHelper
- (void)_notifyPeerOfChangedKeys:(id)a3 options:(unint64_t)a4;
- (void)geoXPCConnectionIsReadyToSend:(id)a3;
@end

@implementation _GEODefaultsNotificationHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourcesNeedingWatchSync, 0);
  objc_storeStrong((id *)&self->_unsentNotifications, 0);
  objc_storeStrong((id *)&self->_watchedKeys, 0);
  objc_storeStrong((id *)&self->_isolater, 0);

  objc_destroyWeak((id *)&self->_peer);
}

- (void)_notifyPeerOfChangedKeys:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peer);
  if (WeakRetained)
  {
    id v7 = v5;
    id v8 = WeakRetained;
    geo_isolate_sync();
  }
}

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
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2020000000;
      uint64_t v27 = 0;
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x3032000000;
      v21 = sub_1000326FC;
      v22 = sub_10003270C;
      id v23 = 0;
      v16[0] = 0;
      v16[1] = v16;
      v16[2] = 0x2020000000;
      char v17 = 0;
      id v8 = v6;
      v15 = v8;
      geo_isolate_sync();
      if ([(id)v19[5] count] && v25[3])
      {
        v9 = GEOGetUserDefaultsLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v10 = [(id)v19[5] allObjects];
          v11 = [v10 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138412546;
          id v29 = v8;
          __int16 v30 = 2114;
          v31 = v11;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Notifying peer %@ of changed keys: %{public}@", buf, 0x16u);
        }
        id v12 = [objc_alloc((Class)GEOConfigKeyChangeNotification) initWithTraits:0 auditToken:0 throttleToken:0];
        v13 = [(id)v19[5] allObjects];
        [v12 setKeyStrings:v13];

        [v12 setKeyOptions:v25[3]];
        v14 = [v8 connection];
        [v12 send:v14];
      }
      _Block_object_dispose(v16, 8);
      _Block_object_dispose(&v18, 8);

      _Block_object_dispose(&v24, 8);
    }
  }
}

@end