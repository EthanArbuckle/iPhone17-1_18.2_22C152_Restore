@interface FBSScene
- (UIWindowScene)windowScene;
- (int)_uvPreviewShellHostProcessPid;
@end

@implementation FBSScene

- (int)_uvPreviewShellHostProcessPid
{
  v2 = [(FBSScene *)self hostHandle];
  v3 = [v2 auditToken];
  int v4 = [v3 pid];

  return v4;
}

- (UIWindowScene)windowScene
{
  return (UIWindowScene *)+[UIWindowScene _sceneForFBSScene:self];
}

@end