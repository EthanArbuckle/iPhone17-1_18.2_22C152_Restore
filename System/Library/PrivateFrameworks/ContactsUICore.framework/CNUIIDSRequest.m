@interface CNUIIDSRequest
+ (BOOL)isDestinationAvailable:(id)a3 givenStatusesByDestination:(id)a4;
+ (BOOL)isStatusOfAnyDestinationUnknown:(id)a3;
+ (id)IDSResponseQueue;
+ (id)IDSServiceForService:(int64_t)a3;
+ (id)afterDelayRetryRefreshingStatusOfDestinations:(id)a3 forService:(id)a4 queryControllerWrapper:(id)a5 scheduler:(id)a6;
+ (id)errorRefreshingHandles:(id)a3 forService:(id)a4;
+ (id)refreshStatusOfDestinations:(id)a3 forService:(id)a4 queryControllerWrapper:(id)a5;
+ (id)refreshStatusOfDestinations:(id)a3 forService:(id)a4 queryControllerWrapper:(id)a5 delay:(double)a6 scheduler:(id)a7;
+ (id)resultsForIDSControllerResult:(id)a3 handlesByDestination:(id)a4;
+ (id)validHandlesFromHandles:(id)a3;
+ (id)validateHandles:(id)a3 forService:(int64_t)a4 scheduler:(id)a5 queryControllerWrapper:(id)a6;
@end

@implementation CNUIIDSRequest

+ (BOOL)isStatusOfAnyDestinationUnknown:(id)a3
{
  id v3 = a3;
  if ((*(uint64_t (**)(void))(*MEMORY[0x263F334C0] + 16))())
  {
    char v4 = 0;
  }
  else
  {
    v5 = [v3 allValues];
    char v4 = objc_msgSend(v5, "_cn_any:", &__block_literal_global_7);
  }
  return v4;
}

BOOL __50__CNUIIDSRequest_isStatusOfAnyDestinationUnknown___block_invoke(uint64_t a1, void *a2)
{
  return [a2 integerValue] == 0;
}

+ (id)resultsForIDSControllerResult:(id)a3 handlesByDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 allKeys];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__CNUIIDSRequest_resultsForIDSControllerResult_handlesByDestination___block_invoke;
  v13[3] = &unk_264017170;
  id v15 = v6;
  id v16 = a1;
  id v14 = v7;
  id v9 = v6;
  id v10 = v7;
  v11 = objc_msgSend(v8, "_cn_map:", v13);

  return v11;
}

_CNUIIDSHandleAvailability *__69__CNUIIDSRequest_resultsForIDSControllerResult_handlesByDestination___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 objectForKeyedSubscript:v4];
  uint64_t v6 = [*(id *)(a1 + 48) isDestinationAvailable:v4 givenStatusesByDestination:*(void *)(a1 + 40)];

  id v7 = [[_CNUIIDSHandleAvailability alloc] initWithHandle:v5 available:v6];
  return v7;
}

+ (BOOL)isDestinationAvailable:(id)a3 givenStatusesByDestination:(id)a4
{
  id v4 = [a4 objectForKeyedSubscript:a3];
  v5 = v4;
  if (v4) {
    BOOL v6 = [v4 integerValue] == 1;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)IDSServiceForService:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
  {
    ((void (*)(id, SEL))*off_264017278[a3])(a1, a2);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)IDSResponseQueue
{
  if (IDSResponseQueue_cn_once_token_1 != -1) {
    dispatch_once(&IDSResponseQueue_cn_once_token_1, &__block_literal_global_11);
  }
  v2 = (void *)IDSResponseQueue_cn_once_object_1;
  return v2;
}

uint64_t __34__CNUIIDSRequest_IDSResponseQueue__block_invoke()
{
  IDSResponseQueue_cn_once_object_1 = (uint64_t)dispatch_queue_create("com.apple.contacts.ContactsUICore.IDSResponseQueue", 0);
  return MEMORY[0x270F9A758]();
}

+ (id)validateHandles:(id)a3 forService:(int64_t)a4 scheduler:(id)a5 queryControllerWrapper:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  v13 = [a1 IDSServiceForService:a4];
  id v14 = objc_alloc_init(MEMORY[0x263F33630]);
  id v15 = [a1 validHandlesFromHandles:v12];

  id v16 = objc_msgSend(v15, "_cn_indexBy:", &__block_literal_global_0);

  v17 = [a1 errorRefreshingHandles:v16 forService:v13];
  if (v16)
  {
    v25 = [a1 refreshStatusOfDestinations:v16 forService:v13 queryControllerWrapper:v11];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __78__CNUIIDSRequest_validateHandles_forService_scheduler_queryControllerWrapper___block_invoke;
    v34[3] = &unk_264017198;
    id v39 = a1;
    id v18 = v16;
    id v35 = v18;
    id v36 = v13;
    id v37 = v11;
    id v19 = v10;
    id v38 = v19;
    v20 = [v25 flatMap:v34];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __78__CNUIIDSRequest_validateHandles_forService_scheduler_queryControllerWrapper___block_invoke_2;
    v28[3] = &unk_2640171E8;
    id v29 = v19;
    id v33 = a1;
    id v30 = v18;
    id v21 = v14;
    id v31 = v21;
    id v32 = v17;
    [v20 addSuccessBlock:v28];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __78__CNUIIDSRequest_validateHandles_forService_scheduler_queryControllerWrapper___block_invoke_4;
    v26[3] = &unk_264017210;
    id v22 = v21;
    id v27 = v22;
    [v20 addFailureBlock:v26];
    v23 = [v22 future];
  }
  else
  {
    [v14 finishWithError:v17];
    v23 = [v14 future];
  }

  return v23;
}

id __78__CNUIIDSRequest_validateHandles_forService_scheduler_queryControllerWrapper___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 64) shouldRetryRefreshingIDSStatusOfDesinationsGivenResult:v3]) {
    [*(id *)(a1 + 64) afterDelayRetryRefreshingStatusOfDestinations:*(void *)(a1 + 32) forService:*(void *)(a1 + 40) queryControllerWrapper:*(void *)(a1 + 48) scheduler:*(void *)(a1 + 56)];
  }
  else {
  id v4 = [MEMORY[0x263F335E0] futureWithResult:v3];
  }

  return v4;
}

void __78__CNUIIDSRequest_validateHandles_forService_scheduler_queryControllerWrapper___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__CNUIIDSRequest_validateHandles_forService_scheduler_queryControllerWrapper___block_invoke_3;
  v6[3] = &unk_2640171C0;
  uint64_t v11 = *(void *)(a1 + 64);
  id v7 = v3;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  [v4 performBlock:v6];
}

void __78__CNUIIDSRequest_validateHandles_forService_scheduler_queryControllerWrapper___block_invoke_3(void *a1)
{
  uint64_t v2 = [(id)objc_opt_class() resultsForIDSControllerResult:a1[4] handlesByDestination:a1[5]];
  id v3 = (void *)a1[6];
  id v4 = (id)v2;
  if (v2) {
    [v3 finishWithResult:v2];
  }
  else {
    [v3 finishWithError:a1[7]];
  }
}

uint64_t __78__CNUIIDSRequest_validateHandles_forService_scheduler_queryControllerWrapper___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

+ (id)afterDelayRetryRefreshingStatusOfDestinations:(id)a3 forService:(id)a4 queryControllerWrapper:(id)a5 scheduler:(id)a6
{
  return (id)[a1 refreshStatusOfDestinations:a3 forService:a4 queryControllerWrapper:a5 delay:a6 scheduler:2.5];
}

+ (id)refreshStatusOfDestinations:(id)a3 forService:(id)a4 queryControllerWrapper:(id)a5
{
  id v8 = (void *)MEMORY[0x263F33660];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 immediateScheduler];
  v13 = [a1 refreshStatusOfDestinations:v11 forService:v10 queryControllerWrapper:v9 delay:v12 scheduler:0.0];

  return v13;
}

+ (id)refreshStatusOfDestinations:(id)a3 forService:(id)a4 queryControllerWrapper:(id)a5 delay:(double)a6 scheduler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x263F33630]);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__CNUIIDSRequest_refreshStatusOfDestinations_forService_queryControllerWrapper_delay_scheduler___block_invoke;
  aBlock[3] = &unk_2640171C0;
  id v27 = v14;
  id v28 = v12;
  id v30 = v16;
  id v31 = a1;
  id v29 = v13;
  id v17 = v16;
  id v18 = v13;
  id v19 = v12;
  id v20 = v14;
  id v21 = _Block_copy(aBlock);
  id v22 = v21;
  if (a6 <= 0.0) {
    (*((void (**)(void *))v21 + 2))(v21);
  }
  else {
    id v23 = (id)[v15 afterDelay:v21 performBlock:a6];
  }
  v24 = [v17 future];

  return v24;
}

void __96__CNUIIDSRequest_refreshStatusOfDestinations_forService_queryControllerWrapper_delay_scheduler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) allKeys];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 64) IDSResponseQueue];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __96__CNUIIDSRequest_refreshStatusOfDestinations_forService_queryControllerWrapper_delay_scheduler___block_invoke_2;
  id v13 = &unk_264017238;
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v14 = v6;
  uint64_t v17 = v7;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  LOBYTE(v2) = [v2 refreshIDStatusForDestinations:v3 service:v4 listenerID:@"com.apple.contacts.ContactsUICore" queue:v5 completionBlock:&v10];

  if ((v2 & 1) == 0)
  {
    id v8 = *(void **)(a1 + 56);
    id v9 = objc_msgSend(*(id *)(a1 + 64), "errorRefreshingHandles:forService:", *(void *)(a1 + 40), *(void *)(a1 + 48), v10, v11, v12, v13, v14, v15);
    [v8 finishWithError:v9];
  }
}

void __96__CNUIIDSRequest_refreshStatusOfDestinations_forService_queryControllerWrapper_delay_scheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 finishWithResult:a2];
  }
  else
  {
    id v4 = [*(id *)(a1 + 56) errorRefreshingHandles:*(void *)(a1 + 40) forService:*(void *)(a1 + 48)];
    [v2 finishWithError:v4];
  }
}

+ (id)errorRefreshingHandles:(id)a3 forService:(id)a4
{
  v12[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (a3)
  {
    id v6 = [a3 allValues];
    objc_msgSend(v6, "_cn_map:", &__block_literal_global_0);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v7 = @"No handles provided";
  }
  v11[0] = @"handles";
  v11[1] = @"service";
  v12[0] = v7;
  v12[1] = v5;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = +[CNContactsUIError errorWithCode:205 userInfo:v8];

  return v9;
}

+ (id)validHandlesFromHandles:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "_cn_filter:", &__block_literal_global_4);
  uint64_t v5 = [v3 count];
  if (v5 != [v4 count]) {
    objc_msgSend(v3, "_cn_each:", &__block_literal_global_35);
  }

  return v4;
}

void __42__CNUIIDSRequest_validHandlesFromHandles___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(v2, "_cnui_IDSIDRepresentation");

  if (!v3)
  {
    id v4 = +[CNUICoreLogProvider actions_os_log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __42__CNUIIDSRequest_validHandlesFromHandles___block_invoke_cold_1((uint64_t)v2, v4);
    }
  }
}

void __42__CNUIIDSRequest_validHandlesFromHandles___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20B704000, a2, OS_LOG_TYPE_DEBUG, "No IDS representation for handle %@", (uint8_t *)&v2, 0xCu);
}

@end