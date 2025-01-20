@interface MKFeedbackReportTicket
@end

@implementation MKFeedbackReportTicket

void __75___MKFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75___MKFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2;
    v16[3] = &unk_1E54BAED0;
    id v12 = v10;
    id v20 = v12;
    id v13 = v7;
    id v17 = v13;
    id v14 = v8;
    id v18 = v14;
    id v15 = v9;
    id v19 = v15;
    if (v11) {
      dispatch_async(v11, v16);
    }
    else {
      (*((void (**)(id, id, id, id))v12 + 2))(v12, v13, v14, v15);
    }
  }
}

uint64_t __75___MKFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __75___MKFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75___MKFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_4;
    v6[3] = &unk_1E54BAF98;
    id v5 = v2;
    id v7 = v5;
    char v8 = a2;
    if (v4) {
      dispatch_async(v4, v6);
    }
    else {
      (*((void (**)(id, uint64_t))v5 + 2))(v5, a2);
    }
  }
}

uint64_t __75___MKFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

@end