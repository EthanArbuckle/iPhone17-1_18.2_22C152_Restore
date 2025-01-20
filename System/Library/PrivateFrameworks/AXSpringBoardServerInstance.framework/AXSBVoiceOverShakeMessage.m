@interface AXSBVoiceOverShakeMessage
- (AXSBVoiceOverShakeMessage)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)orientationChange;
- (void)reorientHUDIfNeeded:(BOOL)a3;
@end

@implementation AXSBVoiceOverShakeMessage

- (AXSBVoiceOverShakeMessage)initWithFrame:(CGRect)a3
{
  v4 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  v29.receiver = self;
  v29.super_class = (Class)AXSBVoiceOverShakeMessage;
  v9 = -[AXSBVoiceOverShakeMessage initWithFrame:](&v29, sel_initWithFrame_, (v6 + -160.0) * 0.5, v8 + -160.0, 160.0, 160.0);
  if (v9)
  {
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), "initWithFrame:", 20.0, 5.0, 120.0, 150.0);
    [v10 setClipsToBounds:1];
    [(AXSBVoiceOverShakeMessage *)v9 addSubview:v10];
    id v11 = objc_alloc(MEMORY[0x263F828E0]);
    [v10 bounds];
    v12 = objc_msgSend(v11, "initWithFrame:");
    [v12 setNumberOfLines:0];
    v13 = UISystemFontBoldForSize();
    [v12 setFont:v13];

    v14 = [MEMORY[0x263F825C8] clearColor];
    [v12 setBackgroundColor:v14];

    v15 = [MEMORY[0x263F825C8] whiteColor];
    [v12 setTextColor:v15];

    [v12 setTextAlignment:1];
    v16 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    [v12 setShadowColor:v16];

    objc_msgSend(v12, "setShadowOffset:", 1.0, 1.0);
    v17 = SBAXLocalizedString(@"SHAKE_TO_ENABLE");
    [v12 setText:v17];

    [v10 addSubview:v12];
    [v12 sizeToFit];
    [v12 frame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    [v10 frame];
    objc_msgSend(v12, "setFrame:", v19, v24 * 0.5 - v23 * 0.5, v21, v23);
    v25 = [MEMORY[0x263F825C8] clearColor];
    [(AXSBVoiceOverShakeMessage *)v9 setBackgroundColor:v25];

    [(AXSBVoiceOverShakeMessage *)v9 setAlpha:0.0];
    v26 = [MEMORY[0x263F08A00] defaultCenter];
    [v26 addObserver:v9 selector:sel_orientationChange name:@"AXSBServerOrientationChange" object:0];

    [(AXSBVoiceOverShakeMessage *)v9 setClipsToBounds:1];
    [(AXSBVoiceOverShakeMessage *)v9 reorientHUDIfNeeded:0];
    v27 = v9;
  }
  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXSBVoiceOverShakeMessage;
  [(AXSBVoiceOverShakeMessage *)&v4 dealloc];
}

- (void)orientationChange
{
}

- (void)reorientHUDIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v6 = [v5 safeIntegerForKey:@"activeInterfaceOrientation"];

  uint64_t v7 = v6 - 1;
  int v8 = 0;
  int v9 = 0;
  if ((unint64_t)(v6 - 1) <= 3)
  {
    int v8 = dword_226F02960[v7];
    int v9 = dword_226F02970[v7];
  }
  double v10 = 0.3;
  v11[1] = 3221225472;
  v11[0] = MEMORY[0x263EF8330];
  v11[2] = __49__AXSBVoiceOverShakeMessage_reorientHUDIfNeeded___block_invoke;
  v11[3] = &unk_2647F0700;
  if (!v3) {
    double v10 = 0.0;
  }
  v11[4] = self;
  int v12 = v8;
  int v13 = v9;
  [MEMORY[0x263F82E00] animateWithDuration:v11 animations:v10];
}

uint64_t __49__AXSBVoiceOverShakeMessage_reorientHUDIfNeeded___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v17.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v17.c = v2;
  *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  BOOL v3 = *(void **)(a1 + 32);
  *(_OWORD *)&v16.a = *(_OWORD *)&v17.a;
  *(_OWORD *)&v16.c = v2;
  *(_OWORD *)&v16.tx = *(_OWORD *)&v17.tx;
  [v3 setTransform:&v16];
  [*(id *)(a1 + 32) frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = *(float *)(a1 + 40);
  id v11 = [MEMORY[0x263F82B60] mainScreen];
  [v11 bounds];
  double v13 = (v12 - v9) * 0.5 + v10;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v5, v13, v7, v9);
  CGAffineTransformMakeRotation(&v17, *(float *)(a1 + 44) * 3.14159265 / 180.0);
  CGAffineTransform v15 = v17;
  UIIntegralTransform();
  CGAffineTransform v17 = v16;
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", &v16, *(_OWORD *)&v15.a, *(_OWORD *)&v15.c, *(_OWORD *)&v15.tx);
}

- (void)drawRect:(CGRect)a3
{
  CGRect v6 = CGRectInset(a3, 10.0, 10.0);
  objc_msgSend(MEMORY[0x263F824C0], "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, v6.origin.x, v6.origin.y, v6.size.width, v6.size.height, 10.0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.65];
  [v3 setFill];

  [v4 fill];
}

@end