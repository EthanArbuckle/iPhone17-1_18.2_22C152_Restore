@interface AVDefaultBehaviorContext
- (AVDefaultBehaviorContext)initWithAVKitOwner:(id)a3;
- (AVPlayerViewController)playerViewController;
@end

@implementation AVDefaultBehaviorContext

- (void).cxx_destruct
{
}

- (AVPlayerViewController)playerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewController);

  return (AVPlayerViewController *)WeakRetained;
}

- (AVDefaultBehaviorContext)initWithAVKitOwner:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVDefaultBehaviorContext;
  v5 = [(AVDefaultBehaviorContext *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_playerViewController, v4);
  }

  return v6;
}

@end