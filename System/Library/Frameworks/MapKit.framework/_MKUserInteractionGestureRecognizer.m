@interface _MKUserInteractionGestureRecognizer
- (_MKUserInteractionGestureRecognizerTouchObserver)touchObserver;
- (void)setTouchObserver:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation _MKUserInteractionGestureRecognizer

- (void)setTouchObserver:(id)a3
{
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  uint64_t v5 = [(NSMutableSet *)self->_activeTouches count];
  activeTouches = self->_activeTouches;
  if (!activeTouches)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v8 = self->_activeTouches;
    self->_activeTouches = v7;

    activeTouches = self->_activeTouches;
  }
  [(NSMutableSet *)activeTouches unionSet:v12];
  uint64_t v9 = [(NSMutableSet *)self->_activeTouches count];
  if (v5) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  if (!v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_touchObserver);
    [WeakRetained gestureRecognizerTouchesBegan:self];

    [(_MKUserInteractionGestureRecognizer *)self setState:1];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v9 = a3;
  uint64_t v5 = [(NSMutableSet *)self->_activeTouches count];
  [(NSMutableSet *)self->_activeTouches minusSet:v9];
  uint64_t v6 = [(NSMutableSet *)self->_activeTouches count];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_touchObserver);
    [WeakRetained gestureRecognizerTouchesEnded:self];

    [(_MKUserInteractionGestureRecognizer *)self setState:3];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v9 = a3;
  uint64_t v5 = [(NSMutableSet *)self->_activeTouches count];
  [(NSMutableSet *)self->_activeTouches minusSet:v9];
  uint64_t v6 = [(NSMutableSet *)self->_activeTouches count];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_touchObserver);
    [WeakRetained gestureRecognizerTouchesCanceled:self];

    [(_MKUserInteractionGestureRecognizer *)self setState:4];
  }
}

- (_MKUserInteractionGestureRecognizerTouchObserver)touchObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchObserver);

  return (_MKUserInteractionGestureRecognizerTouchObserver *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_touchObserver);

  objc_storeStrong((id *)&self->_activeTouches, 0);
}

@end