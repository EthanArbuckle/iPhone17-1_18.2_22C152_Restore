@interface NISessionVisionContext
- (ARFrame)latestARFrame;
- (ARSession)arSession;
- (BOOL)isARSessionInClientProcess;
- (BOOL)isARSessionInternal;
- (BOOL)isCameraAssistanceEnabled;
- (NISessionVisionContext)init;
- (unint64_t)arSessionState;
- (void)setArSession:(id)a3;
- (void)setArSessionInClientProcess:(BOOL)a3;
- (void)setArSessionInternal:(BOOL)a3;
- (void)setArSessionState:(unint64_t)a3;
- (void)setCameraAssistanceEnabled:(BOOL)a3;
- (void)setLatestARFrame:(id)a3;
@end

@implementation NISessionVisionContext

- (NISessionVisionContext)init
{
  v7.receiver = self;
  v7.super_class = (Class)NISessionVisionContext;
  v2 = [(NISessionVisionContext *)&v7 init];
  v3 = v2;
  if (v2)
  {
    arSession = v2->_arSession;
    v2->_arSession = 0;

    latestARFrame = v3->_latestARFrame;
    v3->_arSessionState = 0;
    v3->_latestARFrame = 0;
    *(_WORD *)&v3->_cameraAssistanceEnabled = 0;
    v3->_arSessionInClientProcess = 1;
  }
  return v3;
}

- (ARSession)arSession
{
  return self->_arSession;
}

- (void)setArSession:(id)a3
{
}

- (unint64_t)arSessionState
{
  return self->_arSessionState;
}

- (void)setArSessionState:(unint64_t)a3
{
  self->_arSessionState = a3;
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)a3
{
  self->_cameraAssistanceEnabled = a3;
}

- (BOOL)isARSessionInternal
{
  return self->_arSessionInternal;
}

- (void)setArSessionInternal:(BOOL)a3
{
  self->_arSessionInternal = a3;
}

- (BOOL)isARSessionInClientProcess
{
  return self->_arSessionInClientProcess;
}

- (void)setArSessionInClientProcess:(BOOL)a3
{
  self->_arSessionInClientProcess = a3;
}

- (ARFrame)latestARFrame
{
  return self->_latestARFrame;
}

- (void)setLatestARFrame:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestARFrame, 0);

  objc_storeStrong((id *)&self->_arSession, 0);
}

@end