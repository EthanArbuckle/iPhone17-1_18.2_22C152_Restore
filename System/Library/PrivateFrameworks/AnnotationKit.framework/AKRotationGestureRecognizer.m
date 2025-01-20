@interface AKRotationGestureRecognizer
- (AKController)annotationController;
- (void)setAnnotationController:(id)a3;
- (void)setState:(int64_t)a3;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation AKRotationGestureRecognizer

- (void)setState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKRotationGestureRecognizer;
  -[AKRotationGestureRecognizer setState:](&v5, sel_setState_);
  if (a3) {
    self->tries = 0;
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(AKRotationGestureRecognizer *)self state];
  v13.receiver = self;
  v13.super_class = (Class)AKRotationGestureRecognizer;
  [(AKRotationGestureRecognizer *)&v13 touchesMoved:v7 withEvent:v6];

  v9 = [(AKRotationGestureRecognizer *)self annotationController];
  v10 = [v9 modelController];
  v11 = [v10 allSelectedAnnotations];

  if (![v11 count]
    || !v8
    && [(AKRotationGestureRecognizer *)self state] != 1
    && (unint64_t v12 = self->tries + 1, self->tries = v12, v12 >= 8))
  {
    [(AKRotationGestureRecognizer *)self setEnabled:0];
    [(AKRotationGestureRecognizer *)self setEnabled:1];
  }
}

- (AKController)annotationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationController);

  return (AKController *)WeakRetained;
}

- (void)setAnnotationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end