@interface ARDaemonReplayBlockDelegate
- (id)replayFailedBlock;
- (id)replayStartedBlock;
- (id)replayStoppedBlock;
- (id)replayUpdatedBlock;
- (void)replayDidFailWithError:(id)a3;
- (void)replayDidStartWithReplayTime:(double)a3;
- (void)replayDidStop;
- (void)replayDidUpdateResourceWithKey:(id)a3 atTime:(double)a4;
- (void)setReplayFailedBlock:(id)a3;
- (void)setReplayStartedBlock:(id)a3;
- (void)setReplayStoppedBlock:(id)a3;
- (void)setReplayUpdatedBlock:(id)a3;
@end

@implementation ARDaemonReplayBlockDelegate

- (void)replayDidFailWithError:(id)a3
{
  id v6 = a3;
  v4 = [(ARDaemonReplayBlockDelegate *)self replayFailedBlock];

  if (v4)
  {
    v5 = [(ARDaemonReplayBlockDelegate *)self replayFailedBlock];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)replayDidStartWithReplayTime:(double)a3
{
  v5 = [(ARDaemonReplayBlockDelegate *)self replayStartedBlock];

  if (v5)
  {
    id v6 = [(ARDaemonReplayBlockDelegate *)self replayStartedBlock];
    v6[2](a3);
  }
}

- (void)replayDidUpdateResourceWithKey:(id)a3 atTime:(double)a4
{
  id v8 = a3;
  id v6 = [(ARDaemonReplayBlockDelegate *)self replayUpdatedBlock];

  if (v6)
  {
    v7 = [(ARDaemonReplayBlockDelegate *)self replayUpdatedBlock];
    ((void (**)(void, id, double))v7)[2](v7, v8, a4);
  }
}

- (void)replayDidStop
{
  v3 = [(ARDaemonReplayBlockDelegate *)self replayStoppedBlock];

  if (v3)
  {
    v4 = [(ARDaemonReplayBlockDelegate *)self replayStoppedBlock];
    v4[2]();
  }
}

- (id)replayFailedBlock
{
  return self->_replayFailedBlock;
}

- (void)setReplayFailedBlock:(id)a3
{
}

- (id)replayStartedBlock
{
  return self->_replayStartedBlock;
}

- (void)setReplayStartedBlock:(id)a3
{
}

- (id)replayUpdatedBlock
{
  return self->_replayUpdatedBlock;
}

- (void)setReplayUpdatedBlock:(id)a3
{
}

- (id)replayStoppedBlock
{
  return self->_replayStoppedBlock;
}

- (void)setReplayStoppedBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_replayStoppedBlock, 0);
  objc_storeStrong(&self->_replayUpdatedBlock, 0);
  objc_storeStrong(&self->_replayStartedBlock, 0);
  objc_storeStrong(&self->_replayFailedBlock, 0);
}

@end