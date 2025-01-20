@interface IMMetricsCollector
+ (id)sharedInstance;
- (BOOL)trackAction:(id)a3 extensionBundleID:(id)a4 isNotification:(BOOL)a5;
- (BOOL)trackEvent:(id)a3;
- (BOOL)trackEvent:(id)a3 withCount:(id)a4;
- (BOOL)trackEvent:(id)a3 withDictionary:(id)a4;
- (BOOL)trackEvent:(id)a3 withStatistic:(id)a4;
- (IMMetricsCollector)init;
- (OS_dispatch_queue)metricsQueue;
- (id)_stringForDeleteMessagesType:(unint64_t)a3;
- (id)_stringForSpamType:(unint64_t)a3;
- (id)_stringForiMessageJunkType:(unint64_t)a3;
- (unint64_t)keepMessagesSourceTypeForDays:(int64_t)a3;
- (void)_ADClientAddValueForScalarKeyApiInit;
- (void)_ADClientPushValueForDistributionKeyApiInit;
- (void)_ADClientSetValueForScalarKeyApiInit;
- (void)_trackEvent:(id)a3;
- (void)_trackEvent:(id)a3 withCount:(id)a4;
- (void)_trackEvent:(id)a3 withDictionary:(id)a4;
- (void)_trackEvent:(id)a3 withStatistic:(id)a4;
- (void)_trackTranscodeFailureWithReason:(unint64_t)a3 messageType:(unint64_t)a4 sourceFile:(id)a5 sizeLimits:(id)a6 isSticker:(BOOL)a7 lowQualityModeEnabled:(BOOL)a8;
- (void)_trackTranscodeWithReason:(unint64_t)a3 messageType:(unint64_t)a4 sourceFile:(id)a5 highQualityFile:(id)a6 lowQualityFile:(id)a7 sizeLimits:(id)a8 isSticker:(BOOL)a9 transcoded:(BOOL)a10 lowQualityModeEnabled:(BOOL)a11;
- (void)autoBugCaptureWithSubType:(id)a3 errorPayload:(id)a4;
- (void)dealloc;
- (void)forceAutoBugCaptureWithSubType:(id)a3 errorPayload:(id)a4;
- (void)forceAutoBugCaptureWithSubType:(id)a3 errorPayload:(id)a4 type:(id)a5 context:(id)a6;
- (void)forceAutoBugCaptureWithSubType:(id)a3 errorPayload:(id)a4 type:(id)a5 context:(id)a6 metadata:(id)a7;
- (void)metricAttachmentValidation:(BOOL)a3 attachmentSize:(id)a4 operationalErrorDomain:(id)a5 operationalErrorCode:(id)a6 validationErrorDomain:(id)a7 validationErrorCode:(id)a8;
- (void)setMetricsQueue:(id)a3;
- (void)trackAttachmentDownloadLimitExceeded:(unint64_t)a3 limitSize:(id)a4 fileSize:(id)a5 qualityType:(unint64_t)a6 isSticker:(BOOL)a7 lowQualityModeEnabled:(BOOL)a8;
- (void)trackAttachmentDownloadSuccess:(id)a3 limitType:(unint64_t)a4 limitSize:(id)a5 qualityType:(unint64_t)a6 isSticker:(BOOL)a7 lowQualityModeEnabled:(BOOL)a8;
- (void)trackAttachmentRenderingAttempt:(BOOL)a3 failureReason:(id)a4;
- (void)trackDeleteMessages:(id)a3 sourceType:(unint64_t)a4;
- (void)trackMMSTranscodeFailureWithReason:(unint64_t)a3 sourceFile:(id)a4 sizeLimits:(id)a5 lowQualityModeEnabled:(BOOL)a6;
- (void)trackMMSTranscodeWithReason:(unint64_t)a3 sourceFile:(id)a4 highQualityFile:(id)a5 lowQualityFile:(id)a6 sizeLimits:(id)a7 transcoded:(BOOL)a8 lowQualityModeEnabled:(BOOL)a9;
- (void)trackRCSTranscodeFailureWithReason:(unint64_t)a3 sourceFile:(id)a4 sizeLimits:(id)a5 isSticker:(BOOL)a6 lowQualityModeEnabled:(BOOL)a7;
- (void)trackRCSTranscodeWithReason:(unint64_t)a3 sourceFile:(id)a4 highQualityFile:(id)a5 lowQualityFile:(id)a6 sizeLimits:(id)a7 isSticker:(BOOL)a8 transcoded:(BOOL)a9 lowQualityModeEnabled:(BOOL)a10;
- (void)trackSpamEvent:(unint64_t)a3;
- (void)trackSpamEvent:(unint64_t)a3 withDictionary:(id)a4;
- (void)trackiMessageJunkEvent:(unint64_t)a3;
- (void)trackiMessageJunkEvent:(unint64_t)a3 withDictionary:(id)a4;
- (void)trackiMessageTranscodeFailureWithReason:(unint64_t)a3 sourceFile:(id)a4 sizeLimits:(id)a5 isSticker:(BOOL)a6 lowQualityModeEnabled:(BOOL)a7;
- (void)trackiMessageTranscodeWithReason:(unint64_t)a3 sourceFile:(id)a4 highQualityFile:(id)a5 lowQualityFile:(id)a6 sizeLimits:(id)a7 isSticker:(BOOL)a8 transcoded:(BOOL)a9 lowQualityModeEnabled:(BOOL)a10;
@end

@implementation IMMetricsCollector

- (void)_trackEvent:(id)a3 withCount:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    if (qword_1EB4A6178 != -1) {
      dispatch_once(&qword_1EB4A6178, &unk_1EF2C1938);
    }
    if (off_1EB4A6170)
    {
      ((void (*)(id, uint64_t))off_1EB4A6170)(a3, [a4 integerValue]);
    }
    else if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "IMMetricsCollector, Could not weak link AggdPushValueForDistributionKey", v7, 2u);
      }
    }
    v8 = @"count";
    v9[0] = a4;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    AnalyticsSendEvent();
  }
}

- (BOOL)trackEvent:(id)a3 withCount:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = a3;
      __int16 v14 = 2112;
      id v15 = a4;
      _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "trackEvent %@ with count %@", buf, 0x16u);
    }
  }
  if (a4)
  {
    metricsQueue = self->_metricsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A0785890;
    block[3] = &unk_1E5A145E0;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(metricsQueue, block);
  }
  else if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = a3;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "IMMetricsCollector Nil count passed in for event %@", buf, 0xCu);
    }
  }
  return a4 != 0;
}

+ (id)sharedInstance
{
  if (qword_1EB4A6750 != -1) {
    dispatch_once(&qword_1EB4A6750, &unk_1EF2C18B8);
  }
  return (id)qword_1EB4A66B8;
}

- (IMMetricsCollector)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMMetricsCollector;
  v2 = [(IMMetricsCollector *)&v6 init];
  if (v2)
  {
    v2->_metricsQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.private.IMSharedUtilities.IMMetricsCollector", 0);
    v2->_diagnosticReporter = (SDRDiagnosticReporter *)objc_alloc_init((Class)MEMORY[0x1A6227910](@"SDRDiagnosticReporter", @"SymptomDiagnosticReporter"));
    if (!qword_1EB4A62C0)
    {
      v3 = (uint64_t *)MEMORY[0x1A6227920]("kSymptomDiagnosticSignatureSubTypeContext", @"SymptomDiagnosticReporter");
      if (v3) {
        uint64_t v4 = *v3;
      }
      else {
        uint64_t v4 = 0;
      }
      qword_1EB4A62C0 = v4;
    }
  }
  return v2;
}

- (void)trackiMessageTranscodeWithReason:(unint64_t)a3 sourceFile:(id)a4 highQualityFile:(id)a5 lowQualityFile:(id)a6 sizeLimits:(id)a7 isSticker:(BOOL)a8 transcoded:(BOOL)a9 lowQualityModeEnabled:(BOOL)a10
{
  *(_WORD *)((char *)&v10 + 1) = __PAIR16__(a10, a9);
  LOBYTE(v10) = a8;
  -[IMMetricsCollector _trackTranscodeWithReason:messageType:sourceFile:highQualityFile:lowQualityFile:sizeLimits:isSticker:transcoded:lowQualityModeEnabled:](self, "_trackTranscodeWithReason:messageType:sourceFile:highQualityFile:lowQualityFile:sizeLimits:isSticker:transcoded:lowQualityModeEnabled:", a3, 1, a4, a5, a6, a7, v10);
}

- (void)trackiMessageTranscodeFailureWithReason:(unint64_t)a3 sourceFile:(id)a4 sizeLimits:(id)a5 isSticker:(BOOL)a6 lowQualityModeEnabled:(BOOL)a7
{
}

- (void)trackMMSTranscodeWithReason:(unint64_t)a3 sourceFile:(id)a4 highQualityFile:(id)a5 lowQualityFile:(id)a6 sizeLimits:(id)a7 transcoded:(BOOL)a8 lowQualityModeEnabled:(BOOL)a9
{
  BYTE2(v9) = a9;
  BYTE1(v9) = a8;
  LOBYTE(v9) = 0;
  -[IMMetricsCollector _trackTranscodeWithReason:messageType:sourceFile:highQualityFile:lowQualityFile:sizeLimits:isSticker:transcoded:lowQualityModeEnabled:](self, "_trackTranscodeWithReason:messageType:sourceFile:highQualityFile:lowQualityFile:sizeLimits:isSticker:transcoded:lowQualityModeEnabled:", a3, 2, a4, a5, a6, a7, v9);
}

- (void)trackMMSTranscodeFailureWithReason:(unint64_t)a3 sourceFile:(id)a4 sizeLimits:(id)a5 lowQualityModeEnabled:(BOOL)a6
{
}

- (void)trackRCSTranscodeWithReason:(unint64_t)a3 sourceFile:(id)a4 highQualityFile:(id)a5 lowQualityFile:(id)a6 sizeLimits:(id)a7 isSticker:(BOOL)a8 transcoded:(BOOL)a9 lowQualityModeEnabled:(BOOL)a10
{
  *(_WORD *)((char *)&v10 + 1) = __PAIR16__(a10, a9);
  LOBYTE(v10) = a8;
  -[IMMetricsCollector _trackTranscodeWithReason:messageType:sourceFile:highQualityFile:lowQualityFile:sizeLimits:isSticker:transcoded:lowQualityModeEnabled:](self, "_trackTranscodeWithReason:messageType:sourceFile:highQualityFile:lowQualityFile:sizeLimits:isSticker:transcoded:lowQualityModeEnabled:", a3, 3, a4, a5, a6, a7, v10);
}

- (void)trackRCSTranscodeFailureWithReason:(unint64_t)a3 sourceFile:(id)a4 sizeLimits:(id)a5 isSticker:(BOOL)a6 lowQualityModeEnabled:(BOOL)a7
{
}

- (void)_trackTranscodeWithReason:(unint64_t)a3 messageType:(unint64_t)a4 sourceFile:(id)a5 highQualityFile:(id)a6 lowQualityFile:(id)a7 sizeLimits:(id)a8 isSticker:(BOOL)a9 transcoded:(BOOL)a10 lowQualityModeEnabled:(BOOL)a11
{
  id v61 = a5;
  id v16 = a6;
  id v17 = a7;
  id v57 = a8;
  v18 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v19 = *MEMORY[0x1E4F1C5F8];
  uint64_t v20 = *MEMORY[0x1E4F1C538];
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F1C5F8], *MEMORY[0x1E4F1C538], 0);
  if (v61)
  {
    v22 = [v61 resourceValuesForKeys:v21 error:0];
    if (v16)
    {
LABEL_3:
      v60 = [v16 resourceValuesForKeys:v21 error:0];
      goto LABEL_6;
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1E4F1CC08];
    if (v16) {
      goto LABEL_3;
    }
  }
  v60 = (void *)MEMORY[0x1E4F1CC08];
LABEL_6:
  v58 = v17;
  v59 = v16;
  v56 = (void *)v21;
  if (v17)
  {
    v23 = [v17 resourceValuesForKeys:v21 error:0];
  }
  else
  {
    v23 = (void *)MEMORY[0x1E4F1CC08];
  }
  v24 = [NSNumber numberWithUnsignedInteger:a4];
  [v18 setObject:v24 forKey:@"message_type"];

  v25 = [NSNumber numberWithUnsignedInteger:a3];
  [v18 setObject:v25 forKey:@"transcode_reason"];

  v26 = [v22 objectForKey:v20];
  v62 = [v60 objectForKey:v20];
  v27 = [v23 objectForKey:v20];
  v54 = v22;
  v28 = [v22 objectForKey:v19];
  v29 = [v60 objectForKey:v19];
  v53 = v23;
  v30 = [v23 objectForKey:v19];
  if (a9) {
    uint64_t v31 = 3;
  }
  else {
    uint64_t v31 = 0;
  }
  v32 = [v26 identifier];
  uint64_t v33 = [v32 length];

  if (!v33)
  {
    v35 = v57;
    v34 = v62;
    goto LABEL_26;
  }
  v34 = v62;
  if (a9)
  {
    uint64_t v31 = 3;
  }
  else
  {
    v36 = [v26 identifier];
    if (!IMUTTypeIsImage(v36))
    {
      v37 = [v26 identifier];
      BOOL IsSupportedAnimatedImage = IMUTTypeIsSupportedAnimatedImage(v37);

      v35 = v57;
      if (IsSupportedAnimatedImage)
      {
        uint64_t v31 = 1;
      }
      else
      {
        v39 = [v26 identifier];
        BOOL IsMovie = IMUTTypeIsMovie(v39);

        if (IsMovie) {
          uint64_t v31 = 2;
        }
        else {
          uint64_t v31 = 0;
        }
      }
      v34 = v62;
      goto LABEL_25;
    }

    uint64_t v31 = 1;
  }
  v35 = v57;
LABEL_25:
  v41 = [v26 identifier];
  [v18 setObject:v41 forKey:@"original_uttype"];

LABEL_26:
  v42 = [NSNumber numberWithUnsignedInteger:v31];
  [v18 setObject:v42 forKey:@"attachment_type"];

  v43 = [v34 identifier];
  uint64_t v44 = [v43 length];

  if (v44)
  {
    v45 = [v34 identifier];
    [v18 setObject:v45 forKey:@"high_quality_uttype"];
  }
  v46 = [v27 identifier];
  uint64_t v47 = [v46 length];

  if (v47)
  {
    v48 = [v27 identifier];
    [v18 setObject:v48 forKey:@"low_quality_uttype"];
  }
  if (v28) {
    [v18 setObject:v28 forKey:@"original_size"];
  }
  if (v29) {
    [v18 setObject:v29 forKey:@"high_quality_size_result"];
  }
  if (v30) {
    [v18 setObject:v30 forKey:@"low_quality_size_result"];
  }
  v49 = [v35 firstObject];
  if ((unint64_t)[v35 count] < 2)
  {
    v50 = 0;
  }
  else
  {
    v50 = [v35 objectAtIndex:1];
  }
  if (v49) {
    [v18 setObject:v49 forKey:@"high_quality_size_limit"];
  }
  if (v50) {
    [v18 setObject:v50 forKey:@"low_quality_size_limit"];
  }
  v51 = [NSNumber numberWithBool:a11];
  [v18 setObject:v51 forKey:@"low_quality_mode_enabled"];

  v52 = [NSNumber numberWithBool:a10];
  [v18 setObject:v52 forKey:@"was_transcoded"];

  [(IMMetricsCollector *)self trackEvent:@"com.apple.Messages.IMMetricsCollectorEventTranscodeAttachmentAttempt" withDictionary:v18];
}

- (void)_trackTranscodeFailureWithReason:(unint64_t)a3 messageType:(unint64_t)a4 sourceFile:(id)a5 sizeLimits:(id)a6 isSticker:(BOOL)a7 lowQualityModeEnabled:(BOOL)a8
{
  BOOL v35 = a8;
  BOOL v8 = a7;
  id v38 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v14 = *MEMORY[0x1E4F1C5F8];
  uint64_t v15 = *MEMORY[0x1E4F1C538];
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F1C5F8], *MEMORY[0x1E4F1C538], 0);
  v36 = (void *)v16;
  if (v38)
  {
    id v17 = [v38 resourceValuesForKeys:v16 error:0];
  }
  else
  {
    id v17 = (void *)MEMORY[0x1E4F1CC08];
  }
  v18 = [NSNumber numberWithUnsignedInteger:a4];
  [v13 setObject:v18 forKey:@"message_type"];

  uint64_t v19 = [NSNumber numberWithUnsignedInteger:a3];
  [v13 setObject:v19 forKey:@"transcode_reason"];

  uint64_t v20 = [v17 objectForKey:v15];
  uint64_t v21 = [v17 objectForKey:v14];
  if (v8) {
    uint64_t v22 = 3;
  }
  else {
    uint64_t v22 = 0;
  }
  v23 = [v20 identifier];
  uint64_t v24 = [v23 length];

  if (v24)
  {
    if (v8)
    {
      uint64_t v22 = 3;
    }
    else
    {
      v25 = [v20 identifier];
      if (IMUTTypeIsImage(v25))
      {
      }
      else
      {
        v26 = [v20 identifier];
        BOOL IsSupportedAnimatedImage = IMUTTypeIsSupportedAnimatedImage(v26);

        if (!IsSupportedAnimatedImage)
        {
          v28 = [v20 identifier];
          BOOL IsMovie = IMUTTypeIsMovie(v28);

          if (IsMovie) {
            uint64_t v22 = 2;
          }
          else {
            uint64_t v22 = 0;
          }
          goto LABEL_17;
        }
      }
      uint64_t v22 = 1;
    }
LABEL_17:
    v30 = [v20 identifier];
    [v13 setObject:v30 forKey:@"original_uttype"];
  }
  uint64_t v31 = [NSNumber numberWithUnsignedInteger:v22];
  [v13 setObject:v31 forKey:@"attachment_type"];

  if (v21) {
    [v13 setObject:v21 forKey:@"original_size"];
  }
  v32 = [v12 firstObject];
  if ((unint64_t)[v12 count] < 2)
  {
    uint64_t v33 = 0;
    if (!v32) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  uint64_t v33 = [v12 objectAtIndex:1];
  if (v32) {
LABEL_24:
  }
    [v13 setObject:v32 forKey:@"high_quality_size_limit"];
LABEL_25:
  if (v33) {
    [v13 setObject:v33 forKey:@"low_quality_size_limit"];
  }
  v34 = [NSNumber numberWithBool:v35];
  [v13 setObject:v34 forKey:@"low_quality_mode_enabled"];

  [(IMMetricsCollector *)self trackEvent:@"com.apple.Messages.IMMetricsCollectorEventTranscodeAttachmentFailure" withDictionary:v13];
}

- (void)trackAttachmentDownloadSuccess:(id)a3 limitType:(unint64_t)a4 limitSize:(id)a5 qualityType:(unint64_t)a6 isSticker:(BOOL)a7 lowQualityModeEnabled:(BOOL)a8
{
  BOOL v34 = a8;
  BOOL v8 = a7;
  id v36 = a3;
  id v12 = a5;
  id v13 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v14 = *MEMORY[0x1E4F1C5F8];
  uint64_t v15 = *MEMORY[0x1E4F1C538];
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F1C5F8], *MEMORY[0x1E4F1C538], 0);
  uint64_t v33 = (void *)v16;
  if (v36)
  {
    id v17 = [v36 resourceValuesForKeys:v16 error:0];
  }
  else
  {
    id v17 = (void *)MEMORY[0x1E4F1CC08];
  }
  v18 = [NSNumber numberWithUnsignedInteger:a4];
  [v13 setObject:v18 forKey:@"limit_type"];

  uint64_t v19 = [NSNumber numberWithUnsignedInteger:a6];
  [v13 setObject:v19 forKey:@"quality_type"];

  [v13 setObject:MEMORY[0x1E4F1CC38] forKey:@"was_downloaded"];
  if (v12) {
    [v13 setObject:v12 forKey:@"size_limit"];
  }
  uint64_t v20 = [v17 objectForKey:v15];
  uint64_t v21 = [v17 objectForKey:v14];
  if (v8) {
    uint64_t v22 = 3;
  }
  else {
    uint64_t v22 = 0;
  }
  v23 = [v20 identifier];
  uint64_t v24 = [v23 length];

  if (v24)
  {
    if (v8)
    {
      uint64_t v22 = 3;
    }
    else
    {
      v25 = [v20 identifier];
      if (IMUTTypeIsImage(v25))
      {
      }
      else
      {
        v26 = [v20 identifier];
        BOOL IsSupportedAnimatedImage = IMUTTypeIsSupportedAnimatedImage(v26);

        if (!IsSupportedAnimatedImage)
        {
          v28 = [v20 identifier];
          BOOL IsMovie = IMUTTypeIsMovie(v28);

          if (IsMovie) {
            uint64_t v22 = 2;
          }
          else {
            uint64_t v22 = 0;
          }
          goto LABEL_19;
        }
      }
      uint64_t v22 = 1;
    }
LABEL_19:
    v30 = [v20 identifier];
    [v13 setObject:v30 forKey:@"uttype"];
  }
  if (v21) {
    [v13 setObject:v21 forKey:@"attachment_size"];
  }
  uint64_t v31 = [NSNumber numberWithUnsignedInteger:v22];
  [v13 setObject:v31 forKey:@"attachment_type"];

  v32 = [NSNumber numberWithBool:v34];
  [v13 setObject:v32 forKey:@"low_quality_mode_enabled"];

  [(IMMetricsCollector *)self trackEvent:@"com.apple.Messages.IMMetricsCollectorEventDownloadAttachmentAttempt" withDictionary:v13];
}

- (void)trackAttachmentDownloadLimitExceeded:(unint64_t)a3 limitSize:(id)a4 fileSize:(id)a5 qualityType:(unint64_t)a6 isSticker:(BOOL)a7 lowQualityModeEnabled:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v21 = a4;
  id v14 = a5;
  uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v21) {
    [v15 setObject:v21 forKey:@"size_limit"];
  }
  if (v14) {
    [v15 setObject:v14 forKey:@"attachment_size"];
  }
  if (v9) {
    uint64_t v16 = 3;
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = [NSNumber numberWithUnsignedInteger:v16];
  [v15 setObject:v17 forKey:@"attachment_type"];

  v18 = [NSNumber numberWithUnsignedInteger:a3];
  [v15 setObject:v18 forKey:@"limit_type"];

  uint64_t v19 = [NSNumber numberWithUnsignedInteger:a6];
  [v15 setObject:v19 forKey:@"quality_type"];

  [v15 setObject:MEMORY[0x1E4F1CC28] forKey:@"was_downloaded"];
  uint64_t v20 = [NSNumber numberWithBool:v8];
  [v15 setObject:v20 forKey:@"low_quality_mode_enabled"];

  [(IMMetricsCollector *)self trackEvent:@"com.apple.Messages.IMMetricsCollectorEventDownloadAttachmentAttempt" withDictionary:v15];
}

- (void)trackAttachmentRenderingAttempt:(BOOL)a3 failureReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v10 = (__CFString *)a4;
  objc_super v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v7 = v6;
  if (v4)
  {
    [v6 setObject:MEMORY[0x1E4F1CC38] forKey:@"IsRenderingSuccessful"];
    BOOL v8 = &stru_1EF2CAD28;
    BOOL v9 = v7;
  }
  else
  {
    [v6 setObject:MEMORY[0x1E4F1CC28] forKey:@"IsRenderingSuccessful"];
    BOOL v9 = v7;
    BOOL v8 = v10;
  }
  [v9 setObject:v8 forKey:@"RenderingFailureReasons"];
  [(IMMetricsCollector *)self trackEvent:@"com.apple.Messages.IMMetricsCollectorEventRCSAttachmentRendering" withDictionary:v7];
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_metricsQueue);

  v3.receiver = self;
  v3.super_class = (Class)IMMetricsCollector;
  [(IMMetricsCollector *)&v3 dealloc];
}

- (void)_ADClientAddValueForScalarKeyApiInit
{
  if (qword_1EB4A6258 != -1) {
    dispatch_once(&qword_1EB4A6258, &unk_1EF2BE2B8);
  }
  return off_1EB4A6250;
}

- (void)_ADClientPushValueForDistributionKeyApiInit
{
  if (qword_1EB4A60C0 != -1) {
    dispatch_once(&qword_1EB4A60C0, &unk_1EF2C1918);
  }
  return off_1EB4A60B8;
}

- (void)_ADClientSetValueForScalarKeyApiInit
{
  if (qword_1EB4A6178 != -1) {
    dispatch_once(&qword_1EB4A6178, &unk_1EF2C1938);
  }
  return off_1EB4A6170;
}

- (void)_trackEvent:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (qword_1EB4A6258 != -1) {
      dispatch_once(&qword_1EB4A6258, &unk_1EF2BE2B8);
    }
    if (off_1EB4A6250)
    {
      off_1EB4A6250(a3, 1);
    }
    else if (IMOSLoggingEnabled())
    {
      BOOL v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "IMMetricsCollector, Could not weak link ADClientAddValueForScalarKey", v5, 2u);
      }
    }
    AnalyticsSendEvent();
  }
}

- (BOOL)trackEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = a3;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "trackEvent %@", buf, 0xCu);
    }
  }
  metricsQueue = self->_metricsQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A0854EA8;
  v8[3] = &unk_1E5A145B8;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(metricsQueue, v8);
  return 1;
}

- (void)_trackEvent:(id)a3 withStatistic:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    if (qword_1EB4A60C0 != -1) {
      dispatch_once(&qword_1EB4A60C0, &unk_1EF2C1918);
    }
    uint64_t v6 = (void (*)(id))off_1EB4A60B8;
    if (off_1EB4A60B8)
    {
      [a4 doubleValue];
      v6(a3);
    }
    else if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v8 = 0;
        _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "IMMetricsCollector, Could not weak link AggdPushValueForDistributionKey", v8, 2u);
      }
    }
    BOOL v9 = @"statistic";
    v10[0] = a4;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    AnalyticsSendEvent();
  }
}

- (BOOL)trackEvent:(id)a3 withStatistic:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = a3;
      __int16 v15 = 2112;
      id v16 = a4;
      _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "trackEvent %@ withStatistic %@", buf, 0x16u);
    }
  }
  if (a4 && !objc_msgSend(a4, "isEqualToNumber:", objc_msgSend(MEMORY[0x1E4F28C28], "notANumber")))
  {
    metricsQueue = self->_metricsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A0855278;
    block[3] = &unk_1E5A145E0;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(metricsQueue, block);
    LOBYTE(v8) = 1;
  }
  else
  {
    int v8 = IMOSLoggingEnabled();
    if (v8)
    {
      BOOL v9 = OSLogHandleForIMFoundationCategory();
      int v8 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        id v14 = a3;
        _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "IMMetricsCollector Nil statistic passed in for event %@", buf, 0xCu);
        LOBYTE(v8) = 0;
      }
    }
  }
  return v8;
}

- (BOOL)trackAction:(id)a3 extensionBundleID:(id)a4 isNotification:(BOOL)a5
{
  BOOL v5 = a5;
  v12[3] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [a4 length];
  if (v9)
  {
    uint64_t v9 = [a3 length];
    if (v9)
    {
      v11[0] = @"bundleID";
      v11[1] = @"action";
      v12[0] = a4;
      v12[1] = a3;
      v11[2] = @"isNotification";
      v12[2] = [NSNumber numberWithBool:v5];
      -[IMMetricsCollector _trackEvent:withDictionary:](self, "_trackEvent:withDictionary:", @"com.apple.Messages.IMMetricsCollectorMessageExtensionAction", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3]);
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

- (void)_trackEvent:(id)a3 withDictionary:(id)a4
{
  if (a3)
  {
    if (a4) {
      AnalyticsSendEvent();
    }
  }
}

- (BOOL)trackEvent:(id)a3 withDictionary:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = a3;
      __int16 v14 = 2112;
      id v15 = a4;
      _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "trackEvent %@ with dictionary %@", buf, 0x16u);
    }
  }
  if (a4)
  {
    metricsQueue = self->_metricsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A085563C;
    block[3] = &unk_1E5A145E0;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(metricsQueue, block);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = a3;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "IMMetricsCollector Nil dictionary passed in for event %@", buf, 0xCu);
    }
  }
  return a4 != 0;
}

- (void)autoBugCaptureWithSubType:(id)a3 errorPayload:(id)a4
{
  if (IMOSLoggingEnabled())
  {
    BOOL v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "*** Auto bug capture not supported ***", v5, 2u);
    }
  }
}

- (void)forceAutoBugCaptureWithSubType:(id)a3 errorPayload:(id)a4
{
  uint64_t v6 = (void *)[a4 userInfo];
  v7 = (__CFString *)[v6 objectForKeyedSubscript:*MEMORY[0x1E4F28228]];
  if (![(__CFString *)v7 length]) {
    v7 = @"No context";
  }
  if (v7 && (unint64_t)[(__CFString *)v7 length] >= 0x37) {
    v7 = (__CFString *)[(__CFString *)v7 substringToIndex:54];
  }
  int v8 = NSString;
  uint64_t v9 = [a4 domain];
  [v8 stringWithFormat:@"%@-%@-%@", v9, objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a4, "code")), v7];

  MEMORY[0x1F4181798](self, sel_forceAutoBugCaptureWithSubType_errorPayload_type_context_);
}

- (void)forceAutoBugCaptureWithSubType:(id)a3 errorPayload:(id)a4 type:(id)a5 context:(id)a6
{
}

- (void)forceAutoBugCaptureWithSubType:(id)a3 errorPayload:(id)a4 type:(id)a5 context:(id)a6 metadata:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"__PPT_ForTesting")&& objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C360], "sharedInstance"), "isInternalInstall"))
  {
    int v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F61758], "sharedInstance"), "wiFiActiveAndReachable");
    __int16 v14 = NSNumber;
    id v15 = (void *)[MEMORY[0x1E4F6C430] sharedInstance];
    if (v13) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 3;
    }
    uint64_t v25 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "linkQualityValueForInterfaceType:", v16));
    uint64_t v17 = (void *)[a4 userInfo];
    v18 = (void *)[v17 objectForKey:*MEMORY[0x1E4F28A50]];
    if (qword_1E94FF0E0 != -1) {
      dispatch_once(&qword_1E94FF0E0, &unk_1EF2C18D8);
    }
    uint64_t v19 = (void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1E94FF0D8;
    if (off_1E94FF0D8)
    {
      uint64_t v24 = [a4 domain];
      uint64_t v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a4, "code"));
      uint64_t v20 = [v18 domain];
      v19(a3, v24, v23, v20, objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "code")), v25);
    }
    if (self->_diagnosticReporter)
    {
      metricsQueue = self->_metricsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1A0855BA8;
      block[3] = &unk_1E5A14630;
      block[4] = self;
      block[5] = a5;
      block[6] = a3;
      void block[7] = a6;
      block[8] = a4;
      block[9] = a7;
      dispatch_async(metricsQueue, block);
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "IMMetricsCollector could not get diagnostic reporter class", (uint8_t *)&buf, 2u);
      }
    }
  }
}

- (void)metricAttachmentValidation:(BOOL)a3 attachmentSize:(id)a4 operationalErrorDomain:(id)a5 operationalErrorCode:(id)a6 validationErrorDomain:(id)a7 validationErrorCode:(id)a8
{
  BOOL v13 = a3;
  int v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F61758], "sharedInstance"), "wiFiActiveAndReachable");
  if (v14) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 3;
  }
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C430], "sharedInstance"), "linkQualityValueForInterfaceType:", v15));
  if (qword_1E94FFB58 != -1) {
    dispatch_once(&qword_1E94FFB58, &unk_1EF2C18F8);
  }
  if (off_1E94FFB50)
  {
    if (v14) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    uint64_t v20 = (void (*)(BOOL, id, id, id, id, id, uint64_t, uint64_t))off_1E94FFB50;
    uint64_t v18 = [NSNumber numberWithInt:v17];
    v20(v13, a4, a5, a6, a7, a8, v16, v18);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "We failed to weak link FTAWDLogIMessageCloudKitValidatePurgeableAttachment to validate metric", buf, 2u);
    }
  }
}

- (void)trackSpamEvent:(unint64_t)a3
{
}

- (void)trackSpamEvent:(unint64_t)a3 withDictionary:(id)a4
{
  id v6 = [(IMMetricsCollector *)self _stringForSpamType:a3];
  if (v6)
  {
    v7 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithObject:v6 forKey:@"type"];
    int v8 = v7;
    if (a4) {
      [v7 addEntriesFromDictionary:a4];
    }
    [(IMMetricsCollector *)self trackEvent:@"com.apple.Messages.IMMetricsCollectorEventInternationalSpam" withDictionary:v8];
  }
}

- (id)_stringForSpamType:(unint64_t)a3
{
  if (a3 - 1 > 0x1F) {
    return 0;
  }
  else {
    return off_1E5A14678[a3 - 1];
  }
}

- (void)trackiMessageJunkEvent:(unint64_t)a3
{
}

- (void)trackiMessageJunkEvent:(unint64_t)a3 withDictionary:(id)a4
{
  id v6 = [(IMMetricsCollector *)self _stringForiMessageJunkType:a3];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v6 forKey:@"type"];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1A0856308;
    v8[3] = &unk_1E5A14658;
    v8[4] = self;
    v8[5] = v7;
    [a4 enumerateKeysAndObjectsUsingBlock:v8];
    [(IMMetricsCollector *)self trackEvent:@"com.apple.Messages.IMMetricsCollectorEventOscar" withDictionary:v7];
  }
}

- (id)_stringForiMessageJunkType:(unint64_t)a3
{
  if (a3 - 1 > 0xF) {
    return 0;
  }
  else {
    return off_1E5A14778[a3 - 1];
  }
}

- (void)trackDeleteMessages:(id)a3 sourceType:(unint64_t)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  char v7 = [a3 isEqualToNumber:&unk_1EF3059A0];
  if (a4 && (v7 & 1) == 0)
  {
    v14[0] = @"source_type";
    v14[1] = @"count_messages";
    v15[0] = [NSNumber numberWithUnsignedInteger:a4];
    v15[1] = a3;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412546;
        id v11 = a3;
        __int16 v12 = 2112;
        id v13 = [(IMMetricsCollector *)self _stringForDeleteMessagesType:a4];
        _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Delete Messages Metrics | Delete %@ messages from %@", (uint8_t *)&v10, 0x16u);
      }
    }
    [(IMMetricsCollector *)self trackEvent:@"com.apple.Messages.IMMetricsCollectorEventDeleteMessages" withDictionary:v8];
  }
}

- (unint64_t)keepMessagesSourceTypeForDays:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 == 30) {
    return 2;
  }
  if (a3 == 365) {
    return 3;
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 134217984;
      int64_t v7 = a3;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Delete Messages Metrics | unknown type of keep messages days: %lld", (uint8_t *)&v6, 0xCu);
    }
  }
  return 0;
}

- (id)_stringForDeleteMessagesType:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return 0;
  }
  else {
    return off_1E5A147F8[a3 - 1];
  }
}

- (OS_dispatch_queue)metricsQueue
{
  return self->_metricsQueue;
}

- (void)setMetricsQueue:(id)a3
{
}

@end