@interface AKPanGestureRecognizer
- (BOOL)penGestureDetected;
- (CGPoint)locationOfFirstTouch;
- (CGPoint)locationOfFirstTouchInView:(id)a3;
- (NSMutableArray)currentAccumulatedTouches;
- (NSMutableSet)additionalTouches;
- (double)currentMaxWeight;
- (double)currentWeight;
- (id)accumulatedTouches;
- (unint64_t)additionalNumberOfTouches;
- (void)_checkTouchForStylus:(id)a3;
- (void)reset;
- (void)resetAccumulatedTouches;
- (void)resetAdditionalTouches;
- (void)setAdditionalTouches:(id)a3;
- (void)setCurrentAccumulatedTouches:(id)a3;
- (void)setCurrentMaxWeight:(double)a3;
- (void)setCurrentWeight:(double)a3;
- (void)setLocationOfFirstTouch:(CGPoint)a3;
- (void)setPenGestureDetected:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation AKPanGestureRecognizer

- (void)reset
{
  [(AKPanGestureRecognizer *)self setCurrentWeight:0.5];
  [(AKPanGestureRecognizer *)self setCurrentMaxWeight:0.0];
  [(AKPanGestureRecognizer *)self resetAccumulatedTouches];
  [(AKPanGestureRecognizer *)self resetAdditionalTouches];
  -[AKPanGestureRecognizer setLocationOfFirstTouch:](self, "setLocationOfFirstTouch:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [(AKPanGestureRecognizer *)self setPenGestureDetected:0];
  v3.receiver = self;
  v3.super_class = (Class)AKPanGestureRecognizer;
  [(AKPanGestureRecognizer *)&v3 reset];
}

- (void)_checkTouchForStylus:(id)a3
{
  if ([a3 type] == 2)
  {
    [(AKPanGestureRecognizer *)self setPenGestureDetected:1];
  }
}

- (id)accumulatedTouches
{
  objc_super v3 = [(AKPanGestureRecognizer *)self currentAccumulatedTouches];

  if (v3)
  {
    v4 = [(AKPanGestureRecognizer *)self currentAccumulatedTouches];
    v5 = (void *)[v4 copy];
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (void)resetAccumulatedTouches
{
  id v2 = [(AKPanGestureRecognizer *)self currentAccumulatedTouches];
  [v2 removeAllObjects];
}

- (void)resetAdditionalTouches
{
  id v2 = [(AKPanGestureRecognizer *)self additionalTouches];
  [v2 removeAllObjects];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 anyObject];
  [(AKPanGestureRecognizer *)self _checkTouchForStylus:v8];
  [v8 force];
  -[AKPanGestureRecognizer setCurrentWeight:](self, "setCurrentWeight:");
  [v8 maximumPossibleForce];
  -[AKPanGestureRecognizer setCurrentMaxWeight:](self, "setCurrentMaxWeight:");
  v9 = [(AKPanGestureRecognizer *)self view];
  [v8 locationInView:v9];
  -[AKPanGestureRecognizer setLocationOfFirstTouch:](self, "setLocationOfFirstTouch:");

  v10 = [(AKPanGestureRecognizer *)self currentAccumulatedTouches];

  if (!v10)
  {
    v11 = [MEMORY[0x263EFF980] arrayWithCapacity:100];
    [(AKPanGestureRecognizer *)self setCurrentAccumulatedTouches:v11];
  }
  v12 = [(AKPanGestureRecognizer *)self currentAccumulatedTouches];
  v13 = [v7 coalescedTouchesForTouch:v8];
  [v12 addObjectsFromArray:v13];

  if ([(AKPanGestureRecognizer *)self state] == 2)
  {
    v14 = [(AKPanGestureRecognizer *)self additionalTouches];

    if (!v14)
    {
      v15 = objc_opt_new();
      [(AKPanGestureRecognizer *)self setAdditionalTouches:v15];
    }
    v16 = [(AKPanGestureRecognizer *)self additionalTouches];
    [v16 unionSet:v6];
  }
  v17.receiver = self;
  v17.super_class = (Class)AKPanGestureRecognizer;
  [(AKPanGestureRecognizer *)&v17 touchesBegan:v6 withEvent:v7];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 anyObject];
  [(AKPanGestureRecognizer *)self _checkTouchForStylus:v8];
  [v8 force];
  -[AKPanGestureRecognizer setCurrentWeight:](self, "setCurrentWeight:");
  [v8 maximumPossibleForce];
  -[AKPanGestureRecognizer setCurrentMaxWeight:](self, "setCurrentMaxWeight:");
  v9 = [(AKPanGestureRecognizer *)self currentAccumulatedTouches];
  v10 = [v6 coalescedTouchesForTouch:v8];
  [v9 addObjectsFromArray:v10];

  v11.receiver = self;
  v11.super_class = (Class)AKPanGestureRecognizer;
  [(AKPanGestureRecognizer *)&v11 touchesMoved:v7 withEvent:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 anyObject];
  [v8 force];
  -[AKPanGestureRecognizer setCurrentWeight:](self, "setCurrentWeight:");
  [v8 maximumPossibleForce];
  -[AKPanGestureRecognizer setCurrentMaxWeight:](self, "setCurrentMaxWeight:");
  v9 = [(AKPanGestureRecognizer *)self currentAccumulatedTouches];
  v10 = [v6 coalescedTouchesForTouch:v8];
  [v9 addObjectsFromArray:v10];

  objc_super v11 = [(AKPanGestureRecognizer *)self additionalTouches];
  [v11 minusSet:v7];

  v12.receiver = self;
  v12.super_class = (Class)AKPanGestureRecognizer;
  [(AKPanGestureRecognizer *)&v12 touchesEnded:v7 withEvent:v6];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 anyObject];
  [(AKPanGestureRecognizer *)self setPenGestureDetected:0];
  [v8 force];
  -[AKPanGestureRecognizer setCurrentWeight:](self, "setCurrentWeight:");
  [v8 maximumPossibleForce];
  -[AKPanGestureRecognizer setCurrentMaxWeight:](self, "setCurrentMaxWeight:");
  v9 = [(AKPanGestureRecognizer *)self currentAccumulatedTouches];
  v10 = [v6 coalescedTouchesForTouch:v8];
  [v9 addObjectsFromArray:v10];

  objc_super v11 = [(AKPanGestureRecognizer *)self additionalTouches];
  [v11 minusSet:v7];

  v12.receiver = self;
  v12.super_class = (Class)AKPanGestureRecognizer;
  [(AKPanGestureRecognizer *)&v12 touchesCancelled:v7 withEvent:v6];
}

- (unint64_t)additionalNumberOfTouches
{
  id v2 = [(AKPanGestureRecognizer *)self additionalTouches];
  unint64_t v3 = [v2 count];

  return v3;
}

- (CGPoint)locationOfFirstTouchInView:(id)a3
{
  id v4 = a3;
  v5 = [(AKPanGestureRecognizer *)self view];
  [(AKPanGestureRecognizer *)self locationOfFirstTouch];
  objc_msgSend(v5, "convertPoint:toView:", v4);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (double)currentWeight
{
  return self->_currentWeight;
}

- (void)setCurrentWeight:(double)a3
{
  self->_currentWeight = a3;
}

- (double)currentMaxWeight
{
  return self->_currentMaxWeight;
}

- (void)setCurrentMaxWeight:(double)a3
{
  self->_currentMaxWeight = a3;
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

- (BOOL)penGestureDetected
{
  return self->_penGestureDetected;
}

- (void)setPenGestureDetected:(BOOL)a3
{
  self->_penGestureDetected = a3;
}

- (NSMutableArray)currentAccumulatedTouches
{
  return self->_currentAccumulatedTouches;
}

- (void)setCurrentAccumulatedTouches:(id)a3
{
}

- (NSMutableSet)additionalTouches
{
  return self->_additionalTouches;
}

- (void)setAdditionalTouches:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalTouches, 0);

  objc_storeStrong((id *)&self->_currentAccumulatedTouches, 0);
}

@end