@interface CSMagSafeAccessoryWalletView
- (CABackdropLayer)averageColorBackdropLayer;
- (CABackdropLayer)backgroundBackdropLayer;
- (CABackdropLayer)backgroundRadiusBackdropLayer;
- (CABackdropLayer)trackRingBlurBackdropLayer;
- (CALayer)walletLayer;
- (CSMagSafeAccessoryConfiguration)configuration;
- (CSMagSafeAccessoryWalletView)initWithFrame:(CGRect)a3;
- (CSMagSafeSilhouetteConfiguration)silhouette;
- (CSRingLayer)trackRing;
- (CSRingLayer)trackRingBlurLayer;
- (double)animationDurationBeforeDismissal;
- (void)_dismissAnimation;
- (void)_presentAnimation;
- (void)_runAnimationWithType:(unint64_t)a3;
- (void)layoutSubviews;
- (void)performAnimation:(unint64_t)a3 completionHandler:(id)a4;
- (void)setAverageColorBackdropLayer:(id)a3;
- (void)setBackgroundBackdropLayer:(id)a3;
- (void)setBackgroundRadiusBackdropLayer:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setSilhouette:(id)a3;
- (void)setTrackRing:(id)a3;
- (void)setTrackRingBlurBackdropLayer:(id)a3;
- (void)setTrackRingBlurLayer:(id)a3;
- (void)setWalletLayer:(id)a3;
@end

@implementation CSMagSafeAccessoryWalletView

- (CSMagSafeAccessoryWalletView)initWithFrame:(CGRect)a3
{
  v599[1] = *MEMORY[0x1E4F143B8];
  v598.receiver = self;
  v598.super_class = (Class)CSMagSafeAccessoryWalletView;
  v3 = -[CSMagSafeAccessoryView initWithFrame:](&v598, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  if (!v3) {
    goto LABEL_688;
  }
  v4 = [(CSMagSafeAccessoryWalletView *)v3 layer];
  [v4 setAllowsGroupBlending:0];

  if ([(CSMagSafeAccessoryView *)v3 isReduceTransparencyEnabled])
  {
    uint64_t v5 = [MEMORY[0x1E4F39B40] layer];
    averageColorBackdropLayer = v3->_averageColorBackdropLayer;
    v3->_averageColorBackdropLayer = (CABackdropLayer *)v5;

    [(CABackdropLayer *)v3->_averageColorBackdropLayer setOpacity:0.0];
    v7 = v3->_averageColorBackdropLayer;
    v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F39FD0]];
    v599[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v599 count:1];
    [(CABackdropLayer *)v7 setFilters:v9];

    [(CABackdropLayer *)v3->_averageColorBackdropLayer setScale:100.0];
    [(CABackdropLayer *)v3->_averageColorBackdropLayer setAllowsGroupOpacity:1];
    [(CABackdropLayer *)v3->_averageColorBackdropLayer setAllowsGroupBlending:1];
    [(CABackdropLayer *)v3->_averageColorBackdropLayer setAllowsEdgeAntialiasing:1];
  }
  uint64_t v10 = [MEMORY[0x1E4F39B40] backdropLayerWithGaussianBlurRadius:0.0 brightnessAmount:0.0 saturationAmount:1.0];
  backgroundBackdropLayer = v3->_backgroundBackdropLayer;
  v3->_backgroundBackdropLayer = (CABackdropLayer *)v10;

  v12 = v3->_backgroundBackdropLayer;
  uint64_t v13 = *MEMORY[0x1E4F3A2B8];
  v14 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2B8]];
  [(CABackdropLayer *)v12 setCompositingFilter:v14];

  LODWORD(v15) = 1.0;
  [(CABackdropLayer *)v3->_backgroundBackdropLayer setOpacity:v15];
  if ([(CSMagSafeAccessoryView *)v3 isReduceMotionEnabled])
  {
    uint64_t v16 = [MEMORY[0x1E4F39B40] backdropLayerWithGaussianBlurRadius:60.0 brightnessAmount:0.0 saturationAmount:1.0];
    backgroundRadiusBackdropLayer = v3->_backgroundRadiusBackdropLayer;
    v3->_backgroundRadiusBackdropLayer = (CABackdropLayer *)v16;

    v18 = v3->_backgroundRadiusBackdropLayer;
    v19 = [MEMORY[0x1E4F39BC0] filterWithType:v13];
    [(CABackdropLayer *)v18 setCompositingFilter:v19];

    [(CABackdropLayer *)v3->_backgroundRadiusBackdropLayer setOpacity:0.0];
  }
  uint64_t v20 = [MEMORY[0x1E4F39B40] backdropLayerWithGaussianBlurRadius:45.0 brightnessAmount:0.15 saturationAmount:1.3];
  trackRingBlurBackdropLayer = v3->_trackRingBlurBackdropLayer;
  v3->_trackRingBlurBackdropLayer = (CABackdropLayer *)v20;

  v22 = v3->_trackRingBlurBackdropLayer;
  v23 = [MEMORY[0x1E4F39BC0] filterWithType:v13];
  [(CABackdropLayer *)v22 setCompositingFilter:v23];

  v24 = [(CSMagSafeAccessoryWalletView *)v3 configuration];
  v25 = [v24 ring];
  [v25 ringDiameter];
  double v27 = v26;
  v28 = [(CSMagSafeAccessoryWalletView *)v3 configuration];
  uint64_t v29 = [v28 ring];
  [(id)v29 lineWidth];
  uint64_t v31 = +[CSRingLayer ringLayerWithBlendMode:v13 diameter:v27 lineWidth:v30 brightnessAmount:0.1 saturationAmount:1.25];
  trackRingBlurLayer = v3->_trackRingBlurLayer;
  v3->_trackRingBlurLayer = (CSRingLayer *)v31;

  v33 = v3->_trackRingBlurLayer;
  id v34 = [MEMORY[0x1E4F428B8] whiteColor];
  -[CSRingLayer setStrokeColor:](v33, "setStrokeColor:", [v34 CGColor]);

  [(CABackdropLayer *)v3->_trackRingBlurBackdropLayer setMask:v3->_trackRingBlurLayer];
  int v35 = __sb__runningInSpringBoard();
  if (v35)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      unint64_t v596 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v491 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v491 userInterfaceIdiom] != 1)
    {
      unint64_t v596 = 0x100000000;
      goto LABEL_15;
    }
  }
  HIDWORD(v596) = v35 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v36 = __sb__runningInSpringBoard();
    if (v36)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v498 = [MEMORY[0x1E4F42D90] mainScreen];
      [v498 _referenceBounds];
    }
    BSSizeRoundForScale();
    LODWORD(v596) = v36 ^ 1;
    if (v51 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v50 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v499 = 0;
      uint64_t v500 = 0;
      LODWORD(v501) = 0;
      LODWORD(v502) = 0;
      LODWORD(v505) = 0;
      LODWORD(v506) = 0;
      LODWORD(v507) = 0;
      LODWORD(v509) = 0;
      LODWORD(v513) = 0;
      LODWORD(v514) = 0;
      LODWORD(v515) = 0;
      LODWORD(v520) = 0;
      LODWORD(v529) = 0;
      LODWORD(v521) = 0;
      LODWORD(v522) = 0;
      LODWORD(v523) = 0;
      LODWORD(v530) = 0;
      LODWORD(v531) = 0;
      LODWORD(v532) = 0;
      LODWORD(v541) = 0;
      LODWORD(v542) = 0;
      LODWORD(v533) = 0;
      LODWORD(v536) = 0;
      int v551 = 0;
      uint64_t v554 = 0;
      LODWORD(v537) = 0;
      LODWORD(v543) = 0;
      uint64_t v557 = 0;
      LODWORD(v544) = 0;
      int v569 = 0;
      uint64_t v570 = 0;
      uint64_t v573 = 0;
      int v582 = 0;
      uint64_t v583 = 0;
      memset((char *)&v595[3] + 4, 0, 44);
      double v46 = 0.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v596) = 0;
  }
LABEL_15:
  int v37 = __sb__runningInSpringBoard();
  if (v37)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v595[8] = 0;
      goto LABEL_24;
    }
  }
  else
  {
    v489 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v489 userInterfaceIdiom] != 1)
    {
      v595[8] = 0x100000000;
      goto LABEL_24;
    }
  }
  HIDWORD(v595[8]) = v37 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v38 = __sb__runningInSpringBoard();
    if (v38)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v472 = [MEMORY[0x1E4F42D90] mainScreen];
      [v472 _referenceBounds];
    }
    LODWORD(v595[8]) = v38 ^ 1;
    BSSizeRoundForScale();
    if (v52 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      int v499 = 0;
      uint64_t v500 = 0;
      LODWORD(v501) = 0;
      LODWORD(v502) = 0;
      LODWORD(v505) = 0;
      LODWORD(v506) = 0;
      LODWORD(v507) = 0;
      LODWORD(v509) = 0;
      LODWORD(v513) = 0;
      LODWORD(v514) = 0;
      LODWORD(v515) = 0;
      LODWORD(v520) = 0;
      LODWORD(v529) = 0;
      LODWORD(v521) = 0;
      LODWORD(v522) = 0;
      LODWORD(v523) = 0;
      LODWORD(v530) = 0;
      LODWORD(v531) = 0;
      LODWORD(v532) = 0;
      LODWORD(v541) = 0;
      LODWORD(v542) = 0;
      LODWORD(v533) = 0;
      LODWORD(v536) = 0;
      int v551 = 0;
      uint64_t v554 = 0;
      LODWORD(v537) = 0;
      LODWORD(v543) = 0;
      uint64_t v557 = 0;
      LODWORD(v544) = 0;
      int v569 = 0;
      uint64_t v570 = 0;
      uint64_t v573 = 0;
      int v582 = 0;
      uint64_t v583 = 0;
      memset((char *)&v595[3] + 4, 0, 36);
      double v46 = 0.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v595[8]) = 0;
  }
LABEL_24:
  int v39 = __sb__runningInSpringBoard();
  if (v39)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v595[7] = 0;
      goto LABEL_33;
    }
  }
  else
  {
    v487 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v487 userInterfaceIdiom] != 1)
    {
      v595[7] = 0x100000000;
      goto LABEL_33;
    }
  }
  HIDWORD(v595[7]) = v39 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v40 = __sb__runningInSpringBoard();
    if (v40)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v470 = [MEMORY[0x1E4F42D90] mainScreen];
      [v470 _referenceBounds];
    }
    LODWORD(v595[7]) = v40 ^ 1;
    BSSizeRoundForScale();
    if (v53 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      int v499 = 0;
      uint64_t v500 = 0;
      LODWORD(v501) = 0;
      LODWORD(v502) = 0;
      LODWORD(v505) = 0;
      LODWORD(v506) = 0;
      LODWORD(v507) = 0;
      LODWORD(v509) = 0;
      LODWORD(v513) = 0;
      LODWORD(v514) = 0;
      LODWORD(v515) = 0;
      LODWORD(v520) = 0;
      LODWORD(v529) = 0;
      LODWORD(v521) = 0;
      LODWORD(v522) = 0;
      LODWORD(v523) = 0;
      LODWORD(v530) = 0;
      LODWORD(v531) = 0;
      LODWORD(v532) = 0;
      LODWORD(v541) = 0;
      LODWORD(v542) = 0;
      LODWORD(v533) = 0;
      LODWORD(v536) = 0;
      int v551 = 0;
      uint64_t v554 = 0;
      LODWORD(v537) = 0;
      LODWORD(v543) = 0;
      uint64_t v557 = 0;
      LODWORD(v544) = 0;
      int v569 = 0;
      uint64_t v570 = 0;
      uint64_t v573 = 0;
      int v582 = 0;
      uint64_t v583 = 0;
      memset((char *)&v595[3] + 4, 0, 28);
      double v46 = 0.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v595[7]) = 0;
  }
LABEL_33:
  int v41 = __sb__runningInSpringBoard();
  if (v41)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v595[6] = 0;
      goto LABEL_42;
    }
  }
  else
  {
    v485 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v485 userInterfaceIdiom] != 1)
    {
      v595[6] = 0x100000000;
      goto LABEL_42;
    }
  }
  HIDWORD(v595[6]) = v41 ^ 1;
  int v42 = __sb__runningInSpringBoard();
  if (v42)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v479 = [MEMORY[0x1E4F42D90] mainScreen];
    [v479 _referenceBounds];
  }
  LODWORD(v595[6]) = v42 ^ 1;
  BSSizeRoundForScale();
  if (v43 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v499 = 0;
    uint64_t v500 = 0;
    LODWORD(v501) = 0;
    LODWORD(v502) = 0;
    LODWORD(v505) = 0;
    LODWORD(v506) = 0;
    LODWORD(v507) = 0;
    LODWORD(v509) = 0;
    LODWORD(v513) = 0;
    LODWORD(v514) = 0;
    LODWORD(v515) = 0;
    LODWORD(v520) = 0;
    LODWORD(v529) = 0;
    LODWORD(v521) = 0;
    LODWORD(v522) = 0;
    LODWORD(v523) = 0;
    LODWORD(v530) = 0;
    LODWORD(v531) = 0;
    LODWORD(v532) = 0;
    LODWORD(v541) = 0;
    LODWORD(v542) = 0;
    LODWORD(v533) = 0;
    LODWORD(v536) = 0;
    int v551 = 0;
    uint64_t v554 = 0;
    LODWORD(v537) = 0;
    LODWORD(v543) = 0;
    uint64_t v557 = 0;
    LODWORD(v544) = 0;
    int v569 = 0;
    uint64_t v570 = 0;
    uint64_t v573 = 0;
    int v582 = 0;
    uint64_t v583 = 0;
    memset((char *)&v595[3] + 4, 0, 20);
    double v46 = 0.0;
    goto LABEL_69;
  }
LABEL_42:
  int v44 = __sb__runningInSpringBoard();
  if (v44)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v595[5] = 0;
      goto LABEL_52;
    }
  }
  else
  {
    v483 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v483 userInterfaceIdiom] != 1)
    {
      v595[5] = 0x100000000;
      goto LABEL_52;
    }
  }
  HIDWORD(v595[5]) = v44 ^ 1;
  int v45 = __sb__runningInSpringBoard();
  if (v45)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v475 = [MEMORY[0x1E4F42D90] mainScreen];
    [v475 _referenceBounds];
  }
  LODWORD(v595[5]) = v45 ^ 1;
  BSSizeRoundForScale();
  if (v47 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    int v499 = 0;
    uint64_t v500 = 0;
    LODWORD(v501) = 0;
    LODWORD(v502) = 0;
    LODWORD(v505) = 0;
    LODWORD(v506) = 0;
    LODWORD(v507) = 0;
    LODWORD(v509) = 0;
    LODWORD(v513) = 0;
    LODWORD(v514) = 0;
    LODWORD(v515) = 0;
    LODWORD(v520) = 0;
    LODWORD(v529) = 0;
    LODWORD(v521) = 0;
    LODWORD(v522) = 0;
    LODWORD(v523) = 0;
    LODWORD(v530) = 0;
    LODWORD(v531) = 0;
    LODWORD(v532) = 0;
    LODWORD(v541) = 0;
    LODWORD(v542) = 0;
    LODWORD(v533) = 0;
    LODWORD(v536) = 0;
    int v551 = 0;
    uint64_t v554 = 0;
    LODWORD(v537) = 0;
    LODWORD(v543) = 0;
    uint64_t v557 = 0;
    LODWORD(v544) = 0;
    int v569 = 0;
    uint64_t v570 = 0;
    uint64_t v573 = 0;
    int v582 = 0;
    uint64_t v583 = 0;
    *(void *)((char *)&v595[3] + 4) = 0;
    HIDWORD(v595[4]) = 0;
    double v46 = 0.0;
    goto LABEL_69;
  }
LABEL_52:
  int v48 = __sb__runningInSpringBoard();
  if (v48)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v595[4] = 0;
      goto LABEL_692;
    }
  }
  else
  {
    v481 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v481 userInterfaceIdiom] != 1)
    {
      v595[4] = 0x100000000;
      goto LABEL_692;
    }
  }
  HIDWORD(v595[4]) = v48 ^ 1;
  int v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v468 = [MEMORY[0x1E4F42D90] mainScreen];
    [v468 _referenceBounds];
  }
  LODWORD(v595[4]) = v49 ^ 1;
  BSSizeRoundForScale();
  if (v170 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    int v499 = 0;
    uint64_t v500 = 0;
    LODWORD(v501) = 0;
    LODWORD(v502) = 0;
    LODWORD(v505) = 0;
    LODWORD(v506) = 0;
    LODWORD(v507) = 0;
    LODWORD(v509) = 0;
    LODWORD(v513) = 0;
    LODWORD(v514) = 0;
    LODWORD(v515) = 0;
    LODWORD(v520) = 0;
    LODWORD(v529) = 0;
    LODWORD(v521) = 0;
    LODWORD(v522) = 0;
    LODWORD(v523) = 0;
    LODWORD(v530) = 0;
    LODWORD(v531) = 0;
    LODWORD(v532) = 0;
    LODWORD(v541) = 0;
    LODWORD(v542) = 0;
    LODWORD(v533) = 0;
    LODWORD(v536) = 0;
    int v551 = 0;
    uint64_t v554 = 0;
    LODWORD(v537) = 0;
    LODWORD(v543) = 0;
    uint64_t v557 = 0;
    LODWORD(v544) = 0;
    int v569 = 0;
    uint64_t v570 = 0;
    uint64_t v573 = 0;
    int v582 = 0;
    uint64_t v583 = 0;
    HIDWORD(v595[3]) = 0;
    double v46 = 0.0;
    goto LABEL_69;
  }
LABEL_692:
  int v171 = __sb__runningInSpringBoard();
  if (v171)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_694;
    }
LABEL_700:
    int v499 = 0;
    uint64_t v500 = 0;
    LODWORD(v501) = 0;
    LODWORD(v502) = 0;
    LODWORD(v505) = 0;
    LODWORD(v506) = 0;
    LODWORD(v507) = 0;
    LODWORD(v509) = 0;
    LODWORD(v513) = 0;
    LODWORD(v514) = 0;
    LODWORD(v515) = 0;
    LODWORD(v520) = 0;
    LODWORD(v529) = 0;
    LODWORD(v521) = 0;
    LODWORD(v522) = 0;
    LODWORD(v523) = 0;
    LODWORD(v530) = 0;
    LODWORD(v531) = 0;
    LODWORD(v532) = 0;
    LODWORD(v541) = 0;
    LODWORD(v542) = 0;
    LODWORD(v533) = 0;
    LODWORD(v536) = 0;
    int v551 = 0;
    uint64_t v554 = 0;
    LODWORD(v537) = 0;
    LODWORD(v543) = 0;
    uint64_t v557 = 0;
    LODWORD(v544) = 0;
    int v569 = 0;
    uint64_t v570 = 0;
    uint64_t v573 = 0;
    int v582 = 0;
    uint64_t v583 = 0;
    double v46 = 0.0;
    HIDWORD(v595[3]) = v171 ^ 1;
    goto LABEL_69;
  }
  v477 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v477 userInterfaceIdiom] == 1) {
    goto LABEL_700;
  }
LABEL_694:
  HIDWORD(v595[3]) = v171 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_698:
    uint64_t v583 = 0;
    goto LABEL_753;
  }
  int v172 = __sb__runningInSpringBoard();
  if (v172)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_698;
    }
  }
  else
  {
    v464 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v464 userInterfaceIdiom])
    {
      uint64_t v583 = 0x100000000;
      goto LABEL_753;
    }
  }
  HIDWORD(v583) = v172 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v181 = __sb__runningInSpringBoard();
    if (v181)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v450 = [MEMORY[0x1E4F42D90] mainScreen];
      [v450 _referenceBounds];
    }
    LODWORD(v583) = v181 ^ 1;
    BSSizeRoundForScale();
    if (v198 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      int v499 = 0;
      uint64_t v500 = 0;
      LODWORD(v501) = 0;
      LODWORD(v502) = 0;
      LODWORD(v505) = 0;
      LODWORD(v506) = 0;
      LODWORD(v507) = 0;
      LODWORD(v509) = 0;
      LODWORD(v513) = 0;
      LODWORD(v514) = 0;
      LODWORD(v515) = 0;
      LODWORD(v520) = 0;
      LODWORD(v529) = 0;
      LODWORD(v521) = 0;
      LODWORD(v522) = 0;
      LODWORD(v523) = 0;
      LODWORD(v530) = 0;
      LODWORD(v531) = 0;
      LODWORD(v532) = 0;
      LODWORD(v541) = 0;
      LODWORD(v542) = 0;
      LODWORD(v533) = 0;
      LODWORD(v536) = 0;
      int v551 = 0;
      uint64_t v554 = 0;
      LODWORD(v537) = 0;
      LODWORD(v543) = 0;
      uint64_t v557 = 0;
      LODWORD(v544) = 0;
      int v569 = 0;
      uint64_t v570 = 0;
      uint64_t v573 = 0;
      int v582 = 0;
      double v46 = 389.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v583) = 0;
  }
LABEL_753:
  int v182 = __sb__runningInSpringBoard();
  if (v182)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v573) = 0;
      int v582 = 0;
      goto LABEL_763;
    }
  }
  else
  {
    v466 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v466 userInterfaceIdiom])
    {
      HIDWORD(v573) = 0;
      int v582 = 1;
      goto LABEL_763;
    }
  }
  int v582 = v182 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v183 = __sb__runningInSpringBoard();
    if (v183)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v457 = [MEMORY[0x1E4F42D90] mainScreen];
      [v457 _referenceBounds];
    }
    HIDWORD(v573) = v183 ^ 1;
    BSSizeRoundForScale();
    if (v184 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_767;
    }
  }
  else
  {
    HIDWORD(v573) = 0;
  }
LABEL_763:
  if (_SBF_Private_IsD94Like())
  {
    int v499 = 0;
    uint64_t v500 = 0;
    LODWORD(v501) = 0;
    LODWORD(v502) = 0;
    LODWORD(v505) = 0;
    LODWORD(v506) = 0;
    LODWORD(v507) = 0;
    LODWORD(v509) = 0;
    LODWORD(v513) = 0;
    LODWORD(v514) = 0;
    LODWORD(v515) = 0;
    LODWORD(v520) = 0;
    LODWORD(v529) = 0;
    LODWORD(v521) = 0;
    LODWORD(v522) = 0;
    LODWORD(v523) = 0;
    LODWORD(v530) = 0;
    LODWORD(v531) = 0;
    LODWORD(v532) = 0;
    LODWORD(v541) = 0;
    LODWORD(v542) = 0;
    LODWORD(v533) = 0;
    LODWORD(v536) = 0;
    int v551 = 0;
    uint64_t v554 = 0;
    LODWORD(v537) = 0;
    LODWORD(v543) = 0;
    uint64_t v557 = 0;
    LODWORD(v544) = 0;
    int v569 = 0;
    uint64_t v570 = 0;
    LODWORD(v573) = 0;
    double v46 = 340.666666;
    goto LABEL_69;
  }
LABEL_767:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_771:
    HIDWORD(v570) = 0;
    LODWORD(v573) = 0;
    goto LABEL_865;
  }
  int v185 = __sb__runningInSpringBoard();
  if (v185)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_771;
    }
  }
  else
  {
    id v34 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v34 userInterfaceIdiom])
    {
      v497 = v34;
      HIDWORD(v570) = 0;
      LODWORD(v573) = 1;
      goto LABEL_865;
    }
  }
  LODWORD(v573) = v185 ^ 1;
  v497 = v34;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v202 = __sb__runningInSpringBoard();
    if (v202)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v440 = [MEMORY[0x1E4F42D90] mainScreen];
      [v440 _referenceBounds];
    }
    HIDWORD(v570) = v202 ^ 1;
    BSSizeRoundForScale();
    if (v233 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      int v499 = 0;
      uint64_t v500 = 0;
      LODWORD(v501) = 0;
      LODWORD(v502) = 0;
      LODWORD(v505) = 0;
      LODWORD(v506) = 0;
      LODWORD(v507) = 0;
      LODWORD(v509) = 0;
      LODWORD(v513) = 0;
      LODWORD(v514) = 0;
      LODWORD(v515) = 0;
      LODWORD(v520) = 0;
      LODWORD(v529) = 0;
      LODWORD(v521) = 0;
      LODWORD(v522) = 0;
      LODWORD(v523) = 0;
      LODWORD(v530) = 0;
      LODWORD(v531) = 0;
      LODWORD(v532) = 0;
      LODWORD(v541) = 0;
      LODWORD(v542) = 0;
      LODWORD(v533) = 0;
      LODWORD(v536) = 0;
      int v551 = 0;
      uint64_t v554 = 0;
      LODWORD(v537) = 0;
      LODWORD(v543) = 0;
      uint64_t v557 = 0;
      LODWORD(v544) = 0;
      int v569 = 0;
      LODWORD(v570) = 0;
      double v46 = 380.0;
      goto LABEL_69;
    }
  }
  else
  {
    HIDWORD(v570) = 0;
  }
LABEL_865:
  int v203 = __sb__runningInSpringBoard();
  v204 = &off_1D8504000;
  if (v203)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v569 = 0;
      LODWORD(v570) = 0;
      goto LABEL_875;
    }
  }
  else
  {
    v462 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v462 userInterfaceIdiom])
    {
      int v569 = 0;
      LODWORD(v570) = 1;
      goto LABEL_875;
    }
  }
  LODWORD(v570) = v203 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v205 = __sb__runningInSpringBoard();
    if (v205)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v448 = [MEMORY[0x1E4F42D90] mainScreen];
      [v448 _referenceBounds];
    }
    int v569 = v205 ^ 1;
    BSSizeRoundForScale();
    if (v206 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_879;
    }
  }
  else
  {
    int v569 = 0;
  }
LABEL_875:
  if (_SBF_Private_IsD64Like())
  {
    int v499 = 0;
    uint64_t v500 = 0;
    LODWORD(v501) = 0;
    LODWORD(v502) = 0;
    LODWORD(v505) = 0;
    LODWORD(v506) = 0;
    LODWORD(v507) = 0;
    LODWORD(v509) = 0;
    LODWORD(v513) = 0;
    LODWORD(v514) = 0;
    LODWORD(v515) = 0;
    LODWORD(v520) = 0;
    LODWORD(v529) = 0;
    LODWORD(v521) = 0;
    LODWORD(v522) = 0;
    LODWORD(v523) = 0;
    LODWORD(v530) = 0;
    LODWORD(v531) = 0;
    LODWORD(v532) = 0;
    LODWORD(v541) = 0;
    LODWORD(v542) = 0;
    LODWORD(v533) = 0;
    LODWORD(v536) = 0;
    int v551 = 0;
    uint64_t v554 = 0;
    LODWORD(v537) = 0;
    LODWORD(v543) = 0;
    uint64_t v557 = 0;
    LODWORD(v544) = 0;
    double v46 = 332.666666;
    goto LABEL_69;
  }
LABEL_879:
  int v207 = __sb__runningInSpringBoard();
  if (v207)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v544) = 0;
      HIDWORD(v557) = 0;
      goto LABEL_889;
    }
  }
  else
  {
    v460 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v460 userInterfaceIdiom])
    {
      LODWORD(v544) = 0;
      HIDWORD(v557) = 1;
      goto LABEL_889;
    }
  }
  HIDWORD(v557) = v207 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v208 = __sb__runningInSpringBoard();
    if (v208)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v442 = [MEMORY[0x1E4F42D90] mainScreen];
      [v442 _referenceBounds];
    }
    LODWORD(v544) = v208 ^ 1;
    BSSizeRoundForScale();
    if (v229 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      int v499 = 0;
      uint64_t v500 = 0;
      LODWORD(v501) = 0;
      LODWORD(v502) = 0;
      LODWORD(v505) = 0;
      LODWORD(v506) = 0;
      LODWORD(v507) = 0;
      LODWORD(v509) = 0;
      LODWORD(v513) = 0;
      LODWORD(v514) = 0;
      LODWORD(v515) = 0;
      LODWORD(v520) = 0;
      LODWORD(v529) = 0;
      LODWORD(v521) = 0;
      LODWORD(v522) = 0;
      LODWORD(v523) = 0;
      LODWORD(v530) = 0;
      LODWORD(v531) = 0;
      LODWORD(v532) = 0;
      LODWORD(v541) = 0;
      LODWORD(v542) = 0;
      LODWORD(v533) = 0;
      LODWORD(v536) = 0;
      int v551 = 0;
      uint64_t v554 = 0;
      LODWORD(v537) = 0;
      LODWORD(v543) = 0;
      LODWORD(v557) = 0;
      double v46 = 380.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v544) = 0;
  }
LABEL_889:
  int v209 = __sb__runningInSpringBoard();
  if (v209)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v554) = 0;
      LODWORD(v557) = 0;
      goto LABEL_1001;
    }
  }
  else
  {
    v455 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v455 userInterfaceIdiom])
    {
      HIDWORD(v554) = 0;
      LODWORD(v557) = 1;
      goto LABEL_1001;
    }
  }
  LODWORD(v557) = v209 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v226 = __sb__runningInSpringBoard();
    if (v226)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v439 = [MEMORY[0x1E4F42D90] mainScreen];
      [v439 _referenceBounds];
    }
    HIDWORD(v554) = v226 ^ 1;
    BSSizeRoundForScale();
    if (v237 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_1047;
    }
  }
  else
  {
    HIDWORD(v554) = 0;
  }
LABEL_1001:
  if (_SBF_Private_IsD54())
  {
    int v499 = 0;
    uint64_t v500 = 0;
    LODWORD(v501) = 0;
    LODWORD(v502) = 0;
    LODWORD(v505) = 0;
    LODWORD(v506) = 0;
    LODWORD(v507) = 0;
    LODWORD(v509) = 0;
    LODWORD(v513) = 0;
    LODWORD(v514) = 0;
    LODWORD(v515) = 0;
    LODWORD(v520) = 0;
    LODWORD(v529) = 0;
    LODWORD(v521) = 0;
    LODWORD(v522) = 0;
    LODWORD(v523) = 0;
    LODWORD(v530) = 0;
    LODWORD(v531) = 0;
    LODWORD(v532) = 0;
    LODWORD(v541) = 0;
    LODWORD(v542) = 0;
    LODWORD(v533) = 0;
    LODWORD(v536) = 0;
    int v551 = 0;
    LODWORD(v554) = 0;
    LODWORD(v537) = 0;
    LODWORD(v543) = 0;
    double v46 = 332.666666;
    goto LABEL_69;
  }
LABEL_1047:
  int v238 = __sb__runningInSpringBoard();
  if (v238)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v537) = 0;
      LODWORD(v543) = 0;
      goto LABEL_1081;
    }
  }
  else
  {
    v452 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v452 userInterfaceIdiom])
    {
      LODWORD(v537) = 0;
      LODWORD(v543) = 1;
      goto LABEL_1081;
    }
  }
  LODWORD(v543) = v238 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v245 = __sb__runningInSpringBoard();
    if (v245)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v432 = [MEMORY[0x1E4F42D90] mainScreen];
      [v432 _referenceBounds];
    }
    LODWORD(v537) = v245 ^ 1;
    BSSizeRoundForScale();
    if (v258 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      int v499 = 0;
      uint64_t v500 = 0;
      LODWORD(v501) = 0;
      LODWORD(v502) = 0;
      LODWORD(v505) = 0;
      LODWORD(v506) = 0;
      LODWORD(v507) = 0;
      LODWORD(v509) = 0;
      LODWORD(v513) = 0;
      LODWORD(v514) = 0;
      LODWORD(v515) = 0;
      LODWORD(v520) = 0;
      LODWORD(v529) = 0;
      LODWORD(v521) = 0;
      LODWORD(v522) = 0;
      LODWORD(v523) = 0;
      LODWORD(v530) = 0;
      LODWORD(v531) = 0;
      LODWORD(v532) = 0;
      LODWORD(v541) = 0;
      LODWORD(v542) = 0;
      LODWORD(v533) = 0;
      LODWORD(v536) = 0;
      int v551 = 0;
      LODWORD(v554) = 0;
      double v46 = 0.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v537) = 0;
  }
LABEL_1081:
  int v246 = __sb__runningInSpringBoard();
  if (v246)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v551 = 0;
      LODWORD(v554) = 0;
      goto LABEL_1121;
    }
  }
  else
  {
    v446 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v446 userInterfaceIdiom])
    {
      int v551 = 0;
      LODWORD(v554) = 1;
      goto LABEL_1121;
    }
  }
  LODWORD(v554) = v246 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v254 = __sb__runningInSpringBoard();
    if (v254)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v430 = [MEMORY[0x1E4F42D90] mainScreen];
      [v430 _referenceBounds];
    }
    int v551 = v254 ^ 1;
    BSSizeRoundForScale();
    if (v262 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1163;
    }
  }
  else
  {
    int v551 = 0;
  }
LABEL_1121:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    int v499 = 0;
    uint64_t v500 = 0;
    LODWORD(v501) = 0;
    LODWORD(v502) = 0;
    LODWORD(v505) = 0;
    LODWORD(v506) = 0;
    LODWORD(v507) = 0;
    LODWORD(v509) = 0;
    LODWORD(v513) = 0;
    LODWORD(v514) = 0;
    LODWORD(v515) = 0;
    LODWORD(v520) = 0;
    LODWORD(v529) = 0;
    LODWORD(v521) = 0;
    LODWORD(v522) = 0;
    LODWORD(v523) = 0;
    LODWORD(v530) = 0;
    LODWORD(v531) = 0;
    LODWORD(v532) = 0;
    LODWORD(v541) = 0;
    LODWORD(v542) = 0;
    LODWORD(v533) = 0;
    LODWORD(v536) = 0;
    double v46 = 0.0;
    goto LABEL_69;
  }
LABEL_1163:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_1167:
    LODWORD(v533) = 0;
    LODWORD(v536) = 0;
    goto LABEL_1201;
  }
  int v263 = __sb__runningInSpringBoard();
  if (v263)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_1167;
    }
  }
  else
  {
    v437 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v437 userInterfaceIdiom])
    {
      LODWORD(v533) = 0;
      LODWORD(v536) = 1;
      goto LABEL_1201;
    }
  }
  LODWORD(v536) = v263 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v270 = __sb__runningInSpringBoard();
    if (v270)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v418 = [MEMORY[0x1E4F42D90] mainScreen];
      [v418 _referenceBounds];
    }
    BSSizeRoundForScale();
    LODWORD(v533) = v270 ^ 1;
    if (v288 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      int v499 = 0;
      uint64_t v500 = 0;
      LODWORD(v501) = 0;
      LODWORD(v502) = 0;
      LODWORD(v505) = 0;
      LODWORD(v506) = 0;
      LODWORD(v507) = 0;
      LODWORD(v509) = 0;
      LODWORD(v513) = 0;
      LODWORD(v514) = 0;
      LODWORD(v515) = 0;
      LODWORD(v520) = 0;
      LODWORD(v529) = 0;
      LODWORD(v521) = 0;
      LODWORD(v522) = 0;
      LODWORD(v523) = 0;
      LODWORD(v530) = 0;
      LODWORD(v531) = 0;
      LODWORD(v532) = 0;
      LODWORD(v541) = 0;
      LODWORD(v542) = 0;
      double v46 = 374.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v533) = 0;
  }
LABEL_1201:
  int v271 = __sb__runningInSpringBoard();
  if (v271)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v541) = 0;
      LODWORD(v542) = 0;
      goto LABEL_1211;
    }
  }
  else
  {
    v444 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v444 userInterfaceIdiom])
    {
      LODWORD(v541) = 0;
      LODWORD(v542) = 1;
      goto LABEL_1211;
    }
  }
  LODWORD(v542) = v271 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v272 = __sb__runningInSpringBoard();
    if (v272)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v425 = [MEMORY[0x1E4F42D90] mainScreen];
      [v425 _referenceBounds];
    }
    LODWORD(v541) = v272 ^ 1;
    BSSizeRoundForScale();
    if (v273 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_1215;
    }
  }
  else
  {
    LODWORD(v541) = 0;
  }
LABEL_1211:
  if (_SBF_Private_IsD93Like())
  {
    int v499 = 0;
    uint64_t v500 = 0;
    LODWORD(v501) = 0;
    LODWORD(v502) = 0;
    LODWORD(v505) = 0;
    LODWORD(v506) = 0;
    LODWORD(v507) = 0;
    LODWORD(v509) = 0;
    LODWORD(v513) = 0;
    LODWORD(v514) = 0;
    LODWORD(v515) = 0;
    LODWORD(v520) = 0;
    LODWORD(v529) = 0;
    LODWORD(v521) = 0;
    LODWORD(v522) = 0;
    LODWORD(v523) = 0;
    LODWORD(v530) = 0;
    LODWORD(v531) = 0;
    LODWORD(v532) = 0;
    double v46 = 306.0;
    goto LABEL_69;
  }
LABEL_1215:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_1219:
    LODWORD(v531) = 0;
    LODWORD(v532) = 0;
    goto LABEL_1313;
  }
  int v274 = __sb__runningInSpringBoard();
  if (v274)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_1219;
    }
  }
  else
  {
    v204 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v204 userInterfaceIdiom])
    {
      v433 = v204;
      LODWORD(v531) = 0;
      LODWORD(v532) = 1;
      goto LABEL_1313;
    }
  }
  LODWORD(v532) = v274 ^ 1;
  v433 = v204;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v292 = __sb__runningInSpringBoard();
    if (v292)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v410 = [MEMORY[0x1E4F42D90] mainScreen];
      [v410 _referenceBounds];
    }
    BSSizeRoundForScale();
    LODWORD(v531) = v292 ^ 1;
    if (v328 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v499 = 0;
      uint64_t v500 = 0;
      LODWORD(v501) = 0;
      LODWORD(v502) = 0;
      LODWORD(v505) = 0;
      LODWORD(v506) = 0;
      LODWORD(v507) = 0;
      LODWORD(v509) = 0;
      LODWORD(v513) = 0;
      LODWORD(v514) = 0;
      LODWORD(v515) = 0;
      LODWORD(v520) = 0;
      LODWORD(v529) = 0;
      LODWORD(v521) = 0;
      LODWORD(v522) = 0;
      LODWORD(v523) = 0;
      LODWORD(v530) = 0;
      double v46 = 366.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v531) = 0;
  }
LABEL_1313:
  int v293 = __sb__runningInSpringBoard();
  if (v293)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v523) = 0;
      LODWORD(v530) = 0;
      goto LABEL_1323;
    }
  }
  else
  {
    v435 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v435 userInterfaceIdiom])
    {
      LODWORD(v523) = 0;
      LODWORD(v530) = 1;
      goto LABEL_1323;
    }
  }
  LODWORD(v530) = v293 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v294 = __sb__runningInSpringBoard();
    if (v294)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v416 = [MEMORY[0x1E4F42D90] mainScreen];
      [v416 _referenceBounds];
    }
    LODWORD(v523) = v294 ^ 1;
    BSSizeRoundForScale();
    if (v295 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1327;
    }
  }
  else
  {
    LODWORD(v523) = 0;
  }
LABEL_1323:
  if (_SBF_Private_IsD63Like())
  {
    int v499 = 0;
    uint64_t v500 = 0;
    LODWORD(v501) = 0;
    LODWORD(v502) = 0;
    LODWORD(v505) = 0;
    LODWORD(v506) = 0;
    LODWORD(v507) = 0;
    LODWORD(v509) = 0;
    LODWORD(v513) = 0;
    LODWORD(v514) = 0;
    LODWORD(v515) = 0;
    LODWORD(v520) = 0;
    LODWORD(v529) = 0;
    LODWORD(v521) = 0;
    LODWORD(v522) = 0;
    double v46 = 300.0;
    goto LABEL_69;
  }
LABEL_1327:
  int v296 = __sb__runningInSpringBoard();
  if (v296)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v521) = 0;
      LODWORD(v522) = 0;
      goto LABEL_1337;
    }
  }
  else
  {
    v428 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v428 userInterfaceIdiom])
    {
      LODWORD(v521) = 0;
      LODWORD(v522) = 1;
      goto LABEL_1337;
    }
  }
  LODWORD(v522) = v296 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v297 = __sb__runningInSpringBoard();
    if (v297)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v412 = [MEMORY[0x1E4F42D90] mainScreen];
      [v412 _referenceBounds];
    }
    LODWORD(v521) = v297 ^ 1;
    BSSizeRoundForScale();
    if (v324 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      int v499 = 0;
      uint64_t v500 = 0;
      LODWORD(v501) = 0;
      LODWORD(v502) = 0;
      LODWORD(v505) = 0;
      LODWORD(v506) = 0;
      LODWORD(v507) = 0;
      LODWORD(v509) = 0;
      LODWORD(v513) = 0;
      LODWORD(v514) = 0;
      LODWORD(v515) = 0;
      LODWORD(v520) = 0;
      LODWORD(v529) = 0;
      double v46 = 0.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v521) = 0;
  }
LABEL_1337:
  int v298 = __sb__runningInSpringBoard();
  if (v298)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v299 = 0;
      LODWORD(v529) = 0;
      goto LABEL_1449;
    }
  }
  else
  {
    v423 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v423 userInterfaceIdiom])
    {
      int v299 = 0;
      LODWORD(v529) = 1;
      goto LABEL_1449;
    }
  }
  LODWORD(v529) = v298 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v320 = __sb__runningInSpringBoard();
    if (v320)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v409 = [MEMORY[0x1E4F42D90] mainScreen];
      [v409 _referenceBounds];
    }
    int v299 = v320 ^ 1;
    BSSizeRoundForScale();
    if (v332 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1495;
    }
  }
  else
  {
    int v299 = 0;
  }
LABEL_1449:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    LODWORD(v520) = v299;
    int v499 = 0;
    uint64_t v500 = 0;
    LODWORD(v501) = 0;
    LODWORD(v502) = 0;
    LODWORD(v505) = 0;
    LODWORD(v506) = 0;
    LODWORD(v507) = 0;
    LODWORD(v509) = 0;
    LODWORD(v513) = 0;
    LODWORD(v514) = 0;
    LODWORD(v515) = 0;
    double v46 = 0.0;
    goto LABEL_69;
  }
LABEL_1495:
  LODWORD(v520) = v299;
  int v333 = __sb__runningInSpringBoard();
  if (v333)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v514) = 0;
      LODWORD(v515) = 0;
      goto LABEL_1529;
    }
  }
  else
  {
    v420 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v420 userInterfaceIdiom])
    {
      LODWORD(v514) = 0;
      LODWORD(v515) = 1;
      goto LABEL_1529;
    }
  }
  LODWORD(v515) = v333 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v340 = __sb__runningInSpringBoard();
    if (v340)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v407 = [MEMORY[0x1E4F42D90] mainScreen];
      [v407 _referenceBounds];
    }
    LODWORD(v514) = v340 ^ 1;
    BSSizeRoundForScale();
    if (v349 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v499 = 0;
      uint64_t v500 = 0;
      LODWORD(v501) = 0;
      LODWORD(v502) = 0;
      LODWORD(v505) = 0;
      LODWORD(v506) = 0;
      LODWORD(v507) = 0;
      LODWORD(v509) = 0;
      LODWORD(v513) = 0;
      double v46 = 366.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v514) = 0;
  }
LABEL_1529:
  int v341 = __sb__runningInSpringBoard();
  if (v341)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v509) = 0;
      LODWORD(v513) = 0;
      goto LABEL_1569;
    }
  }
  else
  {
    v414 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v414 userInterfaceIdiom])
    {
      LODWORD(v509) = 0;
      LODWORD(v513) = 1;
      goto LABEL_1569;
    }
  }
  LODWORD(v513) = v341 ^ 1;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    LODWORD(v509) = 0;
    goto LABEL_1569;
  }
  int v346 = __sb__runningInSpringBoard();
  if (v346)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v405 = [MEMORY[0x1E4F42D90] mainScreen];
    [v405 _referenceBounds];
  }
  LODWORD(v509) = v346 ^ 1;
  BSSizeRoundForScale();
  if (v353 < *(double *)(MEMORY[0x1E4FA6E50] + 104))
  {
LABEL_1569:
    if (_SBF_Private_IsD53())
    {
      int v499 = 0;
      uint64_t v500 = 0;
      LODWORD(v501) = 0;
      LODWORD(v502) = 0;
      LODWORD(v505) = 0;
      LODWORD(v506) = 0;
      LODWORD(v507) = 0;
      double v46 = 300.0;
      goto LABEL_69;
    }
  }
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice()) {
    goto LABEL_1608;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16()) {
    goto LABEL_1610;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
LABEL_1608:
    int v499 = 0;
    uint64_t v500 = 0;
    LODWORD(v501) = 0;
    LODWORD(v502) = 0;
    LODWORD(v505) = 0;
    LODWORD(v506) = 0;
    LODWORD(v507) = 0;
    double v46 = 375.0;
    goto LABEL_69;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
LABEL_1610:
    int v499 = 0;
    uint64_t v500 = 0;
    LODWORD(v501) = 0;
    LODWORD(v502) = 0;
    LODWORD(v505) = 0;
    LODWORD(v506) = 0;
    LODWORD(v507) = 0;
    double v46 = 320.0;
    goto LABEL_69;
  }
  int v357 = __sb__runningInSpringBoard();
  if (v357)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v506) = 0;
      LODWORD(v507) = 0;
      goto LABEL_1669;
    }
  }
  else
  {
    v496 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v496 userInterfaceIdiom])
    {
      LODWORD(v506) = 0;
      LODWORD(v507) = 1;
      goto LABEL_1669;
    }
  }
  LODWORD(v507) = v357 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v360 = __sb__runningInSpringBoard();
    if (v360)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v493 = [MEMORY[0x1E4F42D90] mainScreen];
      [v493 _referenceBounds];
    }
    LODWORD(v506) = v360 ^ 1;
    BSSizeRoundForScale();
    if (v384 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v499 = 0;
      uint64_t v500 = 0;
      LODWORD(v501) = 0;
      LODWORD(v502) = 0;
      LODWORD(v505) = 0;
      double v46 = 0.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v506) = 0;
  }
LABEL_1669:
  int v361 = __sb__runningInSpringBoard();
  if (v361)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v502) = 0;
      LODWORD(v505) = 0;
      goto LABEL_1709;
    }
  }
  else
  {
    v495 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v495 userInterfaceIdiom])
    {
      LODWORD(v502) = 0;
      LODWORD(v505) = 1;
      goto LABEL_1709;
    }
  }
  LODWORD(v505) = v361 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v367 = __sb__runningInSpringBoard();
    if (v367)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v492 = [MEMORY[0x1E4F42D90] mainScreen];
      [v492 _referenceBounds];
    }
    LODWORD(v502) = v367 ^ 1;
    BSSizeRoundForScale();
    if (v388 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v499 = 0;
      uint64_t v500 = 0;
      LODWORD(v501) = 0;
      double v46 = 0.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v502) = 0;
  }
LABEL_1709:
  int v368 = __sb__runningInSpringBoard();
  if (!v368)
  {
    v494 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v494 userInterfaceIdiom])
    {
      HIDWORD(v500) = 0;
      LODWORD(v501) = 1;
      goto LABEL_1749;
    }
LABEL_1745:
    LODWORD(v501) = v368 ^ 1;
    int v373 = __sb__runningInSpringBoard();
    if (v373)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v399 = [MEMORY[0x1E4F42D90] mainScreen];
      [v399 _referenceBounds];
    }
    HIDWORD(v500) = v373 ^ 1;
    BSSizeRoundForScale();
    if (v374 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
      goto LABEL_1752;
    }
    goto LABEL_1749;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_1745;
  }
  HIDWORD(v500) = 0;
  LODWORD(v501) = 0;
LABEL_1749:
  int v375 = __sb__runningInSpringBoard();
  if (v375)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_1752:
      int v499 = 0;
      LODWORD(v500) = 0;
      double v46 = 0.0;
      goto LABEL_69;
    }
  }
  else
  {
    v400 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v400 userInterfaceIdiom])
    {
      int v499 = 0;
      double v46 = 0.0;
      LODWORD(v500) = 1;
      goto LABEL_69;
    }
  }
  LODWORD(v500) = v375 ^ 1;
  int v392 = __sb__runningInSpringBoard();
  if (v392)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v398 = [MEMORY[0x1E4F42D90] mainScreen];
    [v398 _referenceBounds];
  }
  int v499 = v392 ^ 1;
  BSSizeRoundForScale();
  double v46 = 0.0;
LABEL_69:
  int v54 = __sb__runningInSpringBoard();
  uint64_t v597 = v13;
  if (v54)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v55 = 0;
      int v56 = 0;
      goto LABEL_78;
    }
  }
  else
  {
    v490 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v490 userInterfaceIdiom] != 1)
    {
      int v55 = 0;
      int v56 = 1;
      goto LABEL_78;
    }
  }
  int v56 = v54 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v473 = [MEMORY[0x1E4F42D90] mainScreen];
      [v473 _referenceBounds];
    }
    int v55 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v75 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v74 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      HIDWORD(v595[2]) = v57 ^ 1;
      LODWORD(v595[3]) = v56;
      uint64_t v563 = 0;
      uint64_t v560 = 0;
      int v566 = 0;
      LODWORD(v550) = 0;
      LODWORD(v540) = 0;
      uint64_t v576 = 0;
      LODWORD(v549) = 0;
      LODWORD(v548) = 0;
      LODWORD(v547) = 0;
      LODWORD(v535) = 0;
      int v579 = 0;
      LODWORD(v546) = 0;
      uint64_t v586 = 0;
      LODWORD(v545) = 0;
      LODWORD(v534) = 0;
      LODWORD(v528) = 0;
      LODWORD(v539) = 0;
      uint64_t v589 = 0;
      LODWORD(v538) = 0;
      LODWORD(v527) = 0;
      LODWORD(v526) = 0;
      LODWORD(v525) = 0;
      uint64_t v592 = 0;
      LODWORD(v519) = 0;
      LODWORD(v518) = 0;
      LODWORD(v517) = 0;
      LODWORD(v524) = 0;
      memset(v595, 0, 20);
      LODWORD(v516) = 0;
      LODWORD(v512) = 0;
      LODWORD(v511) = 0;
      LODWORD(v510) = 0;
      LODWORD(v508) = 0;
      LODWORD(v504) = 0;
      LODWORD(v503) = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      int v69 = 0;
      int v70 = 0;
      double v71 = 0.0;
      goto LABEL_132;
    }
  }
  else
  {
    int v55 = 0;
  }
LABEL_78:
  int v58 = __sb__runningInSpringBoard();
  HIDWORD(v595[2]) = v55;
  LODWORD(v595[3]) = v56;
  if (v58)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v59 = 0;
      int v60 = 0;
      goto LABEL_87;
    }
  }
  else
  {
    v488 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v488 userInterfaceIdiom] != 1)
    {
      int v59 = 0;
      int v60 = 1;
      goto LABEL_87;
    }
  }
  int v60 = v58 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v471 = [MEMORY[0x1E4F42D90] mainScreen];
      [v471 _referenceBounds];
    }
    int v59 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v76 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      HIDWORD(v595[1]) = v57 ^ 1;
      LODWORD(v595[2]) = v60;
      uint64_t v563 = 0;
      uint64_t v560 = 0;
      int v566 = 0;
      LODWORD(v550) = 0;
      LODWORD(v540) = 0;
      uint64_t v576 = 0;
      LODWORD(v549) = 0;
      LODWORD(v548) = 0;
      LODWORD(v547) = 0;
      LODWORD(v535) = 0;
      int v579 = 0;
      LODWORD(v546) = 0;
      uint64_t v586 = 0;
      LODWORD(v545) = 0;
      LODWORD(v534) = 0;
      LODWORD(v528) = 0;
      LODWORD(v539) = 0;
      uint64_t v589 = 0;
      LODWORD(v538) = 0;
      LODWORD(v527) = 0;
      LODWORD(v526) = 0;
      LODWORD(v525) = 0;
      uint64_t v592 = 0;
      LODWORD(v519) = 0;
      LODWORD(v518) = 0;
      LODWORD(v517) = 0;
      LODWORD(v524) = 0;
      v595[0] = 0;
      LODWORD(v516) = 0;
      LODWORD(v512) = 0;
      LODWORD(v511) = 0;
      LODWORD(v510) = 0;
      LODWORD(v595[1]) = 0;
      LODWORD(v508) = 0;
      LODWORD(v504) = 0;
      LODWORD(v503) = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      int v69 = 0;
      int v70 = 0;
      double v71 = 0.0;
      goto LABEL_132;
    }
  }
  else
  {
    int v59 = 0;
  }
LABEL_87:
  int v61 = __sb__runningInSpringBoard();
  HIDWORD(v595[1]) = v59;
  LODWORD(v595[2]) = v60;
  if (v61)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v29 = 0;
      int v62 = 0;
      goto LABEL_96;
    }
  }
  else
  {
    v486 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v486 userInterfaceIdiom] != 1)
    {
      uint64_t v29 = 0;
      int v62 = 1;
      goto LABEL_96;
    }
  }
  int v62 = v61 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v469 = [MEMORY[0x1E4F42D90] mainScreen];
      [v469 _referenceBounds];
    }
    uint64_t v29 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v77 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      HIDWORD(v595[0]) = v57 ^ 1;
      LODWORD(v595[1]) = v62;
      uint64_t v563 = 0;
      uint64_t v560 = 0;
      int v566 = 0;
      LODWORD(v550) = 0;
      LODWORD(v540) = 0;
      uint64_t v576 = 0;
      LODWORD(v549) = 0;
      LODWORD(v548) = 0;
      LODWORD(v547) = 0;
      LODWORD(v535) = 0;
      int v579 = 0;
      LODWORD(v546) = 0;
      uint64_t v586 = 0;
      LODWORD(v545) = 0;
      LODWORD(v534) = 0;
      LODWORD(v528) = 0;
      LODWORD(v539) = 0;
      uint64_t v589 = 0;
      LODWORD(v538) = 0;
      LODWORD(v527) = 0;
      LODWORD(v526) = 0;
      LODWORD(v525) = 0;
      uint64_t v592 = 0;
      LODWORD(v519) = 0;
      LODWORD(v518) = 0;
      LODWORD(v517) = 0;
      LODWORD(v524) = 0;
      LODWORD(v595[0]) = 0;
      LODWORD(v516) = 0;
      LODWORD(v512) = 0;
      LODWORD(v511) = 0;
      LODWORD(v510) = 0;
      LODWORD(v508) = 0;
      LODWORD(v504) = 0;
      LODWORD(v503) = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      int v69 = 0;
      int v70 = 0;
      double v71 = 0.0;
      goto LABEL_132;
    }
  }
  else
  {
    uint64_t v29 = 0;
  }
LABEL_96:
  int v63 = __sb__runningInSpringBoard();
  HIDWORD(v595[0]) = v29;
  LODWORD(v595[1]) = v62;
  if (v63)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v592) = 0;
      LODWORD(v595[0]) = 0;
      goto LABEL_105;
    }
  }
  else
  {
    v484 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v484 userInterfaceIdiom] != 1)
    {
      HIDWORD(v592) = 0;
      LODWORD(v595[0]) = 1;
      goto LABEL_105;
    }
  }
  LODWORD(v595[0]) = v63 ^ 1;
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v478 = [MEMORY[0x1E4F42D90] mainScreen];
    [v478 _referenceBounds];
  }
  HIDWORD(v592) = v57 ^ 1;
  BSSizeRoundForScale();
  if (v64 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    uint64_t v563 = 0;
    uint64_t v560 = 0;
    int v566 = 0;
    LODWORD(v550) = 0;
    LODWORD(v540) = 0;
    uint64_t v576 = 0;
    LODWORD(v549) = 0;
    LODWORD(v548) = 0;
    LODWORD(v547) = 0;
    LODWORD(v535) = 0;
    int v579 = 0;
    LODWORD(v546) = 0;
    uint64_t v586 = 0;
    LODWORD(v545) = 0;
    LODWORD(v534) = 0;
    LODWORD(v528) = 0;
    LODWORD(v539) = 0;
    uint64_t v589 = 0;
    LODWORD(v538) = 0;
    LODWORD(v527) = 0;
    LODWORD(v526) = 0;
    LODWORD(v525) = 0;
    LODWORD(v592) = 0;
    LODWORD(v519) = 0;
    LODWORD(v518) = 0;
    LODWORD(v517) = 0;
    LODWORD(v524) = 0;
    LODWORD(v516) = 0;
    LODWORD(v512) = 0;
    LODWORD(v511) = 0;
    LODWORD(v510) = 0;
    LODWORD(v508) = 0;
    LODWORD(v504) = 0;
    LODWORD(v503) = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    int v69 = 0;
    int v70 = 0;
    double v71 = 0.0;
    goto LABEL_132;
  }
LABEL_105:
  int v65 = __sb__runningInSpringBoard();
  if (v65)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v589) = 0;
      LODWORD(v592) = 0;
      goto LABEL_115;
    }
  }
  else
  {
    v482 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v482 userInterfaceIdiom] != 1)
    {
      HIDWORD(v589) = 0;
      LODWORD(v592) = 1;
      goto LABEL_115;
    }
  }
  LODWORD(v592) = v65 ^ 1;
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v474 = [MEMORY[0x1E4F42D90] mainScreen];
    [v474 _referenceBounds];
  }
  HIDWORD(v589) = v57 ^ 1;
  BSSizeRoundForScale();
  if (v72 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    uint64_t v563 = 0;
    uint64_t v560 = 0;
    int v566 = 0;
    LODWORD(v550) = 0;
    LODWORD(v540) = 0;
    uint64_t v576 = 0;
    LODWORD(v549) = 0;
    LODWORD(v548) = 0;
    LODWORD(v547) = 0;
    LODWORD(v535) = 0;
    int v579 = 0;
    LODWORD(v546) = 0;
    uint64_t v586 = 0;
    LODWORD(v545) = 0;
    LODWORD(v534) = 0;
    LODWORD(v528) = 0;
    LODWORD(v539) = 0;
    LODWORD(v589) = 0;
    LODWORD(v538) = 0;
    LODWORD(v527) = 0;
    LODWORD(v526) = 0;
    LODWORD(v525) = 0;
    LODWORD(v519) = 0;
    LODWORD(v518) = 0;
    LODWORD(v517) = 0;
    LODWORD(v524) = 0;
    LODWORD(v516) = 0;
    LODWORD(v512) = 0;
    LODWORD(v511) = 0;
    LODWORD(v510) = 0;
    LODWORD(v508) = 0;
    LODWORD(v504) = 0;
    LODWORD(v503) = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    int v69 = 0;
    int v70 = 0;
    double v71 = 0.0;
    goto LABEL_132;
  }
LABEL_115:
  int v73 = __sb__runningInSpringBoard();
  if (v73)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v586) = 0;
      LODWORD(v589) = 0;
      goto LABEL_704;
    }
  }
  else
  {
    v480 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v480 userInterfaceIdiom] != 1)
    {
      HIDWORD(v586) = 0;
      LODWORD(v589) = 1;
      goto LABEL_704;
    }
  }
  LODWORD(v589) = v73 ^ 1;
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v467 = [MEMORY[0x1E4F42D90] mainScreen];
    [v467 _referenceBounds];
  }
  HIDWORD(v586) = v57 ^ 1;
  BSSizeRoundForScale();
  if (v173 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    uint64_t v563 = 0;
    uint64_t v560 = 0;
    int v566 = 0;
    LODWORD(v550) = 0;
    LODWORD(v540) = 0;
    uint64_t v576 = 0;
    LODWORD(v549) = 0;
    LODWORD(v548) = 0;
    LODWORD(v547) = 0;
    LODWORD(v535) = 0;
    int v579 = 0;
    LODWORD(v546) = 0;
    LODWORD(v586) = 0;
    LODWORD(v545) = 0;
    LODWORD(v534) = 0;
    LODWORD(v528) = 0;
    LODWORD(v539) = 0;
    LODWORD(v538) = 0;
    LODWORD(v527) = 0;
    LODWORD(v526) = 0;
    LODWORD(v525) = 0;
    LODWORD(v519) = 0;
    LODWORD(v518) = 0;
    LODWORD(v517) = 0;
    LODWORD(v524) = 0;
    LODWORD(v516) = 0;
    LODWORD(v512) = 0;
    LODWORD(v511) = 0;
    LODWORD(v510) = 0;
    LODWORD(v508) = 0;
    LODWORD(v504) = 0;
    LODWORD(v503) = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    int v69 = 0;
    int v70 = 0;
    double v71 = 0.0;
    goto LABEL_132;
  }
LABEL_704:
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_706;
    }
LABEL_712:
    uint64_t v563 = 0;
    uint64_t v560 = 0;
    int v566 = 0;
    LODWORD(v550) = 0;
    LODWORD(v540) = 0;
    uint64_t v576 = 0;
    LODWORD(v549) = 0;
    LODWORD(v548) = 0;
    LODWORD(v547) = 0;
    LODWORD(v535) = 0;
    int v579 = 0;
    LODWORD(v546) = 0;
    LODWORD(v545) = 0;
    LODWORD(v534) = 0;
    LODWORD(v528) = 0;
    LODWORD(v539) = 0;
    LODWORD(v538) = 0;
    LODWORD(v527) = 0;
    LODWORD(v526) = 0;
    LODWORD(v525) = 0;
    LODWORD(v519) = 0;
    LODWORD(v518) = 0;
    LODWORD(v517) = 0;
    LODWORD(v524) = 0;
    LODWORD(v516) = 0;
    LODWORD(v512) = 0;
    LODWORD(v511) = 0;
    LODWORD(v510) = 0;
    LODWORD(v508) = 0;
    LODWORD(v504) = 0;
    LODWORD(v503) = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    int v69 = 0;
    int v70 = 0;
    double v71 = 0.0;
    LODWORD(v586) = v57 ^ 1;
    goto LABEL_132;
  }
  v476 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v476 userInterfaceIdiom] == 1) {
    goto LABEL_712;
  }
LABEL_706:
  LODWORD(v586) = v57 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_710:
    HIDWORD(v576) = 0;
    int v579 = 0;
    goto LABEL_778;
  }
  int v174 = __sb__runningInSpringBoard();
  if (v174)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_710;
    }
  }
  else
  {
    v463 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v463 userInterfaceIdiom])
    {
      HIDWORD(v576) = 0;
      int v579 = 1;
      goto LABEL_778;
    }
  }
  int v579 = v174 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v449 = [MEMORY[0x1E4F42D90] mainScreen];
      [v449 _referenceBounds];
    }
    HIDWORD(v576) = v57 ^ 1;
    BSSizeRoundForScale();
    if (v199 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      uint64_t v563 = 0;
      uint64_t v560 = 0;
      int v566 = 0;
      LODWORD(v550) = 0;
      LODWORD(v540) = 0;
      LODWORD(v576) = 0;
      LODWORD(v549) = 0;
      LODWORD(v548) = 0;
      LODWORD(v547) = 0;
      LODWORD(v535) = 0;
      LODWORD(v546) = 0;
      LODWORD(v545) = 0;
      LODWORD(v534) = 0;
      LODWORD(v528) = 0;
      LODWORD(v539) = 0;
      LODWORD(v538) = 0;
      LODWORD(v527) = 0;
      LODWORD(v526) = 0;
      LODWORD(v525) = 0;
      LODWORD(v519) = 0;
      LODWORD(v518) = 0;
      LODWORD(v517) = 0;
      LODWORD(v524) = 0;
      LODWORD(v516) = 0;
      LODWORD(v512) = 0;
      LODWORD(v511) = 0;
      LODWORD(v510) = 0;
      LODWORD(v508) = 0;
      LODWORD(v504) = 0;
      LODWORD(v503) = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      int v69 = 0;
      int v70 = 0;
      double v71 = 579.66666;
      goto LABEL_132;
    }
  }
  else
  {
    HIDWORD(v576) = 0;
  }
LABEL_778:
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v566 = 0;
      LODWORD(v576) = 0;
      goto LABEL_788;
    }
  }
  else
  {
    v465 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v465 userInterfaceIdiom])
    {
      int v566 = 0;
      LODWORD(v576) = 1;
      goto LABEL_788;
    }
  }
  LODWORD(v576) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v456 = [MEMORY[0x1E4F42D90] mainScreen];
      [v456 _referenceBounds];
    }
    int v566 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v186 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_792;
    }
  }
  else
  {
    int v566 = 0;
  }
LABEL_788:
  if (_SBF_Private_IsD94Like())
  {
    uint64_t v563 = 0;
    uint64_t v560 = 0;
    LODWORD(v550) = 0;
    LODWORD(v540) = 0;
    LODWORD(v549) = 0;
    LODWORD(v548) = 0;
    LODWORD(v547) = 0;
    LODWORD(v535) = 0;
    LODWORD(v546) = 0;
    LODWORD(v545) = 0;
    LODWORD(v534) = 0;
    LODWORD(v528) = 0;
    LODWORD(v539) = 0;
    LODWORD(v538) = 0;
    LODWORD(v527) = 0;
    LODWORD(v526) = 0;
    LODWORD(v525) = 0;
    LODWORD(v519) = 0;
    LODWORD(v518) = 0;
    LODWORD(v517) = 0;
    LODWORD(v524) = 0;
    LODWORD(v516) = 0;
    LODWORD(v512) = 0;
    LODWORD(v511) = 0;
    LODWORD(v510) = 0;
    LODWORD(v508) = 0;
    LODWORD(v504) = 0;
    LODWORD(v503) = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    int v69 = 0;
    int v70 = 0;
    double v71 = 507.66666;
    goto LABEL_132;
  }
LABEL_792:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_796:
    uint64_t v563 = 0;
    goto LABEL_899;
  }
  int v187 = __sb__runningInSpringBoard();
  if (v187)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_796;
    }
  }
  else
  {
    v458 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v458 userInterfaceIdiom])
    {
      uint64_t v563 = 0x100000000;
      goto LABEL_899;
    }
  }
  HIDWORD(v563) = v187 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v29 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v29 _referenceBounds];
    }
    v453 = (void *)v29;
    LODWORD(v563) = v57 ^ 1;
    BSSizeRoundForScale();
    if (v234 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      uint64_t v560 = 0;
      LODWORD(v550) = 0;
      LODWORD(v540) = 0;
      LODWORD(v549) = 0;
      LODWORD(v548) = 0;
      LODWORD(v547) = 0;
      LODWORD(v535) = 0;
      LODWORD(v546) = 0;
      LODWORD(v545) = 0;
      LODWORD(v534) = 0;
      LODWORD(v528) = 0;
      LODWORD(v539) = 0;
      LODWORD(v538) = 0;
      LODWORD(v527) = 0;
      LODWORD(v526) = 0;
      LODWORD(v525) = 0;
      LODWORD(v519) = 0;
      LODWORD(v518) = 0;
      LODWORD(v517) = 0;
      LODWORD(v524) = 0;
      LODWORD(v516) = 0;
      LODWORD(v512) = 0;
      LODWORD(v511) = 0;
      LODWORD(v510) = 0;
      LODWORD(v508) = 0;
      LODWORD(v504) = 0;
      LODWORD(v503) = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      int v69 = 0;
      int v70 = 0;
      double v71 = 565.0;
      goto LABEL_132;
    }
  }
  else
  {
    LODWORD(v563) = 0;
  }
LABEL_899:
  uint64_t v57 = __sb__runningInSpringBoard();
  uint64_t v29 = (uint64_t)&off_1D8504000;
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v560 = 0;
      goto LABEL_909;
    }
  }
  else
  {
    v461 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v461 userInterfaceIdiom])
    {
      uint64_t v560 = 0x100000000;
      goto LABEL_909;
    }
  }
  HIDWORD(v560) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v447 = [MEMORY[0x1E4F42D90] mainScreen];
      [v447 _referenceBounds];
    }
    LODWORD(v560) = v57 ^ 1;
    BSSizeRoundForScale();
    if (v210 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_913;
    }
  }
  else
  {
    LODWORD(v560) = 0;
  }
LABEL_909:
  if (_SBF_Private_IsD64Like())
  {
    LODWORD(v550) = 0;
    LODWORD(v540) = 0;
    LODWORD(v549) = 0;
    LODWORD(v548) = 0;
    LODWORD(v547) = 0;
    LODWORD(v535) = 0;
    LODWORD(v546) = 0;
    LODWORD(v545) = 0;
    LODWORD(v534) = 0;
    LODWORD(v528) = 0;
    LODWORD(v539) = 0;
    LODWORD(v538) = 0;
    LODWORD(v527) = 0;
    LODWORD(v526) = 0;
    LODWORD(v525) = 0;
    LODWORD(v519) = 0;
    LODWORD(v518) = 0;
    LODWORD(v517) = 0;
    LODWORD(v524) = 0;
    LODWORD(v516) = 0;
    LODWORD(v512) = 0;
    LODWORD(v511) = 0;
    LODWORD(v510) = 0;
    LODWORD(v508) = 0;
    LODWORD(v504) = 0;
    LODWORD(v503) = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    int v69 = 0;
    int v70 = 0;
    double v71 = 495.0;
    goto LABEL_132;
  }
LABEL_913:
  int v211 = __sb__runningInSpringBoard();
  if (v211)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v550) = 0;
      LODWORD(v540) = 0;
      goto LABEL_923;
    }
  }
  else
  {
    v459 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v459 userInterfaceIdiom])
    {
      LODWORD(v540) = 0;
      LODWORD(v550) = 1;
      goto LABEL_923;
    }
  }
  LODWORD(v550) = v211 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v441 = [MEMORY[0x1E4F42D90] mainScreen];
      [v441 _referenceBounds];
    }
    LODWORD(v540) = v57 ^ 1;
    BSSizeRoundForScale();
    if (v230 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      LODWORD(v549) = 0;
      LODWORD(v548) = 0;
      LODWORD(v547) = 0;
      LODWORD(v535) = 0;
      LODWORD(v546) = 0;
      LODWORD(v545) = 0;
      LODWORD(v534) = 0;
      LODWORD(v528) = 0;
      LODWORD(v539) = 0;
      LODWORD(v538) = 0;
      LODWORD(v527) = 0;
      LODWORD(v526) = 0;
      LODWORD(v525) = 0;
      LODWORD(v519) = 0;
      LODWORD(v518) = 0;
      LODWORD(v517) = 0;
      LODWORD(v524) = 0;
      LODWORD(v516) = 0;
      LODWORD(v512) = 0;
      LODWORD(v511) = 0;
      LODWORD(v510) = 0;
      LODWORD(v508) = 0;
      LODWORD(v504) = 0;
      LODWORD(v503) = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      int v69 = 0;
      int v70 = 0;
      double v71 = 565.0;
      goto LABEL_132;
    }
  }
  else
  {
    LODWORD(v540) = 0;
  }
LABEL_923:
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v549) = 0;
      LODWORD(v548) = 0;
      goto LABEL_1007;
    }
  }
  else
  {
    v454 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v454 userInterfaceIdiom])
    {
      LODWORD(v548) = 0;
      LODWORD(v549) = 1;
      goto LABEL_1007;
    }
  }
  LODWORD(v549) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v438 = [MEMORY[0x1E4F42D90] mainScreen];
      [v438 _referenceBounds];
    }
    LODWORD(v548) = v57 ^ 1;
    BSSizeRoundForScale();
    if (v239 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_1055;
    }
  }
  else
  {
    LODWORD(v548) = 0;
  }
LABEL_1007:
  if (_SBF_Private_IsD54())
  {
    LODWORD(v547) = 0;
    LODWORD(v535) = 0;
    LODWORD(v546) = 0;
    LODWORD(v545) = 0;
    LODWORD(v534) = 0;
    LODWORD(v528) = 0;
    LODWORD(v539) = 0;
    LODWORD(v538) = 0;
    LODWORD(v527) = 0;
    LODWORD(v526) = 0;
    LODWORD(v525) = 0;
    LODWORD(v519) = 0;
    LODWORD(v518) = 0;
    LODWORD(v517) = 0;
    LODWORD(v524) = 0;
    LODWORD(v516) = 0;
    LODWORD(v512) = 0;
    LODWORD(v511) = 0;
    LODWORD(v510) = 0;
    LODWORD(v508) = 0;
    LODWORD(v504) = 0;
    LODWORD(v503) = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    int v69 = 0;
    int v70 = 0;
    double v71 = 495.0;
    goto LABEL_132;
  }
LABEL_1055:
  int v240 = __sb__runningInSpringBoard();
  if (v240)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v29 = 0;
      LODWORD(v535) = 0;
      goto LABEL_1091;
    }
  }
  else
  {
    v451 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v451 userInterfaceIdiom])
    {
      LODWORD(v535) = 0;
      uint64_t v29 = 1;
      goto LABEL_1091;
    }
  }
  uint64_t v29 = v240 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v431 = [MEMORY[0x1E4F42D90] mainScreen];
      [v431 _referenceBounds];
    }
    LODWORD(v535) = v57 ^ 1;
    BSSizeRoundForScale();
    if (v259 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      LODWORD(v547) = v29;
      LODWORD(v546) = 0;
      LODWORD(v545) = 0;
      LODWORD(v534) = 0;
      LODWORD(v528) = 0;
      LODWORD(v539) = 0;
      LODWORD(v538) = 0;
      LODWORD(v527) = 0;
      LODWORD(v526) = 0;
      LODWORD(v525) = 0;
      LODWORD(v519) = 0;
      LODWORD(v518) = 0;
      LODWORD(v517) = 0;
      LODWORD(v524) = 0;
      LODWORD(v516) = 0;
      LODWORD(v512) = 0;
      LODWORD(v511) = 0;
      LODWORD(v510) = 0;
      LODWORD(v508) = 0;
      LODWORD(v504) = 0;
      LODWORD(v503) = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      int v69 = 0;
      int v70 = 0;
      double v71 = 0.0;
      goto LABEL_132;
    }
  }
  else
  {
    LODWORD(v535) = 0;
  }
LABEL_1091:
  int v247 = __sb__runningInSpringBoard();
  LODWORD(v547) = v29;
  if (v247)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v546) = 0;
      uint64_t v57 = 0;
      goto LABEL_1128;
    }
  }
  else
  {
    v445 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v445 userInterfaceIdiom])
    {
      uint64_t v57 = 0;
      LODWORD(v546) = 1;
      goto LABEL_1128;
    }
  }
  LODWORD(v546) = v247 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v255 = __sb__runningInSpringBoard();
    if (v255)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v429 = [MEMORY[0x1E4F42D90] mainScreen];
      [v429 _referenceBounds];
    }
    uint64_t v57 = v255 ^ 1u;
    BSSizeRoundForScale();
    if (v264 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1172;
    }
  }
  else
  {
    uint64_t v57 = 0;
  }
LABEL_1128:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    LODWORD(v545) = v57;
    LODWORD(v534) = 0;
    LODWORD(v528) = 0;
    LODWORD(v539) = 0;
    LODWORD(v538) = 0;
    LODWORD(v527) = 0;
    LODWORD(v526) = 0;
    LODWORD(v525) = 0;
    LODWORD(v519) = 0;
    LODWORD(v518) = 0;
    LODWORD(v517) = 0;
    LODWORD(v524) = 0;
    LODWORD(v516) = 0;
    LODWORD(v512) = 0;
    LODWORD(v511) = 0;
    LODWORD(v510) = 0;
    LODWORD(v508) = 0;
    LODWORD(v504) = 0;
    LODWORD(v503) = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    int v69 = 0;
    int v70 = 0;
    double v71 = 0.0;
    goto LABEL_132;
  }
LABEL_1172:
  LODWORD(v545) = v57;
  if (!_SBF_Private_IsD93Like())
  {
LABEL_1176:
    LODWORD(v534) = 0;
    LODWORD(v528) = 0;
    goto LABEL_1226;
  }
  int v265 = __sb__runningInSpringBoard();
  if (v265)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_1176;
    }
  }
  else
  {
    v436 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v436 userInterfaceIdiom])
    {
      LODWORD(v528) = 0;
      LODWORD(v534) = 1;
      goto LABEL_1226;
    }
  }
  LODWORD(v534) = v265 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v275 = __sb__runningInSpringBoard();
    if (v275)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v417 = [MEMORY[0x1E4F42D90] mainScreen];
      [v417 _referenceBounds];
    }
    uint64_t v57 = v275 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v528) = v57;
    if (v289 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      LODWORD(v539) = 0;
      LODWORD(v538) = 0;
      LODWORD(v527) = 0;
      LODWORD(v526) = 0;
      LODWORD(v525) = 0;
      LODWORD(v519) = 0;
      LODWORD(v518) = 0;
      LODWORD(v517) = 0;
      LODWORD(v524) = 0;
      LODWORD(v516) = 0;
      LODWORD(v512) = 0;
      LODWORD(v511) = 0;
      LODWORD(v510) = 0;
      LODWORD(v508) = 0;
      LODWORD(v504) = 0;
      LODWORD(v503) = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      int v69 = 0;
      int v70 = 0;
      double v71 = 579.0;
      goto LABEL_132;
    }
  }
  else
  {
    LODWORD(v528) = 0;
  }
LABEL_1226:
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v539) = 0;
      LODWORD(v538) = 0;
      goto LABEL_1236;
    }
  }
  else
  {
    v443 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v443 userInterfaceIdiom])
    {
      LODWORD(v538) = 0;
      LODWORD(v539) = 1;
      goto LABEL_1236;
    }
  }
  LODWORD(v539) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v424 = [MEMORY[0x1E4F42D90] mainScreen];
      [v424 _referenceBounds];
    }
    LODWORD(v538) = v57 ^ 1;
    BSSizeRoundForScale();
    if (v276 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_1240;
    }
  }
  else
  {
    LODWORD(v538) = 0;
  }
LABEL_1236:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v527) = 0;
    LODWORD(v526) = 0;
    LODWORD(v525) = 0;
    LODWORD(v519) = 0;
    LODWORD(v518) = 0;
    LODWORD(v517) = 0;
    LODWORD(v524) = 0;
    LODWORD(v516) = 0;
    LODWORD(v512) = 0;
    LODWORD(v511) = 0;
    LODWORD(v510) = 0;
    LODWORD(v508) = 0;
    LODWORD(v504) = 0;
    LODWORD(v503) = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    int v69 = 0;
    int v70 = 0;
    double v71 = 475.0;
    goto LABEL_132;
  }
LABEL_1240:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_1244:
    LODWORD(v527) = 0;
    LODWORD(v526) = 0;
    goto LABEL_1347;
  }
  int v277 = __sb__runningInSpringBoard();
  if (v277)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_1244;
    }
  }
  else
  {
    v426 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v426 userInterfaceIdiom])
    {
      LODWORD(v526) = 0;
      LODWORD(v527) = 1;
      goto LABEL_1347;
    }
  }
  LODWORD(v527) = v277 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v300 = __sb__runningInSpringBoard();
    if (v300)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v29 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v29 _referenceBounds];
    }
    v421 = (void *)v29;
    uint64_t v57 = v300 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v526) = v57;
    if (v329 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v525) = 0;
      LODWORD(v519) = 0;
      LODWORD(v518) = 0;
      LODWORD(v517) = 0;
      LODWORD(v524) = 0;
      LODWORD(v516) = 0;
      LODWORD(v512) = 0;
      LODWORD(v511) = 0;
      LODWORD(v510) = 0;
      LODWORD(v508) = 0;
      LODWORD(v504) = 0;
      LODWORD(v503) = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      int v69 = 0;
      int v70 = 0;
      double v71 = 567.0;
      goto LABEL_132;
    }
  }
  else
  {
    LODWORD(v526) = 0;
  }
LABEL_1347:
  uint64_t v57 = __sb__runningInSpringBoard();
  uint64_t v29 = (uint64_t)&off_1D8504000;
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v525) = 0;
      LODWORD(v519) = 0;
      goto LABEL_1357;
    }
  }
  else
  {
    v434 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v434 userInterfaceIdiom])
    {
      LODWORD(v519) = 0;
      LODWORD(v525) = 1;
      goto LABEL_1357;
    }
  }
  LODWORD(v525) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v415 = [MEMORY[0x1E4F42D90] mainScreen];
      [v415 _referenceBounds];
    }
    LODWORD(v519) = v57 ^ 1;
    BSSizeRoundForScale();
    if (v301 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1361;
    }
  }
  else
  {
    LODWORD(v519) = 0;
  }
LABEL_1357:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v518) = 0;
    LODWORD(v517) = 0;
    LODWORD(v524) = 0;
    LODWORD(v516) = 0;
    LODWORD(v512) = 0;
    LODWORD(v511) = 0;
    LODWORD(v510) = 0;
    LODWORD(v508) = 0;
    LODWORD(v504) = 0;
    LODWORD(v503) = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    int v69 = 0;
    int v70 = 0;
    double v71 = 465.33333;
    goto LABEL_132;
  }
LABEL_1361:
  int v302 = __sb__runningInSpringBoard();
  if (v302)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v518) = 0;
      LODWORD(v517) = 0;
      goto LABEL_1371;
    }
  }
  else
  {
    v427 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v427 userInterfaceIdiom])
    {
      LODWORD(v517) = 0;
      LODWORD(v518) = 1;
      goto LABEL_1371;
    }
  }
  LODWORD(v518) = v302 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v411 = [MEMORY[0x1E4F42D90] mainScreen];
      [v411 _referenceBounds];
    }
    LODWORD(v517) = v57 ^ 1;
    BSSizeRoundForScale();
    if (v325 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      LODWORD(v524) = 0;
      LODWORD(v516) = 0;
      LODWORD(v512) = 0;
      LODWORD(v511) = 0;
      LODWORD(v510) = 0;
      LODWORD(v508) = 0;
      LODWORD(v504) = 0;
      LODWORD(v503) = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      int v69 = 0;
      int v70 = 0;
      double v71 = 0.0;
      goto LABEL_132;
    }
  }
  else
  {
    LODWORD(v517) = 0;
  }
LABEL_1371:
  int v303 = __sb__runningInSpringBoard();
  if (v303)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v524) = 0;
      uint64_t v57 = 0;
      goto LABEL_1455;
    }
  }
  else
  {
    v422 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v422 userInterfaceIdiom])
    {
      uint64_t v57 = 0;
      LODWORD(v524) = 1;
      goto LABEL_1455;
    }
  }
  LODWORD(v524) = v303 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v321 = __sb__runningInSpringBoard();
    if (v321)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v408 = [MEMORY[0x1E4F42D90] mainScreen];
      [v408 _referenceBounds];
    }
    uint64_t v57 = v321 ^ 1u;
    BSSizeRoundForScale();
    if (v334 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1503;
    }
  }
  else
  {
    uint64_t v57 = 0;
  }
LABEL_1455:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    LODWORD(v516) = v57;
    LODWORD(v512) = 0;
    LODWORD(v511) = 0;
    LODWORD(v510) = 0;
    LODWORD(v508) = 0;
    LODWORD(v504) = 0;
    LODWORD(v503) = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    int v69 = 0;
    int v70 = 0;
    double v71 = 0.0;
    goto LABEL_132;
  }
LABEL_1503:
  LODWORD(v516) = v57;
  int v335 = __sb__runningInSpringBoard();
  if (v335)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v512) = 0;
      LODWORD(v511) = 0;
      goto LABEL_1539;
    }
  }
  else
  {
    v419 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v419 userInterfaceIdiom])
    {
      LODWORD(v511) = 0;
      LODWORD(v512) = 1;
      goto LABEL_1539;
    }
  }
  LODWORD(v512) = v335 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v406 = [MEMORY[0x1E4F42D90] mainScreen];
      [v406 _referenceBounds];
    }
    LODWORD(v511) = v57 ^ 1;
    BSSizeRoundForScale();
    if (v350 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v510) = 0;
      LODWORD(v508) = 0;
      LODWORD(v504) = 0;
      LODWORD(v503) = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      int v69 = 0;
      int v70 = 0;
      double v71 = 567.33;
      goto LABEL_132;
    }
  }
  else
  {
    LODWORD(v511) = 0;
  }
LABEL_1539:
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v510) = 0;
      LODWORD(v508) = 0;
      goto LABEL_1575;
    }
  }
  else
  {
    v413 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v413 userInterfaceIdiom])
    {
      LODWORD(v508) = 0;
      LODWORD(v510) = 1;
      goto LABEL_1575;
    }
  }
  LODWORD(v510) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    LODWORD(v508) = 0;
    goto LABEL_1575;
  }
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v404 = [MEMORY[0x1E4F42D90] mainScreen];
    [v404 _referenceBounds];
  }
  LODWORD(v508) = v57 ^ 1;
  BSSizeRoundForScale();
  if (v354 < *(double *)(MEMORY[0x1E4FA6E50] + 104))
  {
LABEL_1575:
    if (_SBF_Private_IsD53())
    {
      LODWORD(v504) = 0;
      LODWORD(v503) = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      int v69 = 0;
      int v70 = 0;
      double v71 = 465.33333;
      goto LABEL_132;
    }
  }
  uint64_t v57 = (uint64_t)&off_1D8504000;
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice()) {
    goto LABEL_1618;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16()) {
    goto LABEL_1620;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
LABEL_1618:
    LODWORD(v504) = 0;
    LODWORD(v503) = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    int v69 = 0;
    int v70 = 0;
    double v71 = 594.0;
    goto LABEL_132;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
LABEL_1620:
    LODWORD(v504) = 0;
    LODWORD(v503) = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    int v69 = 0;
    int v70 = 0;
    double v71 = 506.66666;
    goto LABEL_132;
  }
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v504) = 0;
      LODWORD(v503) = 0;
      goto LABEL_1679;
    }
  }
  else
  {
    v403 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v403 userInterfaceIdiom])
    {
      LODWORD(v503) = 0;
      LODWORD(v504) = 1;
      goto LABEL_1679;
    }
  }
  LODWORD(v504) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v362 = __sb__runningInSpringBoard();
    if (v362)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v397 = [MEMORY[0x1E4F42D90] mainScreen];
      [v397 _referenceBounds];
    }
    LODWORD(v503) = v362 ^ 1;
    BSSizeRoundForScale();
    if (v385 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      int v69 = 0;
      int v70 = 0;
      double v71 = 0.0;
      goto LABEL_132;
    }
  }
  else
  {
    LODWORD(v503) = 0;
  }
LABEL_1679:
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v66 = 0;
      int v67 = 0;
      goto LABEL_1719;
    }
  }
  else
  {
    v402 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v402 userInterfaceIdiom])
    {
      int v67 = 0;
      int v66 = 1;
      goto LABEL_1719;
    }
  }
  int v66 = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v396 = [MEMORY[0x1E4F42D90] mainScreen];
      [v396 _referenceBounds];
    }
    int v67 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v389 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v68 = 0;
      int v69 = 0;
      int v70 = 0;
      double v71 = 0.0;
      goto LABEL_132;
    }
  }
  else
  {
    int v67 = 0;
  }
LABEL_1719:
  uint64_t v29 = __sb__runningInSpringBoard();
  if (!v29)
  {
    v401 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v401 userInterfaceIdiom])
    {
      int v69 = 0;
      int v68 = 1;
      goto LABEL_1759;
    }
LABEL_1755:
    int v68 = v29 ^ 1;
    uint64_t v29 = __sb__runningInSpringBoard();
    if (v29)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v57 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v57 _referenceBounds];
    }
    int v69 = v29 ^ 1;
    BSSizeRoundForScale();
    if (v376 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
      goto LABEL_1762;
    }
    goto LABEL_1759;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_1755;
  }
  int v68 = 0;
  int v69 = 0;
LABEL_1759:
  uint64_t v377 = __sb__runningInSpringBoard();
  if (v377)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_1762:
      int v70 = 0;
      double v71 = 0.0;
      goto LABEL_132;
    }
  }
  else
  {
    uint64_t v29 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v29 userInterfaceIdiom])
    {
      double v71 = 0.0;
      int v70 = 1;
      goto LABEL_132;
    }
  }
  int v70 = v377 ^ 1;
  int v393 = __sb__runningInSpringBoard();
  if (v393)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v377 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v377 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v71 = 0.0;
  if (v393 != 1) {

  }
LABEL_132:
  if (v70) {

  }
  if (v69) {
  v78 = (void *)0x1E4F42000;
  }
  if (v68) {

  }
  uint64_t v79 = (uint64_t)v497;
  if (v67) {

  }
  if (v66) {
  if (v503)
  }

  if (v504) {
  if (v508)
  }

  if (v510) {
  if (v511)
  }

  if (v512) {
  if (v516)
  }

  if (v524) {
  if (v517)
  }

  if (v518) {
  if (v519)
  }

  if (v525) {
  if (v526)
  }

  if (v527) {
  if (v538)
  }

  if (v539) {
  if (v528)
  }

  if (v534) {
  if (v545)
  }

  if (v546) {
  if (v535)
  }

  if (v547) {
  if (v548)
  }

  if (v549) {
  if (v540)
  }

  if (v550) {
  if (v560)
  }

  if (HIDWORD(v560)) {
  if (v563)
  }

  if (HIDWORD(v563)) {
  if (v566)
  }

  if (v576) {
  if (HIDWORD(v576))
  }

  if (v579) {
  if (v586)
  }

  if (HIDWORD(v586)) {
  if (v589)
  }

  if (HIDWORD(v589)) {
  if (v592)
  }

  if (HIDWORD(v592)) {
  if (LODWORD(v595[0]))
  }

  if (HIDWORD(v595[0])) {
  if (LODWORD(v595[1]))
  }

  if (HIDWORD(v595[1])) {
  if (LODWORD(v595[2]))
  }

  if (HIDWORD(v595[2])) {
  if (LODWORD(v595[3]))
  }

  if (v499) {
  if (v500)
  }

  if (HIDWORD(v500)) {
  if (v501)
  }

  if (v502) {
  if (v505)
  }

  if (v506) {
  if (v507)
  }

  if (v509) {
  if (v513)
  }

  if (v514) {
  if (v515)
  }

  if (v520) {
  if (v529)
  }

  if (v521) {
  if (v522)
  }

  if (v523) {
  if (v530)
  }

  if (v531) {
  if (v532)
  }

  if (v541) {
  if (v542)
  }

  if (v533) {
  if (v536)
  }

  if (v551) {
  if (v554)
  }

  if (v537) {
  if (v543)
  }

  if (HIDWORD(v554)) {
  if (v557)
  }

  if (v544) {
  if (HIDWORD(v557))
  }

  if (v569) {
  if (v570)
  }

  if (HIDWORD(v570)) {
  if (v573)
  }

  if (HIDWORD(v573)) {
  if (v582)
  }

  if (v583) {
  if (HIDWORD(v583))
  }

  if (HIDWORD(v595[3])) {
  if (LODWORD(v595[4]))
  }

  if (HIDWORD(v595[4])) {
  if (LODWORD(v595[5]))
  }

  if (HIDWORD(v595[5])) {
  if (LODWORD(v595[6]))
  }

  if (HIDWORD(v595[6])) {
  if (LODWORD(v595[7]))
  }

  if (HIDWORD(v595[7])) {
  if (LODWORD(v595[8]))
  }

  if (HIDWORD(v595[8])) {
  if (v596)
  }

  if (HIDWORD(v596)) {
  int v80 = __sb__runningInSpringBoard();
  }
  if (v80)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v81 = 0;
      int v82 = 0;
      goto LABEL_351;
    }
  }
  else
  {
    v550 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v550 userInterfaceIdiom] != 1)
    {
      int v82 = 0;
      int v81 = 1;
      goto LABEL_351;
    }
  }
  int v81 = v80 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v83 = __sb__runningInSpringBoard();
    if (v83)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v541 = [MEMORY[0x1E4F42D90] mainScreen];
      [v541 _referenceBounds];
    }
    int v82 = v83 ^ 1;
    BSSizeRoundForScale();
    if (v107 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v106 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      LODWORD(v596) = v83 ^ 1;
      HIDWORD(v596) = v81;
      memset(v595, 0, sizeof(v595));
      uint64_t v593 = 0;
      uint64_t v584 = 0;
      uint64_t v590 = 0;
      uint64_t v587 = 0;
      uint64_t v577 = 0;
      uint64_t v574 = 0;
      uint64_t v580 = 0;
      uint64_t v571 = 0;
      uint64_t v567 = 0;
      uint64_t v564 = 0;
      uint64_t v561 = 0;
      uint64_t v558 = 0;
      uint64_t v555 = 0;
      int v552 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      int v100 = 0;
      int v101 = 0;
      double v102 = 0.0;
      goto LABEL_405;
    }
  }
  else
  {
    int v82 = 0;
  }
LABEL_351:
  int v84 = __sb__runningInSpringBoard();
  unint64_t v596 = __PAIR64__(v81, v82);
  if (v84)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v85 = 0;
      int v86 = 0;
      goto LABEL_360;
    }
  }
  else
  {
    v549 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v549 userInterfaceIdiom] != 1)
    {
      int v86 = 0;
      int v85 = 1;
      goto LABEL_360;
    }
  }
  int v85 = v84 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v87 = __sb__runningInSpringBoard();
    if (v87)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v540 = [MEMORY[0x1E4F42D90] mainScreen];
      [v540 _referenceBounds];
    }
    int v86 = v87 ^ 1;
    BSSizeRoundForScale();
    if (v108 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      LODWORD(v595[8]) = v87 ^ 1;
      HIDWORD(v595[8]) = v85;
      memset(v595, 0, 64);
      uint64_t v593 = 0;
      uint64_t v584 = 0;
      uint64_t v590 = 0;
      uint64_t v587 = 0;
      uint64_t v577 = 0;
      uint64_t v574 = 0;
      uint64_t v580 = 0;
      uint64_t v571 = 0;
      uint64_t v567 = 0;
      uint64_t v564 = 0;
      uint64_t v561 = 0;
      uint64_t v558 = 0;
      uint64_t v555 = 0;
      int v552 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      int v100 = 0;
      int v101 = 0;
      double v102 = 0.0;
      goto LABEL_405;
    }
  }
  else
  {
    int v86 = 0;
  }
LABEL_360:
  int v88 = __sb__runningInSpringBoard();
  v595[8] = __PAIR64__(v85, v86);
  if (v88)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v89 = 0;
      int v90 = 0;
      goto LABEL_369;
    }
  }
  else
  {
    v548 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v548 userInterfaceIdiom] != 1)
    {
      int v90 = 0;
      int v89 = 1;
      goto LABEL_369;
    }
  }
  int v89 = v88 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v91 = __sb__runningInSpringBoard();
    if (v91)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v539 = [MEMORY[0x1E4F42D90] mainScreen];
      [v539 _referenceBounds];
    }
    int v90 = v91 ^ 1;
    BSSizeRoundForScale();
    if (v109 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      LODWORD(v595[7]) = v91 ^ 1;
      HIDWORD(v595[7]) = v89;
      memset(v595, 0, 56);
      uint64_t v593 = 0;
      uint64_t v584 = 0;
      uint64_t v590 = 0;
      uint64_t v587 = 0;
      uint64_t v577 = 0;
      uint64_t v574 = 0;
      uint64_t v580 = 0;
      uint64_t v571 = 0;
      uint64_t v567 = 0;
      uint64_t v564 = 0;
      uint64_t v561 = 0;
      uint64_t v558 = 0;
      uint64_t v555 = 0;
      int v552 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      int v100 = 0;
      int v101 = 0;
      double v102 = 0.0;
      goto LABEL_405;
    }
  }
  else
  {
    int v90 = 0;
  }
LABEL_369:
  int v92 = __sb__runningInSpringBoard();
  v595[7] = __PAIR64__(v89, v90);
  if (v92)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v79 = 0;
      LODWORD(v595[6]) = 0;
      goto LABEL_378;
    }
  }
  else
  {
    v547 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v547 userInterfaceIdiom] != 1)
    {
      LODWORD(v595[6]) = 0;
      uint64_t v79 = 1;
      goto LABEL_378;
    }
  }
  uint64_t v79 = v92 ^ 1u;
  int v93 = __sb__runningInSpringBoard();
  if (v93)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v544 = [MEMORY[0x1E4F42D90] mainScreen];
    [v544 _referenceBounds];
  }
  LODWORD(v595[6]) = v93 ^ 1;
  BSSizeRoundForScale();
  if (v94 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    HIDWORD(v595[6]) = v79;
    memset(v595, 0, 48);
    uint64_t v593 = 0;
    uint64_t v584 = 0;
    uint64_t v590 = 0;
    uint64_t v587 = 0;
    uint64_t v577 = 0;
    uint64_t v574 = 0;
    uint64_t v580 = 0;
    uint64_t v571 = 0;
    uint64_t v567 = 0;
    uint64_t v564 = 0;
    uint64_t v561 = 0;
    uint64_t v558 = 0;
    uint64_t v555 = 0;
    int v552 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    int v100 = 0;
    int v101 = 0;
    double v102 = 0.0;
    goto LABEL_405;
  }
LABEL_378:
  int v95 = __sb__runningInSpringBoard();
  HIDWORD(v595[6]) = v79;
  if (v95)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v595[5] = 0;
      goto LABEL_388;
    }
  }
  else
  {
    v546 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v546 userInterfaceIdiom] != 1)
    {
      v595[5] = 0x100000000;
      goto LABEL_388;
    }
  }
  HIDWORD(v595[5]) = v95 ^ 1;
  int v96 = __sb__runningInSpringBoard();
  if (v96)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v542 = [MEMORY[0x1E4F42D90] mainScreen];
    [v542 _referenceBounds];
  }
  LODWORD(v595[5]) = v96 ^ 1;
  BSSizeRoundForScale();
  if (v103 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    memset(v595, 0, 40);
    uint64_t v593 = 0;
    uint64_t v584 = 0;
    uint64_t v590 = 0;
    uint64_t v587 = 0;
    uint64_t v577 = 0;
    uint64_t v574 = 0;
    uint64_t v580 = 0;
    uint64_t v571 = 0;
    uint64_t v567 = 0;
    uint64_t v564 = 0;
    uint64_t v561 = 0;
    uint64_t v558 = 0;
    uint64_t v555 = 0;
    int v552 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    int v100 = 0;
    int v101 = 0;
    double v102 = 0.0;
    goto LABEL_405;
  }
LABEL_388:
  int v104 = __sb__runningInSpringBoard();
  if (v104)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v595[4] = 0;
      goto LABEL_716;
    }
  }
  else
  {
    v545 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v545 userInterfaceIdiom] != 1)
    {
      v595[4] = 0x100000000;
      goto LABEL_716;
    }
  }
  HIDWORD(v595[4]) = v104 ^ 1;
  int v105 = __sb__runningInSpringBoard();
  if (v105)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v538 = [MEMORY[0x1E4F42D90] mainScreen];
    [v538 _referenceBounds];
  }
  LODWORD(v595[4]) = v105 ^ 1;
  BSSizeRoundForScale();
  if (v175 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    memset(v595, 0, 32);
    uint64_t v593 = 0;
    uint64_t v584 = 0;
    uint64_t v590 = 0;
    uint64_t v587 = 0;
    uint64_t v577 = 0;
    uint64_t v574 = 0;
    uint64_t v580 = 0;
    uint64_t v571 = 0;
    uint64_t v567 = 0;
    uint64_t v564 = 0;
    uint64_t v561 = 0;
    uint64_t v558 = 0;
    uint64_t v555 = 0;
    int v552 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    int v100 = 0;
    int v101 = 0;
    double v102 = 0.0;
    goto LABEL_405;
  }
LABEL_716:
  int v176 = __sb__runningInSpringBoard();
  if (v176)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_718;
    }
LABEL_724:
    memset(v595, 0, 28);
    uint64_t v593 = 0;
    uint64_t v584 = 0;
    uint64_t v590 = 0;
    uint64_t v587 = 0;
    uint64_t v577 = 0;
    uint64_t v574 = 0;
    uint64_t v580 = 0;
    uint64_t v571 = 0;
    uint64_t v567 = 0;
    uint64_t v564 = 0;
    uint64_t v561 = 0;
    uint64_t v558 = 0;
    uint64_t v555 = 0;
    int v552 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    int v100 = 0;
    int v101 = 0;
    double v102 = 0.0;
    HIDWORD(v595[3]) = v176 ^ 1;
    goto LABEL_405;
  }
  v543 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v543 userInterfaceIdiom] == 1) {
    goto LABEL_724;
  }
LABEL_718:
  HIDWORD(v595[3]) = v176 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_722:
    *(void *)((char *)&v595[2] + 4) = 0;
    goto LABEL_803;
  }
  int v177 = __sb__runningInSpringBoard();
  if (v177)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_722;
    }
  }
  else
  {
    v536 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v536 userInterfaceIdiom])
    {
      HIDWORD(v595[2]) = 0;
      LODWORD(v595[3]) = 1;
      goto LABEL_803;
    }
  }
  LODWORD(v595[3]) = v177 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v188 = __sb__runningInSpringBoard();
    if (v188)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v528 = [MEMORY[0x1E4F42D90] mainScreen];
      [v528 _referenceBounds];
    }
    HIDWORD(v595[2]) = v188 ^ 1;
    BSSizeRoundForScale();
    if (v200 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      memset(v595, 0, 20);
      uint64_t v593 = 0;
      uint64_t v584 = 0;
      uint64_t v590 = 0;
      uint64_t v587 = 0;
      uint64_t v577 = 0;
      uint64_t v574 = 0;
      uint64_t v580 = 0;
      uint64_t v571 = 0;
      uint64_t v567 = 0;
      uint64_t v564 = 0;
      uint64_t v561 = 0;
      uint64_t v558 = 0;
      uint64_t v555 = 0;
      int v552 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      int v100 = 0;
      int v101 = 0;
      double v102 = 83.0;
      goto LABEL_405;
    }
  }
  else
  {
    HIDWORD(v595[2]) = 0;
  }
LABEL_803:
  int v189 = __sb__runningInSpringBoard();
  if (v189)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)((char *)&v595[1] + 4) = 0;
      goto LABEL_813;
    }
  }
  else
  {
    v537 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v537 userInterfaceIdiom])
    {
      HIDWORD(v595[1]) = 0;
      LODWORD(v595[2]) = 1;
      goto LABEL_813;
    }
  }
  LODWORD(v595[2]) = v189 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v190 = __sb__runningInSpringBoard();
    if (v190)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v532 = [MEMORY[0x1E4F42D90] mainScreen];
      [v532 _referenceBounds];
    }
    HIDWORD(v595[1]) = v190 ^ 1;
    BSSizeRoundForScale();
    if (v191 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_817;
    }
  }
  else
  {
    HIDWORD(v595[1]) = 0;
  }
LABEL_813:
  if (_SBF_Private_IsD94Like())
  {
    *(void *)((char *)v595 + 4) = 0;
    LODWORD(v595[0]) = 0;
    uint64_t v593 = 0;
    uint64_t v584 = 0;
    uint64_t v590 = 0;
    uint64_t v587 = 0;
    uint64_t v577 = 0;
    uint64_t v574 = 0;
    uint64_t v580 = 0;
    uint64_t v571 = 0;
    uint64_t v567 = 0;
    uint64_t v564 = 0;
    uint64_t v561 = 0;
    uint64_t v558 = 0;
    uint64_t v555 = 0;
    int v552 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    int v100 = 0;
    int v101 = 0;
    double v102 = 73.0;
    goto LABEL_405;
  }
LABEL_817:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_821:
    *(void *)((char *)v595 + 4) = 0;
    goto LABEL_933;
  }
  int v192 = __sb__runningInSpringBoard();
  if (v192)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_821;
    }
  }
  else
  {
    v533 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v533 userInterfaceIdiom])
    {
      HIDWORD(v595[0]) = 0;
      LODWORD(v595[1]) = 1;
      goto LABEL_933;
    }
  }
  LODWORD(v595[1]) = v192 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v212 = __sb__runningInSpringBoard();
    if (v212)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v79 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v79 _referenceBounds];
    }
    v530 = (void *)v79;
    HIDWORD(v595[0]) = v212 ^ 1;
    BSSizeRoundForScale();
    if (v235 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      LODWORD(v595[0]) = 0;
      uint64_t v593 = 0;
      uint64_t v584 = 0;
      uint64_t v590 = 0;
      uint64_t v587 = 0;
      uint64_t v577 = 0;
      uint64_t v574 = 0;
      uint64_t v580 = 0;
      uint64_t v571 = 0;
      uint64_t v567 = 0;
      uint64_t v564 = 0;
      uint64_t v561 = 0;
      uint64_t v558 = 0;
      uint64_t v555 = 0;
      int v552 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      int v100 = 0;
      int v101 = 0;
      double v102 = 71.0;
      goto LABEL_405;
    }
  }
  else
  {
    HIDWORD(v595[0]) = 0;
  }
LABEL_933:
  int v213 = __sb__runningInSpringBoard();
  uint64_t v79 = (uint64_t)&off_1D8504000;
  if (v213)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v595[0]) = 0;
      HIDWORD(v593) = 0;
      goto LABEL_943;
    }
  }
  else
  {
    v535 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v535 userInterfaceIdiom])
    {
      HIDWORD(v593) = 0;
      LODWORD(v595[0]) = 1;
      goto LABEL_943;
    }
  }
  LODWORD(v595[0]) = v213 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v214 = __sb__runningInSpringBoard();
    if (v214)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v527 = [MEMORY[0x1E4F42D90] mainScreen];
      [v527 _referenceBounds];
    }
    HIDWORD(v593) = v214 ^ 1;
    BSSizeRoundForScale();
    if (v215 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_947;
    }
  }
  else
  {
    HIDWORD(v593) = 0;
  }
LABEL_943:
  if (_SBF_Private_IsD64Like())
  {
    LODWORD(v593) = 0;
    uint64_t v584 = 0;
    uint64_t v590 = 0;
    uint64_t v587 = 0;
    uint64_t v577 = 0;
    uint64_t v574 = 0;
    uint64_t v580 = 0;
    uint64_t v571 = 0;
    uint64_t v567 = 0;
    uint64_t v564 = 0;
    uint64_t v561 = 0;
    uint64_t v558 = 0;
    uint64_t v555 = 0;
    int v552 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    int v100 = 0;
    int v101 = 0;
    double v102 = 62.33333;
    goto LABEL_405;
  }
LABEL_947:
  int v216 = __sb__runningInSpringBoard();
  if (v216)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v593) = 0;
      LODWORD(v584) = 0;
      goto LABEL_957;
    }
  }
  else
  {
    v534 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v534 userInterfaceIdiom])
    {
      LODWORD(v584) = 0;
      LODWORD(v593) = 1;
      goto LABEL_957;
    }
  }
  LODWORD(v593) = v216 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v217 = __sb__runningInSpringBoard();
    if (v217)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v524 = [MEMORY[0x1E4F42D90] mainScreen];
      [v524 _referenceBounds];
    }
    LODWORD(v584) = v217 ^ 1;
    BSSizeRoundForScale();
    if (v231 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      uint64_t v590 = 0;
      uint64_t v587 = 0;
      uint64_t v577 = 0;
      HIDWORD(v584) = 0;
      uint64_t v574 = 0;
      uint64_t v580 = 0;
      uint64_t v571 = 0;
      uint64_t v567 = 0;
      uint64_t v564 = 0;
      uint64_t v561 = 0;
      uint64_t v558 = 0;
      uint64_t v555 = 0;
      int v552 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      int v100 = 0;
      int v101 = 0;
      double v102 = 71.0;
      goto LABEL_405;
    }
  }
  else
  {
    LODWORD(v584) = 0;
  }
LABEL_957:
  int v218 = __sb__runningInSpringBoard();
  if (v218)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v590 = 0;
      goto LABEL_1013;
    }
  }
  else
  {
    v531 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v531 userInterfaceIdiom])
    {
      uint64_t v590 = 0x100000000;
      goto LABEL_1013;
    }
  }
  HIDWORD(v590) = v218 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v227 = __sb__runningInSpringBoard();
    if (v227)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v523 = [MEMORY[0x1E4F42D90] mainScreen];
      [v523 _referenceBounds];
    }
    LODWORD(v590) = v227 ^ 1;
    BSSizeRoundForScale();
    if (v241 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_1063;
    }
  }
  else
  {
    LODWORD(v590) = 0;
  }
LABEL_1013:
  if (_SBF_Private_IsD54())
  {
    uint64_t v587 = 0;
    uint64_t v577 = 0;
    HIDWORD(v584) = 0;
    uint64_t v574 = 0;
    uint64_t v580 = 0;
    uint64_t v571 = 0;
    uint64_t v567 = 0;
    uint64_t v564 = 0;
    uint64_t v561 = 0;
    uint64_t v558 = 0;
    uint64_t v555 = 0;
    int v552 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    int v100 = 0;
    int v101 = 0;
    double v102 = 62.33333;
    goto LABEL_405;
  }
LABEL_1063:
  int v242 = __sb__runningInSpringBoard();
  if (v242)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v79 = 0;
      HIDWORD(v577) = 0;
      goto LABEL_1101;
    }
  }
  else
  {
    v529 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v529 userInterfaceIdiom])
    {
      HIDWORD(v577) = 0;
      uint64_t v79 = 1;
      goto LABEL_1101;
    }
  }
  uint64_t v79 = v242 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v248 = __sb__runningInSpringBoard();
    if (v248)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v520 = [MEMORY[0x1E4F42D90] mainScreen];
      [v520 _referenceBounds];
    }
    HIDWORD(v577) = v248 ^ 1;
    BSSizeRoundForScale();
    if (v260 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      HIDWORD(v587) = v79;
      LODWORD(v587) = 0;
      HIDWORD(v584) = 0;
      LODWORD(v577) = 0;
      uint64_t v574 = 0;
      uint64_t v580 = 0;
      uint64_t v571 = 0;
      uint64_t v567 = 0;
      uint64_t v564 = 0;
      uint64_t v561 = 0;
      uint64_t v558 = 0;
      uint64_t v555 = 0;
      int v552 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      int v100 = 0;
      int v101 = 0;
      double v102 = 0.0;
      goto LABEL_405;
    }
  }
  else
  {
    HIDWORD(v577) = 0;
  }
LABEL_1101:
  int v249 = __sb__runningInSpringBoard();
  HIDWORD(v587) = v79;
  if (v249)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v587) = 0;
      int v250 = 0;
      goto LABEL_1135;
    }
  }
  else
  {
    v526 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v526 userInterfaceIdiom])
    {
      int v250 = 0;
      LODWORD(v587) = 1;
      goto LABEL_1135;
    }
  }
  LODWORD(v587) = v249 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v256 = __sb__runningInSpringBoard();
    if (v256)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v519 = [MEMORY[0x1E4F42D90] mainScreen];
      [v519 _referenceBounds];
    }
    int v250 = v256 ^ 1;
    BSSizeRoundForScale();
    if (v266 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1181;
    }
  }
  else
  {
    int v250 = 0;
  }
LABEL_1135:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    HIDWORD(v584) = v250;
    LODWORD(v577) = 0;
    uint64_t v574 = 0;
    uint64_t v580 = 0;
    uint64_t v571 = 0;
    uint64_t v567 = 0;
    uint64_t v564 = 0;
    uint64_t v561 = 0;
    uint64_t v558 = 0;
    uint64_t v555 = 0;
    int v552 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    int v100 = 0;
    int v101 = 0;
    double v102 = 0.0;
    goto LABEL_405;
  }
LABEL_1181:
  HIDWORD(v584) = v250;
  if (!_SBF_Private_IsD93Like())
  {
LABEL_1185:
    LODWORD(v577) = 0;
    HIDWORD(v574) = 0;
    goto LABEL_1251;
  }
  int v267 = __sb__runningInSpringBoard();
  if (v267)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_1185;
    }
  }
  else
  {
    v522 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v522 userInterfaceIdiom])
    {
      HIDWORD(v574) = 0;
      LODWORD(v577) = 1;
      goto LABEL_1251;
    }
  }
  LODWORD(v577) = v267 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v278 = __sb__runningInSpringBoard();
    if (v278)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v513 = [MEMORY[0x1E4F42D90] mainScreen];
      [v513 _referenceBounds];
    }
    BSSizeRoundForScale();
    HIDWORD(v574) = v278 ^ 1;
    if (v290 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      uint64_t v580 = 0;
      LODWORD(v574) = 0;
      uint64_t v571 = 0;
      uint64_t v567 = 0;
      uint64_t v564 = 0;
      uint64_t v561 = 0;
      uint64_t v558 = 0;
      uint64_t v555 = 0;
      int v552 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      int v100 = 0;
      int v101 = 0;
      double v102 = 37.0;
      goto LABEL_405;
    }
  }
  else
  {
    HIDWORD(v574) = 0;
  }
LABEL_1251:
  int v279 = __sb__runningInSpringBoard();
  if (v279)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v580 = 0;
      goto LABEL_1261;
    }
  }
  else
  {
    v525 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v525 userInterfaceIdiom])
    {
      uint64_t v580 = 0x100000000;
      goto LABEL_1261;
    }
  }
  HIDWORD(v580) = v279 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v280 = __sb__runningInSpringBoard();
    if (v280)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v516 = [MEMORY[0x1E4F42D90] mainScreen];
      [v516 _referenceBounds];
    }
    LODWORD(v580) = v280 ^ 1;
    BSSizeRoundForScale();
    if (v281 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_1265;
    }
  }
  else
  {
    LODWORD(v580) = 0;
  }
LABEL_1261:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v574) = 0;
    uint64_t v571 = 0;
    uint64_t v567 = 0;
    uint64_t v564 = 0;
    uint64_t v561 = 0;
    uint64_t v558 = 0;
    uint64_t v555 = 0;
    int v552 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    int v100 = 0;
    int v101 = 0;
    double v102 = 30.333333;
    goto LABEL_405;
  }
LABEL_1265:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_1269:
    LODWORD(v574) = 0;
    HIDWORD(v571) = 0;
    goto LABEL_1381;
  }
  int v282 = __sb__runningInSpringBoard();
  if (v282)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_1269;
    }
  }
  else
  {
    v517 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v517 userInterfaceIdiom])
    {
      HIDWORD(v571) = 0;
      LODWORD(v574) = 1;
      goto LABEL_1381;
    }
  }
  LODWORD(v574) = v282 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v304 = __sb__runningInSpringBoard();
    if (v304)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v509 = [MEMORY[0x1E4F42D90] mainScreen];
      [v509 _referenceBounds];
    }
    BSSizeRoundForScale();
    HIDWORD(v571) = v304 ^ 1;
    if (v330 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v571) = 0;
      uint64_t v567 = 0;
      uint64_t v564 = 0;
      uint64_t v561 = 0;
      uint64_t v558 = 0;
      uint64_t v555 = 0;
      int v552 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      int v100 = 0;
      int v101 = 0;
      double v102 = 28.0;
      goto LABEL_405;
    }
  }
  else
  {
    HIDWORD(v571) = 0;
  }
LABEL_1381:
  int v305 = __sb__runningInSpringBoard();
  if (v305)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v571) = 0;
      LODWORD(v567) = 0;
      goto LABEL_1391;
    }
  }
  else
  {
    v521 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v521 userInterfaceIdiom])
    {
      LODWORD(v567) = 0;
      LODWORD(v571) = 1;
      goto LABEL_1391;
    }
  }
  LODWORD(v571) = v305 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v306 = __sb__runningInSpringBoard();
    if (v306)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v512 = [MEMORY[0x1E4F42D90] mainScreen];
      [v512 _referenceBounds];
    }
    LODWORD(v567) = v306 ^ 1;
    BSSizeRoundForScale();
    if (v307 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1395;
    }
  }
  else
  {
    LODWORD(v567) = 0;
  }
LABEL_1391:
  if (_SBF_Private_IsD63Like())
  {
    uint64_t v564 = 0;
    HIDWORD(v567) = 0;
    uint64_t v561 = 0;
    uint64_t v558 = 0;
    uint64_t v555 = 0;
    int v552 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    int v100 = 0;
    int v101 = 0;
    double v102 = 23.0;
    goto LABEL_405;
  }
LABEL_1395:
  int v308 = __sb__runningInSpringBoard();
  if (v308)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v564 = 0;
      goto LABEL_1405;
    }
  }
  else
  {
    v518 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v518 userInterfaceIdiom])
    {
      uint64_t v564 = 0x100000000;
      goto LABEL_1405;
    }
  }
  HIDWORD(v564) = v308 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v309 = __sb__runningInSpringBoard();
    if (v309)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v510 = [MEMORY[0x1E4F42D90] mainScreen];
      [v510 _referenceBounds];
    }
    LODWORD(v564) = v309 ^ 1;
    BSSizeRoundForScale();
    if (v326 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      HIDWORD(v567) = 0;
      uint64_t v561 = 0;
      uint64_t v558 = 0;
      uint64_t v555 = 0;
      int v552 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      int v100 = 0;
      int v101 = 0;
      double v102 = 0.0;
      goto LABEL_405;
    }
  }
  else
  {
    LODWORD(v564) = 0;
  }
LABEL_1405:
  int v310 = __sb__runningInSpringBoard();
  if (v310)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v567) = 0;
      int v311 = 0;
      goto LABEL_1461;
    }
  }
  else
  {
    v515 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v515 userInterfaceIdiom])
    {
      int v311 = 0;
      HIDWORD(v567) = 1;
      goto LABEL_1461;
    }
  }
  HIDWORD(v567) = v310 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v322 = __sb__runningInSpringBoard();
    if (v322)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v508 = [MEMORY[0x1E4F42D90] mainScreen];
      [v508 _referenceBounds];
    }
    int v311 = v322 ^ 1;
    BSSizeRoundForScale();
    if (v336 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1511;
    }
  }
  else
  {
    int v311 = 0;
  }
LABEL_1461:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    HIDWORD(v561) = v311;
    LODWORD(v561) = 0;
    uint64_t v558 = 0;
    uint64_t v555 = 0;
    int v552 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    int v100 = 0;
    int v101 = 0;
    double v102 = 0.0;
    goto LABEL_405;
  }
LABEL_1511:
  HIDWORD(v561) = v311;
  int v337 = __sb__runningInSpringBoard();
  if (v337)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v561) = 0;
      HIDWORD(v558) = 0;
      goto LABEL_1549;
    }
  }
  else
  {
    v514 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v514 userInterfaceIdiom])
    {
      HIDWORD(v558) = 0;
      LODWORD(v561) = 1;
      goto LABEL_1549;
    }
  }
  LODWORD(v561) = v337 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v342 = __sb__runningInSpringBoard();
    if (v342)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v507 = [MEMORY[0x1E4F42D90] mainScreen];
      [v507 _referenceBounds];
    }
    HIDWORD(v558) = v342 ^ 1;
    BSSizeRoundForScale();
    if (v351 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v558) = 0;
      uint64_t v555 = 0;
      int v552 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      int v100 = 0;
      int v101 = 0;
      double v102 = 28.0;
      goto LABEL_405;
    }
  }
  else
  {
    HIDWORD(v558) = 0;
  }
LABEL_1549:
  int v343 = __sb__runningInSpringBoard();
  if (v343)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v558) = 0;
      HIDWORD(v555) = 0;
      goto LABEL_1581;
    }
  }
  else
  {
    v511 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v511 userInterfaceIdiom])
    {
      HIDWORD(v555) = 0;
      LODWORD(v558) = 1;
      goto LABEL_1581;
    }
  }
  LODWORD(v558) = v343 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v347 = __sb__runningInSpringBoard();
    if (v347)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v506 = [MEMORY[0x1E4F42D90] mainScreen];
      [v506 _referenceBounds];
    }
    HIDWORD(v555) = v347 ^ 1;
    BSSizeRoundForScale();
    if (v355 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1623;
    }
  }
  else
  {
    HIDWORD(v555) = 0;
  }
LABEL_1581:
  if (_SBF_Private_IsD53())
  {
    LODWORD(v555) = 0;
    int v552 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    int v100 = 0;
    int v101 = 0;
    double v102 = 23.0;
    goto LABEL_405;
  }
LABEL_1623:
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
    || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    LODWORD(v555) = 0;
    int v552 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    int v100 = 0;
    int v101 = 0;
    double v102 = 0.0;
    goto LABEL_405;
  }
  double v102 = 0.0;
  if (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0 || (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    LODWORD(v555) = 0;
    int v552 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    int v100 = 0;
    int v101 = 0;
    goto LABEL_405;
  }
  int v358 = __sb__runningInSpringBoard();
  if (v358)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v555) = 0;
      int v552 = 0;
      goto LABEL_1689;
    }
  }
  else
  {
    v505 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v505 userInterfaceIdiom])
    {
      int v552 = 0;
      LODWORD(v555) = 1;
      goto LABEL_1689;
    }
  }
  LODWORD(v555) = v358 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v363 = __sb__runningInSpringBoard();
    if (v363)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v502 = [MEMORY[0x1E4F42D90] mainScreen];
      [v502 _referenceBounds];
    }
    int v552 = v363 ^ 1;
    BSSizeRoundForScale();
    if (v386 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      int v100 = 0;
      int v101 = 0;
      goto LABEL_405;
    }
  }
  else
  {
    int v552 = 0;
  }
LABEL_1689:
  int v364 = __sb__runningInSpringBoard();
  if (v364)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v97 = 0;
      int v98 = 0;
      goto LABEL_1729;
    }
  }
  else
  {
    v504 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v504 userInterfaceIdiom])
    {
      int v98 = 0;
      int v97 = 1;
      goto LABEL_1729;
    }
  }
  int v97 = v364 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v369 = __sb__runningInSpringBoard();
    if (v369)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v501 = [MEMORY[0x1E4F42D90] mainScreen];
      [v501 _referenceBounds];
    }
    int v98 = v369 ^ 1;
    BSSizeRoundForScale();
    if (v390 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v99 = 0;
      int v100 = 0;
      int v101 = 0;
      goto LABEL_405;
    }
  }
  else
  {
    int v98 = 0;
  }
LABEL_1729:
  int v370 = __sb__runningInSpringBoard();
  if (!v370)
  {
    v503 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v503 userInterfaceIdiom])
    {
      int v100 = 0;
      int v99 = 1;
      goto LABEL_1769;
    }
LABEL_1765:
    int v99 = v370 ^ 1;
    int v378 = __sb__runningInSpringBoard();
    if (v378)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v79 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v79 _referenceBounds];
    }
    int v100 = v378 ^ 1;
    BSSizeRoundForScale();
    if (v379 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
      goto LABEL_1772;
    }
    goto LABEL_1769;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_1765;
  }
  int v99 = 0;
  int v100 = 0;
LABEL_1769:
  uint64_t v380 = __sb__runningInSpringBoard();
  if (v380)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_1772:
      int v101 = 0;
      goto LABEL_405;
    }
  }
  else
  {
    v78 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v78 userInterfaceIdiom])
    {
      int v101 = 1;
      goto LABEL_405;
    }
  }
  int v101 = v380 ^ 1;
  int v394 = __sb__runningInSpringBoard();
  if (v394)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v380 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v380 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (v394 != 1) {

  }
LABEL_405:
  if (v101) {

  }
  if (v100) {
  v110 = (void *)0x1E4F42000;
  }
  if (v99) {

  }
  uint64_t v111 = v596;
  if (v98) {

  }
  if (v97) {
  if (v552)
  }

  if (v555) {
  if (HIDWORD(v555))
  }

  if (v558) {
  if (HIDWORD(v558))
  }

  if (v561) {
  if (HIDWORD(v561))
  }

  if (HIDWORD(v567)) {
  if (v564)
  }

  if (HIDWORD(v564)) {
  if (v567)
  }

  if (v571) {
  if (HIDWORD(v571))
  }

  if (v574) {
  if (v580)
  }

  if (HIDWORD(v580)) {
  if (HIDWORD(v574))
  }

  if (v577) {
  if (HIDWORD(v584))
  }

  if (v587) {
  if (HIDWORD(v577))
  }

  if (HIDWORD(v587)) {
  if (v590)
  }

  if (HIDWORD(v590)) {
  if (v584)
  }

  if (v593) {
  if (HIDWORD(v593))
  }

  if (LODWORD(v595[0])) {
  if (HIDWORD(v595[0]))
  }

  if (LODWORD(v595[1])) {
  if (HIDWORD(v595[1]))
  }

  if (LODWORD(v595[2])) {
  if (HIDWORD(v595[2]))
  }

  if (LODWORD(v595[3])) {
  if (HIDWORD(v595[3]))
  }

  if (LODWORD(v595[4])) {
  if (HIDWORD(v595[4]))
  }

  if (LODWORD(v595[5])) {
  if (HIDWORD(v595[5]))
  }

  if (LODWORD(v595[6])) {
  if (HIDWORD(v595[6]))
  }
  {

    if (!LODWORD(v595[7])) {
      goto LABEL_497;
    }
  }
  else if (!LODWORD(v595[7]))
  {
LABEL_497:
    if (HIDWORD(v595[7])) {
      goto LABEL_498;
    }
    goto LABEL_508;
  }

  if (HIDWORD(v595[7]))
  {
LABEL_498:

    if (!LODWORD(v595[8])) {
      goto LABEL_499;
    }
    goto LABEL_509;
  }
LABEL_508:
  if (!LODWORD(v595[8]))
  {
LABEL_499:
    if (HIDWORD(v595[8])) {
      goto LABEL_500;
    }
    goto LABEL_510;
  }
LABEL_509:

  if (HIDWORD(v595[8]))
  {
LABEL_500:

    if (!v596) {
      goto LABEL_501;
    }
    goto LABEL_511;
  }
LABEL_510:
  if (!v596)
  {
LABEL_501:
    if (!HIDWORD(v596)) {
      goto LABEL_503;
    }
    goto LABEL_502;
  }
LABEL_511:

  if (HIDWORD(v596)) {
LABEL_502:
  }

LABEL_503:
  int v112 = __sb__runningInSpringBoard();
  if (v112)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v113 = 0;
      int v114 = 0;
      goto LABEL_519;
    }
  }
  else
  {
    v550 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v550 userInterfaceIdiom] != 1)
    {
      int v114 = 0;
      int v113 = 1;
      goto LABEL_519;
    }
  }
  int v113 = v112 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v115 = __sb__runningInSpringBoard();
    if (v115)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v541 = [MEMORY[0x1E4F42D90] mainScreen];
      [v541 _referenceBounds];
    }
    int v114 = v115 ^ 1;
    BSSizeRoundForScale();
    if (v139 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v138 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      LODWORD(v596) = v115 ^ 1;
      HIDWORD(v596) = v113;
      memset(v595, 0, sizeof(v595));
      uint64_t v594 = 0;
      uint64_t v585 = 0;
      uint64_t v591 = 0;
      uint64_t v588 = 0;
      uint64_t v578 = 0;
      uint64_t v575 = 0;
      uint64_t v581 = 0;
      uint64_t v572 = 0;
      uint64_t v568 = 0;
      uint64_t v565 = 0;
      uint64_t v562 = 0;
      uint64_t v559 = 0;
      uint64_t v556 = 0;
      int v553 = 0;
      int v129 = 0;
      int v130 = 0;
      int v131 = 0;
      int v132 = 0;
      int v133 = 0;
      double v134 = 0.0;
      goto LABEL_573;
    }
  }
  else
  {
    int v114 = 0;
  }
LABEL_519:
  int v116 = __sb__runningInSpringBoard();
  unint64_t v596 = __PAIR64__(v113, v114);
  if (v116)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v117 = 0;
      int v118 = 0;
      goto LABEL_528;
    }
  }
  else
  {
    v549 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v549 userInterfaceIdiom] != 1)
    {
      int v118 = 0;
      int v117 = 1;
      goto LABEL_528;
    }
  }
  int v117 = v116 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v119 = __sb__runningInSpringBoard();
    if (v119)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v540 = [MEMORY[0x1E4F42D90] mainScreen];
      [v540 _referenceBounds];
    }
    int v118 = v119 ^ 1;
    BSSizeRoundForScale();
    if (v140 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      LODWORD(v595[8]) = v119 ^ 1;
      HIDWORD(v595[8]) = v117;
      memset(v595, 0, 64);
      uint64_t v594 = 0;
      uint64_t v585 = 0;
      uint64_t v591 = 0;
      uint64_t v588 = 0;
      uint64_t v578 = 0;
      uint64_t v575 = 0;
      uint64_t v581 = 0;
      uint64_t v572 = 0;
      uint64_t v568 = 0;
      uint64_t v565 = 0;
      uint64_t v562 = 0;
      uint64_t v559 = 0;
      uint64_t v556 = 0;
      int v553 = 0;
      int v129 = 0;
      int v130 = 0;
      int v131 = 0;
      int v132 = 0;
      int v133 = 0;
      double v134 = 0.0;
      goto LABEL_573;
    }
  }
  else
  {
    int v118 = 0;
  }
LABEL_528:
  int v120 = __sb__runningInSpringBoard();
  v595[8] = __PAIR64__(v117, v118);
  if (v120)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v121 = 0;
      int v122 = 0;
      goto LABEL_537;
    }
  }
  else
  {
    v548 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v548 userInterfaceIdiom] != 1)
    {
      int v122 = 0;
      int v121 = 1;
      goto LABEL_537;
    }
  }
  int v121 = v120 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v123 = __sb__runningInSpringBoard();
    if (v123)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v539 = [MEMORY[0x1E4F42D90] mainScreen];
      [v539 _referenceBounds];
    }
    int v122 = v123 ^ 1;
    BSSizeRoundForScale();
    if (v141 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      LODWORD(v595[7]) = v123 ^ 1;
      HIDWORD(v595[7]) = v121;
      memset(v595, 0, 56);
      uint64_t v594 = 0;
      uint64_t v585 = 0;
      uint64_t v591 = 0;
      uint64_t v588 = 0;
      uint64_t v578 = 0;
      uint64_t v575 = 0;
      uint64_t v581 = 0;
      uint64_t v572 = 0;
      uint64_t v568 = 0;
      uint64_t v565 = 0;
      uint64_t v562 = 0;
      uint64_t v559 = 0;
      uint64_t v556 = 0;
      int v553 = 0;
      int v129 = 0;
      int v130 = 0;
      int v131 = 0;
      int v132 = 0;
      int v133 = 0;
      double v134 = 0.0;
      goto LABEL_573;
    }
  }
  else
  {
    int v122 = 0;
  }
LABEL_537:
  int v124 = __sb__runningInSpringBoard();
  v595[7] = __PAIR64__(v121, v122);
  if (v124)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v111 = 0;
      LODWORD(v595[6]) = 0;
      goto LABEL_546;
    }
  }
  else
  {
    v547 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v547 userInterfaceIdiom] != 1)
    {
      LODWORD(v595[6]) = 0;
      uint64_t v111 = 1;
      goto LABEL_546;
    }
  }
  uint64_t v111 = v124 ^ 1u;
  int v125 = __sb__runningInSpringBoard();
  if (v125)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v544 = [MEMORY[0x1E4F42D90] mainScreen];
    [v544 _referenceBounds];
  }
  LODWORD(v595[6]) = v125 ^ 1;
  BSSizeRoundForScale();
  if (v126 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    HIDWORD(v595[6]) = v111;
    memset(v595, 0, 48);
    uint64_t v594 = 0;
    uint64_t v585 = 0;
    uint64_t v591 = 0;
    uint64_t v588 = 0;
    uint64_t v578 = 0;
    uint64_t v575 = 0;
    uint64_t v581 = 0;
    uint64_t v572 = 0;
    uint64_t v568 = 0;
    uint64_t v565 = 0;
    uint64_t v562 = 0;
    uint64_t v559 = 0;
    uint64_t v556 = 0;
    int v553 = 0;
    int v129 = 0;
    int v130 = 0;
    int v131 = 0;
    int v132 = 0;
    int v133 = 0;
    double v134 = 0.0;
    goto LABEL_573;
  }
LABEL_546:
  int v127 = __sb__runningInSpringBoard();
  HIDWORD(v595[6]) = v111;
  if (v127)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v595[5] = 0;
      goto LABEL_556;
    }
  }
  else
  {
    v546 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v546 userInterfaceIdiom] != 1)
    {
      v595[5] = 0x100000000;
      goto LABEL_556;
    }
  }
  HIDWORD(v595[5]) = v127 ^ 1;
  int v128 = __sb__runningInSpringBoard();
  if (v128)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v542 = [MEMORY[0x1E4F42D90] mainScreen];
    [v542 _referenceBounds];
  }
  LODWORD(v595[5]) = v128 ^ 1;
  BSSizeRoundForScale();
  if (v135 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    memset(v595, 0, 40);
    uint64_t v594 = 0;
    uint64_t v585 = 0;
    uint64_t v591 = 0;
    uint64_t v588 = 0;
    uint64_t v578 = 0;
    uint64_t v575 = 0;
    uint64_t v581 = 0;
    uint64_t v572 = 0;
    uint64_t v568 = 0;
    uint64_t v565 = 0;
    uint64_t v562 = 0;
    uint64_t v559 = 0;
    uint64_t v556 = 0;
    int v553 = 0;
    int v129 = 0;
    int v130 = 0;
    int v131 = 0;
    int v132 = 0;
    int v133 = 0;
    double v134 = 0.0;
    goto LABEL_573;
  }
LABEL_556:
  int v136 = __sb__runningInSpringBoard();
  if (v136)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v595[4] = 0;
      goto LABEL_728;
    }
  }
  else
  {
    v545 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v545 userInterfaceIdiom] != 1)
    {
      v595[4] = 0x100000000;
      goto LABEL_728;
    }
  }
  HIDWORD(v595[4]) = v136 ^ 1;
  int v137 = __sb__runningInSpringBoard();
  if (v137)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v538 = [MEMORY[0x1E4F42D90] mainScreen];
    [v538 _referenceBounds];
  }
  LODWORD(v595[4]) = v137 ^ 1;
  BSSizeRoundForScale();
  if (v178 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    memset(v595, 0, 32);
    uint64_t v594 = 0;
    uint64_t v585 = 0;
    uint64_t v591 = 0;
    uint64_t v588 = 0;
    uint64_t v578 = 0;
    uint64_t v575 = 0;
    uint64_t v581 = 0;
    uint64_t v572 = 0;
    uint64_t v568 = 0;
    uint64_t v565 = 0;
    uint64_t v562 = 0;
    uint64_t v559 = 0;
    uint64_t v556 = 0;
    int v553 = 0;
    int v129 = 0;
    int v130 = 0;
    int v131 = 0;
    int v132 = 0;
    int v133 = 0;
    double v134 = 0.0;
    goto LABEL_573;
  }
LABEL_728:
  int v179 = __sb__runningInSpringBoard();
  if (v179)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_730;
    }
LABEL_736:
    memset(v595, 0, 28);
    uint64_t v594 = 0;
    uint64_t v585 = 0;
    uint64_t v591 = 0;
    uint64_t v588 = 0;
    uint64_t v578 = 0;
    uint64_t v575 = 0;
    uint64_t v581 = 0;
    uint64_t v572 = 0;
    uint64_t v568 = 0;
    uint64_t v565 = 0;
    uint64_t v562 = 0;
    uint64_t v559 = 0;
    uint64_t v556 = 0;
    int v553 = 0;
    int v129 = 0;
    int v130 = 0;
    int v131 = 0;
    int v132 = 0;
    int v133 = 0;
    double v134 = 0.0;
    HIDWORD(v595[3]) = v179 ^ 1;
    goto LABEL_573;
  }
  v543 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v543 userInterfaceIdiom] == 1) {
    goto LABEL_736;
  }
LABEL_730:
  HIDWORD(v595[3]) = v179 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_734:
    *(void *)((char *)&v595[2] + 4) = 0;
    goto LABEL_828;
  }
  int v180 = __sb__runningInSpringBoard();
  if (v180)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_734;
    }
  }
  else
  {
    v536 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v536 userInterfaceIdiom])
    {
      HIDWORD(v595[2]) = 0;
      LODWORD(v595[3]) = 1;
      goto LABEL_828;
    }
  }
  LODWORD(v595[3]) = v180 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v193 = __sb__runningInSpringBoard();
    if (v193)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v111 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v111 _referenceBounds];
    }
    v533 = (void *)v111;
    HIDWORD(v595[2]) = v193 ^ 1;
    BSSizeRoundForScale();
    if (v201 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      memset(v595, 0, 20);
      uint64_t v594 = 0;
      uint64_t v585 = 0;
      uint64_t v591 = 0;
      uint64_t v588 = 0;
      uint64_t v578 = 0;
      uint64_t v575 = 0;
      uint64_t v581 = 0;
      uint64_t v572 = 0;
      uint64_t v568 = 0;
      uint64_t v565 = 0;
      uint64_t v562 = 0;
      uint64_t v559 = 0;
      uint64_t v556 = 0;
      int v553 = 0;
      int v129 = 0;
      int v130 = 0;
      int v131 = 0;
      int v132 = 0;
      int v133 = 0;
      double v134 = 50.0;
      goto LABEL_573;
    }
  }
  else
  {
    HIDWORD(v595[2]) = 0;
  }
LABEL_828:
  int v194 = __sb__runningInSpringBoard();
  uint64_t v111 = (uint64_t)&off_1D8504000;
  if (v194)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)((char *)&v595[1] + 4) = 0;
      goto LABEL_838;
    }
  }
  else
  {
    v537 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v537 userInterfaceIdiom])
    {
      HIDWORD(v595[1]) = 0;
      LODWORD(v595[2]) = 1;
      goto LABEL_838;
    }
  }
  LODWORD(v595[2]) = v194 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v195 = __sb__runningInSpringBoard();
    if (v195)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v531 = [MEMORY[0x1E4F42D90] mainScreen];
      [v531 _referenceBounds];
    }
    HIDWORD(v595[1]) = v195 ^ 1;
    BSSizeRoundForScale();
    if (v196 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_842;
    }
  }
  else
  {
    HIDWORD(v595[1]) = 0;
  }
LABEL_838:
  if (_SBF_Private_IsD94Like())
  {
    *(void *)((char *)v595 + 4) = 0;
    LODWORD(v595[0]) = 0;
    uint64_t v594 = 0;
    uint64_t v585 = 0;
    uint64_t v591 = 0;
    uint64_t v588 = 0;
    uint64_t v578 = 0;
    uint64_t v575 = 0;
    uint64_t v581 = 0;
    uint64_t v572 = 0;
    uint64_t v568 = 0;
    uint64_t v565 = 0;
    uint64_t v562 = 0;
    uint64_t v559 = 0;
    uint64_t v556 = 0;
    int v553 = 0;
    int v129 = 0;
    int v130 = 0;
    int v131 = 0;
    int v132 = 0;
    int v133 = 0;
    double v134 = 43.66666;
    goto LABEL_573;
  }
LABEL_842:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_846:
    *(void *)((char *)v595 + 4) = 0;
    goto LABEL_967;
  }
  int v197 = __sb__runningInSpringBoard();
  if (v197)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_846;
    }
  }
  else
  {
    v532 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v532 userInterfaceIdiom])
    {
      HIDWORD(v595[0]) = 0;
      LODWORD(v595[1]) = 1;
      goto LABEL_967;
    }
  }
  LODWORD(v595[1]) = v197 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v219 = __sb__runningInSpringBoard();
    if (v219)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v524 = [MEMORY[0x1E4F42D90] mainScreen];
      [v524 _referenceBounds];
    }
    HIDWORD(v595[0]) = v219 ^ 1;
    BSSizeRoundForScale();
    if (v236 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      LODWORD(v595[0]) = 0;
      uint64_t v594 = 0;
      uint64_t v585 = 0;
      uint64_t v591 = 0;
      uint64_t v588 = 0;
      uint64_t v578 = 0;
      uint64_t v575 = 0;
      uint64_t v581 = 0;
      uint64_t v572 = 0;
      uint64_t v568 = 0;
      uint64_t v565 = 0;
      uint64_t v562 = 0;
      uint64_t v559 = 0;
      uint64_t v556 = 0;
      int v553 = 0;
      int v129 = 0;
      int v130 = 0;
      int v131 = 0;
      int v132 = 0;
      int v133 = 0;
      double v134 = 50.0;
      goto LABEL_573;
    }
  }
  else
  {
    HIDWORD(v595[0]) = 0;
  }
LABEL_967:
  int v220 = __sb__runningInSpringBoard();
  if (v220)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v595[0]) = 0;
      HIDWORD(v594) = 0;
      goto LABEL_977;
    }
  }
  else
  {
    v535 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v535 userInterfaceIdiom])
    {
      HIDWORD(v594) = 0;
      LODWORD(v595[0]) = 1;
      goto LABEL_977;
    }
  }
  LODWORD(v595[0]) = v220 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v221 = __sb__runningInSpringBoard();
    if (v221)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v528 = [MEMORY[0x1E4F42D90] mainScreen];
      [v528 _referenceBounds];
    }
    HIDWORD(v594) = v221 ^ 1;
    BSSizeRoundForScale();
    if (v222 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_981;
    }
  }
  else
  {
    HIDWORD(v594) = 0;
  }
LABEL_977:
  if (_SBF_Private_IsD64Like())
  {
    LODWORD(v594) = 0;
    uint64_t v585 = 0;
    uint64_t v591 = 0;
    uint64_t v588 = 0;
    uint64_t v578 = 0;
    uint64_t v575 = 0;
    uint64_t v581 = 0;
    uint64_t v572 = 0;
    uint64_t v568 = 0;
    uint64_t v565 = 0;
    uint64_t v562 = 0;
    uint64_t v559 = 0;
    uint64_t v556 = 0;
    int v553 = 0;
    int v129 = 0;
    int v130 = 0;
    int v131 = 0;
    int v132 = 0;
    int v133 = 0;
    double v134 = 43.666666;
    goto LABEL_573;
  }
LABEL_981:
  int v223 = __sb__runningInSpringBoard();
  if (v223)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v594) = 0;
      LODWORD(v585) = 0;
      goto LABEL_991;
    }
  }
  else
  {
    v534 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v534 userInterfaceIdiom])
    {
      LODWORD(v585) = 0;
      LODWORD(v594) = 1;
      goto LABEL_991;
    }
  }
  LODWORD(v594) = v223 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v224 = __sb__runningInSpringBoard();
    if (v224)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v525 = [MEMORY[0x1E4F42D90] mainScreen];
      [v525 _referenceBounds];
    }
    LODWORD(v585) = v224 ^ 1;
    BSSizeRoundForScale();
    if (v232 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      uint64_t v591 = 0;
      uint64_t v588 = 0;
      uint64_t v578 = 0;
      HIDWORD(v585) = 0;
      uint64_t v575 = 0;
      uint64_t v581 = 0;
      uint64_t v572 = 0;
      uint64_t v568 = 0;
      uint64_t v565 = 0;
      uint64_t v562 = 0;
      uint64_t v559 = 0;
      uint64_t v556 = 0;
      int v553 = 0;
      int v129 = 0;
      int v130 = 0;
      int v131 = 0;
      int v132 = 0;
      int v133 = 0;
      double v134 = 50.0;
      goto LABEL_573;
    }
  }
  else
  {
    LODWORD(v585) = 0;
  }
LABEL_991:
  int v225 = __sb__runningInSpringBoard();
  if (v225)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v591 = 0;
      goto LABEL_1019;
    }
  }
  else
  {
    v530 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v530 userInterfaceIdiom])
    {
      uint64_t v591 = 0x100000000;
      goto LABEL_1019;
    }
  }
  HIDWORD(v591) = v225 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v228 = __sb__runningInSpringBoard();
    if (v228)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v523 = [MEMORY[0x1E4F42D90] mainScreen];
      [v523 _referenceBounds];
    }
    LODWORD(v591) = v228 ^ 1;
    BSSizeRoundForScale();
    if (v243 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_1071;
    }
  }
  else
  {
    LODWORD(v591) = 0;
  }
LABEL_1019:
  if (_SBF_Private_IsD54())
  {
    uint64_t v588 = 0;
    uint64_t v578 = 0;
    HIDWORD(v585) = 0;
    uint64_t v575 = 0;
    uint64_t v581 = 0;
    uint64_t v572 = 0;
    uint64_t v568 = 0;
    uint64_t v565 = 0;
    uint64_t v562 = 0;
    uint64_t v559 = 0;
    uint64_t v556 = 0;
    int v553 = 0;
    int v129 = 0;
    int v130 = 0;
    int v131 = 0;
    int v132 = 0;
    int v133 = 0;
    double v134 = 43.66666;
    goto LABEL_573;
  }
LABEL_1071:
  int v244 = __sb__runningInSpringBoard();
  if (v244)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v111 = 0;
      HIDWORD(v578) = 0;
      goto LABEL_1111;
    }
  }
  else
  {
    v529 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v529 userInterfaceIdiom])
    {
      HIDWORD(v578) = 0;
      uint64_t v111 = 1;
      goto LABEL_1111;
    }
  }
  uint64_t v111 = v244 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v251 = __sb__runningInSpringBoard();
    if (v251)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v520 = [MEMORY[0x1E4F42D90] mainScreen];
      [v520 _referenceBounds];
    }
    HIDWORD(v578) = v251 ^ 1;
    BSSizeRoundForScale();
    if (v261 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      HIDWORD(v588) = v111;
      LODWORD(v588) = 0;
      HIDWORD(v585) = 0;
      LODWORD(v578) = 0;
      uint64_t v575 = 0;
      uint64_t v581 = 0;
      uint64_t v572 = 0;
      uint64_t v568 = 0;
      uint64_t v565 = 0;
      uint64_t v562 = 0;
      uint64_t v559 = 0;
      uint64_t v556 = 0;
      int v553 = 0;
      int v129 = 0;
      int v130 = 0;
      int v131 = 0;
      int v132 = 0;
      int v133 = 0;
      double v134 = 0.0;
      goto LABEL_573;
    }
  }
  else
  {
    HIDWORD(v578) = 0;
  }
LABEL_1111:
  int v252 = __sb__runningInSpringBoard();
  HIDWORD(v588) = v111;
  if (v252)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v588) = 0;
      int v253 = 0;
      goto LABEL_1142;
    }
  }
  else
  {
    v527 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v527 userInterfaceIdiom])
    {
      int v253 = 0;
      LODWORD(v588) = 1;
      goto LABEL_1142;
    }
  }
  LODWORD(v588) = v252 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v257 = __sb__runningInSpringBoard();
    if (v257)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v519 = [MEMORY[0x1E4F42D90] mainScreen];
      [v519 _referenceBounds];
    }
    int v253 = v257 ^ 1;
    BSSizeRoundForScale();
    if (v268 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1190;
    }
  }
  else
  {
    int v253 = 0;
  }
LABEL_1142:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    HIDWORD(v585) = v253;
    LODWORD(v578) = 0;
    uint64_t v575 = 0;
    uint64_t v581 = 0;
    uint64_t v572 = 0;
    uint64_t v568 = 0;
    uint64_t v565 = 0;
    uint64_t v562 = 0;
    uint64_t v559 = 0;
    uint64_t v556 = 0;
    int v553 = 0;
    int v129 = 0;
    int v130 = 0;
    int v131 = 0;
    int v132 = 0;
    int v133 = 0;
    double v134 = 0.0;
    goto LABEL_573;
  }
LABEL_1190:
  HIDWORD(v585) = v253;
  if (!_SBF_Private_IsD93Like())
  {
LABEL_1194:
    LODWORD(v578) = 0;
    HIDWORD(v575) = 0;
    goto LABEL_1276;
  }
  int v269 = __sb__runningInSpringBoard();
  if (v269)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_1194;
    }
  }
  else
  {
    v522 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v522 userInterfaceIdiom])
    {
      HIDWORD(v575) = 0;
      LODWORD(v578) = 1;
      goto LABEL_1276;
    }
  }
  LODWORD(v578) = v269 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v283 = __sb__runningInSpringBoard();
    if (v283)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v111 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v111 _referenceBounds];
    }
    v517 = (void *)v111;
    BSSizeRoundForScale();
    HIDWORD(v575) = v283 ^ 1;
    if (v291 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      uint64_t v581 = 0;
      LODWORD(v575) = 0;
      uint64_t v572 = 0;
      uint64_t v568 = 0;
      uint64_t v565 = 0;
      uint64_t v562 = 0;
      uint64_t v559 = 0;
      uint64_t v556 = 0;
      int v553 = 0;
      int v129 = 0;
      int v130 = 0;
      int v131 = 0;
      int v132 = 0;
      int v133 = 0;
      double v134 = 43.0;
      goto LABEL_573;
    }
  }
  else
  {
    HIDWORD(v575) = 0;
  }
LABEL_1276:
  int v284 = __sb__runningInSpringBoard();
  uint64_t v111 = (uint64_t)&off_1D8504000;
  if (v284)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v581 = 0;
      goto LABEL_1286;
    }
  }
  else
  {
    v526 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v526 userInterfaceIdiom])
    {
      uint64_t v581 = 0x100000000;
      goto LABEL_1286;
    }
  }
  HIDWORD(v581) = v284 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v285 = __sb__runningInSpringBoard();
    if (v285)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v515 = [MEMORY[0x1E4F42D90] mainScreen];
      [v515 _referenceBounds];
    }
    LODWORD(v581) = v285 ^ 1;
    BSSizeRoundForScale();
    if (v286 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_1290;
    }
  }
  else
  {
    LODWORD(v581) = 0;
  }
LABEL_1286:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v575) = 0;
    uint64_t v572 = 0;
    uint64_t v568 = 0;
    uint64_t v565 = 0;
    uint64_t v562 = 0;
    uint64_t v559 = 0;
    uint64_t v556 = 0;
    int v553 = 0;
    int v129 = 0;
    int v130 = 0;
    int v131 = 0;
    int v132 = 0;
    int v133 = 0;
    double v134 = 35.33333;
    goto LABEL_573;
  }
LABEL_1290:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_1294:
    LODWORD(v575) = 0;
    HIDWORD(v572) = 0;
    goto LABEL_1415;
  }
  int v287 = __sb__runningInSpringBoard();
  if (v287)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_1294;
    }
  }
  else
  {
    v516 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v516 userInterfaceIdiom])
    {
      HIDWORD(v572) = 0;
      LODWORD(v575) = 1;
      goto LABEL_1415;
    }
  }
  LODWORD(v575) = v287 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v312 = __sb__runningInSpringBoard();
    if (v312)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v509 = [MEMORY[0x1E4F42D90] mainScreen];
      [v509 _referenceBounds];
    }
    BSSizeRoundForScale();
    HIDWORD(v572) = v312 ^ 1;
    if (v331 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v572) = 0;
      uint64_t v568 = 0;
      uint64_t v565 = 0;
      uint64_t v562 = 0;
      uint64_t v559 = 0;
      uint64_t v556 = 0;
      int v553 = 0;
      int v129 = 0;
      int v130 = 0;
      int v131 = 0;
      int v132 = 0;
      int v133 = 0;
      double v134 = 43.0;
      goto LABEL_573;
    }
  }
  else
  {
    HIDWORD(v572) = 0;
  }
LABEL_1415:
  int v313 = __sb__runningInSpringBoard();
  if (v313)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v572) = 0;
      LODWORD(v568) = 0;
      goto LABEL_1425;
    }
  }
  else
  {
    v521 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v521 userInterfaceIdiom])
    {
      LODWORD(v568) = 0;
      LODWORD(v572) = 1;
      goto LABEL_1425;
    }
  }
  LODWORD(v572) = v313 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v314 = __sb__runningInSpringBoard();
    if (v314)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v512 = [MEMORY[0x1E4F42D90] mainScreen];
      [v512 _referenceBounds];
    }
    LODWORD(v568) = v314 ^ 1;
    BSSizeRoundForScale();
    if (v315 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1429;
    }
  }
  else
  {
    LODWORD(v568) = 0;
  }
LABEL_1425:
  if (_SBF_Private_IsD63Like())
  {
    uint64_t v565 = 0;
    HIDWORD(v568) = 0;
    uint64_t v562 = 0;
    uint64_t v559 = 0;
    uint64_t v556 = 0;
    int v553 = 0;
    int v129 = 0;
    int v130 = 0;
    int v131 = 0;
    int v132 = 0;
    int v133 = 0;
    double v134 = 35.33333;
    goto LABEL_573;
  }
LABEL_1429:
  int v316 = __sb__runningInSpringBoard();
  if (v316)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v565 = 0;
      goto LABEL_1439;
    }
  }
  else
  {
    v518 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v518 userInterfaceIdiom])
    {
      uint64_t v565 = 0x100000000;
      goto LABEL_1439;
    }
  }
  HIDWORD(v565) = v316 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v317 = __sb__runningInSpringBoard();
    if (v317)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v510 = [MEMORY[0x1E4F42D90] mainScreen];
      [v510 _referenceBounds];
    }
    LODWORD(v565) = v317 ^ 1;
    BSSizeRoundForScale();
    if (v327 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      HIDWORD(v568) = 0;
      uint64_t v562 = 0;
      uint64_t v559 = 0;
      uint64_t v556 = 0;
      int v553 = 0;
      int v129 = 0;
      int v130 = 0;
      int v131 = 0;
      int v132 = 0;
      int v133 = 0;
      double v134 = 0.0;
      goto LABEL_573;
    }
  }
  else
  {
    LODWORD(v565) = 0;
  }
LABEL_1439:
  int v318 = __sb__runningInSpringBoard();
  if (v318)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v568) = 0;
      int v319 = 0;
      goto LABEL_1467;
    }
  }
  else
  {
    v514 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v514 userInterfaceIdiom])
    {
      int v319 = 0;
      HIDWORD(v568) = 1;
      goto LABEL_1467;
    }
  }
  HIDWORD(v568) = v318 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v323 = __sb__runningInSpringBoard();
    if (v323)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v508 = [MEMORY[0x1E4F42D90] mainScreen];
      [v508 _referenceBounds];
    }
    int v319 = v323 ^ 1;
    BSSizeRoundForScale();
    if (v338 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1519;
    }
  }
  else
  {
    int v319 = 0;
  }
LABEL_1467:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    HIDWORD(v562) = v319;
    LODWORD(v562) = 0;
    uint64_t v559 = 0;
    uint64_t v556 = 0;
    int v553 = 0;
    int v129 = 0;
    int v130 = 0;
    int v131 = 0;
    int v132 = 0;
    int v133 = 0;
    double v134 = 0.0;
    goto LABEL_573;
  }
LABEL_1519:
  HIDWORD(v562) = v319;
  int v339 = __sb__runningInSpringBoard();
  if (v339)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v562) = 0;
      HIDWORD(v559) = 0;
      goto LABEL_1559;
    }
  }
  else
  {
    v513 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v513 userInterfaceIdiom])
    {
      HIDWORD(v559) = 0;
      LODWORD(v562) = 1;
      goto LABEL_1559;
    }
  }
  LODWORD(v562) = v339 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v344 = __sb__runningInSpringBoard();
    if (v344)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v507 = [MEMORY[0x1E4F42D90] mainScreen];
      [v507 _referenceBounds];
    }
    HIDWORD(v559) = v344 ^ 1;
    BSSizeRoundForScale();
    if (v352 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v559) = 0;
      uint64_t v556 = 0;
      int v553 = 0;
      int v129 = 0;
      int v130 = 0;
      int v131 = 0;
      int v132 = 0;
      int v133 = 0;
      double v134 = 43.0;
      goto LABEL_573;
    }
  }
  else
  {
    HIDWORD(v559) = 0;
  }
LABEL_1559:
  int v345 = __sb__runningInSpringBoard();
  if (v345)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v559) = 0;
      HIDWORD(v556) = 0;
      goto LABEL_1587;
    }
  }
  else
  {
    v511 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v511 userInterfaceIdiom])
    {
      HIDWORD(v556) = 0;
      LODWORD(v559) = 1;
      goto LABEL_1587;
    }
  }
  LODWORD(v559) = v345 ^ 1;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    HIDWORD(v556) = 0;
    goto LABEL_1587;
  }
  int v348 = __sb__runningInSpringBoard();
  if (v348)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v506 = [MEMORY[0x1E4F42D90] mainScreen];
    [v506 _referenceBounds];
  }
  HIDWORD(v556) = v348 ^ 1;
  BSSizeRoundForScale();
  if (v356 < *(double *)(MEMORY[0x1E4FA6E50] + 104))
  {
LABEL_1587:
    if (_SBF_Private_IsD53())
    {
      LODWORD(v556) = 0;
      int v553 = 0;
      int v129 = 0;
      int v130 = 0;
      int v131 = 0;
      int v132 = 0;
      int v133 = 0;
      double v134 = 35.33333;
      goto LABEL_573;
    }
  }
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice()) {
    goto LABEL_1638;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16()) {
    goto LABEL_1640;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
LABEL_1638:
    LODWORD(v556) = 0;
    int v553 = 0;
    int v129 = 0;
    int v130 = 0;
    int v131 = 0;
    int v132 = 0;
    int v133 = 0;
    double v134 = 44.0;
    goto LABEL_573;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
LABEL_1640:
    LODWORD(v556) = 0;
    int v553 = 0;
    int v129 = 0;
    int v130 = 0;
    int v131 = 0;
    int v132 = 0;
    int v133 = 0;
    double v134 = 37.66666;
    goto LABEL_573;
  }
  int v359 = __sb__runningInSpringBoard();
  if (v359)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v556) = 0;
      int v553 = 0;
      goto LABEL_1699;
    }
  }
  else
  {
    v505 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v505 userInterfaceIdiom])
    {
      int v553 = 0;
      LODWORD(v556) = 1;
      goto LABEL_1699;
    }
  }
  LODWORD(v556) = v359 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v365 = __sb__runningInSpringBoard();
    if (v365)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v502 = [MEMORY[0x1E4F42D90] mainScreen];
      [v502 _referenceBounds];
    }
    int v553 = v365 ^ 1;
    BSSizeRoundForScale();
    if (v387 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v129 = 0;
      int v130 = 0;
      int v131 = 0;
      int v132 = 0;
      int v133 = 0;
      double v134 = 0.0;
      goto LABEL_573;
    }
  }
  else
  {
    int v553 = 0;
  }
LABEL_1699:
  int v366 = __sb__runningInSpringBoard();
  if (v366)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v129 = 0;
      int v130 = 0;
      goto LABEL_1739;
    }
  }
  else
  {
    v504 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v504 userInterfaceIdiom])
    {
      int v130 = 0;
      int v129 = 1;
      goto LABEL_1739;
    }
  }
  int v129 = v366 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v371 = __sb__runningInSpringBoard();
    if (v371)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v501 = [MEMORY[0x1E4F42D90] mainScreen];
      [v501 _referenceBounds];
    }
    int v130 = v371 ^ 1;
    BSSizeRoundForScale();
    if (v391 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v131 = 0;
      int v132 = 0;
      int v133 = 0;
      double v134 = 0.0;
      goto LABEL_573;
    }
  }
  else
  {
    int v130 = 0;
  }
LABEL_1739:
  int v372 = __sb__runningInSpringBoard();
  if (!v372)
  {
    v503 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v503 userInterfaceIdiom])
    {
      int v132 = 0;
      int v131 = 1;
      goto LABEL_1779;
    }
LABEL_1775:
    int v131 = v372 ^ 1;
    int v381 = __sb__runningInSpringBoard();
    if (v381)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v111 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v111 _referenceBounds];
    }
    int v132 = v381 ^ 1;
    BSSizeRoundForScale();
    if (v382 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
      goto LABEL_1782;
    }
    goto LABEL_1779;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_1775;
  }
  int v131 = 0;
  int v132 = 0;
LABEL_1779:
  uint64_t v383 = __sb__runningInSpringBoard();
  if (v383)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_1782:
      int v133 = 0;
      double v134 = 0.0;
      goto LABEL_573;
    }
  }
  else
  {
    v110 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v110 userInterfaceIdiom])
    {
      double v134 = 0.0;
      int v133 = 1;
      goto LABEL_573;
    }
  }
  int v133 = v383 ^ 1;
  int v395 = __sb__runningInSpringBoard();
  if (v395)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v383 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v383 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v134 = 0.0;
  if (v395 != 1) {

  }
LABEL_573:
  if (v133) {

  }
  if (v132) {
  if (v131)
  }

  if (v130) {
  if (v129)
  }

  if (v553) {
  if (v556)
  }

  if (HIDWORD(v556)) {
  if (v559)
  }

  if (HIDWORD(v559)) {
  if (v562)
  }

  if (HIDWORD(v562)) {
  if (HIDWORD(v568))
  }

  if (v565) {
  if (HIDWORD(v565))
  }

  if (v568) {
  if (v572)
  }

  if (HIDWORD(v572)) {
  if (v575)
  }

  if (v581) {
  if (HIDWORD(v581))
  }

  if (HIDWORD(v575)) {
  if (v578)
  }

  if (HIDWORD(v585)) {
  if (v588)
  }

  if (HIDWORD(v578)) {
  if (HIDWORD(v588))
  }

  if (v591) {
  if (HIDWORD(v591))
  }

  if (v585) {
  if (v594)
  }

  if (HIDWORD(v594)) {
  if (LODWORD(v595[0]))
  }

  if (HIDWORD(v595[0])) {
  if (LODWORD(v595[1]))
  }

  if (HIDWORD(v595[1])) {
  if (LODWORD(v595[2]))
  }

  if (HIDWORD(v595[2])) {
  if (LODWORD(v595[3]))
  }

  if (HIDWORD(v595[3])) {
  if (LODWORD(v595[4]))
  }

  if (HIDWORD(v595[4])) {
  if (LODWORD(v595[5]))
  }

  if (HIDWORD(v595[5])) {
  if (LODWORD(v595[6]))
  }

  if (HIDWORD(v595[6])) {
  if (LODWORD(v595[7]))
  }

  if (HIDWORD(v595[7])) {
  if (LODWORD(v595[8]))
  }
  {

    if (!HIDWORD(v595[8])) {
      goto LABEL_671;
    }
  }
  else if (!HIDWORD(v595[8]))
  {
LABEL_671:
    if (v596) {
      goto LABEL_672;
    }
    goto LABEL_676;
  }

  if (v596)
  {
LABEL_672:

    if (!HIDWORD(v596)) {
      goto LABEL_678;
    }
    goto LABEL_677;
  }
LABEL_676:
  if (HIDWORD(v596)) {
LABEL_677:
  }

LABEL_678:
  if (v102 == 0.0) {
    uint64_t v142 = 3;
  }
  else {
    uint64_t v142 = -1;
  }
  v143 = -[CSMagSafeSilhouetteConfiguration initWithSize:bottomOffset:cornerRadius:roundedCorners:]([CSMagSafeSilhouetteConfiguration alloc], "initWithSize:bottomOffset:cornerRadius:roundedCorners:", v142, v46, v71, v102, v134);
  silhouette = v3->_silhouette;
  v3->_silhouette = v143;

  v145 = (void *)MEMORY[0x1E4F39BE8];
  [(CSMagSafeSilhouetteConfiguration *)v3->_silhouette cornerRadius];
  uint64_t v146 = objc_msgSend(v145, "ringLayerWithBlendMode:cornerRadius:borderWidth:", v597);
  walletLayer = v3->_walletLayer;
  v3->_walletLayer = (CALayer *)v146;

  [(CALayer *)v3->_walletLayer setCornerCurve:*MEMORY[0x1E4F39EA8]];
  [(CALayer *)v3->_walletLayer setOpacity:0.0];
  v148 = v3->_walletLayer;
  id v149 = [MEMORY[0x1E4F428B8] whiteColor];
  -[CALayer setBackgroundColor:](v148, "setBackgroundColor:", [v149 CGColor]);

  [(CSMagSafeSilhouetteConfiguration *)v3->_silhouette bottomOffset];
  if (v150 == 0.0) {
    -[CALayer setMaskedCorners:](v3->_walletLayer, "setMaskedCorners:", -[CSMagSafeSilhouetteConfiguration roundedCornersMaskForOrientation:](v3->_silhouette, "roundedCornersMaskForOrientation:", [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation]));
  }
  v151 = [(CSMagSafeAccessoryWalletView *)v3 configuration];
  v152 = [v151 ring];
  [v152 ringDiameter];
  double v154 = v153;
  v155 = [(CSMagSafeAccessoryWalletView *)v3 configuration];
  v156 = [v155 ring];
  [v156 lineWidth];
  uint64_t v158 = +[CSRingLayer ringLayerWithBlendMode:v597 diameter:v154 lineWidth:v157 brightnessAmount:0.2 saturationAmount:1.25];
  trackRing = v3->_trackRing;
  v3->_trackRing = (CSRingLayer *)v158;

  v160 = v3->_trackRing;
  id v161 = [MEMORY[0x1E4F428B8] whiteColor];
  -[CSRingLayer setStrokeColor:](v160, "setStrokeColor:", [v161 CGColor]);

  if ([(CSMagSafeAccessoryView *)v3 isReduceTransparencyEnabled])
  {
    v162 = [(CSMagSafeAccessoryWalletView *)v3 layer];
    [v162 addSublayer:v3->_averageColorBackdropLayer];
  }
  if ([(CSMagSafeAccessoryView *)v3 isReduceMotionEnabled])
  {
    v163 = [(CSMagSafeAccessoryWalletView *)v3 layer];
    [v163 addSublayer:v3->_backgroundRadiusBackdropLayer];
  }
  v164 = [(CSMagSafeAccessoryWalletView *)v3 layer];
  [v164 addSublayer:v3->_backgroundBackdropLayer];

  v165 = [(CSMagSafeAccessoryWalletView *)v3 layer];
  [v165 insertSublayer:v3->_trackRingBlurBackdropLayer above:v3->_backgroundBackdropLayer];

  v166 = [(CSMagSafeAccessoryWalletView *)v3 layer];
  [v166 insertSublayer:v3->_walletLayer above:v3->_trackRingBlurBackdropLayer];

  v167 = [(CSMagSafeAccessoryWalletView *)v3 layer];
  [v167 insertSublayer:v3->_trackRing above:v3->_walletLayer];

LABEL_688:
  v168 = v3;

  return v168;
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)CSMagSafeAccessoryWalletView;
  [(CSMagSafeAccessoryView *)&v47 layoutSubviews];
  v3 = [(CSMagSafeAccessoryWalletView *)self superview];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[CSMagSafeAccessoryWalletView setFrame:](self, "setFrame:", v5, v7, v9, v11);
  v12 = [(CSMagSafeAccessoryWalletView *)self configuration];
  uint64_t v13 = [v12 ring];
  [v13 ringDiameter];
  double v46 = v14;
  double v15 = [(CSMagSafeAccessoryWalletView *)self configuration];
  uint64_t v16 = [v15 ring];
  [v16 ringDiameter];
  double v18 = v17;

  if ([(CSMagSafeAccessoryView *)self isReduceTransparencyEnabled])
  {
    -[CABackdropLayer setBounds:](self->_averageColorBackdropLayer, "setBounds:", v5, v7, v9, v11);
    averageColorBackdropLayer = self->_averageColorBackdropLayer;
    [(CABackdropLayer *)averageColorBackdropLayer bounds];
    [(CSMagSafeAccessoryWalletView *)self bounds];
    UIRectCenteredIntegralRect();
    UIRectGetCenter();
    -[CABackdropLayer setPosition:](averageColorBackdropLayer, "setPosition:");
  }
  if ([(CSMagSafeAccessoryView *)self isReduceMotionEnabled])
  {
    -[CABackdropLayer setBounds:](self->_backgroundRadiusBackdropLayer, "setBounds:", v5, v7, v9, v11);
    backgroundRadiusBackdropLayer = self->_backgroundRadiusBackdropLayer;
    [(CABackdropLayer *)backgroundRadiusBackdropLayer bounds];
    [(CSMagSafeAccessoryWalletView *)self bounds];
    double v11 = v45;
    UIRectCenteredIntegralRect();
    UIRectGetCenter();
    -[CABackdropLayer setPosition:](backgroundRadiusBackdropLayer, "setPosition:");
  }
  -[CABackdropLayer setBounds:](self->_backgroundBackdropLayer, "setBounds:", v5, v7, v9, v11);
  backgroundBackdropLayer = self->_backgroundBackdropLayer;
  [(CABackdropLayer *)backgroundBackdropLayer bounds];
  [(CSMagSafeAccessoryWalletView *)self bounds];
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CABackdropLayer setPosition:](backgroundBackdropLayer, "setPosition:");
  -[CABackdropLayer setBounds:](self->_trackRingBlurBackdropLayer, "setBounds:", 0.0, 0.0, v46, v18);
  trackRingBlurBackdropLayer = self->_trackRingBlurBackdropLayer;
  [(CABackdropLayer *)trackRingBlurBackdropLayer bounds];
  [(CSMagSafeAccessoryWalletView *)self bounds];
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CABackdropLayer setPosition:](trackRingBlurBackdropLayer, "setPosition:");
  -[CSRingLayer setBounds:](self->_trackRingBlurLayer, "setBounds:", 0.0, 0.0, v46, v18);
  trackRingBlurLayer = self->_trackRingBlurLayer;
  [(CSRingLayer *)trackRingBlurLayer bounds];
  [(CABackdropLayer *)self->_trackRingBlurBackdropLayer bounds];
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CSRingLayer setPosition:](trackRingBlurLayer, "setPosition:");
  [(CSMagSafeSilhouetteConfiguration *)self->_silhouette size];
  double v25 = v24;
  [(CSMagSafeSilhouetteConfiguration *)self->_silhouette size];
  double v27 = v26;
  v28 = (id *)MEMORY[0x1E4F43630];
  uint64_t v29 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
  if ((unint64_t)(v29 - 1) >= 2) {
    double v30 = v25;
  }
  else {
    double v30 = v27;
  }
  if ((unint64_t)(v29 - 1) >= 2) {
    double v31 = v27;
  }
  else {
    double v31 = v25;
  }
  uint64_t v32 = [*v28 activeInterfaceOrientation];
  if ((unint64_t)(v32 - 1) > 1)
  {
    if (v32 == 3)
    {
      [(CSMagSafeAccessoryWalletView *)self bounds];
      double v40 = v39;
      [(CSMagSafeSilhouetteConfiguration *)self->_silhouette bottomOffset];
      double v34 = v40 - (v31 + v41);
    }
    else
    {
      [(CSMagSafeSilhouetteConfiguration *)self->_silhouette bottomOffset];
      double v34 = v42;
    }
    [(CSMagSafeAccessoryWalletView *)self bounds];
    double v38 = (v43 - v30) * 0.5;
  }
  else
  {
    [(CSMagSafeAccessoryWalletView *)self bounds];
    double v34 = (v33 - v31) * 0.5;
    [(CSMagSafeAccessoryWalletView *)self bounds];
    double v36 = v35;
    [(CSMagSafeSilhouetteConfiguration *)self->_silhouette bottomOffset];
    double v38 = v36 - (v30 + v37);
  }
  -[CALayer setFrame:](self->_walletLayer, "setFrame:", v34, v38, v31, v30);
  -[CSRingLayer setBounds:](self->_trackRing, "setBounds:", 0.0, 0.0, v46, v18);
  trackRing = self->_trackRing;
  [(CSRingLayer *)trackRing bounds];
  [(CSMagSafeAccessoryWalletView *)self bounds];
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CSRingLayer setPosition:](trackRing, "setPosition:");
}

- (void)_presentAnimation
{
  v36[2] = *MEMORY[0x1E4F143B8];
  double v3 = CACurrentMediaTime();
  if ([(CSMagSafeAccessoryView *)self isReduceTransparencyEnabled])
  {
    double v4 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
    [v4 setKeyTimes:&unk_1F306AA68];
    [v4 setValues:&unk_1F306AA80];
    [v4 setDuration:0.42];
    [v4 setRemovedOnCompletion:0];
    uint64_t v5 = *MEMORY[0x1E4F39FA8];
    [v4 setFillMode:*MEMORY[0x1E4F39FA8]];
    uint64_t v6 = *MEMORY[0x1E4F3A4A0];
    double v7 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    [v4 setTimingFunction:v7];

    [(CABackdropLayer *)self->_averageColorBackdropLayer addAnimation:v4 forKey:@"opacity"];
  }
  else
  {
    double v4 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"filters.colorBrightness.inputAmount"];
    [v4 setKeyTimes:&unk_1F306AA98];
    [v4 setValues:&unk_1F306AAB0];
    [v4 setDuration:0.42];
    [v4 setRemovedOnCompletion:0];
    uint64_t v5 = *MEMORY[0x1E4F39FA8];
    [v4 setFillMode:*MEMORY[0x1E4F39FA8]];
    uint64_t v6 = *MEMORY[0x1E4F3A4A0];
    double v8 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    [v4 setTimingFunction:v8];

    [(CABackdropLayer *)self->_backgroundBackdropLayer addAnimation:v4 forKey:@"filters.colorBrightness.inputAmount"];
    double v9 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"filters.colorSaturate.inputAmount"];
    [v9 setKeyTimes:&unk_1F306AAC8];
    [v9 setValues:&unk_1F306AAE0];
    [v9 setDuration:0.42];
    [v9 setRemovedOnCompletion:0];
    [v9 setFillMode:v5];
    double v10 = [MEMORY[0x1E4F39C10] functionWithName:v6];
    [v9 setTimingFunction:v10];

    [(CABackdropLayer *)self->_backgroundBackdropLayer addAnimation:v9 forKey:@"filters.colorSaturate.inputAmount"];
    if ([(CSMagSafeAccessoryView *)self isReduceMotionEnabled])
    {
      double v11 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
      [v11 setKeyTimes:&unk_1F306AB28];
      [v11 setValues:&unk_1F306AB40];
      [v11 setDuration:0.42];
      [v11 setRemovedOnCompletion:0];
      [v11 setFillMode:v5];
      v12 = [MEMORY[0x1E4F39C10] functionWithName:v6];
      [v11 setTimingFunction:v12];

      backgroundRadiusBackdropLayer = self->_backgroundRadiusBackdropLayer;
      double v14 = v11;
      double v15 = @"opacity";
    }
    else
    {
      double v11 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
      [v11 setKeyTimes:&unk_1F306AAF8];
      [v11 setValues:&unk_1F306AB10];
      [v11 setDuration:0.42];
      [v11 setRemovedOnCompletion:0];
      [v11 setFillMode:v5];
      uint64_t v16 = [MEMORY[0x1E4F39C10] functionWithName:v6];
      [v11 setTimingFunction:v16];

      backgroundRadiusBackdropLayer = self->_backgroundBackdropLayer;
      double v14 = v11;
      double v15 = @"filters.gaussianBlur.inputRadius";
    }
    [(CABackdropLayer *)backgroundRadiusBackdropLayer addAnimation:v14 forKey:v15];
  }
  if ([(CSMagSafeAccessoryView *)self isReduceMotionEnabled])
  {
    uint64_t v17 = *MEMORY[0x1E4F3A490];
    double v18 = v3 + 0.25;
  }
  else
  {
    v19 = NSNumber;
    uint64_t v20 = [(CSMagSafeAccessoryWalletView *)self configuration];
    v21 = [v20 ring];
    [v21 lineWidth];
    *(float *)&double v22 = v22;
    v23 = [v19 numberWithFloat:v22];

    double v24 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"lineWidth"];
    double v18 = v3 + 0.25;
    [v24 setBeginTime:v18];
    [v24 setKeyTimes:&unk_1F306AB58];
    v36[0] = &unk_1F306A488;
    v36[1] = v23;
    double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    [v24 setValues:v25];

    [v24 setDuration:0.3];
    [v24 setRemovedOnCompletion:0];
    [v24 setFillMode:v5];
    uint64_t v17 = *MEMORY[0x1E4F3A490];
    double v26 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    [v24 setTimingFunction:v26];

    [(CSRingLayer *)self->_trackRingBlurLayer addAnimation:v24 forKey:@"lineWidth"];
    [(CSRingLayer *)self->_trackRing addAnimation:v24 forKey:@"lineWidth"];
  }
  double v27 = objc_msgSend(MEMORY[0x1E4F39BD8], "animationWithKeyPath:", @"opacity", v6);
  [v27 setBeginTime:v18];
  [v27 setKeyTimes:&unk_1F306AB70];
  [v27 setValues:&unk_1F306AB88];
  [v27 setDuration:0.3];
  [v27 setRemovedOnCompletion:0];
  [v27 setFillMode:v5];
  v28 = [MEMORY[0x1E4F39C10] functionWithName:v17];
  [v27 setTimingFunction:v28];

  [(CSRingLayer *)self->_trackRing addAnimation:v27 forKey:@"opacity"];
  uint64_t v29 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v29 setBeginTime:v18];
  [v29 setKeyTimes:&unk_1F306ABA0];
  [v29 setValues:&unk_1F306ABB8];
  [v29 setDuration:0.3];
  [v29 setRemovedOnCompletion:0];
  [v29 setFillMode:v5];
  double v30 = [MEMORY[0x1E4F39C10] functionWithName:v17];
  [v29 setTimingFunction:v30];

  [(CABackdropLayer *)self->_trackRingBlurBackdropLayer addAnimation:v29 forKey:@"opacity"];
  double v31 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v31 setBeginTime:v18];
  [v31 setKeyTimes:&unk_1F306ABD0];
  [v31 setValues:&unk_1F306ABE8];
  [v31 setDuration:0.3];
  [v31 setRemovedOnCompletion:0];
  [v31 setFillMode:v5];
  uint64_t v32 = [MEMORY[0x1E4F39C10] functionWithName:v17];
  [v31 setTimingFunction:v32];

  [(CSRingLayer *)self->_trackRingBlurLayer addAnimation:v31 forKey:@"opacity"];
  double v33 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v33 setBeginTime:v18];
  [v33 setKeyTimes:&unk_1F306AC00];
  [v33 setValues:&unk_1F306AC18];
  [v33 setDuration:0.3];
  [v33 setRemovedOnCompletion:0];
  [v33 setFillMode:v5];
  double v34 = [MEMORY[0x1E4F39C10] functionWithName:v35];
  [v33 setTimingFunction:v34];

  [(CALayer *)self->_walletLayer addAnimation:v33 forKey:@"opacity"];
}

- (void)_dismissAnimation
{
  v32[2] = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v3 setKeyTimes:&unk_1F306AC30];
  [v3 setValues:&unk_1F306AC48];
  [v3 setDuration:0.3];
  [v3 setRemovedOnCompletion:0];
  uint64_t v4 = *MEMORY[0x1E4F39FA8];
  [v3 setFillMode:*MEMORY[0x1E4F39FA8]];
  uint64_t v5 = *MEMORY[0x1E4F3A490];
  uint64_t v6 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v3 setTimingFunction:v6];

  [(CSRingLayer *)self->_trackRing addAnimation:v3 forKey:@"fadeOut"];
  if (![(CSMagSafeAccessoryView *)self isReduceMotionEnabled])
  {
    double v7 = NSNumber;
    double v8 = [(CSMagSafeAccessoryWalletView *)self configuration];
    double v9 = [v8 ring];
    [v9 lineWidth];
    *(float *)&double v10 = v10;
    double v11 = [v7 numberWithFloat:v10];

    v12 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"lineWidth"];
    [v12 setKeyTimes:&unk_1F306AC60];
    v32[0] = v11;
    v32[1] = &unk_1F306A488;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    [v12 setValues:v13];

    [v12 setDuration:0.3];
    [v12 setRemovedOnCompletion:0];
    [v12 setFillMode:v4];
    double v14 = [MEMORY[0x1E4F39C10] functionWithName:v5];
    [v12 setTimingFunction:v14];

    [(CSRingLayer *)self->_trackRing addAnimation:v12 forKey:@"lineWidthDismiss"];
    [(CSRingLayer *)self->_trackRingBlurLayer addAnimation:v12 forKey:@"lineWidthDismiss"];
  }
  double v15 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v15 setKeyTimes:&unk_1F306AC78];
  [v15 setValues:&unk_1F306AC90];
  [v15 setDuration:0.3];
  [v15 setRemovedOnCompletion:0];
  [v15 setFillMode:v4];
  uint64_t v16 = *MEMORY[0x1E4F3A4A0];
  uint64_t v17 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  [v15 setTimingFunction:v17];

  [(CALayer *)self->_walletLayer addAnimation:v15 forKey:@"fadeOut"];
  double v18 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v18 setKeyTimes:&unk_1F306ACA8];
  [v18 setValues:&unk_1F306ACC0];
  [v18 setDuration:0.3];
  [v18 setRemovedOnCompletion:0];
  [v18 setFillMode:v4];
  v19 = [MEMORY[0x1E4F39C10] functionWithName:v5];
  [v18 setTimingFunction:v19];

  [(CABackdropLayer *)self->_trackRingBlurBackdropLayer addAnimation:v18 forKey:@"fadeOut"];
  double v20 = CACurrentMediaTime();
  if ([(CSMagSafeAccessoryView *)self isReduceTransparencyEnabled])
  {
    v21 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
    [v21 setKeyTimes:&unk_1F306ACD8];
    [v21 setValues:&unk_1F306ACF0];
    [v21 setBeginTime:v20 + 0.07];
    [v21 setDuration:0.26];
    [v21 setRemovedOnCompletion:0];
    [v21 setFillMode:v4];
    double v22 = [MEMORY[0x1E4F39C10] functionWithName:v16];
    [v21 setTimingFunction:v22];

    [(CABackdropLayer *)self->_averageColorBackdropLayer addAnimation:v21 forKey:@"opacity"];
  }
  else
  {
    v21 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"filters.colorBrightness.inputAmount"];
    [v21 setBeginTime:v20 + 0.07];
    [v21 setKeyTimes:&unk_1F306AD08];
    [v21 setValues:&unk_1F306AD20];
    [v21 setDuration:0.26];
    [v21 setRemovedOnCompletion:0];
    [v21 setFillMode:v4];
    v23 = [MEMORY[0x1E4F39C10] functionWithName:v16];
    [v21 setTimingFunction:v23];

    [(CABackdropLayer *)self->_backgroundBackdropLayer addAnimation:v21 forKey:@"brightnessDismiss"];
    double v24 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"filters.colorSaturate.inputAmount"];
    [v24 setBeginTime:v20 + 0.07];
    [v24 setKeyTimes:&unk_1F306AD38];
    [v24 setValues:&unk_1F306AD50];
    [v24 setDuration:0.26];
    [v24 setRemovedOnCompletion:0];
    [v24 setFillMode:v4];
    double v25 = [MEMORY[0x1E4F39C10] functionWithName:v16];
    [v24 setTimingFunction:v25];

    [(CABackdropLayer *)self->_backgroundBackdropLayer addAnimation:v24 forKey:@"dismissSaturation"];
    if ([(CSMagSafeAccessoryView *)self isReduceMotionEnabled])
    {
      double v26 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
      [v26 setKeyTimes:&unk_1F306AD98];
      [v26 setValues:&unk_1F306ADB0];
      [v26 setDuration:0.26];
      [v26 setRemovedOnCompletion:0];
      [v26 setFillMode:v4];
      double v27 = [MEMORY[0x1E4F39C10] functionWithName:v16];
      [v26 setTimingFunction:v27];

      backgroundRadiusBackdropLayer = self->_backgroundRadiusBackdropLayer;
      uint64_t v29 = v26;
      double v30 = @"opacity";
    }
    else
    {
      double v26 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
      [v26 setBeginTime:v20 + 0.07];
      [v26 setKeyTimes:&unk_1F306AD68];
      [v26 setValues:&unk_1F306AD80];
      [v26 setDuration:0.26];
      [v26 setRemovedOnCompletion:0];
      [v26 setFillMode:v4];
      double v31 = [MEMORY[0x1E4F39C10] functionWithName:v16];
      [v26 setTimingFunction:v31];

      backgroundRadiusBackdropLayer = self->_backgroundBackdropLayer;
      double v30 = @"dismissGaussianBlur";
      uint64_t v29 = v26;
    }
    [(CABackdropLayer *)backgroundRadiusBackdropLayer addAnimation:v29 forKey:v30];
  }
}

- (void)_runAnimationWithType:(unint64_t)a3
{
  if (a3 == 1)
  {
    [(CSMagSafeAccessoryWalletView *)self _dismissAnimation];
  }
  else if (!a3)
  {
    [(CSMagSafeAccessoryWalletView *)self _presentAnimation];
  }
}

- (void)performAnimation:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F39CF8];
  id v7 = a4;
  [v6 begin];
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v7];

  [(CSMagSafeAccessoryWalletView *)self _runAnimationWithType:a3];
  double v8 = (void *)MEMORY[0x1E4F39CF8];

  [v8 commit];
}

- (double)animationDurationBeforeDismissal
{
  return 1.9;
}

- (CSMagSafeAccessoryConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (CABackdropLayer)averageColorBackdropLayer
{
  return self->_averageColorBackdropLayer;
}

- (void)setAverageColorBackdropLayer:(id)a3
{
}

- (CABackdropLayer)backgroundRadiusBackdropLayer
{
  return self->_backgroundRadiusBackdropLayer;
}

- (void)setBackgroundRadiusBackdropLayer:(id)a3
{
}

- (CABackdropLayer)backgroundBackdropLayer
{
  return self->_backgroundBackdropLayer;
}

- (void)setBackgroundBackdropLayer:(id)a3
{
}

- (CABackdropLayer)trackRingBlurBackdropLayer
{
  return self->_trackRingBlurBackdropLayer;
}

- (void)setTrackRingBlurBackdropLayer:(id)a3
{
}

- (CSRingLayer)trackRingBlurLayer
{
  return self->_trackRingBlurLayer;
}

- (void)setTrackRingBlurLayer:(id)a3
{
}

- (CALayer)walletLayer
{
  return self->_walletLayer;
}

- (void)setWalletLayer:(id)a3
{
}

- (CSRingLayer)trackRing
{
  return self->_trackRing;
}

- (void)setTrackRing:(id)a3
{
}

- (CSMagSafeSilhouetteConfiguration)silhouette
{
  return self->_silhouette;
}

- (void)setSilhouette:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_silhouette, 0);
  objc_storeStrong((id *)&self->_trackRing, 0);
  objc_storeStrong((id *)&self->_walletLayer, 0);
  objc_storeStrong((id *)&self->_trackRingBlurLayer, 0);
  objc_storeStrong((id *)&self->_trackRingBlurBackdropLayer, 0);
  objc_storeStrong((id *)&self->_backgroundBackdropLayer, 0);
  objc_storeStrong((id *)&self->_backgroundRadiusBackdropLayer, 0);
  objc_storeStrong((id *)&self->_averageColorBackdropLayer, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end