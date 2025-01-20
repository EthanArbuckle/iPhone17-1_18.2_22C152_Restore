@interface CSAttSiriAudioCoordinator
- (BOOL)hasAudioEverStarted;
- (BOOL)shouldStopDeliverAudioOnEndpoint;
- (CSAttSiriAudioCoordinator)initWithTargetQueue:(id)a3;
- (NSHashTable)receivers;
- (OS_dispatch_queue)queue;
- (void)_handleClientDidStopIfNeeded;
- (void)addReceiver:(id)a3;
- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6;
- (void)intuitiveConvAudioCaptureMonitorDidStopAudioCapture:(id)a3 stopStreamOption:(id)a4 eventUUID:(id)a5;
- (void)removeReceiver:(id)a3;
- (void)reset;
- (void)setHasAudioEverStarted:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setShouldStopDeliverAudioOnEndpoint:(BOOL)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5;
@end

@implementation CSAttSiriAudioCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setHasAudioEverStarted:(BOOL)a3
{
  self->_hasAudioEverStarted = a3;
}

- (BOOL)hasAudioEverStarted
{
  return self->_hasAudioEverStarted;
}

- (void)setShouldStopDeliverAudioOnEndpoint:(BOOL)a3
{
  self->_shouldStopDeliverAudioOnEndpoint = a3;
}

- (BOOL)shouldStopDeliverAudioOnEndpoint
{
  return self->_shouldStopDeliverAudioOnEndpoint;
}

- (void)setReceivers:(id)a3
{
}

- (NSHashTable)receivers
{
  return self->_receivers;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_handleClientDidStopIfNeeded
{
  if (!self->_hasAudioEverStarted)
  {
    v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSAttSiriAudioCoordinator _handleClientDidStopIfNeeded]";
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Client didStop but audio coordinator didn't ever received audio started, issue attSiriAudioSrcNodeDidStop here to let all nodes hard stop", buf, 0xCu);
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v4 = self->_receivers;
    id v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "attSiriAudioSrcNodeDidStop:", 0, (void)v10);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    v9 = +[CSDiagnosticReporter sharedInstance];
    [v9 submitAudioIssueReport:kCSDiagnosticReporterIntuitiveConvTandemStreamDidNotReceiveAudio];
  }
}

- (void)intuitiveConvAudioCaptureMonitorDidStopAudioCapture:(id)a3 stopStreamOption:(id)a4 eventUUID:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004BA38;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004BAB4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004BB44;
  v7[3] = &unk_100253AB8;
  BOOL v8 = a6;
  v7[4] = self;
  dispatch_async(queue, v7);
}

- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004BCC8;
  block[3] = &unk_100253540;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)attSiriAudioSrcNodeDidStop:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004BE74;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004C098;
  v13[3] = &unk_100252588;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C26C;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)removeReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004C3C0;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004C464;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (CSAttSiriAudioCoordinator)initWithTargetQueue:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSAttSiriAudioCoordinator;
  id v5 = [(CSAttSiriAudioCoordinator *)&v11 init];
  if (v5)
  {
    if (v4) {
      dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("CSAttSiriAudioCoordinator Queue", 0, v4);
    }
    else {
      dispatch_queue_t v6 = dispatch_queue_create("CSAttSiriAudioCoordinator queue", 0);
    }
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[NSHashTable weakObjectsHashTable];
    receivers = v5->_receivers;
    v5->_receivers = (NSHashTable *)v8;

    *(_WORD *)&v5->_shouldStopDeliverAudioOnEndpoint = 0;
  }

  return v5;
}

@end