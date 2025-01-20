@interface PKPencilObserverGestureRecognizer
+ (PKPencilObserverGestureRecognizer)pencilObserverWithDelegate:(uint64_t)a1;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3;
- (CGPoint)locationInView:(id)a3;
- (void)_endGestureIfNecessary;
- (void)_inputPointFromTouch:(void *)a3 event:(void *)a4 checkPredicted:(int)a5;
- (void)setDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation PKPencilObserverGestureRecognizer

+ (PKPencilObserverGestureRecognizer)pencilObserverWithDelegate:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = objc_alloc_init(PKPencilObserverGestureRecognizer);
  v4 = v3;
  if (v3)
  {
    [(PKPencilObserverGestureRecognizer *)v3 setName:@"pencilkit.pencilObserver"];
    [(PKPencilObserverGestureRecognizer *)v4 setDelegate:v2];
    [(PKPencilObserverGestureRecognizer *)v4 setDelaysTouchesEnded:0];
    [(PKPencilObserverGestureRecognizer *)v4 setCancelsTouchesInView:0];
    [(PKPencilObserverGestureRecognizer *)v4 setRequiresExclusiveTouchType:0];
    [(PKPencilObserverGestureRecognizer *)v4 setAllowedTouchTypes:&unk_1F200EC10];
    v5 = v4;
  }

  return v4;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPencilObserverGestureRecognizer;
  [(PKPencilObserverGestureRecognizer *)&v7 setDelegate:v4];
  id v5 = v4;
  self->_delegateRespondsToDidBegin = objc_opt_respondsToSelector() & 1;
  self->_delegateRespondsToDidMove = objc_opt_respondsToSelector() & 1;
  char v6 = objc_opt_respondsToSelector();

  self->_delegateRespondsToDidEnd = v6 & 1;
}

- (CGPoint)locationInView:(id)a3
{
  if (a3 && self->_drawingTouch)
  {
    drawingTouch = self->_drawingTouch;
    -[UITouch PK_locationInView:](drawingTouch, "PK_locationInView:");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PKPencilObserverGestureRecognizer;
    -[PKPencilObserverGestureRecognizer locationInView:](&v6, sel_locationInView_);
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)_inputPointFromTouch:(void *)a3 event:(void *)a4 checkPredicted:(int)a5
{
  id v14 = a3;
  id v9 = a4;
  if (a2)
  {
    v10 = [a2 view];
    if (v10)
    {
      id v11 = v14;
      if (a5)
      {
        v12 = [v9 predictedTouchesForTouch:v11];
        if ([v12 count])
        {
          uint64_t v13 = [v12 lastObject];

          id v11 = (id)v13;
        }
      }
      objc_msgSend(v11, "PK_locationInView:", v10);
      +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", v10, v11, 0, 23);
    }
    else
    {
      a1[6] = 0u;
      a1[7] = 0u;
      a1[4] = 0u;
      a1[5] = 0u;
      a1[2] = 0u;
      a1[3] = 0u;
      *a1 = 0u;
      a1[1] = 0u;
    }
  }
  else
  {
    a1[6] = 0u;
    a1[7] = 0u;
    a1[4] = 0u;
    a1[5] = 0u;
    a1[2] = 0u;
    a1[3] = 0u;
    *a1 = 0u;
    a1[1] = 0u;
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  if (!self->_drawingTouch)
  {
    objc_super v7 = [a3 objectsPassingTest:&__block_literal_global_40];
    v8 = [v7 anyObject];

    if (v8)
    {
      objc_storeStrong((id *)&self->_drawingTouch, v8);
      [(PKPencilObserverGestureRecognizer *)self setState:1];
      if (self->_delegateRespondsToDidBegin)
      {
        id v9 = [(PKPencilObserverGestureRecognizer *)self delegate];
        [(PKPencilObserverGestureRecognizer *)v10 _inputPointFromTouch:v8 event:v6 checkPredicted:0];
        [v9 pencilObserver:self didBeginAtPoint:v10];
      }
    }
  }
}

BOOL __60__PKPencilObserverGestureRecognizer_touchesBegan_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 2;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  if ([a3 containsObject:self->_drawingTouch] && self->_delegateRespondsToDidMove)
  {
    objc_super v7 = [(PKPencilObserverGestureRecognizer *)self delegate];
    [(PKPencilObserverGestureRecognizer *)v8 _inputPointFromTouch:self->_drawingTouch event:v6 checkPredicted:1];
    [v7 pencilObserver:self didMoveToPoint:v8];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (self)
  {
    if ([(PKPencilObserverGestureRecognizer *)self state]) {
      uint64_t v5 = 4;
    }
    else {
      uint64_t v5 = 5;
    }
    [(PKPencilObserverGestureRecognizer *)self setState:v5];
    -[PKPencilObserverGestureRecognizer _endGestureIfNecessary]((uint64_t)self);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[PKPencilObserverGestureRecognizer setState:](self, "setState:", 3, a4);

  -[PKPencilObserverGestureRecognizer _endGestureIfNecessary]((uint64_t)self);
}

- (void)_endGestureIfNecessary
{
  if (a1)
  {
    id v2 = *(void **)(a1 + 272);
    if (v2)
    {
      *(void *)(a1 + 272) = 0;

      if (*(unsigned char *)(a1 + 282))
      {
        id v3 = [(id)a1 delegate];
        [v3 pencilObserverDidEnd:a1];
      }
    }
  }
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end