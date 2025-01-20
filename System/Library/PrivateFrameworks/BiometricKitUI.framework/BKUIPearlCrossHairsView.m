@interface BKUIPearlCrossHairsView
- (BKUIPearlCrossHairsView)initWithFrame:(CGRect)a3;
- (double)angleFromDirection:(unint64_t)a3;
- (void)_setPitch:(double)a3 yaw:(double)a4 animated:(BOOL)a5;
- (void)nudgeCrossHairsAtAngle:(double)a3 completion:(id)a4;
- (void)nudgeInDirection:(unint64_t)a3 smallNudgePeak:(id)a4 largeNudgePeak:(id)a5 completion:(id)a6;
- (void)setPitch:(double)a3 yaw:(double)a4;
@end

@implementation BKUIPearlCrossHairsView

- (BKUIPearlCrossHairsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v25.receiver = self;
  v25.super_class = (Class)BKUIPearlCrossHairsView;
  v7 = -[BKUIPearlCrossHairsView initWithFrame:](&v25, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    [(BKUIPearlCrossHairsView *)v7 setOpaque:0];
    v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    v10 = [(BKUIPearlCrossHairsView *)v8 layer];
    [v10 setCompositingFilter:v9];

    [(BKUIPearlCrossHairsView *)v8 setAutoresizesSubviews:1];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    v11 = (void (*)(void))getMTLCreateSystemDefaultDeviceSymbolLoc_ptr;
    v30 = getMTLCreateSystemDefaultDeviceSymbolLoc_ptr;
    if (!getMTLCreateSystemDefaultDeviceSymbolLoc_ptr)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __getMTLCreateSystemDefaultDeviceSymbolLoc_block_invoke;
      v26[3] = &unk_1E6EA23D0;
      v26[4] = &v27;
      __getMTLCreateSystemDefaultDeviceSymbolLoc_block_invoke((uint64_t)v26);
      v11 = (void (*)(void))v28[3];
    }
    _Block_object_dispose(&v27, 8);
    if (!v11)
    {
      BYFlowSkipIdentifierFaceID_cold_1 = (_Unwind_Exception *)getBYFlowSkipIdentifierFaceID_cold_1();
      _Block_object_dispose(&v27, 8);
      _Unwind_Resume(BYFlowSkipIdentifierFaceID_cold_1);
    }
    v12 = v11();
    v13 = -[BKUIPearlCrossHairsRenderingView initWithFrame:device:]([BKUIPearlCrossHairsRenderingView alloc], "initWithFrame:device:", v12, x, y, width, height);
    renderingView = v8->_renderingView;
    v8->_renderingView = v13;

    [(BKUIPearlCrossHairsRenderingView *)v8->_renderingView setAutoresizingMask:18];
    -[MTKView setClearColor:](v8->_renderingView, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
    [(MTKView *)v8->_renderingView setFramebufferOnly:0];
    [(BKUIPearlCrossHairsRenderingView *)v8->_renderingView setOpaque:0];
    [(BKUIPearlCrossHairsRenderingView *)v8->_renderingView setSampleCount:4];
    v15 = v8->_renderingView;
    v16 = [MEMORY[0x1E4F42D90] mainScreen];
    -[MTKView setPreferredFramesPerSecond:](v15, "setPreferredFramesPerSecond:", [v16 maximumFramesPerSecond]);

    [(BKUIPearlCrossHairsView *)v8 addSubview:v8->_renderingView];
    id v17 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v18 = (void *)MEMORY[0x1E4F42A80];
    v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v20 = [v18 imageNamed:@"Enrollment Hint Arrow" inBundle:v19];
    uint64_t v21 = [v17 initWithImage:v20];
    arrowView = v8->_arrowView;
    v8->_arrowView = (UIImageView *)v21;

    [(UIImageView *)v8->_arrowView setAlpha:0.0];
    [(BKUIPearlCrossHairsView *)v8 addSubview:v8->_arrowView];
  }
  return v8;
}

- (void)setPitch:(double)a3 yaw:(double)a4
{
}

- (void)_setPitch:(double)a3 yaw:(double)a4 animated:(BOOL)a5
{
  float v5 = a3;
  *(float *)&double v6 = v5;
  float v7 = a4;
  *((float *)&v6 + 1) = v7;
  [(BKUIPearlCrossHairsRenderingView *)self->_renderingView setAxis:a5 animated:v6];
}

- (double)angleFromDirection:(unint64_t)a3
{
  return (double)(int)a3 * 0.785398163;
}

- (void)nudgeCrossHairsAtAngle:(double)a3 completion:(id)a4
{
  id v6 = a4;
  [(BKUIPearlCrossHairsView *)self _setPitch:0 yaw:0.0 animated:0.0];
  [(BKUIPearlCrossHairsRenderingView *)self->_renderingView setGrayscale:1];
  [(BKUIPearlCrossHairsView *)self setAlpha:1.0];
  renderingView = self->_renderingView;
  CGAffineTransformMakeRotation(&v13, -a3);
  [(BKUIPearlCrossHairsRenderingView *)renderingView setTransform:&v13];
  [(BKUIPearlCrossHairsView *)self _setPitch:1 yaw:0.0 animated:0.261799388];
  dispatch_time_t v8 = dispatch_time(0, 500000000);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__BKUIPearlCrossHairsView_nudgeCrossHairsAtAngle_completion___block_invoke;
  v10[3] = &unk_1E6EA2F78;
  long long v12 = xmmword_1E4BD1AE0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v8, MEMORY[0x1E4F14428], v10);
}

void __61__BKUIPearlCrossHairsView_nudgeCrossHairsAtAngle_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setPitch:1 yaw:*(double *)(a1 + 48) * 0.5 animated:*(double *)(a1 + 56) * 0.5];
  dispatch_time_t v2 = dispatch_time(0, 250000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__BKUIPearlCrossHairsView_nudgeCrossHairsAtAngle_completion___block_invoke_2;
  v4[3] = &unk_1E6EA2F78;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = v3;
  dispatch_after(v2, MEMORY[0x1E4F14428], v4);
}

void __61__BKUIPearlCrossHairsView_nudgeCrossHairsAtAngle_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setPitch:1 yaw:*(double *)(a1 + 48) * 1.5 animated:*(double *)(a1 + 56) * 1.75];
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__BKUIPearlCrossHairsView_nudgeCrossHairsAtAngle_completion___block_invoke_3;
  v4[3] = &unk_1E6EA25E0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, MEMORY[0x1E4F14428], v4);
}

void __61__BKUIPearlCrossHairsView_nudgeCrossHairsAtAngle_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _setPitch:1 yaw:0.0 animated:0.0];
  dispatch_time_t v2 = dispatch_time(0, 600000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__BKUIPearlCrossHairsView_nudgeCrossHairsAtAngle_completion___block_invoke_4;
  v4[3] = &unk_1E6EA25E0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, MEMORY[0x1E4F14428], v4);
}

uint64_t __61__BKUIPearlCrossHairsView_nudgeCrossHairsAtAngle_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 408) setGrayscale:0];
  dispatch_time_t v2 = *(void **)(*(void *)(a1 + 32) + 408);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)nudgeInDirection:(unint64_t)a3 smallNudgePeak:(id)a4 largeNudgePeak:(id)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  CGAffineTransform v13 = _BKUILoggingFacility();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v29 = a3;
    _os_log_impl(&dword_1E4B6C000, v13, OS_LOG_TYPE_DEFAULT, "Nudging in direction %i", buf, 8u);
  }

  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  dispatch_group_enter(v14);
  uint64_t v15 = MEMORY[0x1E4F42FF0];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke;
  v27[3] = &unk_1E6EA20C0;
  v27[4] = self;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_2;
  v22[3] = &unk_1E6EA3068;
  id v25 = v11;
  unint64_t v26 = a3;
  v22[4] = self;
  v23 = v14;
  id v24 = v10;
  id v16 = v11;
  id v17 = v10;
  v18 = v14;
  +[UIView bkui_animateWithDuration:animations:completion:](0.3, v15, v27, v22);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_15;
  v20[3] = &unk_1E6EA25E0;
  v20[4] = self;
  id v21 = v12;
  id v19 = v12;
  dispatch_group_notify(v18, MEMORY[0x1E4F14428], v20);
}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:0.0];
}

void __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:1.0];
  [*(id *)(a1 + 32) angleFromDirection:*(void *)(a1 + 64)];
  double v3 = v2;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_3;
  v27[3] = &unk_1E6EA20C0;
  v4 = *(void **)(a1 + 32);
  id v28 = *(id *)(a1 + 40);
  [v4 nudgeCrossHairsAtAngle:v27 completion:v3];
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformMakeRotation(&v26, -v3);
  id v5 = *(void **)(*(void *)(a1 + 32) + 416);
  CGAffineTransform v25 = v26;
  [v5 setTransform:&v25];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_4;
  aBlock[3] = &unk_1E6EA2FA0;
  aBlock[4] = *(void *)(a1 + 32);
  CGAffineTransform v24 = v26;
  long long v6 = (void (**)(void, double, double))_Block_copy(aBlock);
  [*(id *)(a1 + 32) bounds];
  double v8 = v7;
  [*(id *)(a1 + 32) bounds];
  if (v8 != v9) {
    __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_2_cold_1();
  }
  id v10 = *(void **)(*(void *)(a1 + 32) + 416);
  v6[2](v6, v8 * 0.375, v8 * 0.5);
  objc_msgSend(v10, "setCenter:");
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_5;
  v22[3] = &unk_1E6EA20C0;
  v22[4] = *(void *)(a1 + 32);
  +[UIView bkui_animateWithDuration:animations:](0.3, MEMORY[0x1E4F42FF0], v22);
  uint64_t v11 = MEMORY[0x1E4F42FF0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_6;
  v19[3] = &unk_1E6EA2FC8;
  v19[4] = *(void *)(a1 + 32);
  v20 = v6;
  double v21 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_7;
  v13[3] = &unk_1E6EA3040;
  v13[4] = *(void *)(a1 + 32);
  id v15 = v20;
  double v18 = v8;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  id v12 = v20;
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.5, 0.0, v11, 0x20000, v19, v13);
}

void __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_3(uint64_t a1)
{
}

double __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_4(uint64_t a1, double a2, double a3)
{
  memset(&v15, 0, sizeof(v15));
  [*(id *)(a1 + 32) bounds];
  CGFloat v4 = -CGRectGetMidX(v16);
  [*(id *)(a1 + 32) bounds];
  CGFloat MidY = CGRectGetMidY(v17);
  CGAffineTransformMakeTranslation(&v15, v4, -MidY);
  memset(&v14, 0, sizeof(v14));
  CGAffineTransform v13 = v15;
  CGAffineTransformInvert(&v14, &v13);
  memset(&v13, 0, sizeof(v13));
  CGAffineTransform t1 = v15;
  long long v6 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&t2.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)(a1 + 72);
  CGAffineTransformConcat(&v12, &t1, &t2);
  CGAffineTransform t1 = v14;
  CGAffineTransformConcat(&v13, &v12, &t1);
  *(void *)&double result = *(_OWORD *)&vaddq_f64(*(float64x2_t *)&v13.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v13.c, a3), *(float64x2_t *)&v13.a, a2));
  return result;
}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.5];
}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_6(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 416);
  (*(void (**)(void, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(double *)(a1 + 48) * 0.5, *(double *)(a1 + 48) * 0.5);
  return objc_msgSend(v1, "setCenter:");
}

void __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4F42FF0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_8;
  v8[3] = &unk_1E6EA2FF0;
  v8[4] = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 72);
  id v10 = *(id *)(a1 + 56);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_9;
  v3[3] = &unk_1E6EA3018;
  v3[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 72);
  id v6 = *(id *)(a1 + 64);
  id v4 = *(id *)(a1 + 40);
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.25, 0.0, v2, 0, v8, v3);
}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 416);
  (*(void (**)(double, double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 56) * 7.0 * 0.0625, *(double *)(a1 + 56) * 0.5);
  objc_msgSend(v2, "setCenter:");
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4F42FF0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_10;
  v8[3] = &unk_1E6EA2FC8;
  v8[4] = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 64);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_11;
  v3[3] = &unk_1E6EA3018;
  v3[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.35, 0.0, v2, 0, v8, v3);
}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_10(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 416);
  (*(void (**)(void, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(double *)(a1 + 48) * 5.0 * 0.125, *(double *)(a1 + 48) * 0.5);
  return objc_msgSend(v1, "setCenter:");
}

void __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_11(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4F42FF0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_12;
  _OWORD v5[3] = &unk_1E6EA2FF0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 56);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_14;
  v3[3] = &unk_1E6EA2108;
  id v4 = *(id *)(a1 + 40);
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.75, 0.0, v2, 0, v5, v3);
}

void __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_12(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 416);
  (*(void (**)(double, double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 56) * 0.375, *(double *)(a1 + 56) * 0.5);
  objc_msgSend(v2, "setCenter:");
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_13;
  v4[3] = &unk_1E6EA20C0;
  v4[4] = *(void *)(a1 + 32);
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.2, 0.5, MEMORY[0x1E4F42FF0], 0, v4, 0);
}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_13(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.0];
}

void __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_14(uint64_t a1)
{
}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_15(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_16;
  v4[3] = &unk_1E6EA20C0;
  uint64_t v5 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_17;
  v3[3] = &unk_1E6EA2108;
  void v3[4] = v5;
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.2, 0.5, MEMORY[0x1E4F42FF0], 0, v4, v3);
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_17(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:1.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrowView, 0);
  objc_storeStrong((id *)&self->_renderingView, 0);
}

void __85__BKUIPearlCrossHairsView_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion___block_invoke_2_cold_1()
{
  __assert_rtn("-[BKUIPearlCrossHairsView nudgeInDirection:smallNudgePeak:largeNudgePeak:completion:]_block_invoke_2", "BKUIPearlCrossHairsView.m", 142, "sideLength == self.bounds.size.height");
}

@end