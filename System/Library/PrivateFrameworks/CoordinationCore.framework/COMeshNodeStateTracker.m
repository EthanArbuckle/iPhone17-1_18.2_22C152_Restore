@interface COMeshNodeStateTracker
- (BOOL)hasOutstandingProbe;
- (BOOL)hasOutstandingRequest;
- (COBallot)lastBallotReceived;
- (COBallot)lastBallotSent;
- (COMeshNode)node;
- (COMeshNodeStateTracker)initWithNode:(id)a3;
- (COMeshNodeStateTrackerDelegate)delegate;
- (OS_dispatch_source)backoffTimer;
- (double)lastHeard;
- (id)backoffResponse;
- (id)description;
- (int64_t)electionStage;
- (int64_t)status;
- (unint64_t)backoffBucket;
- (unint64_t)lastGenerationReceived;
- (unint64_t)lastGenerationSent;
- (unint64_t)state;
- (unint64_t)totalBackedOffTime;
- (void)didFireBackoffTimer;
- (void)resetBackoffInformation;
- (void)setBackoffBucket:(unint64_t)a3;
- (void)setBackoffResponse:(id)a3;
- (void)setBackoffTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElectionStage:(int64_t)a3;
- (void)setLastBallotReceived:(id)a3;
- (void)setLastBallotSent:(id)a3;
- (void)setLastGenerationReceived:(unint64_t)a3;
- (void)setLastGenerationSent:(unint64_t)a3;
- (void)setLastHeard:(double)a3;
- (void)setOutstandingProbe:(BOOL)a3;
- (void)setOutstandingRequest:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation COMeshNodeStateTracker

- (COMeshNodeStateTracker)initWithNode:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMeshNodeStateTracker;
  v6 = [(COMeshNodeStateTracker *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_node, a3);
  }

  return v7;
}

- (id)description
{
  unint64_t v3 = [(COMeshNodeStateTracker *)self status];
  if (v3 > 2) {
    v4 = @"unknown";
  }
  else {
    v4 = off_2645CD840[v3];
  }
  id v5 = COMeshControllerStateDescription([(COMeshNodeStateTracker *)self state]);
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  objc_super v9 = [(COMeshNodeStateTracker *)self node];
  v10 = [v6 stringWithFormat:@"<%@: %p, state: %@, status: %@, node: %@>", v8, self, v5, v4, v9];

  return v10;
}

- (void)setBackoffTimer:(id)a3
{
  id v5 = (OS_dispatch_source *)a3;
  backoffTimer = self->_backoffTimer;
  p_backoffTimer = &self->_backoffTimer;
  v6 = backoffTimer;
  objc_super v9 = v5;
  if (backoffTimer != v5)
  {
    if (v6) {
      dispatch_source_cancel(v6);
    }
    objc_storeStrong((id *)p_backoffTimer, a3);
    if (*p_backoffTimer) {
      dispatch_resume((dispatch_object_t)*p_backoffTimer);
    }
  }
}

- (void)resetBackoffInformation
{
  [(COMeshNodeStateTracker *)self setBackoffResponse:0];
  [(COMeshNodeStateTracker *)self setLastBallotReceived:0];
  [(COMeshNodeStateTracker *)self setLastBallotSent:0];
  [(COMeshNodeStateTracker *)self setOutstandingRequest:0];
}

- (void)setState:(unint64_t)a3
{
  unint64_t v3 = a3;
  switch(a3)
  {
    case 0uLL:
    case 4uLL:
      [(COMeshNodeStateTracker *)self setStatus:0];
      [(COMeshNodeStateTracker *)self resetBackoffInformation];
      break;
    case 1uLL:
      if ([(COMeshNodeStateTracker *)self status] != 2) {
        [(COMeshNodeStateTracker *)self setStatus:0];
      }
      break;
    case 2uLL:
    case 3uLL:
      [(COMeshNodeStateTracker *)self setStatus:1];
      [(COMeshNodeStateTracker *)self setOutstandingProbe:0];
      break;
    default:
      break;
  }
  unint64_t state = self->_state;
  BOOL v6 = state > 4;
  uint64_t v7 = (1 << state) & 0x13;
  if (v6 || v7 == 0)
  {
    self->_unint64_t state = v3;
  }
  else
  {
    self->_unint64_t state = v3;
    if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      objc_super v9 = [(COMeshNodeStateTracker *)self delegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        v11 = [(COMeshNodeStateTracker *)self delegate];
        [v11 nodeBecameAvailable:self];
      }
      unint64_t v3 = self->_state;
    }
  }
  if (v3 != 2)
  {
    [(COMeshNodeStateTracker *)self setBackoffTimer:0];
    if (self->_totalBackedOffTime)
    {
      v12 = [(COMeshNodeStateTracker *)self delegate];
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        v14 = [(COMeshNodeStateTracker *)self delegate];
        [v14 backedOffNodeMovedOutOfElection:self];
      }
    }
    self->_totalBackedOffTime = 0;
  }
}

- (void)setElectionStage:(int64_t)a3
{
  if (self->_electionStage != a3)
  {
    self->_electionStage = a3;
    if (a3 == 4)
    {
      v4 = [(COMeshNodeStateTracker *)self backoffTimer];

      if (!v4)
      {
        id v5 = [(COMeshNodeStateTracker *)self node];
        BOOL v6 = [v5 client];
        uint64_t v7 = [v6 dispatchQueue];
        v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v7);

        if (v8)
        {
          dispatch_time_t v9 = dispatch_walltime(0, 100000000);
          dispatch_source_set_timer(v8, v9, 0x5F5E100uLL, 0);
          objc_initWeak(&location, self);
          uint64_t v11 = MEMORY[0x263EF8330];
          uint64_t v12 = 3221225472;
          char v13 = __43__COMeshNodeStateTracker_setElectionStage___block_invoke;
          v14 = &unk_2645CB2E0;
          objc_copyWeak(&v15, &location);
          dispatch_source_set_event_handler(v8, &v11);
          -[COMeshNodeStateTracker setBackoffBucket:](self, "setBackoffBucket:", 0, v11, v12, v13, v14);
          [(COMeshNodeStateTracker *)self setBackoffTimer:v8];
          objc_destroyWeak(&v15);
          objc_destroyWeak(&location);
        }
        else
        {
          char v10 = COCoreLogForCategory(0);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[COMeshNodeStateTracker setElectionStage:](v10);
          }
        }
      }
    }
  }
}

void __43__COMeshNodeStateTracker_setElectionStage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained didFireBackoffTimer];
    id WeakRetained = v2;
  }
}

- (void)setLastHeard:(double)a3
{
  [(COMeshNodeStateTracker *)self lastHeard];
  if (v5 != a3)
  {
    self->_lastHeard = a3;
    [(COMeshNodeStateTracker *)self setOutstandingProbe:0];
  }
}

- (void)didFireBackoffTimer
{
  unint64_t v3 = [(COMeshNodeStateTracker *)self backoffBucket];
  uint64_t v4 = COMeshNodeStateTrackerBackoffSeries[v3];
  self->_totalBackedOffTime += v4;
  if (v3 <= 0xC)
  {
    unint64_t v5 = v3 + 1;
    [(COMeshNodeStateTracker *)self setBackoffBucket:v3 + 1];
    uint64_t v4 = COMeshNodeStateTrackerBackoffSeries[v5];
  }
  uint64_t v6 = 1000000 * v4;
  dispatch_time_t v7 = dispatch_walltime(0, 1000000 * v4);
  v8 = [(COMeshNodeStateTracker *)self backoffTimer];
  dispatch_source_set_timer(v8, v7, v6, 0);

  dispatch_time_t v9 = [(COMeshNodeStateTracker *)self delegate];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    id v10 = [(COMeshNodeStateTracker *)self delegate];
    [v10 nodeShouldRetryAfterBackoff:self];
  }
}

- (COMeshNode)node
{
  return self->_node;
}

- (unint64_t)state
{
  return self->_state;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)electionStage
{
  return self->_electionStage;
}

- (COMeshNodeStateTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (COMeshNodeStateTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)backoffBucket
{
  return self->_backoffBucket;
}

- (void)setBackoffBucket:(unint64_t)a3
{
  self->_backoffBucket = a3;
}

- (unint64_t)totalBackedOffTime
{
  return self->_totalBackedOffTime;
}

- (id)backoffResponse
{
  return self->_backoffResponse;
}

- (void)setBackoffResponse:(id)a3
{
}

- (unint64_t)lastGenerationSent
{
  return self->_lastGenerationSent;
}

- (void)setLastGenerationSent:(unint64_t)a3
{
  self->_lastGenerationSent = a3;
}

- (COBallot)lastBallotSent
{
  return self->_lastBallotSent;
}

- (void)setLastBallotSent:(id)a3
{
}

- (unint64_t)lastGenerationReceived
{
  return self->_lastGenerationReceived;
}

- (void)setLastGenerationReceived:(unint64_t)a3
{
  self->_lastGenerationReceived = a3;
}

- (COBallot)lastBallotReceived
{
  return self->_lastBallotReceived;
}

- (void)setLastBallotReceived:(id)a3
{
}

- (double)lastHeard
{
  return self->_lastHeard;
}

- (BOOL)hasOutstandingProbe
{
  return self->_outstandingProbe;
}

- (void)setOutstandingProbe:(BOOL)a3
{
  self->_outstandingProbe = a3;
}

- (BOOL)hasOutstandingRequest
{
  return self->_outstandingRequest;
}

- (void)setOutstandingRequest:(BOOL)a3
{
  self->_outstandingRequest = a3;
}

- (OS_dispatch_source)backoffTimer
{
  return self->_backoffTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_lastBallotReceived, 0);
  objc_storeStrong((id *)&self->_lastBallotSent, 0);
  objc_storeStrong(&self->_backoffResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_node, 0);
}

- (void)setElectionStage:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2217C1000, log, OS_LOG_TYPE_ERROR, "Failed to create the back off timer!", v1, 2u);
}

@end