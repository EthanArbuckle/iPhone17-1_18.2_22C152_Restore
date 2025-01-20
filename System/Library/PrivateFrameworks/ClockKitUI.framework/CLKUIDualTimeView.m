@interface CLKUIDualTimeView
- (CLKUIDualTimeView)initWithDevice:(id)a3 clockTimer:(id)a4;
- (void)layoutSubviews;
- (void)setAodTransform:(CGAffineTransform *)a3;
- (void)setConfiguration:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTimeColor:(id)a3;
@end

@implementation CLKUIDualTimeView

- (CLKUIDualTimeView)initWithDevice:(id)a3 clockTimer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLKUIDualTimeView;
  v8 = [(CLKUITimeView *)&v14 initWithDevice:v6 clockTimer:v7];
  if (v8)
  {
    v9 = [[CLKUIAnalogTimeView alloc] initWithDevice:v6 clockTimer:v7];
    analogTimeView = v8->_analogTimeView;
    v8->_analogTimeView = v9;

    [(CLKUIDualTimeView *)v8 addSubview:v8->_analogTimeView];
    v11 = [[CLKUIDigitalClockView alloc] initWithDevice:v6 clockTimer:v7];
    digitalTimeView = v8->_digitalTimeView;
    v8->_digitalTimeView = v11;

    [(CLKUIDualTimeView *)v8 addSubview:v8->_digitalTimeView];
  }

  return v8;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CLKUIDualTimeView;
  [(CLKUIDualTimeView *)&v3 layoutSubviews];
  [(CLKUIDualTimeView *)self bounds];
  -[CLKUIAnalogTimeView setFrame:](self->_analogTimeView, "setFrame:");
  [(CLKUIDualTimeView *)self bounds];
  -[CLKUIDigitalClockView setFrame:](self->_digitalTimeView, "setFrame:");
  [(CLKUITimeView *)self dialInset];
  -[CLKUITimeView setDialInset:](self->_analogTimeView, "setDialInset:");
  [(CLKUITimeView *)self dialInset];
  -[CLKUITimeView setDialInset:](self->_digitalTimeView, "setDialInset:");
}

- (void)setConfiguration:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CLKUIDualTimeView;
  id v4 = a3;
  [(CLKUITimeView *)&v11 setConfiguration:v4];
  v5 = objc_msgSend(v4, "analogConfiguration", v11.receiver, v11.super_class);
  [(CLKUIAnalogTimeView *)self->_analogTimeView setConfiguration:v5];

  id v6 = [v4 digitalConfiguration];
  [(CLKUIDigitalClockView *)self->_digitalTimeView setConfiguration:v6];

  uint64_t v7 = [v4 timeStyle];
  BOOL v8 = v7 == 0;
  BOOL v9 = v7 == 0;
  uint64_t v10 = !v8;
  [(CLKUIAnalogTimeView *)self->_analogTimeView setHidden:v10];
  [(CLKUIDigitalClockView *)self->_digitalTimeView setHidden:v9];
  [(CLKUIAnalogTimeView *)self->_analogTimeView setState:v10];
  [(CLKUIDigitalClockView *)self->_digitalTimeView setState:v9];
}

- (void)setState:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLKUIDualTimeView;
  -[CLKUITimeView setState:](&v7, sel_setState_);
  if (a3 == 1)
  {
    [(CLKUIAnalogTimeView *)self->_analogTimeView setState:1];
  }
  else
  {
    if (a3) {
      return;
    }
    int v5 = [(CLKUIAnalogTimeView *)self->_analogTimeView isHidden];
    analogTimeView = self->_analogTimeView;
    if (v5)
    {
      [(CLKUIAnalogTimeView *)analogTimeView setState:1];
      a3 = 0;
    }
    else
    {
      [(CLKUIAnalogTimeView *)analogTimeView setState:0];
      a3 = 1;
    }
  }
  [(CLKUIDigitalClockView *)self->_digitalTimeView setState:a3];
}

- (void)setOverrideDate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKUIDualTimeView;
  id v4 = a3;
  [(CLKUITimeView *)&v5 setOverrideDate:v4];
  -[CLKUIAnalogTimeView setOverrideDate:](self->_analogTimeView, "setOverrideDate:", v4, v5.receiver, v5.super_class);
  [(CLKUIDigitalClockView *)self->_digitalTimeView setOverrideDate:v4];
}

- (void)setTimeColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKUIDualTimeView;
  id v4 = a3;
  [(CLKUITimeView *)&v5 setTimeColor:v4];
  -[CLKUITimeView setTimeColor:](self->_analogTimeView, "setTimeColor:", v4, v5.receiver, v5.super_class);
  [(CLKUITimeView *)self->_digitalTimeView setTimeColor:v4];
}

- (void)setAodTransform:(CGAffineTransform *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLKUIDualTimeView;
  long long v5 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v5;
  v8[2] = *(_OWORD *)&a3->tx;
  [(CLKUITimeView *)&v9 setAodTransform:v8];
  long long v6 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->tx;
  [(CLKUIDualTimeView *)self setTransform:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digitalTimeView, 0);
  objc_storeStrong((id *)&self->_analogTimeView, 0);
}

@end