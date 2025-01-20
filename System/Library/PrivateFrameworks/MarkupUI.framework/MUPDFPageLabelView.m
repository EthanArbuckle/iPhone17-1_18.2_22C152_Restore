@interface MUPDFPageLabelView
+ (id)sidebarAttributedString;
- (BOOL)isTimerInstalled;
- (MUPDFPageLabelView)initWithFrame:(CGRect)a3;
- (double)_fadeOutDelay;
- (double)_fadeOutDuration;
- (unint64_t)currentPageIndex;
- (void)clearTimer;
- (void)dealloc;
- (void)fadeOut;
- (void)resetFadeOutTimer;
- (void)setCurrentPageIndex:(unint64_t)a3;
- (void)setText:(id)a3;
- (void)showNowInSuperView:(id)a3 withText:(id)a4;
@end

@implementation MUPDFPageLabelView

- (MUPDFPageLabelView)initWithFrame:(CGRect)a3
{
  v43[8] = *MEMORY[0x263EF8340];
  v42.receiver = self;
  v42.super_class = (Class)MUPDFPageLabelView;
  v3 = -[MUPDFPageLabelView initWithFrame:](&v42, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F1C480] effectWithStyle:0];
    blurEffect = v3->_blurEffect;
    v3->_blurEffect = (UIBlurEffect *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:0];
    blurView = v3->_blurView;
    v3->_blurView = (UIVisualEffectView *)v6;

    [(UIVisualEffectView *)v3->_blurView _setContinuousCornerRadius:7.0];
    [(MUPDFPageLabelView *)v3 addSubview:v3->_blurView];
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    label = v3->_label;
    v3->_label = (UILabel *)v8;

    [(UILabel *)v3->_label setOpaque:0];
    [(UILabel *)v3->_label setBackgroundColor:0];
    [(UILabel *)v3->_label setTextAlignment:1];
    v10 = v3->_label;
    v11 = [MEMORY[0x263F1C658] boldSystemFontOfSize:16.0];
    [(UILabel *)v10 setFont:v11];

    v12 = v3->_label;
    v13 = [MEMORY[0x263F1C550] blackColor];
    [(UILabel *)v12 setTextColor:v13];

    [(UILabel *)v3->_label setAlpha:0.0];
    v14 = [(UIVisualEffectView *)v3->_blurView contentView];
    [v14 addSubview:v3->_label];

    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIVisualEffectView *)v3->_blurView setTranslatesAutoresizingMaskIntoConstraints:0];
    v32 = (void *)MEMORY[0x263F08938];
    v41 = [(UIVisualEffectView *)v3->_blurView topAnchor];
    v40 = [(MUPDFPageLabelView *)v3 topAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v43[0] = v39;
    v38 = [(UIVisualEffectView *)v3->_blurView bottomAnchor];
    v37 = [(MUPDFPageLabelView *)v3 bottomAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v43[1] = v36;
    v35 = [(UIVisualEffectView *)v3->_blurView trailingAnchor];
    v34 = [(MUPDFPageLabelView *)v3 trailingAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v43[2] = v33;
    v31 = [(UIVisualEffectView *)v3->_blurView leadingAnchor];
    v30 = [(MUPDFPageLabelView *)v3 leadingAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v43[3] = v29;
    v28 = [(UILabel *)v3->_label topAnchor];
    v27 = [(MUPDFPageLabelView *)v3 topAnchor];
    v26 = [v28 constraintEqualToAnchor:v27 constant:6.0];
    v43[4] = v26;
    v25 = [(UILabel *)v3->_label bottomAnchor];
    v15 = [(MUPDFPageLabelView *)v3 bottomAnchor];
    v16 = [v25 constraintEqualToAnchor:v15 constant:-6.0];
    v43[5] = v16;
    v17 = [(UILabel *)v3->_label leadingAnchor];
    v18 = [(MUPDFPageLabelView *)v3 leadingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18 constant:10.0];
    v43[6] = v19;
    v20 = [(UILabel *)v3->_label trailingAnchor];
    v21 = [(MUPDFPageLabelView *)v3 trailingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21 constant:-10.0];
    v43[7] = v22;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:8];
    [v32 activateConstraints:v23];
  }
  return v3;
}

- (void)clearTimer
{
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (void)dealloc
{
  [(MUPDFPageLabelView *)self clearTimer];
  v3.receiver = self;
  v3.super_class = (Class)MUPDFPageLabelView;
  [(MUPDFPageLabelView *)&v3 dealloc];
}

+ (id)sidebarAttributedString
{
  if (sidebarAttributedString_onceToken != -1) {
    dispatch_once(&sidebarAttributedString_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sidebarAttributedString__sidebarAttributedString;
  return v2;
}

void __45__MUPDFPageLabelView_sidebarAttributedString__block_invoke()
{
  v0 = (void *)MEMORY[0x263F1C370];
  v1 = [MEMORY[0x263F1C6B0] systemImageNamed:@"sidebar.squares.leading"];
  id v6 = [v0 textAttachmentWithImage:v1];

  v2 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v6];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:v2];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
  [v3 appendAttributedString:v4];

  v5 = (void *)sidebarAttributedString__sidebarAttributedString;
  sidebarAttributedString__sidebarAttributedString = (uint64_t)v3;
}

- (void)setText:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F089B8];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = +[MUPDFPageLabelView sidebarAttributedString];
  id v9 = (id)[v6 initWithAttributedString:v7];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5];
  [v9 appendAttributedString:v8];

  [(UILabel *)self->_label setAttributedText:v9];
  [(MUPDFPageLabelView *)self layoutIfNeeded];
}

- (BOOL)isTimerInstalled
{
  return self->_timer != 0;
}

- (double)_fadeOutDelay
{
  return 2.0;
}

- (double)_fadeOutDuration
{
  return 0.5;
}

- (void)showNowInSuperView:(id)a3 withText:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(UILabel *)self->_label setAlpha:0.4];
  [(UIVisualEffectView *)self->_blurView setEffect:self->_blurEffect];
  if (v6) {
    [(MUPDFPageLabelView *)self setText:v6];
  }
  id v7 = [(MUPDFPageLabelView *)self superview];

  if (v7 == v8) {
    [v8 bringSubviewToFront:self];
  }
  else {
    [v8 addSubview:self];
  }
  [(MUPDFPageLabelView *)self resetFadeOutTimer];
}

- (void)resetFadeOutTimer
{
  [(MUPDFPageLabelView *)self _fadeOutDelay];
  timer = self->_timer;
  if (timer)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:");
    uint64_t v4 = (NSTimer *)[(NSTimer *)timer setFireDate:v6];
    id v5 = (NSTimer *)v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFFA20], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_fadeOut, 0, 1);
    uint64_t v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_timer;
    self->_timer = v4;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)fadeOut
{
  if ([(MUPDFPageLabelView *)self isTimerInstalled])
  {
    objc_super v3 = (void *)MEMORY[0x263F1CB60];
    [(MUPDFPageLabelView *)self _fadeOutDuration];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __29__MUPDFPageLabelView_fadeOut__block_invoke;
    v5[3] = &unk_2649C2828;
    v5[4] = self;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __29__MUPDFPageLabelView_fadeOut__block_invoke_2;
    v4[3] = &unk_2649C2C30;
    v4[4] = self;
    objc_msgSend(v3, "animateWithDuration:animations:completion:", v5, v4);
  }
}

uint64_t __29__MUPDFPageLabelView_fadeOut__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:0.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 416);
  return [v2 setEffect:0];
}

uint64_t __29__MUPDFPageLabelView_fadeOut__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = *(void **)(a1 + 32);
  return [v2 clearTimer];
}

- (unint64_t)currentPageIndex
{
  return self->currentPageIndex;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
  self->currentPageIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end