@interface CNShareLocationController
+ (BOOL)findMyFunctionalityAvailable;
+ (id)fmlHandleFromContactProperty:(id)a3;
+ (id)fmlHandlesFromContact:(id)a3;
- (CNCancelable)bestPropertyCancelable;
- (CNContact)contact;
- (CNFuture)bestPropertyFuture;
- (CNSchedulerProvider)schedulerProvider;
- (CNShareLocationController)initWithIDSAvailabilityProvider:(id)a3;
- (CNShareLocationController)initWithIDSAvailabilityProvider:(id)a3 fmlSession:(id)a4 schedulerProvider:(id)a5;
- (CNShareLocationProtocol)shareLocationDelegate;
- (CNUIIDSAvailabilityProvider)idsAvailabilityProvider;
- (NSSet)handles;
- (OS_dispatch_queue)serialQueue;
- (_TtC10ContactsUI19FindMyLocateSession)findMyLocateSession;
- (id)endOfDayDate;
- (void)actionsMenuProviderWithCompletion:(id)a3;
- (void)canShareWithCompletion:(id)a3;
- (void)friendshipStateWithCompletion:(id)a3;
- (void)initiateIDSRequest;
- (void)isSharingWithCompletion:(id)a3;
- (void)notifySharingStatusDidChange;
- (void)setBestPropertyCancelable:(id)a3;
- (void)setBestPropertyFuture:(id)a3;
- (void)setContact:(id)a3;
- (void)setFindMyLocateSession:(id)a3;
- (void)setHandles:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setShareLocationDelegate:(id)a3;
- (void)shareLocationWithExpiration:(int64_t)a3;
- (void)startUpdatingFriends;
- (void)stopSharingLocation;
- (void)stopUpdatingFriends;
@end

@implementation CNShareLocationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_bestPropertyFuture, 0);
  objc_storeStrong((id *)&self->_bestPropertyCancelable, 0);
  objc_storeStrong((id *)&self->_idsAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_findMyLocateSession, 0);
  objc_destroyWeak((id *)&self->_shareLocationDelegate);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void)setBestPropertyFuture:(id)a3
{
}

- (CNFuture)bestPropertyFuture
{
  return self->_bestPropertyFuture;
}

- (void)setBestPropertyCancelable:(id)a3
{
}

- (CNCancelable)bestPropertyCancelable
{
  return self->_bestPropertyCancelable;
}

- (CNUIIDSAvailabilityProvider)idsAvailabilityProvider
{
  return self->_idsAvailabilityProvider;
}

- (void)setHandles:(id)a3
{
}

- (NSSet)handles
{
  return self->_handles;
}

- (void)setFindMyLocateSession:(id)a3
{
}

- (_TtC10ContactsUI19FindMyLocateSession)findMyLocateSession
{
  return self->_findMyLocateSession;
}

- (void)setShareLocationDelegate:(id)a3
{
}

- (CNShareLocationProtocol)shareLocationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shareLocationDelegate);

  return (CNShareLocationProtocol *)WeakRetained;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)notifySharingStatusDidChange
{
  v3 = [(CNShareLocationController *)self shareLocationDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CNShareLocationController *)self shareLocationDelegate];
    [v5 sharingStatusDidChange];
  }
}

- (void)initiateIDSRequest
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v3 = [(CNShareLocationController *)self bestPropertyCancelable];
  [v3 cancel];

  v51 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  char v4 = [(CNShareLocationController *)self contact];
  id v5 = [v4 phoneNumbers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v61;
    uint64_t v9 = *MEMORY[0x1E4F1AEE0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v61 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E4F1B970];
        v13 = [(CNShareLocationController *)self contact];
        v14 = [v11 identifier];
        v15 = [v12 contactPropertyWithContact:v13 propertyKey:v9 identifier:v14];

        [v51 addObject:v15];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v60 objects:v66 count:16];
    }
    while (v7);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v16 = [(CNShareLocationController *)self contact];
  v17 = [v16 emailAddresses];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v57;
    uint64_t v21 = *MEMORY[0x1E4F1ADC8];
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v57 != v20) {
          objc_enumerationMutation(v17);
        }
        v23 = *(void **)(*((void *)&v56 + 1) + 8 * j);
        v24 = (void *)MEMORY[0x1E4F1B970];
        v25 = [(CNShareLocationController *)self contact];
        v26 = [v23 identifier];
        v27 = [v24 contactPropertyWithContact:v25 propertyKey:v21 identifier:v26];

        [v51 addObject:v27];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v56 objects:v65 count:16];
    }
    while (v19);
  }

  v28 = [MEMORY[0x1E4F5A638] bestPropertyComparator];
  [v51 sortUsingComparator:v28];

  v29 = [v51 firstObject];
  if (v29)
  {
    v30 = [(CNShareLocationController *)self schedulerProvider];
    id v31 = objc_alloc(MEMORY[0x1E4F5A6A0]);
    v32 = [(CNShareLocationController *)self idsAvailabilityProvider];
    v33 = (void *)[v31 initWithIDSAvailabilityProvider:v32];

    v50 = [MEMORY[0x1E4F5A480] observableWithResult:v29];
    v34 = [(CNShareLocationController *)self contact];
    v35 = [v33 resolveBestFaceTimeIDSPropertyForContact:v34 schedulerProvider:v30];
    v49 = [v35 onErrorHandler:&__block_literal_global_79];

    v36 = [(CNShareLocationController *)self contact];
    v37 = [v33 resolveBestIMessageIDSPropertyForContact:v36 schedulerProvider:v30];
    v38 = [v37 onErrorHandler:&__block_literal_global_79];

    v39 = (void *)MEMORY[0x1E4F5A480];
    v64[0] = v49;
    v64[1] = v38;
    v64[2] = v50;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:3];
    v41 = [v39 concatenate:v40];

    v42 = [v41 take:1];
    id v43 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
    v44 = [v43 future];
    [(CNShareLocationController *)self setBestPropertyFuture:v44];

    v45 = [v30 backgroundScheduler];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __47__CNShareLocationController_initiateIDSRequest__block_invoke_82;
    v52[3] = &unk_1E5499C58;
    id v53 = v42;
    id v54 = v43;
    id v46 = v43;
    id v47 = v42;
    v48 = [v45 performCancelableBlock:v52];
    [(CNShareLocationController *)self setBestPropertyCancelable:v48];
  }
  else
  {
    v30 = CNUILogContactCard();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v30, OS_LOG_TYPE_ERROR, "CNShareLocationController: found no handles to check for IDS availability", buf, 2u);
    }
  }
}

void __47__CNShareLocationController_initiateIDSRequest__block_invoke_82(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F5A488];
  v3 = *(void **)(a1 + 32);
  char v4 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v4 completionHandlerAdapter];
  uint64_t v7 = [v2 observerWithCompletionHandler:v6];
  id v8 = [v3 subscribe:v7];

  [v5 addCancelable:v8];
}

id __47__CNShareLocationController_initiateIDSRequest__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = CNUILogContactCard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v2;
    _os_log_error_impl(&dword_18B625000, v3, OS_LOG_TYPE_ERROR, "CNShareLocationController, Contact IDS Property Resolver failed to find best property: %@", (uint8_t *)&v6, 0xCu);
  }

  char v4 = [MEMORY[0x1E4F5A480] emptyObservable];

  return v4;
}

- (void)stopUpdatingFriends
{
  v3 = [(CNShareLocationController *)self findMyLocateSession];

  char v4 = CNUILogContactCard();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_18B625000, v5, OS_LOG_TYPE_DEFAULT, "FindMyLocateSession stop updating friends!", v6, 2u);
    }

    id v5 = [(CNShareLocationController *)self findMyLocateSession];
    [v5 stopUpdatingFriendsWithCompletionHandler:&__block_literal_global_72];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18B625000, v5, OS_LOG_TYPE_ERROR, "CNShareLocationController, can't stop updating friends, findMyLocateSession is nil.", buf, 2u);
  }
}

void __48__CNShareLocationController_stopUpdatingFriends__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = CNUILogContactCard();
  char v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_error_impl(&dword_18B625000, v4, OS_LOG_TYPE_ERROR, "FindMyLocateSession stopUpdatingFriendsWithCompletion failed with an error. %@ ", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEFAULT, "FindMyLocateSession stopUpdatingFriendsWithCompletion completed.", (uint8_t *)&v5, 2u);
  }
}

- (void)startUpdatingFriends
{
  v3 = [(CNShareLocationController *)self findMyLocateSession];

  if (v3)
  {
    char v4 = [(CNShareLocationController *)self findMyLocateSession];
    [v4 startUpdatingFriendsWithInitialUpdates:0 completionHandler:&__block_literal_global_43847];

    objc_initWeak(location, self);
    int v5 = [(CNShareLocationController *)self findMyLocateSession];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__CNShareLocationController_startUpdatingFriends__block_invoke_69;
    v7[3] = &unk_1E5499C10;
    objc_copyWeak(&v8, location);
    [v5 setFriendshipUpdateCallback:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
  else
  {
    id v6 = CNUILogContactCard();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_18B625000, v6, OS_LOG_TYPE_ERROR, "CNShareLocationController, can't start updating friends, findMyLocateSession is nil.", (uint8_t *)location, 2u);
    }
  }
}

void __49__CNShareLocationController_startUpdatingFriends__block_invoke_69(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = [WeakRetained handles];
  uint64_t v7 = [v3 handle];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    id v9 = objc_loadWeakRetained(v4);
    v10 = [v9 schedulerProvider];
    v11 = [v10 mainThreadScheduler];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__CNShareLocationController_startUpdatingFriends__block_invoke_2;
    v12[3] = &unk_1E549B600;
    objc_copyWeak(&v13, v4);
    [v11 performBlock:v12];

    objc_destroyWeak(&v13);
  }
}

void __49__CNShareLocationController_startUpdatingFriends__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifySharingStatusDidChange];
}

void __49__CNShareLocationController_startUpdatingFriends__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = CNUILogContactCard();
  char v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_error_impl(&dword_18B625000, v4, OS_LOG_TYPE_ERROR, "FindMyLocateSession startUpdatingFriendsWithCompletion failed with an error. %@ ", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEFAULT, "FindMyLocateSession startUpdatingFriendsWithCompletion completed.", (uint8_t *)&v5, 2u);
  }
}

- (id)endOfDayDate
{
  id v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  char v4 = [v2 nextDateAfterDate:v3 matchingUnit:32 value:4 options:1024];

  return v4;
}

- (void)stopSharingLocation
{
  id v3 = [(CNShareLocationController *)self findMyLocateSession];

  if (v3)
  {
    char v4 = [(CNShareLocationController *)self findMyLocateSession];
    int v5 = [(CNShareLocationController *)self handles];
    id v6 = [v5 allObjects];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__CNShareLocationController_stopSharingLocation__block_invoke;
    v8[3] = &unk_1E5499BC8;
    v8[4] = self;
    [v4 stopSharingLocationWith:v6 isFromGroup:0 completion:v8];
  }
  else
  {
    uint64_t v7 = CNUILogContactCard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v7, OS_LOG_TYPE_ERROR, "CNShareLocationController, can't stop sharing, findMyLocateSession is nil.", buf, 2u);
    }
  }
}

void __48__CNShareLocationController_stopSharingLocation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    char v4 = CNUILogContactCard();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_error_impl(&dword_18B625000, v4, OS_LOG_TYPE_ERROR, "CNShareLocationController, can't stop sharing: %@ ", buf, 0xCu);
    }
  }
  int v5 = [*(id *)(a1 + 32) schedulerProvider];
  id v6 = [v5 mainThreadScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CNShareLocationController_stopSharingLocation__block_invoke_66;
  v7[3] = &unk_1E549B488;
  void v7[4] = *(void *)(a1 + 32);
  [v6 performBlock:v7];
}

uint64_t __48__CNShareLocationController_stopSharingLocation__block_invoke_66(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifySharingStatusDidChange];
}

- (void)shareLocationWithExpiration:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v5 = [(CNShareLocationController *)self bestPropertyFuture];
  id v19 = 0;
  id v6 = [v5 resultWithTimeout:&v19 error:2.0];
  id v7 = v19;
  int v8 = [v6 firstObject];

  if (v7)
  {
    id v9 = CNUILogContactCard();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    *(_DWORD *)buf = 138412290;
    id v21 = v7;
    v14 = "CNShareLocationController, failed to get best property when sharing: %@";
    v15 = v9;
    uint32_t v16 = 12;
LABEL_13:
    _os_log_error_impl(&dword_18B625000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    goto LABEL_3;
  }
  uint64_t v10 = [(CNShareLocationController *)self findMyLocateSession];

  if (!v10)
  {
    id v9 = CNUILogContactCard();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    *(_WORD *)buf = 0;
    v14 = "CNShareLocationController, can't start sharing, findMyLocateSession is nil.";
    v15 = v9;
    uint32_t v16 = 2;
    goto LABEL_13;
  }
  uint64_t v11 = [(id)objc_opt_class() fmlHandleFromContactProperty:v8];
  if (v11)
  {
    id v9 = v11;
    v12 = [(CNShareLocationController *)self findMyLocateSession];
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObject:v9];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__CNShareLocationController_shareLocationWithExpiration___block_invoke;
    v18[3] = &unk_1E5499BC8;
    v18[4] = self;
    [v12 sendFriendshipOfferTo:v13 end:a3 isFromGroup:0 completion:v18];
  }
  else
  {
    v17 = CNUILogContactCard();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v17, OS_LOG_TYPE_ERROR, "CNShareLocationController, failed to get best handle from best property when sharing", buf, 2u);
    }

    id v9 = 0;
  }
LABEL_3:
}

void __57__CNShareLocationController_shareLocationWithExpiration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    char v4 = CNUILogContactCard();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_error_impl(&dword_18B625000, v4, OS_LOG_TYPE_ERROR, "CNShareLocationController, can't start sharing: %@ ", buf, 0xCu);
    }
  }
  int v5 = [*(id *)(a1 + 32) schedulerProvider];
  id v6 = [v5 mainThreadScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__CNShareLocationController_shareLocationWithExpiration___block_invoke_64;
  v7[3] = &unk_1E549B488;
  void v7[4] = *(void *)(a1 + 32);
  [v6 performBlock:v7];
}

uint64_t __57__CNShareLocationController_shareLocationWithExpiration___block_invoke_64(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifySharingStatusDidChange];
}

- (void)actionsMenuProviderWithCompletion:(id)a3
{
  char v4 = (void (**)(id, void *))a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke;
  v5[3] = &unk_1E5499BA0;
  objc_copyWeak(&v6, &location);
  v4[2](v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__43860;
  v24 = __Block_byref_object_dispose__43861;
  id v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__43860;
  v18[4] = __Block_byref_object_dispose__43861;
  id v19 = (id)MEMORY[0x1E4F1CBF0];
  int v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_27;
  v14[3] = &unk_1E5499B78;
  uint32_t v16 = v18;
  v17 = &v20;
  v14[4] = WeakRetained;
  id v9 = v8;
  v15 = v9;
  [WeakRetained friendshipStateWithCompletion:v14];
  uint64_t v10 = CNUILogContactCard();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_18B625000, v10, OS_LOG_TYPE_DEFAULT, "FindMyLocateSession building shareMyLocation actions menu.", v13, 2u);
  }

  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v11 = (id)v21[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  return v11;
}

void __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_27(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v12 = (void *)MEMORY[0x1E4FB13F0];
    id v13 = CNContactsUIBundle();
    v14 = [v13 localizedStringForKey:@"SHARE_LOCATION_INDEFINITELY_TEXT" value:&stru_1ED8AC728 table:@"Localized"];
    v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"infinity"];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_4;
    v48[3] = &unk_1E549BDC8;
    v48[4] = *(void *)(a1 + 32);
    uint32_t v16 = [v12 actionWithTitle:v14 image:v15 identifier:0 handler:v48];
    uint64_t v17 = [v11 arrayByAddingObject:v16];
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v21 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v22 = CNContactsUIBundle();
    v23 = [v22 localizedStringForKey:@"SHARE_LOCATION_END_OF_DAY_TEXT" value:&stru_1ED8AC728 table:@"Localized"];
    v24 = [MEMORY[0x1E4FB1818] systemImageNamed:@"calendar"];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_6;
    v47[3] = &unk_1E549BDC8;
    v47[4] = *(void *)(a1 + 32);
    id v25 = [v21 actionWithTitle:v23 image:v24 identifier:0 handler:v47];
    uint64_t v26 = [v20 arrayByAddingObject:v25];
    uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
    v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    v29 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v30 = (void *)MEMORY[0x1E4FB13F0];
    id v31 = CNContactsUIBundle();
    v32 = [v31 localizedStringForKey:@"SHARE_LOCATION_ONE_HOUR_TEXT" value:&stru_1ED8AC728 table:@"Localized"];
    v33 = [MEMORY[0x1E4FB1818] systemImageNamed:@"clock"];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_8;
    v46[3] = &unk_1E549BDC8;
    v46[4] = *(void *)(a1 + 32);
    v34 = [v30 actionWithTitle:v32 image:v33 identifier:0 handler:v46];
    uint64_t v35 = [v29 arrayByAddingObject:v34];
    uint64_t v36 = *(void *)(*(void *)(a1 + 48) + 8);
    v37 = *(void **)(v36 + 40);
    *(void *)(v36 + 40) = v35;
  }
  else if (!a2)
  {
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    char v4 = (void *)MEMORY[0x1E4FB13F0];
    id v5 = CNContactsUIBundle();
    id v6 = [v5 localizedStringForKey:@"SHARE_LOCATION_STOP_SHARING_TEXT" value:&stru_1ED8AC728 table:@"Localized"];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_2;
    v49[3] = &unk_1E549BDC8;
    v49[4] = *(void *)(a1 + 32);
    id v7 = [v4 actionWithTitle:v6 image:0 identifier:0 handler:v49];
    uint64_t v8 = [v3 arrayByAddingObject:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  v38 = (void *)MEMORY[0x1E4FB1970];
  v39 = CNContactsUIBundle();
  v40 = [v39 localizedStringForKey:@"SHARE_LOCATION_ALERT_MESSAGE" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v41 = [v38 menuWithTitle:v40 children:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v42 = *(void *)(*(void *)(a1 + 56) + 8);
  id v43 = *(void **)(v42 + 40);
  *(void *)(v42 + 40) = v41;

  v44 = CNUILogContactCard();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v45 = 0;
    _os_log_impl(&dword_18B625000, v44, OS_LOG_TYPE_DEFAULT, "FindMyLocateSession shareMyLocation actions menu complete.", v45, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) schedulerProvider];
  id v3 = [v2 backgroundScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_3;
  v4[3] = &unk_1E549B488;
  v4[4] = *(void *)(a1 + 32);
  [v3 performBlock:v4];
}

void __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) schedulerProvider];
  id v3 = [v2 backgroundScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_5;
  v4[3] = &unk_1E549B488;
  v4[4] = *(void *)(a1 + 32);
  [v3 performBlock:v4];
}

void __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) schedulerProvider];
  id v3 = [v2 backgroundScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_7;
  v4[3] = &unk_1E549B488;
  v4[4] = *(void *)(a1 + 32);
  [v3 performBlock:v4];
}

void __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) schedulerProvider];
  id v3 = [v2 backgroundScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_9;
  v4[3] = &unk_1E549B488;
  v4[4] = *(void *)(a1 + 32);
  [v3 performBlock:v4];
}

uint64_t __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) shareLocationWithExpiration:0];
}

uint64_t __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) shareLocationWithExpiration:1];
}

uint64_t __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) shareLocationWithExpiration:2];
}

uint64_t __63__CNShareLocationController_actionsMenuProviderWithCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopSharingLocation];
}

- (void)friendshipStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CNShareLocationController *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__CNShareLocationController_friendshipStateWithCompletion___block_invoke;
  v7[3] = &unk_1E549B710;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __59__CNShareLocationController_friendshipStateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "handles", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
      id v8 = [*(id *)(a1 + 32) findMyLocateSession];

      if (v8)
      {
        uint64_t v9 = [*(id *)(a1 + 32) findMyLocateSession];
        unint64_t v10 = [v9 friendshipState:v7];

        if (v10 < 2) {
          break;
        }
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)isSharingWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__CNShareLocationController_isSharingWithCompletion___block_invoke;
  v6[3] = &unk_1E5499B50;
  id v7 = v4;
  id v5 = v4;
  [(CNShareLocationController *)self friendshipStateWithCompletion:v6];
}

uint64_t __53__CNShareLocationController_isSharingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

- (void)canShareWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() findMyFunctionalityAvailable]
    && (BOOL v5 = +[FindMyLocateSession hasCorrectPermissionsForLocationSharing](_TtC10ContactsUI19FindMyLocateSession, "hasCorrectPermissionsForLocationSharing"), -[CNShareLocationController handles](self, "handles"), v6 = objc_claimAutoreleasedReturnValue(), v7 = [v6 count], v6, v5)&& v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__CNShareLocationController_canShareWithCompletion___block_invoke;
    v8[3] = &unk_1E5499B50;
    id v9 = v4;
    [(CNShareLocationController *)self friendshipStateWithCompletion:v8];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __52__CNShareLocationController_canShareWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 2);
}

- (void)setContact:(id)a3
{
  id v5 = a3;
  if (([(CNContact *)self->_contact isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    uint64_t v6 = [(id)objc_opt_class() fmlHandlesFromContact:v5];
    [(CNShareLocationController *)self setHandles:v6];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__CNShareLocationController_setContact___block_invoke;
    v7[3] = &unk_1E549B1C0;
    void v7[4] = self;
    [(CNShareLocationController *)self canShareWithCompletion:v7];
  }
}

uint64_t __40__CNShareLocationController_setContact___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) initiateIDSRequest];
  }
  return result;
}

- (CNShareLocationController)initWithIDSAvailabilityProvider:(id)a3 fmlSession:(id)a4 schedulerProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNShareLocationController;
  long long v12 = [(CNShareLocationController *)&v16 init];
  if (v12)
  {
    if (LoadAppleAccount_loadPredicate != -1) {
      dispatch_once(&LoadAppleAccount_loadPredicate, &__block_literal_global_174_43901);
    }
    objc_storeStrong((id *)&v12->_idsAvailabilityProvider, a3);
    objc_storeStrong((id *)&v12->_schedulerProvider, a5);
    objc_storeStrong((id *)&v12->_findMyLocateSession, a4);
    dispatch_queue_t v13 = dispatch_queue_create("CNShareLocationController.serialQueue", 0);
    serialQueue = v12->_serialQueue;
    v12->_serialQueue = (OS_dispatch_queue *)v13;
  }
  return v12;
}

- (CNShareLocationController)initWithIDSAvailabilityProvider:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() findMyFunctionalityAvailable]) {
    id v5 = objc_alloc_init(_TtC10ContactsUI19FindMyLocateSession);
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = +[CNUIContactsEnvironment currentEnvironment];
  uint64_t v7 = [v6 defaultSchedulerProvider];
  id v8 = [(CNShareLocationController *)self initWithIDSAvailabilityProvider:v4 fmlSession:v5 schedulerProvider:v7];

  return v8;
}

+ (BOOL)findMyFunctionalityAvailable
{
  id v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  uint64_t v3 = [v2 entitlementVerifier];
  uint64_t v4 = *MEMORY[0x1E4F5A230];
  uint64_t v12 = 0;
  char v5 = [v3 currentProcessHasBooleanEntitlement:v4 error:&v12];

  if ((v5 & 1) == 0) {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNShareLocationController.m", 418, 4, @"Missing entitlement for FindMyLocate. Please add com.apple.findmy.findmylocate.friendshipservice to the entitlements and mach services in the app.", v6, v7, v8, v9, v11);
  }
  return v5;
}

+ (id)fmlHandleFromContactProperty:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 key];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F1AEE0]];

  if (!v5)
  {
    uint64_t v8 = [v3 key];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F1ADC8]];

    if (!v9) {
      goto LABEL_7;
    }
    uint64_t v7 = [v3 value];
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    id v10 = +[CNFMLHandle handleWithIdentifier:v7];

    goto LABEL_8;
  }
  uint64_t v6 = [v3 value];
  uint64_t v7 = [v6 unformattedInternationalStringValue];

  if (v7) {
    goto LABEL_6;
  }
LABEL_7:
  id v10 = 0;
LABEL_8:

  return v10;
}

+ (id)fmlHandlesFromContact:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  int v5 = [v3 emailAddresses];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v34 + 1) + 8 * i) value];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v7);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v11 = [v3 phoneNumbers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_super v16 = [*(id *)(*((void *)&v30 + 1) + 8 * j) value];
        uint64_t v17 = [v16 unformattedInternationalStringValue];
        [v4 addObject:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v13);
  }

  uint64_t v18 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = v4;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = +[CNFMLHandle handleWithIdentifier:](CNFMLHandle, "handleWithIdentifier:", *(void *)(*((void *)&v26 + 1) + 8 * k), (void)v26);
        [v18 addObject:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v21);
  }

  return v18;
}

@end