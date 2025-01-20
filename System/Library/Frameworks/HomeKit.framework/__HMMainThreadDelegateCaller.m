@interface __HMMainThreadDelegateCaller
- (void)invokeBlock:(id)a3;
@end

@implementation __HMMainThreadDelegateCaller

- (void)invokeBlock:(id)a3
{
  v3 = (void (**)(void))a3;
  if (v3)
  {
    block = v3;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      block[2]();
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    v3 = block;
  }
}

@end