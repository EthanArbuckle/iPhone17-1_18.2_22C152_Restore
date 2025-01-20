@interface MSPAuthFeedbackReportTicket
- (id)_dataToSign;
- (void)submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5;
@end

@implementation MSPAuthFeedbackReportTicket

- (id)_dataToSign
{
  int64_t v3 = [(MSPBaseFeedbackReportTicket *)self userInfoType];
  if (v3 == 2)
  {
    v4 = [(MSPBaseFeedbackReportTicket *)self userInfo];
    v5 = [v4 tdmUserInfo];
    v6 = [v5 anonymousUserId];
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    v4 = [(MSPBaseFeedbackReportTicket *)self userInfo];
    v5 = [v4 userCredentials];
    v6 = [v5 icloudUserPersonId];
LABEL_5:
    v7 = v6;
    v8 = [v6 dataUsingEncoding:4];

    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (void)submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MSPAuthFeedbackReportTicket *)self _dataToSign];
  if ([v11 length])
  {
    char BOOL = GEOConfigGetBOOL();
    GEOConfigGetDouble();
    double v14 = v13;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __79__MSPAuthFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke;
    v17[3] = &unk_1E617E8A8;
    id v19 = v9;
    v17[4] = self;
    id v18 = v8;
    id v20 = v10;
    MSPUGCFetchClientCertificate(@"com.apple.Maps.CommunityID", v11, v11, BOOL, v17, v14);

    v15 = v19;
  }
  else
  {
    v16 = MSPGetMSPAuthFeedbackReportTicketLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_ERROR, "No data to sign", buf, 2u);
    }

    v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"No data to sign" code:-1 userInfo:0];
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v15);
  }
}

void __79__MSPAuthFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = MSPGetMSPAuthFeedbackReportTicketLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v9;
      _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_ERROR, "Failed certificate fetch with error %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v11 = [*(id *)(a1 + 32) userInfo];
    v12 = [v11 tdmUserInfo];

    if (!v12)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F648C8]);
      double v14 = [*(id *)(a1 + 32) userInfo];
      [v14 setTdmUserInfo:v13];
    }
    v15 = (void *)[v7 copy];
    v16 = [*(id *)(a1 + 32) userInfo];
    v17 = [v16 tdmUserInfo];
    [v17 setBaaCertificates:v15];

    id v18 = [*(id *)(a1 + 32) userInfo];
    id v19 = [v18 tdmUserInfo];
    [v19 setBaaSignature:v8];

    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 56);
    v23.receiver = *(id *)(a1 + 32);
    v23.super_class = (Class)MSPAuthFeedbackReportTicket;
    objc_msgSendSuper2(&v23, sel_submitWithCallbackQueue_handler_networkActivity_, v20, v21, v22);
  }
}

@end