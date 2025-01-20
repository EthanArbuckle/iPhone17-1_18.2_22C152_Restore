@interface BEScrollViewScrollUpdate
- (CGPoint)locationInView:(id)a3;
- (CGPoint)translationInView:(id)a3;
- (double)timestamp;
- (int64_t)phase;
- (uint64_t)_scrollEvent;
- (void)initWithScrollEvent:(uint64_t)a3 phase:;
@end

@implementation BEScrollViewScrollUpdate

- (void)initWithScrollEvent:(uint64_t)a3 phase:
{
  id v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)BEScrollViewScrollUpdate;
    id v7 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 2, a2);
      a1[1] = a3;
    }
  }

  return a1;
}

- (double)timestamp
{
  if (self) {
    self = (BEScrollViewScrollUpdate *)self->__scrollEvent;
  }
  [(BEScrollViewScrollUpdate *)self timestamp];
  return result;
}

- (uint64_t)_scrollEvent
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (CGPoint)locationInView:(id)a3
{
  if (self) {
    self = (BEScrollViewScrollUpdate *)self->__scrollEvent;
  }
  [(BEScrollViewScrollUpdate *)self locationInView:a3];
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  if (self) {
    self = (BEScrollViewScrollUpdate *)self->__scrollEvent;
  }
  [(BEScrollViewScrollUpdate *)self _adjustedAcceleratedDeltaInView:a3];
  result.y = v4;
  result.x = v3;
  return result;
}

- (int64_t)phase
{
  return self->_phase;
}

- (void).cxx_destruct
{
}

@end