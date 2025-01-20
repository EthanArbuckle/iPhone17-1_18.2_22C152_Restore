@interface XRMobileAgentDock
- (BOOL)waitForAgentToDock;
- (XRMobileAgent)dockedAgent;
- (XRMobileAgentDock)init;
- (void)abandon;
- (void)dealloc;
- (void)executeDockedAgent;
- (void)receiveMobileAgent:(id)a3;
- (void)releaseDockedAgent;
- (void)setDockedAgent:(id)a3;
@end

@implementation XRMobileAgentDock

- (XRMobileAgentDock)init
{
  v6.receiver = self;
  v6.super_class = (Class)XRMobileAgentDock;
  v2 = [(XRMobileAgentDock *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    waitingAgents = v2->_waitingAgents;
    v2->_waitingAgents = (NSMutableArray *)v3;

    pthread_mutex_init(&v2->_mutex, 0);
    pthread_cond_init(&v2->_cond, 0);
  }
  return v2;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_mutex);
  pthread_cond_destroy(&self->_cond);
  v3.receiver = self;
  v3.super_class = (Class)XRMobileAgentDock;
  [(XRMobileAgentDock *)&v3 dealloc];
}

- (void)abandon
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  self->_abandoned = 1;
  [self->_waitingAgents removeAllObjects];
  dockedAgent = self->_dockedAgent;
  self->_dockedAgent = 0;

  pthread_cond_signal(&self->_cond);

  pthread_mutex_unlock(p_mutex);
}

- (void)receiveMobileAgent:(id)a3
{
  if (a3)
  {
    p_mutex = &self->_mutex;
    id v5 = a3;
    pthread_mutex_lock(p_mutex);
    [self->_waitingAgents addObject:v6 withTransitionContext:(uint64_t)v5 withTransitionContext:(uint64_t)v7 withTransitionContext:(uint64_t)v8];

    pthread_cond_signal(&self->_cond);
    pthread_mutex_unlock(p_mutex);
  }
}

- (BOOL)waitForAgentToDock
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  do
  {
    [self->_waitingAgents firstObject:v4, v5, v6, v7];
    uint64_t v8 = (XRMobileAgent *)objc_claimAutoreleasedReturnValue();
    dockedAgent = self->_dockedAgent;
    self->_dockedAgent = v8;

    if (self->_dockedAgent) {
      [self->_waitingAgents removeObjectAtIndex:v10];
    }
    else {
      pthread_cond_wait(&self->_cond, p_mutex);
    }
  }
  while (!self->_dockedAgent);
  pthread_mutex_unlock(p_mutex);
  self->_agentExecuted = 0;
  return self->_dockedAgent != 0;
}

- (void)executeDockedAgent
{
  if (!self->_agentExecuted)
  {
    dockedAgent = self->_dockedAgent;
    if (dockedAgent)
    {
      [dockedAgent a2:v2 v3:v3 v4:v4];
      self->_agentExecuted = 1;
    }
  }
}

- (void)releaseDockedAgent
{
  if (self->_dockedAgent)
  {
    [self executeDockedAgent:a2 withOptions:v2 withCompletion:v3 withCompletionHandler:v4];
    [self->_dockedAgent goodbye:v6 v7:v8 v9:v9];
    self->_agentExecuted = 0;
    dockedAgent = self->_dockedAgent;
    self->_dockedAgent = 0;
  }
}

- (XRMobileAgent)dockedAgent
{
  return self->_dockedAgent;
}

- (void)setDockedAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dockedAgent, 0);

  objc_storeStrong((id *)&self->_waitingAgents, 0);
}

@end