@interface WKDeferringGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)immediatelyFailsAfterTouchEnd;
- (BOOL)shouldDeferGestureRecognizer:(id)a3;
- (WKDeferringGestureRecognizer)initWithDeferringGestureDelegate:(id)a3;
- (id).cxx_construct;
- (void)endDeferral:(BOOL)a3;
- (void)setImmediatelyFailsAfterTouchEnd:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation WKDeferringGestureRecognizer

- (id).cxx_construct
{
  *((void *)self + 34) = 0;
  return self;
}

- (WKDeferringGestureRecognizer)initWithDeferringGestureDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WKDeferringGestureRecognizer;
  v4 = [(WKDeferringGestureRecognizer *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeWeak(&v4->_deferringGestureDelegate.m_weakReference, a3);
  }
  return v5;
}

- (void)setImmediatelyFailsAfterTouchEnd:(BOOL)a3
{
  self->_immediatelyFailsAfterTouchEnd = a3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  char v7 = [objc_loadWeak(&self->_deferringGestureDelegate.m_weakReference) deferringGestureRecognizer:self willBeginTouchesWithEvent:a4];
  v8.receiver = self;
  v8.super_class = (Class)WKDeferringGestureRecognizer;
  [(WKDeferringGestureRecognizer *)&v8 touchesBegan:a3 withEvent:a4];
  if ((v7 & 1) == 0) {
    [(WKDeferringGestureRecognizer *)self setState:5];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)WKDeferringGestureRecognizer;
  -[WKDeferringGestureRecognizer touchesEnded:withEvent:](&v6, sel_touchesEnded_withEvent_, a3);
  if ([(WKDeferringGestureRecognizer *)self immediatelyFailsAfterTouchEnd]) {
    [(WKDeferringGestureRecognizer *)self setState:5];
  }
  [objc_loadWeak(&self->_deferringGestureDelegate.m_weakReference) deferringGestureRecognizer:self didEndTouchesWithEvent:a4];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WKDeferringGestureRecognizer;
  [(WKDeferringGestureRecognizer *)&v5 touchesCancelled:a3 withEvent:a4];
  [(WKDeferringGestureRecognizer *)self setState:5];
}

- (void)endDeferral:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 5;
  }
  [(WKDeferringGestureRecognizer *)self setState:v3];
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldDeferGestureRecognizer:(id)a3
{
  id Weak = objc_loadWeak(&self->_deferringGestureDelegate.m_weakReference);

  return [Weak deferringGestureRecognizer:self shouldDeferOtherGestureRecognizer:a3];
}

- (void)setState:(int64_t)a3
{
  uint64_t v5 = [(WKDeferringGestureRecognizer *)self state];
  v6.receiver = self;
  v6.super_class = (Class)WKDeferringGestureRecognizer;
  [(WKDeferringGestureRecognizer *)&v6 setState:a3];
  if (v5 != [(WKDeferringGestureRecognizer *)self state]) {
    [objc_loadWeak(&self->_deferringGestureDelegate.m_weakReference) deferringGestureRecognizer:self didTransitionToState:a3];
  }
}

- (BOOL)immediatelyFailsAfterTouchEnd
{
  return self->_immediatelyFailsAfterTouchEnd;
}

- (void).cxx_destruct
{
}

@end