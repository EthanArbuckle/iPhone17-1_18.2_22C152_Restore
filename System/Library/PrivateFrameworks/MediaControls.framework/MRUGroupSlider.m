@interface MRUGroupSlider
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isLongPressEnabled;
- (BOOL)longPressFeedbackEnabled;
- (MRUGroupSlider)initWithFrame:(CGRect)a3;
- (MRULongPressGestureRecognizer)longPressFeedbackGestureRecognizer;
- (MRULongPressGestureRecognizer)longPressGestureRecognizer;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)handleLongPressCancelled;
- (void)setFeedbackGenerator:(id)a3;
- (void)setLongPressEnabled:(BOOL)a3;
- (void)setLongPressFeedbackEnabled:(BOOL)a3;
- (void)setLongPressFeedbackGestureRecognizer:(id)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)sliderLongPress:(id)a3;
- (void)sliderLongPressFeedback:(id)a3;
@end

@implementation MRUGroupSlider

- (MRUGroupSlider)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)MRUGroupSlider;
  v3 = -[MRUGroupSlider initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __32__MRUGroupSlider_initWithFrame___block_invoke;
    v16 = &unk_1E5F0D820;
    objc_copyWeak(&v17, &location);
    v4 = _Block_copy(&v13);
    v5 = [MRULongPressGestureRecognizer alloc];
    uint64_t v6 = -[MRULongPressGestureRecognizer initWithTarget:action:](v5, "initWithTarget:action:", v3, sel_sliderLongPress_, v13, v14, v15, v16);
    longPressGestureRecognizer = v3->_longPressGestureRecognizer;
    v3->_longPressGestureRecognizer = (MRULongPressGestureRecognizer *)v6;

    [(MRULongPressGestureRecognizer *)v3->_longPressGestureRecognizer setMinimumPressDuration:1.5];
    [(MRULongPressGestureRecognizer *)v3->_longPressGestureRecognizer setDelegate:v3];
    [(MRULongPressGestureRecognizer *)v3->_longPressGestureRecognizer addCancellationHandler:v4];
    [(MRUGroupSlider *)v3 addGestureRecognizer:v3->_longPressGestureRecognizer];
    v8 = [[MRULongPressGestureRecognizer alloc] initWithTarget:v3 action:sel_sliderLongPressFeedback_];
    longPressFeedbackGestureRecognizer = v3->_longPressFeedbackGestureRecognizer;
    v3->_longPressFeedbackGestureRecognizer = v8;

    [(MRULongPressGestureRecognizer *)v3->_longPressFeedbackGestureRecognizer setMinimumPressDuration:0.75];
    [(MRULongPressGestureRecognizer *)v3->_longPressFeedbackGestureRecognizer setDelegate:v3];
    [(MRULongPressGestureRecognizer *)v3->_longPressFeedbackGestureRecognizer setCancelsTouchesInView:0];
    [(MRULongPressGestureRecognizer *)v3->_longPressFeedbackGestureRecognizer addCancellationHandler:v4];
    [(MRUGroupSlider *)v3 addGestureRecognizer:v3->_longPressFeedbackGestureRecognizer];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:0];
    feedbackGenerator = v3->_feedbackGenerator;
    v3->_feedbackGenerator = (UIImpactFeedbackGenerator *)v10;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __32__MRUGroupSlider_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleLongPressCancelled];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  v4 = (MRULongPressGestureRecognizer *)a3;
  if ([(MRUGroupSlider *)self isTracking])
  {
    self->_longPressEnabled = 0;
    v5 = [(MRUSlider *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      v7 = [(MRUSlider *)self delegate];
      self->_longPressEnabled = [v7 sliderShouldAllowLongPress:self];
    }
    BOOL v8 = self->_longPressEnabled
      && (self->_longPressGestureRecognizer == v4 || self->_longPressFeedbackGestureRecognizer == v4);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MRUGroupSlider;
    BOOL v8 = [(MRUGroupSlider *)&v10 gestureRecognizerShouldBegin:v4];
  }

  return v8;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MRUGroupSlider *)self isEnabled]) {
    [(UIImpactFeedbackGenerator *)self->_feedbackGenerator prepare];
  }
  v10.receiver = self;
  v10.super_class = (Class)MRUGroupSlider;
  BOOL v8 = [(MRUGroupSlider *)&v10 beginTrackingWithTouch:v6 withEvent:v7];

  return v8;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MRUGroupSlider;
  [(MRUGroupSlider *)&v5 endTrackingWithTouch:a3 withEvent:a4];
  if (self->_longPressFeedbackEnabled) {
    [(MRUGroupSlider *)self handleLongPressCancelled];
  }
}

- (void)sliderLongPress:(id)a3
{
  id v4 = a3;
  if (self->_longPressEnabled)
  {
    id v9 = v4;
    BOOL v5 = [v4 state] == 1;
    id v4 = v9;
    if (v5)
    {
      [(UIImpactFeedbackGenerator *)self->_feedbackGenerator impactOccurred];
      self->_longPressFeedbackEnabled = 0;
      id v6 = [(MRUSlider *)self delegate];
      char v7 = objc_opt_respondsToSelector();

      id v4 = v9;
      if (v7)
      {
        BOOL v8 = [(MRUSlider *)self delegate];
        [v8 sliderLongPressActionDidFinish:self];

        id v4 = v9;
      }
    }
  }
}

- (void)sliderLongPressFeedback:(id)a3
{
  id v4 = a3;
  if (self->_longPressEnabled)
  {
    id v9 = v4;
    BOOL v5 = [v4 state] == 1;
    id v4 = v9;
    if (v5)
    {
      self->_longPressFeedbackEnabled = 1;
      id v6 = [(MRUSlider *)self delegate];
      char v7 = objc_opt_respondsToSelector();

      id v4 = v9;
      if (v7)
      {
        BOOL v8 = [(MRUSlider *)self delegate];
        [v8 sliderLongPressActionDidBegin:self];

        id v4 = v9;
      }
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)handleLongPressCancelled
{
  self->_longPressFeedbackEnabled = 0;
  v3 = [(MRUSlider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MRUSlider *)self delegate];
    [v5 sliderLongPressActionDidCancel:self];
  }
}

- (MRULongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (MRULongPressGestureRecognizer)longPressFeedbackGestureRecognizer
{
  return self->_longPressFeedbackGestureRecognizer;
}

- (void)setLongPressFeedbackGestureRecognizer:(id)a3
{
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (BOOL)longPressFeedbackEnabled
{
  return self->_longPressFeedbackEnabled;
}

- (void)setLongPressFeedbackEnabled:(BOOL)a3
{
  self->_longPressFeedbackEnabled = a3;
}

- (BOOL)isLongPressEnabled
{
  return self->_longPressEnabled;
}

- (void)setLongPressEnabled:(BOOL)a3
{
  self->_longPressEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_longPressFeedbackGestureRecognizer, 0);

  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
}

@end