@interface FBSceneEventQueue
- (FBSceneEventQueueDelegate)delegate;
- (void)_noteQueueDidDrain;
- (void)_noteQueueDidUnlock;
- (void)setDelegate:(id)a3;
@end

@implementation FBSceneEventQueue

- (void)_noteQueueDidDrain
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained eventQueueDidDrain:self];
}

- (void)_noteQueueDidUnlock
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained eventQueueDidUnlock:self];
}

- (FBSceneEventQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBSceneEventQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end