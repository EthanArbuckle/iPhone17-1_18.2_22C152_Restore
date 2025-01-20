@interface DDRemoteAction
+ (id)viewControllerProviderClass;
- (id)createViewController;
- (id)previewActions;
- (void)setPreviewMode:(BOOL)a3;
@end

@implementation DDRemoteAction

- (id)createViewController
{
  v3 = [(id)objc_opt_class() viewControllerProviderClass];

  if (v3) {
    v4 = [[DDRemoteActionManagerViewController alloc] initWithAction:self];
  }
  else {
    v4 = 0;
  }
  return v4;
}

- (void)setPreviewMode:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DDRemoteAction;
  -[DDPreviewAction setPreviewMode:](&v6, sel_setPreviewMode_);
  v5 = [(DDPreviewAction *)self viewController];
  [v5 setPreviewMode:v3];
}

+ (id)viewControllerProviderClass
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"DDRemoteAction.m" lineNumber:68 description:@"This method should never be called in the class DDRemoteAction. This method should be overriden."];

  return 0;
}

- (id)previewActions
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"DDRemoteAction.m" lineNumber:73 description:@"This method should never be called in the class DDRemoteAction. This method should be overriden."];

  return 0;
}

@end