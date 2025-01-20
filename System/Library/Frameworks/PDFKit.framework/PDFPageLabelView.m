@interface PDFPageLabelView
- (PDFPageLabelView)initWithFrame:(CGRect)a3;
- (void)_startFade;
- (void)setCurrentPageNumber:(unint64_t)a3 forPageCount:(unint64_t)a4;
- (void)updateEffect;
@end

@implementation PDFPageLabelView

- (PDFPageLabelView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v30.receiver = self;
  v30.super_class = (Class)PDFPageLabelView;
  v5 = -[PDFPageLabelView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = objc_alloc_init(PDFPageLabelViewPrivate);
    v7 = v5->_private;
    v5->_private = v6;

    [(PDFPageLabelView *)v5 setUserInteractionEnabled:0];
    double v8 = *MEMORY[0x263F00148];
    double v9 = *(double *)(MEMORY[0x263F00148] + 8);
    [(PDFPageLabelView *)v5 setAlpha:0.0];
    v10 = [(PDFPageLabelView *)v5 layer];
    [v10 setAllowsGroupOpacity:0];

    v11 = [(PDFPageLabelView *)v5 layer];
    [v11 setAllowsGroupBlending:0];

    v12 = [MEMORY[0x263F82EC0] settingsForPrivateStyle:2020];
    [v12 setScale:0.5];
    uint64_t v13 = [objc_alloc(MEMORY[0x263F82EB8]) initWithSettings:v12];
    v14 = v5->_private;
    backdropView = v14->backdropView;
    v14->backdropView = (_UIBackdropView *)v13;

    -[_UIBackdropView setFrame:](v5->_private->backdropView, "setFrame:", v8, v9, width, height);
    [(_UIBackdropView *)v5->_private->backdropView _setCornerRadius:7.0];
    [(PDFPageLabelView *)v5 addSubview:v5->_private->backdropView];
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v8, v9, width, height);
    v17 = v5->_private;
    label = v17->label;
    v17->label = (UILabel *)v16;

    [(UILabel *)v5->_private->label setOpaque:0];
    [(UILabel *)v5->_private->label setBackgroundColor:0];
    [(UILabel *)v5->_private->label setTextAlignment:1];
    v19 = v5->_private->label;
    v20 = [MEMORY[0x263F82760] boldSystemFontOfSize:16.0];
    [(UILabel *)v19 setFont:v20];

    v21 = v5->_private->label;
    v22 = [MEMORY[0x263F825C8] blackColor];
    [(UILabel *)v21 setTextColor:v22];

    [(UILabel *)v5->_private->label setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v5->_private->label setAlpha:0.4];
    v23 = [(UILabel *)v5->_private->label layer];
    v24 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D50]];
    [v23 setCompositingFilter:v24];

    v25 = [(_UIBackdropView *)v5->_private->backdropView contentView];
    [v25 addSubview:v5->_private->label];

    v26 = [[PDFTimer alloc] initWithThrottleDelay:sel__startFade forSelector:v5 forTarget:1.5];
    v27 = v5->_private;
    visibilityTimer = v27->visibilityTimer;
    v27->visibilityTimer = v26;
  }
  return v5;
}

- (void)setCurrentPageNumber:(unint64_t)a3 forPageCount:(unint64_t)a4
{
  v7 = NSString;
  double v8 = PDFKitLocalizedString(@"%d of %d");
  objc_msgSend(v7, "stringWithFormat:", v8, a3, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [(UILabel *)self->_private->label setText:v9];
  [(PDFPageLabelView *)self updateEffect];
}

- (void)updateEffect
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __32__PDFPageLabelView_updateEffect__block_invoke;
  v3[3] = &unk_264203940;
  v3[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v3 animations:0.1];
  [(PDFTimer *)self->_private->visibilityTimer cancel];
  [(PDFTimer *)self->_private->visibilityTimer update];
}

uint64_t __32__PDFPageLabelView_updateEffect__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)_startFade
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __30__PDFPageLabelView__startFade__block_invoke;
  v2[3] = &unk_264203940;
  v2[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v2 animations:0.75];
}

uint64_t __30__PDFPageLabelView__startFade__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (void).cxx_destruct
{
}

@end