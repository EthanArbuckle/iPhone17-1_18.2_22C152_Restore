@interface IMDGroupPhotoRefreshController
- (BOOL)shouldRefreshTTLForGroupPhoto:(id)a3 chatGUID:(id)a4;
- (IMDGroupPhotoRefreshController)initWithSession:(id)a3;
- (MessageServiceSession)session;
- (NSMutableSet)refreshRequests;
- (double)maxRefreshTime;
- (double)minRefreshTime;
- (id)attachmentRefreshDeliveryController;
- (void)dealloc;
- (void)refreshTTLForGroupPhoto:(id)a3 chat:(id)a4;
- (void)setRefreshRequests:(id)a3;
@end

@implementation IMDGroupPhotoRefreshController

- (IMDGroupPhotoRefreshController)initWithSession:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDGroupPhotoRefreshController;
  v5 = [(IMDGroupPhotoRefreshController *)&v9 init];
  if (v5)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    refreshRequests = v5->_refreshRequests;
    v5->_refreshRequests = v6;

    objc_storeWeak((id *)&v5->_session, v4);
  }

  return v5;
}

- (void)dealloc
{
  refreshRequests = self->_refreshRequests;
  self->_refreshRequests = 0;

  v4.receiver = self;
  v4.super_class = (Class)IMDGroupPhotoRefreshController;
  [(IMDGroupPhotoRefreshController *)&v4 dealloc];
}

- (id)attachmentRefreshDeliveryController
{
  v2 = [(IMDGroupPhotoRefreshController *)self session];
  v3 = [v2 attachmentRefreshDeliveryController];

  return v3;
}

- (BOOL)shouldRefreshTTLForGroupPhoto:(id)a3 chatGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "not requesting group photo - no transfer", (uint8_t *)&v21, 2u);
      }
      goto LABEL_20;
    }
LABEL_21:
    BOOL v19 = 0;
    goto LABEL_22;
  }
  v8 = [(IMDGroupPhotoRefreshController *)self refreshRequests];
  unsigned int v9 = [v8 containsObject:v7];

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = [(IMDGroupPhotoRefreshController *)self refreshRequests];
        int v21 = 138412290;
        double v22 = *(double *)&v11;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "not requesting group photo - request already in flight. %@", (uint8_t *)&v21, 0xCu);
      }
    }
    goto LABEL_21;
  }
  v13 = +[NSDate date];
  v14 = [v6 refreshDate];
  [v13 timeIntervalSinceDate:v14];
  double v16 = v15;

  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v21 = 134218498;
      double v22 = v16;
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Time since last refresh: %f for chat: %@, transfer: %@", (uint8_t *)&v21, 0x20u);
    }
  }
  [(IMDGroupPhotoRefreshController *)self minRefreshTime];
  if (v16 < v18)
  {
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v21 = 134217984;
        double v22 = v16;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "not requesting group photo - time since last refresh outside window %f", (uint8_t *)&v21, 0xCu);
      }
LABEL_20:

      goto LABEL_21;
    }
    goto LABEL_21;
  }
  BOOL v19 = 1;
LABEL_22:

  return v19;
}

- (void)refreshTTLForGroupPhoto:(id)a3 chat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 guid];
  unsigned int v9 = [(IMDGroupPhotoRefreshController *)self shouldRefreshTTLForGroupPhoto:v6 chatGUID:v8];

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        double v39 = *(double *)&v6;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "requesting to refresh tll for group photo %@", buf, 0xCu);
      }
    }
    v11 = [v6 userInfo];
    v12 = [v11 objectForKey:@"decryption-key"];
    if (v12)
    {
      v13 = [v11 objectForKey:@"file-size"];
      if (v13)
      {
        v14 = [v11 objectForKey:@"mmcs-owner"];
        if (v14)
        {
          double v15 = [v11 objectForKey:@"mmcs-signature-hex"];
          if (v15)
          {
            double v16 = [v11 objectForKey:@"mmcs-url"];
            BOOL v17 = v16 != 0;
          }
          else
          {
            BOOL v17 = 0;
          }
        }
        else
        {
          BOOL v17 = 0;
        }
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }

    double v18 = +[NSDate date];
    BOOL v19 = [v6 refreshDate];
    [v18 timeIntervalSinceDate:v19];
    double v21 = v20;

    [(IMDGroupPhotoRefreshController *)self maxRefreshTime];
    if (v21 <= v22 && v17)
    {
      id v24 = [v6 userInfo];
      __int16 v25 = objc_alloc_init(FTiMessageRequestMMCSFileRefreshToken);
      AttachmentRefreshUtilConfigureStickerToken(v25, v24);
      id v26 = [(IMDGroupPhotoRefreshController *)self refreshRequests];
      v27 = [v7 guid];
      [v26 addObject:v27];

      v28 = [(IMDGroupPhotoRefreshController *)self attachmentRefreshDeliveryController];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_6B490;
      v35[3] = &unk_DF528;
      v35[4] = self;
      id v36 = v7;
      id v37 = v6;
      [v28 sendFTMessage:v25 attempts:0 withCompletionBlock:v35];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          CFStringRef v30 = @"NO";
          if (v17) {
            CFStringRef v30 = @"YES";
          }
          *(_DWORD *)buf = 134218242;
          double v39 = v21;
          __int16 v40 = 2112;
          CFStringRef v41 = v30;
          _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "It's been a long time since a refresh has occurred, just re-send the transfer to everyone. timeSinceLastRefresh: %f, canRefreshAsset: %@", buf, 0x16u);
        }
      }
      id v24 = [(IMDGroupPhotoRefreshController *)self session];
      __int16 v25 = [v6 guid];
      v31 = [v7 guid];
      v32 = [v7 chatIdentifier];
      id v33 = [v7 style];
      v34 = [v7 accountID];
      [v24 sendGroupPhotoUpdate:v25 toChatID:v31 identifier:v32 style:v33 account:v34 isPhotoRefresh:1];
    }
  }
}

- (double)minRefreshTime
{
  uint64_t v2 = IMGetDomainIntForKey();
  double result = (double)v2;
  if (v2 <= 0) {
    return 864000.0;
  }
  return result;
}

- (double)maxRefreshTime
{
  uint64_t v2 = IMGetDomainIntForKey();
  double result = (double)v2;
  if (v2 <= 0) {
    return 2160000.0;
  }
  return result;
}

- (MessageServiceSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (MessageServiceSession *)WeakRetained;
}

- (NSMutableSet)refreshRequests
{
  return self->_refreshRequests;
}

- (void)setRefreshRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshRequests, 0);

  objc_destroyWeak((id *)&self->_session);
}

@end