@interface CSAttSiriBridgeMessageHandler
- (BOOL)supportTCU;
- (CSAttSiriBridgeMessageHandler)initWithSpeechRecognitionNode:(id)a3 tcuGenerator:(id)a4 supportTCU:(BOOL)a5;
- (CSAttSiriSpeechRecognitionNode)speechRecognitionNode;
- (CSAttSiriTCUGenerator)tcuGenerator;
- (CSConnectionListener)localSRBridgeListener;
- (void)assetUpdatedRequired;
- (void)attSiriNode:(id)a3 didDetectEndpointEventAtTime:(double)a4 eventType:(int64_t)a5 withMetrics:(id)a6 useEndpointerSignal:(BOOL)a7;
- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6;
- (void)didGenerateContinuityEnd:(id)a3;
- (void)didGenerateMultiUserTRPCandidatePackage:(id)a3;
- (void)didGenerateTRPCandidatePackage:(id)a3;
- (void)didGenerateTRPDetector:(id)a3;
- (void)didReceiveFinalResultCandidateWithRequestId:(id)a3 speechPackage:(id)a4;
- (void)didReceiveFinalResultWithRequestId:(id)a3 speechPackage:(id)a4 metadata:(id)a5 taskName:(id)a6;
- (void)didReceiveFinalResultWithRequestId:(id)a3 speechPackage:(id)a4 taskName:(id)a5;
- (void)didReceivePartialResultPackageWithRequestId:(id)a3 language:(id)a4 package:(id)a5 metadata:(id)a6;
- (void)didReceivePartialResultWithRequestId:(id)a3 language:(id)a4 tokens:(id)a5;
- (void)didReceivePartialResultWithRequestId:(id)a3 language:(id)a4 tokens:(id)a5 metadata:(id)a6;
- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 inputOrigin:(id)a5 speechPackage:(id)a6 duration:(double)a7 taskName:(id)a8;
- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 speechPackage:(id)a5 duration:(double)a6 metadata:(id)a7 taskName:(id)a8;
- (void)didReceiveVoiceCommandCandidateWithRequestId:(id)a3 speechPackage:(id)a4 metadata:(id)a5;
- (void)disableLocalSpeechRecognitionForRequestId:(id)a3;
- (void)pauseLocalSpeechRecognitionForRequestId:(id)a3;
- (void)preheatLocalSpeechRecognitionWithLanguage:(id)a3 source:(unint64_t)a4;
- (void)resumeLocalRecognitionWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6;
- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4;
- (void)setLocalSRBridgeListener:(id)a3;
- (void)setSpeechRecognitionNode:(id)a3;
- (void)setSupportTCU:(BOOL)a3;
- (void)setTcuGenerator:(id)a3;
- (void)startSpeechRecognitionResultsWithSettings:(id)a3;
- (void)stopSpeechRecognitionWithReason:(unint64_t)a3 requestId:(id)a4;
- (void)trpCandidateReadyForExecutionForRequestId:(id)a3 withTrpId:(id)a4;
- (void)updateTCUState:(id)a3;
- (void)updateVoiceCommandContextWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6 disambiguationActive:(id)a7 cursorInVisibleText:(id)a8 favorCommandSuppression:(id)a9 abortCommandSuppression:(id)a10 undoEvent:(id)a11;
@end

@implementation CSAttSiriBridgeMessageHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSRBridgeListener, 0);
  objc_storeStrong((id *)&self->_tcuGenerator, 0);
  objc_storeStrong((id *)&self->_speechRecognitionNode, 0);
}

- (void)setLocalSRBridgeListener:(id)a3
{
}

- (CSConnectionListener)localSRBridgeListener
{
  return self->_localSRBridgeListener;
}

- (void)setSupportTCU:(BOOL)a3
{
  self->_supportTCU = a3;
}

- (BOOL)supportTCU
{
  return self->_supportTCU;
}

- (void)setTcuGenerator:(id)a3
{
}

- (CSAttSiriTCUGenerator)tcuGenerator
{
  return self->_tcuGenerator;
}

- (void)setSpeechRecognitionNode:(id)a3
{
}

- (CSAttSiriSpeechRecognitionNode)speechRecognitionNode
{
  return self->_speechRecognitionNode;
}

- (void)assetUpdatedRequired
{
  v3 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[CSAttSiriBridgeMessageHandler assetUpdatedRequired]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Sending asset download prompt", (uint8_t *)&v5, 0xCu);
  }
  v4 = [(CSAttSiriBridgeMessageHandler *)self localSRBridgeListener];
  [v4 notifyClientsWithBlock:&stru_100253A68];
}

- (void)attSiriNode:(id)a3 didDetectEndpointEventAtTime:(double)a4 eventType:(int64_t)a5 withMetrics:(id)a6 useEndpointerSignal:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a6;
  v14 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[CSAttSiriBridgeMessageHandler attSiriNode:didDetectEndpointEventAtTime:eventType:withMetrics:useEndpointerSignal:]";
    __int16 v24 = 2050;
    double v25 = a4;
    __int16 v26 = 2050;
    int64_t v27 = a5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s didDetectEndpointEventAtTime : %{public}f didDetectEndpointEventType:%{public}ld", buf, 0x20u);
  }
  if (!v7)
  {
    v18 = CSLogCategoryRequest;
    if (!os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    v23 = "-[CSAttSiriBridgeMessageHandler attSiriNode:didDetectEndpointEventAtTime:eventType:withMetrics:useEndpointerSignal:]";
    v19 = "%s Not sending localSpeechServiceDidDetectedFinalEndpoint due to using manual endpointing.";
    v20 = v18;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
    goto LABEL_13;
  }
  v15 = CSLogCategoryRequest;
  BOOL v16 = os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT);
  if (a5 != 2)
  {
    if (!v16) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    v23 = "-[CSAttSiriBridgeMessageHandler attSiriNode:didDetectEndpointEventAtTime:eventType:withMetrics:useEndpointerSignal:]";
    v19 = "%s Not sending localSpeechServiceDidDetectedFinalEndpoint due to only receiving default endpoint event.";
    v20 = v15;
    goto LABEL_12;
  }
  if (v16)
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[CSAttSiriBridgeMessageHandler attSiriNode:didDetectEndpointEventAtTime:eventType:withMetrics:useEndpointerSignal:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Report Endpoint", buf, 0xCu);
  }
  v17 = [(CSAttSiriBridgeMessageHandler *)self localSRBridgeListener];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10016FF3C;
  v21[3] = &unk_100253A28;
  *(double *)&v21[4] = a4;
  [v17 notifyClientsWithBlock:v21];

LABEL_13:
}

- (void)didGenerateContinuityEnd:(id)a3
{
  id v4 = a3;
  int v5 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSAttSiriBridgeMessageHandler didGenerateContinuityEnd:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "KeyLog - %s didGenerateContinuityEnd : %{public}@", buf, 0x16u);
  }
  v6 = [(CSAttSiriBridgeMessageHandler *)self localSRBridgeListener];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100170090;
  v8[3] = &unk_100253A08;
  id v9 = v4;
  id v7 = v4;
  [v6 notifyClientsWithBlock:v8];
}

- (void)didGenerateMultiUserTRPCandidatePackage:(id)a3
{
  id v4 = a3;
  int v5 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSAttSiriBridgeMessageHandler didGenerateMultiUserTRPCandidatePackage:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "KeyLog - %s didGenerateMultiUserTRPDetector : %{public}@", buf, 0x16u);
  }
  v6 = [(CSAttSiriBridgeMessageHandler *)self localSRBridgeListener];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001701E0;
  v8[3] = &unk_100253A08;
  id v9 = v4;
  id v7 = v4;
  [v6 notifyClientsWithBlock:v8];
}

- (void)didGenerateTRPDetector:(id)a3
{
  id v4 = a3;
  int v5 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSAttSiriBridgeMessageHandler didGenerateTRPDetector:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "KeyLog - %s didGenerateTRPDetector : %{public}@", buf, 0x16u);
  }
  v6 = [(CSAttSiriBridgeMessageHandler *)self localSRBridgeListener];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100170330;
  v8[3] = &unk_100253A08;
  id v9 = v4;
  id v7 = v4;
  [v6 notifyClientsWithBlock:v8];
}

- (void)didGenerateTRPCandidatePackage:(id)a3
{
  id v4 = a3;
  int v5 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSAttSiriBridgeMessageHandler didGenerateTRPCandidatePackage:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "KeyLog - %s didGenerateTRPCandidate : %{public}@", buf, 0x16u);
  }
  v6 = [(CSAttSiriBridgeMessageHandler *)self localSRBridgeListener];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100170480;
  v8[3] = &unk_100253A08;
  id v9 = v4;
  id v7 = v4;
  [v6 notifyClientsWithBlock:v8];
}

- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v24 = "-[CSAttSiriBridgeMessageHandler didCompleteRecognitionTaskWithStatistics:requestId:endpointMode:error:]";
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2114;
    id v28 = v11;
    __int16 v29 = 1024;
    int v30 = a5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "KeyLog - %s didCompleteRecognitionWithStatistics : %@, %{public}@, %d", buf, 0x26u);
  }
  v14 = [(CSAttSiriBridgeMessageHandler *)self localSRBridgeListener];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100170638;
  v18[3] = &unk_1002539E0;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  int64_t v22 = a5;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [v14 notifyClientsWithBlock:v18];
}

- (void)didReceivePartialResultPackageWithRequestId:(id)a3 language:(id)a4 package:(id)a5 metadata:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    id v26 = "-[CSAttSiriBridgeMessageHandler didReceivePartialResultPackageWithRequestId:language:package:metadata:]";
    __int16 v27 = 2114;
    id v28 = v10;
    __int16 v29 = 2114;
    id v30 = v11;
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 2112;
    id v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s didReceivePartialResultWithRequestId : %{public}@, %{public}@, %@, %@", buf, 0x34u);
  }
  id v15 = [(CSAttSiriBridgeMessageHandler *)self localSRBridgeListener];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100170814;
  v20[3] = &unk_1002539B8;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  [v15 notifyClientsWithBlock:v20];
}

- (void)didReceivePartialResultWithRequestId:(id)a3 language:(id)a4 tokens:(id)a5 metadata:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    id v26 = "-[CSAttSiriBridgeMessageHandler didReceivePartialResultWithRequestId:language:tokens:metadata:]";
    __int16 v27 = 2114;
    id v28 = v10;
    __int16 v29 = 2114;
    id v30 = v11;
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 2112;
    id v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s didReceivePartialResultWithRequestId : %{public}@, %{public}@, %@, %@", buf, 0x34u);
  }
  id v15 = [(CSAttSiriBridgeMessageHandler *)self localSRBridgeListener];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001709F0;
  v20[3] = &unk_1002539B8;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  [v15 notifyClientsWithBlock:v20];
}

- (void)didReceivePartialResultWithRequestId:(id)a3 language:(id)a4 tokens:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v21 = "-[CSAttSiriBridgeMessageHandler didReceivePartialResultWithRequestId:language:tokens:]";
    __int16 v22 = 2114;
    id v23 = v8;
    __int16 v24 = 2114;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s didReceivePartialResultWithRequestId : %{public}@, %{public}@, %@", buf, 0x2Au);
  }
  id v12 = [(CSAttSiriBridgeMessageHandler *)self localSRBridgeListener];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100170BA4;
  v16[3] = &unk_100253968;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [v12 notifyClientsWithBlock:v16];
}

- (void)didReceiveFinalResultWithRequestId:(id)a3 speechPackage:(id)a4 metadata:(id)a5 taskName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v24 = "-[CSAttSiriBridgeMessageHandler didReceiveFinalResultWithRequestId:speechPackage:metadata:taskName:]";
    __int16 v25 = 2114;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s didReceiveFinalResultWithRequestId : %{public}@, %@, %@, %@", buf, 0x34u);
  }
  id v15 = [(CSAttSiriBridgeMessageHandler *)self localSRBridgeListener];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100170D70;
  v19[3] = &unk_100253968;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [v15 notifyClientsWithBlock:v19];
}

- (void)didReceiveFinalResultWithRequestId:(id)a3 speechPackage:(id)a4 taskName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v19 = "-[CSAttSiriBridgeMessageHandler didReceiveFinalResultWithRequestId:speechPackage:taskName:]";
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s didReceiveFinalResultWithRequestId : %{public}@, %@, %@", buf, 0x2Au);
  }
  id v12 = [(CSAttSiriBridgeMessageHandler *)self localSRBridgeListener];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100170F10;
  v15[3] = &unk_100253990;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  [v12 notifyClientsWithBlock:v15];
}

- (void)didReceiveFinalResultCandidateWithRequestId:(id)a3 speechPackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v16 = "-[CSAttSiriBridgeMessageHandler didReceiveFinalResultCandidateWithRequestId:speechPackage:]";
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s didReceiveFinalResultCandidateWithRequestId : %{public}@, %@", buf, 0x20u);
  }
  id v9 = [(CSAttSiriBridgeMessageHandler *)self localSRBridgeListener];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10017108C;
  v12[3] = &unk_100253990;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 notifyClientsWithBlock:v12];
}

- (void)didReceiveVoiceCommandCandidateWithRequestId:(id)a3 speechPackage:(id)a4 metadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v21 = "-[CSAttSiriBridgeMessageHandler didReceiveVoiceCommandCandidateWithRequestId:speechPackage:metadata:]";
    __int16 v22 = 2114;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s didReceiveVoiceCommandCandidateWithRequestId : %{public}@, %@", buf, 0x20u);
  }
  id v12 = [(CSAttSiriBridgeMessageHandler *)self localSRBridgeListener];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100171234;
  v16[3] = &unk_100253968;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [v12 notifyClientsWithBlock:v16];
}

- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 speechPackage:(id)a5 duration:(double)a6 metadata:(id)a7 taskName:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  id v16 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    id v28 = "-[CSAttSiriBridgeMessageHandler didReceiveResultCandidateWithRequestId:rcId:speechPackage:duration:metadata:taskName:]";
    __int16 v29 = 2114;
    id v30 = v13;
    __int16 v31 = 1024;
    int v32 = a4;
    __int16 v33 = 2112;
    id v34 = v14;
    __int16 v35 = 2048;
    double v36 = a6;
    __int16 v37 = 2112;
    id v38 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s didReceiveResultCandidateWithRequestId : %{public}@, %d, %@, %f, %@", buf, 0x3Au);
  }
  id v17 = [(CSAttSiriBridgeMessageHandler *)self localSRBridgeListener];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100171414;
  v21[3] = &unk_100253940;
  id v22 = v13;
  id v23 = v14;
  double v26 = a6;
  id v24 = v15;
  unint64_t v25 = a4;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  [v17 notifyClientsWithBlock:v21];
}

- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 inputOrigin:(id)a5 speechPackage:(id)a6 duration:(double)a7 taskName:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (([v17 isEqualToString:CoreEmbeddedSpeechRecognizerTaskDictation] & 1) != 0
    || ([v17 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSiriDictation] & 1) != 0
    || ([v17 isEqualToString:CoreEmbeddedSpeechRecognizerTaskVoiceMail] & 1) != 0
    || [v17 isEqualToString:CoreEmbeddedSpeechRecognizerTaskWebSearch])
  {
    [(CSAttSiriBridgeMessageHandler *)self supportTCU];
  }
  else if ([(CSAttSiriBridgeMessageHandler *)self supportTCU])
  {
    goto LABEL_9;
  }
  id v18 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    double v26 = "-[CSAttSiriBridgeMessageHandler didReceiveResultCandidateWithRequestId:rcId:inputOrigin:speechPackage:duration:taskName:]";
    __int16 v27 = 2114;
    id v28 = v14;
    __int16 v29 = 1024;
    int v30 = a4;
    __int16 v31 = 2114;
    id v32 = v15;
    __int16 v33 = 2112;
    id v34 = v16;
    __int16 v35 = 2048;
    double v36 = a7;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s didReceiveResultCandidateWithRequestId : %{public}@ %d, %{public}@, %@, %f", buf, 0x3Au);
  }
  id v19 = [(CSAttSiriBridgeMessageHandler *)self localSRBridgeListener];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100171670;
  v20[3] = &unk_100253918;
  id v21 = v14;
  unint64_t v23 = a4;
  id v22 = v16;
  double v24 = a7;
  [v19 notifyClientsWithBlock:v20];

LABEL_9:
}

- (void)trpCandidateReadyForExecutionForRequestId:(id)a3 withTrpId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    id v10 = "-[CSAttSiriBridgeMessageHandler trpCandidateReadyForExecutionForRequestId:withTrpId:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s trpCandidate ready for execution for:%@, %@", (uint8_t *)&v9, 0x20u);
  }
  [(CSAttSiriTCUGenerator *)self->_tcuGenerator processReadyForExecutionForRequestId:v6 withTrpId:v7];
}

- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    id v10 = "-[CSAttSiriBridgeMessageHandler sendSpeechCorrectionInfo:interactionIdentifier:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Send speech correctioninfo : %@, %@", (uint8_t *)&v9, 0x20u);
  }
  [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode sendSpeechCorrectionInfo:v6 interactionIdentifier:v7];
}

- (void)updateVoiceCommandContextWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6 disambiguationActive:(id)a7 cursorInVisibleText:(id)a8 favorCommandSuppression:(id)a9 abortCommandSuppression:(id)a10 undoEvent:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  unint64_t v25 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v28 = "-[CSAttSiriBridgeMessageHandler updateVoiceCommandContextWithRequestId:prefixText:postfixText:selectedText:dis"
          "ambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:]";
    __int16 v29 = 2114;
    id v30 = v16;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s Update voice command context with id: %{public}@", buf, 0x16u);
  }
  [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode updateVoiceCommandContextWithRequestId:v16 prefixText:v17 postfixText:v18 selectedText:v19 disambiguationActive:v20 cursorInVisibleText:v21 favorCommandSuppression:v22 abortCommandSuppression:v23 undoEvent:v24];
}

- (void)resumeLocalRecognitionWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    id v16 = "-[CSAttSiriBridgeMessageHandler resumeLocalRecognitionWithRequestId:prefixText:postfixText:selectedText:]";
    __int16 v17 = 2114;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Resume local recognition request id: %{public}@", (uint8_t *)&v15, 0x16u);
  }
  [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode resumeLocalRecognitionWithRequestId:v10 prefixText:v11 postfixText:v12 selectedText:v13];
}

- (void)pauseLocalSpeechRecognitionForRequestId:(id)a3
{
  id v4 = a3;
  int v5 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[CSAttSiriBridgeMessageHandler pauseLocalSpeechRecognitionForRequestId:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Pause local speech recognition for requestId: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode pauseLocalSpeechRecognitionForRequestId:v4];
}

- (void)disableLocalSpeechRecognitionForRequestId:(id)a3
{
  id v4 = a3;
  int v5 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[CSAttSiriBridgeMessageHandler disableLocalSpeechRecognitionForRequestId:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s disable local speech recognition for request : %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode disableLocalSpeechRecognitionForRequestId:v4];
}

- (void)stopSpeechRecognitionWithReason:(unint64_t)a3 requestId:(id)a4
{
}

- (void)startSpeechRecognitionResultsWithSettings:(id)a3
{
}

- (void)preheatLocalSpeechRecognitionWithLanguage:(id)a3 source:(unint64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    id v9 = "-[CSAttSiriBridgeMessageHandler preheatLocalSpeechRecognitionWithLanguage:source:]";
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s preheat local speech recognition : %{public}@ %d", (uint8_t *)&v8, 0x1Cu);
  }
  [(CSAttSiriSpeechRecognitionNode *)self->_speechRecognitionNode preheatWithLanguage:v6 source:0 shouldDownloadMissingAsset:1];
}

- (void)updateTCUState:(id)a3
{
  id v4 = a3;
  int v5 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[CSAttSiriBridgeMessageHandler updateTCUState:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Update TCU State : %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(CSAttSiriTCUGenerator *)self->_tcuGenerator processTCUUpdateMessage:v4];
}

- (CSAttSiriBridgeMessageHandler)initWithSpeechRecognitionNode:(id)a3 tcuGenerator:(id)a4 supportTCU:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSAttSiriBridgeMessageHandler;
  id v11 = [(CSAttSiriBridgeMessageHandler *)&v14 init];
  __int16 v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_speechRecognitionNode, a3);
    objc_storeStrong((id *)&v12->_tcuGenerator, a4);
    v12->_supportTCU = a5;
  }

  return v12;
}

@end