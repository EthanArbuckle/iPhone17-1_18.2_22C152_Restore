@interface GKNetworkActivityIndicatorDelegate
- (int)networkIndicatorCount;
- (void)beginNetworkActivity;
- (void)endNetworkActivity;
- (void)resetNetworkActivity;
- (void)setNetworkIndicatorCount:(int)a3;
@end

@implementation GKNetworkActivityIndicatorDelegate

- (void)beginNetworkActivity
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__GKNetworkActivityIndicatorDelegate_beginNetworkActivity__block_invoke;
  block[3] = &unk_1E5F62EB0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__GKNetworkActivityIndicatorDelegate_beginNetworkActivity__block_invoke()
{
  BOOL v0 = (int)GKAtomicIncrement32() > 0;
  id v1 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v1 setNetworkActivityIndicatorVisible:v0];
}

- (void)endNetworkActivity
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__GKNetworkActivityIndicatorDelegate_endNetworkActivity__block_invoke;
  block[3] = &unk_1E5F62EB0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__GKNetworkActivityIndicatorDelegate_endNetworkActivity__block_invoke(uint64_t a1)
{
  if (*(int *)(*(void *)(a1 + 32) + 8) >= 1)
  {
    BOOL v1 = (int)GKAtomicDecrement32() > 0;
    id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v2 setNetworkActivityIndicatorVisible:v1];
  }
}

- (void)resetNetworkActivity
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__GKNetworkActivityIndicatorDelegate_resetNetworkActivity__block_invoke;
  block[3] = &unk_1E5F62EB0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__GKNetworkActivityIndicatorDelegate_resetNetworkActivity__block_invoke()
{
  if (GKAtomicCompareAndSwap32())
  {
    id v0 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v0 setNetworkActivityIndicatorVisible:0];
  }
}

- (int)networkIndicatorCount
{
  return self->_networkIndicatorCount;
}

- (void)setNetworkIndicatorCount:(int)a3
{
  self->_networkIndicatorCount = a3;
}

@end