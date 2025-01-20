@interface PDFExtensionTopView
- (BOOL)canBecomeFirstResponder;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PDFExtensionTopView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

@end