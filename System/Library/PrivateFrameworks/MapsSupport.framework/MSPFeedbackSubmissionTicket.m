@interface MSPFeedbackSubmissionTicket
+ (id)ticketForFeedbackRequest:(id)a3;
+ (id)ticketForFeedbackRequest:(id)a3 traits:(id)a4;
+ (id)ticketForFeedbackRequestParameters:(id)a3 mapItem:(id)a4 traits:(id)a5;
- (BOOL)isCancelled;
- (GEOMapServiceTraits)traits;
- (MSPFeedbackSubmissionTicket)initWithMapServiceTicket:(id)a3;
- (NSProgress)fakeProgress;
- (void)cancel;
- (void)submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation MSPFeedbackSubmissionTicket

- (MSPFeedbackSubmissionTicket)initWithMapServiceTicket:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MSPFeedbackSubmissionTicket;
  v6 = [(MSPFeedbackSubmissionTicket *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ticket, a3);
    uint64_t v8 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
    fakeProgress = v7->_fakeProgress;
    v7->_fakeProgress = (NSProgress *)v8;

    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v10 UUIDString];
    sessionIdentifier = v7->_sessionIdentifier;
    v7->_sessionIdentifier = (NSString *)v11;

    v7->_cancelled = 0;
  }

  return v7;
}

+ (id)ticketForFeedbackRequest:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F64710];
  id v5 = a3;
  v6 = [v4 sharedService];
  v7 = [v6 defaultTraits];
  uint64_t v8 = [a1 ticketForFeedbackRequest:v5 traits:v7];

  return v8;
}

+ (id)ticketForFeedbackRequest:(id)a3 traits:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F64710];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 sharedService];
  v9 = [v8 ticketForFeedbackRequest:v7 traits:v6];

  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMapServiceTicket:v9];

  return v10;
}

+ (id)ticketForFeedbackRequestParameters:(id)a3 mapItem:(id)a4 traits:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F64710];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v7 sharedService];
  v12 = [v11 ticketForFeedbackRequestParameters:v10 placeForProblemContext:v9 userCredentials:0 pushToken:0 allowContactBackAtEmailAddress:0 traits:v8];

  v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMapServiceTicket:v12];

  return v13;
}

- (GEOMapServiceTraits)traits
{
  return (GEOMapServiceTraits *)[(GEOMapServiceFeedbackReportTicket *)self->_ticket traits];
}

- (void)cancel
{
  [(GEOMapServiceFeedbackReportTicket *)self->_ticket cancel];
  v3 = [(MSPFeedbackSubmissionTicket *)self fakeProgress];
  [v3 cancel];

  self->_cancelled = 1;
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
}

- (void)submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = MSPGetMSPFeedbackSubmissionTicketLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412290;
    v31 = sessionIdentifier;
    _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_INFO, "<<<<<< BEGIN Session %@ >>>>>>>>", buf, 0xCu);
  }

  v13 = [(MSPFeedbackSubmissionTicket *)self fakeProgress];
  [v13 setCompletedUnitCount:20];

  objc_super v14 = MSPGetMSPFeedbackSubmissionTicketLog();
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  v16 = MSPGetMSPFeedbackSubmissionTicketLog();
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "MapServiceRequest", (const char *)&unk_1B8876199, buf, 2u);
  }

  v18 = MSPGetMSPFeedbackSubmissionTicketLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412290;
    v31 = v19;
    _os_log_impl(&dword_1B87E5000, v18, OS_LOG_TYPE_INFO, "%@ - Initiate a Map Service request", buf, 0xCu);
  }

  ticket = self->_ticket;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __79__MSPFeedbackSubmissionTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke;
  v25[3] = &unk_1E617EA80;
  id v21 = v8;
  os_signpost_id_t v29 = v15;
  id v26 = v21;
  v27 = self;
  id v22 = v9;
  id v28 = v22;
  [(GEOMapServiceFeedbackReportTicket *)ticket submitWithHandler:v25 networkActivity:v10];

  v23 = MSPGetMSPFeedbackSubmissionTicketLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412290;
    v31 = v24;
    _os_log_impl(&dword_1B87E5000, v23, OS_LOG_TYPE_INFO, "<<<<<< END Session %@ >>>>>>>>", buf, 0xCu);
  }
}

void __79__MSPFeedbackSubmissionTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__MSPFeedbackSubmissionTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2;
  v16[3] = &unk_1E617EA58;
  uint64_t v11 = (void *)a1[6];
  uint64_t v10 = a1[7];
  v12 = a1[4];
  v16[4] = a1[5];
  id v17 = v9;
  uint64_t v21 = v10;
  id v18 = v7;
  id v19 = v8;
  id v20 = v11;
  id v13 = v8;
  id v14 = v7;
  id v15 = v9;
  dispatch_async(v12, v16);
}

uint64_t __79__MSPFeedbackSubmissionTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = MSPGetMSPFeedbackSubmissionTicketLog();
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v3, OS_SIGNPOST_INTERVAL_END, v4, "MapServiceRequest", (const char *)&unk_1B8876199, (uint8_t *)&v15, 2u);
  }

  id v5 = [*(id *)(a1 + 32) fakeProgress];
  [v5 setCompletedUnitCount:80];

  if (*(void *)(a1 + 40))
  {
    id v6 = MSPGetMSPFeedbackSubmissionTicketLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v15 = 138412290;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_ERROR, "Failed Map Service request with error %@", (uint8_t *)&v15, 0xCu);
    }

    if (*(void *)(a1 + 40)) {
      goto LABEL_9;
    }
  }
  if ([*(id *)(a1 + 48) status])
  {
LABEL_9:
    id v8 = MSPGetMSPFeedbackSubmissionTicketLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 16);
      int v10 = [*(id *)(a1 + 48) status];
      uint64_t v11 = *(void *)(a1 + 40);
      int v15 = 138412802;
      uint64_t v16 = v9;
      __int16 v17 = 1024;
      int v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_INFO, "%@ - Map Service request failed with response status: %d, and error: %@", (uint8_t *)&v15, 0x1Cu);
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) fakeProgress];
    uint64_t v12 = [v8 totalUnitCount];
    id v13 = [*(id *)(a1 + 32) fakeProgress];
    [v13 setCompletedUnitCount:v12];
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 40));
  }
  return result;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (NSProgress)fakeProgress
{
  return self->_fakeProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeProgress, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);

  objc_storeStrong((id *)&self->_ticket, 0);
}

@end