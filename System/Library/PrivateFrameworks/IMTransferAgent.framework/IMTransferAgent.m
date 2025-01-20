uint64_t sub_23CAEE980()
{
  uint64_t vars8;

  qword_26AF3FDE0 = objc_alloc_init(IMTransferAgentIDSInterface);
  return MEMORY[0x270F9A758]();
}

uint64_t sub_23CAEF024(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(int *)(v1 + 32) <= 0 && *(_DWORD *)(result + 40) == *(_DWORD *)(v1 + 36))
  {
    if (IMOSLoggingEnabled())
    {
      v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_23CAED000, v2, OS_LOG_TYPE_INFO, "Idle exiting, we're done here", v3, 2u);
      }
    }
    exit(0);
  }
  return result;
}

void sub_23CAEF774(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (IMOSLoggingEnabled())
  {
    v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = @"NO";
      *(_DWORD *)buf = 138413570;
      *(void *)&buf[4] = v16;
      if (a2) {
        v24 = @"YES";
      }
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v24;
      __int16 v26 = 2112;
      id v27 = v21;
      __int16 v28 = 2112;
      id v29 = v18;
      __int16 v30 = 2112;
      id v31 = v19;
      __int16 v32 = 2112;
      id v33 = v20;
      _os_log_impl(&dword_23CAED000, v23, OS_LOG_TYPE_INFO, "Finished Uploading The Remote request file with SentPath: %@, Success: %@ Error: %@ OwnerID: %@ Signature: %@ RequestURLString: %@", buf, 0x3Eu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_sendUploadResponse:topic:success:error:ownerID:signature:requestURLString:transferID:", v16, *(void *)(a1 + 40), a2, v21, v18, v19, v20, *(void *)(a1 + 48), *(_OWORD *)buf);
}

void sub_23CAF02C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_23CAF1844(void *a1)
{
  id v1 = a1;
  v2 = [v1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x263F4A808]];

  if (v3) {
    char v4 = [v1 code] == -1;
  }
  else {
    char v4 = 0;
  }
  v5 = [v1 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F08570]];

  if (v6)
  {
    uint64_t v7 = [v1 code];
    if ((unint64_t)(v7 + 1019) <= 0x12) {
      v4 |= 0x56D03u >> (v7 - 5);
    }
  }

  return v4 & 1;
}

uint64_t sub_23CAF195C()
{
  qword_26AF3FDE8 = objc_alloc_init(IMTransferAgentController);
  return MEMORY[0x270F9A758]();
}

void sub_23CAF2114(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    objc_end_catch();
    JUMPOUT(0x23CAF1D18);
  }
  _Unwind_Resume(exception_object);
}

void sub_23CAF217C(uint64_t a1, void *a2, double a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (IMOSLoggingEnabled())
  {
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 134218242;
      double v9 = a3;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_23CAED000, v6, OS_LOG_TYPE_INFO, "Sent MMCS transfer progress updated to %0.02f  (%@)", (uint8_t *)&v8, 0x16u);
    }
  }
  if (*(void *)(a1 + 40))
  {
    [v5 protocolFileSize];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_23CAF22AC(uint64_t a1, void *a2, unsigned int a3, int a4, int a5, void *a6)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  v47 = a2;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  unsigned int v45 = a3;
  v46 = v11;
  if ((a3 & 1) == 0)
  {
    int v12 = [*(id *)(a1 + 32) _shouldRetryUploadGivenMMCSError:v11 retryAttemptCount:*(void *)(a1 + 104)];
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        uint64_t v15 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 104)];
        id v16 = (void *)v15;
        id v17 = @"NO";
        *(_DWORD *)buf = 138413058;
        uint64_t v60 = v14;
        __int16 v61 = 2112;
        if (v12) {
          id v17 = @"YES";
        }
        v62 = v17;
        __int16 v63 = 2112;
        uint64_t v64 = v15;
        __int16 v65 = 1024;
        LODWORD(v66) = 3;
        _os_log_impl(&dword_23CAED000, v13, OS_LOG_TYPE_INFO, "File transfer upload failed! %@  Should retry: %@   Retries: %@  Max Retries: %d", buf, 0x26u);
      }
    }
    if (v12)
    {
      v48[1] = (id)MEMORY[0x263EF8330];
      v48[2] = (id)3221225472;
      v48[3] = sub_23CAF2860;
      v48[4] = &unk_264E80CC8;
      id v18 = WeakRetained;
      uint64_t v19 = *(void *)(a1 + 32);
      id v49 = v18;
      uint64_t v50 = v19;
      id v51 = *(id *)(a1 + 48);
      id v52 = *(id *)(a1 + 56);
      id v53 = *(id *)(a1 + 40);
      id v20 = *(id *)(a1 + 64);
      uint64_t v21 = *(void *)(a1 + 104);
      id v54 = v20;
      uint64_t v58 = v21;
      id v55 = *(id *)(a1 + 72);
      id v56 = *(id *)(a1 + 80);
      id v57 = *(id *)(a1 + 88);
      im_dispatch_after_primary_queue();

      id v22 = v49;
LABEL_33:

      goto LABEL_34;
    }
    a4 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = @"NO";
      uint64_t v25 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138413570;
      if (v45) {
        __int16 v26 = @"YES";
      }
      else {
        __int16 v26 = @"NO";
      }
      uint64_t v60 = v25;
      __int16 v61 = 2112;
      if (a4) {
        id v27 = @"YES";
      }
      else {
        id v27 = @"NO";
      }
      v62 = v47;
      if (a5) {
        v24 = @"YES";
      }
      __int16 v63 = 2112;
      uint64_t v64 = (uint64_t)v26;
      __int16 v65 = 2112;
      v66 = v27;
      __int16 v67 = 2112;
      v68 = v24;
      __int16 v69 = 2112;
      v70 = v46;
      _os_log_impl(&dword_23CAED000, v23, OS_LOG_TYPE_INFO, "transfer %@ completionBlock called with putFile %@ sucess %@ shouldRetry %@ shouldReauthorize %@ error %@", buf, 0x3Eu);
    }
  }
  if (*(void *)(a1 + 88))
  {
    __int16 v28 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v29 = *(void *)(a1 + 48);
    v48[0] = 0;
    v42 = [v28 attributesOfItemAtPath:v29 error:v48];
    v43 = (__CFString *)v48[0];

    if (v43 && IMOSLoggingEnabled())
    {
      __int16 v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        uint64_t v60 = v31;
        __int16 v61 = 2112;
        v62 = v43;
        _os_log_impl(&dword_23CAED000, v30, OS_LOG_TYPE_INFO, "Transfer: Error reading attributes of file %@ (%@)", buf, 0x16u);
      }
    }
    uint64_t v32 = *(void *)(a1 + 88);
    uint64_t v41 = *(void *)(a1 + 48);
    id v33 = [v42 objectForKeyedSubscript:*MEMORY[0x263F080B8]];
    uint64_t v34 = [v33 unsignedIntegerValue];
    v35 = [(__CFString *)v47 requestorID];
    v36 = [(__CFString *)v47 signature];
    v37 = [(__CFString *)v47 requestURL];
    v38 = [v37 absoluteString];
    v39 = [(__CFString *)v47 mmcsError];
    v40 = failReasonStringForMMCSError();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t, void *, void *, void *, void *, void *))(v32 + 16))(v32, v45, v41, v34, v35, v36, v38, v46, v40);
  }
  if (v45 && IMTransferRequestIsForMessages(*(void **)(a1 + 56), *(void **)(a1 + 48)))
  {
    id v22 = [*(id *)(a1 + 48) lastPathComponent];
    IMGreenTeaAttachmentTransmitLoggingFormat();
    goto LABEL_33;
  }
LABEL_34:
}

uint64_t sub_23CAF2860(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_23CAED000, v2, OS_LOG_TYPE_INFO, "Needs to reauthorize, will retry using that: %@", buf, 0xCu);
    }
  }
  return [*(id *)(a1 + 40) _sendFilePath:*(void *)(a1 + 48) topic:*(void *)(a1 + 56) transferID:*(void *)(a1 + 64) sourceAppID:*(void *)(a1 + 72) retryAttemptCount:*(void *)(a1 + 104) + 1 userInfo:*(void *)(a1 + 80) progressBlock:*(void *)(a1 + 88) completionBlock:*(void *)(a1 + 96)];
}

uint64_t sub_23CAF2950(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_23CAF2960(uint64_t a1)
{
}

void sub_23CAF2968(uint64_t a1, int a2)
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    char v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [*(id *)(a1 + 32) guid];
      *(_DWORD *)buf = 138412290;
      v88 = v5;
      _os_log_impl(&dword_23CAED000, v4, OS_LOG_TYPE_INFO, "Registered transfer %@", buf, 0xCu);
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) stopTimingForKey:*(void *)(a1 + 40)];
  if (a2)
  {
    __int16 v69 = objc_alloc_init(FTiMessageRequestMMCSUploadToken);
    if ([*(id *)(a1 + 48) length]) {
      [(IDSBaseMessage *)v69 setTopic:*(void *)(a1 + 48)];
    }
    v68 = [*(id *)(a1 + 32) signature];
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v88 = v68;
        _os_log_impl(&dword_23CAED000, v6, OS_LOG_TYPE_INFO, "Made signature: %@", buf, 0xCu);
      }
    }
    [(FTiMessageRequestMMCSUploadToken *)v69 setSignature:v68];
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "protocolFileSize"));
    [(FTiMessageRequestMMCSUploadToken *)v69 setLength:v7];

    if (!*(unsigned char *)(a1 + 128))
    {
      [(FTiMessageRequestMMCSUploadToken *)v69 setContentVersion:0];
LABEL_41:
      v40 = *(void **)(a1 + 64);
      if (v40)
      {
        uint64_t v41 = [v40 valueForKey:@"sP"];
        [(FTiMessageRequestMMCSUploadToken *)v69 setSenderID:v41];

        v42 = [*(id *)(a1 + 64) valueForKey:@"tP"];
        [(FTiMessageRequestMMCSUploadToken *)v69 setDestinationID:v42];

        v43 = [*(id *)(a1 + 64) valueForKey:@"sI"];
        [(FTiMessageRequestMMCSUploadToken *)v69 setAnonymousSenderID:v43];

        v44 = [*(id *)(a1 + 64) valueForKey:@"sT"];
        [(FTiMessageRequestMMCSUploadToken *)v69 setSessionToken:v44];

        unsigned int v45 = [*(id *)(a1 + 64) valueForKey:@"t"];
        [(FTiMessageRequestMMCSUploadToken *)v69 setPushToken:v45];
      }
      v46 = [MEMORY[0x263EFF910] date];
      if (IMOSLoggingEnabled())
      {
        v47 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          v48 = [*(id *)(a1 + 32) guid];
          *(_DWORD *)buf = 138412546;
          v88 = v48;
          __int16 v89 = 2112;
          v90 = v69;
          _os_log_impl(&dword_23CAED000, v47, OS_LOG_TYPE_INFO, "TransferID %@ Sending upload request: %@", buf, 0x16u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        id v49 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          uint64_t v50 = [MEMORY[0x263F4A880] sharedInstance];
          int v51 = [v50 linkQualityValueForInterfaceType:3];
          *(_DWORD *)buf = 67109120;
          LODWORD(v88) = v51;
          _os_log_impl(&dword_23CAED000, v49, OS_LOG_TYPE_INFO, "  Cell Link Quality: %d", buf, 8u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        id v52 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          id v53 = [MEMORY[0x263F4A880] sharedInstance];
          int v54 = [v53 linkQualityValueForInterfaceType:2];
          *(_DWORD *)buf = 67109120;
          LODWORD(v88) = v54;
          _os_log_impl(&dword_23CAED000, v52, OS_LOG_TYPE_INFO, "  WiFi Link Quality: %d", buf, 8u);
        }
      }
      os_activity_t v55 = _os_activity_create(&dword_23CAED000, "com.apple.messages.MMCSPreAuth", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
      [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) startTimingForKey:*(void *)(a1 + 72)];
      id v56 = +[IMTransferAgentDeliveryController sharedInstance];
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = sub_23CAF3678;
      v70[3] = &unk_264E80D40;
      uint64_t v57 = *(void *)(a1 + 120);
      os_activity_t v71 = v55;
      uint64_t v81 = v57;
      id v72 = *(id *)(a1 + 72);
      id v73 = *(id *)(a1 + 32);
      id v74 = *(id *)(a1 + 80);
      id v58 = *(id *)(a1 + 88);
      uint64_t v59 = *(void *)(a1 + 56);
      id v75 = v58;
      uint64_t v76 = v59;
      id v77 = *(id *)(a1 + 96);
      id v78 = *(id *)(a1 + 104);
      id v60 = *(id *)(a1 + 112);
      char v82 = *(unsigned char *)(a1 + 128);
      id v79 = v60;
      id v80 = v46;
      id v66 = v46;
      __int16 v67 = v55;
      [v56 sendFTMessage:v69 completionBlock:v70];

      uint64_t v21 = v71;
      goto LABEL_56;
    }
    int v8 = [*(id *)(*(void *)(a1 + 56) + 8) getContentHeadersAsString];
    double v9 = [*(id *)(a1 + 32) authRequestData];
    BOOL v10 = v9 == 0;

    if (v10)
    {
      if (IMOSLoggingEnabled())
      {
        v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = [*(id *)(a1 + 32) guid];
          *(_DWORD *)buf = 138412290;
          v88 = v37;
          _os_log_impl(&dword_23CAED000, v36, OS_LOG_TYPE_INFO, "Tried to send Madrid AuthPut, but could not fetch content body for transfer: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (v8)
      {
        [(FTiMessageRequestMMCSUploadToken *)v69 setContentVersion:2];
        id v11 = [*(id *)(a1 + 32) authRequestData];
        [(FTiMessageRequestMMCSUploadToken *)v69 setContentBody:v11];

        [(FTiMessageRequestMMCSUploadToken *)v69 setContentHeaders:v8];
LABEL_40:

        goto LABEL_41;
      }
      if (IMOSLoggingEnabled())
      {
        v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v39 = [*(id *)(a1 + 32) guid];
          *(_DWORD *)buf = 138412290;
          v88 = v39;
          _os_log_impl(&dword_23CAED000, v38, OS_LOG_TYPE_INFO, "Tried to send Madrid AuthPut, but could not fetch content header for transfer: %@", buf, 0xCu);
        }
      }
    }
    [(FTiMessageRequestMMCSUploadToken *)v69 setContentVersion:0];
    goto LABEL_40;
  }
  [*(id *)(*(void *)(a1 + 56) + 8) unregisterFiles:*(void *)(a1 + 96)];
  if (IMOSLoggingEnabled())
  {
    int v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v88 = v13;
      _os_log_impl(&dword_23CAED000, v12, OS_LOG_TYPE_INFO, "Failed registering transfer: %@", buf, 0xCu);
    }
  }
  __int16 v69 = [*(id *)(a1 + 32) completionBlock];
  if (v69) {
    ((void (*)(FTiMessageRequestMMCSUploadToken *, void, void, void, void, void))v69->super.super._topic)(v69, *(void *)(a1 + 32), 0, 0, 0, 0);
  }
  uint64_t v85 = *MEMORY[0x263F4ACA8];
  uint64_t v14 = [NSNumber numberWithLong:44];
  v86 = v14;
  __int16 v65 = [NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];

  uint64_t v15 = [MEMORY[0x263F4AFD0] sharedInstance];
  [v15 trackEvent:*MEMORY[0x263F4ACB8] withDictionary:v65];

  id v16 = [MEMORY[0x263F3BB40] sharedInstance];
  int v17 = [v16 wiFiActiveAndReachable];

  if (v17) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = 3;
  }
  uint64_t v19 = NSNumber;
  id v20 = [MEMORY[0x263F4A880] sharedInstance];
  __int16 v67 = objc_msgSend(v19, "numberWithInt:", objc_msgSend(v20, "linkQualityValueForInterfaceType:", v18));

  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "protocolFileSize"));
  id v66 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = parseMMCSError();
  v83[0] = *MEMORY[0x263F4AD38];
  uint64_t v64 = [NSNumber numberWithLong:0];
  v84[0] = v64;
  v83[1] = *MEMORY[0x263F4AD70];
  __int16 v63 = [NSNumber numberWithLong:0];
  v84[1] = v63;
  v83[2] = *MEMORY[0x263F4AD98];
  uint64_t v61 = [NSNumber numberWithLong:1];
  v84[2] = v61;
  uint64_t v22 = *MEMORY[0x263F4AD68];
  v83[3] = *MEMORY[0x263F4AD58];
  v83[4] = v22;
  v84[3] = &unk_26F0BAF28;
  v84[4] = v67;
  v83[5] = *MEMORY[0x263F4AC98];
  if (v17) {
    uint64_t v23 = 2;
  }
  else {
    uint64_t v23 = 1;
  }
  v24 = objc_msgSend(NSNumber, "numberWithLong:", v23, v61);
  v84[5] = v24;
  uint64_t v25 = *MEMORY[0x263F4AC90];
  v84[6] = v66;
  uint64_t v26 = *MEMORY[0x263F4AD20];
  v83[6] = v25;
  v83[7] = v26;
  id v27 = [v21 objectAtIndexedSubscript:0];
  v84[7] = v27;
  v83[8] = *MEMORY[0x263F4AD18];
  __int16 v28 = [v21 objectAtIndexedSubscript:1];
  v84[8] = v28;
  v83[9] = *MEMORY[0x263F4AD80];
  uint64_t v29 = [v21 objectAtIndexedSubscript:2];
  v84[9] = v29;
  v83[10] = *MEMORY[0x263F4AD78];
  __int16 v30 = [v21 objectAtIndexedSubscript:3];
  v84[10] = v30;
  v83[11] = *MEMORY[0x263F4AD90];
  uint64_t v31 = [v21 objectAtIndexedSubscript:4];
  v84[11] = v31;
  v83[12] = *MEMORY[0x263F4AD88];
  uint64_t v32 = [v21 objectAtIndexedSubscript:5];
  v84[12] = v32;
  v83[13] = *MEMORY[0x263F4AD30];
  id v33 = [v21 objectAtIndexedSubscript:6];
  v84[13] = v33;
  v83[14] = *MEMORY[0x263F4AD28];
  uint64_t v34 = [v21 objectAtIndexedSubscript:7];
  v84[14] = v34;
  v68 = [NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:15];

  v35 = [MEMORY[0x263F4AFD0] sharedInstance];
  [v35 trackEvent:*MEMORY[0x263F4ACC8] withDictionary:v68];

LABEL_56:
}

void sub_23CAF35BC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x23CAF3154);
  }
  _Unwind_Resume(a1);
}

void sub_23CAF3678(uint64_t a1, void *a2, void *a3, int a4, unsigned int a5)
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v87 = a2;
  id v9 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) stopTimingForKey:*(void *)(a1 + 40)];
  id v90 = v9;
  uint64_t v10 = [v90 responseContentVersion];
  if ([v90 contentVersion] >= 1 && v10 >= 1)
  {
    id v11 = (void *)MEMORY[0x263F535A0];
    int v12 = [v90 responseContentHeaders];
    v13 = [v11 parseContentHeaderAsDictionary:v12 treatValuesAsArrays:v10 == 1];

    uint64_t v14 = *(void **)(a1 + 48);
    uint64_t v15 = [v13 objectForKeyedSubscript:@"x-apple-mmcs-proto-version"];
    id v16 = [v15 firstObject];
    [v14 setProtocolVersion:v16];

    int v17 = [*(id *)(a1 + 48) protocolVersion];
    LODWORD(v15) = v17 == 0;

    if (v15)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = [v90 responseContentHeaders];
          id v20 = [*(id *)(a1 + 48) guid];
          *(_DWORD *)buf = 134218498;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v19;
          *(_WORD *)&unsigned char buf[22] = 2112;
          v106 = v20;
          _os_log_impl(&dword_23CAED000, v18, OS_LOG_TYPE_INFO, "Madrid responded with 'cV': %tu, but no protocol version was found in header: %@ (transfer: %@)", buf, 0x20u);
        }
      }
      a4 = 0;
      a5 = 17;
    }
    uint64_t v21 = *(void **)(a1 + 48);
    uint64_t v22 = [v90 responseContentBody];
    [v21 setAuthResponseData:v22];

    uint64_t v23 = [*(id *)(a1 + 48) authResponseData];
    LODWORD(v22) = v23 == 0;

    if (v22)
    {
      if (IMOSLoggingEnabled())
      {
        v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          id v25 = [v90 responseContentBody];
          uint64_t v26 = [*(id *)(a1 + 48) guid];
          *(_DWORD *)buf = 134218498;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v25;
          *(_WORD *)&unsigned char buf[22] = 2112;
          v106 = v26;
          _os_log_impl(&dword_23CAED000, v24, OS_LOG_TYPE_INFO, "Madrid responded with 'cV': %tu, but no auth data was found in header: %@ (transfer: %@)", buf, 0x20u);
        }
      }
      a4 = 0;
      a5 = 17;
    }
  }
  if ([v90 contentVersion] != v10 && IMOSLoggingEnabled())
  {
    id v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = [v90 contentVersion];
      uint64_t v29 = [*(id *)(a1 + 48) guid];
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v28;
      *(_WORD *)&unsigned char buf[22] = 2112;
      v106 = v29;
      _os_log_impl(&dword_23CAED000, v27, OS_LOG_TYPE_INFO, "Madrid responded with 'cV': %tu, but we requested a 'cV': %tu (transfer: %@)", buf, 0x20u);
    }
  }
  if (a4)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = [*(id *)(a1 + 48) guid];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v31;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v90;
        _os_log_impl(&dword_23CAED000, v30, OS_LOG_TYPE_INFO, "TransferID %@ Finished sending mmcs upload request: %@", buf, 0x16u);
      }
    }
    __int16 v89 = [v90 responseAuthToken];
    id v32 = [v90 responseRequestURL];
    uint64_t v91 = [v90 responseRequestorID];
    if (IMOSLoggingEnabled())
    {
      id v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v89;
        _os_log_impl(&dword_23CAED000, v33, OS_LOG_TYPE_INFO, "    Auth token: %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v32;
        _os_log_impl(&dword_23CAED000, v34, OS_LOG_TYPE_INFO, "   Request URL: %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v91;
        _os_log_impl(&dword_23CAED000, v35, OS_LOG_TYPE_INFO, "      Owner ID: %@", buf, 0xCu);
      }
    }
    if (v32) {
      uint64_t v36 = [v32 rangeOfString:@"://"];
    }
    else {
      uint64_t v36 = -1;
    }
    uint64_t v37 = (uint64_t)v32;
    if (v36 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v37 = [NSString stringWithFormat:@"http://%@", v32];
    }
    v88 = (void *)v37;
    if (v37)
    {
      uint64_t v38 = [NSString stringWithFormat:@"%@/%@", v37, v91];

      id v32 = (id)v38;
    }
    unsigned int v85 = a5;
    if (v32)
    {
      v39 = [NSURL URLWithString:v32];
    }
    else
    {
      v39 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        uint64_t v41 = [*(id *)(a1 + 48) guid];
        uint64_t v42 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138413314;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v42;
        *(_WORD *)&unsigned char buf[22] = 2112;
        v106 = v91;
        *(_WORD *)v107 = 2112;
        *(void *)&v107[2] = v39;
        *(_WORD *)&v107[10] = 2112;
        *(void *)&v107[12] = v89;
        _os_log_impl(&dword_23CAED000, v40, OS_LOG_TYPE_INFO, "Request to send transfer: %@ %@   requestorID: %@  requestURL: %@  auth token: %@", buf, 0x34u);
      }
    }
    [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) startTimingForKey:*(void *)(a1 + 64)];
    id v83 = v32;
    v43 = _os_activity_create(&dword_23CAED000, "com.apple.messages.MMCSPutFile", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3010000000;
    *(void *)v107 = 0;
    *(void *)&v107[8] = 0;
    v106 = &unk_23CB0C613;
    os_activity_scope_enter(v43, (os_activity_scope_state_t)v107);
    uint64_t v44 = *(void *)(a1 + 80);
    unsigned int v45 = *(void **)(*(void *)(a1 + 72) + 8);
    uint64_t v46 = *(void *)(a1 + 88);
    uint64_t v47 = *(void *)(a1 + 96);
    char v48 = *(unsigned char *)(a1 + 120);
    v92[0] = MEMORY[0x263EF8330];
    v92[1] = 3221225472;
    v92[2] = sub_23CAF44E0;
    v92[3] = &unk_264E80D18;
    id v49 = *(id *)(a1 + 48);
    uint64_t v50 = *(void *)(a1 + 112);
    id v93 = v49;
    uint64_t v97 = v50;
    id v94 = *(id *)(a1 + 64);
    id v51 = *(id *)(a1 + 104);
    unsigned int v99 = v85;
    v98 = buf;
    uint64_t v52 = *(void *)(a1 + 72);
    id v95 = v51;
    uint64_t v96 = v52;
    LOBYTE(v79) = v48;
    [v45 putFiles:v44 requestURL:v39 requestorID:v91 transferID:v46 sourceAppID:v47 authToken:v89 preauthenticate:v79 completionBlock:v92];

    id v53 = v83;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    [*(id *)(*(void *)(a1 + 72) + 8) unregisterFiles:*(void *)(a1 + 80)];
    if (IMOSLoggingEnabled())
    {
      int v54 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v90;
        _os_log_impl(&dword_23CAED000, v54, OS_LOG_TYPE_INFO, "Failed sending mmcs upload request: %@", buf, 0xCu);
      }
    }
    uint64_t v103 = *MEMORY[0x263F4ACA8];
    os_activity_t v55 = [NSNumber numberWithLong:45];
    v104 = v55;
    uint64_t v56 = [NSDictionary dictionaryWithObjects:&v104 forKeys:&v103 count:1];

    uint64_t v57 = [MEMORY[0x263F4AFD0] sharedInstance];
    [v57 trackEvent:*MEMORY[0x263F4ACB8] withDictionary:v56];

    id v58 = [MEMORY[0x263F3BB40] sharedInstance];
    int v59 = [v58 wiFiActiveAndReachable];

    id v60 = NSNumber;
    uint64_t v61 = [MEMORY[0x263F4A880] sharedInstance];
    id v62 = v61;
    if (v59) {
      uint64_t v63 = 2;
    }
    else {
      uint64_t v63 = 3;
    }
    v88 = objc_msgSend(v60, "numberWithInt:", objc_msgSend(v61, "linkQualityValueForInterfaceType:", v63));

    id v80 = (void *)v56;
    id v53 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 48), "protocolFileSize"));
    uint64_t v91 = parseMMCSError();
    v101[0] = *MEMORY[0x263F4AD38];
    v86 = [NSNumber numberWithLong:a5];
    v102[0] = v86;
    v101[1] = *MEMORY[0x263F4AD70];
    v84 = [NSNumber numberWithLong:0];
    v102[1] = v84;
    v101[2] = *MEMORY[0x263F4AD98];
    char v82 = [NSNumber numberWithLong:2];
    uint64_t v64 = *MEMORY[0x263F4AD58];
    v102[2] = v82;
    v102[3] = &unk_26F0BAF28;
    uint64_t v65 = *MEMORY[0x263F4AD68];
    v101[3] = v64;
    v101[4] = v65;
    v102[4] = v88;
    v101[5] = *MEMORY[0x263F4AC98];
    if (v59) {
      uint64_t v66 = 2;
    }
    else {
      uint64_t v66 = 1;
    }
    uint64_t v81 = [NSNumber numberWithLong:v66];
    uint64_t v67 = *MEMORY[0x263F4AC90];
    v102[5] = v81;
    v102[6] = v53;
    uint64_t v68 = *MEMORY[0x263F4AD20];
    v101[6] = v67;
    v101[7] = v68;
    __int16 v69 = [v91 objectAtIndexedSubscript:0];
    v102[7] = v69;
    v101[8] = *MEMORY[0x263F4AD18];
    v70 = [v91 objectAtIndexedSubscript:1];
    v102[8] = v70;
    v101[9] = *MEMORY[0x263F4AD80];
    os_activity_t v71 = [v91 objectAtIndexedSubscript:2];
    v102[9] = v71;
    v101[10] = *MEMORY[0x263F4AD78];
    id v72 = [v91 objectAtIndexedSubscript:3];
    v102[10] = v72;
    v101[11] = *MEMORY[0x263F4AD90];
    id v73 = [v91 objectAtIndexedSubscript:4];
    v102[11] = v73;
    v101[12] = *MEMORY[0x263F4AD88];
    id v74 = [v91 objectAtIndexedSubscript:5];
    v102[12] = v74;
    v101[13] = *MEMORY[0x263F4AD30];
    id v75 = [v91 objectAtIndexedSubscript:6];
    v102[13] = v75;
    v101[14] = *MEMORY[0x263F4AD28];
    uint64_t v76 = [v91 objectAtIndexedSubscript:7];
    v102[14] = v76;
    __int16 v89 = [NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:15];

    id v77 = [MEMORY[0x263F4AFD0] sharedInstance];
    [v77 trackEvent:*MEMORY[0x263F4ACC8] withDictionary:v89];

    uint64_t v78 = [*(id *)(a1 + 48) completionBlock];
    v39 = (void *)v78;
    if (v78) {
      (*(void (**)(uint64_t, void, void, void, void, void))(v78 + 16))(v78, *(void *)(a1 + 48), 0, 0, 0, 0);
    }
  }

  os_activity_scope_leave(&state);
}

void sub_23CAF44E0(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  double v78 = COERCE_DOUBLE(a2);
  id v79 = a4;
  objc_msgSend(*(id *)(a1 + 32), "setMMCSError:");
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) stopTimingForKey:*(void *)(a1 + 40)];
  uint64_t v80 = a1;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = [*(id *)(v80 + 32) guid];
      double v9 = *(double *)(*(void *)(*(void *)(v80 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      double v90 = *(double *)&v8;
      __int16 v91 = 2112;
      double v92 = v9;
      _os_log_impl(&dword_23CAED000, v7, OS_LOG_TYPE_INFO, "Upload timing for transfer ID %@ %@", buf, 0x16u);
    }
    a1 = v80;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

  int v12 = [MEMORY[0x263EFF910] date];
  [v12 timeIntervalSinceDate:*(void *)(v80 + 48)];
  double v14 = v13;

  if (a3)
  {
    double v15 = 0.0;
    if (v14 > 0.0) {
      double v15 = (double)(unint64_t)[*(id *)(v80 + 32) protocolFileSize] / v14 * 0.0009765625;
    }
    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        double v90 = v78;
        __int16 v91 = 2048;
        double v92 = v14;
        __int16 v93 = 2048;
        double v94 = v15;
        _os_log_impl(&dword_23CAED000, v16, OS_LOG_TYPE_INFO, "Finished upload request for files: %@  upload time was: %f  speed: %.0f kb/s", buf, 0x20u);
      }
    }
    uint64_t v87 = *MEMORY[0x263F4ACA8];
    int v17 = [NSNumber numberWithLong:0];
    v88 = v17;
    id v73 = [NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];

    uint64_t v18 = [MEMORY[0x263F4AFD0] sharedInstance];
    [v18 trackEvent:*MEMORY[0x263F4ACB8] withDictionary:v73];

    id v77 = [NSNumber numberWithDouble:v14];
    uint64_t v76 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(v80 + 32), "protocolFileSize"));
    id v19 = [MEMORY[0x263F3BB40] sharedInstance];
    int v20 = [v19 wiFiActiveAndReachable];

    if (v20) {
      uint64_t v21 = 2;
    }
    else {
      uint64_t v21 = 3;
    }
    uint64_t v22 = NSNumber;
    uint64_t v23 = [MEMORY[0x263F4A880] sharedInstance];
    id v75 = objc_msgSend(v22, "numberWithInt:", objc_msgSend(v23, "linkQualityValueForInterfaceType:", v21));

    v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v79, "code"));
    id v25 = parseMMCSError();
    v85[0] = *MEMORY[0x263F4AD38];
    os_activity_t v71 = [NSNumber numberWithLong:*(unsigned int *)(v80 + 80)];
    v86[0] = v71;
    v85[1] = *MEMORY[0x263F4AD70];
    __int16 v69 = [NSNumber numberWithLong:0];
    v86[1] = v69;
    v85[2] = *MEMORY[0x263F4AD98];
    uint64_t v67 = [NSNumber numberWithLong:0];
    v86[2] = v67;
    uint64_t v26 = *MEMORY[0x263F4ADA0];
    v85[3] = *MEMORY[0x263F4AD58];
    v85[4] = v26;
    v86[3] = v24;
    v86[4] = v77;
    uint64_t v27 = *MEMORY[0x263F4AD68];
    v86[5] = v75;
    uint64_t v28 = *MEMORY[0x263F4AC98];
    v85[5] = v27;
    v85[6] = v28;
    if (v20) {
      uint64_t v29 = 2;
    }
    else {
      uint64_t v29 = 1;
    }
    uint64_t v65 = [NSNumber numberWithLong:v29];
    v86[6] = v65;
    uint64_t v30 = *MEMORY[0x263F4AC90];
    v86[7] = v76;
    uint64_t v31 = *MEMORY[0x263F4AD20];
    v85[7] = v30;
    v85[8] = v31;
    uint64_t v63 = [v25 objectAtIndexedSubscript:0];
    v86[8] = v63;
    v85[9] = *MEMORY[0x263F4AD18];
    id v32 = [v25 objectAtIndexedSubscript:1];
    v86[9] = v32;
    v85[10] = *MEMORY[0x263F4AD80];
    id v33 = [v25 objectAtIndexedSubscript:2];
    v86[10] = v33;
    v85[11] = *MEMORY[0x263F4AD78];
    uint64_t v34 = [v25 objectAtIndexedSubscript:3];
    v86[11] = v34;
    v85[12] = *MEMORY[0x263F4AD90];
    v35 = [v25 objectAtIndexedSubscript:4];
    v86[12] = v35;
    v85[13] = *MEMORY[0x263F4AD88];
    uint64_t v36 = [v25 objectAtIndexedSubscript:5];
    v86[13] = v36;
    v85[14] = *MEMORY[0x263F4AD30];
    uint64_t v37 = [v25 objectAtIndexedSubscript:6];
    v86[14] = v37;
    v85[15] = *MEMORY[0x263F4AD28];
    uint64_t v38 = [v25 objectAtIndexedSubscript:7];
    v86[15] = v38;
    v39 = [NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:16];

    v40 = [MEMORY[0x263F4AFD0] sharedInstance];
    [v40 trackEvent:*MEMORY[0x263F4ACC8] withDictionary:v39];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v41 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        double v90 = *(double *)&v79;
        __int16 v91 = 2112;
        double v92 = v78;
        __int16 v93 = 2048;
        double v94 = v14;
        _os_log_impl(&dword_23CAED000, v41, OS_LOG_TYPE_INFO, "Failed upload request: %@   files: %@   upload time was: %f", buf, 0x20u);
      }
    }
    uint64_t v83 = *MEMORY[0x263F4ACA8];
    uint64_t v42 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v79, "code"));
    v84 = v42;
    id v74 = [NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];

    v43 = [MEMORY[0x263F4AFD0] sharedInstance];
    [v43 trackEvent:*MEMORY[0x263F4ACB8] withDictionary:v74];

    uint64_t v44 = [MEMORY[0x263F3BB40] sharedInstance];
    int v45 = [v44 wiFiActiveAndReachable];

    if (v45) {
      uint64_t v46 = 2;
    }
    else {
      uint64_t v46 = 3;
    }
    uint64_t v47 = NSNumber;
    char v48 = [MEMORY[0x263F4A880] sharedInstance];
    id v77 = objc_msgSend(v47, "numberWithInt:", objc_msgSend(v48, "linkQualityValueForInterfaceType:", v46));

    uint64_t v76 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(v80 + 32), "protocolFileSize"));
    id v75 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v79, "code"));
    v24 = parseMMCSError();
    id v25 = [NSNumber numberWithDouble:v14];
    v81[0] = *MEMORY[0x263F4AD38];
    id v72 = [NSNumber numberWithLong:*(unsigned int *)(v80 + 80)];
    v82[0] = v72;
    v81[1] = *MEMORY[0x263F4AD70];
    v70 = [NSNumber numberWithLong:0];
    v82[1] = v70;
    v81[2] = *MEMORY[0x263F4AD98];
    uint64_t v68 = [NSNumber numberWithLong:0];
    v82[2] = v68;
    uint64_t v49 = *MEMORY[0x263F4ADA0];
    v81[3] = *MEMORY[0x263F4AD58];
    v81[4] = v49;
    v82[3] = v75;
    v82[4] = v25;
    uint64_t v50 = *MEMORY[0x263F4AD68];
    v82[5] = v77;
    uint64_t v51 = *MEMORY[0x263F4AC98];
    v81[5] = v50;
    v81[6] = v51;
    if (v45) {
      uint64_t v52 = 2;
    }
    else {
      uint64_t v52 = 1;
    }
    uint64_t v66 = [NSNumber numberWithLong:v52];
    v82[6] = v66;
    uint64_t v53 = *MEMORY[0x263F4AC90];
    v82[7] = v76;
    uint64_t v54 = *MEMORY[0x263F4AD20];
    v81[7] = v53;
    v81[8] = v54;
    uint64_t v64 = [v24 objectAtIndexedSubscript:0];
    v82[8] = v64;
    v81[9] = *MEMORY[0x263F4AD18];
    os_activity_t v55 = [v24 objectAtIndexedSubscript:1];
    v82[9] = v55;
    v81[10] = *MEMORY[0x263F4AD80];
    uint64_t v56 = [v24 objectAtIndexedSubscript:2];
    v82[10] = v56;
    v81[11] = *MEMORY[0x263F4AD78];
    uint64_t v57 = [v24 objectAtIndexedSubscript:3];
    v82[11] = v57;
    v81[12] = *MEMORY[0x263F4AD90];
    id v58 = [v24 objectAtIndexedSubscript:4];
    v82[12] = v58;
    v81[13] = *MEMORY[0x263F4AD88];
    int v59 = [v24 objectAtIndexedSubscript:5];
    v82[13] = v59;
    v81[14] = *MEMORY[0x263F4AD30];
    id v60 = [v24 objectAtIndexedSubscript:6];
    v82[14] = v60;
    v81[15] = *MEMORY[0x263F4AD28];
    uint64_t v61 = [v24 objectAtIndexedSubscript:7];
    v82[15] = v61;
    v39 = [NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:16];

    id v62 = [MEMORY[0x263F4AFD0] sharedInstance];
    [v62 trackEvent:*MEMORY[0x263F4ACC8] withDictionary:v39];

    v40 = [*(id *)(v80 + 32) completionBlock];
    os_activity_scope_leave((os_activity_scope_state_t)(*(void *)(*(void *)(v80 + 72) + 8) + 32));
    if (v40) {
      v40[2](v40, *(void *)(v80 + 32), 0, 0, 0, 0);
    }
  }

  [*(id *)(*(void *)(v80 + 56) + 8) unregisterFiles:*(void *)&v78];
}

void sub_23CAF5788(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  im_assert_primary_queue();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_23CAF58C8;
  v10[3] = &unk_264E80D90;
  id v12 = *(id *)(a1 + 80);
  id v7 = v6;
  id v11 = v7;
  char v13 = *(unsigned char *)(a1 + 104);
  int v8 = (void *)MEMORY[0x23ECF1F70](v10);
  if (!*(void *)(a1 + 32) || *(void *)(a1 + 96) >> 20)
  {
    [*(id *)(a1 + 64) _sendFilePath:v5 topic:*(void *)(a1 + 40) transferID:*(void *)(a1 + 48) sourceAppID:*(void *)(a1 + 56) retryAttemptCount:0 userInfo:*(void *)(a1 + 72) progressBlock:*(void *)(a1 + 88) completionBlock:v8];
  }
  else
  {
    double v9 = +[IMTransferAgentIDSInterface sharedInstance];
    [v9 remoteUploadFileRequest:v5 topic:*(void *)(a1 + 40) transferID:*(void *)(a1 + 48) sourceAppID:*(void *)(a1 + 56) completionBlock:v8];
  }
}

void sub_23CAF58C8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  im_assert_primary_queue();
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2);
  if (*(unsigned char *)(a1 + 48))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v15;
        _os_log_impl(&dword_23CAED000, v21, OS_LOG_TYPE_INFO, "Cleaning up encrypted attachment path: %@", buf, 0xCu);
      }
    }
    if (v15)
    {
      uint64_t v22 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v23 = [NSURL fileURLWithPath:v15];
      id v27 = 0;
      char v24 = [v22 removeItemAtURL:v23 error:&v27];
      id v25 = v27;

      if ((v24 & 1) == 0 && IMOSLoggingEnabled())
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v29 = v15;
          __int16 v30 = 2112;
          id v31 = v25;
          _os_log_impl(&dword_23CAED000, v26, OS_LOG_TYPE_INFO, "Error cleaning up encrypted attachment path: %@  error: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v25 = 0;
    }
  }
}

void sub_23CAF5B3C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7 = a5;
  id v8 = a4;
  im_assert_primary_queue();
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [v8 path];

  (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v10, v7);
}

void sub_23CAF689C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x23CAF643CLL);
  }
  _Block_object_dispose((const void *)(v2 - 176), 8);
  objc_destroyWeak((id *)(v2 - 232));
  _Unwind_Resume(a1);
}

void sub_23CAF6984(uint64_t a1, void *a2, double a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 134218242;
      double v9 = a3;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_23CAED000, v6, OS_LOG_TYPE_INFO, "Received MMCS transfer progress updated to %0.02f  (%@)", (uint8_t *)&v8, 0x16u);
    }
  }
  if (*(void *)(a1 + 40))
  {
    [v5 protocolFileSize];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_23CAF6AB4(uint64_t a1, void *a2, uint64_t a3, char a4, int a5, void *a6)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    char v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = qos_class_self();
      _os_log_impl(&dword_23CAED000, v13, OS_LOG_TYPE_INFO, "Handling MMCSGetFile completion at qos (%u)", buf, 8u);
    }
  }
  id WeakRetained = (__CFString *)objc_loadWeakRetained((id *)(a1 + 128));
  int v15 = IMOSLoggingEnabled();
  if (a3)
  {
    if (v15)
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v44 = WeakRetained;
        _os_log_impl(&dword_23CAED000, v16, OS_LOG_TYPE_INFO, "Receiving file transfer complete: %@", buf, 0xCu);
      }
    }
    id v17 = [(__CFString *)WeakRetained localPath];
    IMGreenTeaAttachmentReadLoggingFormat();
  }
  else if (v15)
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v44 = WeakRetained;
      __int16 v45 = 2112;
      *(void *)uint64_t v46 = v12;
      _os_log_impl(&dword_23CAED000, v18, OS_LOG_TYPE_INFO, "Receiving file transfer failed: %@    error: %@", buf, 0x16u);
    }
  }
  if (a4) {
    int v19 = 1;
  }
  else {
    int v19 = sub_23CAF1844(v12);
  }
  if (*(int *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) < 3) {
    int v20 = v19;
  }
  else {
    int v20 = 0;
  }
  if (a5 && !*(unsigned char *)(a1 + 144)) {
    int v20 = 0;
  }
  if ((a3 & 1) == 0 && IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = @"NO";
      if (v20) {
        uint64_t v22 = @"YES";
      }
      int v23 = *(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
      *(_DWORD *)buf = 138412802;
      uint64_t v44 = v22;
      __int16 v45 = 1024;
      *(_DWORD *)uint64_t v46 = v23;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = 3;
      _os_log_impl(&dword_23CAED000, v21, OS_LOG_TYPE_INFO, "File transfer downloads failed!  Should retry: %@   Retries: %d  Max Retries: %d", buf, 0x18u);
    }
  }
  if (v20)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
    id v32 = *(id *)(a1 + 32);
    id v33 = *(id *)(a1 + 48);
    id v34 = *(id *)(a1 + 56);
    id v35 = *(id *)(a1 + 64);
    id v36 = *(id *)(a1 + 72);
    id v37 = *(id *)(a1 + 80);
    id v38 = *(id *)(a1 + 88);
    id v41 = *(id *)(a1 + 96);
    id v42 = *(id *)(a1 + 104);
    v39 = WeakRetained;
    id v40 = v11;
    im_dispatch_after_primary_queue();

    char v24 = v32;
LABEL_37:

    goto LABEL_38;
  }
  uint64_t v25 = *(void *)(*(void *)(a1 + 120) + 8);
  uint64_t v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = 0;

  uint64_t v27 = *(void *)(a1 + 104);
  if (v27)
  {
    uint64_t v28 = *(void *)(a1 + 32);
    uint64_t v29 = *(void *)(a1 + 56);
    __int16 v30 = [v11 mmcsError];
    id v31 = failReasonStringForMMCSError();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, id, void *))(v27 + 16))(v27, v28, v29, a3, v12, v31);
  }
  if (a3)
  {
    char v24 = [(__CFString *)WeakRetained localPath];
    IMGreenTeaAttachmentReadLoggingFormat();
    goto LABEL_37;
  }
LABEL_38:
}

void sub_23CAF7018(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 152);
  int v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      char v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v5;
        _os_log_impl(&dword_23CAED000, v4, OS_LOG_TYPE_INFO, "Needs to re-authorize, will retry using that: %@", buf, 0xCu);
      }
    }
    LOBYTE(v14) = 0;
    [*(id *)(a1 + 40) _receiveFileTransfer:*(void *)(a1 + 32) topic:*(void *)(a1 + 48) path:*(void *)(a1 + 56) requestURLString:*(void *)(a1 + 64) ownerID:*(void *)(a1 + 72) signature:*(void *)(a1 + 80) allowReauthorize:v14 fileSize:*(void *)(a1 + 144) sourceAppID:*(void *)(a1 + 88) progressBlock:*(void *)(a1 + 112) completionBlock:*(void *)(a1 + 120)];
  }
  else
  {
    if (v3)
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v7;
        _os_log_impl(&dword_23CAED000, v6, OS_LOG_TYPE_INFO, "Re-registering files: %@", buf, 0xCu);
      }
    }
    uint64_t v8 = *(void *)(a1 + 40);
    double v9 = *(void **)(v8 + 8);
    uint64_t v10 = *(void *)(a1 + 128);
    uint64_t v11 = *(void *)(*(void *)(v10 + 8) + 40);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_23CAF7260;
    v15[3] = &unk_264E80E58;
    uint64_t v19 = v10;
    v15[4] = v8;
    id v16 = *(id *)(a1 + 96);
    id v17 = *(id *)(a1 + 88);
    id v12 = *(id *)(a1 + 104);
    uint64_t v13 = *(void *)(a1 + 136);
    id v18 = v12;
    uint64_t v20 = v13;
    [v9 registerFilesForDownload:v11 completionBlock:v15];
  }
}

void sub_23CAF7260(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    int v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v3;
      _os_log_impl(&dword_23CAED000, v2, OS_LOG_TYPE_INFO, "Getting transfers: %@", buf, 0xCu);
    }
  }
  char v4 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v6 = [*(id *)(a1 + 40) requestURL];
  uint64_t v7 = [*(id *)(a1 + 40) requestorID];
  uint64_t v8 = *(void *)(a1 + 48);
  double v9 = [*(id *)(a1 + 40) authToken];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_23CAF743C;
  v13[3] = &unk_264E80E30;
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v12 = *(void *)(a1 + 32);
  id v14 = v10;
  uint64_t v15 = v12;
  uint64_t v16 = v11;
  [v4 getFiles:v5 requestURL:v6 requestorID:v7 sourceAppID:v8 authToken:v9 completionBlock:v13];
}

void sub_23CAF743C(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  [*(id *)(a1 + 32) setMMCSError:v8];
  int v9 = IMOSLoggingEnabled();
  if (a3)
  {
    if (v9)
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        int v13 = 138412546;
        id v14 = v7;
        __int16 v15 = 1024;
        LODWORD(v16) = v11;
        _os_log_impl(&dword_23CAED000, v10, OS_LOG_TYPE_INFO, "Finished download request for files: %@     retry: %d", (uint8_t *)&v13, 0x12u);
      }
LABEL_9:
    }
  }
  else if (v9)
  {
    id v10 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      int v13 = 138412802;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 1024;
      int v18 = v12;
      _os_log_impl(&dword_23CAED000, v10, OS_LOG_TYPE_INFO, "Failed download request: %@   files: %@   retry: %d", (uint8_t *)&v13, 0x1Cu);
    }
    goto LABEL_9;
  }
  [*(id *)(*(void *)(a1 + 40) + 8) unregisterFiles:v7];
}

void sub_23CAF75F0(uint64_t a1, int a2)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) stopTimingForKey:*(void *)(a1 + 32)];
  if (a2)
  {
    char v4 = objc_alloc_init(FTiMessageRequestMMCSDownloadToken);
    if ([*(id *)(a1 + 40) length]) {
      [(IDSBaseMessage *)v4 setTopic:*(void *)(a1 + 40)];
    }
    [(FTiMessageRequestMMCSDownloadToken *)v4 setOwner:*(void *)(a1 + 48)];
    [(FTiMessageRequestMMCSDownloadToken *)v4 setSignature:*(void *)(a1 + 56)];
    uint64_t v52 = v4;
    if (IMOptOutOfOptimizedMadridAttachmentDownloadPath())
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          id v6 = *(void **)(a1 + 64);
          *(_DWORD *)buf = 138412290;
          id v71 = v6;
          _os_log_impl(&dword_23CAED000, v5, OS_LOG_TYPE_INFO, "Opting download with GUID %@ out of optimized AuthGet flow.", buf, 0xCu);
        }

        char v4 = v52;
      }
      [(FTiMessageRequestMMCSDownloadToken *)v4 setContentVersion:0];
      goto LABEL_29;
    }
    __int16 v30 = [*(id *)(*(void *)(a1 + 72) + 8) getContentHeadersAsString];
    if (v30)
    {
      [(FTiMessageRequestMMCSDownloadToken *)v4 setContentVersion:2];
      id v31 = NSString;
      id v32 = [*(id *)(a1 + 80) scheme];
      id v33 = [*(id *)(a1 + 80) host];
      id v34 = [v31 stringWithFormat:@"%@://%@", v32, v33];
      [(FTiMessageRequestMMCSDownloadToken *)v52 setAuthURLString:v34];

      [(FTiMessageRequestMMCSDownloadToken *)v52 setContentHeaders:v30];
      if (IMOSLoggingEnabled())
      {
        id v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          id v36 = [(FTiMessageRequestMMCSDownloadToken *)v52 contentHeaders];
          id v37 = [(FTiMessageRequestMMCSDownloadToken *)v52 messageBody];
          uint64_t v38 = *(void *)(a1 + 64);
          *(_DWORD *)buf = 138412802;
          id v71 = v36;
          __int16 v72 = 2112;
          id v73 = v37;
          __int16 v74 = 2112;
          uint64_t v75 = v38;
          _os_log_impl(&dword_23CAED000, v35, OS_LOG_TYPE_INFO, "Sending Madrid AuthGet with content headers: %@ body:%@ for transfer: %@", buf, 0x20u);
        }
LABEL_27:
      }
    }
    else
    {
      [(FTiMessageRequestMMCSDownloadToken *)v4 setContentVersion:0];
      if (IMOSLoggingEnabled())
      {
        id v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v39 = *(void **)(a1 + 64);
          *(_DWORD *)buf = 138412290;
          id v71 = v39;
          _os_log_impl(&dword_23CAED000, v35, OS_LOG_TYPE_INFO, "Tried to send Madrid AuthGet, but could not fetch content header for transfer: %@", buf, 0xCu);
        }
        goto LABEL_27;
      }
    }

LABEL_29:
    id v40 = [MEMORY[0x263EFF910] date];
    os_activity_t v41 = _os_activity_create(&dword_23CAED000, "com.apple.messages.MMCSPreAuth", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) startTimingForKey:*(void *)(a1 + 88)];
    id v42 = +[IMTransferAgentDeliveryController sharedInstance];
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = sub_23CAF7F40;
    v53[3] = &unk_264E80EF8;
    uint64_t v43 = *(void *)(a1 + 144);
    os_activity_t v54 = v41;
    uint64_t v65 = v43;
    id v55 = *(id *)(a1 + 88);
    id v56 = *(id *)(a1 + 64);
    id v57 = *(id *)(a1 + 96);
    id v58 = *(id *)(a1 + 104);
    id v59 = *(id *)(a1 + 112);
    id v44 = *(id *)(a1 + 120);
    uint64_t v45 = *(void *)(a1 + 72);
    id v60 = v44;
    uint64_t v61 = v45;
    id v62 = *(id *)(a1 + 128);
    id v63 = *(id *)(a1 + 136);
    id v64 = v40;
    id v51 = v40;
    uint64_t v28 = v41;
    [v42 sendFTMessage:v52 completionBlock:v53];

    __int16 v15 = v54;
    goto LABEL_30;
  }
  [*(id *)(*(void *)(a1 + 72) + 8) unregisterFiles:*(void *)(a1 + 128)];
  uint64_t v7 = [*(id *)(a1 + 104) completionBlock];
  uint64_t v52 = (FTiMessageRequestMMCSDownloadToken *)v7;
  if (v7) {
    (*(void (**)(uint64_t, void, void, void, void, void))(v7 + 16))(v7, *(void *)(a1 + 104), 0, 0, 0, 0);
  }
  uint64_t v68 = *MEMORY[0x263F4ACA8];
  id v8 = [NSNumber numberWithLong:44];
  __int16 v69 = v8;
  uint64_t v50 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];

  int v9 = [MEMORY[0x263F4AFD0] sharedInstance];
  [v9 trackEvent:*MEMORY[0x263F4ACB0] withDictionary:v50];

  id v10 = [MEMORY[0x263F3BB40] sharedInstance];
  int v11 = [v10 wiFiActiveAndReachable];

  if (v11) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 3;
  }
  int v13 = NSNumber;
  id v14 = [MEMORY[0x263F4A880] sharedInstance];
  objc_msgSend(v13, "numberWithInt:", objc_msgSend(v14, "linkQualityValueForInterfaceType:", v12));
  id v51 = (id)objc_claimAutoreleasedReturnValue();

  __int16 v15 = parseMMCSError();
  v66[0] = *MEMORY[0x263F4AD38];
  uint64_t v49 = [NSNumber numberWithLong:0];
  v67[0] = v49;
  v66[1] = *MEMORY[0x263F4AD70];
  char v48 = [NSNumber numberWithLong:0];
  v67[1] = v48;
  v66[2] = *MEMORY[0x263F4AD98];
  uint64_t v47 = [NSNumber numberWithLong:1];
  v67[2] = v47;
  uint64_t v16 = *MEMORY[0x263F4AD68];
  v66[3] = *MEMORY[0x263F4AD58];
  v66[4] = v16;
  v67[3] = &unk_26F0BAF28;
  v67[4] = v51;
  v66[5] = *MEMORY[0x263F4AC98];
  if (v11) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 1;
  }
  uint64_t v46 = [NSNumber numberWithLong:v17];
  v67[5] = v46;
  uint64_t v18 = *MEMORY[0x263F4AC90];
  v67[6] = &unk_26F0BAF28;
  uint64_t v19 = *MEMORY[0x263F4AD20];
  v66[6] = v18;
  v66[7] = v19;
  uint64_t v20 = [v15 objectAtIndexedSubscript:0];
  v67[7] = v20;
  v66[8] = *MEMORY[0x263F4AD18];
  uint64_t v21 = [v15 objectAtIndexedSubscript:1];
  v67[8] = v21;
  v66[9] = *MEMORY[0x263F4AD80];
  uint64_t v22 = [v15 objectAtIndexedSubscript:2];
  v67[9] = v22;
  v66[10] = *MEMORY[0x263F4AD78];
  uint64_t v23 = [v15 objectAtIndexedSubscript:3];
  v67[10] = v23;
  v66[11] = *MEMORY[0x263F4AD90];
  char v24 = [v15 objectAtIndexedSubscript:4];
  v67[11] = v24;
  v66[12] = *MEMORY[0x263F4AD88];
  uint64_t v25 = [v15 objectAtIndexedSubscript:5];
  v67[12] = v25;
  v66[13] = *MEMORY[0x263F4AD30];
  uint64_t v26 = [v15 objectAtIndexedSubscript:6];
  v67[13] = v26;
  v66[14] = *MEMORY[0x263F4AD28];
  uint64_t v27 = [v15 objectAtIndexedSubscript:7];
  v67[14] = v27;
  uint64_t v28 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:15];

  uint64_t v29 = [MEMORY[0x263F4AFD0] sharedInstance];
  [v29 trackEvent:*MEMORY[0x263F4ACC0] withDictionary:v28];

LABEL_30:
}

void sub_23CAF7F0C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x23CAF7D00);
  }
  _Unwind_Resume(a1);
}

void sub_23CAF7F40(uint64_t a1, void *a2, void *a3, int a4, unsigned int a5)
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v64 = a2;
  id v9 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      qos_class_t v11 = qos_class_self();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_23CAED000, v10, OS_LOG_TYPE_INFO, "Handling download MMCS auth at qos (%u)", buf, 8u);
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) stopTimingForKey:*(void *)(a1 + 40)];
  id v12 = v9;
  uint64_t v13 = [v12 responseContentVersion];
  __int16 v69 = v12;
  uint64_t v14 = [v12 contentVersion];
  if (v14 != v13 && IMOSLoggingEnabled())
  {
    __int16 v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v14;
      *(_WORD *)&unsigned char buf[22] = 2112;
      v86 = v16;
      _os_log_impl(&dword_23CAED000, v15, OS_LOG_TYPE_INFO, "Madrid responded with 'cV': %tu, but we requested a 'cV': %tu (transfer: %@)", buf, 0x20u);
    }
  }
  if (v13 <= 0)
  {
    if ((a4 & 1) == 0) {
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v17 = [v69 responseContentBody];
    BOOL v18 = v17 == 0;

    if (v18)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = v13;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v21;
          _os_log_impl(&dword_23CAED000, v20, OS_LOG_TYPE_INFO, "Madrid responded with 'cV': %tu, but no response body (transfer: %@)", buf, 0x16u);
        }
      }
      a5 = 17;
      goto LABEL_26;
    }
    if (!a4)
    {
LABEL_26:
      [*(id *)(*(void *)(a1 + 88) + 8) unregisterFiles:*(void *)(a1 + 96)];
      if (IMOSLoggingEnabled())
      {
        uint64_t v22 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v69;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = a5;
          _os_log_impl(&dword_23CAED000, v22, OS_LOG_TYPE_INFO, "Failed sending mmcs download request: %@, error %u", buf, 0x12u);
        }
      }
      uint64_t v68 = [*(id *)(a1 + 64) completionBlock];
      uint64_t v83 = *MEMORY[0x263F4ACA8];
      uint64_t v23 = [NSNumber numberWithLong:46];
      v84 = v23;
      uint64_t v24 = [NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];

      uint64_t v25 = [MEMORY[0x263F4AFD0] sharedInstance];
      [v25 trackEvent:*MEMORY[0x263F4ACB0] withDictionary:v24];

      if (a5)
      {
        uint64_t v66 = [MEMORY[0x263F087E8] errorWithDomain:@"IMTransferAgentErrorDomain" code:a5 userInfo:0];
      }
      else
      {
        uint64_t v66 = 0;
      }
      uint64_t v26 = [MEMORY[0x263F3BB40] sharedInstance];
      int v27 = [v26 wiFiActiveAndReachable];

      uint64_t v28 = NSNumber;
      uint64_t v29 = [MEMORY[0x263F4A880] sharedInstance];
      __int16 v30 = v29;
      if (v27) {
        uint64_t v31 = 2;
      }
      else {
        uint64_t v31 = 3;
      }
      uint64_t v65 = objc_msgSend(v28, "numberWithInt:", objc_msgSend(v29, "linkQualityValueForInterfaceType:", v31));

      id v32 = parseMMCSError();
      v81[0] = *MEMORY[0x263F4AD38];
      id v63 = [NSNumber numberWithLong:a5];
      v82[0] = v63;
      v81[1] = *MEMORY[0x263F4AD70];
      id v62 = [NSNumber numberWithLong:0];
      v82[1] = v62;
      v81[2] = *MEMORY[0x263F4AD98];
      uint64_t v61 = [NSNumber numberWithLong:3];
      uint64_t v33 = *MEMORY[0x263F4AD58];
      v82[2] = v61;
      v82[3] = &unk_26F0BAF28;
      uint64_t v34 = *MEMORY[0x263F4AD68];
      v81[3] = v33;
      v81[4] = v34;
      v82[4] = v65;
      v81[5] = *MEMORY[0x263F4AC98];
      if (v27) {
        uint64_t v35 = 2;
      }
      else {
        uint64_t v35 = 1;
      }
      id v60 = objc_msgSend(NSNumber, "numberWithLong:", v35, v24);
      uint64_t v36 = *MEMORY[0x263F4AC90];
      v82[5] = v60;
      v82[6] = &unk_26F0BAF28;
      uint64_t v37 = *MEMORY[0x263F4AD20];
      v81[6] = v36;
      v81[7] = v37;
      uint64_t v38 = [v32 objectAtIndexedSubscript:0];
      v82[7] = v38;
      v81[8] = *MEMORY[0x263F4AD18];
      v39 = [v32 objectAtIndexedSubscript:1];
      v82[8] = v39;
      v81[9] = *MEMORY[0x263F4AD80];
      id v40 = [v32 objectAtIndexedSubscript:2];
      v82[9] = v40;
      v81[10] = *MEMORY[0x263F4AD78];
      os_activity_t v41 = [v32 objectAtIndexedSubscript:3];
      v82[10] = v41;
      v81[11] = *MEMORY[0x263F4AD90];
      id v42 = [v32 objectAtIndexedSubscript:4];
      v82[11] = v42;
      v81[12] = *MEMORY[0x263F4AD88];
      uint64_t v43 = [v32 objectAtIndexedSubscript:5];
      v82[12] = v43;
      v81[13] = *MEMORY[0x263F4AD30];
      id v44 = [v32 objectAtIndexedSubscript:6];
      v82[13] = v44;
      v81[14] = *MEMORY[0x263F4AD28];
      uint64_t v45 = [v32 objectAtIndexedSubscript:7];
      v82[14] = v45;
      uint64_t v67 = [NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:15];

      uint64_t v46 = [MEMORY[0x263F4AFD0] sharedInstance];
      [v46 trackEvent:*MEMORY[0x263F4ACC0] withDictionary:v67];

      if (v68) {
        ((void (**)(void, void, void, void, void, void *))v68)[2](v68, *(void *)(a1 + 64), 0, 0, 0, v66);
      }

      goto LABEL_48;
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v69;
      _os_log_impl(&dword_23CAED000, v19, OS_LOG_TYPE_INFO, "Finished sending mmcs download request: %@", buf, 0xCu);
    }
  }
  uint64_t v68 = [v69 responseAuthToken];
  if (*(void *)(a1 + 56))
  {
    uint64_t v67 = objc_msgSend(NSURL, "URLWithString:");
  }
  else
  {
    uint64_t v67 = 0;
  }
  uint64_t v66 = [v69 responseRequestorID];
  [*(id *)(a1 + 64) setRequestorID:v66];
  [*(id *)(a1 + 64) setAuthToken:v68];
  uint64_t v47 = *(void **)(a1 + 64);
  char v48 = [v69 responseContentBody];
  [v47 setAuthResponseData:v48];

  if (IMOSLoggingEnabled())
  {
    uint64_t v49 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      uint64_t v50 = *(void *)(a1 + 64);
      uint64_t v51 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v50;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v51;
      *(_WORD *)&unsigned char buf[22] = 2112;
      v86 = v68;
      LOWORD(v87.opaque[0]) = 2112;
      *(uint64_t *)((char *)v87.opaque + 2) = (uint64_t)v66;
      _os_log_impl(&dword_23CAED000, v49, OS_LOG_TYPE_INFO, "Request to receive transfer: %@  path: %@  auth token: %@  requestor ID: %@", buf, 0x2Au);
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) startTimingForKey:*(void *)(a1 + 80)];
  uint64_t v52 = _os_activity_create(&dword_23CAED000, "com.apple.messages.MMCSGetFile", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3010000000;
  v87.opaque[0] = 0;
  v87.opaque[1] = 0;
  v86 = &unk_23CB0C613;
  uint64_t v65 = v52;
  os_activity_scope_enter(v52, &v87);
  uint64_t v53 = *(void *)(a1 + 96);
  os_activity_t v54 = *(void **)(*(void *)(a1 + 88) + 8);
  id v55 = [*(id *)(a1 + 64) requestorID];
  uint64_t v56 = *(void *)(a1 + 104);
  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = sub_23CAF8A64;
  v70[3] = &unk_264E80ED0;
  uint64_t v77 = *(void *)(a1 + 120);
  id v71 = *(id *)(a1 + 80);
  id v72 = *(id *)(a1 + 64);
  id v73 = *(id *)(a1 + 48);
  id v74 = *(id *)(a1 + 112);
  id v57 = *(id *)(a1 + 72);
  unsigned int v79 = a5;
  double v78 = buf;
  uint64_t v58 = *(void *)(a1 + 88);
  id v75 = v57;
  uint64_t v76 = v58;
  [v54 getFiles:v53 requestURL:v67 requestorID:v55 sourceAppID:v56 authToken:v68 completionBlock:v70];

  _Block_object_dispose(buf, 8);
LABEL_48:

  os_activity_scope_leave(&state);
}

void sub_23CAF8A64(uint64_t a1, void *a2, int a3, void *a4)
{
  v104[1] = *MEMORY[0x263EF8340];
  id v86 = a2;
  id v7 = a4;
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) stopTimingForKey:*(void *)(a1 + 32)];
  os_activity_scope_state_s v87 = v7;
  [*(id *)(a1 + 40) setMMCSError:v7];
  uint64_t v88 = a1;
  if (a3)
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = *(void **)(a1 + 48);
        double v10 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        id v98 = v9;
        __int16 v99 = 2112;
        double v100 = v10;
        _os_log_impl(&dword_23CAED000, v8, OS_LOG_TYPE_INFO, "Download timing for transfer ID%@ %@", buf, 0x16u);
      }
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;

    uint64_t v103 = *MEMORY[0x263F4ACA8];
    uint64_t v13 = [NSNumber numberWithLong:0];
    v104[0] = v13;
    uint64_t v81 = [NSDictionary dictionaryWithObjects:v104 forKeys:&v103 count:1];

    uint64_t v14 = [MEMORY[0x263F4AFD0] sharedInstance];
    [v14 trackEvent:*MEMORY[0x263F4ACB0] withDictionary:v81];

    __int16 v15 = [MEMORY[0x263EFF910] date];
    [v15 timeIntervalSinceDate:*(void *)(a1 + 56)];
    double v17 = v16;

    double v18 = 0.0;
    if (v17 > 0.0) {
      double v18 = (double)(unint64_t)[*(id *)(a1 + 40) protocolFileSize] / v17 * 0.0009765625;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v98 = v86;
        _os_log_impl(&dword_23CAED000, v19, OS_LOG_TYPE_INFO, "Built download succeeded for files: %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v98 = v86;
        __int16 v99 = 2048;
        double v100 = v17;
        __int16 v101 = 2048;
        double v102 = v18;
        _os_log_impl(&dword_23CAED000, v20, OS_LOG_TYPE_INFO, "Finished download request for files: %@  download time was: %f  speed: %.0f kb/s", buf, 0x20u);
      }
    }
    uint64_t v21 = [MEMORY[0x263F4A830] defaultHFSFileManager];
    uint64_t v22 = *(void *)(a1 + 64);
    id v90 = 0;
    unsigned int v85 = [v21 attributesOfItemAtPath:v22 error:&v90];
    id v83 = v90;

    v84 = [NSNumber numberWithDouble:v17];
    uint64_t v23 = [MEMORY[0x263F3BB40] sharedInstance];
    int v24 = [v23 wiFiActiveAndReachable];

    if (v24) {
      uint64_t v25 = 2;
    }
    else {
      uint64_t v25 = 3;
    }
    uint64_t v26 = NSNumber;
    int v27 = [MEMORY[0x263F4A880] sharedInstance];
    __int16 v89 = objc_msgSend(v26, "numberWithInt:", objc_msgSend(v27, "linkQualityValueForInterfaceType:", v25));

    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v85, "fileSize"));
    uint64_t v28 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    id v71 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v87, "code"));
    uint64_t v29 = parseMMCSError();
    v95[0] = *MEMORY[0x263F4AD38];
    unsigned int v79 = [NSNumber numberWithLong:*(unsigned int *)(v88 + 96)];
    v96[0] = v79;
    v95[1] = *MEMORY[0x263F4AD70];
    uint64_t v77 = [NSNumber numberWithLong:0];
    v96[1] = v77;
    v95[2] = *MEMORY[0x263F4AD98];
    id v75 = [NSNumber numberWithLong:0];
    v96[2] = v75;
    uint64_t v30 = *MEMORY[0x263F4ACA0];
    v95[3] = *MEMORY[0x263F4AD58];
    v95[4] = v30;
    v96[3] = v71;
    v96[4] = v84;
    uint64_t v31 = *MEMORY[0x263F4AD68];
    v96[5] = v89;
    uint64_t v32 = *MEMORY[0x263F4AC98];
    v95[5] = v31;
    v95[6] = v32;
    if (v24) {
      uint64_t v33 = 2;
    }
    else {
      uint64_t v33 = 1;
    }
    id v73 = [NSNumber numberWithLong:v33];
    v96[6] = v73;
    uint64_t v34 = *MEMORY[0x263F4AC90];
    v96[7] = v28;
    uint64_t v35 = *MEMORY[0x263F4AD20];
    v95[7] = v34;
    v95[8] = v35;
    id v72 = [v29 objectAtIndexedSubscript:0];
    v96[8] = v72;
    v95[9] = *MEMORY[0x263F4AD18];
    uint64_t v36 = [v29 objectAtIndexedSubscript:1];
    v96[9] = v36;
    v95[10] = *MEMORY[0x263F4AD80];
    uint64_t v37 = [v29 objectAtIndexedSubscript:2];
    v96[10] = v37;
    v95[11] = *MEMORY[0x263F4AD78];
    uint64_t v38 = [v29 objectAtIndexedSubscript:3];
    v96[11] = v38;
    v95[12] = *MEMORY[0x263F4AD90];
    v39 = [v29 objectAtIndexedSubscript:4];
    v96[12] = v39;
    v95[13] = *MEMORY[0x263F4AD88];
    id v40 = [v29 objectAtIndexedSubscript:5];
    v96[13] = v40;
    v95[14] = *MEMORY[0x263F4AD30];
    os_activity_t v41 = [v29 objectAtIndexedSubscript:6];
    v96[14] = v41;
    v95[15] = *MEMORY[0x263F4AD28];
    id v42 = [v29 objectAtIndexedSubscript:7];
    v96[15] = v42;
    uint64_t v43 = [NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:16];

    id v44 = [MEMORY[0x263F4AFD0] sharedInstance];
    [v44 trackEvent:*MEMORY[0x263F4ACC0] withDictionary:v43];
  }
  else
  {
    uint64_t v45 = [MEMORY[0x263EFF910] date];
    [v45 timeIntervalSinceDate:*(void *)(a1 + 56)];
    double v47 = v46;

    if (IMOSLoggingEnabled())
    {
      char v48 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v98 = v86;
        __int16 v99 = 2112;
        double v100 = *(double *)&v87;
        __int16 v101 = 2048;
        double v102 = v47;
        _os_log_impl(&dword_23CAED000, v48, OS_LOG_TYPE_INFO, "Failed downloading files: %@  error: %@  time was: %f", buf, 0x20u);
      }
    }
    uint64_t v93 = *MEMORY[0x263F4ACA8];
    uint64_t v49 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v87, "code"));
    double v94 = v49;
    char v82 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];

    uint64_t v50 = [MEMORY[0x263F4AFD0] sharedInstance];
    [v50 trackEvent:*MEMORY[0x263F4ACB0] withDictionary:v82];

    unsigned int v85 = [NSNumber numberWithDouble:v47];
    uint64_t v51 = [MEMORY[0x263F3BB40] sharedInstance];
    int v52 = [v51 wiFiActiveAndReachable];

    if (v52) {
      uint64_t v53 = 2;
    }
    else {
      uint64_t v53 = 3;
    }
    os_activity_t v54 = NSNumber;
    id v55 = [MEMORY[0x263F4A880] sharedInstance];
    objc_msgSend(v54, "numberWithInt:", objc_msgSend(v55, "linkQualityValueForInterfaceType:", v53));
    id v83 = (id)objc_claimAutoreleasedReturnValue();

    v84 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v87, "code"));
    __int16 v89 = parseMMCSError();
    v91[0] = *MEMORY[0x263F4AD38];
    uint64_t v80 = [NSNumber numberWithLong:*(unsigned int *)(v88 + 96)];
    v92[0] = v80;
    v91[1] = *MEMORY[0x263F4AD70];
    double v78 = [NSNumber numberWithLong:0];
    v92[1] = v78;
    v91[2] = *MEMORY[0x263F4AD98];
    uint64_t v76 = [NSNumber numberWithLong:0];
    v92[2] = v76;
    uint64_t v56 = *MEMORY[0x263F4ACA0];
    v91[3] = *MEMORY[0x263F4AD58];
    v91[4] = v56;
    v92[3] = v84;
    void v92[4] = v85;
    uint64_t v57 = *MEMORY[0x263F4AD68];
    v92[5] = v83;
    uint64_t v58 = *MEMORY[0x263F4AC98];
    v91[5] = v57;
    v91[6] = v58;
    if (v52) {
      uint64_t v59 = 2;
    }
    else {
      uint64_t v59 = 1;
    }
    id v74 = [NSNumber numberWithLong:v59];
    v92[6] = v74;
    uint64_t v60 = *MEMORY[0x263F4AC90];
    v92[7] = &unk_26F0BAF28;
    uint64_t v61 = *MEMORY[0x263F4AD20];
    v91[7] = v60;
    v91[8] = v61;
    id v62 = [v89 objectAtIndexedSubscript:0];
    v92[8] = v62;
    v91[9] = *MEMORY[0x263F4AD18];
    id v63 = [v89 objectAtIndexedSubscript:1];
    v92[9] = v63;
    v91[10] = *MEMORY[0x263F4AD80];
    id v64 = [v89 objectAtIndexedSubscript:2];
    v92[10] = v64;
    v91[11] = *MEMORY[0x263F4AD78];
    uint64_t v65 = [v89 objectAtIndexedSubscript:3];
    v92[11] = v65;
    v91[12] = *MEMORY[0x263F4AD90];
    uint64_t v66 = [v89 objectAtIndexedSubscript:4];
    v92[12] = v66;
    v91[13] = *MEMORY[0x263F4AD88];
    uint64_t v67 = [v89 objectAtIndexedSubscript:5];
    v92[13] = v67;
    v91[14] = *MEMORY[0x263F4AD30];
    uint64_t v68 = [v89 objectAtIndexedSubscript:6];
    v92[14] = v68;
    v91[15] = *MEMORY[0x263F4AD28];
    __int16 v69 = [v89 objectAtIndexedSubscript:7];
    v92[15] = v69;
    uint64_t v43 = [NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:16];

    v70 = [MEMORY[0x263F4AFD0] sharedInstance];
    [v70 trackEvent:*MEMORY[0x263F4ACC0] withDictionary:v43];

    uint64_t v28 = [*(id *)(v88 + 40) completionBlock];
    os_activity_scope_leave((os_activity_scope_state_t)(*(void *)(*(void *)(v88 + 88) + 8) + 32));
    if (v28) {
      v28[2](v28, *(void *)(v88 + 40), 0, 0, 0, 0);
    }
  }

  [*(id *)(*(void *)(v88 + 72) + 8) unregisterFiles:v86];
}

void sub_23CAF9B94(uint64_t a1, void *a2, void *a3, int a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a5;
  id v13 = a6;
  id v14 = a3;
  im_assert_primary_queue();
  if (a4)
  {
    __int16 v15 = *(void **)(a1 + 32);
    double v16 = [NSURL fileURLWithPath:v14];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_23CAF9CF0;
    v18[3] = &unk_264E80F48;
    uint64_t v17 = *(void *)(a1 + 40);
    id v21 = *(id *)(a1 + 48);
    id v19 = v11;
    id v20 = v13;
    [v15 ensureSafeAttachment:v16 topic:v17 withCompletionBlock:v18];

    id v14 = v21;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_23CAF9CF0(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109120;
      v13[1] = qos_class_self();
      _os_log_impl(&dword_23CAED000, v9, OS_LOG_TYPE_INFO, "Handling ensureSafeAttachment at qos (%u)", (uint8_t *)v13, 8u);
    }
  }
  im_assert_primary_queue();
  uint64_t v10 = a1[6];
  uint64_t v11 = a1[4];
  id v12 = [v7 path];
  (*(void (**)(uint64_t, uint64_t, void *, uint64_t, id, void))(v10 + 16))(v10, v11, v12, a2, v8, a1[5]);
}

void sub_23CAF9E40(uint64_t a1, void *a2, void *a3, int a4, void *a5, void *a6)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (IMOSLoggingEnabled())
  {
    __int16 v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      qos_class_t v24 = qos_class_self();
      _os_log_impl(&dword_23CAED000, v15, OS_LOG_TYPE_INFO, "Handling download completion at qos (%u)", buf, 8u);
    }
  }
  im_assert_primary_queue();
  if (a4 && [*(id *)(a1 + 32) length])
  {
    double v16 = +[IMTransferEncryptionController sharedInstance];
    uint64_t v17 = [NSURL fileURLWithPath:v12];
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = sub_23CAFA074;
    v20[3] = &unk_264E80F98;
    id v22 = *(id *)(a1 + 56);
    id v21 = *(id *)(a1 + 48);
    [v16 decryptURL:v17 key:v18 outputFileName:v19 completionBlock:v20];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_23CAFA074(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = qos_class_self();
      _os_log_impl(&dword_23CAED000, v9, OS_LOG_TYPE_INFO, "Handling download decryption at qos (%u)", buf, 8u);
    }
  }
  im_assert_primary_queue();
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v12 = [v8 path];
  (*(void (**)(uint64_t, uint64_t, void *, uint64_t, void, void))(v10 + 16))(v10, v11, v12, a3, 0, 0);

  if (v8)
  {
    id v13 = [MEMORY[0x263F08850] defaultManager];
    id v17 = 0;
    char v14 = [v13 removeItemAtURL:v7 error:&v17];
    id v15 = v17;

    if ((v14 & 1) == 0 && IMOSLoggingEnabled())
    {
      double v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v19 = v7;
        __int16 v20 = 2112;
        id v21 = v15;
        _os_log_impl(&dword_23CAED000, v16, OS_LOG_TYPE_INFO, "Error cleaning up encrypted attachment path: %@  error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v15 = 0;
  }
}

void sub_23CAFA490(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  im_assert_primary_queue();
  if (a2)
  {
    if ([*(id *)(a1 + 32) isEqual:v7])
    {
      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v24 = v10;
          _os_log_impl(&dword_23CAED000, v9, OS_LOG_TYPE_INFO, "Generating safe render succeeded, but still using the original path since we cannot transcode the entire asset: %@", buf, 0xCu);
        }
      }
      id v11 = 0;
      goto LABEL_17;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl(&dword_23CAED000, v12, OS_LOG_TYPE_INFO, "Error generating safe render for transfer: %@ error: %@", buf, 0x16u);
    }
  }
  char v14 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v15 = *(void *)(a1 + 32);
  id v22 = 0;
  char v16 = [v14 removeItemAtURL:v15 error:&v22];
  id v11 = v22;

  if ((v16 & 1) == 0 && IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v18;
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_impl(&dword_23CAED000, v17, OS_LOG_TYPE_INFO, "Error removing transfer: %@ error: %@", buf, 0x16u);
    }
  }
LABEL_17:
  if (v7) {
    BOOL v19 = v8 == 0;
  }
  else {
    BOOL v19 = 0;
  }
  if (v19)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23CAED000, v20, OS_LOG_TYPE_INFO, "Decontamination succeeded", buf, 2u);
      }
    }
    id v21 = 0;
  }
  else
  {
    id v21 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F4AC10] code:28 userInfo:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_23CAFA834()
{
  qword_26AF3FDF0 = objc_alloc_init(IMTransferAgentDeliveryController);
  return MEMORY[0x270F9A758]();
}

void sub_23CAFAB08(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  *(void *)&v26[5] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  id v12 = v9;
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      *(void *)id v26 = v12;
      _os_log_impl(&dword_23CAED000, v13, OS_LOG_TYPE_INFO, "    Delivered FTMessage: %@", (uint8_t *)&v25, 0xCu);
    }
  }
  uint64_t v14 = _FZErrorTypeFromResponseCodeAndError();
  uint64_t v15 = v14;
  if (v10) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v14 == 0;
  }
  uint64_t v17 = v16;
  if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v25 = 67109376;
      v26[0] = a4;
      LOWORD(v26[1]) = 1024;
      *(_DWORD *)((char *)&v26[1] + 2) = v15;
      _os_log_impl(&dword_23CAED000, v18, OS_LOG_TYPE_INFO, "    Result code: %d, errorType = %d", (uint8_t *)&v25, 0xEu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      *(void *)id v26 = v11;
      _os_log_impl(&dword_23CAED000, v19, OS_LOG_TYPE_INFO, "    Result dictionary: %@", (uint8_t *)&v25, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      *(void *)id v26 = v10;
      _os_log_impl(&dword_23CAED000, v20, OS_LOG_TYPE_INFO, "    Error: %@", (uint8_t *)&v25, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = @"NO";
      if (v17) {
        id v22 = @"YES";
      }
      int v25 = 138412290;
      *(void *)id v26 = v22;
      _os_log_impl(&dword_23CAED000, v21, OS_LOG_TYPE_INFO, "  Success: %@", (uint8_t *)&v25, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_23CAED000, v23, OS_LOG_TYPE_INFO, "Sending callback for FTMessage send", (uint8_t *)&v25, 2u);
    }
  }
  uint64_t v24 = *(void *)(a1 + 40);
  if (v24) {
    (*(void (**)(uint64_t, void, id, uint64_t, uint64_t))(v24 + 16))(v24, *(void *)(a1 + 32), v12, v17, v15);
  }
}

uint64_t sub_23CAFAF38()
{
  qword_26AF3FDF8 = objc_alloc_init(IMTransferAgentNicknameController);
  return MEMORY[0x270F9A758]();
}

void sub_23CAFB1D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_23CAFB1E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_23CAFB1F8(uint64_t a1)
{
}

void sub_23CAFB200(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:*(void *)(a1 + 32)];
  id v6 = objc_alloc(MEMORY[0x263EFD7E8]);
  id v7 = [*(id *)(a1 + 32) stringByAppendingString:@"-wp"];
  id v8 = (void *)[v6 initWithRecordName:v7];

  [v4 addObject:v5];
  BOOL v9 = *(void *)(a1 + 40) || *(void *)(a1 + 48) || *(void *)(a1 + 56) != 0;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = *(unsigned __int8 *)(a1 + 104);
      *(_DWORD *)buf = 67109890;
      BOOL v41 = v9;
      __int16 v42 = 1024;
      int v43 = v11;
      __int16 v44 = 1024;
      int v45 = 1;
      __int16 v46 = 2112;
      double v47 = v8;
      _os_log_impl(&dword_23CAED000, v10, OS_LOG_TYPE_INFO, "Have some wallpaper tag: %i, knownSender: %i, shouldFetchWallpaperRecord: %i, wallpaperRecordID: %@", buf, 0x1Eu);
    }
  }
  if (v9 && *(unsigned char *)(a1 + 104)) {
    [v4 addObject:v8];
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x263EFD6D8]) initWithRecordIDs:v4];
  uint64_t v13 = [MEMORY[0x263F4AFE0] allKeys];
  [v12 setDesiredKeys:v13];

  uint64_t v14 = (id *)(a1 + 64);
  uint64_t v15 = [*(id *)(a1 + 64) _nickNameFetchConfiguration];
  [v12 setConfiguration:v15];

  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  id v26 = sub_23CAFB598;
  uint64_t v27 = &unk_264E81060;
  id v28 = *(id *)(a1 + 72);
  id v29 = v5;
  id v30 = v8;
  id v31 = *(id *)(a1 + 80);
  id v16 = *(id *)(a1 + 88);
  uint64_t v17 = *(void *)(a1 + 64);
  id v36 = v16;
  uint64_t v32 = v17;
  id v33 = *(id *)(a1 + 48);
  id v34 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 40);
  __int16 v39 = *(_WORD *)(a1 + 104);
  uint64_t v19 = *(void *)(a1 + 96);
  id v37 = v3;
  uint64_t v38 = v19;
  id v35 = v18;
  id v20 = v3;
  id v21 = v8;
  id v22 = v5;
  [v12 setFetchRecordsCompletionBlock:&v24];
  uint64_t v23 = objc_msgSend(*v14, "_nickNamePublicDB", v24, v25, v26, v27);
  [v23 addOperation:v12];
}

void sub_23CAFB598(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v6;
      _os_log_impl(&dword_23CAED000, v7, OS_LOG_TYPE_INFO, "Public Nickname retrieval completed with error %@", buf, 0xCu);
    }
  }
  if (v6 && IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = [v6 userInfo];
      *(_DWORD *)buf = 138412290;
      id v32 = v9;
      _os_log_impl(&dword_23CAED000, v8, OS_LOG_TYPE_INFO, "Public nickname retrieval errors %@", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23CAFB880;
  block[3] = &unk_264E81038;
  id v19 = v6;
  id v20 = v5;
  id v10 = *(NSObject **)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  id v22 = *(id *)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 96);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(void **)(a1 + 72);
  id v28 = v11;
  uint64_t v24 = v12;
  id v25 = v13;
  id v26 = *(id *)(a1 + 80);
  id v27 = *(id *)(a1 + 88);
  __int16 v30 = *(_WORD *)(a1 + 120);
  long long v17 = *(_OWORD *)(a1 + 104);
  id v14 = (id)v17;
  long long v29 = v17;
  id v15 = v5;
  id v16 = v6;
  dispatch_async(v10, block);
}

void sub_23CAFB880(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40), v2);
    if (((*(uint64_t (**)(void))(*(void *)(a1 + 112) + 16))() & 1) == 0)
    {
      uint64_t v3 = *(void *)(a1 + 104);
      id v22 = [*(id *)(a1 + 72) _errorWrappingError:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40)];
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    }
  }
  else
  {
    char v4 = [*(id *)(a1 + 40) objectForKey:*(void *)(a1 + 48)];
    id v5 = [*(id *)(a1 + 40) objectForKey:*(void *)(a1 + 56)];
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v4;
        _os_log_impl(&dword_23CAED000, v6, OS_LOG_TYPE_INFO, "Public Nickname record found %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v5;
        _os_log_impl(&dword_23CAED000, v7, OS_LOG_TYPE_INFO, "Public Wallpaper record found %@", buf, 0xCu);
      }
    }
    uint64_t v8 = *(void *)(a1 + 64);
    id v24 = 0;
    BOOL v9 = [MEMORY[0x263F4B000] preKeyWithDataRepresentation:v8 error:&v24];
    id v10 = v24;
    if (v9)
    {
      uint64_t v11 = *(void *)(a1 + 80);
      uint64_t v12 = *(void *)(a1 + 88);
      uint64_t v13 = *(void *)(a1 + 96);
      __int16 v14 = *(_WORD *)(a1 + 128);
      id v23 = v10;
      LOWORD(v21) = v14;
      id v15 = objc_msgSend(MEMORY[0x263F4AFE0], "nicknameFromPublicRecord:wallpaperRecord:preKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:knownSender:shouldDecodeImageFields:error:", v4, v5, v9, v11, v12, v13, v21, &v23);
      id v16 = v23;

      if (v15)
      {
        if (IMOSLoggingEnabled())
        {
          long long v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v15;
            _os_log_impl(&dword_23CAED000, v17, OS_LOG_TYPE_INFO, "Transfer agent sending back nickname: %@", buf, 0xCu);
          }
        }
        (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
      }
      else
      {
        uint64_t v19 = *(void *)(a1 + 104);
        id v20 = [*(id *)(a1 + 72) _errorWrappingError:v16];
        (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v20);
      }
      id v10 = v16;
    }
    else
    {
      uint64_t v18 = *(void *)(a1 + 104);
      id v15 = [*(id *)(a1 + 72) _errorWrappingError:v10];
      (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v15);
    }
  }
}

uint64_t sub_23CAFBCE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_23CAFBD8C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"creatorUserRecordID == %@", v5];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFD7B0]) initWithRecordType:@"imsgNicknamePublicv2" predicate:v7];
  BOOL v9 = [MEMORY[0x263EFD7F8] defaultRecordZone];
  id v10 = [v9 zoneID];

  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl(&dword_23CAED000, v11, OS_LOG_TYPE_INFO, "Querying for all record ids created by userRecordID %@", buf, 0xCu);
    }
  }
  uint64_t v12 = [*(id *)(a1 + 32) _nickNamePublicDB];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_23CAFBF9C;
  v14[3] = &unk_264E810D8;
  id v15 = v10;
  id v16 = *(id *)(a1 + 40);
  id v13 = v10;
  [v12 performQuery:v8 inZoneWithID:v13 completionHandler:v14];
}

void sub_23CAFBF9C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_23CAED000, v7, OS_LOG_TYPE_INFO, "Got back records in zone %@ created by current user %@ error %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_23CAFC6D8(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v25 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = v21;
  uint64_t v23 = *(void *)(a1 + 40);
  if (v23)
  {
    if (v21)
    {
      id v24 = [*(id *)(a1 + 32) _errorWrappingError:v21];
      (*(void (**)(uint64_t, uint64_t, id, id, id, id, id, id, void *))(v23 + 16))(v23, a2, v25, v16, v17, v18, v19, v20, v24);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, id, id, id, id, id, id, void))(v23 + 16))(v23, a2, v25, v16, v17, v18, v19, v20, 0);
    }
  }
}

void sub_23CAFC824(uint64_t a1, int a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v22 = a3;
  [*(id *)(a1 + 32) stopTimingForKey:@"Nickname Upload"];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      [*(id *)(a1 + 32) totalTimeForKey:@"Nickname Upload"];
      *(_DWORD *)buf = 134217984;
      uint64_t v25 = v6;
      _os_log_impl(&dword_23CAED000, v5, OS_LOG_TYPE_INFO, "Nickname uploaded in time: %f", buf, 0xCu);
    }
  }
  int v7 = IMOSLoggingEnabled();
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23CAED000, v8, OS_LOG_TYPE_INFO, "Encrypted Nickname stored in Public Database", buf, 2u);
      }
    }
    int v9 = *(void **)(a1 + 40);
    uint64_t v10 = [*(id *)(a1 + 48) recordID];
    id v23 = 0;
    char v11 = [v9 updateNicknameWithRecordID:v10 error:&v23];
    id v12 = v23;

    uint64_t v13 = *(void *)(a1 + 88);
    if (v11)
    {
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = [*(id *)(a1 + 48) recordID];
      id v16 = [v15 recordName];
      id v17 = [*(id *)(a1 + 56) dataRepresentation];
      id v18 = [*(id *)(a1 + 64) dataRepresentation];
      id v19 = [*(id *)(a1 + 72) dataRepresentation];
      id v20 = [*(id *)(a1 + 80) dataRepresentation];
      (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *, void *, void *, void *, void))(v13 + 16))(v13, 1, v14, v16, v17, v18, v19, v20, 0);
    }
    else
    {
      (*(void (**)(uint64_t, void, void, void, void, void, void, void, id))(v13 + 16))(v13, 0, 0, 0, 0, 0, 0, 0, v12);
    }
  }
  else
  {
    if (v7)
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23CAED000, v21, OS_LOG_TYPE_INFO, "Unable to store in Public Database, aborting fan out to other devices", buf, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))(*(void *)(a1 + 88));
  }
}

void sub_23CAFCC98(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5 && [v5 count])
  {
    int v7 = [v5 arrayByApplyingSelector:sel_recordID];
    uint64_t v8 = (void *)[v7 mutableCopy];

    if (IMOSLoggingEnabled())
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        _os_log_impl(&dword_23CAED000, v9, OS_LOG_TYPE_INFO, "Going to delete recordIDs %@, with error", buf, 0xCu);
      }
    }
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_23CAFCE64;
    v14[3] = &unk_264E81178;
    id v12 = *(id *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 32);
    id v16 = v12;
    void v14[4] = v13;
    id v15 = v6;
    [v10 _updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecords:0 deletingRecordIDs:v8 queue:v11 withCompletionBlock:v14];
  }
}

void sub_23CAFCE64(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    id v8 = v5;
    if (v5)
    {
      int v7 = [*(id *)(a1 + 32) _errorWrappingError:*(void *)(a1 + 40)];
      (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, a2, v7);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, a2, 0);
    }
    id v5 = v8;
  }
}

void sub_23CAFD120(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [*(id *)(a1 + 32) stopTimingForKey:@"Nickname Delete"];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      [*(id *)(a1 + 32) totalTimeForKey:@"Nickname Delete"];
      int v9 = 134217984;
      uint64_t v10 = v7;
      _os_log_impl(&dword_23CAED000, v6, OS_LOG_TYPE_INFO, "Deleted nickname record in time: %f", (uint8_t *)&v9, 0xCu);
    }
  }
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 48) _updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecords:*(void *)(a1 + 56) deletingRecordIDs:0 queue:*(void *)(a1 + 64) withCompletionBlock:*(void *)(a1 + 72)];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 72);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
    }
  }
}

void sub_23CAFD53C(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    char v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v5;
      __int16 v27 = 2112;
      uint64_t v28 = v6;
      _os_log_impl(&dword_23CAED000, v4, OS_LOG_TYPE_INFO, "Going to delete nicknames from public db %@ and save nickname to public db %@", buf, 0x16u);
    }
  }
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF8C0] array];
  }
  int v9 = v8;
  id v10 = objc_alloc(MEMORY[0x263EFD748]);
  if (*(void *)(a1 + 40)) {
    uint64_t v11 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v11 = MEMORY[0x263EFFA68];
  }
  id v12 = (void *)[v10 initWithRecordsToSave:v11 recordIDsToDelete:v9];
  uint64_t v13 = (id *)(a1 + 48);
  uint64_t v14 = [*(id *)(a1 + 48) _nickNameSaveConfiguration];
  [v12 setConfiguration:v14];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_23CAFD76C;
  v19[3] = &unk_264E81268;
  id v20 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  uint64_t v16 = *(void *)(a1 + 72);
  uint64_t v21 = *(void *)(a1 + 48);
  id v22 = v15;
  id v23 = v3;
  uint64_t v24 = v16;
  id v17 = v3;
  [v12 setModifyRecordsCompletionBlock:v19];
  id v18 = [*v13 _nickNamePublicDB];
  [v18 addOperation:v12];
}

void sub_23CAFD76C(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_23CAED000, v10, OS_LOG_TYPE_INFO, "Public Nickname with recordID Publish completed with error %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a4);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(a1 + 40);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_23CAFDA04;
    v14[3] = &unk_264E81240;
    p_long long buf = &buf;
    id v17 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 48);
    id v16 = v9;
    [v11 _handleSaveNicknameError:v16 queue:v12 withCompletionBlock:v14];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v13 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23CAFD9EC;
    block[3] = &unk_264E811F0;
    id v21 = *(id *)(a1 + 48);
    dispatch_async(v13, block);
  }
}

void sub_23CAFD9CC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_23CAFD9EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_23CAFDA04(uint64_t a1, int a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v4 = IMOSLoggingEnabled();
  if (!a2)
  {
    if (v4)
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(__CFString **)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v19 = v11;
        _os_log_impl(&dword_23CAED000, v10, OS_LOG_TYPE_INFO, "We should not retry the ck operation on this error %@", buf, 0xCu);
      }
    }
    uint64_t v6 = *(NSObject **)(a1 + 32);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_23CAFDC94;
    v12[3] = &unk_264E81218;
    id v7 = &v14;
    id v14 = *(id *)(a1 + 56);
    id v8 = &v13;
    id v13 = *(id *)(a1 + 40);
    id v9 = v12;
    goto LABEL_13;
  }
  if (v4)
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v19 = @"YES";
      _os_log_impl(&dword_23CAED000, v5, OS_LOG_TYPE_INFO, "We should retry the ck operation %@", buf, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v6 = *(NSObject **)(a1 + 32);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_23CAFDC7C;
    v15[3] = &unk_264E81218;
    id v7 = &v17;
    id v17 = *(id *)(a1 + 56);
    id v8 = &v16;
    id v16 = *(id *)(a1 + 40);
    id v9 = v15;
LABEL_13:
    dispatch_async(v6, v9);
  }
}

uint64_t sub_23CAFDC7C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t sub_23CAFDC94(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_23CAFDF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_23CAFDF94(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void sub_23CAFE218(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_23CAFE2F0;
  v5[3] = &unk_264E812E0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 64);
  v5[4] = v2;
  id v6 = v3;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  int v4 = (void *)MEMORY[0x23ECF1F70](v5);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

BOOL sub_23CAFE2F0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1 > 2)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v4 = 0;
        _os_log_impl(&dword_23CAED000, v2, OS_LOG_TYPE_INFO, "Failed CloudKit operation. Too many retries.", v4, 2u);
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) cloudKitOperationWithRetryCount:v1 + 1 queue:*(void *)(a1 + 40) withError:*(void *)(a1 + 48) operation:*(void *)(a1 + 56)];
  }
  return v1 < 3;
}

uint64_t sub_23CAFEBB8()
{
  qword_26AF3FE00 = objc_alloc_init(IMTransferEncryptionController);
  return MEMORY[0x270F9A758]();
}

id sub_23CAFEE8C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  v25[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 objectForKey:v8];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v9 fileURL];
      if (v11)
      {
        id v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v11 options:0 error:a5];

        goto LABEL_16;
      }
      if (!a5) {
        goto LABEL_11;
      }
      uint64_t v12 = [NSString stringWithFormat:@"Missing fileURL for CKAsset {key: %@, value: %@}", v8, v9];
      id v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v24 = *MEMORY[0x263F07F80];
      v25[0] = v12;
      id v14 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
      *a5 = [v13 errorWithDomain:*MEMORY[0x263F4ADB0] code:-1000 userInfo:v14];
    }
    if (a5)
    {
      id v15 = [NSString stringWithFormat:@"Unexpected type for {key: %@, value: %@}", v8, v9];
      id v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = *MEMORY[0x263F07F80];
      uint64_t v23 = v15;
      id v17 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      *a5 = [v16 errorWithDomain:*MEMORY[0x263F4ADB0] code:-1000 userInfo:v17];
    }
LABEL_11:
    if (IMOSLoggingEnabled())
    {
      id v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v21 = v8;
        _os_log_impl(&dword_23CAED000, v18, OS_LOG_TYPE_INFO, "IMNickname CKRecord contains object for key '%@' but of unexpected type", buf, 0xCu);
      }
    }
  }
  id v10 = 0;
LABEL_16:

  return v10;
}

id sub_23CAFF154(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, __int16 a9, uint64_t a10)
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_23CAED000, v21, OS_LOG_TYPE_INFO, "Decrypting nickname record", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v27 = 0;
      _os_log_impl(&dword_23CAED000, v22, OS_LOG_TYPE_INFO, "Handing Nickname data to BlastDoor to defuse", v27, 2u);
    }
  }
  LOWORD(v25) = a9;
  uint64_t v23 = objc_msgSend(a1, "_blastdoorNicknameFromPublicRecord:wallpaperRecord:preKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:knownSender:shouldDecodeImageFields:error:", v15, v16, v17, v18, v19, v20, v25, a10);

  return v23;
}

id sub_23CAFF320(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, unsigned __int8 a9, char a10, void *a11)
{
  v91[1] = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v68 = a4;
  id v63 = a5;
  id value = a6;
  id v64 = a7;
  id v66 = a8;
  uint64_t v67 = v17;
  if (a11)
  {
    uint64_t v61 = [a1 dataFromCKRecord:v17 forKey:@"n" error:a11];
    uint64_t v62 = [a1 dataFromCKRecord:v17 forKey:@"am" error:a11];
    uint64_t v59 = [a1 dataFromCKRecord:v17 forKey:@"ad" error:a11];
    *(void *)&v60[8] = [a1 dataFromCKRecord:v68 forKey:@"wd" error:a11];
    *(void *)uint64_t v60 = [a1 dataFromCKRecord:v68 forKey:@"lrwd" error:a11];
    *(void *)&v60[16] = [a1 dataFromCKRecord:v68 forKey:@"wm" error:a11];
    if (!v61)
    {
      if (IMOSLoggingEnabled())
      {
        id v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_23CAED000, v21, OS_LOG_TYPE_INFO, "CKRecord is missing required nickname data", (uint8_t *)&buf, 2u);
        }
      }
      id v20 = 0;
      goto LABEL_84;
    }
    id v90 = @"n";
    v91[0] = v61;
    id v18 = [NSDictionary dictionaryWithObjects:v91 forKeys:&v90 count:1];
    uint64_t v58 = (void *)[v18 mutableCopy];

    if (v62 && v59)
    {
      [v58 setObject:v59 forKeyedSubscript:@"ad"];
      [v58 setObject:v62 forKeyedSubscript:@"am"];
    }
    else if (v62 | v59)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_23CAED000, v22, OS_LOG_TYPE_INFO, "CKRecord contains incomplete avatar data", (uint8_t *)&buf, 2u);
        }
        goto LABEL_81;
      }
LABEL_82:
      id v20 = 0;
LABEL_83:

LABEL_84:
      goto LABEL_85;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = *(void *)&v60[8];
        _os_log_impl(&dword_23CAED000, v23, OS_LOG_TYPE_INFO, "Wallpaper | encryptedWallpaperData: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = *(void *)&v60[16];
        _os_log_impl(&dword_23CAED000, v24, OS_LOG_TYPE_INFO, "Wallpaper | encryptedWallpaperMetadata: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = *(void *)v60;
        _os_log_impl(&dword_23CAED000, v25, OS_LOG_TYPE_INFO, "Wallpaper | encryptedLowResWallpaperData: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    int v26 = (a10 & ~[MEMORY[0x263F4AF78] deviceIsLockedDown] & a9);
    if (v26 == 1 && *(void *)&v60[16] && *(_OWORD *)v60 != 0)
    {
      [v58 setObject:*(void *)&v60[16] forKeyedSubscript:@"wm"];
      if (*(void *)v60) {
        [v58 setObject:*(void *)v60 forKeyedSubscript:@"lrwd"];
      }
      if (*(void *)&v60[8]) {
        [v58 setObject:*(void *)&v60[8] forKeyedSubscript:@"wd"];
      }
      goto LABEL_43;
    }
    if (!v26 || *(_OWORD *)&v60[8] == 0 && !*(void *)v60)
    {
LABEL_43:
      if (a9)
      {
        __int16 v27 = 0;
      }
      else
      {
        __int16 v27 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v28 = [v67 recordID];
        uint64_t v29 = [v28 recordName];

        if (v29) {
          CFDictionarySetValue(v27, @"recordId", v29);
        }

        __int16 v30 = [v68 recordID];
        id v31 = [v30 recordName];

        if (v31) {
          CFDictionarySetValue(v27, @"wallpaperRecordId", v31);
        }

        id v32 = [v63 dataRepresentation];
        if (v32) {
          CFDictionarySetValue(v27, @"preKey", v32);
        }

        if (value) {
          CFDictionarySetValue(v27, @"wallpaperDataTag", value);
        }
        if (v66) {
          CFDictionarySetValue(v27, @"wallpaperMetadataTag", v66);
        }
        if (v64) {
          CFDictionarySetValue(v27, @"wallpaperLowResDataTag", v64);
        }
      }
      uint64_t v56 = v27;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v86 = 0x3032000000;
      os_activity_scope_state_s v87 = sub_23CAFFE38;
      uint64_t v88 = sub_23CAFFE48;
      id v89 = 0;
      uint64_t v77 = 0;
      double v78 = &v77;
      uint64_t v79 = 0x3032000000;
      uint64_t v80 = sub_23CAFFE38;
      uint64_t v81 = sub_23CAFFE48;
      id v82 = 0;
      dispatch_semaphore_t v33 = dispatch_semaphore_create(0);
      uint64_t v57 = [MEMORY[0x263F4B018] contextWithKnownSender:a9];
      id v55 = (void *)MEMORY[0x263F4AF20];
      id v34 = [v67 recordID];
      id v35 = [v34 recordName];
      id v36 = [v63 dataRepresentation];
      BOOL v37 = v26 == 0;
      if (v26) {
        id v38 = v66;
      }
      else {
        id v38 = 0;
      }
      if (v26) {
        id v39 = v64;
      }
      else {
        id v39 = 0;
      }
      if (v37) {
        id v40 = 0;
      }
      else {
        id v40 = value;
      }
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = sub_23CAFFE50;
      v70[3] = &unk_264E813C0;
      p_long long buf = &buf;
      BOOL v41 = v33;
      id v71 = v41;
      uint64_t v76 = a1;
      id v72 = v67;
      id v75 = &v77;
      __int16 v42 = v56;
      id v73 = v42;
      LOBYTE(v54) = a10;
      [v55 generateNickname:v58 senderContext:v57 forRecordID:v35 wallpaperDataTag:v40 wallpaperLowResDataTag:v39 wallpaperMetadataTag:v38 withKey:v36 processImageFields:v54 completionBlock:v70];

      dispatch_time_t v43 = dispatch_time(0, 10000000000);
      if (dispatch_semaphore_wait(v41, v43))
      {
        if (IMOSLoggingEnabled())
        {
          __int16 v44 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)__int16 v69 = 0;
            _os_log_impl(&dword_23CAED000, v44, OS_LOG_TYPE_INFO, "Timed out while waiting for Nickname BlastDoor and/or content analysis.", v69, 2u);
          }
        }
        uint64_t v45 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F4ADB0] code:-3000 userInfo:0];
        __int16 v46 = *(void **)(*((void *)&buf + 1) + 40);
        *(void *)(*((void *)&buf + 1) + 40) = v45;
      }
      id v20 = (void *)v78[5];
      if (v20)
      {
        id v47 = v20;
      }
      else
      {
        uint64_t v48 = *(void **)(*((void *)&buf + 1) + 40);
        if (!v48)
        {
          uint64_t v49 = (void *)MEMORY[0x263F087E8];
          uint64_t v83 = *MEMORY[0x263F07F80];
          v84 = @"Neither error nor result from blastdoor completion handler";
          uint64_t v50 = [NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
          uint64_t v51 = [v49 errorWithDomain:*MEMORY[0x263F4ADB0] code:-1000 userInfo:v50];
          int v52 = *(void **)(*((void *)&buf + 1) + 40);
          *(void *)(*((void *)&buf + 1) + 40) = v51;

          uint64_t v48 = *(void **)(*((void *)&buf + 1) + 40);
        }
        *a11 = v48;
      }

      _Block_object_dispose(&v77, 8);
      _Block_object_dispose(&buf, 8);

      goto LABEL_83;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_23CAED000, v22, OS_LOG_TYPE_INFO, "CKRecord contains incomplete wallpaper data for nickname", (uint8_t *)&buf, 2u);
      }
LABEL_81:

      goto LABEL_82;
    }
    goto LABEL_82;
  }
  if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_23CAED000, v19, OS_LOG_TYPE_INFO, "No error pointer provided, please fix", (uint8_t *)&buf, 2u);
    }
  }
  id v20 = 0;
LABEL_85:

  return v20;
}

void sub_23CAFFD44(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    objc_end_catch();
    JUMPOUT(0x23CAFFC88);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_23CAFFE38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_23CAFFE48(uint64_t a1)
{
}

void sub_23CAFFE50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v249 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v186 = a3;
  v187 = v5;
  if (v5)
  {
    group = dispatch_group_create();
    id v6 = [MEMORY[0x263F4AF58] sharedManager];
    uint64_t v184 = [v6 enablementGroup];

    id v7 = [MEMORY[0x263F4AF58] sharedManager];
    int v180 = [v7 checksForSensitivityOnNicknameReceive];

    id v8 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
    int v9 = [v8 isAllowU18SnapAssetsEnabled];

    char v179 = (v184 == 1) & ~(_BYTE)v9;
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134218240;
        *(void *)&uint8_t buf[4] = v184;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = (v184 == 1) & ~v9;
        _os_log_impl(&dword_23CAED000, v10, OS_LOG_TYPE_INFO, "About to construct the nickname with contentSafetyEnablementGroup: %ld, deleting sensitive assets: %d", buf, 0x12u);
      }
    }
    MEMORY[0x23ECF1AD0](@"BlastDoorNickname", @"BlastDoor");
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v12 = v187;
    if ((isKindOfClass & 1) == 0) {
      uint64_t v12 = 0;
    }
    id v13 = v12;
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v246 = sub_23CAFFE38;
    v247 = sub_23CAFFE48;
    id v248 = 0;
    id v14 = [v13 avatar];
    BOOL v15 = v14 == 0;

    if (!v15)
    {
      id v16 = [v13 avatar];
      id v17 = [v16 image];
      [v17 cgImage];
      id v18 = (void *)IMCreatePNGImageDataFromCGImageRef();

      uint64_t v231 = 0;
      v232 = &v231;
      uint64_t v233 = 0x3032000000;
      v234 = sub_23CAFFE38;
      v235 = sub_23CAFFE48;
      id v236 = 0;
      id v19 = *(void **)(a1 + 72);
      id v20 = [*(id *)(a1 + 40) recordID];
      id v21 = [v20 recordName];
      uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
      id obj = *(id *)(v22 + 40);
      uint64_t v23 = [v19 _assetTargetURLForRecordName:v21 fieldName:@"ad" error:&obj];
      objc_storeStrong((id *)(v22 + 40), obj);
      id v236 = v23;

      uint64_t v24 = v232[5];
      uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
      id v229 = *(id *)(v25 + 40);
      char v26 = [v18 writeToURL:v24 options:1 error:&v229];
      objc_storeStrong((id *)(v25 + 40), v229);
      if (v26)
      {
        if (v180)
        {
          dispatch_group_enter(group);
          __int16 v27 = [MEMORY[0x263F4AF50] sharedManager];
          uint64_t v28 = v232[5];
          v221[0] = MEMORY[0x263EF8330];
          v221[1] = 3221225472;
          v221[2] = sub_23CB013D8;
          v221[3] = &unk_264E81348;
          char v228 = v179;
          uint64_t v29 = *(void *)(a1 + 72);
          uint64_t v30 = *(void *)(a1 + 56);
          v224 = &v231;
          uint64_t v225 = v30;
          uint64_t v227 = v29;
          v226 = buf;
          id v222 = v13;
          v223 = group;
          [v27 isSensitiveContent:v28 contentAttachmentType:0 withChatID:0 completionHandler:v221];
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            id v31 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              LODWORD(v239) = 134217984;
              *(void *)((char *)&v239 + 4) = v184;
              _os_log_impl(&dword_23CAED000, v31, OS_LOG_TYPE_INFO, "Avatar image safety check was skipped, comm safety check group setting: %ld. Creating IMNicknameAvatarImage.", (uint8_t *)&v239, 0xCu);
            }
          }
          id v32 = objc_alloc(MEMORY[0x263F4AFE8]);
          dispatch_semaphore_t v33 = [v13 avatar];
          id v34 = [v33 imageName];
          id v35 = [(id)v232[5] path];
          uint64_t v36 = [v32 initWithImageName:v34 imageFilePath:v35 contentIsSensitive:0];
          BOOL v37 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v36;
        }
      }
      else
      {
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
      }
      _Block_object_dispose(&v231, 8);

      if ((v26 & 1) == 0) {
        goto LABEL_73;
      }
    }
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_40;
    }
    id v38 = [v13 pronouns];
    if (!v38) {
      goto LABEL_40;
    }
    id v39 = *(void **)(a1 + 72);
    id v40 = [v13 pronouns];
    LODWORD(v39) = [v39 _isObjectBlastDoorMorphology:v40];

    if (v39)
    {
      v181 = [v13 pronouns];
      v183 = objc_opt_new();
      unint64_t v41 = [v181 grammaticalGender];
      if (v41 <= 2) {
        [v183 setGender:v41 + 1];
      }
      unint64_t v42 = [v181 number];
      if (v42 <= 5) {
        [v183 setNumber:qword_23CB070C0[v42]];
      }
      dispatch_time_t v43 = [v181 customPronouns];
      if ([v43 count] && objc_msgSend(*(id *)(a1 + 72), "_NSMorphologyCustomPronounClass"))
      {
        long long v219 = 0u;
        long long v220 = 0u;
        long long v217 = 0u;
        long long v218 = 0u;
        v177 = v43;
        id v44 = v43;
        uint64_t v45 = [v44 countByEnumeratingWithState:&v217 objects:v244 count:16];
        if (v45)
        {
          uint64_t v46 = *(void *)v218;
          while (2)
          {
            for (uint64_t i = 0; i != v45; ++i)
            {
              if (*(void *)v218 != v46) {
                objc_enumerationMutation(v44);
              }
              uint64_t v48 = *(void **)(*((void *)&v217 + 1) + 8 * i);
              if ([*(id *)(a1 + 72) _isObjectBlastDoorCustomPronounPair:v48])
              {
                id v49 = v48;
                uint64_t v50 = objc_msgSend(*(id *)(a1 + 72), "_languageStringForEnumCase:", objc_msgSend(v49, "language"));
                char v51 = [v50 isEqual:@"en"];

                if (v51)
                {
                  id v145 = objc_alloc_init((Class)[*(id *)(a1 + 72) _NSMorphologyCustomPronounClass]);
                  v146 = [v49 pronoun];
                  v147 = [v146 subjectForm];
                  [v145 setSubjectForm:v147];

                  v148 = [v49 pronoun];
                  v149 = [v148 objectForm];
                  [v145 setObjectForm:v149];

                  v150 = [v49 pronoun];
                  v151 = [v150 possessiveForm];
                  [v145 setPossessiveForm:v151];

                  v152 = [v49 pronoun];
                  v153 = [v152 possessiveAdjectiveForm];
                  [v145 setPossessiveAdjectiveForm:v153];

                  v154 = [v49 pronoun];
                  v155 = [v154 reflexiveForm];
                  [v145 setReflexiveForm:v155];

                  [v183 setEnglishCustomPronoun:v145];
                  goto LABEL_76;
                }
              }
            }
            uint64_t v45 = [v44 countByEnumeratingWithState:&v217 objects:v244 count:16];
            if (v45) {
              continue;
            }
            break;
          }
        }
LABEL_76:

        dispatch_time_t v43 = v177;
      }
    }
    else
    {
LABEL_40:
      v183 = 0;
    }
    uint64_t v231 = 0;
    v232 = &v231;
    uint64_t v233 = 0x3032000000;
    v234 = sub_23CAFFE38;
    v235 = sub_23CAFFE48;
    id v236 = 0;
    int v52 = [v13 wallpaper];
    BOOL v53 = v52 == 0;

    if (!v53)
    {
      uint64_t v54 = [v13 wallpaper];
      v182 = [v54 posterArchive];

      id v55 = [v13 wallpaper];
      uint64_t v56 = [v55 lowResImage];
      uint64_t v57 = [v56 image];
      [v57 cgImage];
      v178 = (void *)IMCreatePNGImageDataFromCGImageRef();

      *(void *)&long long v239 = 0;
      *((void *)&v239 + 1) = &v239;
      uint64_t v240 = 0x3032000000;
      v241 = sub_23CAFFE38;
      v242 = sub_23CAFFE48;
      id v243 = 0;
      uint64_t v58 = *(void **)(a1 + 72);
      uint64_t v59 = [*(id *)(a1 + 40) recordID];
      uint64_t v60 = [v59 recordName];
      uint64_t v61 = *(void *)(*(void *)(a1 + 56) + 8);
      id v216 = *(id *)(v61 + 40);
      uint64_t v62 = [v58 _assetTargetURLForRecordName:v60 fieldName:@"wd" error:&v216];
      objc_storeStrong((id *)(v61 + 40), v216);
      id v243 = v62;

      uint64_t v210 = 0;
      v211 = &v210;
      uint64_t v212 = 0x3032000000;
      v213 = sub_23CAFFE38;
      v214 = sub_23CAFFE48;
      id v215 = 0;
      id v63 = *(void **)(a1 + 72);
      id v64 = [*(id *)(a1 + 40) recordID];
      uint64_t v65 = [v64 recordName];
      uint64_t v66 = *(void *)(*(void *)(a1 + 56) + 8);
      id v209 = *(id *)(v66 + 40);
      uint64_t v67 = [v63 _assetTargetURLForRecordName:v65 fieldName:@"lrwd" error:&v209];
      objc_storeStrong((id *)(v66 + 40), v209);
      id v215 = v67;

      if (v182)
      {
        uint64_t v68 = *(void *)(*((void *)&v239 + 1) + 40);
        uint64_t v69 = *(void *)(*(void *)(a1 + 56) + 8);
        id v208 = *(id *)(v69 + 40);
        char v70 = [v182 writeToURL:v68 options:1 error:&v208];
        objc_storeStrong((id *)(v69 + 40), v208);
        if ((v70 & 1) == 0) {
          goto LABEL_52;
        }
      }
      if (v178)
      {
        uint64_t v71 = v211[5];
        uint64_t v72 = *(void *)(*(void *)(a1 + 56) + 8);
        id v207 = *(id *)(v72 + 40);
        int v73 = [v178 writeToURL:v71 options:1 error:&v207];
        objc_storeStrong((id *)(v72 + 40), v207);
        if (!v73)
        {
LABEL_52:
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
          _Block_object_dispose(&v210, 8);

          _Block_object_dispose(&v239, 8);
          uint64_t v93 = v182;
LABEL_72:

          _Block_object_dispose(&v231, 8);
LABEL_73:
          _Block_object_dispose(buf, 8);

          goto LABEL_74;
        }
      }
      if (IMOSLoggingEnabled())
      {
        id v74 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v237 = 67109376;
          *(_DWORD *)v238 = v182 != 0;
          *(_WORD *)&v238[4] = 1024;
          *(_DWORD *)&v238[6] = v178 != 0;
          _os_log_impl(&dword_23CAED000, v74, OS_LOG_TYPE_INFO, "Completed wallpaper has wallpaperData: %i lowResData: %i", v237, 0xEu);
        }
      }
      id v75 = [v13 wallpaper];
      uint64_t v76 = [v75 metadata];
      uint64_t v77 = [v76 backgroundColor];

      if (v77)
      {
        id v163 = objc_alloc(MEMORY[0x263F4B0C8]);
        v174 = [v13 wallpaper];
        v171 = [v174 metadata];
        v168 = [v171 backgroundColor];
        [v168 red];
        double v79 = v78;
        v165 = [v13 wallpaper];
        uint64_t v80 = [v165 metadata];
        uint64_t v81 = [v80 backgroundColor];
        [v81 green];
        double v83 = v82;
        v84 = [v13 wallpaper];
        unsigned int v85 = [v84 metadata];
        uint64_t v86 = [v85 backgroundColor];
        [v86 blue];
        double v88 = v87;
        id v89 = [v13 wallpaper];
        id v90 = [v89 metadata];
        __int16 v91 = [v90 backgroundColor];
        [v91 alpha];
        v164 = (void *)[v163 initWithRed:v79 green:v83 blue:v88 alpha:v92];
      }
      else
      {
        v164 = 0;
      }
      id v161 = objc_alloc(MEMORY[0x263F4B0C8]);
      v175 = [v13 wallpaper];
      v172 = [v175 metadata];
      v169 = [v172 fontColor];
      [v169 red];
      double v95 = v94;
      v166 = [v13 wallpaper];
      uint64_t v96 = [v166 metadata];
      uint64_t v97 = [v96 fontColor];
      [v97 green];
      double v99 = v98;
      double v100 = [v13 wallpaper];
      __int16 v101 = [v100 metadata];
      double v102 = [v101 fontColor];
      [v102 blue];
      double v104 = v103;
      v105 = [v13 wallpaper];
      v106 = [v105 metadata];
      v107 = [v106 fontColor];
      [v107 alpha];
      v159 = (void *)[v161 initWithRed:v95 green:v99 blue:v104 alpha:v108];

      id v156 = objc_alloc(MEMORY[0x263F4B0C0]);
      v176 = [v13 wallpaper];
      v173 = [v176 metadata];
      v158 = [v173 fontName];
      v170 = [v13 wallpaper];
      v167 = [v170 metadata];
      [v167 fontSize];
      double v110 = v109;
      v162 = [v13 wallpaper];
      v160 = [v162 metadata];
      [v160 fontWeight];
      double v112 = v111;
      v113 = [v159 dictionaryRepresentation];
      v114 = [v13 wallpaper];
      v115 = [v114 metadata];
      uint64_t v116 = [v115 isVertical];
      v117 = (void *)MEMORY[0x263F4B0C0];
      v118 = [v13 wallpaper];
      v119 = [v118 metadata];
      v120 = objc_msgSend(v117, "wallpaperExtensionIdentifierFromType:", objc_msgSend(v119, "type"));
      v121 = [v164 dictionaryRepresentation];
      v157 = (void *)[v156 initWithFontName:v158 fontSize:v113 fontWeight:v116 fontColor:v120 isVertical:v121 type:v110 backgroundColor:v112];

      if (v180)
      {
        if (*(void *)(*((void *)&v239 + 1) + 40))
        {
          objc_msgSend(*(id *)(a1 + 72), "_getImageURLForPosterDataAt:");
          id v122 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v122 = (id)v211[5];
        }
        v125 = v122;
        if (v122)
        {
          dispatch_group_enter(group);
          v133 = [MEMORY[0x263F4AF50] sharedManager];
          v197[0] = MEMORY[0x263EF8330];
          v197[1] = 3221225472;
          v197[2] = sub_23CB015DC;
          v197[3] = &unk_264E81370;
          char v206 = v179;
          uint64_t v134 = *(void *)(a1 + 72);
          uint64_t v135 = *(void *)(a1 + 56);
          v201 = &v239;
          uint64_t v202 = v135;
          v203 = &v210;
          v204 = &v231;
          uint64_t v205 = v134;
          id v198 = v13;
          id v199 = v157;
          v200 = group;
          [v133 isSensitiveContent:v125 contentAttachmentType:0 withChatID:0 completionHandler:v197];

          v126 = v198;
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            v136 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v237 = 0;
              _os_log_impl(&dword_23CAED000, v136, OS_LOG_TYPE_INFO, "Skipped wallpaper safety check because we couldn't find a wallpaper image URL.", v237, 2u);
            }
          }
          id v137 = objc_alloc(MEMORY[0x263F4B0B8]);
          v126 = [v13 wallpaper];
          v138 = [v126 highResFileName];
          v139 = [*(id *)(*((void *)&v239 + 1) + 40) path];
          v140 = [v13 wallpaper];
          v141 = [v140 lowResFileName];
          v142 = [(id)v211[5] path];
          uint64_t v143 = [v137 initWithFileName:v138 filePath:v139 lowResFileName:v141 lowResFilePath:v142 metadata:v157 contentIsSensitive:0];
          v144 = (void *)v232[5];
          v232[5] = v143;
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v123 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v237 = 134217984;
            *(void *)v238 = v184;
            _os_log_impl(&dword_23CAED000, v123, OS_LOG_TYPE_INFO, "Wallpaper safety check was skipped, comm safety check group setting: %ld. Creating IMWallpaper.", v237, 0xCu);
          }
        }
        id v124 = objc_alloc(MEMORY[0x263F4B0B8]);
        v125 = [v13 wallpaper];
        v126 = [v125 highResFileName];
        v127 = [*(id *)(*((void *)&v239 + 1) + 40) path];
        v128 = [v13 wallpaper];
        v129 = [v128 lowResFileName];
        v130 = [(id)v211[5] path];
        uint64_t v131 = [v124 initWithFileName:v126 filePath:v127 lowResFileName:v129 lowResFilePath:v130 metadata:v157 contentIsSensitive:0];
        v132 = (void *)v232[5];
        v232[5] = v131;
      }
      _Block_object_dispose(&v210, 8);

      _Block_object_dispose(&v239, 8);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23CB01864;
    block[3] = &unk_264E81398;
    uint64_t v194 = *(void *)(a1 + 64);
    id v189 = v13;
    v195 = buf;
    id v190 = v183;
    v196 = &v231;
    id v191 = *(id *)(a1 + 40);
    id v192 = *(id *)(a1 + 48);
    id v193 = *(id *)(a1 + 32);
    dispatch_group_notify(group, MEMORY[0x263EF83A0], block);

    uint64_t v93 = v189;
    goto LABEL_72;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_74:
}

void sub_23CB013D8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [v5 localizedDescription];
      id v8 = (void *)v7;
      int v9 = @"No error";
      if (v7) {
        int v9 = (__CFString *)v7;
      }
      *(_DWORD *)long long buf = 67109378;
      int v24 = a2;
      __int16 v25 = 2112;
      char v26 = v9;
      _os_log_impl(&dword_23CAED000, v6, OS_LOG_TYPE_INFO, "Avatar image was checked for sensitive content. Is sensitive: %d, error: %@", buf, 0x12u);
    }
  }
  if (a2 && *(unsigned char *)(a1 + 80))
  {
    id v10 = *(void **)(a1 + 72);
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v12 + 40);
    [v10 _removeFile:v11 error:&obj];
    objc_storeStrong((id *)(v12 + 40), obj);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;
  }
  id v15 = objc_alloc(MEMORY[0x263F4AFE8]);
  id v16 = [*(id *)(a1 + 32) avatar];
  id v17 = [v16 imageName];
  id v18 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) path];
  uint64_t v19 = [v15 initWithImageName:v17 imageFilePath:v18 contentIsSensitive:a2];
  uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
  id v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_23CB015DC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109378;
      int v30 = a2;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_impl(&dword_23CAED000, v6, OS_LOG_TYPE_INFO, "Wallpaper image was checked for sensitive content. Is sensitive: %d, error: %@", buf, 0x12u);
    }
  }
  if (a2 && *(unsigned char *)(a1 + 96))
  {
    uint64_t v7 = *(void **)(a1 + 88);
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v9 + 40);
    [v7 _removeFile:v8 error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    id v10 = *(void **)(a1 + 88);
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    id v27 = *(id *)(v12 + 40);
    [v10 _removeFile:v11 error:&v27];
    objc_storeStrong((id *)(v12 + 40), v27);
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;

    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;
  }
  id v17 = objc_alloc(MEMORY[0x263F4B0B8]);
  id v18 = [*(id *)(a1 + 32) wallpaper];
  uint64_t v19 = [v18 highResFileName];
  uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) path];
  id v21 = [*(id *)(a1 + 32) wallpaper];
  uint64_t v22 = [v21 lowResFileName];
  uint64_t v23 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) path];
  uint64_t v24 = [v17 initWithFileName:v19 filePath:v20 lowResFileName:v22 lowResFilePath:v23 metadata:*(void *)(a1 + 40) contentIsSensitive:a2];
  uint64_t v25 = *(void *)(*(void *)(a1 + 80) + 8);
  char v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v24;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

intptr_t sub_23CB01864(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F4AFE0]);
  id v3 = [*(id *)(a1 + 32) firstName];
  int v4 = [*(id *)(a1 + 32) lastName];
  uint64_t v5 = [v2 initWithFirstName:v3 lastName:v4 avatar:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) pronouns:*(void *)(a1 + 40) wallpaper:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v9 = [*(id *)(a1 + 48) recordID];
  id v10 = [v9 recordName];
  [v8 setRecordID:v10];

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setPreBlastDoorPayloadData:*(void *)(a1 + 56)];
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) avatar];
      int v13 = [v12 hasImage];
      id v14 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) wallpaper];
      int v15 = [v14 wallpaperExists];
      id v16 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) wallpaper];
      int v17 = [v16 lowResWallpaperExists];
      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      v20[0] = 67109890;
      v20[1] = v13;
      __int16 v21 = 1024;
      int v22 = v15;
      __int16 v23 = 1024;
      int v24 = v17;
      __int16 v25 = 2112;
      uint64_t v26 = v18;
      _os_log_impl(&dword_23CAED000, v11, OS_LOG_TYPE_INFO, "Completed nickname parsing (hasImage: %i, hasWallpaper: %i, hasLowResWallpaper: %i) from public record: %@", (uint8_t *)v20, 0x1Eu);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

id sub_23CB01AB4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    uint64_t v30 = 0;
    __int16 v31 = &v30;
    uint64_t v32 = 0x2050000000;
    int v4 = (void *)qword_268BC9FA8;
    uint64_t v33 = qword_268BC9FA8;
    if (!qword_268BC9FA8)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      id v35 = sub_23CB04328;
      uint64_t v36 = &unk_264E813E8;
      BOOL v37 = &v30;
      sub_23CB04328((uint64_t)&buf);
      int v4 = (void *)v31[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v30, 8);
    id v29 = 0;
    uint64_t v6 = [v5 unarchiveConfigurationAtURL:v3 format:-1 error:&v29];
    id v7 = v29;
    uint64_t v8 = [v6 providerBundleIdentifier];
    char v9 = [v8 isEqualToString:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"];

    if ((v9 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        int v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          __int16 v25 = [v6 providerBundleIdentifier];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v25;
          _os_log_impl(&dword_23CAED000, v24, OS_LOG_TYPE_INFO, "Poster is not a photo, stop trying to get an image URL. Config bundle ID: %@", (uint8_t *)&buf, 0xCu);
        }
      }
      int v22 = 0;
      goto LABEL_30;
    }
    uint64_t v30 = 0;
    __int16 v31 = &v30;
    uint64_t v32 = 0x2050000000;
    id v10 = (void *)qword_268BC9FB8;
    uint64_t v33 = qword_268BC9FB8;
    if (!qword_268BC9FB8)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      id v35 = sub_23CB044E0;
      uint64_t v36 = &unk_264E813E8;
      BOOL v37 = &v30;
      sub_23CB044E0((uint64_t)&buf);
      id v10 = (void *)v31[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v30, 8);
    uint64_t v12 = [v6 assetDirectory];
    id v28 = v7;
    int v13 = [v11 loadFromURL:v12 error:&v28];
    id v14 = v28;

    if (v13)
    {
      int v15 = [v13 media];
      BOOL v16 = [v15 count] == 1;

      if (v16)
      {
        int v17 = [v13 media];
        uint64_t v18 = [v17 firstObject];

        uint64_t v19 = [v6 assetDirectory];
        uint64_t v20 = [v18 subpath];
        __int16 v21 = [v19 URLByAppendingPathComponent:v20];

        int v22 = [v21 URLByAppendingPathComponent:@"output.layerStack/portrait-layer_background.HEIC"];

LABEL_29:
        id v7 = v14;
LABEL_30:

        goto LABEL_31;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_23CAED000, v26, OS_LOG_TYPE_INFO, "Expected the poster config to have exactly one media", (uint8_t *)&buf, 2u);
        }
LABEL_27:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_23CAED000, v26, OS_LOG_TYPE_INFO, "Failed to generate a poster config. Error: %@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_27;
    }
    int v22 = 0;
    goto LABEL_29;
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_23CAED000, v23, OS_LOG_TYPE_INFO, "Given nil for the poster url, bailing.", (uint8_t *)&buf, 2u);
    }
  }
  int v22 = 0;
LABEL_31:

  return v22;
}

void sub_23CB01F48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    objc_end_catch();
    JUMPOUT(0x23CB01EE0);
  }
  _Unwind_Resume(exception_object);
}

id sub_23CB01FC8(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void **a7)
{
  v90[1] = *MEMORY[0x263EF8340];
  id v75 = a3;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      v84 = a1;
      __int16 v85 = 2112;
      id v86 = v75;
      _os_log_impl(&dword_23CAED000, v10, OS_LOG_TYPE_INFO, "Creating record from nickname {nickname: %@, preKey: %@}", buf, 0x16u);
    }
  }
  id v11 = [a1 publicDictionaryRepresentationWithoutAvatar];
  uint64_t v12 = JWEncodeDictionary();

  if (v12)
  {
    int v13 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", v12, @"n", 0);
    id v14 = [a1 avatar];
    int v15 = [v14 publicDictionaryMetadataRepresentation];
    int v73 = JWEncodeDictionary();

    BOOL v16 = [a1 avatar];
    uint64_t v72 = [v16 imageData];

    if (v72) {
      BOOL v17 = v73 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    int v18 = !v17;
    int v19 = IMOSLoggingEnabled();
    if (v18)
    {
      if (v19)
      {
        uint64_t v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_23CAED000, v20, OS_LOG_TYPE_INFO, "Nickname has avatar data", buf, 2u);
        }
      }
      [v13 setObject:v73 forKey:@"am"];
      [v13 setObject:v72 forKey:@"ad"];
    }
    else if (v19)
    {
      int v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        v84 = a1;
        _os_log_impl(&dword_23CAED000, v24, OS_LOG_TYPE_INFO, "Nickname doesn't have avatar data {nickname: %@}", buf, 0xCu);
      }
    }
    id v76 = 0;
    id v74 = [MEMORY[0x263F4AFF0] encryptAndTagPlainFields:v13 withPreKey:v75 returningRecordTag:&v76 error:a7];
    id v25 = v76;
    uint64_t v71 = v25;
    if (v74 && v25)
    {
      char v70 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v26 = [a1 wallpaper];
      int v27 = [v26 wallpaperExists];

      if (v27)
      {
        id v28 = objc_alloc(MEMORY[0x263F4AFF8]);
        id v29 = [a1 wallpaper];
        uint64_t v30 = [v29 wallpaperData];
        __int16 v31 = (void *)[v28 initWithFieldName:@"wd" plainData:v30];

        uint64_t v32 = [MEMORY[0x263F4AFF0] encryptAndTagPlainField:v31 withPreKey:v75 returningFieldTag:a4 error:a7];
        uint64_t v33 = [v32 fieldName];
        uint64_t v81 = v33;
        id v34 = [v32 dataRepresentationWithError:a7];
        double v82 = v34;
        id v35 = [NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
        [v70 addEntriesFromDictionary:v35];
      }
      uint64_t v36 = [a1 wallpaper];
      int v37 = [v36 lowResWallpaperExists];

      if (v37)
      {
        id v38 = objc_alloc(MEMORY[0x263F4AFF8]);
        id v39 = [a1 wallpaper];
        id v40 = [v39 lowResWallpaperData];
        unint64_t v41 = (void *)[v38 initWithFieldName:@"lrwd" plainData:v40];

        unint64_t v42 = [MEMORY[0x263F4AFF0] encryptAndTagPlainField:v41 withPreKey:v75 returningFieldTag:a5 error:a7];
        dispatch_time_t v43 = [v42 fieldName];
        double v79 = v43;
        id v44 = [v42 dataRepresentationWithError:a7];
        uint64_t v80 = v44;
        uint64_t v45 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
        [v70 addEntriesFromDictionary:v45];
      }
      uint64_t v46 = [a1 wallpaper];
      id v47 = [v46 metadata];

      if (v47)
      {
        uint64_t v48 = [a1 wallpaper];
        id v49 = [v48 publicDictionaryRepresentation];
        uint64_t v50 = JWEncodeDictionary();

        char v51 = (void *)[objc_alloc(MEMORY[0x263F4AFF8]) initWithFieldName:@"wm" plainData:v50];
        int v52 = [MEMORY[0x263F4AFF0] encryptAndTagPlainField:v51 withPreKey:v75 returningFieldTag:a6 error:a7];
        BOOL v53 = [v52 fieldName];
        uint64_t v77 = v53;
        uint64_t v54 = [v52 dataRepresentationWithError:a7];
        double v78 = v54;
        id v55 = [NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        [v70 addEntriesFromDictionary:v55];
      }
      uint64_t v56 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"ad", 0);
      uint64_t v57 = [v71 stringRepresentation];
      uint64_t v58 = [a1 _CKRecordFromDictionary:v74 recordName:v57 assetFieldNames:v56 error:a7];

      if (v58)
      {
        uint64_t v59 = [v58 recordID];
        uint64_t v60 = [v59 recordName];
        uint64_t v61 = [v60 stringByAppendingString:@"-wp"];

        uint64_t v62 = [a1 _wallpaperRecordFromDictionary:v70 owningRecord:v58 recordName:v61 error:a7];
        __int16 v23 = [MEMORY[0x263EFF9A0] dictionary];
        [v23 setObject:v58 forKeyedSubscript:@"profileRecord"];
        [v23 setObject:v62 forKeyedSubscript:@"wallpaperRecord"];
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v65 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            if (a7) {
              uint64_t v66 = *a7;
            }
            else {
              uint64_t v66 = 0;
            }
            *(_DWORD *)long long buf = 138412802;
            v84 = v66;
            __int16 v85 = 2112;
            id v86 = v74;
            __int16 v87 = 2112;
            id v88 = a1;
            _os_log_impl(&dword_23CAED000, v65, OS_LOG_TYPE_INFO, "Failed to create record from cipherFields {error: %@, cipherFields: %@, nickname: %@}", buf, 0x20u);
          }
        }
        __int16 v23 = 0;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v63 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          if (a7) {
            id v64 = *a7;
          }
          else {
            id v64 = 0;
          }
          *(_DWORD *)long long buf = 138412802;
          v84 = v64;
          __int16 v85 = 2112;
          id v86 = a1;
          __int16 v87 = 2112;
          id v88 = v75;
          _os_log_impl(&dword_23CAED000, v63, OS_LOG_TYPE_INFO, "Failed to encrypt nickname {error: %@, nickname: %@, preKey: %@}", buf, 0x20u);
        }
      }
      __int16 v23 = 0;
    }

    goto LABEL_56;
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      v84 = a1;
      _os_log_impl(&dword_23CAED000, v21, OS_LOG_TYPE_INFO, "Failed to create nicknameData -- Failed to create nickname public record {nickname: %@}", buf, 0xCu);
    }
  }
  if (a7)
  {
    int v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v89 = *MEMORY[0x263F07F80];
    v90[0] = @"Missing nickname";
    int v13 = [NSDictionary dictionaryWithObjects:v90 forKeys:&v89 count:1];
    [v22 errorWithDomain:*MEMORY[0x263F4ADB0] code:-1000 userInfo:v13];
    __int16 v23 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:

    goto LABEL_57;
  }
  __int16 v23 = 0;
LABEL_57:

  return v23;
}

uint64_t sub_23CB02954(void *a1, uint64_t a2, void *a3, void **a4)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v45 = a3;
  uint64_t v6 = [a1 avatar];
  id v7 = [v6 imageFilePath];

  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x263F4AFE0];
    char v9 = [v45 recordName];
    id v10 = [v8 _assetTargetURLForRecordName:v9 fieldName:@"ad" error:a4];

    if (!v10)
    {
      if (IMOSLoggingEnabled())
      {
        int v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          if (a4) {
            int v19 = *a4;
          }
          else {
            int v19 = 0;
          }
          *(_DWORD *)long long buf = 138412546;
          id v47 = v19;
          __int16 v48 = 2112;
          id v49 = v45;
          _os_log_impl(&dword_23CAED000, v18, OS_LOG_TYPE_INFO, "Failed to get target url for avatar image while updating nickname {error: %@, recordID: %@}", buf, 0x16u);
        }
      }
      goto LABEL_45;
    }
    id v11 = [a1 avatar];
    uint64_t v12 = [v11 imageName];
    int v13 = [v11 imageFilePath];
    id v14 = [NSURL fileURLWithPath:v13];
    int v15 = [a1 _moveFile:v14 newURL:v10 error:a4];
    if (v15)
    {
      BOOL v16 = [v10 path];
      BOOL v17 = objc_msgSend(objc_alloc(MEMORY[0x263F4AFE8]), "initWithImageName:imageFilePath:contentIsSensitive:", v12, v16, objc_msgSend(v11, "contentIsSensitive"));
      [a1 setAvatar:v17];
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412802;
        id v47 = v14;
        __int16 v48 = 2112;
        id v49 = v10;
        __int16 v50 = 2112;
        id v51 = v45;
        _os_log_impl(&dword_23CAED000, v20, OS_LOG_TYPE_INFO, "Failed to move image from %@ to %@ for recordID: %@", buf, 0x20u);
      }
    }
    if (!v15)
    {
LABEL_45:
      uint64_t v41 = 0;
      goto LABEL_46;
    }
  }
  __int16 v21 = [a1 wallpaper];

  if (v21)
  {
    int v22 = (void *)MEMORY[0x263F4AFE0];
    __int16 v23 = [v45 recordName];
    int v24 = [v22 _assetTargetURLForRecordName:v23 fieldName:@"wd" error:a4];

    id v25 = (void *)MEMORY[0x263F4AFE0];
    uint64_t v26 = [v45 recordName];
    int v27 = [v25 _assetTargetURLForRecordName:v26 fieldName:@"lrwd" error:a4];

    if (!v24 || !v27)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          if (a4) {
            id v34 = *a4;
          }
          else {
            id v34 = 0;
          }
          *(_DWORD *)long long buf = 138412546;
          id v47 = v34;
          __int16 v48 = 2112;
          id v49 = v45;
          _os_log_impl(&dword_23CAED000, v33, OS_LOG_TYPE_INFO, "Failed to get target url for wallpaper while updating nickname {error: %@, recordID: %@}", buf, 0x16u);
        }
      }
      goto LABEL_45;
    }
    id v28 = [a1 wallpaper];
    dispatch_time_t v43 = [v28 fileName];
    id v29 = [v28 filePath];
    id v44 = [v28 lowResFileName];
    uint64_t v30 = [v28 lowResFilePath];
    if (v29)
    {
      __int16 v31 = [NSURL fileURLWithPath:v29];
      if (([a1 _moveFile:v31 newURL:v24 error:a4] & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412802;
            id v47 = v31;
            __int16 v48 = 2112;
            id v49 = v24;
            __int16 v50 = 2112;
            id v51 = v45;
            _os_log_impl(&dword_23CAED000, v32, OS_LOG_TYPE_INFO, "Failed to move wallpaper from %@ to %@ for recordID: %@", buf, 0x20u);
          }
LABEL_33:

          goto LABEL_34;
        }
        goto LABEL_34;
      }
    }
    else
    {
      __int16 v31 = v24;
      int v24 = 0;
    }

    if (v30)
    {
      __int16 v31 = [NSURL fileURLWithPath:v30];
      if (([a1 _moveFile:v31 newURL:v27 error:a4] & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412802;
            id v47 = v31;
            __int16 v48 = 2112;
            id v49 = v27;
            __int16 v50 = 2112;
            id v51 = v45;
            _os_log_impl(&dword_23CAED000, v32, OS_LOG_TYPE_INFO, "Failed to move low res wallpaper from %@ to %@ for recordID: %@", buf, 0x20u);
          }
          goto LABEL_33;
        }
LABEL_34:

        goto LABEL_45;
      }
    }
    else
    {
      __int16 v31 = v27;
      int v27 = 0;
    }

    id v35 = [v24 path];
    uint64_t v36 = [v27 path];
    id v37 = objc_alloc(MEMORY[0x263F4B0B8]);
    id v38 = [v28 metadata];
    id v39 = objc_msgSend(v37, "initWithFileName:filePath:lowResFileName:lowResFilePath:metadata:contentIsSensitive:", v43, v35, v44, v36, v38, objc_msgSend(v28, "contentIsSensitive"));
    [a1 setWallpaper:v39];
  }
  id v40 = [v45 recordName];
  [a1 setRecordID:v40];

  uint64_t v41 = 1;
LABEL_46:

  return v41;
}

uint64_t sub_23CB03048(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t *a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x263F08850]);
  id v10 = [v8 path];
  int v11 = [v9 fileExistsAtPath:v10];

  if (v11)
  {
    uint64_t v12 = [v8 path];
    [v9 removeItemAtPath:v12 error:a5];
  }
  uint64_t v13 = [v9 moveItemAtURL:v7 toURL:v8 error:a5];
  if ((v13 & 1) == 0 && IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *a5;
      int v17 = 138412802;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      _os_log_impl(&dword_23CAED000, v14, OS_LOG_TYPE_INFO, "Failed to move item %@ to %@ with error %@", (uint8_t *)&v17, 0x20u);
    }
  }
  return v13;
}

uint64_t sub_23CB031D8(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263F08850]);
  id v7 = [v5 path];
  int v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    id v9 = [v5 path];
    uint64_t v10 = [v6 removeItemAtPath:v9 error:a4];

    if (IMOSLoggingEnabled())
    {
      int v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *a4;
        int v15 = 138412802;
        id v16 = v5;
        __int16 v17 = 1024;
        int v18 = v10;
        __int16 v19 = 2112;
        uint64_t v20 = v12;
        _os_log_impl(&dword_23CAED000, v11, OS_LOG_TYPE_INFO, "Attempted to remove item at path: %@, did succeed: %d, error: %@", (uint8_t *)&v15, 0x1Cu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v5;
        _os_log_impl(&dword_23CAED000, v13, OS_LOG_TYPE_INFO, "File %@ does not exist, can't remove.", (uint8_t *)&v15, 0xCu);
      }
    }
    uint64_t v10 = 0;
  }

  return v10;
}

id sub_23CB033C0(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void **a6)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v40 = a5;
  int v11 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"imsgNicknamePublicv2"];
  id v38 = v10;
  id v37 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v10];
  objc_msgSend(v11, "setRecordID:");
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v41 = v9;
  id obj = [v9 allKeys];
  uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(obj);
        }
        int v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v16 = [v41 objectForKey:v15];
        if ([v40 containsObject:v15])
        {
          __int16 v17 = [(id)objc_opt_class() _assetTargetURLForRecordName:v38 fieldName:v15 error:a6];
          int v18 = IMOSLoggingEnabled();
          if (!v17)
          {
            if (v18)
            {
              id v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                if (a6) {
                  uint64_t v30 = *a6;
                }
                else {
                  uint64_t v30 = 0;
                }
                *(_DWORD *)long long buf = 138412802;
                id v47 = v30;
                __int16 v48 = 2112;
                id v49 = v38;
                __int16 v50 = 2112;
                uint64_t v51 = (uint64_t)v15;
                _os_log_impl(&dword_23CAED000, v29, OS_LOG_TYPE_INFO, "Failed to create target URL for nickname asset {error: %@, recordName: %@, fieldName: %@}", buf, 0x20u);
              }
            }
            goto LABEL_44;
          }
          if (v18)
          {
            __int16 v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              id v47 = v17;
              _os_log_impl(&dword_23CAED000, v19, OS_LOG_TYPE_INFO, "Writing nickname asset {targetURL: %@}", buf, 0xCu);
            }
          }
          if ([v15 isEqualToString:@"ad"])
          {
            id v20 = objc_alloc(MEMORY[0x263F4AFE8]);
            uint64_t v21 = [v17 path];
            uint64_t v22 = (void *)[v20 initWithImageName:0 imageData:v16 imageFilePath:v21 contentIsSensitive:0 error:a6];

            if (!v22 || *a6)
            {
              if (IMOSLoggingEnabled())
              {
                __int16 v31 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                {
                  if (a6) {
                    uint64_t v32 = *a6;
                  }
                  else {
                    uint64_t v32 = 0;
                  }
                  uint64_t v33 = [v16 length];
                  *(_DWORD *)long long buf = 138412802;
                  id v47 = v32;
                  __int16 v48 = 2112;
                  id v49 = v17;
                  __int16 v50 = 2048;
                  uint64_t v51 = v33;
                  _os_log_impl(&dword_23CAED000, v31, OS_LOG_TYPE_INFO, "Failed to write nickname asset {error: %@, targetURL: %@, data.length: %ld}", buf, 0x20u);
                }
              }
LABEL_44:

              if (IMOSLoggingEnabled())
              {
                id v34 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  if (a6) {
                    id v35 = *a6;
                  }
                  else {
                    id v35 = 0;
                  }
                  *(_DWORD *)long long buf = 138412546;
                  id v47 = v35;
                  __int16 v48 = 2112;
                  id v49 = v41;
                  _os_log_impl(&dword_23CAED000, v34, OS_LOG_TYPE_INFO, "Failed to create record from dictionary {error: %@, dictionary: %@}", buf, 0x16u);
                }
              }
              id v28 = 0;
              goto LABEL_52;
            }
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v23 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              id v47 = v17;
              _os_log_impl(&dword_23CAED000, v23, OS_LOG_TYPE_INFO, "Writing nickname asset {targetURL: %@}", buf, 0xCu);
            }
          }
          int v24 = (void *)[objc_alloc(MEMORY[0x263EFD5E0]) initWithFileURL:v17];
          [v24 setItemTypeHint:@"fxd"];
          [v11 setObject:v24 forKey:v15];
        }
        else
        {
          [v11 setObject:v16 forKey:v15];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = [v11 allKeys];
      int v27 = [v41 allKeys];
      *(_DWORD *)long long buf = 138412802;
      id v47 = v26;
      __int16 v48 = 2112;
      id v49 = v27;
      __int16 v50 = 2112;
      uint64_t v51 = (uint64_t)v40;
      _os_log_impl(&dword_23CAED000, v25, OS_LOG_TYPE_INFO, "Created record from dictionary {record.allKeys: %@, dictionary.allKeys: %@, assetFieldNames: %@}", buf, 0x20u);
    }
  }
  id v28 = v11;
LABEL_52:

  return v28;
}

id sub_23CB03A20(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t *a6)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"poster"];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v11];
  [v12 setRecordID:v13];

  int v27 = v10;
  id v28 = (void *)[objc_alloc(MEMORY[0x263EFD820]) initWithRecord:v10 action:1];
  objc_msgSend(v12, "setObject:forKeyedSubscript:");
  uint64_t v14 = [v9 objectForKeyedSubscript:@"wd"];
  uint64_t v15 = [v9 objectForKeyedSubscript:@"lrwd"];
  uint64_t v30 = [v9 objectForKeyedSubscript:@"wm"];
  id v29 = [MEMORY[0x263F4AFE0] _assetTargetURLForRecordName:v11 fieldName:@"wm" error:a6];
  id v16 = [MEMORY[0x263F4AFE0] _assetTargetURLForRecordName:v11 fieldName:@"lrwd" error:a6];
  [v12 setObject:v30 forKey:@"wm"];
  if (v15 | v14)
  {
    id v17 = objc_alloc(MEMORY[0x263F4B0B8]);
    int v18 = [v29 path];
    __int16 v19 = [v16 path];
    LOBYTE(v26) = 0;
    id v20 = (void *)[v17 initWithFileName:&stru_26F0B9AA8 filePath:v18 data:v14 lowResFileName:&stru_26F0B9AA8 lowResFilePath:v19 lowResData:v15 metadata:0 contentIsSensitive:v26 error:a6];

    if ((!v20 || *a6) && IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        if (a6) {
          uint64_t v22 = *a6;
        }
        else {
          uint64_t v22 = 0;
        }
        *(_DWORD *)long long buf = 138412290;
        uint64_t v32 = v22;
        _os_log_impl(&dword_23CAED000, v21, OS_LOG_TYPE_INFO, "Failed to write low res wallpaper asset {error: %@}", buf, 0xCu);
      }
    }
    if (v15)
    {
      uint64_t v23 = (void *)[objc_alloc(MEMORY[0x263EFD5E0]) initWithFileURL:v16];
      [v23 setItemTypeHint:@"fxd"];
      [v12 setObject:v23 forKey:@"lrwd"];
    }
    if (v14)
    {
      int v24 = (void *)[objc_alloc(MEMORY[0x263EFD5E0]) initWithFileURL:v29];
      [v24 setItemTypeHint:@"fxd"];
      [v12 setObject:v24 forKey:@"wd"];
    }
  }

  return v12;
}

id sub_23CB03D9C(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t *a5)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = NSURL;
  id v10 = [(id)*MEMORY[0x263F4ADA8] stringByExpandingTildeInPath];
  id v11 = [v9 fileURLWithPath:v10];

  uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v13 = [v11 path];
  char v14 = [v12 fileExistsAtPath:v13];

  if ((v14 & 1) != 0
    || ([MEMORY[0x263F08850] defaultManager],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        char v16 = [v15 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:a5],
        v15,
        (v16 & 1) != 0))
  {
    id v17 = [v7 stringByAppendingFormat:@"-%@", v8];
    int v18 = [v17 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

    __int16 v19 = [v11 URLByAppendingPathComponent:v18];

    id v11 = v19;
    id v20 = v11;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        if (a5) {
          uint64_t v22 = *a5;
        }
        else {
          uint64_t v22 = 0;
        }
        *(_DWORD *)long long buf = 138412546;
        uint64_t v25 = v22;
        __int16 v26 = 2112;
        id v27 = v11;
        _os_log_impl(&dword_23CAED000, v21, OS_LOG_TYPE_INFO, "Failed to create nickname assets directory {error: %@, url: %@}", buf, 0x16u);
      }
    }
    id v20 = 0;
  }

  return v20;
}

uint64_t sub_23CB03FE4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = objc_opt_respondsToSelector();
  }
  else {
    char v4 = 0;
  }
  char v5 = v4 & objc_opt_respondsToSelector();

  return v5 & 1;
}

uint64_t sub_23CB04050(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  int v4 = objc_opt_respondsToSelector();
  int v5 = objc_opt_respondsToSelector();

  return v4 & v5 & 1;
}

id sub_23CB040B0()
{
  if (qword_268BC9FA0 != -1) {
    dispatch_once(&qword_268BC9FA0, &unk_26F0B8EC8);
  }
  v0 = (void *)qword_268BC9F98;
  return v0;
}

uint64_t sub_23CB04104()
{
  uint64_t result = MEMORY[0x23ECF1AD0](@"NSMorphologyCustomPronoun", @"Foundation");
  qword_268BC9F98 = result;
  return result;
}

__CFString *sub_23CB04134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 == 1) {
    return @"en";
  }
  else {
    return 0;
  }
}

id sub_23CB04148()
{
  v2[5] = *MEMORY[0x263EF8340];
  v2[0] = @"n";
  v2[1] = @"am";
  v2[2] = @"ad";
  v2[3] = @"wm";
  v2[4] = @"lrwd";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:5];
  return v0;
}

id sub_23CB041EC()
{
  void v2[6] = *MEMORY[0x263EF8340];
  v2[0] = @"n";
  v2[1] = @"am";
  v2[2] = @"ad";
  v2[3] = @"wm";
  v2[4] = @"lrwd";
  v2[5] = @"wd";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:6];
  return v0;
}

id sub_23CB04298()
{
  v2[3] = *MEMORY[0x263EF8340];
  v2[0] = @"n";
  v2[1] = @"am";
  v2[2] = @"ad";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:3];
  return v0;
}

Class sub_23CB04328(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!qword_268BC9FB0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = sub_23CB0446C;
    v4[4] = &unk_264E81420;
    v4[5] = v4;
    long long v5 = xmmword_264E81408;
    uint64_t v6 = 0;
    qword_268BC9FB0 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!qword_268BC9FB0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PRSPosterArchiver");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)sub_23CB05F3C();
LABEL_8:
    free(v2);
  }
  qword_268BC9FA8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_23CB0446C()
{
  uint64_t result = _sl_dlopen();
  qword_268BC9FB0 = result;
  return result;
}

Class sub_23CB044E0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!qword_268BC9FC0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = sub_23CB04624;
    v4[4] = &unk_264E81420;
    v4[5] = v4;
    long long v5 = xmmword_264E81440;
    uint64_t v6 = 0;
    qword_268BC9FC0 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!qword_268BC9FC0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PFPosterConfiguration");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)sub_23CB05F64();
LABEL_8:
    free(v2);
  }
  qword_268BC9FB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_23CB04624()
{
  uint64_t result = _sl_dlopen();
  qword_268BC9FC0 = result;
  return result;
}

void sub_23CB046B4(int a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v63 = a4;
  uint64_t v13 = a5;
  id v14 = a6;
  uint64_t v15 = (void (**)(void, void, void, void, void))v14;
  if (!v12 && (a1 & 1) == 0)
  {
    if (v14) {
      (*((void (**)(id, id, void, void, uint64_t))v14 + 2))(v14, v11, 0, 0, 301);
    }
    goto LABEL_141;
  }
  if (a1)
  {
    id v62 = objc_alloc_init(MEMORY[0x263EFF990]);
  }
  else
  {
    id v62 = 0;
  }
  char v16 = [v11 path];
  uint64_t v61 = [v16 pathExtension];

  id v17 = v63;
  uint64_t v18 = (uint64_t)v17;
  if (!v17)
  {
    __int16 v19 = [MEMORY[0x263F08850] defaultManager];
    id v20 = [v11 path];
    uint64_t v18 = [v19 _randomSimilarFilePathAsPath:v20];
  }
  uint64_t v60 = (void *)v18;
  uint64_t v21 = [objc_alloc(NSURL) initFileURLWithPath:v18 isDirectory:0];
  CFURLRef v22 = (const __CFURL *)v21;
  if (v11)
  {
    uint64_t v23 = CFReadStreamCreateWithFile(0, (CFURLRef)v11);
    if (v22) {
      goto LABEL_12;
    }
LABEL_15:
    int v24 = 0;
    if (!v12) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  uint64_t v23 = 0;
  if (!v21) {
    goto LABEL_15;
  }
LABEL_12:
  int v24 = CFWriteStreamCreateWithFile(0, v22);
  if (!v12) {
    goto LABEL_20;
  }
LABEL_16:
  if (IMOSLoggingEnabled())
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFIndex domain = (CFIndex)v12;
      _os_log_impl(&dword_23CAED000, v25, OS_LOG_TYPE_INFO, "       inputKey: %@", buf, 0xCu);
    }
  }
LABEL_20:
  if (v17 && IMOSLoggingEnabled())
  {
    __int16 v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFIndex domain = (CFIndex)v17;
      _os_log_impl(&dword_23CAED000, v26, OS_LOG_TYPE_INFO, " outputFileName: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFIndex domain = (CFIndex)v11;
      _os_log_impl(&dword_23CAED000, v27, OS_LOG_TYPE_INFO, "       inputURL: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFIndex domain = (CFIndex)v61;
      _os_log_impl(&dword_23CAED000, v28, OS_LOG_TYPE_INFO, "  pathExtension: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFIndex domain = (CFIndex)v22;
      _os_log_impl(&dword_23CAED000, v29, OS_LOG_TYPE_INFO, "      outputURL: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFIndex domain = (CFIndex)v23;
      _os_log_impl(&dword_23CAED000, v30, OS_LOG_TYPE_INFO, "     readStream: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFIndex domain = (CFIndex)v24;
      _os_log_impl(&dword_23CAED000, v31, OS_LOG_TYPE_INFO, "    writeStream: %@", buf, 0xCu);
    }
  }
  if (!v23)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_70;
    }
    uint64_t v41 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFIndex domain = (CFIndex)v11;
      _os_log_impl(&dword_23CAED000, v41, OS_LOG_TYPE_INFO, "Could not create read stream for input file: %@", buf, 0xCu);
    }
    goto LABEL_69;
  }
  BOOL v32 = CFReadStreamOpen(v23) == 0;
  int v33 = IMOSLoggingEnabled();
  if (v32)
  {
    if (!v33) {
      goto LABEL_70;
    }
    uint64_t v41 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFIndex domain = (CFIndex)v11;
      _os_log_impl(&dword_23CAED000, v41, OS_LOG_TYPE_INFO, "Could not open read stream for input file: %@", buf, 0xCu);
    }
LABEL_69:

LABEL_70:
    if (v24)
    {
      int v59 = 0;
      uint64_t v42 = 0;
      CFStringRef v36 = (const __CFString *)*MEMORY[0x263EFFE78];
      goto LABEL_106;
    }
    goto LABEL_108;
  }
  if (v33)
  {
    id v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFIndex domain = (CFIndex)v23;
      _os_log_impl(&dword_23CAED000, v34, OS_LOG_TYPE_INFO, "Successfully opened read stream: %@", buf, 0xCu);
    }
  }
  Main = CFRunLoopGetMain();
  CFStringRef v36 = (const __CFString *)*MEMORY[0x263EFFE78];
  CFReadStreamScheduleWithRunLoop(v23, Main, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  if (v24)
  {
    BOOL v37 = CFWriteStreamOpen(v24) == 0;
    int v38 = IMOSLoggingEnabled();
    if (v37)
    {
      if (v38)
      {
        long long v43 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          CFIndex domain = (CFIndex)v22;
          _os_log_impl(&dword_23CAED000, v43, OS_LOG_TYPE_INFO, "Could not open write stream for output file: %@", buf, 0xCu);
        }
      }
      int v59 = 0;
      goto LABEL_104;
    }
    if (v38)
    {
      id v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        CFIndex domain = (CFIndex)v24;
        _os_log_impl(&dword_23CAED000, v39, OS_LOG_TYPE_INFO, "Successfully opened write stream: %@", buf, 0xCu);
      }
    }
    id v40 = CFRunLoopGetMain();
    CFWriteStreamScheduleWithRunLoop(v24, v40, v36);
    if (a1)
    {
      if (qword_26AF3FDA0 != -1) {
        dispatch_once(&qword_26AF3FDA0, &unk_26F0B8EE8);
      }
      if (off_26AF3FD98) {
        int v59 = off_26AF3FD98(v23, v24, v62);
      }
      else {
        int v59 = 1;
      }
      if (IMOSLoggingEnabled())
      {
        long long v44 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 134217984;
          CFIndex domain = v59;
          _os_log_impl(&dword_23CAED000, v44, OS_LOG_TYPE_INFO, "SecProtectStream result: %ld", buf, 0xCu);
        }
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_95;
      }
      long long v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        CFIndex domain = (CFIndex)v62;
        _os_log_impl(&dword_23CAED000, v45, OS_LOG_TYPE_INFO, "       outputKey: %@", buf, 0xCu);
      }
    }
    else
    {
      if (qword_26AF3FDA8 != -1) {
        dispatch_once(&qword_26AF3FDA8, &unk_26F0B8F08);
      }
      if (off_26AF3FDB0) {
        int v59 = off_26AF3FDB0(v23, v24, v12);
      }
      else {
        int v59 = 1;
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_95;
      }
      long long v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134217984;
        CFIndex domain = v59;
        _os_log_impl(&dword_23CAED000, v45, OS_LOG_TYPE_INFO, "SecExposeStream result: %ld", buf, 0xCu);
      }
    }

LABEL_95:
    if (!v59)
    {
      int v59 = 0;
      uint64_t v42 = 1;
LABEL_106:
      CFWriteStreamSetClient(v24, 0, 0, 0);
      CFWriteStreamClose(v24);
      __int16 v50 = CFRunLoopGetMain();
      CFWriteStreamUnscheduleFromRunLoop(v24, v50, v36);
      if (!v23) {
        goto LABEL_114;
      }
      goto LABEL_113;
    }
    CFStreamError Error = CFReadStreamGetError(v23);
    CFStreamError v47 = CFWriteStreamGetError(v24);
    if (IMOSLoggingEnabled())
    {
      __int16 v48 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134218240;
        CFIndex domain = Error.domain;
        __int16 v66 = 2048;
        id v67 = (id)Error.error;
        _os_log_impl(&dword_23CAED000, v48, OS_LOG_TYPE_INFO, "  read error: [%ld:%ld]", buf, 0x16u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v49 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134218240;
        CFIndex domain = v47.domain;
        __int16 v66 = 2048;
        id v67 = (id)v47.error;
        _os_log_impl(&dword_23CAED000, v49, OS_LOG_TYPE_INFO, " write error: [%ld:%ld]", buf, 0x16u);
      }
    }
LABEL_104:
    uint64_t v42 = 0;
    goto LABEL_106;
  }
LABEL_108:
  if (IMOSLoggingEnabled())
  {
    uint64_t v51 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFIndex domain = (CFIndex)v22;
      _os_log_impl(&dword_23CAED000, v51, OS_LOG_TYPE_INFO, "Could not create write stream for output file: %@", buf, 0xCu);
    }
  }
  int v59 = 0;
  uint64_t v42 = 0;
  if (!v23) {
    goto LABEL_114;
  }
LABEL_113:
  CFReadStreamSetClient(v23, 0, 0, 0);
  CFReadStreamClose(v23);
  uint64_t v52 = CFRunLoopGetMain();
  CFReadStreamUnscheduleFromRunLoop(v23, v52, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
LABEL_114:
  im_dispatch_after();
  if (v42)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v53 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        uint64_t v54 = @"decrypting";
        *(_DWORD *)long long buf = 138412802;
        if (a1) {
          uint64_t v54 = @"encrypting";
        }
        CFIndex domain = (CFIndex)v54;
        __int16 v66 = 2112;
        id v67 = v11;
        __int16 v68 = 2112;
        CFURLRef v69 = v22;
        _os_log_impl(&dword_23CAED000, v53, OS_LOG_TYPE_INFO, "Succeeded %@ input URL: %@    output URL: %@", buf, 0x20u);
      }
    }
  }
  else
  {

    if (IMOSLoggingEnabled())
    {
      id v55 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        uint64_t v56 = @"decrypting";
        *(_DWORD *)long long buf = 138413058;
        if (a1) {
          uint64_t v56 = @"encrypting";
        }
        CFIndex domain = (CFIndex)v56;
        __int16 v66 = 2112;
        id v67 = v11;
        __int16 v68 = 2112;
        CFURLRef v69 = 0;
        __int16 v70 = 2048;
        uint64_t v71 = v59;
        _os_log_impl(&dword_23CAED000, v55, OS_LOG_TYPE_INFO, "** Failed %@ input URL: %@    output URL: %@     result: %ld", buf, 0x2Au);
      }
    }
    id v62 = 0;
    CFURLRef v22 = 0;
  }
  if (v13 && a1)
  {
    if (v42) {
      uint64_t v57 = 0;
    }
    else {
      uint64_t v57 = 300;
    }
    v13[2](v13, v11, v42, v22, v62, v57);
  }
  else if (v15 && (a1 & 1) == 0)
  {
    if (v42) {
      uint64_t v58 = 0;
    }
    else {
      uint64_t v58 = 301;
    }
    ((void (**)(void, id, uint64_t, const __CFURL *, uint64_t))v15)[2](v15, v11, v42, v22, v58);
  }

LABEL_141:
}

void *sub_23CB05504()
{
  uint64_t result = (void *)MEMORY[0x23ECF1AE0]("SecProtectStream", @"MessageProtection");
  off_26AF3FD98 = result;
  return result;
}

void *sub_23CB05534()
{
  uint64_t result = (void *)MEMORY[0x23ECF1AE0]("SecExposeStream", @"MessageProtection");
  off_26AF3FDB0 = result;
  return result;
}

void sub_23CB05564(uint64_t a1)
{
  id v2 = *(const void **)(a1 + 32);
  if (v2) {
    CFRelease(v2);
  }
  id v3 = *(const void **)(a1 + 40);
  if (v3)
  {
    CFRelease(v3);
  }
}

uint64_t IMOptOutOfOptimizedMadridAttachmentDownloadPath()
{
  uint64_t v0 = 1;
  unint64_t v1 = [MEMORY[0x263F4A0B8] sharedInstanceForBagType:1];
  id v2 = [v1 objectForKey:@"should-disallow-authget"];
  char v3 = [v2 BOOLValue];

  if ((v3 & 1) == 0)
  {
    int v4 = [MEMORY[0x263F4A840] sharedInstance];
    if ([v4 isInternalInstall])
    {
      char v5 = IMGetCachedDomainBoolForKey();

      if (v5) {
        return 1;
      }
    }
    else
    {
    }
    return 0;
  }
  return v0;
}

uint64_t IMSetOptOutOfOptimizedMadridAttachmentDownloadPath()
{
  IMSetDomainBoolForKey();
  return IMSetDomainBoolForKey();
}

uint64_t IMOptOutOfOptimizedMadridAttachmentUploadPath()
{
  uint64_t v0 = 1;
  unint64_t v1 = [MEMORY[0x263F4A0B8] sharedInstanceForBagType:1];
  id v2 = [v1 objectForKey:@"should-disallow-authput"];
  char v3 = [v2 BOOLValue];

  if ((v3 & 1) == 0)
  {
    int v4 = [MEMORY[0x263F4A840] sharedInstance];
    if ([v4 isInternalInstall])
    {
      char v5 = IMGetCachedDomainBoolForKey();

      if (v5) {
        return 1;
      }
    }
    else
    {
    }
    return 0;
  }
  return v0;
}

uint64_t IMSetOptOutOfOptimizedMadridAttachmentUploadPath()
{
  IMSetDomainBoolForKey();
  return IMSetDomainBoolForKey();
}

uint64_t IMTransferRequestIsForMessages(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  int v5 = [v3 isEqualToString:@"com.apple.madrid"];
  uint64_t v6 = IMSafeTemporaryDirectory();
  uint64_t v7 = [v6 path];
  unsigned int v8 = [v4 hasPrefix:v7];

  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = @"NO";
      if (v5) {
        id v11 = @"YES";
      }
      else {
        id v11 = @"NO";
      }
      if (v8) {
        id v10 = @"YES";
      }
      int v13 = 138412546;
      id v14 = v11;
      __int16 v15 = 2112;
      char v16 = v10;
      _os_log_impl(&dword_23CAED000, v9, OS_LOG_TYPE_INFO, "checking if transfer request is for Messages, topicIsMadrid: %@, receivePathPrefixIsMessages: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  return v5 & v8;
}

void sub_23CB05948()
{
  sub_23CAF02B0();
  sub_23CAF02C4(&dword_23CAED000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_23CB059CC()
{
  sub_23CAF02B0();
  sub_23CAF02C4(&dword_23CAED000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_23CB05A50()
{
  sub_23CAF02B0();
  sub_23CAF02C4(&dword_23CAED000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_23CB05AD4()
{
  sub_23CAF02B0();
  sub_23CAF02C4(&dword_23CAED000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_23CB05B58()
{
  sub_23CAF02B0();
  sub_23CAF02C4(&dword_23CAED000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_23CB05BDC()
{
  sub_23CAF02B0();
  sub_23CAF02C4(&dword_23CAED000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_23CB05C60()
{
  sub_23CAF02B0();
  sub_23CAF02C4(&dword_23CAED000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_23CB05CE4()
{
  sub_23CAF02B0();
  sub_23CAF02C4(&dword_23CAED000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_23CB05D68()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v0 = 138412546;
  uint64_t v1 = @"mS";
  __int16 v2 = 2080;
  uint64_t v3 = "dictionary";
  _os_log_error_impl(&dword_23CAED000, &_os_log_internal, OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_23CB05E04()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v0 = 138412546;
  uint64_t v1 = @"mO";
  __int16 v2 = 2080;
  uint64_t v3 = "dictionary";
  _os_log_error_impl(&dword_23CAED000, &_os_log_internal, OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_23CB05EA0()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v0 = 138412546;
  uint64_t v1 = @"mL";
  __int16 v2 = 2080;
  uint64_t v3 = "dictionary";
  _os_log_error_impl(&dword_23CAED000, &_os_log_internal, OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

uint64_t sub_23CB05F3C()
{
  uint64_t v0 = abort_report_np();
  return sub_23CB05F64(v0);
}

uint64_t sub_23CB05F64()
{
  uint64_t v0 = abort_report_np();
  return sub_23CB05F8C(v0);
}

void sub_23CB05F8C(void *a1)
{
  objc_end_catch();
}

void sub_23CB05FB0(void *a1)
{
  objc_end_catch();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

CFStreamError CFReadStreamGetError(CFReadStreamRef stream)
{
  CFIndex v1 = MEMORY[0x270EE4D98](stream);
  result.error = v2;
  result.CFIndex domain = v1;
  return result;
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFReadStreamScheduleWithRunLoop(CFReadStreamRef stream, CFRunLoopRef runLoop, CFRunLoopMode runLoopMode)
{
}

Boolean CFReadStreamSetClient(CFReadStreamRef stream, CFOptionFlags streamEvents, CFReadStreamClientCallBack clientCB, CFStreamClientContext *clientContext)
{
  return MEMORY[0x270EE4DD0](stream, streamEvents, clientCB, clientContext);
}

void CFReadStreamUnscheduleFromRunLoop(CFReadStreamRef stream, CFRunLoopRef runLoop, CFRunLoopMode runLoopMode)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5538](alloc, fileURL);
}

CFStreamError CFWriteStreamGetError(CFWriteStreamRef stream)
{
  CFIndex v1 = MEMORY[0x270EE5540](stream);
  result.error = v2;
  result.CFIndex domain = v1;
  return result;
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x270EE5558](stream);
}

void CFWriteStreamScheduleWithRunLoop(CFWriteStreamRef stream, CFRunLoopRef runLoop, CFRunLoopMode runLoopMode)
{
}

Boolean CFWriteStreamSetClient(CFWriteStreamRef stream, CFOptionFlags streamEvents, CFWriteStreamClientCallBack clientCB, CFStreamClientContext *clientContext)
{
  return MEMORY[0x270EE5568](stream, streamEvents, clientCB, clientContext);
}

void CFWriteStreamUnscheduleFromRunLoop(CFWriteStreamRef stream, CFRunLoopRef runLoop, CFRunLoopMode runLoopMode)
{
}

uint64_t IMCreatePNGImageDataFromCGImageRef()
{
  return MEMORY[0x270F3D040]();
}

uint64_t IMGetCachedDomainBoolForKey()
{
  return MEMORY[0x270F3CD18]();
}

uint64_t IMGetiMessageSettings()
{
  return MEMORY[0x270F3CD80]();
}

uint64_t IMGreenTeaAttachmentReadLoggingFormat()
{
  return MEMORY[0x270F3D048]();
}

uint64_t IMGreenTeaAttachmentTransmitLoggingFormat()
{
  return MEMORY[0x270F3D050]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x270F3CE08]();
}

uint64_t IMSafeTemporaryDirectory()
{
  return MEMORY[0x270F3D0C0]();
}

uint64_t IMSetDomainBoolForKey()
{
  return MEMORY[0x270F3CE30]();
}

uint64_t IMSetEmbeddedTempDirectory()
{
  return MEMORY[0x270F3D0C8]();
}

uint64_t IMSharedHelperNickNameEnabled()
{
  return MEMORY[0x270F3D0F0]();
}

uint64_t IMSingleObjectArray()
{
  return MEMORY[0x270F3CE58]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x270F3CEA8]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x270F3CEB0]();
}

uint64_t JWDecodeDictionary()
{
  return MEMORY[0x270F3CED8]();
}

uint64_t JWEncodeDictionary()
{
  return MEMORY[0x270F3CEE0]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t OSLogHandleForIMEventCategory()
{
  return MEMORY[0x270F3CEF8]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x270F3CF00]();
}

uint64_t StringGUID()
{
  return MEMORY[0x270F3CF10]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _FZErrorTypeFromResponseCodeAndError()
{
  return MEMORY[0x270F281F0]();
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x270F3CF18]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x270F3CFB8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void exit(int a1)
{
}

uint64_t failReasonStringForMMCSError()
{
  return MEMORY[0x270F494E0]();
}

void free(void *a1)
{
}

uint64_t im_assert_primary_queue()
{
  return MEMORY[0x270F3CFC0]();
}

uint64_t im_dispatch_after()
{
  return MEMORY[0x270F3CFC8]();
}

uint64_t im_dispatch_after_primary_queue()
{
  return MEMORY[0x270F3CFD0]();
}

uint64_t im_primary_queue()
{
  return MEMORY[0x270F3CFD8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t parseMMCSError()
{
  return MEMORY[0x270F494E8]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}