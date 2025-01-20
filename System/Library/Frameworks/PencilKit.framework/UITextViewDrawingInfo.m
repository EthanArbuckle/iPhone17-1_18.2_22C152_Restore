@interface UITextViewDrawingInfo
@end

@implementation UITextViewDrawingInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedViewProviders, 0);
  objc_storeStrong((id *)&self->_drawingClass, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tiledView, 0);

  objc_destroyWeak((id *)&self->_textView);
}

@end