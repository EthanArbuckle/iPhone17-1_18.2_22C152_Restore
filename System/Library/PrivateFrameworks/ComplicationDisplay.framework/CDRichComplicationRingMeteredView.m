@interface CDRichComplicationRingMeteredView
+ (BOOL)isXL;
- (id)customizeMeterLayerBlock;
@end

@implementation CDRichComplicationRingMeteredView

+ (BOOL)isXL
{
  return 0;
}

- (id)customizeMeterLayerBlock
{
  v3 = [MEMORY[0x263EFD180] currentDevice];
  int v4 = [(id)objc_opt_class() isXL];
  id v5 = v3;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_0);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_0);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    id v8 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_0);
    if (v8 == v5)
    {
      uint64_t v9 = [v5 version];
      uint64_t v10 = _LayoutConstants___previousCLKDeviceVersion_0;

      if (v9 == v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v11 = objc_storeWeak(&_LayoutConstants___cachedDevice_0, v5);
  _LayoutConstants___previousCLKDeviceVersion_0 = [v5 version];

  ___LayoutConstants_block_invoke_0(v12, v5);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_0);
  long long v20 = _LayoutConstants___constants;
  long long v21 = *(_OWORD *)&qword_267D2C4B0;
  long long v22 = xmmword_267D2C4C0;
  if (v4)
  {
    long long v20 = _LayoutConstants___constantsXL;
    long long v21 = xmmword_267D2C4E0;
    long long v22 = xmmword_267D2C4F0;
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  long long v17 = v20;
  long long v18 = v21;
  aBlock[2] = __61__CDRichComplicationRingMeteredView_customizeMeterLayerBlock__block_invoke;
  aBlock[3] = &unk_2644A5150;
  long long v19 = v22;
  aBlock[4] = self;
  v13 = _Block_copy(aBlock);
  v14 = _Block_copy(v13);

  return v14;
}

void __61__CDRichComplicationRingMeteredView_customizeMeterLayerBlock__block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, int a5)
{
  double v6 = *(double *)(a1 + 56);
  if (a5) {
    double v6 = v6 + *(double *)(a1 + 64);
  }
  double v7 = *(double *)(a1 + 80) + a3;
  double v9 = *(double *)(a1 + 40);
  double v8 = *(double *)(a1 + 48);
  CGFloat v10 = v8 * -0.5;
  CGFloat v11 = v6 * 0.5;
  CGFloat v12 = v9 * -0.5;
  CGFloat v13 = v6 * -0.5;
  CGFloat v14 = v9 * 0.5;
  CGFloat v15 = v8 * 0.5;
  id v16 = a2;
  Mutable = CGPathCreateMutable();
  memset(&m, 0, sizeof(m));
  *(float *)&double v7 = v7;
  [*(id *)(a1 + 32) rotationAngleAtProgress:COERCE_DOUBLE((unint64_t)LODWORD(v7))];
  long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v21.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v21.c = v18;
  *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGAffineTransformRotate(&m, &v21, v19);
  CGPathMoveToPoint(Mutable, &m, 0.0, v11);
  CGPathAddArcToPoint(Mutable, &m, v10, v11, v12, v13, *(CGFloat *)(a1 + 72));
  CGPathAddArcToPoint(Mutable, &m, v12, v13, v14, v13, *(CGFloat *)(a1 + 72));
  CGPathAddArcToPoint(Mutable, &m, v14, v13, v15, v11, *(CGFloat *)(a1 + 72));
  CGPathAddArcToPoint(Mutable, &m, v15, v11, v10, v11, *(CGFloat *)(a1 + 72));
  CGPathCloseSubpath(Mutable);
  [v16 setPath:Mutable];
  CGPathRelease(Mutable);
  LODWORD(v20) = LODWORD(v7);
  [*(id *)(a1 + 32) pointAtProgress:v20];
  objc_msgSend(v16, "setPosition:");
}

@end