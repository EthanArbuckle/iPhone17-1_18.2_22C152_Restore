@interface MKThrottledGate
- (BOOL)_dispatchWaitingJobsIfNecessary;
- (BOOL)_replenishAvailableJobsIfNecessary;
- (MKThrottledGate)initWithMax:(int)a3 refreshRate:(double)a4 queue:(id)a5;
- (id)description;
- (void)_ensureTimer;
- (void)_timerFired:(id)a3;
- (void)dealloc;
- (void)dispatch:(id)a3;
@end

@implementation MKThrottledGate

- (MKThrottledGate)initWithMax:(int)a3 refreshRate:(double)a4 queue:(id)a5
{
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MKThrottledGate;
  v10 = [(MKThrottledGate *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a5);
    v11->_maxAvailableTickets = a3;
    v11->_availableTickets = (double)a3;
    v11->_refreshRate = a4;
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB3A98]) initWithTarget:v11 selector:sel__timerFired_ queue:v11->_queue];
    timer = v11->_timer;
    v11->_timer = (VKTimer *)v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    waitingJobs = v11->_waitingJobs;
    v11->_waitingJobs = v14;
  }
  return v11;
}

- (void)dealloc
{
  [(VKTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MKThrottledGate;
  [(MKThrottledGate *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p: max tickets: %d, available: %f, refresh rate: %f, waiting jobs: %lu", v5, self, self->_maxAvailableTickets, *(void *)&self->_availableTickets, *(void *)&self->_refreshRate, -[NSMutableArray count](self->_waitingJobs, "count")];

  return v6;
}

- (void)_ensureTimer
{
  [(VKTimer *)self->_timer nextFireDate];
  if (v3 > CFAbsoluteTimeGetCurrent() + 1.0)
  {
    timer = self->_timer;
    [(VKTimer *)timer fireAfter:1.0];
  }
}

- (void)dispatch:(id)a3
{
  uint64_t v4 = [a3 copy];
  waitingJobs = self->_waitingJobs;
  id v7 = (id)v4;
  v6 = (void *)MEMORY[0x18C139AE0]();
  [(NSMutableArray *)waitingJobs addObject:v6];

  if ([(MKThrottledGate *)self _dispatchWaitingJobsIfNecessary]) {
    [(MKThrottledGate *)self _ensureTimer];
  }
}

- (void)_timerFired:(id)a3
{
  BOOL v4 = [(MKThrottledGate *)self _replenishAvailableJobsIfNecessary];
  BOOL v5 = [(MKThrottledGate *)self _dispatchWaitingJobsIfNecessary];
  if (v4 || v5)
  {
    [(MKThrottledGate *)self _ensureTimer];
  }
}

- (BOOL)_replenishAvailableJobsIfNecessary
{
  double availableTickets = self->_availableTickets;
  double maxAvailableTickets = (double)self->_maxAvailableTickets;
  if (availableTickets < maxAvailableTickets)
  {
    double availableTickets = availableTickets + self->_refreshRate;
    if (availableTickets >= maxAvailableTickets) {
      double availableTickets = (double)self->_maxAvailableTickets;
    }
    self->_double availableTickets = availableTickets;
  }
  return availableTickets < maxAvailableTickets;
}

- (BOOL)_dispatchWaitingJobsIfNecessary
{
  uint64_t v3 = [(NSMutableArray *)self->_waitingJobs count];
  if (v3)
  {
    while (self->_availableTickets >= 1.0)
    {
      if (![(NSMutableArray *)self->_waitingJobs count]) {
        break;
      }
      self->_double availableTickets = self->_availableTickets + -1.0;
      BOOL v4 = [(NSMutableArray *)self->_waitingJobs objectAtIndex:0];
      [(NSMutableArray *)self->_waitingJobs removeObjectAtIndex:0];
      dispatch_async((dispatch_queue_t)self->_queue, v4);
    }
    LOBYTE(v3) = [(NSMutableArray *)self->_waitingJobs count] != 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_waitingJobs, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end