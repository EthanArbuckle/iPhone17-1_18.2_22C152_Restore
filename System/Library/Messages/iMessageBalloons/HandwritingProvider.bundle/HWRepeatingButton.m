@interface HWRepeatingButton
- (HWRepeatingButton)initWithCoder:(id)a3;
- (HWRepeatingButton)initWithFrame:(CGRect)a3;
- (SEL)repeatingAction;
- (unint64_t)repeatCount;
- (void)_commonInit;
- (void)_sendRepeatEvent:(id)a3;
- (void)_touchDown:(id)a3;
- (void)_touchUp:(id)a3;
- (void)setRepeatCount:(unint64_t)a3;
- (void)setRepeatingAction:(SEL)a3;
@end

@implementation HWRepeatingButton

- (HWRepeatingButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HWRepeatingButton;
  v3 = -[HWRepeatingButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(HWRepeatingButton *)v3 _commonInit];
  }
  return v4;
}

- (HWRepeatingButton)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HWRepeatingButton;
  v3 = [(HWRepeatingButton *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(HWRepeatingButton *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(HWRepeatingButton *)self setRepeatCount:0];
  [(HWRepeatingButton *)self addTarget:self action:"_touchDown:" forControlEvents:1];

  [(HWRepeatingButton *)self addTarget:self action:"_touchUp:" forControlEvents:192];
}

- (void)_touchDown:(id)a3
{
  [(HWRepeatingButton *)self setRepeatCount:0];

  [(HWRepeatingButton *)self performSelector:"_sendRepeatEvent:" withObject:self afterDelay:0.5];
}

- (void)_touchUp:(id)a3
{
}

- (void)_sendRepeatEvent:(id)a3
{
  if ([(HWRepeatingButton *)self repeatingAction]
    && [(HWRepeatingButton *)self isEnabled]
    && [(HWRepeatingButton *)self isTracking])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v4 = [(HWRepeatingButton *)self allTargets];
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v8);
          [(HWRepeatingButton *)self repeatingAction];
          if (objc_opt_respondsToSelector())
          {
            [(HWRepeatingButton *)self sendAction:[(HWRepeatingButton *)self repeatingAction] to:v9 forEvent:0];
            if ([(HWRepeatingButton *)self repeatCount] >= 0x15) {
              [(HWRepeatingButton *)self sendAction:[(HWRepeatingButton *)self repeatingAction] to:v9 forEvent:0];
            }
          }
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    [(HWRepeatingButton *)self performSelector:"_sendRepeatEvent:" withObject:self afterDelay:0.1];
    [(HWRepeatingButton *)self setRepeatCount:(char *)[(HWRepeatingButton *)self repeatCount] + 1];
  }
}

- (SEL)repeatingAction
{
  if (self->_repeatingAction) {
    return self->_repeatingAction;
  }
  else {
    return 0;
  }
}

- (void)setRepeatingAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_repeatingAction = v3;
}

- (unint64_t)repeatCount
{
  return self->_repeatCount;
}

- (void)setRepeatCount:(unint64_t)a3
{
  self->_repeatCount = a3;
}

@end