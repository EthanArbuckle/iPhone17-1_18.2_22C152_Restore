@interface IDSIDQueryController
+ (id)sharedInstance;
- (BOOL)_flushQueryCacheForService:(id)a3;
- (BOOL)_hasCacheForService:(id)a3;
- (BOOL)_warmupQueryCacheForService:(id)a3;
- (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
- (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7 queue:(id)a8 completionBlock:(id)a9;
- (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 respectExpiry:(BOOL)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7 queue:(id)a8 completionBlock:(id)a9;
- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 respectExpiry:(BOOL)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlockWithError:(id)a7;
- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlockWithError:(id)a8;
- (BOOL)forceRefreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
- (BOOL)forceRefreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)idInfoForDestinations:(id)a3 service:(id)a4 infoTypes:(unint64_t)a5 options:(id)a6 listenerID:(id)a7 queue:(id)a8 completionBlock:(id)a9;
- (BOOL)idInfoForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 infoTypes:(unint64_t)a6 options:(id)a7 listenerID:(id)a8 queue:(id)a9 completionBlock:(id)a10;
- (BOOL)participantsForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
- (BOOL)participantsForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)refreshIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
- (BOOL)refreshIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 errorCompletionBlock:(id)a7;
- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 errorCompletionBlock:(id)a8;
- (BOOL)removeListenerID:(id)a3 forService:(id)a4;
- (BOOL)requestIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
- (BOOL)requestIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)requestIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
- (BOOL)requestIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)requiredIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
- (BOOL)requiredIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)requiredIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
- (BOOL)requiredIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (IDSIDQueryController)init;
- (id)_currentCachedRemoteDevicesForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5;
- (id)_currentCachedRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6;
- (id)_currentIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5;
- (id)_currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6;
- (id)_currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7;
- (id)_currentIDStatusForDestinations:(id)a3 service:(id)a4 respectExpiry:(BOOL)a5 listenerID:(id)a6;
- (id)_refreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5;
- (id)_refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6;
- (int64_t)_currentCachedIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5;
- (int64_t)_currentIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5;
- (int64_t)_currentIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6;
- (int64_t)_currentIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7;
- (int64_t)_currentIDStatusForDestination:(id)a3 service:(id)a4 respectExpiry:(BOOL)a5 listenerID:(id)a6;
- (int64_t)_refreshIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5;
- (int64_t)_refreshIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6;
- (void)_setCurrentIDStatus:(int64_t)a3 forDestination:(id)a4 service:(id)a5;
- (void)addDelegate:(id)a3 forService:(id)a4 listenerID:(id)a5 queue:(id)a6;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)addListenerID:(id)a3 forService:(id)a4;
- (void)dealloc;
- (void)flushQueryCache;
- (void)removeDelegate:(id)a3;
- (void)removeDelegate:(id)a3 forService:(id)a4 listenerID:(id)a5;
- (void)setFromID:(id)a3;
@end

@implementation IDSIDQueryController

- (IDSIDQueryController)init
{
  if (_IDSRunningInDaemon())
  {
    v3 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v3);
    }

    v4 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)IDSIDQueryController;
    v5 = [(IDSIDQueryController *)&v10 init];
    if (v5)
    {
      if (qword_1EB2BD738 != -1) {
        dispatch_once(&qword_1EB2BD738, &unk_1EE246E48);
      }
      objc_storeStrong((id *)&v5->_queueController, (id)qword_1EB2BD740);
      queueController = v5->_queueController;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = sub_191918D50;
      v8[3] = &unk_1E5729000;
      v9 = v5;
      [(IDSInternalQueueController *)queueController performBlock:v8 waitUntilDone:1];
    }
    self = v5;
    v4 = self;
  }

  return v4;
}

- (void)addDelegate:(id)a3 forService:(id)a4 listenerID:(id)a5 queue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queueController = self->_queueController;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_191918A58;
  v19[3] = &unk_1E57296D0;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [(IDSInternalQueueController *)queueController performBlock:v19 waitUntilDone:1];
}

+ (id)sharedInstance
{
  if (qword_1EB2BD868 != -1) {
    dispatch_once(&qword_1EB2BD868, &unk_1EE246908);
  }
  v2 = (void *)qword_1EB2BD828;

  return v2;
}

- (void)setFromID:(id)a3
{
  id v4 = a3;
  queueController = self->_queueController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191A135F4;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(IDSInternalQueueController *)queueController performBlock:v7 waitUntilDone:1];
}

- (void)dealloc
{
  [(IDSInternalQueueController *)self->_queueController performBlock:&unk_1EE246B68 waitUntilDone:1];
  queueController = self->_queueController;
  self->_queueController = 0;

  v4.receiver = self;
  v4.super_class = (Class)IDSIDQueryController;
  [(IDSIDQueryController *)&v4 dealloc];
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queueController = self->_queueController;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_191A13730;
  v11[3] = &unk_1E5728DA8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(IDSInternalQueueController *)queueController performBlock:v11 waitUntilDone:1];
}

- (void)removeDelegate:(id)a3
{
  queueController = self->_queueController;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191A137D0;
  v5[3] = &unk_1E5729BB0;
  v5[4] = self;
  v5[5] = a3;
  id v4 = a3;
  [(IDSInternalQueueController *)queueController performBlock:v5 waitUntilDone:1];
}

- (void)removeDelegate:(id)a3 forService:(id)a4 listenerID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queueController = self->_queueController;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_191A138B4;
  v14[3] = &unk_1E572D568;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = a3;
  id v11 = v9;
  id v12 = v8;
  id v13 = a3;
  [(IDSInternalQueueController *)queueController performBlock:v14 waitUntilDone:1];
}

- (void)addListenerID:(id)a3 forService:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Adding listener ID: %@   for service: %@", buf, 0x16u);
  }

  queueController = self->_queueController;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_191A13A24;
  v12[3] = &unk_1E5728DA8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(IDSInternalQueueController *)queueController performBlock:v12 waitUntilDone:1];
}

- (BOOL)removeListenerID:(id)a3 forService:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v8 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Removing listener ID: %@   for service: %@", buf, 0x16u);
  }

  queueController = self->_queueController;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_191A13BFC;
  v14[3] = &unk_1E5729D90;
  __int16 v17 = &v18;
  v14[4] = self;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  [(IDSInternalQueueController *)queueController performBlock:v14 waitUntilDone:1];
  BOOL v12 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return [(IDSIDQueryController *)self refreshIDStatusForDestinations:a3 service:a4 preferredFromID:0 listenerID:a5 queue:a6 completionBlock:a7];
}

- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    char v21 = IDSLoggableDescriptionForHandlesOnService();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    id v36 = v17;
    _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Client ID status to refresh ID status for destinations %@  on service: %@   from listenerID: %@", buf, 0x20u);
  }
  if ([v14 count] && objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    if ((unint64_t)[v14 count] >= 0x1E)
    {
      id v22 = +[IDSLogging IDQuery];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = [v14 count];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v23;
        _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "Client %@ is attempting to send more than a reasonable amount of URI's in a query {count: %lu}", buf, 0x16u);
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v36) = 0;
    queueController = self->_queueController;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_191A13F5C;
    v27[3] = &unk_1E572D590;
    v34 = buf;
    v27[4] = self;
    id v28 = v14;
    id v29 = v15;
    id v30 = v16;
    id v31 = v17;
    id v32 = v18;
    id v33 = v19;
    [(IDSInternalQueueController *)queueController performBlock:v27 waitUntilDone:1];
    BOOL v25 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)forceRefreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return MEMORY[0x1F4181798](self, sel_forceRefreshIDStatusForDestinations_service_preferredFromID_listenerID_queue_completionBlock_);
}

- (BOOL)forceRefreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    char v21 = IDSLoggableDescriptionForHandlesOnService();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    id v36 = v17;
    _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Client ID status to force refresh ID status for destinations %@  on service: %@   from listenerID: %@", buf, 0x20u);
  }
  if ([v14 count] && objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    if ((unint64_t)[v14 count] >= 0x1E)
    {
      id v22 = +[IDSLogging IDQuery];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = [v14 count];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v23;
        _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "Client %@ is attempting to send more than a reasonable amount of URI's in a query {count: %lu}", buf, 0x16u);
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v36) = 0;
    queueController = self->_queueController;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_191A143F4;
    v27[3] = &unk_1E572D590;
    v34 = buf;
    v27[4] = self;
    id v28 = v14;
    id v29 = v15;
    id v30 = v16;
    id v31 = v17;
    id v32 = v18;
    id v33 = v19;
    [(IDSInternalQueueController *)queueController performBlock:v27 waitUntilDone:1];
    BOOL v25 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 errorCompletionBlock:(id)a7
{
  return MEMORY[0x1F4181798](self, sel_refreshIDStatusForDestinations_service_preferredFromID_listenerID_queue_errorCompletionBlock_);
}

- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 errorCompletionBlock:(id)a8
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    char v21 = IDSLoggableDescriptionForHandlesOnService();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    id v36 = v17;
    _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Client ID status to refresh ID status for destinations %@  on service: %@   from listenerID: %@", buf, 0x20u);
  }
  if ([v14 count] && objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    if ((unint64_t)[v14 count] >= 0x1E)
    {
      id v22 = +[IDSLogging IDQuery];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = [v14 count];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v23;
        _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "Client %@ is attempting to send more than a reasonable amount of URI's in a query {count: %lu}", buf, 0x16u);
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v36) = 0;
    queueController = self->_queueController;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_191A1488C;
    v27[3] = &unk_1E572D590;
    v34 = buf;
    v27[4] = self;
    id v28 = v14;
    id v29 = v15;
    id v30 = v16;
    id v31 = v17;
    id v32 = v18;
    id v33 = v19;
    [(IDSInternalQueueController *)queueController performBlock:v27 waitUntilDone:1];
    BOOL v25 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)refreshIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return [(IDSIDQueryController *)self refreshIDStatusForDestination:a3 service:a4 preferredFromID:0 listenerID:a5 queue:a6 completionBlock:a7];
}

- (BOOL)refreshIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    char v21 = IDSLoggableDescriptionForHandleOnService();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    id v34 = v17;
    _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Client ID status to refresh ID status for destination %@  on service: %@   from listenerID: %@", buf, 0x20u);
  }
  if ([v14 length] && objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v34) = 0;
    queueController = self->_queueController;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_191A14B8C;
    v25[3] = &unk_1E572D590;
    id v32 = buf;
    v25[4] = self;
    id v26 = v14;
    id v27 = v15;
    id v28 = v16;
    id v29 = v17;
    id v30 = v18;
    id v31 = v19;
    [(IDSInternalQueueController *)queueController performBlock:v25 waitUntilDone:1];
    BOOL v23 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)requiredIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return [(IDSIDQueryController *)self requiredIDStatusForDestinations:a3 service:a4 preferredFromID:0 listenerID:a5 queue:a6 completionBlock:a7];
}

- (BOOL)requiredIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    char v21 = IDSLoggableDescriptionForHandlesOnService();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    id v36 = v17;
    _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Client ID status for required ID status for destinations %@  on service: %@   from listenerID: %@", buf, 0x20u);
  }
  if ([v14 count] && objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    if ((unint64_t)[v14 count] >= 0x1E)
    {
      id v22 = +[IDSLogging IDQuery];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = [v14 count];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v23;
        _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "Client %@ is attempting to send more than a reasonable amount of URI's in a query {count: %lu}", buf, 0x16u);
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v36) = 0;
    queueController = self->_queueController;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_191A14EF4;
    v27[3] = &unk_1E572D590;
    id v34 = buf;
    v27[4] = self;
    id v28 = v14;
    id v29 = v15;
    id v30 = v16;
    id v31 = v17;
    id v32 = v18;
    id v33 = v19;
    [(IDSInternalQueueController *)queueController performBlock:v27 waitUntilDone:1];
    BOOL v25 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)requiredIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return [(IDSIDQueryController *)self requiredIDStatusForDestination:a3 service:a4 preferredFromID:0 listenerID:a5 queue:a6 completionBlock:a7];
}

- (BOOL)requiredIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    char v21 = IDSLoggableDescriptionForHandleOnService();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    id v34 = v17;
    _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Client ID status for required ID status for destination %@  on service: %@   from listenerID: %@", buf, 0x20u);
  }
  if ([v14 length] && objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v34) = 0;
    queueController = self->_queueController;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_191A15310;
    v25[3] = &unk_1E572D590;
    id v32 = buf;
    v25[4] = self;
    id v26 = v14;
    id v27 = v15;
    id v28 = v16;
    id v29 = v17;
    id v30 = v18;
    id v31 = v19;
    [(IDSInternalQueueController *)queueController performBlock:v25 waitUntilDone:1];
    BOOL v23 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 respectExpiry:(BOOL)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  return [(IDSIDQueryController *)self currentIDStatusForDestinations:a3 service:a4 preferredFromID:0 respectExpiry:a5 listenerID:a6 queue:a7 completionBlock:a8];
}

- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7 queue:(id)a8 completionBlock:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if ([v15 count] && objc_msgSend(v16, "length") && objc_msgSend(v18, "length"))
  {
    uint64_t v33 = 0;
    id v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    queueController = self->_queueController;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_191A15574;
    v24[3] = &unk_1E572D5B8;
    id v31 = &v33;
    v24[4] = self;
    id v25 = v15;
    id v26 = v16;
    id v27 = v17;
    BOOL v32 = a6;
    id v28 = v18;
    id v29 = v19;
    id v30 = v20;
    [(IDSInternalQueueController *)queueController performBlock:v24 waitUntilDone:1];
    BOOL v22 = *((unsigned char *)v34 + 24) != 0;

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 respectExpiry:(BOOL)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  return [(IDSIDQueryController *)self currentIDStatusForDestination:a3 service:a4 preferredFromID:0 respectExpiry:a5 listenerID:a6 queue:a7 completionBlock:a8];
}

- (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7 queue:(id)a8 completionBlock:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if ([v15 length] && objc_msgSend(v16, "length") && objc_msgSend(v18, "length"))
  {
    uint64_t v33 = 0;
    id v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    queueController = self->_queueController;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_191A157E8;
    v24[3] = &unk_1E572D5B8;
    id v31 = &v33;
    v24[4] = self;
    id v25 = v15;
    id v26 = v16;
    id v27 = v17;
    BOOL v32 = a6;
    id v28 = v18;
    id v29 = v19;
    id v30 = v20;
    [(IDSInternalQueueController *)queueController performBlock:v24 waitUntilDone:1];
    BOOL v22 = *((unsigned char *)v34 + 24) != 0;

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return MEMORY[0x1F4181798](self, sel_currentIDStatusForDestinations_service_preferredFromID_listenerID_queue_completionBlock_);
}

- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  return [(IDSIDQueryController *)self currentIDStatusForDestinations:a3 service:a4 preferredFromID:a5 respectExpiry:1 listenerID:a6 queue:a7 completionBlock:a8];
}

- (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return MEMORY[0x1F4181798](self, sel_currentIDStatusForDestination_service_preferredFromID_listenerID_queue_completionBlock_);
}

- (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  return [(IDSIDQueryController *)self currentIDStatusForDestination:a3 service:a4 preferredFromID:a5 respectExpiry:1 listenerID:a6 queue:a7 completionBlock:a8];
}

- (BOOL)idInfoForDestinations:(id)a3 service:(id)a4 infoTypes:(unint64_t)a5 options:(id)a6 listenerID:(id)a7 queue:(id)a8 completionBlock:(id)a9
{
  return [(IDSIDQueryController *)self idInfoForDestinations:a3 service:a4 preferredFromID:0 infoTypes:a5 options:a6 listenerID:a7 queue:a8 completionBlock:a9];
}

- (BOOL)idInfoForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 infoTypes:(unint64_t)a6 options:(id)a7 listenerID:(id)a8 queue:(id)a9 completionBlock:(id)a10
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v27 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  BOOL v22 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v23 = IDSLoggableDescriptionForHandlesOnService();
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v23;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    id v39 = v19;
    __int16 v40 = 2048;
    unint64_t v41 = a6;
    _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "Client ID Info Request for destinations %@ on service: %@ from listenerID: %@ with infoTypes: %llu", buf, 0x2Au);
  }
  if ([v16 count] && objc_msgSend(v17, "length") && objc_msgSend(v19, "length"))
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v39) = 0;
    queueController = self->_queueController;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_191A15BD8;
    v28[3] = &unk_1E572D5E0;
    char v36 = buf;
    v28[4] = self;
    id v29 = v16;
    id v30 = v17;
    id v31 = v27;
    unint64_t v37 = a6;
    id v32 = v18;
    id v33 = v19;
    id v34 = v20;
    id v35 = v21;
    [(IDSInternalQueueController *)queueController performBlock:v28 waitUntilDone:1];
    BOOL v25 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)_hasCacheForService:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v11 = 0;
    BOOL v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    queueController = self->_queueController;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_191A15D38;
    v8[3] = &unk_1E5729190;
    id v10 = &v11;
    void v8[4] = self;
    id v9 = v4;
    [(IDSInternalQueueController *)queueController performBlock:v8 waitUntilDone:1];
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)_currentCachedIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  BOOL v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  queueController = self->_queueController;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_191A15EB8;
  v17[3] = &unk_1E572C050;
  id v21 = &v22;
  v17[4] = self;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v14 = v10;
  id v20 = v14;
  [(IDSInternalQueueController *)queueController performBlock:v17 waitUntilDone:1];
  int64_t v15 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (BOOL)_warmupQueryCacheForService:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "Client requesting to warmup the query cache for service: %@", (uint8_t *)&buf, 0xCu);
  }

  if ([v4 length])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    queueController = self->_queueController;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_191A16090;
    v9[3] = &unk_1E5729190;
    p_long long buf = &buf;
    v9[4] = self;
    id v10 = v4;
    [(IDSInternalQueueController *)queueController performBlock:v9 waitUntilDone:1];
    BOOL v7 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_flushQueryCacheForService:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "Client requesting to flush the query cache for service: %@", (uint8_t *)&buf, 0xCu);
  }

  if ([v4 length])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    queueController = self->_queueController;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_191A16264;
    v9[3] = &unk_1E5729190;
    p_long long buf = &buf;
    v9[4] = self;
    id v10 = v4;
    [(IDSInternalQueueController *)queueController performBlock:v9 waitUntilDone:1];
    BOOL v7 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_setCurrentIDStatus:(int64_t)a3 forDestination:(id)a4 service:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queueController = self->_queueController;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_191A16368;
  v13[3] = &unk_1E5728E20;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  [(IDSInternalQueueController *)queueController performBlock:v13 waitUntilDone:1];
}

- (void)flushQueryCache
{
  queueController = self->_queueController;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_191A163F4;
  v3[3] = &unk_1E5729000;
  v3[4] = self;
  [(IDSInternalQueueController *)queueController performBlock:v3 waitUntilDone:1];
}

- (int64_t)_refreshIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5
{
  return MEMORY[0x1F4181798](self, sel__refreshIDStatusForDestination_service_preferredFromID_listenerID_);
}

- (int64_t)_refreshIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = IDSLoggableDescriptionForHandleOnService();
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    id v39 = v13;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "** BLOCKING Client ID status to refresh ID status for destination %@  on service: %@   from listenerID: %@", buf, 0x20u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  id v39 = 0;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  queueController = self->_queueController;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  id v28 = sub_191A166B8;
  id v29 = &unk_1E572D630;
  id v30 = self;
  id v18 = v10;
  id v31 = v18;
  id v19 = v11;
  id v32 = v19;
  id v20 = v12;
  id v33 = v20;
  id v21 = v13;
  id v34 = v21;
  id v35 = buf;
  [(IDSInternalQueueController *)queueController performBlock:&v26 waitUntilDone:1];
  uint64_t v22 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    [v16 timeIntervalSinceNow];
    *(_DWORD *)char v36 = 134217984;
    double v37 = fabs(v23);
    _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "  => Done: %f", v36, 0xCu);
  }

  int64_t v24 = *(void *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);

  return v24;
}

- (id)_refreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5
{
  return (id)MEMORY[0x1F4181798](self, sel__refreshIDStatusForDestinations_service_preferredFromID_listenerID_);
}

- (id)_refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (uint64_t (*)(uint64_t, uint64_t))a6;
  id v14 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = IDSLoggableDescriptionForHandlesOnService();
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    id v39 = v13;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "** BLOCKING Client ID status to refresh ID status for destinations %@  on service: %@   from listenerID: %@", buf, 0x20u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v39 = sub_1919187C0;
  uint64_t v40 = sub_191918600;
  id v41 = 0;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  queueController = self->_queueController;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  id v28 = sub_191A16B24;
  id v29 = &unk_1E572D630;
  id v30 = self;
  id v18 = v10;
  id v31 = v18;
  id v19 = v11;
  id v32 = v19;
  id v20 = v12;
  id v33 = v20;
  id v21 = v13;
  id v34 = v21;
  id v35 = buf;
  [(IDSInternalQueueController *)queueController performBlock:&v26 waitUntilDone:1];
  uint64_t v22 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    [v16 timeIntervalSinceNow];
    *(_DWORD *)char v36 = 134217984;
    double v37 = fabs(v23);
    _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "  => Done: %f", v36, 0xCu);
  }

  id v24 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v24;
}

- (int64_t)_currentIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5
{
  return MEMORY[0x1F4181798](self, sel__currentIDStatusForDestination_service_preferredFromID_listenerID_);
}

- (int64_t)_currentIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6
{
  return MEMORY[0x1F4181798](self, sel__currentIDStatusForDestination_service_preferredFromID_respectExpiry_listenerID_);
}

- (int64_t)_currentIDStatusForDestination:(id)a3 service:(id)a4 respectExpiry:(BOOL)a5 listenerID:(id)a6
{
  return MEMORY[0x1F4181798](self, sel__currentIDStatusForDestination_service_preferredFromID_respectExpiry_listenerID_);
}

- (int64_t)_currentIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7
{
  BOOL v8 = a6;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = IDSLoggableDescriptionForHandleOnService();
    id v18 = @"NO";
    *(_DWORD *)long long buf = 138413058;
    *(void *)&uint8_t buf[4] = v17;
    if (v8) {
      id v18 = @"YES";
    }
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    id v39 = v18;
    __int16 v40 = 2112;
    id v41 = v15;
    _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "** BLOCKING Client ID status cache request for destination %@  on service: %@ respectExpiry: %@   from listenerID: %@", buf, 0x2Au);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  id v39 = 0;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  queueController = self->_queueController;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_191A16F2C;
  v29[3] = &unk_1E572D6A8;
  v29[4] = self;
  id v21 = v12;
  id v30 = v21;
  id v22 = v13;
  id v31 = v22;
  id v23 = v14;
  id v32 = v23;
  BOOL v35 = v8;
  id v24 = v15;
  id v33 = v24;
  id v34 = buf;
  [(IDSInternalQueueController *)queueController performBlock:v29 waitUntilDone:1];
  uint64_t v25 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    [v19 timeIntervalSinceNow];
    *(_DWORD *)char v36 = 134217984;
    double v37 = fabs(v26);
    _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "  => Done: %f", v36, 0xCu);
  }

  int64_t v27 = *(void *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);

  return v27;
}

- (id)_currentIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5
{
  return (id)MEMORY[0x1F4181798](self, sel__currentIDStatusForDestinations_service_preferredFromID_listenerID_);
}

- (id)_currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6
{
  return (id)MEMORY[0x1F4181798](self, sel__currentIDStatusForDestinations_service_preferredFromID_respectExpiry_listenerID_);
}

- (id)_currentIDStatusForDestinations:(id)a3 service:(id)a4 respectExpiry:(BOOL)a5 listenerID:(id)a6
{
  return (id)MEMORY[0x1F4181798](self, sel__currentIDStatusForDestinations_service_preferredFromID_respectExpiry_listenerID_);
}

- (id)_currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7
{
  BOOL v8 = a6;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = IDSLoggableDescriptionForHandlesOnService();
    id v18 = @"NO";
    *(_DWORD *)long long buf = 138413058;
    *(void *)&uint8_t buf[4] = v17;
    if (v8) {
      id v18 = @"YES";
    }
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    id v39 = (uint64_t (*)(uint64_t, uint64_t))v18;
    LOWORD(v40) = 2112;
    *(void *)((char *)&v40 + 2) = v15;
    _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "** BLOCKING Client ID status cache request for destinations %@  on service: %@ respectExpiry: %@   from listenerID: %@", buf, 0x2Au);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v39 = sub_1919187C0;
  *(void *)&long long v40 = sub_191918600;
  *((void *)&v40 + 1) = 0;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  queueController = self->_queueController;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_191A173B8;
  v29[3] = &unk_1E572D6A8;
  v29[4] = self;
  id v21 = v12;
  id v30 = v21;
  id v22 = v13;
  id v31 = v22;
  id v23 = v14;
  id v32 = v23;
  BOOL v35 = v8;
  id v24 = v15;
  id v33 = v24;
  id v34 = buf;
  [(IDSInternalQueueController *)queueController performBlock:v29 waitUntilDone:1];
  uint64_t v25 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    [v19 timeIntervalSinceNow];
    *(_DWORD *)char v36 = 134217984;
    double v37 = fabs(v26);
    _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "  => Done: %f", v36, 0xCu);
  }

  id v27 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v27;
}

- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return [(IDSIDQueryController *)self currentRemoteDevicesForDestinations:a3 service:a4 preferredFromID:0 listenerID:a5 queue:a6 completionBlock:a7];
}

- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = IDSLoggableDescriptionForHandlesOnService();
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    id v34 = v17;
    _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Client Remote Device Request for destinations %@  on service: %@   from listenerID: %@", buf, 0x20u);
  }
  if ([v14 count] && objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v34) = 0;
    queueController = self->_queueController;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_191A176F8;
    v25[3] = &unk_1E572D590;
    id v32 = buf;
    v25[4] = self;
    id v26 = v14;
    id v27 = v15;
    id v28 = v16;
    id v29 = v17;
    id v30 = v18;
    id v31 = v19;
    [(IDSInternalQueueController *)queueController performBlock:v25 waitUntilDone:1];
    BOOL v23 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlockWithError:(id)a7
{
  return [(IDSIDQueryController *)self currentRemoteDevicesForDestinations:a3 service:a4 preferredFromID:0 listenerID:a5 queue:a6 completionBlockWithError:a7];
}

- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlockWithError:(id)a8
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = IDSLoggableDescriptionForHandlesOnService();
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    id v34 = v17;
    _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Client Remote Device Request for destinations %@  on service: %@   from listenerID: %@", buf, 0x20u);
  }
  if ([v14 count] && objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v34) = 0;
    queueController = self->_queueController;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_191A179E8;
    v25[3] = &unk_1E572D590;
    id v32 = buf;
    v25[4] = self;
    id v26 = v14;
    id v27 = v15;
    id v28 = v16;
    id v29 = v17;
    id v30 = v18;
    id v31 = v19;
    [(IDSInternalQueueController *)queueController performBlock:v25 waitUntilDone:1];
    BOOL v23 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (id)_currentCachedRemoteDevicesForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5
{
  return (id)MEMORY[0x1F4181798](self, sel__currentCachedRemoteDevicesForDestinations_service_preferredFromID_listenerID_);
}

- (id)_currentCachedRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (uint64_t (*)(uint64_t, uint64_t))a6;
  id v14 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = IDSLoggableDescriptionForHandlesOnService();
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    id v26 = v13;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "** BLOCKING  Client Remote Device Request for destinations %@  on service: %@   from listenerID: %@", buf, 0x20u);
  }
  if ([v10 count] && objc_msgSend(v11, "length") && objc_msgSend(v13, "length"))
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v26 = sub_1919187C0;
    id v27 = sub_191918600;
    id v28 = 0;
    queueController = self->_queueController;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_191A17CC0;
    v19[3] = &unk_1E572D630;
    v19[4] = self;
    id v20 = v10;
    id v21 = v11;
    id v22 = v12;
    BOOL v23 = v13;
    id v24 = buf;
    [(IDSInternalQueueController *)queueController performBlock:v19 waitUntilDone:1];
    id v17 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (BOOL)participantsForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return MEMORY[0x1F4181798](self, sel_participantsForDestinations_service_preferredFromID_listenerID_queue_completionBlock_);
}

- (BOOL)participantsForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v14 = a8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_191A17E40;
  v17[3] = &unk_1E5729390;
  id v18 = v14;
  id v15 = v14;
  LOBYTE(a7) = [(IDSIDQueryController *)self currentRemoteDevicesForDestinations:a3 service:a4 preferredFromID:a5 listenerID:a6 queue:a7 completionBlock:v17];

  return (char)a7;
}

- (BOOL)requestIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return MEMORY[0x1F4181798](self, sel_requestIDStatusForDestinations_service_preferredFromID_listenerID_queue_completionBlock_);
}

- (BOOL)requestIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  id v18 = a7;
  id v19 = a5;
  id v20 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = IDSLoggableDescriptionForHandlesOnService();
    int v24 = 138412802;
    uint64_t v25 = v21;
    __int16 v26 = 2112;
    id v27 = v15;
    __int16 v28 = 2112;
    id v29 = v16;
    _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Client ID status request for destinations %@  on service: %@   from listenerID: %@", (uint8_t *)&v24, 0x20u);
  }
  BOOL v22 = [(IDSIDQueryController *)self refreshIDStatusForDestinations:v14 service:v15 preferredFromID:v19 listenerID:v16 queue:v18 completionBlock:v17];

  return v22;
}

- (BOOL)requestIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  return MEMORY[0x1F4181798](self, sel_requestIDStatusForDestination_service_preferredFromID_listenerID_queue_completionBlock_);
}

- (BOOL)requestIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  id v18 = a7;
  id v19 = a5;
  id v20 = +[IDSLogging IDQuery];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = IDSLoggableDescriptionForHandleOnService();
    int v24 = 138412802;
    uint64_t v25 = v21;
    __int16 v26 = 2112;
    id v27 = v15;
    __int16 v28 = 2112;
    id v29 = v16;
    _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Client ID status request for destination %@  on service: %@   from listenerID: %@", (uint8_t *)&v24, 0x20u);
  }
  BOOL v22 = [(IDSIDQueryController *)self refreshIDStatusForDestination:v14 service:v15 preferredFromID:v19 listenerID:v16 queue:v18 completionBlock:v17];

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueController, 0);

  objc_storeStrong((id *)&self->_internal, 0);
}

@end