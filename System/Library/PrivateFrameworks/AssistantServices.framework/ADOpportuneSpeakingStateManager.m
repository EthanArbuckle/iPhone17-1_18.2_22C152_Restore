@interface ADOpportuneSpeakingStateManager
- (ADOpportuneSpeakingStateManager)initWithQueue:(id)a3;
- (void)_listeningEdgeDetectorIDsChanged;
- (void)beginListeningForEdgeDetectorWithID:(id)a3;
- (void)endListeningForEdgeDetectorWithID:(id)a3;
@end

@implementation ADOpportuneSpeakingStateManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statePublisher, 0);
  objc_storeStrong((id *)&self->_listeningEdgeDetectorIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_listeningEdgeDetectorIDsChanged
{
  BOOL v3 = [(NSMutableSet *)self->_listeningEdgeDetectorIDs count] != 0;
  statePublisher = self->_statePublisher;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10020F5E0;
  v5[3] = &unk_100506DC8;
  BOOL v6 = v3;
  [(AFNotifyStatePublisher *)statePublisher publishStateWithBlock:v5];
}

- (void)endListeningForEdgeDetectorWithID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[ADOpportuneSpeakingStateManager endListeningForEdgeDetectorWithID:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s edgeDetectorID = %@", buf, 0x16u);
    }
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10020F7F0;
    v7[3] = &unk_10050E160;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)beginListeningForEdgeDetectorWithID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[ADOpportuneSpeakingStateManager beginListeningForEdgeDetectorWithID:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s edgeDetectorID = %@", buf, 0x16u);
    }
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10020F968;
    v7[3] = &unk_10050E160;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (ADOpportuneSpeakingStateManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ADOpportuneSpeakingStateManager;
  BOOL v6 = [(ADOpportuneSpeakingStateManager *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    id v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    listeningEdgeDetectorIDs = v7->_listeningEdgeDetectorIDs;
    v7->_listeningEdgeDetectorIDs = v8;

    id v10 = objc_alloc((Class)AFNotifyStatePublisher);
    id v11 = [objc_alloc((Class)NSString) initWithUTF8String:"com.apple.siri.opportune-speaking-module-state-changed"];
    id v12 = (AFNotifyStatePublisher *)[v10 initWithName:v11 queue:v7->_queue];
    statePublisher = v7->_statePublisher;
    v7->_statePublisher = v12;
  }
  return v7;
}

@end