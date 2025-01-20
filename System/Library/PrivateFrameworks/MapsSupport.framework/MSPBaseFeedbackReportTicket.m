@interface MSPBaseFeedbackReportTicket
- (GEOMapServiceFeedbackReportTicket)ticket;
- (GEOMapServiceTraits)traits;
- (GEORPFeedbackRequestParameters)requestParameters;
- (GEORPFeedbackUserInfo)userInfo;
- (MSPBaseFeedbackReportTicket)initWithFeedbackRequestParameters:(id)a3 traits:(id)a4 userInfoType:(int64_t)a5;
- (id)willSubmitRequestBlock;
- (int64_t)userInfoType;
- (void)_submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5;
- (void)cancel;
- (void)setTicket:(id)a3;
- (void)setWillSubmitRequestBlock:(id)a3;
- (void)submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation MSPBaseFeedbackReportTicket

- (MSPBaseFeedbackReportTicket)initWithFeedbackRequestParameters:(id)a3 traits:(id)a4 userInfoType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MSPBaseFeedbackReportTicket;
  v11 = [(MSPBaseFeedbackReportTicket *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestParameters, a3);
    objc_storeStrong((id *)&v12->_traits, a4);
    v12->_userInfoType = a5;
  }

  return v12;
}

- (GEORPFeedbackUserInfo)userInfo
{
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    int64_t userInfoType = self->_userInfoType;
    if (userInfoType == 2)
    {
      v8 = (GEORPFeedbackUserInfo *)objc_alloc_init(MEMORY[0x1E4F648B0]);
      id v9 = self->_userInfo;
      self->_userInfo = v8;

      id v10 = objc_alloc_init(MEMORY[0x1E4F648C8]);
      [(GEORPFeedbackUserInfo *)self->_userInfo setTdmUserInfo:v10];

      v7 = [MEMORY[0x1E4F29128] UUID];
      v11 = [v7 UUIDString];
      v12 = [(GEORPFeedbackUserInfo *)self->_userInfo tdmUserInfo];
      [v12 setAnonymousUserId:v11];

      goto LABEL_6;
    }
    if (userInfoType == 1)
    {
      v5 = (GEORPFeedbackUserInfo *)objc_alloc_init(MEMORY[0x1E4F648B0]);
      v6 = self->_userInfo;
      self->_userInfo = v5;

      v7 = [MEMORY[0x1E4F648D0] _credentialsForPrimaryICloudAccount];
      [(GEORPFeedbackUserInfo *)self->_userInfo setUserCredentials:v7];
LABEL_6:

      userInfo = self->_userInfo;
      goto LABEL_8;
    }
    userInfo = 0;
  }
LABEL_8:

  return userInfo;
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
}

- (void)submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F648A0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  v13 = [(MSPBaseFeedbackReportTicket *)self requestParameters];
  objc_super v14 = [(MSPBaseFeedbackReportTicket *)self userInfo];
  v15 = [(MSPBaseFeedbackReportTicket *)self traits];
  id v21 = (id)[v12 initWithFeedbackRequestParameters:v13 userInfo:v14 traits:v15];

  v16 = [(MSPBaseFeedbackReportTicket *)self willSubmitRequestBlock];

  if (v16)
  {
    v17 = [(MSPBaseFeedbackReportTicket *)self willSubmitRequestBlock];
    ((void (**)(void, id))v17)[2](v17, v21);
  }
  v18 = [MEMORY[0x1E4F64710] sharedService];
  v19 = [(MSPBaseFeedbackReportTicket *)self traits];
  v20 = [v18 ticketForFeedbackRequest:v21 traits:v19];
  [(MSPBaseFeedbackReportTicket *)self setTicket:v20];

  [(MSPBaseFeedbackReportTicket *)self _submitWithCallbackQueue:v11 handler:v10 networkActivity:v9];
}

- (void)_submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSPBaseFeedbackReportTicket *)self ticket];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__MSPBaseFeedbackReportTicket__submitWithCallbackQueue_handler_networkActivity___block_invoke;
  v18[3] = &unk_1E617CAE0;
  id v20 = v9;
  id v19 = v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__MSPBaseFeedbackReportTicket__submitWithCallbackQueue_handler_networkActivity___block_invoke_3;
  v15[3] = &unk_1E617CB30;
  id v16 = v19;
  id v17 = v10;
  id v12 = v19;
  id v13 = v10;
  id v14 = v9;
  [v11 submitWithHandler:v18 networkActivity:v15];
}

void __80__MSPBaseFeedbackReportTicket__submitWithCallbackQueue_handler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    id v11 = *(NSObject **)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __80__MSPBaseFeedbackReportTicket__submitWithCallbackQueue_handler_networkActivity___block_invoke_2;
    v16[3] = &unk_1E617CAB8;
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

uint64_t __80__MSPBaseFeedbackReportTicket__submitWithCallbackQueue_handler_networkActivity___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __80__MSPBaseFeedbackReportTicket__submitWithCallbackQueue_handler_networkActivity___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __80__MSPBaseFeedbackReportTicket__submitWithCallbackQueue_handler_networkActivity___block_invoke_4;
    v6[3] = &unk_1E617CB08;
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

uint64_t __80__MSPBaseFeedbackReportTicket__submitWithCallbackQueue_handler_networkActivity___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)cancel
{
  ticket = self->_ticket;
  if (ticket)
  {
    [(GEOMapServiceFeedbackReportTicket *)ticket cancel];
    v4 = self->_ticket;
    self->_ticket = 0;
  }
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (int64_t)userInfoType
{
  return self->_userInfoType;
}

- (GEORPFeedbackRequestParameters)requestParameters
{
  return self->_requestParameters;
}

- (GEOMapServiceFeedbackReportTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
}

- (id)willSubmitRequestBlock
{
  return self->_willSubmitRequestBlock;
}

- (void)setWillSubmitRequestBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_willSubmitRequestBlock, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_traits, 0);

  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end