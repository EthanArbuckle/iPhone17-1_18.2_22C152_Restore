@interface PKRulerGestureRecognizer
- (CGAffineTransform)freeTransform;
- (CGAffineTransform)rulerTransform;
- (CGAffineTransform)unscaledFreeTransform;
- (PKRulerGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)startDelay;
- (double)startSnapThreshold;
- (void)reset;
- (void)resetAndAccumulateTransform;
- (void)setStartDelay:(double)a3;
- (void)setStartSnapThreshold:(double)a3;
- (void)start;
- (void)stopTimer;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation PKRulerGestureRecognizer

- (PKRulerGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKRulerGestureRecognizer;
  v4 = [(PKFreeTransformGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(PKFreeTransformGestureRecognizer *)v4 setStartThreshold:1.79769313e308];
    [(PKRulerGestureRecognizer *)v5 setAllowedTouchTypes:&unk_1F200F078];
  }
  return v5;
}

- (CGAffineTransform)freeTransform
{
  if (LOBYTE(self[9].a))
  {
    uint64_t v3 = MEMORY[0x1E4F1DAB8];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v4;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PKRulerGestureRecognizer;
    return (CGAffineTransform *)[(CGAffineTransform *)&v5 freeTransform];
  }
  return self;
}

- (CGAffineTransform)unscaledFreeTransform
{
  if (LOBYTE(self[9].a))
  {
    uint64_t v3 = MEMORY[0x1E4F1DAB8];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v4;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PKRulerGestureRecognizer;
    return (CGAffineTransform *)[(CGAffineTransform *)&v5 unscaledFreeTransform];
  }
  return self;
}

- (CGAffineTransform)rulerTransform
{
  objc_super v5 = [(PKFreeTransformGestureRecognizer *)self touches];
  uint64_t v6 = [v5 count];

  if (v6 == 2)
  {
    v8 = [(PKFreeTransformGestureRecognizer *)self touches];
    v9 = [v8 objectAtIndexedSubscript:0];
    v10 = [(PKRulerGestureRecognizer *)self view];
    v11 = [v10 superview];
    [v9 locationInView:v11];
    double v13 = v12;
    double v15 = v14;

    v16 = [(PKFreeTransformGestureRecognizer *)self touches];
    v17 = [v16 objectAtIndexedSubscript:1];
    v18 = [(PKRulerGestureRecognizer *)self view];
    v19 = [v18 superview];
    [v17 locationInView:v19];
    double v21 = v20;
    double v23 = v22;

    long double v24 = atan2(v15 - v23, v13 - v21);
    *(_OWORD *)&retstr->a = 0u;
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    CGAffineTransformMakeRotation(&t1, v24);
    CGAffineTransformMakeTranslation(&v27, (v13 + v21) * 0.5, (v15 + v23) * 0.5);
    return CGAffineTransformConcat(retstr, &t1, &v27);
  }
  else
  {
    uint64_t v25 = MEMORY[0x1E4F1DAB8];
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v26;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v25 + 32);
  }
  return result;
}

- (void)resetAndAccumulateTransform
{
  uint64_t v3 = objc_opt_class();
  long long v4 = [(PKRulerGestureRecognizer *)self delegate];
  objc_super v5 = PKDynamicCast(v3, v4);

  if (v5)
  {
    -[PKRulerController resetRulerTransform]((uint64_t)v5);
    [(PKFreeTransformGestureRecognizer *)self resetStartingTouches];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PKRulerGestureRecognizer;
    [(PKFreeTransformGestureRecognizer *)&v6 resetAndAccumulateTransform];
  }
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)PKRulerGestureRecognizer;
  [(PKFreeTransformGestureRecognizer *)&v3 reset];
  [(PKRulerGestureRecognizer *)self stopTimer];
  self->_initialSnap = 1;
}

- (void)start
{
  [(PKRulerGestureRecognizer *)self stopTimer];
  if ([(PKRulerGestureRecognizer *)self state] != 1)
  {
    [(PKRulerGestureRecognizer *)self setState:1];
  }
}

- (void)stopTimer
{
  [(NSTimer *)self->_startTimer invalidate];
  startTimer = self->_startTimer;
  self->_startTimer = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PKRulerGestureRecognizer;
  [(PKFreeTransformGestureRecognizer *)&v11 touchesBegan:a3 withEvent:a4 rejectExcessTouches:0];
  objc_super v5 = [(PKFreeTransformGestureRecognizer *)self touches];
  uint64_t v6 = [v5 count];

  if (v6 == 2)
  {
    [(PKRulerGestureRecognizer *)self startDelay];
    if (v7 <= 0.0)
    {
      [(PKRulerGestureRecognizer *)self start];
    }
    else if (!self->_startTimer)
    {
      v8 = (void *)MEMORY[0x1E4F1CB00];
      [(PKRulerGestureRecognizer *)self startDelay];
      objc_msgSend(v8, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_start, 0, 0);
      v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      startTimer = self->_startTimer;
      self->_startTimer = v9;
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKRulerGestureRecognizer;
  [(PKFreeTransformGestureRecognizer *)&v5 touchesMoved:a3 withEvent:a4];
  if (self->_initialSnap)
  {
    [(PKRulerGestureRecognizer *)self startSnapThreshold];
    if (-[PKFreeTransformGestureRecognizer touchesMovedPastThreshold:](self, "touchesMovedPastThreshold:"))
    {
      self->_initialSnap = 0;
      [(PKFreeTransformGestureRecognizer *)self resetStartingTouches];
    }
  }
  if ([(PKRulerGestureRecognizer *)self state]) {
    [(PKRulerGestureRecognizer *)self stopTimer];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKRulerGestureRecognizer;
  [(PKFreeTransformGestureRecognizer *)&v5 touchesEnded:a3 withEvent:a4];
  [(PKRulerGestureRecognizer *)self stopTimer];
}

- (double)startDelay
{
  return self->_startDelay;
}

- (void)setStartDelay:(double)a3
{
  self->_startDelay = a3;
}

- (double)startSnapThreshold
{
  return self->_startSnapThreshold;
}

- (void)setStartSnapThreshold:(double)a3
{
  self->_startSnapThreshold = a3;
}

- (void).cxx_destruct
{
}

@end