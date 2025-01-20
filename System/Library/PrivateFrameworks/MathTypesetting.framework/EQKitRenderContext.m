@interface EQKitRenderContext
- (BOOL)rendersDebugRects;
- (CGColor)highlightColor;
- (CGContext)cgContext;
- (EQKitRenderContext)initWithCGContext:(CGContext *)a3;
- (EQKitSelection)selection;
- (void)dealloc;
- (void)setHighlightColor:(CGColor *)a3;
- (void)setRendersDebugRects:(BOOL)a3;
- (void)setSelection:(id)a3;
@end

@implementation EQKitRenderContext

- (EQKitRenderContext)initWithCGContext:(CGContext *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EQKitRenderContext;
  v4 = [(EQKitRenderContext *)&v6 init];
  if (v4)
  {
    CFRetain(a3);
    v4->_selection = 0;
    v4->_cgContext = a3;
    v4->_highlightColor = 0;
  }
  return v4;
}

- (void)dealloc
{
  CFRelease(self->_cgContext);
  highlightColor = self->_highlightColor;
  if (highlightColor) {
    CFRelease(highlightColor);
  }
  v4.receiver = self;
  v4.super_class = (Class)EQKitRenderContext;
  [(EQKitRenderContext *)&v4 dealloc];
}

- (void)setHighlightColor:(CGColor *)a3
{
  highlightColor = self->_highlightColor;
  if (highlightColor != a3)
  {
    if (highlightColor) {
      CFRelease(highlightColor);
    }
    self->_highlightColor = a3;
    if (a3)
    {
      CFRetain(a3);
    }
  }
}

- (EQKitSelection)selection
{
  return self->_selection;
}

- (void)setSelection:(id)a3
{
}

- (CGContext)cgContext
{
  return self->_cgContext;
}

- (CGColor)highlightColor
{
  return self->_highlightColor;
}

- (BOOL)rendersDebugRects
{
  return self->_rendersDebugRects;
}

- (void)setRendersDebugRects:(BOOL)a3
{
  self->_rendersDebugRects = a3;
}

@end