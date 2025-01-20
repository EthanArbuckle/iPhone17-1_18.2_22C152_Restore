@interface AVAppStoreBehaviorContext
- (AVAppStoreBehavior)behavior;
- (AVAppStoreBehaviorContext)initWithAVKitOwner:(id)a3;
- (AVPlayerViewController)playerViewController;
- (void)_toggleControlsGenerationIfPossible;
- (void)setBehavior:(id)a3;
@end

@implementation AVAppStoreBehaviorContext

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_behavior);

  objc_destroyWeak((id *)&self->_playerViewController);
}

- (void)setBehavior:(id)a3
{
}

- (AVAppStoreBehavior)behavior
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behavior);

  return (AVAppStoreBehavior *)WeakRetained;
}

- (AVPlayerViewController)playerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewController);

  return (AVPlayerViewController *)WeakRetained;
}

- (void)_toggleControlsGenerationIfPossible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behavior);
  int v4 = [WeakRetained prefersFirstGenerationControlsWhenEmbeddedInline];

  if (v4)
  {
    p_playerViewController = &self->_playerViewController;
    id v6 = objc_loadWeakRetained((id *)p_playerViewController);
    BOOL v7 = [v6 controlsGeneration] == 0;

    id v8 = objc_loadWeakRetained((id *)p_playerViewController);
    [v8 setControlsGeneration:v7];
  }
}

- (AVAppStoreBehaviorContext)initWithAVKitOwner:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVAppStoreBehaviorContext;
  v5 = [(AVAppStoreBehaviorContext *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_playerViewController, v4);
  }

  return v6;
}

@end