@interface _HKGraphViewOverlayView
- (UIGraphicsImageRenderer)imageRenderer;
- (_HKGraphViewOverlayView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_updateRendererSize:(CGSize)a3;
- (void)drawContentUsingBlock:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImageRenderer:(id)a3;
@end

@implementation _HKGraphViewOverlayView

- (_HKGraphViewOverlayView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKGraphViewOverlayView;
  v3 = -[_HKGraphViewOverlayView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_HKGraphViewOverlayView *)v3 setOpaque:0];
    [(_HKGraphViewOverlayView *)v4 setContentMode:1];
    -[_HKGraphViewOverlayView _updateRendererSize:](v4, "_updateRendererSize:", 1.0, 1.0);
    [(_HKGraphViewOverlayView *)v4 setUserInteractionEnabled:1];
  }
  return v4;
}

- (void)_updateRendererSize:(CGSize)a3
{
  id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", a3.width, a3.height);
  [(_HKGraphViewOverlayView *)self setImageRenderer:v4];
}

- (void)drawContentUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(_HKGraphViewOverlayView *)self imageRenderer];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __49___HKGraphViewOverlayView_drawContentUsingBlock___block_invoke;
  v11 = &unk_1E6D51F40;
  v12 = self;
  id v13 = v4;
  id v6 = v4;
  v7 = [v5 imageWithActions:&v8];

  -[_HKGraphViewOverlayView setImage:](self, "setImage:", v7, v8, v9, v10, v11, v12);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[_HKGraphViewOverlayView _updateRendererSize:](self, "_updateRendererSize:", a3.size.width, a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)_HKGraphViewOverlayView;
  -[_HKGraphViewOverlayView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[_HKGraphViewOverlayView _updateRendererSize:](self, "_updateRendererSize:", a3.size.width, a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)_HKGraphViewOverlayView;
  -[_HKGraphViewOverlayView setBounds:](&v8, sel_setBounds_, x, y, width, height);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_HKGraphViewOverlayView;
  -[_HKGraphViewOverlayView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_HKGraphViewOverlayView *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 == self) {
    v5 = 0;
  }
  v7 = v5;

  return v7;
}

- (UIGraphicsImageRenderer)imageRenderer
{
  return self->_imageRenderer;
}

- (void)setImageRenderer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end