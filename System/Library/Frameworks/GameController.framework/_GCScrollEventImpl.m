@interface _GCScrollEventImpl
- (_GCScrollEventImpl)initWithScrollEvent:(id)a3;
- (float)x;
- (float)y;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)timestamp;
- (void)setTimestamp:(unint64_t)a3;
- (void)setX:(float)a3;
- (void)setY:(float)a3;
@end

@implementation _GCScrollEventImpl

- (_GCScrollEventImpl)initWithScrollEvent:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCScrollEventImpl;
  v5 = [(_GCScrollEventImpl *)&v9 init];
  if (v5)
  {
    v5->timestamp = [v4 timestamp];
    [v4 x];
    v5->x = v6;
    [v4 y];
    v5->y = v7;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  [v4 setTimestamp:self->timestamp];
  *(float *)&double v5 = self->x;
  [v4 setX:v5];
  *(float *)&double v6 = self->y;
  [v4 setY:v6];
  return v4;
}

- (unint64_t)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->timestamp = a3;
}

- (float)x
{
  return self->x;
}

- (void)setX:(float)a3
{
  self->x = a3;
}

- (float)y
{
  return self->y;
}

- (void)setY:(float)a3
{
  self->y = a3;
}

@end