@interface PDFPanGestureRecognizer
- (BOOL)didForcePress;
- (BOOL)touchesDidHavePressure;
- (CGPoint)locationOfFirstTouch;
- (CGPoint)locationOfFirstTouchInView:(id)a3;
- (void)reset;
- (void)setDidForcePress:(BOOL)a3;
- (void)setLocationOfFirstTouch:(CGPoint)a3;
- (void)setTouchesDidHavePressure:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation PDFPanGestureRecognizer

- (void)reset
{
  -[PDFPanGestureRecognizer setLocationOfFirstTouch:](self, "setLocationOfFirstTouch:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  v3.receiver = self;
  v3.super_class = (Class)PDFPanGestureRecognizer;
  [(PDFPanGestureRecognizer *)&v3 reset];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 anyObject];
  v9 = [(PDFPanGestureRecognizer *)self view];
  [v8 locationInView:v9];
  double v11 = v10;
  double v13 = v12;

  -[PDFPanGestureRecognizer setLocationOfFirstTouch:](self, "setLocationOfFirstTouch:", v11, v13);
  v28.receiver = self;
  v28.super_class = (Class)PDFPanGestureRecognizer;
  [(PDFPanGestureRecognizer *)&v28 touchesBegan:v6 withEvent:v7];
  [(PDFPanGestureRecognizer *)self setDidForcePress:0];
  [(PDFPanGestureRecognizer *)self setTouchesDidHavePressure:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_msgSend(v19, "force", (void)v24);
        double v21 = v20;
        [v19 maximumPossibleForce];
        if (v21 / v22 >= 0.75) {
          [(PDFPanGestureRecognizer *)self setDidForcePress:1];
        }
        [v19 _pressure];
        if (v23 > 0.0) {
          [(PDFPanGestureRecognizer *)self setTouchesDidHavePressure:1];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v16);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PDFPanGestureRecognizer;
  [(PDFPanGestureRecognizer *)&v17 touchesMoved:v6 withEvent:a4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "_pressure", (void)v13);
        if (v12 > 0.0) {
          [(PDFPanGestureRecognizer *)self setTouchesDidHavePressure:1];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v9);
  }
}

- (CGPoint)locationOfFirstTouchInView:(id)a3
{
  id v4 = a3;
  v5 = [(PDFPanGestureRecognizer *)self view];
  [(PDFPanGestureRecognizer *)self locationOfFirstTouch];
  objc_msgSend(v5, "convertPoint:toView:", v4);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)locationOfFirstTouch
{
  double x = self->_locationOfFirstTouch.x;
  double y = self->_locationOfFirstTouch.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocationOfFirstTouch:(CGPoint)a3
{
  self->_locationOfFirstTouch = a3;
}

- (BOOL)didForcePress
{
  return self->_didForcePress;
}

- (void)setDidForcePress:(BOOL)a3
{
  self->_didForcePress = a3;
}

- (BOOL)touchesDidHavePressure
{
  return self->_touchesDidHavePressure;
}

- (void)setTouchesDidHavePressure:(BOOL)a3
{
  self->_touchesDidHavePressure = a3;
}

@end