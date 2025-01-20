@interface DDParsecAction
+ (BOOL)isAvailable;
- (id)createViewController;
- (id)localizedName;
- (int)interactionType;
- (void)interactionDidFinishAndRequiresDismissal:(BOOL)a3;
@end

@implementation DDParsecAction

+ (BOOL)isAvailable
{
  return +[DDRemoteActionViewController controllerIsAvailable];
}

- (id)localizedName
{
  return DDLocalizedString(@"Look Up");
}

- (int)interactionType
{
  return 1;
}

- (id)createViewController
{
  if (self->super.super._result)
  {
    v3 = [[DDParsecCollectionViewController alloc] initWithResult:self->super.super._result context:self->super.super._context];
    parsecViewController = self->_parsecViewController;
    self->_parsecViewController = v3;

    [(DDParsecCollectionViewController *)self->_parsecViewController setParsecDelegate:self];
    [(DDParsecCollectionViewController *)self->_parsecViewController setPreviewMode:self->_previewMode];
    v5 = self->_parsecViewController;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)interactionDidFinishAndRequiresDismissal:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(DDAction *)self delegate];
  [v5 actionDidFinish:self shouldDismiss:v3];
}

- (void).cxx_destruct
{
}

@end