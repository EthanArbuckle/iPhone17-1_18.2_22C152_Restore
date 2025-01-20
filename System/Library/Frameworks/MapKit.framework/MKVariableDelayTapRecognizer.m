@interface MKVariableDelayTapRecognizer
- (MKVariableDelayTapRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (MKVariableDelayTapRecognizerDelegate)tapDelayDelegate;
- (void)reset;
- (void)setTapDelayDelegate:(id)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation MKVariableDelayTapRecognizer

- (void)setTapDelayDelegate:(id)a3
{
}

- (MKVariableDelayTapRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MKVariableDelayTapRecognizer;
  v4 = [(MKVariableDelayTapRecognizer *)&v8 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v4->originalMaximumIntervalBetweenSuccessiveTaps = -1.0;
    v6 = v4;
  }

  return v5;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(MKVariableDelayTapRecognizer *)self state])
  {
    objc_super v8 = [(MKVariableDelayTapRecognizer *)self tapDelayDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      if (self->originalMaximumIntervalBetweenSuccessiveTaps <= 0.0)
      {
        [(MKVariableDelayTapRecognizer *)self maximumIntervalBetweenSuccessiveTaps];
        self->double originalMaximumIntervalBetweenSuccessiveTaps = v10;
      }
      v11 = [(MKVariableDelayTapRecognizer *)self tapDelayDelegate];
      double originalMaximumIntervalBetweenSuccessiveTaps = self->originalMaximumIntervalBetweenSuccessiveTaps;
      v13 = [v6 anyObject];
      [v11 variableDelayTapRecognizer:self shouldWaitForNextTapForDuration:v13 afterTouch:originalMaximumIntervalBetweenSuccessiveTaps];
      -[MKVariableDelayTapRecognizer setMaximumIntervalBetweenSuccessiveTaps:](self, "setMaximumIntervalBetweenSuccessiveTaps:");
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)MKVariableDelayTapRecognizer;
  [(MKVariableDelayTapRecognizer *)&v14 touchesEnded:v6 withEvent:v7];
}

- (void)reset
{
  if (self->originalMaximumIntervalBetweenSuccessiveTaps > 0.0)
  {
    -[MKVariableDelayTapRecognizer setMaximumIntervalBetweenSuccessiveTaps:](self, "setMaximumIntervalBetweenSuccessiveTaps:");
    self->double originalMaximumIntervalBetweenSuccessiveTaps = -1.0;
  }
  v3.receiver = self;
  v3.super_class = (Class)MKVariableDelayTapRecognizer;
  [(MKVariableDelayTapRecognizer *)&v3 reset];
}

- (MKVariableDelayTapRecognizerDelegate)tapDelayDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->tapDelayDelegate);

  return (MKVariableDelayTapRecognizerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end