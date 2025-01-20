@interface PKPencilTouchDetectionGestureRecognizer
- (BOOL)_affectedByGesture:(id)a3;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (PKPencilTouchDetectionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)updateTimestampsforTouches:(id)a3 withEvent:(id)a4;
@end

@implementation PKPencilTouchDetectionGestureRecognizer

- (PKPencilTouchDetectionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPencilTouchDetectionGestureRecognizer;
  v4 = [(PKPencilTouchDetectionGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(PKPencilTouchDetectionGestureRecognizer *)v4 setAllowedTouchTypes:&unk_1F200EAF0];
    [(PKPencilTouchDetectionGestureRecognizer *)v5 setCancelsTouchesInView:0];
    [(PKPencilTouchDetectionGestureRecognizer *)v5 setDelaysTouchesEnded:0];
  }
  return v5;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_affectedByGesture:(id)a3
{
  return 0;
}

- (void)updateTimestampsforTouches:(id)a3 withEvent:(id)a4
{
  unsigned int v5 = objc_msgSend(a4, "PK_isEventFromCrayon", a3);
  v6 = [(PKPencilTouchDetectionGestureRecognizer *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(PKPencilTouchDetectionGestureRecognizer *)self delegate];
    [v8 updateTimestampForType:v5];
  }
}

@end