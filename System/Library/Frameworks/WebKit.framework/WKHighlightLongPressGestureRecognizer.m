@interface WKHighlightLongPressGestureRecognizer
- (UIScrollView)lastTouchedScrollView;
- (id).cxx_construct;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation WKHighlightLongPressGestureRecognizer

- (id).cxx_construct
{
  *((void *)self + 62) = 0;
  return self;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)WKHighlightLongPressGestureRecognizer;
  [(WKHighlightLongPressGestureRecognizer *)&v3 reset];
  objc_storeWeak(&self->_lastTouchedScrollView.m_weakReference, 0);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WKHighlightLongPressGestureRecognizer;
  [(WKHighlightLongPressGestureRecognizer *)&v7 touchesBegan:a3 withEvent:a4];
  v6 = (void *)WebKit::scrollViewForTouches(a3);
  if (v6) {
    objc_storeWeak(&self->_lastTouchedScrollView.m_weakReference, v6);
  }
}

- (UIScrollView)lastTouchedScrollView
{
  WeakRetained = (UIScrollView *)objc_loadWeakRetained(&self->_lastTouchedScrollView.m_weakReference);
  objc_super v3 = WeakRetained;
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end