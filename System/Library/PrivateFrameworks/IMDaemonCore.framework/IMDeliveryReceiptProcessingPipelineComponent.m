@interface IMDeliveryReceiptProcessingPipelineComponent
- (IMDeliveryReceiptProcessingPipelineComponent)initWithMessageStore:(id)a3;
- (id)_processDeliveryReceiptForMessage:(id)a3 date:(id)a4 isFromOffGridCapableDevice:(BOOL)a5 chat:(id)a6;
- (id)runIndividuallyWithInput:(id)a3;
- (void)_metricMessageGUIDDelivered:(id)a3 sendDate:(id)a4 deliveryDate:(id)a5;
- (void)_metricMessageGUIDSendToDelivered:(id)a3;
- (void)_reduceExpectedSatelliteDeliveriesOnMessage:(id)a3 chat:(id)a4;
@end

@implementation IMDeliveryReceiptProcessingPipelineComponent

- (IMDeliveryReceiptProcessingPipelineComponent)initWithMessageStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDeliveryReceiptProcessingPipelineComponent;
  v6 = [(IMDeliveryReceiptProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_messageStore, a3);
  }

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [v4 GUID];
      *(_DWORD *)buf = 138412290;
      v26 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "<IMDeliveryReceiptProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);
    }
  }
  if (IMGetCachedDomainBoolForKey())
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = [v4 GUID];
        *(_DWORD *)buf = 138412290;
        v26 = v8;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "    Ignoring delivery receipt for message: %@", buf, 0xCu);
      }
    }
    objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
  }
  else
  {
    v10 = [v4 GUID];
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v10;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "    Received Fresh Delivery Receipt For Message GUID: %@", buf, 0xCu);
      }
    }
    v12 = [(IMDMessageStore *)self->_messageStore messageWithGUID:v10];
    if (v12)
    {
      v13 = [(IMDMessageStore *)self->_messageStore chatForMessage:v12];
      v14 = (void *)MEMORY[0x1E4F1C9C8];
      v15 = [v4 timestamp];
      v16 = objc_msgSend(v14, "__im_iMessageDateFromTimeStamp:", v15);
      v17 = [v4 senderRegistrationProperties];
      v18 = -[IMDeliveryReceiptProcessingPipelineComponent _processDeliveryReceiptForMessage:date:isFromOffGridCapableDevice:chat:](self, "_processDeliveryReceiptForMessage:date:isFromOffGridCapableDevice:chat:", v12, v16, [v17 containsObject:*MEMORY[0x1E4F6B2C0]], v13);

      v24 = v18;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      [v4 setMessageItems:v19];

      if (v13)
      {
        [v4 setChat:v13];
        objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
      }
      else
      {
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        v22 = (void *)[v21 initWithDomain:*MEMORY[0x1E4F6BE88] code:8 userInfo:0];
        objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v22];
      }
    }
    else
    {
      id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
      v18 = (void *)[v20 initWithDomain:*MEMORY[0x1E4F6BE88] code:5 userInfo:0];
      objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v18];
    }
  }

  return v9;
}

- (id)_processDeliveryReceiptForMessage:(id)a3 date:(id)a4 isFromOffGridCapableDevice:(BOOL)a5 chat:(id)a6
{
  BOOL v7 = a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [v10 guid];
  if (v10)
  {
    if ([v10 isDelivered])
    {
      if (IMOSLoggingEnabled())
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          LOWORD(v37) = 0;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "    Message was already marked as delivered, ignoring", (uint8_t *)&v37, 2u);
        }
      }
      v15 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v16 = [v15 isCarrierPigeonEnabled];

      if ((v16 & v7) == 1 && [v10 expectedOffGridCapableDeliveries])
      {
        if (IMOSLoggingEnabled())
        {
          v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            LOWORD(v37) = 0;
            _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "    Updating expected off grid capable deliveries", (uint8_t *)&v37, 2u);
          }
        }
        [(IMDeliveryReceiptProcessingPipelineComponent *)self _reduceExpectedSatelliteDeliveriesOnMessage:v10 chat:v12];
        uint64_t v18 = [(IMDMessageStore *)self->_messageStore storeMessage:v10 forceReplace:0 modifyError:0 modifyFlags:1 flagMask:0x20000000000];

LABEL_51:
        id v10 = (id)v18;
      }
    }
    else
    {
      if ([v10 errorCode] != 43)
      {
        id v21 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        int v22 = [v21 isCarrierPigeonEnabled];

        if (v22)
        {
          if ([v10 needsRelay])
          {
            [v10 setNeedsRelay:0];
            if (IMOSLoggingEnabled())
            {
              v23 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                LOWORD(v37) = 0;
                _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "   Message was delivered, no need for relay anymore", (uint8_t *)&v37, 2u);
              }
            }
          }
        }
        if (IMOSLoggingEnabled())
        {
          v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            int v37 = 138412290;
            v38 = v13;
            _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "    Received delivery receipt for message: %@", (uint8_t *)&v37, 0xCu);
          }
        }
        objc_msgSend(v10, "setFlags:", objc_msgSend(v10, "flags") | 0x9000);
        if (v11)
        {
          [v10 setTimeDelivered:v11];
        }
        else
        {
          v25 = [MEMORY[0x1E4F1C9C8] date];
          [v10 setTimeDelivered:v25];
        }
        v26 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        int v27 = [v26 isScheduledMessagesCoreEnabled];

        if (v27)
        {
          [v10 setScheduleType:0];
          [v10 setScheduleState:0];
        }
        v28 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        int v29 = [v28 isCarrierPigeonEnabled];

        if ((v29 & v7) == 1 && [v10 expectedOffGridCapableDeliveries]) {
          [(IMDeliveryReceiptProcessingPipelineComponent *)self _reduceExpectedSatelliteDeliveriesOnMessage:v10 chat:v12];
        }
        v30 = [v10 time];
        uint64_t v31 = [v10 timeDelivered];
        [(IMDeliveryReceiptProcessingPipelineComponent *)self _metricMessageGUIDDelivered:v13 sendDate:v30 deliveryDate:v31];

        v32 = [v10 fileTransferGUIDs];
        LOBYTE(v31) = [v32 count] == 0;

        if ((v31 & 1) == 0) {
          [(IMDeliveryReceiptProcessingPipelineComponent *)self _metricMessageGUIDSendToDelivered:v10];
        }
        int v33 = [v10 errorCode];
        if (v33)
        {
          if (IMOSLoggingEnabled())
          {
            v34 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              int v35 = [v10 errorCode];
              int v37 = 67109120;
              LODWORD(v38) = v35;
              _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "    Message had error: %d", (uint8_t *)&v37, 8u);
            }
          }
          [v10 setErrorCode:0];
        }
        uint64_t v18 = [(IMDMessageStore *)self->_messageStore storeMessage:v10 forceReplace:0 modifyError:v33 != 0 modifyFlags:1 flagMask:0x20000009009];

        goto LABEL_51;
      }
      if (IMOSLoggingEnabled())
      {
        id v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          LOWORD(v37) = 0;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "   Message was already marked as black holed, ignoring", (uint8_t *)&v37, 2u);
        }
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LOWORD(v37) = 0;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "    Unable to find message to mark as delivered.", (uint8_t *)&v37, 2u);
      }
    }
    id v10 = 0;
  }

  return v10;
}

- (void)_reduceExpectedSatelliteDeliveriesOnMessage:(id)a3 chat:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  objc_msgSend(v9, "setExpectedOffGridCapableDeliveries:", objc_msgSend(v9, "expectedOffGridCapableDeliveries") - 1);
  if ([v9 isPendingSatelliteSend]) {
    BOOL v6 = [v9 expectedOffGridCapableDeliveries] != 0;
  }
  else {
    BOOL v6 = 0;
  }
  [v9 setIsPendingSatelliteSend:v6];
  if (![v9 expectedOffGridCapableDeliveries])
  {
    BOOL v7 = +[IMDOffGridAvailabilityTracker sharedTracker];
    v8 = [v5 recipient];
    [v7 stopTrackingHandle:v8];
  }
}

- (void)_metricMessageGUIDDelivered:(id)a3 sendDate:(id)a4 deliveryDate:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((IMIsRunningInUnitTesting() & 1) == 0)
  {
    [v9 timeIntervalSinceDate:v8];
    double v11 = v10;
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v22 = v11;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Delivery receipt time was: %f", buf, 0xCu);
      }
    }
    if (v11 > 0.0)
    {
      v13 = [MEMORY[0x1E4F6E890] sharedInstance];
      v14 = [NSNumber numberWithDouble:v11];
      [v13 trackEvent:*MEMORY[0x1E4F6DD80] withStatistic:v14];

      v15 = [NSNumber numberWithDouble:v11];
      uint64_t v19 = *MEMORY[0x1E4F6D728];
      id v20 = v15;
      int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      v17 = [MEMORY[0x1E4F6E890] sharedInstance];
      [v17 trackEvent:*MEMORY[0x1E4F6D890] withDictionary:v16];

      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v15, @"DeliveryDuration", v7, @"MessageGUID", 0);
      if (qword_1EBE2BBD0 != -1) {
        dispatch_once(&qword_1EBE2BBD0, &unk_1F3391760);
      }
      if (off_1EBE2BBC8) {
        off_1EBE2BBC8(7, @"iMessageDelivered Late Ack", v18, 0);
      }
    }
  }
}

- (void)_metricMessageGUIDSendToDelivered:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  v3 = +[IMDFileTransferCenter sharedInstance];
  id v4 = [v57 fileTransferGUIDs];
  id v5 = [v4 firstObject];
  v54 = [v3 transferForGUID:v5];

  BOOL v6 = [v57 timeDelivered];
  id v7 = [v54 createdDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  double v10 = [v57 fileTransferGUIDs];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v66 objects:v81 count:16];
  if (v11)
  {
    uint64_t v64 = 0;
    unsigned int v63 = 0;
    unsigned int v58 = 0;
    unsigned int v61 = 0;
    unsigned int v56 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v67;
    CFStringRef inConformsToUTI = (const __CFString *)*MEMORY[0x1E4F225D8];
    CFStringRef v60 = (const __CFString *)*MEMORY[0x1E4F226B8];
    CFStringRef v55 = (const __CFString *)*MEMORY[0x1E4F6EB48];
    float v14 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v67 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        v17 = +[IMDFileTransferCenter sharedInstance];
        uint64_t v18 = [v17 transferForGUID:v16];

        unint64_t v19 = [v18 totalBytes];
        id v20 = [v18 type];
        int v21 = UTTypeConformsTo(v20, @"public.heic");

        if (v21)
        {
          uint64_t v12 = (v12 + 1);
        }
        else
        {
          double v22 = [v18 type];
          int v23 = UTTypeConformsTo(v22, @"public.png");

          if (v23)
          {
            ++HIDWORD(v64);
          }
          else
          {
            v24 = [v18 type];
            int v25 = UTTypeConformsTo(v24, @"public.jpeg");

            if (v25)
            {
              LODWORD(v64) = v64 + 1;
            }
            else
            {
              v26 = [v18 type];
              int v27 = UTTypeConformsTo(v26, inConformsToUTI);

              if (v27)
              {
                ++v63;
              }
              else
              {
                v28 = [v18 type];
                int v29 = UTTypeConformsTo(v28, v60);

                if (v29)
                {
                  ++v61;
                }
                else
                {
                  v30 = [v18 type];
                  int v31 = UTTypeConformsTo(v30, v55);

                  if (v31) {
                    ++v58;
                  }
                  else {
                    ++v56;
                  }
                }
              }
            }
          }
        }

        float v14 = v14 + (float)v19;
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v66 objects:v81 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v64 = 0;
    unsigned int v63 = 0;
    unsigned int v58 = 0;
    unsigned int v61 = 0;
    unsigned int v56 = 0;
    uint64_t v12 = 0;
    float v14 = 0.0;
  }

  v32 = [NSNumber numberWithInt:v12];
  [v59 setObject:v32 forKey:*MEMORY[0x1E4F6D878]];

  int v33 = [NSNumber numberWithInt:HIDWORD(v64)];
  [v59 setObject:v33 forKey:*MEMORY[0x1E4F6D9D8]];

  v34 = [NSNumber numberWithInt:v64];
  [v59 setObject:v34 forKey:*MEMORY[0x1E4F6D8C8]];

  int v35 = [NSNumber numberWithInt:v63];
  [v59 setObject:v35 forKey:*MEMORY[0x1E4F6D870]];

  v36 = [NSNumber numberWithInt:v58];
  [v59 setObject:v36 forKey:*MEMORY[0x1E4F6DC00]];

  int v37 = [NSNumber numberWithInt:v61];
  [v59 setObject:v37 forKey:*MEMORY[0x1E4F6DA90]];

  v38 = [NSNumber numberWithInt:v56];
  [v59 setObject:v38 forKey:*MEMORY[0x1E4F6D9D0]];

  *(float *)&double v39 = v14;
  v40 = [NSNumber numberWithFloat:v39];
  [v59 setObject:v40 forKey:*MEMORY[0x1E4F6DD10]];

  v41 = [NSNumber numberWithDouble:v9];
  [v59 setObject:v41 forKey:*MEMORY[0x1E4F6DD08]];

  memset(v65, 0, sizeof(v65));
  v42 = [v57 fileTransferGUIDs];
  if ([v42 countByEnumeratingWithState:v65 objects:v80 count:16])
  {
    uint64_t v43 = **((void **)&v65[0] + 1);
    v44 = +[IMDFileTransferCenter sharedInstance];
    v45 = [v44 transferForGUID:v43];

    BOOL v46 = +[IMDAttachmentUtilities shouldEnablePreviewTranscodingQualityForTransfer:v45 isSending:1];
    v47 = [NSNumber numberWithBool:v46];
    [v59 setObject:v47 forKey:*MEMORY[0x1E4F6DCE0]];
  }
  if (IMOSLoggingEnabled())
  {
    v48 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      id v49 = [v57 guid];
      v50 = [v54 createdDate];
      v51 = [v57 timeDelivered];
      *(_DWORD *)buf = 138413314;
      id v71 = v49;
      __int16 v72 = 2048;
      double v73 = v9;
      __int16 v74 = 2112;
      v75 = v50;
      __int16 v76 = 2112;
      v77 = v51;
      __int16 v78 = 2048;
      double v79 = v14;
      _os_log_impl(&dword_1D967A000, v48, OS_LOG_TYPE_INFO, "For message: %@ timeDuration: %f file create date: %@ delivered time: %@ total file Size: %f", buf, 0x34u);
    }
  }
  v52 = [MEMORY[0x1E4F6E890] sharedInstance];
  v53 = (void *)[v59 copy];
  [v52 trackEvent:*MEMORY[0x1E4F6D8A0] withDictionary:v53];
}

- (void).cxx_destruct
{
}

@end