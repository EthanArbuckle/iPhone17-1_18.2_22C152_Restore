@interface CLKGaugeSegment
- (CLKGaugeSegment)initWithColor:(id)a3 state:(int64_t)a4;
- (UIColor)color;
- (int64_t)state;
- (void)setState:(int64_t)a3;
@end

@implementation CLKGaugeSegment

- (CLKGaugeSegment)initWithColor:(id)a3 state:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKGaugeSegment;
  v8 = [(CLKGaugeSegment *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_color, a3);
    v9->_state = a4;
  }

  return v9;
}

- (UIColor)color
{
  return self->_color;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
}

@end