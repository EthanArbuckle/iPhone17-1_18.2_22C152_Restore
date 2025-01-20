@interface ICDocCamImageQuadEditPanGestureRecognizer
- (ICDocCamImageQuadEditPanGestureRecognizerDelegate)quadEditorDelegate;
- (void)setQuadEditorDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation ICDocCamImageQuadEditPanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)ICDocCamImageQuadEditPanGestureRecognizer;
  [(ICDocCamImageQuadEditPanGestureRecognizer *)&v6 touchesBegan:a3 withEvent:a4];
  if ([(ICDocCamImageQuadEditPanGestureRecognizer *)self state] <= 0)
  {
    [(ICDocCamImageQuadEditPanGestureRecognizer *)self setState:1];
    v5 = [(ICDocCamImageQuadEditPanGestureRecognizer *)self quadEditorDelegate];
    [v5 touchesBeganOnQuadEditPanGestureRecognizerDelegate:self];
  }
}

- (ICDocCamImageQuadEditPanGestureRecognizerDelegate)quadEditorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_quadEditorDelegate);

  return (ICDocCamImageQuadEditPanGestureRecognizerDelegate *)WeakRetained;
}

- (void)setQuadEditorDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end