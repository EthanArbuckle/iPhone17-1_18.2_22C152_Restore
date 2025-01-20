@interface _MKOneHandedZoomGestureRecognizer
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGPoint)locationOfTapGesture;
- (MKZoomingGestureControlConfiguration)configuration;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (_MKOneHandedZoomGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (_MKZoomingPanGestureRecognizer)panGestureRecognizer;
- (double)scale;
- (double)velocity;
- (void)_clearTapTimer;
- (void)_panGestureRecognizerStateDidChange:(id)a3;
- (void)_startTapTimer:(double)a3;
- (void)_tapGestureRecognizerStateDidChange:(id)a3;
- (void)_tooSlow:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reset;
- (void)setAllowedPressTypes:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation _MKOneHandedZoomGestureRecognizer

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (_MKZoomingPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (_MKOneHandedZoomGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)_MKOneHandedZoomGestureRecognizer;
  v4 = [(_MKOneHandedZoomGestureRecognizer *)&v13 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(_MKOneHandedZoomGestureRecognizer *)v4 setDelaysTouchesEnded:0];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v5 action:sel__tapGestureRecognizerStateDidChange_];
    tapGestureRecognizer = v5->_tapGestureRecognizer;
    v5->_tapGestureRecognizer = (UITapGestureRecognizer *)v6;

    [(UITapGestureRecognizer *)v5->_tapGestureRecognizer setDelegate:v5];
    [(UITapGestureRecognizer *)v5->_tapGestureRecognizer setCancelsTouchesInView:0];
    [(UITapGestureRecognizer *)v5->_tapGestureRecognizer addObserver:v5 forKeyPath:@"state" options:0 context:_MergedGlobals_1];
    v8 = [[_MKZoomingPanGestureRecognizer alloc] initWithTarget:v5 action:sel__panGestureRecognizerStateDidChange_];
    panGestureRecognizer = v5->_panGestureRecognizer;
    v5->_panGestureRecognizer = v8;

    [(_MKZoomingPanGestureRecognizer *)v5->_panGestureRecognizer setMaximumNumberOfTouches:[(_MKZoomingPanGestureRecognizer *)v5->_panGestureRecognizer minimumNumberOfTouches]];
    [(_MKZoomingPanGestureRecognizer *)v5->_panGestureRecognizer setDelegate:v5];
    [(_MKZoomingPanGestureRecognizer *)v5->_panGestureRecognizer addObserver:v5 forKeyPath:@"state" options:0 context:off_1E914ECD0];
    uint64_t v10 = +[_MKZoomingGestureControlConfiguration defaultConfiguration];
    configuration = v5->_configuration;
    v5->_configuration = (MKZoomingGestureControlConfiguration *)v10;

    [(MKZoomingGestureControlConfiguration *)v5->_configuration zoomDraggingResistance];
    -[_MKZoomingPanGestureRecognizer setZoomDraggingResistance:](v5->_panGestureRecognizer, "setZoomDraggingResistance:");
    [(_MKOneHandedZoomGestureRecognizer *)v5 reset];
  }
  return v5;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)_MKOneHandedZoomGestureRecognizer;
  [(_MKOneHandedZoomGestureRecognizer *)&v3 reset];
  [(_MKOneHandedZoomGestureRecognizer *)self _clearTapTimer];
  self->_locationOfTapGesture = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_didReceive1stTap = 0;
  [(_MKZoomingPanGestureRecognizer *)self->_panGestureRecognizer setEnabled:0];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setEnabled:[(_MKOneHandedZoomGestureRecognizer *)self isEnabled]];
}

- (void)_clearTapTimer
{
  if (self->_timerOn) {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__tooSlow_ object:0];
  }
  self->_timerOn = 0;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_MKOneHandedZoomGestureRecognizer;
  -[_MKOneHandedZoomGestureRecognizer setEnabled:](&v5, sel_setEnabled_);
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setEnabled:v3];
}

- (void)dealloc
{
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer removeObserver:self forKeyPath:@"state" context:_MergedGlobals_1];
  [(_MKZoomingPanGestureRecognizer *)self->_panGestureRecognizer removeObserver:self forKeyPath:@"state" context:off_1E914ECD0];
  v3.receiver = self;
  v3.super_class = (Class)_MKOneHandedZoomGestureRecognizer;
  [(_MKOneHandedZoomGestureRecognizer *)&v3 dealloc];
}

- (void)setAllowedPressTypes:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_MKOneHandedZoomGestureRecognizer;
  id v4 = a3;
  [(_MKOneHandedZoomGestureRecognizer *)&v5 setAllowedPressTypes:v4];
  -[_MKZoomingPanGestureRecognizer setAllowedPressTypes:](self->_panGestureRecognizer, "setAllowedPressTypes:", v4, v5.receiver, v5.super_class);
}

- (void)setConfiguration:(id)a3
{
  objc_super v5 = (MKZoomingGestureControlConfiguration *)a3;
  if (self->_configuration != v5)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    [(MKZoomingGestureControlConfiguration *)v5 zoomDraggingResistance];
    -[_MKZoomingPanGestureRecognizer setZoomDraggingResistance:](self->_panGestureRecognizer, "setZoomDraggingResistance:");
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (_MergedGlobals_1 == a6)
  {
    if ([(UITapGestureRecognizer *)self->_tapGestureRecognizer state] == 5) {
      [(_MKOneHandedZoomGestureRecognizer *)self _tapGestureRecognizerStateDidChange:self->_tapGestureRecognizer];
    }
  }
  else if (off_1E914ECD0 == a6)
  {
    if ([(_MKZoomingPanGestureRecognizer *)self->_panGestureRecognizer state] == 5) {
      [(_MKOneHandedZoomGestureRecognizer *)self _panGestureRecognizerStateDidChange:self->_panGestureRecognizer];
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_MKOneHandedZoomGestureRecognizer;
    [(_MKOneHandedZoomGestureRecognizer *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_tapGestureRecognizerStateDidChange:(id)a3
{
  id v4 = a3;
  BOOL didReceive1stTap = self->_didReceive1stTap;
  id v12 = v4;
  uint64_t v6 = [v4 state];
  if (didReceive1stTap)
  {
    if (v6 != 3) {
      goto LABEL_7;
    }
    v7 = self;
    uint64_t v8 = 5;
    goto LABEL_6;
  }
  if ((unint64_t)(v6 - 4) < 2)
  {
    uint64_t v8 = [v12 state];
    v7 = self;
LABEL_6:
    [(_MKOneHandedZoomGestureRecognizer *)v7 setState:v8];
    goto LABEL_7;
  }
  if (v6 == 3)
  {
    self->_BOOL didReceive1stTap = 1;
    v9 = [v12 view];
    [v12 locationInView:v9];
    self->_locationOfTapGesture.x = v10;
    self->_locationOfTapGesture.y = v11;

    [(_MKOneHandedZoomGestureRecognizer *)self _startTapTimer:0.5];
  }
LABEL_7:
}

- (void)_panGestureRecognizerStateDidChange:(id)a3
{
  if (self->_didReceive1stTap)
  {
    uint64_t v4 = [a3 state];
    [(_MKOneHandedZoomGestureRecognizer *)self setState:v4];
  }
}

- (double)scale
{
  [(_MKZoomingPanGestureRecognizer *)self->_panGestureRecognizer scale];
  return result;
}

- (double)velocity
{
  [(_MKZoomingPanGestureRecognizer *)self->_panGestureRecognizer velocity];
  return result;
}

- (CGPoint)locationOfTapGesture
{
  double x = self->_locationOfTapGesture.x;
  double y = self->_locationOfTapGesture.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_MKOneHandedZoomGestureRecognizer;
  [(_MKOneHandedZoomGestureRecognizer *)&v5 touchesBegan:a3 withEvent:a4];
  if (self->_didReceive1stTap && ![(_MKZoomingPanGestureRecognizer *)self->_panGestureRecognizer state])
  {
    if ([(_MKZoomingPanGestureRecognizer *)self->_panGestureRecognizer isEnabled]) {
      [(_MKOneHandedZoomGestureRecognizer *)self _clearTapTimer];
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(_MKOneHandedZoomGestureRecognizer *)self delegate];
  BOOL v7 = !v6
    || (objc_opt_respondsToSelector() & 1) == 0
    || [v6 gestureRecognizer:self shouldReceiveTouch:v5];

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  uint64_t v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  BOOL v8 = 0;
  if (self->_tapGestureRecognizer == v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  if (self->_tapGestureRecognizer == a3 && [a3 state] == 5)
  {
    uint64_t v5 = [(_MKOneHandedZoomGestureRecognizer *)self isEnabled];
    [(_MKOneHandedZoomGestureRecognizer *)self setEnabled:0];
    [(_MKOneHandedZoomGestureRecognizer *)self setEnabled:v5];
  }
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_panGestureRecognizer == a3 && !self->_didReceive1stTap)
  {
    [(_MKOneHandedZoomGestureRecognizer *)self setState:5];
    return 0;
  }
  else
  {
    uint64_t v4 = [(_MKOneHandedZoomGestureRecognizer *)self delegate];
    BOOL v5 = !v4
      || (objc_opt_respondsToSelector() & 1) == 0
      || [v4 gestureRecognizerShouldBegin:self];
  }
  return v5;
}

- (void)_startTapTimer:(double)a3
{
  [(_MKOneHandedZoomGestureRecognizer *)self _clearTapTimer];
  self->_timerOn = 1;
  [(_MKZoomingPanGestureRecognizer *)self->_panGestureRecognizer setEnabled:1];

  [(_MKOneHandedZoomGestureRecognizer *)self performSelector:sel__tooSlow_ withObject:0 afterDelay:a3];
}

- (void)_tooSlow:(id)a3
{
  [(_MKOneHandedZoomGestureRecognizer *)self _clearTapTimer];
  [(_MKZoomingPanGestureRecognizer *)self->_panGestureRecognizer setEnabled:0];

  [(_MKOneHandedZoomGestureRecognizer *)self setState:5];
}

- (MKZoomingGestureControlConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);

  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

@end