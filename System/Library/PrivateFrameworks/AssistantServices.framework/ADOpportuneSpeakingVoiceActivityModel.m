@interface ADOpportuneSpeakingVoiceActivityModel
- (ADOpportuneSpeakingVoiceActivityModel)initWithQueue:(id)a3 stateManager:(id)a4;
- (id)_detector;
- (id)modelIdentifier;
- (void)setSpeakable:(id)a3;
- (void)startWithDelegate:(id)a3;
- (void)stop;
@end

@implementation ADOpportuneSpeakingVoiceActivityModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_detector, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)stop
{
  delegate = self->_delegate;
  self->_delegate = 0;

  detector = self->_detector;
  self->_detector = 0;
}

- (void)setSpeakable:(id)a3
{
  id v4 = a3;
  v5 = +[AFPreferences sharedPreferences];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  uint64_t v17 = 0;
  [v5 opportuneSpeakingPauseInterval];
  uint64_t v17 = v6;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  uint64_t v15 = 0;
  [v5 opportuneSpeakingTimeoutInterval];
  uint64_t v15 = v7;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10013A31C;
  v10[3] = &unk_100503658;
  v10[4] = self;
  id v11 = v4;
  v12 = v16;
  v13 = v14;
  id v9 = v4;
  dispatch_async(queue, v10);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
}

- (void)startWithDelegate:(id)a3
{
}

- (id)_detector
{
  detector = self->_detector;
  if (!detector)
  {
    id v4 = [[ADOpportuneSpeakingModuleEdgeDetector alloc] initWithQueue:self->_queue stateManager:self->_stateManager];
    v5 = self->_detector;
    self->_detector = v4;

    detector = self->_detector;
  }
  return detector;
}

- (id)modelIdentifier
{
  return self->_modelIdentifier;
}

- (ADOpportuneSpeakingVoiceActivityModel)initWithQueue:(id)a3 stateManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ADOpportuneSpeakingVoiceActivityModel;
  id v9 = [(ADOpportuneSpeakingVoiceActivityModel *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_stateManager, a4);
    modelIdentifier = v10->_modelIdentifier;
    v10->_modelIdentifier = (NSString *)@"Voice Activity";

    v12 = v10;
  }

  return v10;
}

@end