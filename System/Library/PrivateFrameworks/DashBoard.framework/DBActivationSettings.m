@interface DBActivationSettings
- (BOOL)forTesting;
- (BOOL)isAnimated;
- (BOOL)isSuspended;
- (BOOL)waitForCommit;
- (DBActivationSettings)init;
- (FBProcess)clientProcess;
- (NSSet)actions;
- (NSURL)url;
- (double)failInterval;
- (unint64_t)launchSource;
- (void)setActions:(id)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setClientProcess:(id)a3;
- (void)setFailInterval:(double)a3;
- (void)setForTesting:(BOOL)a3;
- (void)setLaunchSource:(unint64_t)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setUrl:(id)a3;
- (void)setWaitForCommit:(BOOL)a3;
@end

@implementation DBActivationSettings

- (DBActivationSettings)init
{
  v8.receiver = self;
  v8.super_class = (Class)DBActivationSettings;
  v2 = [(DBActivationSettings *)&v8 init];
  v3 = v2;
  if (v2)
  {
    url = v2->_url;
    v2->_url = 0;

    v3->_animated = 1;
    actions = v3->_actions;
    v3->_launchSource = 0;
    v3->_actions = 0;

    *(_WORD *)&v3->_waitForCommit = 0;
    clientProcess = v3->_clientProcess;
    v3->_failInterval = 0.0;
    v3->_clientProcess = 0;
    v3->_suspended = 0;
  }
  return v3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (unint64_t)launchSource
{
  return self->_launchSource;
}

- (void)setLaunchSource:(unint64_t)a3
{
  self->_launchSource = a3;
}

- (NSSet)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (BOOL)waitForCommit
{
  return self->_waitForCommit;
}

- (void)setWaitForCommit:(BOOL)a3
{
  self->_waitForCommit = a3;
}

- (BOOL)forTesting
{
  return self->_forTesting;
}

- (void)setForTesting:(BOOL)a3
{
  self->_forTesting = a3;
}

- (double)failInterval
{
  return self->_failInterval;
}

- (void)setFailInterval:(double)a3
{
  self->_failInterval = a3;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (FBProcess)clientProcess
{
  return self->_clientProcess;
}

- (void)setClientProcess:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProcess, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end