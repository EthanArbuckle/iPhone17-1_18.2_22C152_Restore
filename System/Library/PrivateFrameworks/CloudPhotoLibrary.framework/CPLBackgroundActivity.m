@interface CPLBackgroundActivity
- (BOOL)shouldDefer;
- (id)addDeferHandler:(id)a3;
- (void)removeDeferHandler:(id)a3;
@end

@implementation CPLBackgroundActivity

- (void)removeDeferHandler:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBackgroundActivity.m"];
  v8 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 23, @"%@ be implemented by subclasses", v8 object file lineNumber description];

  abort();
}

- (id)addDeferHandler:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBackgroundActivity.m"];
  v8 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 19, @"%@ be implemented by subclasses", v8 object file lineNumber description];

  abort();
}

- (BOOL)shouldDefer
{
  return 0;
}

@end