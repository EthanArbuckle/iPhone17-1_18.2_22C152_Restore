@interface RPFlatVideoOverlayButton
- (RPFlatVideoOverlayButton)initWithStyle:(int64_t)a3;
- (SEL)action;
- (id)_createOverlayImageWithBackgroundWhite:(double)a3 backgroundAlpha:(double)a4 glyphAlpha:(double)a5;
- (id)_highlightedButtonImage;
- (id)_normalButtonImage;
- (id)target;
- (int64_t)style;
- (void)_handleTap:(id)a3;
- (void)setAction:(SEL)a3;
- (void)setTarget:(id)a3;
- (void)setTarget:(id)a3 action:(SEL)a4;
@end

@implementation RPFlatVideoOverlayButton

- (RPFlatVideoOverlayButton)initWithStyle:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RPFlatVideoOverlayButton;
  v4 = -[RPFlatVideoOverlayButton initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = [(RPFlatVideoOverlayButton *)v4 _normalButtonImage];
    [(RPFlatVideoOverlayButton *)v5 setImage:v6 forState:0];

    v7 = [(RPFlatVideoOverlayButton *)v5 _highlightedButtonImage];
    [(RPFlatVideoOverlayButton *)v5 setImage:v7 forState:1];

    [(RPFlatVideoOverlayButton *)v5 sizeToFit];
    [(RPFlatVideoOverlayButton *)v5 setDeliversTouchesForGesturesToSuperview:0];
    [(RPFlatVideoOverlayButton *)v5 addTarget:v5 action:sel__handleTap_ forControlEvents:64];
  }
  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  self->_action = a4;
}

- (void)_handleTap:(id)a3
{
  p_target = &self->_target;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained(p_target);
    [v7 performSelector:self->_action withObject:self];
  }
}

- (id)_normalButtonImage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__RPFlatVideoOverlayButton__normalButtonImage__block_invoke;
  block[3] = &unk_26451D7F0;
  block[4] = self;
  if (_normalButtonImage_onceToken != -1) {
    dispatch_once(&_normalButtonImage_onceToken, block);
  }
  return (id)_normalButtonImage_image;
}

uint64_t __46__RPFlatVideoOverlayButton__normalButtonImage__block_invoke(uint64_t a1)
{
  _normalButtonImage_image = [*(id *)(a1 + 32) _createOverlayImageWithBackgroundWhite:0.959999979 backgroundAlpha:0.959999979 glyphAlpha:0.300000012];

  return MEMORY[0x270F9A758]();
}

- (id)_highlightedButtonImage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__RPFlatVideoOverlayButton__highlightedButtonImage__block_invoke;
  block[3] = &unk_26451D7F0;
  block[4] = self;
  if (_highlightedButtonImage_onceToken != -1) {
    dispatch_once(&_highlightedButtonImage_onceToken, block);
  }
  return (id)_highlightedButtonImage_image;
}

uint64_t __51__RPFlatVideoOverlayButton__highlightedButtonImage__block_invoke(uint64_t a1)
{
  _highlightedButtonImage_image = [*(id *)(a1 + 32) _createOverlayImageWithBackgroundWhite:0.959999979 backgroundAlpha:0.959999979 glyphAlpha:0.5];

  return MEMORY[0x270F9A758]();
}

- (id)_createOverlayImageWithBackgroundWhite:(double)a3 backgroundAlpha:(double)a4 glyphAlpha:(double)a5
{
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v9 = [MEMORY[0x263F1C6B0] imageNamed:@"RPVideoOverlayBackgroundMask" inBundle:v8];
  v10 = [MEMORY[0x263F1C6B0] imageNamed:@"RPVideoOverlayGlyphMask" inBundle:v8];
  double v11 = *MEMORY[0x263F00148];
  double v12 = *(double *)(MEMORY[0x263F00148] + 8);
  [v9 size];
  CGFloat width = v18.width;
  CGFloat height = v18.height;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetGrayFillColor(CurrentContext, a3, a4);
  v19.origin.x = v11;
  v19.origin.y = v12;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGContextFillRect(CurrentContext, v19);
  objc_msgSend(v9, "drawAtPoint:blendMode:alpha:", 23, v11, v12, 1.0);
  objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 23, v11, v12, 1.0);
  objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 0, v11, v12, a5);
  v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v16;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
}

@end