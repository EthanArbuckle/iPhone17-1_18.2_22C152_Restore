@interface CSAttSiriRCHandler
- (CSAttSiriEndpointerNode)endpointerNode;
- (CSAttSiriRCHandler)initWithEndpointerNode:(id)a3 uresNode:(id)a4;
- (CSAttSiriUresNode)uresNode;
- (NSHashTable)resultCandidateReceivers;
- (OS_dispatch_queue)queue;
- (void)addResultCandidateReceiver:(id)a3;
- (void)getMitigationDecisionForRCIdWithCompletion:(unint64_t)a3 requestId:(id)a4 completion:(id)a5;
- (void)processRCWithId:(unint64_t)a3 requestId:(id)a4 speechPackage:(id)a5 taskId:(id)a6 forceAccept:(BOOL)a7 completionHandler:(id)a8;
- (void)setEndpointerNode:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResultCandidateReceivers:(id)a3;
- (void)setUresNode:(id)a3;
@end

@implementation CSAttSiriRCHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultCandidateReceivers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_uresNode);
  objc_destroyWeak((id *)&self->_endpointerNode);
  objc_storeStrong(&self->_lastEndpointHintCompletion, 0);
  objc_storeStrong((id *)&self->_lastEndpointHintFeatures, 0);
}

- (void)setResultCandidateReceivers:(id)a3
{
}

- (NSHashTable)resultCandidateReceivers
{
  return self->_resultCandidateReceivers;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setUresNode:(id)a3
{
}

- (CSAttSiriUresNode)uresNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uresNode);
  return (CSAttSiriUresNode *)WeakRetained;
}

- (void)setEndpointerNode:(id)a3
{
}

- (CSAttSiriEndpointerNode)endpointerNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerNode);
  return (CSAttSiriEndpointerNode *)WeakRetained;
}

- (void)getMitigationDecisionForRCIdWithCompletion:(unint64_t)a3 requestId:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, id))a5;
  v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    v14 = "-[CSAttSiriRCHandler getMitigationDecisionForRCIdWithCompletion:requestId:completion:]";
    __int16 v15 = 2048;
    unint64_t v16 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s rcId: %lu", (uint8_t *)&v13, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uresNode);
  id v12 = [WeakRetained getMitigationDecisionForRCId:a3 forRequestId:v8];

  if (v9) {
    v9[2](v9, v12);
  }
}

- (void)processRCWithId:(unint64_t)a3 requestId:(id)a4 speechPackage:(id)a5 taskId:(id)a6 forceAccept:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = (void (**)(id, BOOL, BOOL, void))a8;
  v18 = [v15 recognition];
  [v18 processedAudioDuration];
  double v20 = v19;

  v21 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[CSAttSiriRCHandler processRCWithId:requestId:speechPackage:taskId:forceAccept:completionHandler:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    double v43 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s Received RC %lu with duration %f from server, make RC acceptance and mitigation decision", buf, 0x20u);
  }
  if (!+[CSUtils isMedocFeatureEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_uresNode);
    [WeakRetained processResultCandidate:v15 forRCId:a3 forTask:v16 forRequestId:v14 completion:0];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v43) = 0;
    if (v9)
    {
      if ((+[CSUtils isMedocFeatureEnabled] & 1) == 0)
      {
        id v24 = objc_loadWeakRetained((id *)&self->_uresNode);
        unsigned __int8 v25 = [v24 getMitigationDecisionForRCId:a3 forRequestId:v14];
        *(unsigned char *)(*(void *)&buf[8] + 24) = v25;
      }
      if (!v17) {
        goto LABEL_15;
      }
      BOOL v26 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
      goto LABEL_14;
    }
    id v27 = objc_loadWeakRetained((id *)&self->_endpointerNode);
    BOOL v28 = v27 == 0;

    if (v28)
    {
      if (v17)
      {
        BOOL v26 = 0;
LABEL_14:
        v17[2](v17, v9, v26, 0);
      }
    }
    else
    {
      id v29 = objc_loadWeakRetained((id *)&self->_endpointerNode);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000EE2FC;
      v30[3] = &unk_100251700;
      v33 = buf;
      unint64_t v34 = a3;
      v30[4] = self;
      id v31 = v14;
      v32 = v17;
      [v29 shouldAcceptEagerResultForDuration:v30 resultsCompletionHandler:v20];
    }
LABEL_15:
    _Block_object_dispose(buf, 8);
    goto LABEL_16;
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EE138;
  block[3] = &unk_1002516D8;
  block[4] = self;
  id v36 = v14;
  unint64_t v40 = a3;
  id v37 = v15;
  double v41 = v20;
  id v38 = v16;
  v39 = v17;
  dispatch_async(queue, block);

LABEL_16:
}

- (void)addResultCandidateReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EE4E0;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (CSAttSiriRCHandler)initWithEndpointerNode:(id)a3 uresNode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CSAttSiriRCHandler;
  id v8 = [(CSAttSiriRCHandler *)&v15 init];
  if (v8)
  {
    BOOL v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSAttSiriRCHandler initWithEndpointerNode:uresNode:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    objc_storeWeak((id *)&v8->_endpointerNode, v6);
    objc_storeWeak((id *)&v8->_uresNode, v7);
    uint64_t v10 = +[NSHashTable weakObjectsHashTable];
    resultCandidateReceivers = v8->_resultCandidateReceivers;
    v8->_resultCandidateReceivers = (NSHashTable *)v10;

    uint64_t v12 = +[CSUtils getSerialQueueWithQOS:33 name:@"AttSiriRCHandler Queue" fixedPriority:kCSDefaultSerialQueueFixedPriority];
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;
  }
  return v8;
}

@end