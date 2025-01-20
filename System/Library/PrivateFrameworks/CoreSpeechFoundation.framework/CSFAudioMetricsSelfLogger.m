@interface CSFAudioMetricsSelfLogger
+ (id)sharedLogger;
- (CSFAudioMetricsSelfLogger)init;
- (id)_getPreprocessorCompletedMessageWithMetrics:(id)a3;
- (id)_getRunPairs:(id)a3;
- (id)_getSelfFanWithCSSiriFanInfo:(id)a3;
- (int)_getMHBluetoothAudioDeviceCategoryFromString:(id)a3;
- (int)_getSelfStopRecordingReasonWithADStopRecordingEvent:(unsigned __int16)a3;
- (int)_getSpeechErrorTypeWithRecordingFailedReason:(int64_t)a3;
- (int)_translateAudioSessionCategory:(id)a3;
- (int)_translateAudioSessionMode:(id)a3;
- (void)logCoreSpeechPreprocessorCompletedWithMHUUID:(id)a3 withMetricsDictionary:(id)a4;
- (void)logMHASRAudioConfigureStartedWithMHUUID:(id)a3 withAudioCodecString:(id)a4 withAudioSkippedNumSamples:(unint64_t)a5;
- (void)logMHASRAudioConfigureStartedWithMHUUID:(id)a3 withAudioCodecString:(id)a4 withAudioSkippedTimeInNs:(unint64_t)a5;
- (void)logMHApplicationPlaybackAttemptedWithMHUUID:(id)a3 withAppBundleName:(id)a4 withAppBundleVersion:(id)a5;
- (void)logMHAssistantDaemonAudioBluetoothInfoWithMHUUID:(id)a3 withWirelessSplitterSessionState:(int)a4 withAudioDeviceCategory:(id)a5;
- (void)logMHAssistantDaemonAudioConfigureContextWithMHUUID:(id)a3 withConfigureStarted:(BOOL)a4;
- (void)logMHAssistantDaemonAudioFetchRouteContextWithMHUUID:(id)a3 withFetchRouteContextStarted:(BOOL)a4;
- (void)logMHAssistantDaemonAudioInitContextWithMHUUID:(id)a3 withInitStarted:(BOOL)a4;
- (void)logMHAssistantDaemonAudioLateBufferDetectedWithMHUUID:(id)a3 withBufferReceiptTimeInNs:(unint64_t)a4;
- (void)logMHAssistantDaemonAudioPrepareContextWithMHUUID:(id)a3 withPrepareStarted:(BOOL)a4;
- (void)logMHAssistantDaemonAudioPrewarmContextWithMHUUID:(id)a3 withPrewarmStarted:(BOOL)a4;
- (void)logMHAssistantDaemonAudioRecordingContextWithMHUUID:(id)a3 withAudioRecordingStarted:(BOOL)a4 withAudioInputRoute:(int)a5 withAudioSource:(int)a6 withAudioInterfaceVendorId:(id)a7 withAudioInterfaceProductId:(id)a8;
- (void)logMHAssistantDaemonAudioRecordingFailedWithMHUUID:(id)a3 withReason:(int64_t)a4 vendorId:(id)a5 productId:(id)a6;
- (void)logMHAssistantDaemonAudioRecordingFirstBufferWithMHUUID:(id)a3 withStartEvent:(BOOL)a4 withFirstBufferStartTimeOffsetNs:(unint64_t)a5 withFirstBufferReceiptTimeOffsetNs:(unint64_t)a6;
- (void)logMHAssistantDaemonAudioRecordingInterruptionContextWithMHUUID:(id)a3 withStartEvent:(BOOL)a4 withLinkID:(id)a5 withAvAudioSessionInterruptorName:(id)a6 withAVAudioSessionInterrupterType:(id)a7;
- (void)logMHAssistantDaemonAudioRecordingInterruptionStartedTier1WithMHUUID:(id)a3 withLinkID:(id)a4 withActiveSessionDisplayIDs:(id)a5 audioSessionCategory:(id)a6 audioSessionMode:(id)a7;
- (void)logMHAssistantDaemonAudioRecordingLastBufferWithMHUUID:(id)a3 withStartEvent:(BOOL)a4 withLastBufferStartTimeOffsetNs:(unint64_t)a5 withLastBufferReceiptTimeOffsetNs:(unint64_t)a6;
- (void)logMHAssistantDaemonAudioRecordingMissedBufferDetectedWithMHUUID:(id)a3;
- (void)logMHAssistantDaemonAudioSessionActivationFailedWithInsufficientPriority:(id)a3 activeSessionDisplayIDs:(id)a4 audioSessionCategory:(id)a5 audioSessionMode:(id)a6;
- (void)logMHAssistantDaemonAudioSessionSetActivateContextWithMHUUID:(id)a3 withSetActivateStarted:(BOOL)a4;
- (void)logMHAssistantDaemonAudioSessionSetInactiveWithMHUUID:(id)a3 withSetInactiveStarted:(BOOL)a4;
- (void)logMHAssistantDaemonAudioStartRecordingContextWithMHUUID:(id)a3 withStartRecordingContext:(BOOL)a4 withFanInfoArray:(id)a5 withActiveSessionDisplayIDs:(id)a6;
- (void)logMHAssistantDaemonAudioStopRecordingContextWithMHUUID:(id)a3 withStopRecordingStarted:(BOOL)a4 withADStopRecordingEvent:(unsigned __int16)a5;
@end

@implementation CSFAudioMetricsSelfLogger

- (int)_translateAudioSessionMode:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:*MEMORY[0x1E4F75A60]])
    {
      int v5 = 1;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75BB8]])
    {
      int v5 = 2;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75A88]])
    {
      int v5 = 3;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75BA8]])
    {
      int v5 = 4;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75AD0]])
    {
      int v5 = 5;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75AD8]])
    {
      int v5 = 6;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75B80]])
    {
      int v5 = 8;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75B88]])
    {
      int v5 = 7;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75B48]])
    {
      int v5 = 22;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75BD8]])
    {
      int v5 = 9;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75B38]])
    {
      int v5 = 21;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75B68]])
    {
      int v5 = 14;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75AF8]])
    {
      int v5 = 15;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75BC8]])
    {
      int v5 = 16;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75A70]])
    {
      int v5 = 17;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75AA8]])
    {
      int v5 = 19;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75B18]])
    {
      int v5 = 20;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75B98]])
    {
      int v5 = 11;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75B28]])
    {
      int v5 = 12;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75A50]])
    {
      int v5 = 13;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75AB8]])
    {
      int v5 = 25;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75BF0]])
    {
      int v5 = 26;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75B60]])
    {
      int v5 = 23;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75A90]])
    {
      int v5 = 18;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75A68]])
    {
      int v5 = 29;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75A40]])
    {
      int v5 = 28;
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int)_translateAudioSessionCategory:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:*MEMORY[0x1E4F75920]])
    {
      int v5 = 5;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75860]])
    {
      int v5 = 16;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75940]])
    {
      int v5 = 11;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75910]])
    {
      int v5 = 13;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75868]])
    {
      int v5 = 1;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75968]])
    {
      int v5 = 2;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F758D8]])
    {
      int v5 = 3;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75930]])
    {
      int v5 = 4;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F758F8]])
    {
      int v5 = 12;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F759C8]])
    {
      int v5 = 8;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F759A8]])
    {
      int v5 = 7;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75950]])
    {
      int v5 = 10;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F759D0]])
    {
      int v5 = 9;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75998]])
    {
      int v5 = 15;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F758E0]])
    {
      int v5 = 17;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75890]])
    {
      int v5 = 18;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75898]])
    {
      int v5 = 19;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F758C0]])
    {
      int v5 = 20;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F759E0]])
    {
      int v5 = 21;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F758A8]])
    {
      int v5 = 23;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75980]])
    {
      int v5 = 24;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F75978]])
    {
      int v5 = 25;
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F759F0]])
    {
      int v5 = 26;
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int)_getSpeechErrorTypeWithRecordingFailedReason:(int64_t)a3
{
  return a3 == 1;
}

- (void)logMHAssistantDaemonAudioSessionActivationFailedWithInsufficientPriority:(id)a3 activeSessionDisplayIDs:(id)a4 audioSessionCategory:(id)a5 audioSessionMode:(id)a6
{
  v10 = (objc_class *)MEMORY[0x1E4FA0788];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v21 = objc_alloc_init(v10);
  uint64_t v15 = [(CSFAudioMetricsSelfLogger *)self _translateAudioSessionCategory:v12];

  [v21 setAudioSessionCategory:v15];
  uint64_t v16 = [(CSFAudioMetricsSelfLogger *)self _translateAudioSessionMode:v11];

  [v21 setAudioSessionMode:v16];
  [v21 setActiveSessionDisplayIds:v13];

  id v17 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v18 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  v19 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v14];

  [v18 setMhId:v19];
  [v17 setEventMetadata:v18];
  [v17 setAssistantDaemonAudioRecordingFailureInsufficientPriority:v21];
  v20 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v20 emitMessage:v17];
}

- (void)logMHAssistantDaemonAudioRecordingFailedWithMHUUID:(id)a3 withReason:(int64_t)a4 vendorId:(id)a5 productId:(id)a6
{
  v10 = (objc_class *)MEMORY[0x1E4FA0780];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v18 = objc_alloc_init(v10);
  objc_msgSend(v18, "setReason:", -[CSFAudioMetricsSelfLogger _getSpeechErrorTypeWithRecordingFailedReason:](self, "_getSpeechErrorTypeWithRecordingFailedReason:", a4));
  [v18 setAudioInterfaceVendorId:v12];

  [v18 setAudioInterfaceProductId:v11];
  id v14 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v15 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v13];

  [v15 setMhId:v16];
  [v14 setEventMetadata:v15];
  [v14 setAudioRecordingFailed:v18];
  id v17 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v17 emitMessage:v14];
}

- (void)logMHApplicationPlaybackAttemptedWithMHUUID:(id)a3 withAppBundleName:(id)a4 withAppBundleVersion:(id)a5
{
  v7 = (objc_class *)MEMORY[0x1E4FA06D0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v15 = objc_alloc_init(v7);
  [v15 setAppBundleName:v9];

  [v15 setAppBundleVersion:v8];
  id v11 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v12 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v10];

  [v12 setMhId:v13];
  [v11 setEventMetadata:v12];
  [v11 setApplicationPlaybackAttempted:v15];
  id v14 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v14 emitMessage:v11];
}

- (void)logMHAssistantDaemonAudioBluetoothInfoWithMHUUID:(id)a3 withWirelessSplitterSessionState:(int)a4 withAudioDeviceCategory:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = (objc_class *)MEMORY[0x1E4FA06D8];
  id v9 = a5;
  id v10 = a3;
  id v16 = objc_alloc_init(v8);
  uint64_t v11 = [(CSFAudioMetricsSelfLogger *)self _getMHBluetoothAudioDeviceCategoryFromString:v9];

  [v16 setState:v5];
  [v16 setBluetoothAudioDeviceCategory:v11];
  id v12 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v13 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v10];

  [v13 setMhId:v14];
  [v12 setEventMetadata:v13];
  [v12 setAssistantDaemonAudioBluetoothInfo:v16];
  id v15 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v15 emitMessage:v12];
}

- (void)logMHAssistantDaemonAudioRecordingInterruptionStartedTier1WithMHUUID:(id)a3 withLinkID:(id)a4 withActiveSessionDisplayIDs:(id)a5 audioSessionCategory:(id)a6 audioSessionMode:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  id v14 = (objc_class *)MEMORY[0x1E4FA07B8];
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init(v14);
  v19 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v16];

  [v18 setLinkId:v19];
  [v18 setActiveSessionDisplayIds:v15];

  uint64_t v20 = [(CSFAudioMetricsSelfLogger *)self _translateAudioSessionCategory:v12];
  uint64_t v21 = [(CSFAudioMetricsSelfLogger *)self _translateAudioSessionMode:v13];
  v22 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136316162;
    v28 = "-[CSFAudioMetricsSelfLogger logMHAssistantDaemonAudioRecordingInterruptionStartedTier1WithMHUUID:withLinkID:wi"
          "thActiveSessionDisplayIDs:audioSessionCategory:audioSessionMode:]";
    __int16 v29 = 2112;
    id v30 = v12;
    __int16 v31 = 1024;
    int v32 = v20;
    __int16 v33 = 2112;
    id v34 = v13;
    __int16 v35 = 1024;
    int v36 = v21;
    _os_log_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_DEFAULT, "%s Currently Active Category: %@[%d]. Mode: %@[%d]", (uint8_t *)&v27, 0x2Cu);
  }
  [v18 setAudioSessionCategory:v20];
  [v18 setAudioSessionMode:v21];
  id v23 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v24 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  v25 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v17];

  [v24 setMhId:v25];
  [v23 setEventMetadata:v24];
  [v23 setAssistantDaemonAudioRecordingInterruptionStartedTier1:v18];
  v26 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v26 emitMessage:v23];
}

- (void)logMHAssistantDaemonAudioRecordingInterruptionContextWithMHUUID:(id)a3 withStartEvent:(BOOL)a4 withLinkID:(id)a5 withAvAudioSessionInterruptorName:(id)a6 withAVAudioSessionInterrupterType:(id)a7
{
  BOOL v9 = a4;
  id v22 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = (objc_class *)MEMORY[0x1E4FA07A0];
  id v14 = a3;
  id v15 = objc_alloc_init(v13);
  if (v9)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4FA07B0]);
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v22];
    [v16 setLinkId:v17];

    [v16 setAvAudioSessionInterruptorName:v11];
    [v16 setAvAudioSessionInterruptionType:v12];
    [v15 setStartedOrChanged:v16];
    [v15 setHasStartedOrChanged:1];
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4FA07A8]);
    [v16 setExists:1];
    [v15 setEnded:v16];
    [v15 setHasEnded:1];
  }

  id v18 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v19 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v14];

  [v19 setMhId:v20];
  [v18 setEventMetadata:v19];
  [v18 setAssistantDaemonAudioRecordingInterruptionContext:v15];
  uint64_t v21 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v21 emitMessage:v18];
}

- (void)logMHAssistantDaemonAudioRecordingLastBufferWithMHUUID:(id)a3 withStartEvent:(BOOL)a4 withLastBufferStartTimeOffsetNs:(unint64_t)a5 withLastBufferReceiptTimeOffsetNs:(unint64_t)a6
{
  BOOL v8 = a4;
  BOOL v9 = (objc_class *)MEMORY[0x1E4FA07C0];
  id v10 = a3;
  id v16 = objc_alloc_init(v9);
  if (v8)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4FA07D0]);
    [v11 setLastAudioRecordBufferStartTimeOffsetInNs:a5];
    [v16 setStartedOrChanged:v11];
    [v16 setHasStartedOrChanged:1];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4FA07C8]);
    [v11 setLastAudioRecordBufferReceiptTimeOffsetInNs:a6];
    [v16 setEnded:v11];
    [v16 setHasEnded:1];
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v13 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v10];

  [v13 setMhId:v14];
  [v12 setEventMetadata:v13];
  [v12 setAssistantDaemonAudioRecordingLastBufferContext:v16];
  id v15 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v15 emitMessage:v12];
}

- (void)logMHAssistantDaemonAudioRecordingFirstBufferWithMHUUID:(id)a3 withStartEvent:(BOOL)a4 withFirstBufferStartTimeOffsetNs:(unint64_t)a5 withFirstBufferReceiptTimeOffsetNs:(unint64_t)a6
{
  BOOL v8 = a4;
  BOOL v9 = (objc_class *)MEMORY[0x1E4FA0790];
  id v10 = a3;
  id v16 = objc_alloc_init(v9);
  if (v8)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4FA0798]);
    [v11 setFirstBufferStartTimeOffsetInNs:a5];
    [v16 setStartedOrChanged:v11];
    [v16 setHasStartedOrChanged:1];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4FA0768]);
    [v11 setFirstBufferReceiptTimeOffsetInNs:a6];
    [v16 setEnded:v11];
    [v16 setHasEnded:1];
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v13 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v10];

  [v13 setMhId:v14];
  [v12 setEventMetadata:v13];
  [v12 setAssistantDaemonAudioRecordingFirstBufferContext:v16];
  id v15 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v15 emitMessage:v12];
}

- (void)logMHAssistantDaemonAudioLateBufferDetectedWithMHUUID:(id)a3 withBufferReceiptTimeInNs:(unint64_t)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4FA0730];
  id v6 = a3;
  id v10 = objc_alloc_init(v5);
  [v10 setBufferReceiptTimeOffsetInNs:a4];
  id v7 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v8 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v6];

  [v8 setMhId:v9];
  [v7 setEventMetadata:v8];
  [v7 setAssistantDaemonAudioLateBufferDetected:v10];
}

- (void)logMHAssistantDaemonAudioRecordingMissedBufferDetectedWithMHUUID:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4FA07D8];
  id v4 = a3;
  id v9 = objc_alloc_init(v3);
  [v9 setExists:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  [v5 setAssistantDaemonAudioRecordingMissedBufferDetected:v9];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v4];

  [v6 setMhId:v7];
  [v5 setEventMetadata:v6];
  id v8 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v8 emitMessage:v5];
}

- (void)logMHAssistantDaemonAudioRecordingContextWithMHUUID:(id)a3 withAudioRecordingStarted:(BOOL)a4 withAudioInputRoute:(int)a5 withAudioSource:(int)a6 withAudioInterfaceVendorId:(id)a7 withAudioInterfaceProductId:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v10 = *(void *)&a5;
  BOOL v11 = a4;
  id v22 = a7;
  id v13 = a8;
  id v14 = (objc_class *)MEMORY[0x1E4FA0770];
  id v15 = a3;
  id v16 = objc_alloc_init(v14);
  if (v11)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4FA07E0]);
    [v17 setAudioInputRoute:v10];
    [v17 setSource:v9];
    [v17 setAudioInterfaceVendorId:v22];
    [v17 setAudioInterfaceProductId:v13];
    [v16 setStartedOrChanged:v17];
    [v16 setHasStartedOrChanged:1];
  }
  else
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4FA0778]);
    [v17 setExists:1];
    [v16 setEnded:v17];
    [v16 setHasEnded:1];
  }

  id v18 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v19 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v15];

  [v19 setMhId:v20];
  [v18 setEventMetadata:v19];
  [v18 setAssistantDaemonAudioRecordingContext:v16];
  uint64_t v21 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v21 emitMessage:v18];
}

- (void)logMHAssistantDaemonAudioFetchRouteContextWithMHUUID:(id)a3 withFetchRouteContextStarted:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (objc_class *)MEMORY[0x1E4FA0700];
  id v6 = a3;
  id v12 = objc_alloc_init(v5);
  if (v4)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA0710]);
    [v7 setExists:1];
    [v12 setStartedOrChanged:v7];
    [v12 setHasStartedOrChanged:1];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA0708]);
    [v7 setExists:1];
    [v12 setEnded:v7];
    [v12 setHasEnded:1];
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v9 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v6];

  [v9 setMhId:v10];
  [v8 setEventMetadata:v9];
  [v8 setAssistantDaemonAudioFetchRouteContext:v12];
  BOOL v11 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v11 emitMessage:v8];
}

- (void)logMHAssistantDaemonAudioSessionSetInactiveWithMHUUID:(id)a3 withSetInactiveStarted:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (objc_class *)MEMORY[0x1E4FA0800];
  id v6 = a3;
  id v12 = objc_alloc_init(v5);
  if (v4)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA0810]);
    [v7 setExists:1];
    [v12 setStartedOrChanged:v7];
    [v12 setHasStartedOrChanged:1];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA0808]);
    [v7 setExists:1];
    [v12 setEnded:v7];
    [v12 setHasEnded:1];
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v9 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v6];

  [v9 setMhId:v10];
  [v8 setEventMetadata:v9];
  [v8 setAssistantDaemonAudioSessionSetInactiveContext:v12];
  BOOL v11 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v11 emitMessage:v8];
}

- (void)logMHAssistantDaemonAudioSessionSetActivateContextWithMHUUID:(id)a3 withSetActivateStarted:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (objc_class *)MEMORY[0x1E4FA07E8];
  id v6 = a3;
  id v12 = objc_alloc_init(v5);
  if (v4)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA07F8]);
    [v7 setExists:1];
    [v12 setStartedOrChanged:v7];
    [v12 setHasStartedOrChanged:1];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA07F0]);
    [v7 setExists:1];
    [v12 setEnded:v7];
    [v12 setHasEnded:1];
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v9 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v6];

  [v9 setMhId:v10];
  [v8 setEventMetadata:v9];
  [v8 setAssistantDaemonAudioSessionSetActiveContext:v12];
  BOOL v11 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v11 emitMessage:v8];
}

- (void)logMHAssistantDaemonAudioStopRecordingContextWithMHUUID:(id)a3 withStopRecordingStarted:(BOOL)a4 withADStopRecordingEvent:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  BOOL v6 = a4;
  id v8 = (objc_class *)MEMORY[0x1E4FA0830];
  id v9 = a3;
  id v15 = objc_alloc_init(v8);
  if (v6)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FA0840]);
    objc_msgSend(v10, "setStopReason:", -[CSFAudioMetricsSelfLogger _getSelfStopRecordingReasonWithADStopRecordingEvent:](self, "_getSelfStopRecordingReasonWithADStopRecordingEvent:", v5));
    [v15 setStartedOrChanged:v10];
    [v15 setHasStartedOrChanged:1];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FA0838]);
    [v15 setEnded:v10];
    [v15 setHasEnded:1];
  }

  id v11 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v12 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v9];

  [v12 setMhId:v13];
  [v11 setEventMetadata:v12];
  [v11 setAssistantDaemonAudioStopRecordingContext:v15];
  id v14 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v14 emitMessage:v11];
}

- (void)logMHAssistantDaemonAudioStartRecordingContextWithMHUUID:(id)a3 withStartRecordingContext:(BOOL)a4 withFanInfoArray:(id)a5 withActiveSessionDisplayIDs:(id)a6
{
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x1E4FA0818]);
  if (v8)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4FA0828]);
    [v14 setExists:1];
    [v13 setStartedOrChanged:v14];
    [v13 setHasStartedOrChanged:1];
  }
  else
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4FA0820]);
    if (v11)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v15 = -[CSFAudioMetricsSelfLogger _getSelfFanWithCSSiriFanInfo:](self, "_getSelfFanWithCSSiriFanInfo:", v11, 0);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v25;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(v15);
            }
            [v14 addFanInfo:*(void *)(*((void *)&v24 + 1) + 8 * v19++)];
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v17);
      }
    }
    [v14 setActiveSessionDisplayIds:v12];
    [v13 setEnded:v14];
    [v13 setHasEnded:1];
  }

  id v20 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v21 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v10];
  [v21 setMhId:v22];

  [v20 setEventMetadata:v21];
  [v20 setAssistantDaemonAudioStartRecordingContext:v13];
  id v23 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v23 emitMessage:v20];
}

- (void)logMHAssistantDaemonAudioPrewarmContextWithMHUUID:(id)a3 withPrewarmStarted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = (objc_class *)MEMORY[0x1E4FA0750];
  id v6 = a3;
  id v12 = objc_alloc_init(v5);
  if (v4)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA0760]);
    [v7 setExists:1];
    [v12 setStartedOrChanged:v7];
    [v12 setHasStartedOrChanged:1];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA0758]);
    [v7 setExists:1];
    [v12 setEnded:v7];
    [v12 setHasEnded:1];
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v9 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v6];

  [v9 setMhId:v10];
  [v8 setEventMetadata:v9];
  [v8 setAssistantDaemonAudioPrewarmContext:v12];
  id v11 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v11 emitMessage:v8];
}

- (void)logMHAssistantDaemonAudioPrepareContextWithMHUUID:(id)a3 withPrepareStarted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = (objc_class *)MEMORY[0x1E4FA0738];
  id v6 = a3;
  id v12 = objc_alloc_init(v5);
  if (v4)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA0748]);
    [v7 setExists:1];
    [v12 setStartedOrChanged:v7];
    [v12 setHasStartedOrChanged:1];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA0740]);
    [v7 setExists:1];
    [v12 setEnded:v7];
    [v12 setHasEnded:1];
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v9 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v6];

  [v9 setMhId:v10];
  [v8 setEventMetadata:v9];
  [v8 setAssistantDaemonAudioPrepareContext:v12];
  id v11 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v11 emitMessage:v8];
}

- (void)logMHAssistantDaemonAudioConfigureContextWithMHUUID:(id)a3 withConfigureStarted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = (objc_class *)MEMORY[0x1E4FA06E0];
  id v6 = a3;
  id v12 = objc_alloc_init(v5);
  if (v4)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA06F0]);
    [v7 setExists:1];
    [v12 setStartedOrChanged:v7];
    [v12 setHasStartedOrChanged:1];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA06E8]);
    [v7 setExists:1];
    [v12 setEnded:v7];
    [v12 setHasEnded:1];
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v9 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v6];

  [v9 setMhId:v10];
  [v8 setEventMetadata:v9];
  [v8 setAssistantDaemonAudioConfigureContext:v12];
  id v11 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v11 emitMessage:v8];
}

- (void)logMHAssistantDaemonAudioInitContextWithMHUUID:(id)a3 withInitStarted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = (objc_class *)MEMORY[0x1E4FA0718];
  id v6 = a3;
  id v12 = objc_alloc_init(v5);
  if (v4)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA0728]);
    [v7 setExists:1];
    [v12 setStartedOrChanged:v7];
    [v12 setHasStartedOrChanged:1];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FA0720]);
    [v7 setExists:1];
    [v12 setEnded:v7];
    [v12 setHasEnded:1];
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v9 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v6];

  [v9 setMhId:v10];
  [v8 setEventMetadata:v9];
  [v8 setAssistantDaemonAudioInitContext:v12];
  id v11 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v11 emitMessage:v8];
}

- (void)logMHASRAudioConfigureStartedWithMHUUID:(id)a3 withAudioCodecString:(id)a4 withAudioSkippedTimeInNs:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315906;
    uint64_t v16 = "-[CSFAudioMetricsSelfLogger logMHASRAudioConfigureStartedWithMHUUID:withAudioCodecString:withAudioSkippedTimeInNs:]";
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2048;
    unint64_t v22 = a5;
    _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s logMHASRAudioConfigureStartedWithMHUUID: %@, CodeC: %@, SkippedTimeInNs:%llu", (uint8_t *)&v15, 0x2Au);
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4FA06C8]);
  [v10 setAudioCodec:SASCodecForString()];
  [v10 setAudioSkippedTimeInNs:a5];
  id v11 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v12 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v7];
  [v12 setMhId:v13];

  [v11 setEventMetadata:v12];
  [v11 setAsrAudioConfigureStarted:v10];
  id v14 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v14 emitMessage:v11];
}

- (void)logMHASRAudioConfigureStartedWithMHUUID:(id)a3 withAudioCodecString:(id)a4 withAudioSkippedNumSamples:(unint64_t)a5
{
  id v7 = (objc_class *)MEMORY[0x1E4FA06C8];
  id v8 = a4;
  id v9 = a3;
  id v15 = objc_alloc_init(v7);
  uint64_t v10 = SASCodecForString();

  [v15 setAudioCodec:v10];
  if (a5) {
    [v15 setAudioSkippedNumSamples:a5];
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v12 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v9];

  [v12 setMhId:v13];
  [v11 setEventMetadata:v12];
  [v11 setAsrAudioConfigureStarted:v15];
  id v14 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v14 emitMessage:v11];
}

- (void)logCoreSpeechPreprocessorCompletedWithMHUUID:(id)a3 withMetricsDictionary:(id)a4
{
  id v6 = a3;
  id v11 = [(CSFAudioMetricsSelfLogger *)self _getPreprocessorCompletedMessageWithMetrics:a4];
  id v7 = objc_alloc_init(MEMORY[0x1E4FA0888]);
  id v8 = objc_alloc_init(MEMORY[0x1E4FA0890]);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v6];

  [v8 setMhId:v9];
  [v7 setEventMetadata:v8];
  [v7 setCoreSpeechPreprocessorCompleted:v11];
  uint64_t v10 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v10 emitMessage:v7];
}

- (id)_getPreprocessorCompletedMessageWithMetrics:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FA08A0]);
  id v6 = [v4 objectForKey:@"ZeroFilterMetrics"];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKey:@"CSInitialContinuousZeros"];
    objc_msgSend(v5, "setInitialContinousZeros:", (int)objc_msgSend(v8, "intValue"));

    id v9 = [v7 objectForKey:@"CSMaxContinuousZeros"];
    objc_msgSend(v5, "setMaxContinousZeros:", (int)objc_msgSend(v9, "intValue"));

    uint64_t v10 = [v7 objectForKey:@"CSMidSegmentContinuousZeros"];
    if (v10)
    {
      id v11 = [(CSFAudioMetricsSelfLogger *)self _getRunPairs:v10];
      [v5 setMidSegmentContinousZeros:v11];
    }
  }
  id v12 = [v4 objectForKey:@"BeepCancellerMetrics"];
  id v13 = v12;
  if (v12)
  {
    id v14 = [v12 objectForKey:@"beepLocation"];
    objc_msgSend(v5, "setBeepLocation:", objc_msgSend(v14, "intValue"));

    id v15 = [v13 objectForKey:@"statsComputed"];
    objc_msgSend(v5, "setStatsComputed:", objc_msgSend(v15, "intValue"));

    uint64_t v16 = [v13 objectForKey:@"beepPower"];
    [v16 floatValue];
    objc_msgSend(v5, "setBeepPower:");

    __int16 v17 = [v13 objectForKey:@"signalPower"];
    [v17 floatValue];
    objc_msgSend(v5, "setSignalPower:");

    id v18 = [v13 objectForKey:@"originalPower"];
    [v18 floatValue];
    objc_msgSend(v5, "setOriginalPower:");

    __int16 v19 = [v13 objectForKey:@"absMaxVal"];
    [v19 floatValue];
    objc_msgSend(v5, "setAbsMaxVal:");

    id v20 = [v13 objectForKey:@"above95pcOfMax"];
    [v20 floatValue];
    objc_msgSend(v5, "setAboveNinetyFivepcOfMax:");

    __int16 v21 = [v13 objectForKey:@"totalInputSamples"];
    objc_msgSend(v5, "setNumTotalInputSamples:", (int)objc_msgSend(v21, "intValue"));

    unint64_t v22 = [v13 objectForKey:@"totalOutputSamples"];
    objc_msgSend(v5, "setNumTotalOutputSamples:", (int)objc_msgSend(v22, "intValue"));
  }
  return v5;
}

- (id)_getRunPairs:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = objc_alloc_init(MEMORY[0x1E4FA08A8]);
        id v11 = [v9 objectForKey:@"start"];
        objc_msgSend(v10, "setZeroRunStartingSample:", (int)objc_msgSend(v11, "intValue"));

        id v12 = [v9 objectForKey:@"len"];
        objc_msgSend(v10, "setZeroRunLength:", (int)objc_msgSend(v12, "intValue"));

        [v4 addObject:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4];
  return v13;
}

- (int)_getMHBluetoothAudioDeviceCategoryFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F74D08]])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F74D38]])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F74D10]])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F74D18]])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F74D20]])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)_getSelfStopRecordingReasonWithADStopRecordingEvent:(unsigned __int16)a3
{
  if (a3 > 8u) {
    return 1;
  }
  else {
    return *(_DWORD *)&aMcplsupoxeps[4 * a3 + 12];
  }
}

- (id)_getSelfFanWithCSSiriFanInfo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "count", (void)v16) == 3)
        {
          id v11 = objc_alloc_init(MEMORY[0x1E4FA06F8]);
          id v12 = [v10 objectAtIndexedSubscript:0];
          objc_msgSend(v11, "setFanId:", objc_msgSend(v12, "intValue"));

          id v13 = [v10 objectAtIndexedSubscript:1];
          objc_msgSend(v11, "setCurrentSpeed:", objc_msgSend(v13, "intValue"));

          id v14 = [v10 objectAtIndexedSubscript:2];
          objc_msgSend(v11, "setTargetSpeed:", objc_msgSend(v14, "intValue"));

          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (CSFAudioMetricsSelfLogger)init
{
  if (+[CSUtils isDarwinOS])
  {
    id v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSFAudioMetricsSelfLogger;
    self = [(CSFAudioMetricsSelfLogger *)&v5 init];
    id v3 = self;
  }

  return v3;
}

+ (id)sharedLogger
{
  if (sharedLogger_onceToken_2554 != -1) {
    dispatch_once(&sharedLogger_onceToken_2554, &__block_literal_global_2555);
  }
  v2 = (void *)sharedLogger_sharedAudioMetricsSelfLogger;
  return v2;
}

uint64_t __41__CSFAudioMetricsSelfLogger_sharedLogger__block_invoke()
{
  sharedLogger_sharedAudioMetricsSelfLogger = objc_alloc_init(CSFAudioMetricsSelfLogger);
  return MEMORY[0x1F41817F8]();
}

@end