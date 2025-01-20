@interface HNDScannerAutoscroller
- (BOOL)canScrollInDirection:(unint64_t)a3;
- (BOOL)isAutoscrolling;
- (HNDScannerAutoscroller)init;
- (SCATElementAutoscrolling)scrollElement;
- (unint64_t)scrollDirection;
- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5;
- (void)dealloc;
- (void)decreaseAutoscrollSpeed;
- (void)increaseAutoscrollSpeed;
- (void)pause;
- (void)resume;
- (void)scrollToTop;
- (void)setScrollDirection:(unint64_t)a3;
- (void)setScrollElement:(id)a3;
- (void)stop;
@end

@implementation HNDScannerAutoscroller

- (HNDScannerAutoscroller)init
{
  v7.receiver = self;
  v7.super_class = (Class)HNDScannerAutoscroller;
  v2 = [(HNDScannerAutoscroller *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_scrollDirection = 4;
    v4 = +[HNDAccessibilityManager sharedManager];
    [v4 addObserver:v3];

    v5 = v3;
  }

  return v3;
}

- (void)dealloc
{
  v3 = +[HNDAccessibilityManager sharedManager];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HNDScannerAutoscroller;
  [(HNDScannerAutoscroller *)&v4 dealloc];
}

- (SCATElementAutoscrolling)scrollElement
{
  return self->_scrollElement;
}

- (void)setScrollElement:(id)a3
{
  id v5 = a3;
  scrollElement = self->_scrollElement;
  p_scrollElement = &self->_scrollElement;
  id v8 = v5;
  if (([v5 isEqual:scrollElement] & 1) == 0)
  {
    objc_storeStrong((id *)p_scrollElement, a3);
    [(SCATElementAutoscrolling *)*p_scrollElement setScatAutoscrollTarget:*p_scrollElement];
  }
}

- (BOOL)isAutoscrolling
{
  v2 = [(HNDScannerAutoscroller *)self scrollElement];
  unsigned __int8 v3 = [v2 scatIsAutoscrolling];

  return v3;
}

- (void)resume
{
  id v3 = [(HNDScannerAutoscroller *)self scrollElement];
  objc_msgSend(v3, "scatAutoscrollInDirection:", -[HNDScannerAutoscroller scrollDirection](self, "scrollDirection"));
}

- (void)pause
{
  id v2 = [(HNDScannerAutoscroller *)self scrollElement];
  [v2 scatPauseAutoscrolling];
}

- (void)stop
{
  id v3 = [(HNDScannerAutoscroller *)self scrollElement];
  [v3 scatPauseAutoscrolling];

  [(HNDScannerAutoscroller *)self setScrollElement:0];
}

- (BOOL)canScrollInDirection:(unint64_t)a3
{
  return 1;
}

- (void)increaseAutoscrollSpeed
{
  id v2 = [(HNDScannerAutoscroller *)self scrollElement];
  [v2 scatIncreaseAutoscrollSpeed];
}

- (void)decreaseAutoscrollSpeed
{
  id v2 = [(HNDScannerAutoscroller *)self scrollElement];
  [v2 scatDecreaseAutoscrollSpeed];
}

- (void)scrollToTop
{
  id v2 = [(HNDScannerAutoscroller *)self scrollElement];
  [v2 scatScrollToTop];
}

- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5
{
  if ((unint64_t)a4 <= 6 && ((1 << a4) & 0x54) != 0) {
    [(HNDScannerAutoscroller *)self stop];
  }
}

- (unint64_t)scrollDirection
{
  return self->_scrollDirection;
}

- (void)setScrollDirection:(unint64_t)a3
{
  self->_scrollDirection = a3;
}

- (void).cxx_destruct
{
}

@end