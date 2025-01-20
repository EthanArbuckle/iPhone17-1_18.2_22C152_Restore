@interface _MKConditionalPanGestureRecognizer
- (BOOL)_shouldReceiveEvent:(id)a3;
- (_MKConditionalPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (int64_t)requiredModifierFlags;
- (void)setRequiredModifierFlags:(int64_t)a3;
@end

@implementation _MKConditionalPanGestureRecognizer

- (void)setRequiredModifierFlags:(int64_t)a3
{
  self->_requiredModifierFlags = a3;
}

- (_MKConditionalPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_MKConditionalPanGestureRecognizer;
  return [(_MKConditionalPanGestureRecognizer *)&v5 initWithTarget:a3 action:a4];
}

- (BOOL)_shouldReceiveEvent:(id)a3
{
  id v4 = a3;
  if (![(_MKConditionalPanGestureRecognizer *)self state]
    && (self->_requiredModifierFlags & ~[v4 modifierFlags]) != 0)
  {
    [(_MKConditionalPanGestureRecognizer *)self setState:5];
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_MKConditionalPanGestureRecognizer;
    BOOL v5 = [(_MKConditionalPanGestureRecognizer *)&v7 _shouldReceiveEvent:v4];
  }

  return v5;
}

- (int64_t)requiredModifierFlags
{
  return self->_requiredModifierFlags;
}

@end