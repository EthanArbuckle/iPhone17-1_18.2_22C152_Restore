@interface AXSBVoiceOverSwipeDetectorView
- (AXSBVoiceOverSwipeDetectorDelegate)delegate;
- (AXSBVoiceOverSwipeDetectorView)initWithFrame:(CGRect)a3;
- (void)_cancelVOSwipeActivation:(id)a3;
- (void)_swipeDetected:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation AXSBVoiceOverSwipeDetectorView

- (AXSBVoiceOverSwipeDetectorView)initWithFrame:(CGRect)a3
{
  v37.receiver = self;
  v37.super_class = (Class)AXSBVoiceOverSwipeDetectorView;
  v3 = -[AXSBVoiceOverSwipeDetectorView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] whiteColor];
    [(AXSBVoiceOverSwipeDetectorView *)v3 setBackgroundColor:v4];

    [(AXSBVoiceOverSwipeDetectorView *)v3 setAutoresizesSubviews:1];
    [(AXSBVoiceOverSwipeDetectorView *)v3 setMultipleTouchEnabled:1];
    id v5 = objc_alloc(MEMORY[0x263F82828]);
    v6 = [MEMORY[0x263F827E8] _defaultBackgroundGradient];
    v7 = (void *)[v5 initWithImage:v6];

    [(AXSBVoiceOverSwipeDetectorView *)v3 bounds];
    objc_msgSend(v7, "setFrame:");
    [v7 setAutoresizingMask:18];
    [(AXSBVoiceOverSwipeDetectorView *)v3 addSubview:v7];
    id v8 = objc_alloc(MEMORY[0x263F82E00]);
    [(AXSBVoiceOverSwipeDetectorView *)v3 bounds];
    v9 = objc_msgSend(v8, "initWithFrame:");
    [v9 setUserInteractionEnabled:1];
    [v9 setAutoresizingMask:18];
    v10 = (void *)MEMORY[0x263F825C8];
    v11 = [MEMORY[0x263F827E8] kitImageNamed:@"UITableViewTexture.png"];
    v12 = [v10 colorWithPatternImage:v11];
    [v9 setBackgroundColor:v12];

    [(AXSBVoiceOverSwipeDetectorView *)v3 addSubview:v9];
    v13 = (void *)[objc_alloc(MEMORY[0x263F82C38]) initWithTarget:v3 action:sel__swipeDetected_];
    [v13 setDelaysTouchesEnded:0];
    [v13 setCancelsTouchesInView:0];
    [v13 setNumberOfTouchesRequired:1];
    [v13 setDirection:4];
    [v9 addGestureRecognizer:v13];
    id v14 = objc_alloc(MEMORY[0x263F829A0]);
    [(AXSBVoiceOverSwipeDetectorView *)v3 frame];
    v15 = objc_msgSend(v14, "initWithFrame:", 0.0, 0.0);
    [v15 setAutoresizingMask:2];
    [(AXSBVoiceOverSwipeDetectorView *)v3 addSubview:v15];
    id v16 = objc_alloc(MEMORY[0x263F829C8]);
    v17 = SBAXLocalizedString(@"ask.sheet.option.VoiceOver.on");
    v18 = (void *)[v16 initWithTitle:v17];

    [v18 setHidesBackButton:1];
    v19 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v3 action:sel__cancelVOSwipeActivation_];
    [v18 setRightBarButtonItem:v19];
    [v15 pushNavigationItem:v18 animated:1];
    id v20 = objc_alloc(MEMORY[0x263F82828]);
    v21 = (void *)MEMORY[0x263F827E8];
    v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = [v21 imageNamed:@"activate-arrow" inBundle:v22];
    uint64_t v24 = [v20 initWithImage:v23];
    bgImageView = v3->_bgImageView;
    v3->_bgImageView = (UIImageView *)v24;

    [(AXSBVoiceOverSwipeDetectorView *)v3 addSubview:v3->_bgImageView];
    id v26 = objc_allocWithZone(MEMORY[0x263F828E0]);
    uint64_t v27 = objc_msgSend(v26, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v27;

    [(UILabel *)v3->_titleLabel setAutoresizingMask:45];
    v29 = [MEMORY[0x263F82760] boldSystemFontOfSize:20.0];
    [(UILabel *)v3->_titleLabel setFont:v29];

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    [(UILabel *)v3->_titleLabel setLineBreakMode:0];
    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    v30 = [MEMORY[0x263F825C8] colorWithRed:0.294117647 green:0.341176471 blue:0.435294118 alpha:1.0];
    [(UILabel *)v3->_titleLabel setTextColor:v30];

    v31 = [MEMORY[0x263F825C8] whiteColor];
    v32 = [v31 colorWithAlphaComponent:0.75];
    [(UILabel *)v3->_titleLabel setShadowColor:v32];

    -[UILabel setShadowOffset:](v3->_titleLabel, "setShadowOffset:", 0.0, 1.0);
    [(UILabel *)v3->_titleLabel setIsAccessibilityElement:0];
    v33 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v3->_titleLabel setBackgroundColor:v33];

    v34 = SBAXLocalizedString(@"SWIPE_TO_ENABLE");
    [(UILabel *)v3->_titleLabel setText:v34];

    [v9 addSubview:v3->_titleLabel];
    [(UILabel *)v3->_titleLabel sizeToFit];
    v35 = v3;
  }
  return v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->_swipeDetected = 0;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (self->_swipeDetected)
  {
    id v4 = [(AXSBVoiceOverSwipeDetectorView *)self delegate];
    [v4 swipeDetectorDetectedSwipe];
  }
}

- (void)_swipeDetected:(id)a3
{
  if ([a3 state] == 3) {
    self->_swipeDetected = 1;
  }
}

- (void)_cancelVOSwipeActivation:(id)a3
{
  id v3 = [(AXSBVoiceOverSwipeDetectorView *)self delegate];
  [v3 swipeDetectorCanceled];
}

- (void)layoutSubviews
{
  [(AXSBVoiceOverSwipeDetectorView *)self bounds];
  double v4 = v3;
  [(UIImageView *)self->_bgImageView frame];
  double v6 = v5;
  CGFloat v8 = v7;
  [(AXSBVoiceOverSwipeDetectorView *)self frame];
  BOOL v10 = v9 > 560.0;
  *(void *)&v14.origin.y = qword_226F029B0[v9 > 560.0];
  v14.origin.x = v4 * 0.5 - v6 * 0.5;
  v14.size.width = v6;
  v14.size.height = v8;
  CGRect v15 = CGRectIntegral(v14);
  -[UIImageView setFrame:](self->_bgImageView, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
  [(UILabel *)self->_titleLabel frame];
  v16.origin.y = 0.0;
  v16.origin.x = v4 * 0.05;
  v16.size.width = v4 * 0.9;
  CGRect v17 = CGRectIntegral(v16);
  double v11 = dbl_226F029C0[v10];
  titleLabel = self->_titleLabel;
  -[UILabel setFrame:](titleLabel, "setFrame:", v17.origin.x, v11, v17.size.width, v17.size.height);
}

- (AXSBVoiceOverSwipeDetectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXSBVoiceOverSwipeDetectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bgImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end