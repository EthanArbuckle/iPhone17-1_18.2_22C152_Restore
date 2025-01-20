@interface ProcessStateTracker
- (BOOL)isProcessStateSuspended;
- (BOOL)isProcessTerminated;
- (BOOL)purgeSuspended;
- (BOOL)setPurgeSuspended:(BOOL)a3;
- (id)initForClientPID:(int)a3 withOperator:(id)a4;
- (int)startMonitoringClientPID;
- (void)dealloc;
- (void)monitor:(id)a3 notifiedUpdate:(id)a4 forPID:(int)a5;
@end

@implementation ProcessStateTracker

- (id)initForClientPID:(int)a3 withOperator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ProcessStateTracker;
  v6 = [(ProcessStateTracker *)&v8 init];
  if (v6)
  {
    v6->_operator = (FigPurgeAndRenewPurgeOperator *)a4;
    v6->_monitor = 0;
    v6->_clientPID = a3;
    if ([(ProcessStateTracker *)v6 startMonitoringClientPID])
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  [(RBSProcessMonitor *)self->_monitor invalidate];

  v3.receiver = self;
  v3.super_class = (Class)ProcessStateTracker;
  [(ProcessStateTracker *)&v3 dealloc];
}

- (int)startMonitoringClientPID
{
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__ProcessStateTracker_startMonitoringClientPID__block_invoke;
  v10[3] = &unk_1E56764B0;
  objc_copyWeak(&v11, &location);
  uint64_t v3 = [MEMORY[0x1E4F96400] identifierWithPid:self->_clientPID];
  if (!v3) {
    goto LABEL_7;
  }
  v4 = (void *)[MEMORY[0x1E4F96428] predicateMatchingIdentifier:v3];
  if (!v4)
  {
LABEL_8:
    int v7 = -19471;
    goto LABEL_6;
  }
  v5 = (void *)[MEMORY[0x1E4F963F0] handleForIdentifier:v3 error:0];
  if (!v5)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__ProcessStateTracker_startMonitoringClientPID__block_invoke_2;
  v9[3] = &unk_1E56764D8;
  v9[4] = v4;
  v9[5] = v10;
  v4 = (void *)[MEMORY[0x1E4F96420] monitorWithConfiguration:v9];
  if (![v5 currentState]) {
    goto LABEL_8;
  }
  v6 = v4;
  v4 = 0;
  int v7 = 0;
  self->_monitor = v6;
LABEL_6:
  [v4 invalidate];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

id __47__ProcessStateTracker_startMonitoringClientPID__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id result = objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    objc_super v8 = result;
    uint64_t v9 = [a3 pid];
    return (id)[v8 monitor:a2 notifiedUpdate:a4 forPID:v9];
  }
  return result;
}

uint64_t __47__ProcessStateTracker_startMonitoringClientPID__block_invoke_2(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)[MEMORY[0x1E4F96450] descriptor];
  [v4 setValues:1];
  [v4 setEndowmentNamespaces:&unk_1EDF88D80];
  v6[0] = *(void *)(a1 + 32);
  objc_msgSend(a2, "setPredicates:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v6, 1));
  [a2 setStateDescriptor:v4];
  [a2 setUpdateHandler:*(void *)(a1 + 40)];
  return [a2 setEvents:1];
}

- (void)monitor:(id)a3 notifiedUpdate:(id)a4 forPID:(int)a5
{
  if (self->_monitor == a3 && self->_clientPID == a5)
  {
    uint64_t v7 = [a4 exitEvent];
    int v8 = objc_msgSend((id)objc_msgSend(a4, "state"), "taskState");
    if (v7)
    {
      operator = self->_operator;
      [(FigPurgeAndRenewPurgeOperator *)operator processDidTerminate];
    }
    else
    {
      int v10 = v8;
      id v11 = self->_operator;
      if (v10 == 3)
      {
        [(FigPurgeAndRenewPurgeOperator *)v11 processDidSuspend];
      }
      else
      {
        [(FigPurgeAndRenewPurgeOperator *)v11 processIsNoLongerSuspended];
      }
    }
  }
}

- (BOOL)isProcessTerminated
{
  v2 = objc_msgSend(MEMORY[0x1E4F963F0], "handleForIdentifier:error:", objc_msgSend(MEMORY[0x1E4F96400], "identifierWithPid:", self->_clientPID), 0);
  if (v2) {
    LOBYTE(v2) = [v2 currentState] == 0;
  }
  return (char)v2;
}

- (BOOL)setPurgeSuspended:(BOOL)a3
{
  return [(FigPurgeAndRenewPurgeOperator *)self->_operator setPurgeSuspended:a3];
}

- (BOOL)purgeSuspended
{
  return [(FigPurgeAndRenewPurgeOperator *)self->_operator purgeSuspended];
}

- (BOOL)isProcessStateSuspended
{
  return [(FigPurgeAndRenewPurgeOperator *)self->_operator isProcessStateSuspended];
}

@end