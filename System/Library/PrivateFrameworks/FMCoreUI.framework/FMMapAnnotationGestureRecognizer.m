@interface FMMapAnnotationGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (FMMapAnnotationGestureRecognizer)init;
- (FMMapAnnotationGestureRecognizerDelegate)touchDelegate;
- (void)setTouchDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation FMMapAnnotationGestureRecognizer

- (FMMapAnnotationGestureRecognizer)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMMapAnnotationGestureRecognizer;
  v2 = [(FMMapAnnotationGestureRecognizer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(FMMapAnnotationGestureRecognizer *)v2 setCancelsTouchesInView:0];
  }

  return v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = [(FMMapAnnotationGestureRecognizer *)self touchDelegate];
  [v5 fingerOnAnnotation:self];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = [(FMMapAnnotationGestureRecognizer *)self touchDelegate];
  [v5 fingerOffAnnotation:self];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = [(FMMapAnnotationGestureRecognizer *)self touchDelegate];
  [v5 fingerOffAnnotation:self];
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 1;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 1;
}

- (FMMapAnnotationGestureRecognizerDelegate)touchDelegate
{
  return self->_touchDelegate;
}

- (void)setTouchDelegate:(id)a3
{
  self->_touchDelegate = (FMMapAnnotationGestureRecognizerDelegate *)a3;
}

@end