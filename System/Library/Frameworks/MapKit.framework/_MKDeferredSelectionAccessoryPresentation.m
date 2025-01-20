@interface _MKDeferredSelectionAccessoryPresentation
- (BOOL)animated;
- (BOOL)ready;
- (_MKDeferredSelectionAccessoryPresentation)initWithReason:(unint64_t)a3 animated:(BOOL)a4;
- (unint64_t)reason;
- (void)setAnimated:(BOOL)a3;
- (void)setReady:(BOOL)a3;
- (void)setReason:(unint64_t)a3;
@end

@implementation _MKDeferredSelectionAccessoryPresentation

- (_MKDeferredSelectionAccessoryPresentation)initWithReason:(unint64_t)a3 animated:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_MKDeferredSelectionAccessoryPresentation;
  result = [(_MKDeferredSelectionAccessoryPresentation *)&v7 init];
  if (result)
  {
    result->_reason = a3;
    result->_animated = a4;
  }
  return result;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (BOOL)ready
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

@end