@interface ANAnnounceServiceListener
- (ANAnnounceServiceListener)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (void)_handleError:(int64_t)a3 request:(id)a4 requestSentCompletionHandler:(id)a5;
- (void)_handleError:(int64_t)a3 request:(id)a4 sentCompletionHandler:(id)a5;
- (void)_sendReplyRequest:(id)a3 completion:(id)a4;
- (void)_sendRequest:(id)a3 completion:(id)a4;
- (void)_translateSentHandlerResponseAnnouncement:(id)a3 request:(id)a4 error:(id)a5 toRequestSentHandler:(id)a6;
- (void)announcementForID:(id)a3 endpointID:(id)a4 reply:(id)a5;
- (void)cleanForExit;
- (void)contextFromAnnouncement:(id)a3 reply:(id)a4;
- (void)getReceivedAnnouncementsForEndpointID:(id)a3 completionHandler:(id)a4;
- (void)getScanningDeviceCandidates:(id)a3;
- (void)getUnplayedAnnouncementsForEndpointID:(id)a3 completionHandler:(id)a4;
- (void)homeNamesForContext:(id)a3 reply:(id)a4;
- (void)isAnnounceEnabledForAnyAccessoryInHome:(id)a3 reply:(id)a4;
- (void)isAnnounceEnabledForAnyAccessoryOrUserInHome:(id)a3 reply:(id)a4;
- (void)isEndpointWithUUID:(id)a3 inRoomWithName:(id)a4 reply:(id)a5;
- (void)isLocalDeviceInRoom:(id)a3 reply:(id)a4;
- (void)lastPlayedAnnouncementInfo:(id)a3;
- (void)localParticipant:(id)a3;
- (void)mockAnnouncement:(id)a3 forHomeWithName:(id)a4 playbackDeadline:(id)a5 completion:(id)a6;
- (void)prewarm:(id)a3;
- (void)receivedAnnouncementIdentifiersForEndpointID:(id)a3 reply:(id)a4;
- (void)sendRequest:(id)a3 completion:(id)a4;
- (void)sendRequestLegacy:(id)a3 completion:(id)a4;
@end

@implementation ANAnnounceServiceListener

- (ANAnnounceServiceListener)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)ANAnnounceServiceListener;
  v2 = [(ANAnnounceServiceListener *)&v8 init];
  if (v2)
  {
    [MEMORY[0x1E4F4A898] isAnnounceEnabled];
    id v3 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v4 = [v3 initWithMachServiceName:*MEMORY[0x1E4F4A7A8]];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    v6 = ANLogHandleAnnounceServiceListener();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "%@Announce Service Listener Up!", buf, 0xCu);
    }
  }
  return v2;
}

- (void)cleanForExit
{
  id v2 = [(ANAnnounceServiceListener *)self listener];
  [v2 invalidate];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = ANLogHandleAnnounceServiceListener();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
    v10 = [v7 serviceName];
    *(_DWORD *)buf = 138412802;
    v32 = &stru_1F34A0E10;
    __int16 v33 = 2112;
    id v34 = v9;
    __int16 v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@New Connection Request From (PID = %@) For Service: (%@)", buf, 0x20u);
  }
  if (([MEMORY[0x1E4F4A898] isAnnounceEnabled] & 1) == 0)
  {
    uint64_t v11 = ANLogHandleAnnounceServiceListener();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = &stru_1F34A0E10;
      v21 = "%@Rejecting connection. Announce not enabled.";
      v22 = v11;
      uint32_t v23 = 12;
LABEL_12:
      _os_log_impl(&dword_1DA5ED000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    }
LABEL_13:
    BOOL v20 = 0;
    goto LABEL_14;
  }
  if (([v7 hasAnnounceEntitlement] & 1) == 0)
  {
    uint64_t v11 = ANLogHandleAnnounceServiceListener();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)*MEMORY[0x1E4F4A968];
      *(_DWORD *)buf = 138412546;
      v32 = &stru_1F34A0E10;
      __int16 v33 = 2112;
      id v34 = v24;
      v21 = "%@Missing Announce Entitlement: %@";
      v22 = v11;
      uint32_t v23 = 22;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29280], "an_announceServiceInterface");
  [v11 setClass:objc_opt_class() forSelector:sel_localParticipant_ argumentIndex:0 ofReply:1];
  [v11 setClass:objc_opt_class() forSelector:sel_homeNamesForContext_reply_ argumentIndex:0 ofReply:0];
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  [v11 setClasses:v14 forSelector:sel_homeNamesForContext_reply_ argumentIndex:0 ofReply:1];
  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  [v11 setClasses:v17 forSelector:sel_getReceivedAnnouncementsForEndpointID_completionHandler_ argumentIndex:0 ofReply:1];
  [v11 setClasses:v17 forSelector:sel_getUnplayedAnnouncementsForEndpointID_completionHandler_ argumentIndex:0 ofReply:1];
  v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v11 setClasses:v18 forSelector:sel_announcementForID_endpointID_reply_ argumentIndex:0 ofReply:1];
  [v11 setClasses:v18 forSelector:sel_mockAnnouncement_forHomeWithName_playbackDeadline_completion_ argumentIndex:0 ofReply:1];
  [v11 setClasses:v18 forSelector:sel_contextFromAnnouncement_reply_ argumentIndex:0 ofReply:0];
  [v11 setClass:objc_opt_class() forSelector:sel_contextFromAnnouncement_reply_ argumentIndex:0 ofReply:1];
  [v11 setClass:objc_opt_class() forSelector:sel_sendRequest_completion_ argumentIndex:0 ofReply:0];
  [v11 setClass:objc_opt_class() forSelector:sel_sendRequest_completion_ argumentIndex:0 ofReply:1];
  [v11 setClass:objc_opt_class() forSelector:sel_sendRequestLegacy_completion_ argumentIndex:0 ofReply:0];
  [v11 setClass:objc_opt_class() forSelector:sel_sendRequestLegacy_completion_ argumentIndex:0 ofReply:1];
  [v7 setExportedInterface:v11];
  [v7 setExportedObject:self];
  objc_initWeak(&location, v7);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __64__ANAnnounceServiceListener_listener_shouldAcceptNewConnection___block_invoke;
  v28[3] = &unk_1E6BCDE80;
  objc_copyWeak(&v29, &location);
  [v7 setInterruptionHandler:v28];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__ANAnnounceServiceListener_listener_shouldAcceptNewConnection___block_invoke_32;
  v26[3] = &unk_1E6BCDE80;
  objc_copyWeak(&v27, &location);
  [v7 setInvalidationHandler:v26];
  [v7 resume];
  v19 = ANLogHandleAnnounceServiceListener();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = &stru_1F34A0E10;
    __int16 v33 = 2112;
    id v34 = v7;
    _os_log_impl(&dword_1DA5ED000, v19, OS_LOG_TYPE_DEFAULT, "%@Connection Accepted: (%@)", buf, 0x16u);
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  BOOL v20 = 1;
LABEL_14:

  return v20;
}

void __64__ANAnnounceServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = ANLogHandleAnnounceServiceListener();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138412546;
    v5 = &stru_1F34A0E10;
    __int16 v6 = 2112;
    id v7 = WeakRetained;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection Interrupted: (%@)", (uint8_t *)&v4, 0x16u);
  }
}

void __64__ANAnnounceServiceListener_listener_shouldAcceptNewConnection___block_invoke_32(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = ANLogHandleAnnounceServiceListener();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138412546;
    v5 = &stru_1F34A0E10;
    __int16 v6 = 2112;
    id v7 = WeakRetained;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection Invalidated: (%@)", (uint8_t *)&v4, 0x16u);
  }
}

- (void)localParticipant:(id)a3
{
  id v4 = a3;
  id v6 = +[ANAnnouncementCoordinator sharedCoordinator];
  v5 = [v6 localParticipant];
  (*((void (**)(id, void *))a3 + 2))(v4, v5);
}

- (void)sendRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 destination];
  unint64_t v9 = [v8 type];

  if (v9 < 2)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__ANAnnounceServiceListener_sendRequest_completion___block_invoke;
    v14[3] = &unk_1E6BCDEA8;
    v14[4] = self;
    id v15 = v6;
    id v16 = v7;
    [(ANAnnounceServiceListener *)self _sendRequest:v15 completion:v14];

    v10 = v15;
LABEL_6:

    goto LABEL_7;
  }
  if (v9 == 2)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__ANAnnounceServiceListener_sendRequest_completion___block_invoke_2;
    v11[3] = &unk_1E6BCDEA8;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    [(ANAnnounceServiceListener *)self _sendReplyRequest:v12 completion:v11];

    v10 = v12;
    goto LABEL_6;
  }
  [(ANAnnounceServiceListener *)self _handleError:1045 request:v6 requestSentCompletionHandler:v7];
LABEL_7:
}

uint64_t __52__ANAnnounceServiceListener_sendRequest_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _translateSentHandlerResponseAnnouncement:a2 request:*(void *)(a1 + 40) error:a3 toRequestSentHandler:*(void *)(a1 + 48)];
}

uint64_t __52__ANAnnounceServiceListener_sendRequest_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _translateSentHandlerResponseAnnouncement:a2 request:*(void *)(a1 + 40) error:a3 toRequestSentHandler:*(void *)(a1 + 48)];
}

- (void)sendRequestLegacy:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v9 destination];
  unint64_t v8 = [v7 type];

  if (v8 >= 2)
  {
    if (v8 == 2) {
      [(ANAnnounceServiceListener *)self _sendReplyRequest:v9 completion:v6];
    }
    else {
      [(ANAnnounceServiceListener *)self _handleError:1045 request:v9 sentCompletionHandler:v6];
    }
  }
  else
  {
    [(ANAnnounceServiceListener *)self _sendRequest:v9 completion:v6];
  }
}

- (void)mockAnnouncement:(id)a3 forHomeWithName:(id)a4 playbackDeadline:(id)a5 completion:(id)a6
{
  id v20 = a3;
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = +[ANHomeManager shared];
  id v13 = [v12 homeWithName:v11];

  if (v13)
  {
    v14 = [MEMORY[0x1E4F4A8B0] contentWithAudioFileURL:v20];
    id v15 = (void *)MEMORY[0x1E4F4A8C8];
    id v16 = [v13 uniqueIdentifier];
    uint64_t v17 = [v15 destinationWithHomeIdentifier:v16];

    v18 = [MEMORY[0x1E4F4A8D0] requestWithContent:v14 destination:v17];
    [v18 setClientID:@"Mock"];
    v19 = +[ANAnnouncementCoordinator sharedCoordinator];
    [v19 mockAnnouncement:v18 playbackDeadline:v9 sentHandler:v10];

    id v10 = (id)v17;
  }
  else
  {
    v14 = objc_msgSend(MEMORY[0x1E4F28C58], "an_errorWithCode:component:", 1002, *MEMORY[0x1E4F4A740]);
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

- (void)receivedAnnouncementIdentifiersForEndpointID:(id)a3 reply:(id)a4
{
  v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  id v7 = +[ANAnnouncementCoordinator sharedCoordinator];
  id v9 = [v7 allAnnouncementsSortedByReceiptForEndpointID:v6];

  unint64_t v8 = [v9 identifiers];
  v5[2](v5, v8);
}

- (void)announcementForID:(id)a3 endpointID:(id)a4 reply:(id)a5
{
  id v7 = (void (**)(id, id))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[ANAnnouncementCoordinator sharedCoordinator];
  id v11 = [v10 announcementForID:v9 endpointID:v8];

  v7[2](v7, v11);
}

- (void)getReceivedAnnouncementsForEndpointID:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  id v7 = +[ANAnnouncementCoordinator sharedCoordinator];
  [v7 resetAllTimersForEndpointID:v6];

  id v8 = +[ANAnnouncementCoordinator sharedCoordinator];
  id v10 = [v8 allAnnouncementsSortedByReceiptForEndpointID:v6];

  id v9 = [MEMORY[0x1E4F4A8A8] contextsFrom:v10];
  v5[2](v5, v9);
}

- (void)getUnplayedAnnouncementsForEndpointID:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = +[ANAnnouncementCoordinator sharedCoordinator];
  [v7 resetAllTimersForEndpointID:v5];

  id v8 = objc_opt_new();
  id v9 = +[ANAnnouncementCoordinator sharedCoordinator];
  id v10 = [v9 allAnnouncementsSortedByReceiptForEndpointID:v5];
  id v11 = [v10 unplayedAnnouncements];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)MEMORY[0x1E4F4A8B8];
        v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v16), "remoteSessionDictionary", (void)v20);
        v19 = [v17 contextFromDictionary:v18];
        [v8 addObject:v19];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  v6[2](v6, v8);
}

- (void)lastPlayedAnnouncementInfo:(id)a3
{
}

- (void)getScanningDeviceCandidates:(id)a3
{
  id v4 = a3;
  id v6 = +[ANAnnouncementCoordinator sharedCoordinator];
  id v5 = [v6 scanningDeviceCandidates];
  (*((void (**)(id, void *))a3 + 2))(v4, v5);
}

- (void)contextFromAnnouncement:(id)a3 reply:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F4A8B8];
  id v7 = a4;
  id v9 = [a3 remoteSessionDictionary];
  id v8 = [v6 contextFromDictionary:v9];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)homeNamesForContext:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = +[ANHomeManager shared];
  id v8 = [v9 homeNamesForContext:v7];

  (*((void (**)(id, void *))a4 + 2))(v6, v8);
}

- (void)isLocalDeviceInRoom:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = +[ANHomeManager shared];
  uint64_t v8 = [v9 isLocalDeviceInRoom:v7];

  (*((void (**)(id, uint64_t))a4 + 2))(v6, v8);
}

- (void)isAnnounceEnabledForAnyAccessoryInHome:(id)a3 reply:(id)a4
{
  id v9 = (void (**)(id, uint64_t))a4;
  id v5 = a3;
  id v6 = +[ANHomeManager shared];
  id v7 = [v6 homeWithName:v5];

  if (v7) {
    uint64_t v8 = [v7 isAnnounceEnabledForAnyAccessory];
  }
  else {
    uint64_t v8 = 0;
  }
  v9[2](v9, v8);
}

- (void)isAnnounceEnabledForAnyAccessoryOrUserInHome:(id)a3 reply:(id)a4
{
  id v9 = (void (**)(id, uint64_t))a4;
  id v5 = a3;
  id v6 = +[ANHomeManager shared];
  id v7 = [v6 homeWithName:v5];

  if (v7) {
    uint64_t v8 = [v7 isAnnounceEnabledForAnyAccessoryOrUser];
  }
  else {
    uint64_t v8 = 0;
  }
  v9[2](v9, v8);
}

- (void)isEndpointWithUUID:(id)a3 inRoomWithName:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = +[ANHomeManager shared];
  uint64_t v11 = [v12 isEndpointWithUUID:v10 inRoomWithName:v9];

  (*((void (**)(id, uint64_t))a5 + 2))(v8, v11);
}

- (void)prewarm:(id)a3
{
  id v3 = a3;
  id v4 = +[ANRapportConnection sharedConnection];
  [v4 activateLinkWithOptions:2 completion:v3];
}

- (void)_sendRequest:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F29268];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 currentConnection];
  id v9 = [v8 clientID];
  [v7 setClientID:v9];

  id v10 = +[ANAnnouncementCoordinator sharedCoordinator];
  [v10 sendRequest:v7 sentHandler:v6];
}

- (void)_sendReplyRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  uint64_t v25 = __Block_byref_object_dispose_;
  id v8 = [v6 destination];
  id v26 = [v8 announcementIdentifier];

  if (v22[5]) {
    goto LABEL_3;
  }
  id v9 = [v6 content];
  id v10 = [v9 endpointIdentifier];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58__ANAnnounceServiceListener__sendReplyRequest_completion___block_invoke;
  v20[3] = &unk_1E6BCDED0;
  v20[4] = &v21;
  [(ANAnnounceServiceListener *)self receivedAnnouncementIdentifiersForEndpointID:v10 reply:v20];

  if (v22[5])
  {
LABEL_3:
    uint64_t v11 = +[ANAnnouncementCoordinator sharedCoordinator];
    uint64_t v12 = v22[5];
    uint64_t v13 = [v6 content];
    uint64_t v14 = [v13 endpointIdentifier];
    uint64_t v15 = [v11 announcementForID:v12 endpointID:v14];

    if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F29268] currentConnection];
      uint64_t v17 = [v16 clientID];
      [v6 setClientID:v17];

      v18 = [v6 destination];
      [v18 setAnnouncement:v15];

      v19 = +[ANAnnouncementCoordinator sharedCoordinator];
      [v19 sendRequest:v6 sentHandler:v7];
    }
    else
    {
      [(ANAnnounceServiceListener *)self _handleError:1008 request:v6 sentCompletionHandler:v7];
    }
  }
  else
  {
    [(ANAnnounceServiceListener *)self _handleError:1008 request:v6 sentCompletionHandler:v7];
  }
  _Block_object_dispose(&v21, 8);
}

uint64_t __58__ANAnnounceServiceListener__sendReplyRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 lastObject];
  return MEMORY[0x1F41817F8]();
}

- (void)_handleError:(int64_t)a3 request:(id)a4 sentCompletionHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F4A740];
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = objc_msgSend(v8, "an_errorWithCode:component:", a3, v9);
  (*((void (**)(id, void, void *))a5 + 2))(v10, 0, v12);

  id v16 = +[ANAnalytics shared];
  uint64_t v13 = [v11 content];

  uint64_t v14 = [v13 endpointIdentifier];
  uint64_t v15 = +[ANAnalyticsContext contextWithEndpointID:v14];
  [v16 error:a3 context:v15];
}

- (void)_handleError:(int64_t)a3 request:(id)a4 requestSentCompletionHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F4A740];
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = objc_msgSend(v8, "an_errorWithCode:component:", a3, v9);
  (*((void (**)(id, void, void *))a5 + 2))(v10, 0, v12);

  id v16 = +[ANAnalytics shared];
  uint64_t v13 = [v11 content];

  uint64_t v14 = [v13 endpointIdentifier];
  uint64_t v15 = +[ANAnalyticsContext contextWithEndpointID:v14];
  [v16 error:a3 context:v15];
}

- (void)_translateSentHandlerResponseAnnouncement:(id)a3 request:(id)a4 error:(id)a5 toRequestSentHandler:(id)a6
{
  id v27 = a5;
  uint64_t v9 = (void (**)(id, void *, id))a6;
  if (a3)
  {
    id v10 = (void *)MEMORY[0x1E4F4A8B8];
    id v11 = a4;
    id v12 = a3;
    uint64_t v13 = [v12 remoteSessionDictionary];
    uint64_t v14 = [v10 contextFromDictionary:v13];

    uint64_t v15 = (void *)MEMORY[0x1E4F4A8C8];
    id v16 = [v14 homeName];
    uint64_t v17 = [v14 zones];
    v18 = [v17 allValues];
    v19 = [v14 rooms];
    long long v20 = [v19 allValues];
    uint64_t v21 = [v15 destinationWithHomeName:v16 zoneNames:v18 roomNames:v20];

    long long v22 = [v11 destination];

    uint64_t v23 = [v22 announcementIdentifier];
    [v21 setAnnouncementIdentifier:v23];

    v24 = (void *)MEMORY[0x1E4F4A8D8];
    uint64_t v25 = [v12 identifier];

    id v26 = [v24 resultWithAnnouncementID:v25 destination:v21];
  }
  else
  {
    id v26 = 0;
  }
  v9[2](v9, v26, v27);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void).cxx_destruct
{
}

@end