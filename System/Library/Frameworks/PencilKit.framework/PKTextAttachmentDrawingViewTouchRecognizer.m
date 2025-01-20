@interface PKTextAttachmentDrawingViewTouchRecognizer
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation PKTextAttachmentDrawingViewTouchRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (![(PKTextAttachmentDrawingViewTouchRecognizer *)self state])
  {
    [(PKTextAttachmentDrawingViewTouchRecognizer *)self setState:1];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

@end