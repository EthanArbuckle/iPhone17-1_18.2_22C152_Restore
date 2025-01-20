@interface WFRunningPersistentModeWorkflow
- (BOOL)completed;
- (NSProgress)progress;
- (WFBannerPresentable)associatedPill;
- (WFDialogAttribution)attribution;
- (WFRunningPersistentModeWorkflow)initWithRunningContext:(id)a3 attribution:(id)a4 progressSubscriber:(id)a5;
- (WFWorkflowRunningContext)runningContext;
- (id)progressSubscriber;
- (void)setAssociatedPill:(id)a3;
- (void)setAttribution:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)updateWithProgress:(id)a3;
@end

@implementation WFRunningPersistentModeWorkflow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedPill, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);

  objc_storeStrong((id *)&self->_runningContext, 0);
}

- (void)setAssociatedPill:(id)a3
{
}

- (WFBannerPresentable)associatedPill
{
  return self->_associatedPill;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setAttribution:(id)a3
{
}

- (WFDialogAttribution)attribution
{
  return self->_attribution;
}

- (id)progressSubscriber
{
  return self->_progressSubscriber;
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (void)updateWithProgress:(id)a3
{
  v5 = (NSProgress *)a3;
  if (!v5)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"WFRunningPersistentModeWorkflow.m", 31, @"Invalid parameter not satisfying: %@", @"progress" object file lineNumber description];
  }
  progress = self->_progress;
  self->_progress = v5;
}

- (WFRunningPersistentModeWorkflow)initWithRunningContext:(id)a3 attribution:(id)a4 progressSubscriber:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFRunningPersistentModeWorkflow.m", 17, @"Invalid parameter not satisfying: %@", @"attribution" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v17 = +[NSAssertionHandler currentHandler];
  [v17 handleFailureInMethod:a2, self, @"WFRunningPersistentModeWorkflow.m", 16, @"Invalid parameter not satisfying: %@", @"runningContext" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v19 = +[NSAssertionHandler currentHandler];
  [v19 handleFailureInMethod:a2, self, @"WFRunningPersistentModeWorkflow.m", 18, @"Invalid parameter not satisfying: %@", @"progressSubscriber" object file lineNumber description];

LABEL_4:
  v20.receiver = self;
  v20.super_class = (Class)WFRunningPersistentModeWorkflow;
  v13 = [(WFRunningPersistentModeWorkflow *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_runningContext, a3);
    objc_storeStrong((id *)&v14->_attribution, a4);
    objc_storeStrong(&v14->_progressSubscriber, a5);
    v15 = v14;
  }

  return v14;
}

@end