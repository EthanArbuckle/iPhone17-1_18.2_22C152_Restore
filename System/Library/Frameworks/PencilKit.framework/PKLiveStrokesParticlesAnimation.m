@interface PKLiveStrokesParticlesAnimation
- (BOOL)isDoneAtTime:(double)a3;
- (CGRect)bounds;
- (CGRect)destinationFrame;
- (NSArray)strokes;
- (PKLiveStrokesParticlesAnimation)initWithStrokes:(id)a3 startTime:(double)a4 duration:(double)a5 destinationFrame:(CGRect)a6;
- (double)duration;
- (double)startTime;
- (void)_calculateBounds;
@end

@implementation PKLiveStrokesParticlesAnimation

- (PKLiveStrokesParticlesAnimation)initWithStrokes:(id)a3 startTime:(double)a4 duration:(double)a5 destinationFrame:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v13 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKLiveStrokesParticlesAnimation;
  v14 = [(PKLiveStrokesParticlesAnimation *)&v18 init];
  if (v14)
  {
    uint64_t v15 = [v13 copy];
    strokes = v14->_strokes;
    v14->_strokes = (NSArray *)v15;

    v14->_startTime = a4;
    v14->_duration = a5;
    v14->_destinationFrame.origin.CGFloat x = x;
    v14->_destinationFrame.origin.CGFloat y = y;
    v14->_destinationFrame.size.CGFloat width = width;
    v14->_destinationFrame.size.CGFloat height = height;
    [(PKLiveStrokesParticlesAnimation *)v14 _calculateBounds];
  }

  return v14;
}

- (void)_calculateBounds
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CGFloat x = self->_destinationFrame.origin.x;
  CGFloat y = self->_destinationFrame.origin.y;
  CGFloat width = self->_destinationFrame.size.width;
  CGFloat height = self->_destinationFrame.size.height;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = self->_strokes;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "_bounds", (void)v16);
        v24.origin.CGFloat x = v12;
        v24.origin.CGFloat y = v13;
        v24.size.CGFloat width = v14;
        v24.size.CGFloat height = v15;
        v22.origin.CGFloat x = x;
        v22.origin.CGFloat y = y;
        v22.size.CGFloat width = width;
        v22.size.CGFloat height = height;
        CGRect v23 = CGRectUnion(v22, v24);
        CGFloat x = v23.origin.x;
        CGFloat y = v23.origin.y;
        CGFloat width = v23.size.width;
        CGFloat height = v23.size.height;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  self->_bounds.origin.CGFloat x = x;
  self->_bounds.origin.CGFloat y = y;
  self->_bounds.size.CGFloat width = width;
  self->_bounds.size.CGFloat height = height;
}

- (BOOL)isDoneAtTime:(double)a3
{
  [(PKLiveStrokesParticlesAnimation *)self startTime];
  double v6 = v5;
  [(PKLiveStrokesParticlesAnimation *)self duration];
  return v6 + v7 <= a3;
}

- (NSArray)strokes
{
  return self->_strokes;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

- (CGRect)destinationFrame
{
  double x = self->_destinationFrame.origin.x;
  double y = self->_destinationFrame.origin.y;
  double width = self->_destinationFrame.size.width;
  double height = self->_destinationFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end