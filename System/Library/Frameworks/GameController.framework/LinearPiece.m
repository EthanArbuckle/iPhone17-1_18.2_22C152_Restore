@interface LinearPiece
+ (id)pieceWithValue:(float)a3 delta:(float)a4;
- (LinearPiece)init;
- (float)delta;
- (float)value;
- (void)setDelta:(float)a3;
- (void)setValue:(float)a3;
@end

@implementation LinearPiece

- (LinearPiece)init
{
  v5.receiver = self;
  v5.super_class = (Class)LinearPiece;
  v2 = [(LinearPiece *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(LinearPiece *)v2 setValue:0.0];
    [(LinearPiece *)v3 setDelta:0.0];
  }
  return v3;
}

+ (id)pieceWithValue:(float)a3 delta:(float)a4
{
  v6 = objc_opt_new();
  *(float *)&double v7 = a3;
  [v6 setValue:v7];
  *(float *)&double v8 = a4;
  [v6 setDelta:v8];

  return v6;
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)a3
{
  self->_value = a3;
}

- (float)delta
{
  return self->_delta;
}

- (void)setDelta:(float)a3
{
  self->_delta = a3;
}

@end