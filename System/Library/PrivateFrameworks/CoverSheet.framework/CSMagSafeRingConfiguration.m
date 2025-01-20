@interface CSMagSafeRingConfiguration
+ (double)staticScaleFactor;
+ (id)auxiliaryConfiguration;
+ (id)defaultConfiguration;
+ (id)staticConfiguration;
- (CGPoint)ringCenter;
- (CSMagSafeRingConfiguration)initWithRingDiameter:(SBFScreenSpecificCGFloatValue *)a3 lineWidth:(SBFScreenSpecificCGFloatValue *)a4 splashRingDiamter:(SBFScreenSpecificCGFloatValue *)a5;
- (double)lineWidth;
- (double)ringDiameter;
- (double)splashRingDiameter;
- (void)setLineWidth:(double)a3;
- (void)setRingCenter:(CGPoint)a3;
- (void)setRingDiameter:(double)a3;
- (void)setSplashRingDiameter:(double)a3;
@end

@implementation CSMagSafeRingConfiguration

+ (id)defaultConfiguration
{
  if (defaultConfiguration_onceToken_0 != -1) {
    dispatch_once(&defaultConfiguration_onceToken_0, &__block_literal_global_20);
  }
  v2 = (void *)defaultConfiguration___defaultConfiguration_0;

  return v2;
}

void __50__CSMagSafeRingConfiguration_defaultConfiguration__block_invoke()
{
  v4[12] = xmmword_1D8506710;
  memset(&v4[13], 0, 48);
  v4[8] = xmmword_1D85066D0;
  v4[9] = unk_1D85066E0;
  v4[10] = xmmword_1D85066F0;
  v4[11] = unk_1D8506700;
  v4[4] = xmmword_1D8506690;
  v4[5] = unk_1D85066A0;
  v4[6] = xmmword_1D85066B0;
  v4[7] = unk_1D85066C0;
  v4[0] = CSMagSafeRingDiameter;
  v4[1] = unk_1D8506660;
  v4[2] = xmmword_1D8506670;
  v4[3] = unk_1D8506680;
  v3[12] = xmmword_1D8506910;
  memset(&v3[13], 0, 48);
  v3[8] = xmmword_1D85068D0;
  v3[9] = unk_1D85068E0;
  v3[10] = xmmword_1D85068F0;
  v3[11] = unk_1D8506900;
  v3[4] = xmmword_1D8506890;
  v3[5] = unk_1D85068A0;
  v3[6] = xmmword_1D85068B0;
  v3[7] = unk_1D85068C0;
  v3[0] = CSMagSafeLineWidth;
  v3[1] = unk_1D8506860;
  v3[2] = xmmword_1D8506870;
  v3[3] = unk_1D8506880;
  v2[12] = xmmword_1D8506D10;
  memset(&v2[13], 0, 48);
  v2[8] = xmmword_1D8506CD0;
  v2[9] = unk_1D8506CE0;
  v2[10] = xmmword_1D8506CF0;
  v2[11] = unk_1D8506D00;
  v2[4] = xmmword_1D8506C90;
  v2[5] = unk_1D8506CA0;
  v2[6] = xmmword_1D8506CB0;
  v2[7] = unk_1D8506CC0;
  v2[0] = CSMagSafeSplashRingDiameter;
  v2[1] = unk_1D8506C60;
  v2[2] = xmmword_1D8506C70;
  v2[3] = unk_1D8506C80;
  v0 = [[CSMagSafeRingConfiguration alloc] initWithRingDiameter:v4 lineWidth:v3 splashRingDiamter:v2];
  v1 = (void *)defaultConfiguration___defaultConfiguration_0;
  defaultConfiguration___defaultConfiguration_0 = (uint64_t)v0;
}

+ (id)staticConfiguration
{
  if (staticConfiguration_onceToken != -1) {
    dispatch_once(&staticConfiguration_onceToken, &__block_literal_global_2_0);
  }
  v2 = (void *)staticConfiguration___staticConfiguration;

  return v2;
}

void __49__CSMagSafeRingConfiguration_staticConfiguration__block_invoke()
{
  v4[12] = xmmword_1D8506B10;
  memset(&v4[13], 0, 48);
  v4[8] = xmmword_1D8506AD0;
  v4[9] = unk_1D8506AE0;
  v4[10] = xmmword_1D8506AF0;
  v4[11] = unk_1D8506B00;
  v4[4] = xmmword_1D8506A90;
  v4[5] = unk_1D8506AA0;
  v4[6] = xmmword_1D8506AB0;
  v4[7] = unk_1D8506AC0;
  v4[0] = CSMagSafeStaticViewRingDiameter;
  v4[1] = unk_1D8506A60;
  v4[2] = xmmword_1D8506A70;
  v4[3] = unk_1D8506A80;
  v3[12] = xmmword_1D8506C10;
  memset(&v3[13], 0, 48);
  v3[8] = xmmword_1D8506BD0;
  v3[9] = unk_1D8506BE0;
  v3[10] = xmmword_1D8506BF0;
  v3[11] = unk_1D8506C00;
  v3[4] = xmmword_1D8506B90;
  v3[5] = unk_1D8506BA0;
  v3[6] = xmmword_1D8506BB0;
  v3[7] = unk_1D8506BC0;
  v3[0] = CSMagSafeStaticViewRingLineWidth;
  v3[1] = unk_1D8506B60;
  v3[2] = xmmword_1D8506B70;
  v3[3] = unk_1D8506B80;
  v2[12] = xmmword_1D8506D10;
  memset(&v2[13], 0, 48);
  v2[8] = xmmword_1D8506CD0;
  v2[9] = unk_1D8506CE0;
  v2[10] = xmmword_1D8506CF0;
  v2[11] = unk_1D8506D00;
  v2[4] = xmmword_1D8506C90;
  v2[5] = unk_1D8506CA0;
  v2[6] = xmmword_1D8506CB0;
  v2[7] = unk_1D8506CC0;
  v2[0] = CSMagSafeSplashRingDiameter;
  v2[1] = unk_1D8506C60;
  v2[2] = xmmword_1D8506C70;
  v2[3] = unk_1D8506C80;
  v0 = [[CSMagSafeRingConfiguration alloc] initWithRingDiameter:v4 lineWidth:v3 splashRingDiamter:v2];
  v1 = (void *)staticConfiguration___staticConfiguration;
  staticConfiguration___staticConfiguration = (uint64_t)v0;
}

+ (id)auxiliaryConfiguration
{
  if (auxiliaryConfiguration_onceToken != -1) {
    dispatch_once(&auxiliaryConfiguration_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)auxiliaryConfiguration___auxiliaryConfiguration;

  return v2;
}

void __52__CSMagSafeRingConfiguration_auxiliaryConfiguration__block_invoke()
{
  v4[12] = xmmword_1D8506810;
  memset(&v4[13], 0, 48);
  v4[8] = xmmword_1D85067D0;
  v4[9] = unk_1D85067E0;
  v4[10] = xmmword_1D85067F0;
  v4[11] = unk_1D8506800;
  v4[4] = xmmword_1D8506790;
  v4[5] = unk_1D85067A0;
  v4[6] = xmmword_1D85067B0;
  v4[7] = unk_1D85067C0;
  v4[0] = CSMagSafeAuxiliaryRingDiameter;
  v4[1] = unk_1D8506760;
  v4[2] = xmmword_1D8506770;
  v4[3] = unk_1D8506780;
  v3[12] = xmmword_1D8506A10;
  memset(&v3[13], 0, 48);
  v3[8] = xmmword_1D85069D0;
  v3[9] = unk_1D85069E0;
  v3[10] = xmmword_1D85069F0;
  v3[11] = unk_1D8506A00;
  v3[4] = xmmword_1D8506990;
  v3[5] = unk_1D85069A0;
  v3[6] = xmmword_1D85069B0;
  v3[7] = unk_1D85069C0;
  v3[0] = CSMagSafeAuxiliaryLineWidth;
  v3[1] = unk_1D8506960;
  v3[2] = xmmword_1D8506970;
  v3[3] = unk_1D8506980;
  v2[12] = xmmword_1D8506D10;
  memset(&v2[13], 0, 48);
  v2[8] = xmmword_1D8506CD0;
  v2[9] = unk_1D8506CE0;
  v2[10] = xmmword_1D8506CF0;
  v2[11] = unk_1D8506D00;
  v2[4] = xmmword_1D8506C90;
  v2[5] = unk_1D8506CA0;
  v2[6] = xmmword_1D8506CB0;
  v2[7] = unk_1D8506CC0;
  v2[0] = CSMagSafeSplashRingDiameter;
  v2[1] = unk_1D8506C60;
  v2[2] = xmmword_1D8506C70;
  v2[3] = unk_1D8506C80;
  v0 = [[CSMagSafeRingConfiguration alloc] initWithRingDiameter:v4 lineWidth:v3 splashRingDiamter:v2];
  v1 = (void *)auxiliaryConfiguration___auxiliaryConfiguration;
  auxiliaryConfiguration___auxiliaryConfiguration = (uint64_t)v0;
}

+ (double)staticScaleFactor
{
  int v3 = __sb__runningInSpringBoard();
  v4 = (void *)0x1E4F42000;
  if (v3)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v318 = 0;
      int v321 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v248 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v248 userInterfaceIdiom] != 1)
    {
      int v318 = 0;
      int v321 = 1;
      goto LABEL_10;
    }
  }
  int v321 = v3 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v230 = [MEMORY[0x1E4F42D90] mainScreen];
      [v230 _referenceBounds];
    }
    int v19 = v5 ^ 1;
    BSSizeRoundForScale();
    BOOL v22 = v21 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v20 == *(double *)(MEMORY[0x1E4FA6E50] + 280);
    int v318 = v19;
    if (v22)
    {
      uint64_t v280 = 0;
      int v277 = 0;
      uint64_t v278 = 0;
      int v274 = 0;
      uint64_t v268 = 0;
      uint64_t v272 = 0;
      int v285 = 0;
      int v271 = 0;
      uint64_t v267 = 0;
      uint64_t v286 = 0;
      uint64_t v264 = 0;
      uint64_t v260 = 0;
      int v282 = 0;
      uint64_t v263 = 0;
      int v289 = 0;
      int v259 = 0;
      uint64_t v290 = 0;
      int v262 = 0;
      uint64_t v293 = 0;
      int v294 = 0;
      int v299 = 0;
      int v295 = 0;
      long long v300 = 0uLL;
      uint64_t v305 = 0;
      int v303 = 0;
      int v301 = 0;
      uint64_t v307 = 0;
      uint64_t v309 = 0;
      uint64_t v316 = 0;
      uint64_t v313 = 0;
      int v317 = 0;
      int v314 = 0;
      double v15 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    int v318 = 0;
  }
LABEL_10:
  int v6 = __sb__runningInSpringBoard();
  if (v6)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v305) = 0;
      HIDWORD(v307) = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v246 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v246 userInterfaceIdiom] != 1)
    {
      HIDWORD(v305) = 0;
      HIDWORD(v307) = 1;
      goto LABEL_19;
    }
  }
  HIDWORD(v307) = v6 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v228 = [MEMORY[0x1E4F42D90] mainScreen];
      [v228 _referenceBounds];
    }
    BSSizeRoundForScale();
    HIDWORD(v305) = v7 ^ 1;
    if (v23 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      uint64_t v280 = 0;
      int v277 = 0;
      uint64_t v278 = 0;
      int v274 = 0;
      uint64_t v268 = 0;
      uint64_t v272 = 0;
      int v285 = 0;
      int v271 = 0;
      uint64_t v267 = 0;
      uint64_t v286 = 0;
      uint64_t v264 = 0;
      uint64_t v260 = 0;
      int v282 = 0;
      uint64_t v263 = 0;
      int v289 = 0;
      int v259 = 0;
      uint64_t v290 = 0;
      int v262 = 0;
      uint64_t v293 = 0;
      int v294 = 0;
      int v299 = 0;
      int v295 = 0;
      long long v300 = 0uLL;
      LODWORD(v305) = 0;
      int v303 = 0;
      int v301 = 0;
      LODWORD(v307) = 0;
      uint64_t v309 = 0;
      uint64_t v316 = 0;
      uint64_t v313 = 0;
      int v317 = 0;
      int v314 = 0;
      double v15 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v305) = 0;
  }
LABEL_19:
  int v8 = __sb__runningInSpringBoard();
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v317 = 0;
      int v314 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    v244 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v244 userInterfaceIdiom] != 1)
    {
      int v317 = 0;
      int v314 = 1;
      goto LABEL_28;
    }
  }
  int v314 = v8 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v9 = __sb__runningInSpringBoard();
    if (v9)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v226 = [MEMORY[0x1E4F42D90] mainScreen];
      [v226 _referenceBounds];
    }
    int v317 = v9 ^ 1;
    BSSizeRoundForScale();
    if (v24 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      uint64_t v280 = 0;
      int v277 = 0;
      uint64_t v278 = 0;
      int v274 = 0;
      uint64_t v268 = 0;
      uint64_t v272 = 0;
      int v285 = 0;
      int v271 = 0;
      uint64_t v267 = 0;
      uint64_t v286 = 0;
      uint64_t v264 = 0;
      uint64_t v260 = 0;
      int v282 = 0;
      uint64_t v263 = 0;
      int v289 = 0;
      int v259 = 0;
      uint64_t v290 = 0;
      int v262 = 0;
      uint64_t v293 = 0;
      int v294 = 0;
      int v299 = 0;
      int v295 = 0;
      long long v300 = 0uLL;
      LODWORD(v305) = 0;
      int v303 = 0;
      int v301 = 0;
      LODWORD(v307) = 0;
      uint64_t v309 = 0;
      uint64_t v316 = 0;
      uint64_t v313 = 0;
      double v15 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    int v317 = 0;
  }
LABEL_28:
  int v10 = __sb__runningInSpringBoard();
  if (v10)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v313 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    v242 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v242 userInterfaceIdiom] != 1)
    {
      uint64_t v313 = 0x100000000;
      goto LABEL_37;
    }
  }
  HIDWORD(v313) = v10 ^ 1;
  int v11 = __sb__runningInSpringBoard();
  if (v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v236 = [MEMORY[0x1E4F42D90] mainScreen];
    [v236 _referenceBounds];
  }
  LODWORD(v313) = v11 ^ 1;
  BSSizeRoundForScale();
  if (v12 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    uint64_t v280 = 0;
    int v277 = 0;
    uint64_t v278 = 0;
    int v274 = 0;
    uint64_t v268 = 0;
    uint64_t v272 = 0;
    int v285 = 0;
    int v271 = 0;
    uint64_t v267 = 0;
    uint64_t v286 = 0;
    uint64_t v264 = 0;
    uint64_t v260 = 0;
    int v282 = 0;
    uint64_t v263 = 0;
    int v289 = 0;
    int v259 = 0;
    uint64_t v290 = 0;
    int v262 = 0;
    uint64_t v293 = 0;
    int v294 = 0;
    int v299 = 0;
    int v295 = 0;
    long long v300 = 0uLL;
    LODWORD(v305) = 0;
    int v303 = 0;
    int v301 = 0;
    LODWORD(v307) = 0;
    uint64_t v309 = 0;
    uint64_t v316 = 0;
    double v15 = 0.0;
    goto LABEL_67;
  }
LABEL_37:
  int v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v316 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    v240 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v240 userInterfaceIdiom] != 1)
    {
      uint64_t v316 = 0x100000000;
      goto LABEL_47;
    }
  }
  HIDWORD(v316) = v13 ^ 1;
  int v14 = __sb__runningInSpringBoard();
  if (v14)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v232 = [MEMORY[0x1E4F42D90] mainScreen];
    [v232 _referenceBounds];
  }
  LODWORD(v316) = v14 ^ 1;
  BSSizeRoundForScale();
  if (v16 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    uint64_t v280 = 0;
    int v277 = 0;
    uint64_t v278 = 0;
    int v274 = 0;
    uint64_t v268 = 0;
    uint64_t v272 = 0;
    int v285 = 0;
    int v271 = 0;
    uint64_t v267 = 0;
    uint64_t v286 = 0;
    uint64_t v264 = 0;
    uint64_t v260 = 0;
    int v282 = 0;
    uint64_t v263 = 0;
    int v289 = 0;
    int v259 = 0;
    uint64_t v290 = 0;
    int v262 = 0;
    uint64_t v293 = 0;
    int v294 = 0;
    int v299 = 0;
    int v295 = 0;
    long long v300 = 0uLL;
    LODWORD(v305) = 0;
    int v303 = 0;
    int v301 = 0;
    LODWORD(v307) = 0;
    uint64_t v309 = 0;
    double v15 = 0.0;
    goto LABEL_67;
  }
LABEL_47:
  int v17 = __sb__runningInSpringBoard();
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v309 = 0;
      goto LABEL_344;
    }
  }
  else
  {
    v238 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v238 userInterfaceIdiom] != 1)
    {
      uint64_t v309 = 0x100000000;
      goto LABEL_344;
    }
  }
  HIDWORD(v309) = v17 ^ 1;
  int v18 = __sb__runningInSpringBoard();
  if (v18)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v224 = [MEMORY[0x1E4F42D90] mainScreen];
    [v224 _referenceBounds];
  }
  LODWORD(v309) = v18 ^ 1;
  BSSizeRoundForScale();
  if (v53 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    uint64_t v280 = 0;
    int v277 = 0;
    uint64_t v278 = 0;
    int v274 = 0;
    uint64_t v268 = 0;
    uint64_t v272 = 0;
    int v285 = 0;
    int v271 = 0;
    uint64_t v267 = 0;
    uint64_t v286 = 0;
    uint64_t v264 = 0;
    uint64_t v260 = 0;
    int v282 = 0;
    uint64_t v263 = 0;
    int v289 = 0;
    int v259 = 0;
    uint64_t v290 = 0;
    int v262 = 0;
    uint64_t v293 = 0;
    int v294 = 0;
    int v299 = 0;
    int v295 = 0;
    long long v300 = 0uLL;
    LODWORD(v305) = 0;
    int v303 = 0;
    int v301 = 0;
    LODWORD(v307) = 0;
    double v15 = 0.0;
    goto LABEL_67;
  }
LABEL_344:
  int v54 = __sb__runningInSpringBoard();
  if (v54)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_346;
    }
LABEL_352:
    uint64_t v280 = 0;
    int v277 = 0;
    uint64_t v278 = 0;
    int v274 = 0;
    uint64_t v268 = 0;
    uint64_t v272 = 0;
    int v285 = 0;
    int v271 = 0;
    uint64_t v267 = 0;
    uint64_t v286 = 0;
    uint64_t v264 = 0;
    uint64_t v260 = 0;
    int v282 = 0;
    uint64_t v263 = 0;
    int v289 = 0;
    int v259 = 0;
    uint64_t v290 = 0;
    int v262 = 0;
    uint64_t v293 = 0;
    int v294 = 0;
    int v299 = 0;
    int v295 = 0;
    long long v300 = 0uLL;
    LODWORD(v305) = 0;
    int v303 = 0;
    int v301 = 0;
    double v15 = 0.0;
    LODWORD(v307) = v54 ^ 1;
    goto LABEL_67;
  }
  v234 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v234 userInterfaceIdiom] == 1) {
    goto LABEL_352;
  }
LABEL_346:
  LODWORD(v307) = v54 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_350:
    int v303 = 0;
    int v301 = 0;
    goto LABEL_375;
  }
  int v55 = __sb__runningInSpringBoard();
  if (v55)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_350;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom])
    {
      v257 = v2;
      int v303 = 0;
      int v301 = 1;
      goto LABEL_375;
    }
  }
  int v301 = v55 ^ 1;
  v257 = v2;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v58 = __sb__runningInSpringBoard();
    if (v58)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v206 = [MEMORY[0x1E4F42D90] mainScreen];
      [v206 _referenceBounds];
    }
    int v303 = v58 ^ 1;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      uint64_t v280 = 0;
      int v277 = 0;
      uint64_t v278 = 0;
      int v274 = 0;
      uint64_t v268 = 0;
      uint64_t v272 = 0;
      int v285 = 0;
      int v271 = 0;
      uint64_t v267 = 0;
      uint64_t v286 = 0;
      uint64_t v264 = 0;
      uint64_t v260 = 0;
      int v282 = 0;
      uint64_t v263 = 0;
      int v289 = 0;
      int v259 = 0;
      uint64_t v290 = 0;
      int v262 = 0;
      uint64_t v293 = 0;
      int v294 = 0;
      int v299 = 0;
      int v295 = 0;
      long long v300 = 0uLL;
      LODWORD(v305) = 0;
      double v15 = 52.0;
      goto LABEL_67;
    }
  }
  else
  {
    int v303 = 0;
  }
LABEL_375:
  int v59 = __sb__runningInSpringBoard();
  v60 = &qword_1D8506000;
  if (v59)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v300) = 0;
      LODWORD(v305) = 0;
      goto LABEL_385;
    }
  }
  else
  {
    v222 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v222 userInterfaceIdiom])
    {
      HIDWORD(v300) = 0;
      LODWORD(v305) = 1;
      goto LABEL_385;
    }
  }
  LODWORD(v305) = v59 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v61 = __sb__runningInSpringBoard();
    if (v61)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v212 = [MEMORY[0x1E4F42D90] mainScreen];
      [v212 _referenceBounds];
    }
    HIDWORD(v300) = v61 ^ 1;
    BSSizeRoundForScale();
    if (v62 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_389;
    }
  }
  else
  {
    HIDWORD(v300) = 0;
  }
LABEL_385:
  if (_SBF_Private_IsD94Like())
  {
    uint64_t v280 = 0;
    int v277 = 0;
    uint64_t v278 = 0;
    int v274 = 0;
    uint64_t v268 = 0;
    uint64_t v272 = 0;
    int v285 = 0;
    int v271 = 0;
    uint64_t v267 = 0;
    uint64_t v286 = 0;
    uint64_t v264 = 0;
    uint64_t v260 = 0;
    int v282 = 0;
    uint64_t v263 = 0;
    int v289 = 0;
    int v259 = 0;
    uint64_t v290 = 0;
    int v262 = 0;
    uint64_t v293 = 0;
    int v294 = 0;
    int v299 = 0;
    int v295 = 0;
    *(void *)&long long v300 = 0;
    DWORD2(v300) = 0;
    double v15 = 45.66666;
    goto LABEL_67;
  }
LABEL_389:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_393:
    *(void *)((char *)&v300 + 4) = 0;
    goto LABEL_431;
  }
  int v63 = __sb__runningInSpringBoard();
  if (v63)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_393;
    }
  }
  else
  {
    v214 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v214 userInterfaceIdiom])
    {
      *(void *)((char *)&v300 + 4) = 0x100000000;
      goto LABEL_431;
    }
  }
  DWORD2(v300) = v63 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v68 = __sb__runningInSpringBoard();
    if (v68)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v196 = [MEMORY[0x1E4F42D90] mainScreen];
      [v196 _referenceBounds];
    }
    DWORD1(v300) = v68 ^ 1;
    BSSizeRoundForScale();
    if (v81 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      uint64_t v280 = 0;
      int v277 = 0;
      uint64_t v278 = 0;
      int v274 = 0;
      uint64_t v268 = 0;
      uint64_t v272 = 0;
      int v285 = 0;
      int v271 = 0;
      uint64_t v267 = 0;
      uint64_t v286 = 0;
      uint64_t v264 = 0;
      uint64_t v260 = 0;
      int v282 = 0;
      uint64_t v263 = 0;
      int v289 = 0;
      int v259 = 0;
      uint64_t v290 = 0;
      int v262 = 0;
      uint64_t v293 = 0;
      int v294 = 0;
      int v299 = 0;
      int v295 = 0;
      LODWORD(v300) = 0;
      double v15 = 24.0;
      goto LABEL_67;
    }
  }
  else
  {
    DWORD1(v300) = 0;
  }
LABEL_431:
  int v69 = __sb__runningInSpringBoard();
  if (v69)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v295 = 0;
      LODWORD(v300) = 0;
      goto LABEL_441;
    }
  }
  else
  {
    v219 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v219 userInterfaceIdiom])
    {
      int v295 = 0;
      LODWORD(v300) = 1;
      goto LABEL_441;
    }
  }
  LODWORD(v300) = v69 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v70 = __sb__runningInSpringBoard();
    if (v70)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v205 = [MEMORY[0x1E4F42D90] mainScreen];
      [v205 _referenceBounds];
    }
    int v295 = v70 ^ 1;
    BSSizeRoundForScale();
    if (v71 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_445;
    }
  }
  else
  {
    int v295 = 0;
  }
LABEL_441:
  if (_SBF_Private_IsD64Like())
  {
    uint64_t v280 = 0;
    int v277 = 0;
    uint64_t v278 = 0;
    int v274 = 0;
    uint64_t v268 = 0;
    uint64_t v272 = 0;
    int v285 = 0;
    int v271 = 0;
    uint64_t v267 = 0;
    uint64_t v286 = 0;
    uint64_t v264 = 0;
    uint64_t v260 = 0;
    int v282 = 0;
    uint64_t v263 = 0;
    int v289 = 0;
    int v259 = 0;
    uint64_t v290 = 0;
    int v262 = 0;
    uint64_t v293 = 0;
    int v294 = 0;
    int v299 = 0;
    double v15 = 45.66666;
    goto LABEL_67;
  }
LABEL_445:
  int v72 = __sb__runningInSpringBoard();
  if (v72)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v294 = 0;
      int v299 = 0;
      goto LABEL_455;
    }
  }
  else
  {
    v217 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v217 userInterfaceIdiom])
    {
      int v294 = 0;
      int v299 = 1;
      goto LABEL_455;
    }
  }
  int v299 = v72 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v73 = __sb__runningInSpringBoard();
    if (v73)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v198 = [MEMORY[0x1E4F42D90] mainScreen];
      [v198 _referenceBounds];
    }
    BSSizeRoundForScale();
    int v294 = v73 ^ 1;
    if (v79 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      uint64_t v280 = 0;
      int v277 = 0;
      uint64_t v278 = 0;
      int v274 = 0;
      uint64_t v268 = 0;
      uint64_t v272 = 0;
      int v285 = 0;
      int v271 = 0;
      uint64_t v267 = 0;
      uint64_t v286 = 0;
      uint64_t v264 = 0;
      uint64_t v260 = 0;
      int v282 = 0;
      uint64_t v263 = 0;
      int v289 = 0;
      int v259 = 0;
      uint64_t v290 = 0;
      int v262 = 0;
      uint64_t v293 = 0;
      double v15 = 52.0;
      goto LABEL_67;
    }
  }
  else
  {
    int v294 = 0;
  }
LABEL_455:
  int v74 = __sb__runningInSpringBoard();
  if (v74)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v286) = 0;
      HIDWORD(v290) = 0;
      goto LABEL_499;
    }
  }
  else
  {
    v210 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v210 userInterfaceIdiom])
    {
      HIDWORD(v286) = 0;
      HIDWORD(v290) = 1;
      goto LABEL_499;
    }
  }
  HIDWORD(v290) = v74 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v78 = __sb__runningInSpringBoard();
    if (v78)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v194 = [MEMORY[0x1E4F42D90] mainScreen];
      [v194 _referenceBounds];
    }
    HIDWORD(v286) = v78 ^ 1;
    BSSizeRoundForScale();
    if (v83 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_521;
    }
  }
  else
  {
    HIDWORD(v286) = 0;
  }
LABEL_499:
  if (_SBF_Private_IsD54())
  {
    uint64_t v280 = 0;
    int v277 = 0;
    uint64_t v278 = 0;
    int v274 = 0;
    uint64_t v268 = 0;
    uint64_t v272 = 0;
    int v285 = 0;
    int v271 = 0;
    uint64_t v267 = 0;
    LODWORD(v286) = 0;
    uint64_t v264 = 0;
    uint64_t v260 = 0;
    int v282 = 0;
    uint64_t v263 = 0;
    int v289 = 0;
    int v259 = 0;
    LODWORD(v290) = 0;
    int v262 = 0;
    uint64_t v293 = 0;
    double v15 = 45.66666;
    goto LABEL_67;
  }
LABEL_521:
  int v84 = __sb__runningInSpringBoard();
  if (v84)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v293 = 0;
      goto LABEL_539;
    }
  }
  else
  {
    v208 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v208 userInterfaceIdiom])
    {
      uint64_t v293 = 0x100000000;
      goto LABEL_539;
    }
  }
  HIDWORD(v293) = v84 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v88 = __sb__runningInSpringBoard();
    if (v88)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v189 = [MEMORY[0x1E4F42D90] mainScreen];
      [v189 _referenceBounds];
    }
    BSSizeRoundForScale();
    LODWORD(v293) = v88 ^ 1;
    if (v92 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      uint64_t v280 = 0;
      int v277 = 0;
      uint64_t v278 = 0;
      int v274 = 0;
      uint64_t v268 = 0;
      uint64_t v272 = 0;
      int v285 = 0;
      int v271 = 0;
      uint64_t v267 = 0;
      LODWORD(v286) = 0;
      uint64_t v264 = 0;
      uint64_t v260 = 0;
      int v282 = 0;
      uint64_t v263 = 0;
      int v289 = 0;
      int v259 = 0;
      LODWORD(v290) = 0;
      int v262 = 0;
      double v15 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v293) = 0;
  }
LABEL_539:
  int v89 = __sb__runningInSpringBoard();
  if (v89)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v289 = 0;
      LODWORD(v290) = 0;
      goto LABEL_559;
    }
  }
  else
  {
    v203 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v203 userInterfaceIdiom])
    {
      int v289 = 0;
      LODWORD(v290) = 1;
      goto LABEL_559;
    }
  }
  LODWORD(v290) = v89 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v91 = __sb__runningInSpringBoard();
    if (v91)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v187 = [MEMORY[0x1E4F42D90] mainScreen];
      [v187 _referenceBounds];
    }
    int v289 = v91 ^ 1;
    BSSizeRoundForScale();
    if (v94 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_579;
    }
  }
  else
  {
    int v289 = 0;
  }
LABEL_559:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    uint64_t v280 = 0;
    int v277 = 0;
    uint64_t v278 = 0;
    int v274 = 0;
    uint64_t v268 = 0;
    uint64_t v272 = 0;
    int v285 = 0;
    int v271 = 0;
    uint64_t v267 = 0;
    LODWORD(v286) = 0;
    uint64_t v264 = 0;
    uint64_t v260 = 0;
    int v282 = 0;
    uint64_t v263 = 0;
    int v259 = 0;
    int v262 = 0;
    double v15 = 0.0;
    goto LABEL_67;
  }
LABEL_579:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_583:
    HIDWORD(v280) = 0;
    int v282 = 0;
    goto LABEL_599;
  }
  int v95 = __sb__runningInSpringBoard();
  if (v95)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_583;
    }
  }
  else
  {
    v60 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v60 userInterfaceIdiom])
    {
      v199 = v60;
      HIDWORD(v280) = 0;
      int v282 = 1;
      goto LABEL_599;
    }
  }
  int v282 = v95 ^ 1;
  v199 = v60;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v98 = __sb__runningInSpringBoard();
    if (v98)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v174 = [MEMORY[0x1E4F42D90] mainScreen];
      [v174 _referenceBounds];
    }
    BSSizeRoundForScale();
    HIDWORD(v280) = v98 ^ 1;
    if (v108 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      LODWORD(v280) = 0;
      int v277 = 0;
      uint64_t v278 = 0;
      int v274 = 0;
      uint64_t v268 = 0;
      uint64_t v272 = 0;
      int v285 = 0;
      int v271 = 0;
      uint64_t v267 = 0;
      LODWORD(v286) = 0;
      uint64_t v264 = 0;
      uint64_t v260 = 0;
      uint64_t v263 = 0;
      int v259 = 0;
      int v262 = 0;
      double v15 = 45.0;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v280) = 0;
  }
LABEL_599:
  int v99 = __sb__runningInSpringBoard();
  if (v99)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v285 = 0;
      LODWORD(v286) = 0;
      goto LABEL_609;
    }
  }
  else
  {
    v201 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v201 userInterfaceIdiom])
    {
      int v285 = 0;
      LODWORD(v286) = 1;
      goto LABEL_609;
    }
  }
  LODWORD(v286) = v99 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v100 = __sb__runningInSpringBoard();
    if (v100)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v180 = [MEMORY[0x1E4F42D90] mainScreen];
      [v180 _referenceBounds];
    }
    int v285 = v100 ^ 1;
    BSSizeRoundForScale();
    if (v101 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_613;
    }
  }
  else
  {
    int v285 = 0;
  }
LABEL_609:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v280) = 0;
    int v277 = 0;
    uint64_t v278 = 0;
    int v274 = 0;
    uint64_t v268 = 0;
    uint64_t v272 = 0;
    int v271 = 0;
    uint64_t v267 = 0;
    uint64_t v264 = 0;
    uint64_t v260 = 0;
    uint64_t v263 = 0;
    int v259 = 0;
    int v262 = 0;
    double v15 = 37.0;
    goto LABEL_67;
  }
LABEL_613:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_617:
    uint64_t v278 = 0;
    goto LABEL_655;
  }
  int v102 = __sb__runningInSpringBoard();
  if (v102)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_617;
    }
  }
  else
  {
    v182 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v182 userInterfaceIdiom])
    {
      uint64_t v278 = 0x100000000;
      goto LABEL_655;
    }
  }
  HIDWORD(v278) = v102 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v110 = __sb__runningInSpringBoard();
    if (v110)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v167 = [MEMORY[0x1E4F42D90] mainScreen];
      [v167 _referenceBounds];
    }
    LODWORD(v278) = v110 ^ 1;
    BSSizeRoundForScale();
    if (v123 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v280) = 0;
      int v277 = 0;
      int v274 = 0;
      uint64_t v268 = 0;
      uint64_t v272 = 0;
      int v271 = 0;
      uint64_t v267 = 0;
      uint64_t v264 = 0;
      uint64_t v260 = 0;
      uint64_t v263 = 0;
      int v259 = 0;
      int v262 = 0;
      double v15 = 45.0;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v278) = 0;
  }
LABEL_655:
  int v111 = __sb__runningInSpringBoard();
  if (v111)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v280) = 0;
      int v277 = 0;
      goto LABEL_665;
    }
  }
  else
  {
    v191 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v191 userInterfaceIdiom])
    {
      int v277 = 0;
      LODWORD(v280) = 1;
      goto LABEL_665;
    }
  }
  LODWORD(v280) = v111 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v112 = __sb__runningInSpringBoard();
    if (v112)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v173 = [MEMORY[0x1E4F42D90] mainScreen];
      [v173 _referenceBounds];
    }
    int v277 = v112 ^ 1;
    BSSizeRoundForScale();
    if (v113 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_669;
    }
  }
  else
  {
    int v277 = 0;
  }
LABEL_665:
  if (_SBF_Private_IsD63Like())
  {
    int v274 = 0;
    uint64_t v268 = 0;
    uint64_t v272 = 0;
    int v271 = 0;
    uint64_t v267 = 0;
    uint64_t v264 = 0;
    uint64_t v260 = 0;
    uint64_t v263 = 0;
    int v259 = 0;
    int v262 = 0;
    double v15 = 37.0;
    goto LABEL_67;
  }
LABEL_669:
  int v114 = __sb__runningInSpringBoard();
  if (v114)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v274 = 0;
      HIDWORD(v268) = 0;
      goto LABEL_679;
    }
  }
  else
  {
    v185 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v185 userInterfaceIdiom])
    {
      HIDWORD(v268) = 0;
      int v274 = 1;
      goto LABEL_679;
    }
  }
  int v274 = v114 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v115 = __sb__runningInSpringBoard();
    if (v115)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v169 = [MEMORY[0x1E4F42D90] mainScreen];
      [v169 _referenceBounds];
    }
    BSSizeRoundForScale();
    HIDWORD(v268) = v115 ^ 1;
    if (v121 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v272 = 0;
      int v271 = 0;
      LODWORD(v268) = 0;
      uint64_t v267 = 0;
      uint64_t v264 = 0;
      uint64_t v260 = 0;
      uint64_t v263 = 0;
      int v259 = 0;
      int v262 = 0;
      double v15 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v268) = 0;
  }
LABEL_679:
  int v116 = __sb__runningInSpringBoard();
  if (v116)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v272 = 0;
      goto LABEL_723;
    }
  }
  else
  {
    v178 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v178 userInterfaceIdiom])
    {
      uint64_t v272 = 0x100000000;
      goto LABEL_723;
    }
  }
  HIDWORD(v272) = v116 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v120 = __sb__runningInSpringBoard();
    if (v120)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v165 = [MEMORY[0x1E4F42D90] mainScreen];
      [v165 _referenceBounds];
    }
    LODWORD(v272) = v120 ^ 1;
    BSSizeRoundForScale();
    if (v125 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_745;
    }
  }
  else
  {
    LODWORD(v272) = 0;
  }
LABEL_723:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    int v271 = 0;
    LODWORD(v268) = 0;
    uint64_t v267 = 0;
    uint64_t v264 = 0;
    uint64_t v260 = 0;
    uint64_t v263 = 0;
    int v259 = 0;
    int v262 = 0;
    double v15 = 0.0;
    goto LABEL_67;
  }
LABEL_745:
  int v126 = __sb__runningInSpringBoard();
  if (v126)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v271 = 0;
      LODWORD(v268) = 0;
      goto LABEL_763;
    }
  }
  else
  {
    v176 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v176 userInterfaceIdiom])
    {
      LODWORD(v268) = 0;
      int v271 = 1;
      goto LABEL_763;
    }
  }
  int v271 = v126 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v129 = __sb__runningInSpringBoard();
    if (v129)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v163 = [MEMORY[0x1E4F42D90] mainScreen];
      [v163 _referenceBounds];
    }
    LODWORD(v268) = v129 ^ 1;
    BSSizeRoundForScale();
    if (v132 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      uint64_t v267 = 0;
      uint64_t v264 = 0;
      uint64_t v260 = 0;
      uint64_t v263 = 0;
      int v259 = 0;
      int v262 = 0;
      double v15 = 45.0;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v268) = 0;
  }
LABEL_763:
  int v130 = __sb__runningInSpringBoard();
  if (v130)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v267 = 0;
      goto LABEL_783;
    }
  }
  else
  {
    v171 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v171 userInterfaceIdiom])
    {
      uint64_t v267 = 0x100000000;
      goto LABEL_783;
    }
  }
  HIDWORD(v267) = v130 ^ 1;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    LODWORD(v267) = 0;
    goto LABEL_783;
  }
  int v131 = __sb__runningInSpringBoard();
  if (v131)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v161 = [MEMORY[0x1E4F42D90] mainScreen];
    [v161 _referenceBounds];
  }
  LODWORD(v267) = v131 ^ 1;
  BSSizeRoundForScale();
  if (v134 < *(double *)(MEMORY[0x1E4FA6E50] + 104))
  {
LABEL_783:
    if (_SBF_Private_IsD53())
    {
      uint64_t v264 = 0;
      uint64_t v260 = 0;
      uint64_t v263 = 0;
      int v259 = 0;
      int v262 = 0;
      double v15 = 37.0;
      goto LABEL_67;
    }
  }
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice()) {
    goto LABEL_804;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16()) {
    goto LABEL_806;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
LABEL_804:
    uint64_t v264 = 0;
    uint64_t v260 = 0;
    uint64_t v263 = 0;
    int v259 = 0;
    int v262 = 0;
    double v15 = 45.0;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
LABEL_806:
    uint64_t v264 = 0;
    uint64_t v260 = 0;
    uint64_t v263 = 0;
    int v259 = 0;
    int v262 = 0;
    double v15 = 38.33333;
    goto LABEL_67;
  }
  int v136 = __sb__runningInSpringBoard();
  if (v136)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v264) = 0;
      HIDWORD(v260) = 0;
      goto LABEL_833;
    }
  }
  else
  {
    v256 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v256 userInterfaceIdiom])
    {
      HIDWORD(v260) = 0;
      HIDWORD(v264) = 1;
      goto LABEL_833;
    }
  }
  HIDWORD(v264) = v136 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v137 = __sb__runningInSpringBoard();
    if (v137)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v250 = [MEMORY[0x1E4F42D90] mainScreen];
      [v250 _referenceBounds];
    }
    HIDWORD(v260) = v137 ^ 1;
    BSSizeRoundForScale();
    if (v144 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      LODWORD(v264) = 0;
      uint64_t v263 = 0;
      LODWORD(v260) = 0;
      int v259 = 0;
      int v262 = 0;
      double v15 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v260) = 0;
  }
LABEL_833:
  int v138 = __sb__runningInSpringBoard();
  if (v138)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v264) = 0;
      HIDWORD(v263) = 0;
      goto LABEL_853;
    }
  }
  else
  {
    v255 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v255 userInterfaceIdiom])
    {
      HIDWORD(v263) = 0;
      LODWORD(v264) = 1;
      goto LABEL_853;
    }
  }
  LODWORD(v264) = v138 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v140 = __sb__runningInSpringBoard();
    if (v140)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v249 = [MEMORY[0x1E4F42D90] mainScreen];
      [v249 _referenceBounds];
    }
    HIDWORD(v263) = v140 ^ 1;
    BSSizeRoundForScale();
    if (v152 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      LODWORD(v260) = 0;
      int v259 = 0;
      LODWORD(v263) = 0;
      int v262 = 0;
      double v15 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v263) = 0;
  }
LABEL_853:
  int v141 = __sb__runningInSpringBoard();
  if (!v141)
  {
    v254 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v254 userInterfaceIdiom])
    {
      int v259 = 0;
      LODWORD(v260) = 1;
      goto LABEL_879;
    }
LABEL_875:
    LODWORD(v260) = v141 ^ 1;
    int v146 = __sb__runningInSpringBoard();
    if (v146)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v252 = [MEMORY[0x1E4F42D90] mainScreen];
      [v252 _referenceBounds];
    }
    int v259 = v146 ^ 1;
    BSSizeRoundForScale();
    if (v147 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
      goto LABEL_882;
    }
    goto LABEL_879;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_875;
  }
  LODWORD(v260) = 0;
  int v259 = 0;
LABEL_879:
  int v148 = __sb__runningInSpringBoard();
  if (v148)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_882:
      LODWORD(v263) = 0;
      int v262 = 0;
      double v15 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    v253 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v253 userInterfaceIdiom])
    {
      int v262 = 0;
      double v15 = 0.0;
      LODWORD(v263) = 1;
      goto LABEL_67;
    }
  }
  LODWORD(v263) = v148 ^ 1;
  int v155 = __sb__runningInSpringBoard();
  if (v155)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v251 = [MEMORY[0x1E4F42D90] mainScreen];
    [v251 _referenceBounds];
  }
  int v262 = v155 ^ 1;
  BSSizeRoundForScale();
  double v15 = 0.0;
LABEL_67:
  int v25 = __sb__runningInSpringBoard();
  if (v25)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v26 = 0;
      int v27 = 0;
      goto LABEL_76;
    }
  }
  else
  {
    v247 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v247 userInterfaceIdiom] != 1)
    {
      int v27 = 0;
      uint64_t v26 = 1;
      goto LABEL_76;
    }
  }
  uint64_t v26 = v25 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v229 = [MEMORY[0x1E4F42D90] mainScreen];
      [v229 _referenceBounds];
    }
    int v27 = v28 ^ 1;
    BSSizeRoundForScale();
    if (v49 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v48 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v319 = v28 ^ 1;
      int v320 = v26;
      unint64_t v311 = 0;
      unint64_t v312 = 0;
      unint64_t v310 = 0;
      uint64_t v315 = 0;
      uint64_t v308 = 0;
      int v306 = 0;
      uint64_t v298 = 0;
      int v302 = 0;
      int v304 = 0;
      uint64_t v297 = 0;
      uint64_t v296 = 0;
      uint64_t v292 = 0;
      int v288 = 0;
      int v284 = 0;
      uint64_t v291 = 0;
      uint64_t v287 = 0;
      int v281 = 0;
      uint64_t v279 = 0;
      uint64_t v283 = 0;
      int v276 = 0;
      uint64_t v275 = 0;
      int v273 = 0;
      uint64_t v266 = 0;
      int v270 = 0;
      uint64_t v269 = 0;
      uint64_t v265 = 0;
      int v261 = 0;
      int v258 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      double v45 = 0.0;
      goto LABEL_130;
    }
  }
  else
  {
    int v27 = 0;
  }
LABEL_76:
  int v29 = __sb__runningInSpringBoard();
  int v319 = v27;
  int v320 = v26;
  if (v29)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v30 = 0;
      unsigned int v31 = 0;
      goto LABEL_85;
    }
  }
  else
  {
    v245 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v245 userInterfaceIdiom] != 1)
    {
      unsigned int v31 = 0;
      int v30 = 1;
      goto LABEL_85;
    }
  }
  int v30 = v29 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v227 = [MEMORY[0x1E4F42D90] mainScreen];
      [v227 _referenceBounds];
    }
    unsigned int v31 = v28 ^ 1;
    BSSizeRoundForScale();
    if (v50 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      LODWORD(v312) = v28 ^ 1;
      HIDWORD(v312) = v30;
      unint64_t v310 = 0;
      unint64_t v311 = 0;
      uint64_t v315 = 0;
      uint64_t v308 = 0;
      int v306 = 0;
      uint64_t v298 = 0;
      int v302 = 0;
      int v304 = 0;
      uint64_t v297 = 0;
      uint64_t v296 = 0;
      uint64_t v292 = 0;
      int v288 = 0;
      int v284 = 0;
      uint64_t v291 = 0;
      uint64_t v287 = 0;
      int v281 = 0;
      uint64_t v279 = 0;
      uint64_t v283 = 0;
      int v276 = 0;
      uint64_t v275 = 0;
      int v273 = 0;
      uint64_t v266 = 0;
      int v270 = 0;
      uint64_t v269 = 0;
      uint64_t v265 = 0;
      int v261 = 0;
      int v258 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      double v45 = 0.0;
      goto LABEL_130;
    }
  }
  else
  {
    unsigned int v31 = 0;
  }
LABEL_85:
  int v32 = __sb__runningInSpringBoard();
  unint64_t v312 = __PAIR64__(v30, v31);
  if (v32)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v33 = 0;
      unsigned int v34 = 0;
      goto LABEL_94;
    }
  }
  else
  {
    v243 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v243 userInterfaceIdiom] != 1)
    {
      unsigned int v34 = 0;
      int v33 = 1;
      goto LABEL_94;
    }
  }
  int v33 = v32 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v225 = [MEMORY[0x1E4F42D90] mainScreen];
      [v225 _referenceBounds];
    }
    unsigned int v34 = v28 ^ 1;
    BSSizeRoundForScale();
    if (v51 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      LODWORD(v311) = v28 ^ 1;
      HIDWORD(v311) = v33;
      unint64_t v310 = 0;
      uint64_t v315 = 0;
      uint64_t v308 = 0;
      int v306 = 0;
      uint64_t v298 = 0;
      int v302 = 0;
      int v304 = 0;
      uint64_t v297 = 0;
      uint64_t v296 = 0;
      uint64_t v292 = 0;
      int v288 = 0;
      int v284 = 0;
      uint64_t v291 = 0;
      uint64_t v287 = 0;
      int v281 = 0;
      uint64_t v279 = 0;
      uint64_t v283 = 0;
      int v276 = 0;
      uint64_t v275 = 0;
      int v273 = 0;
      uint64_t v266 = 0;
      int v270 = 0;
      uint64_t v269 = 0;
      uint64_t v265 = 0;
      int v261 = 0;
      int v258 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      double v45 = 0.0;
      goto LABEL_130;
    }
  }
  else
  {
    unsigned int v34 = 0;
  }
LABEL_94:
  int v35 = __sb__runningInSpringBoard();
  unint64_t v311 = __PAIR64__(v33, v34);
  if (v35)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v36 = 0;
      uint64_t v37 = 0;
      goto LABEL_103;
    }
  }
  else
  {
    v241 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v241 userInterfaceIdiom] != 1)
    {
      uint64_t v37 = 0;
      int v36 = 1;
      goto LABEL_103;
    }
  }
  int v36 = v35 ^ 1;
  uint64_t v28 = __sb__runningInSpringBoard();
  if (v28)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v235 = [MEMORY[0x1E4F42D90] mainScreen];
    [v235 _referenceBounds];
  }
  uint64_t v37 = v28 ^ 1;
  BSSizeRoundForScale();
  if (v38 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    unint64_t v310 = __PAIR64__(v36, v37);
    uint64_t v315 = 0;
    uint64_t v308 = 0;
    int v306 = 0;
    uint64_t v298 = 0;
    int v302 = 0;
    int v304 = 0;
    uint64_t v297 = 0;
    uint64_t v296 = 0;
    uint64_t v292 = 0;
    int v288 = 0;
    int v284 = 0;
    uint64_t v291 = 0;
    uint64_t v287 = 0;
    int v281 = 0;
    uint64_t v279 = 0;
    uint64_t v283 = 0;
    int v276 = 0;
    uint64_t v275 = 0;
    int v273 = 0;
    uint64_t v266 = 0;
    int v270 = 0;
    uint64_t v269 = 0;
    uint64_t v265 = 0;
    int v261 = 0;
    int v258 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    double v45 = 0.0;
    goto LABEL_130;
  }
LABEL_103:
  int v39 = __sb__runningInSpringBoard();
  unint64_t v310 = __PAIR64__(v36, v37);
  if (v39)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v315 = 0;
      goto LABEL_113;
    }
  }
  else
  {
    v239 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v239 userInterfaceIdiom] != 1)
    {
      uint64_t v315 = 0x100000000;
      goto LABEL_113;
    }
  }
  HIDWORD(v315) = v39 ^ 1;
  uint64_t v28 = __sb__runningInSpringBoard();
  if (v28)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v231 = [MEMORY[0x1E4F42D90] mainScreen];
    [v231 _referenceBounds];
  }
  LODWORD(v315) = v28 ^ 1;
  BSSizeRoundForScale();
  if (v46 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    uint64_t v308 = 0;
    int v306 = 0;
    uint64_t v298 = 0;
    int v302 = 0;
    int v304 = 0;
    uint64_t v297 = 0;
    uint64_t v296 = 0;
    uint64_t v292 = 0;
    int v288 = 0;
    int v284 = 0;
    uint64_t v291 = 0;
    uint64_t v287 = 0;
    int v281 = 0;
    uint64_t v279 = 0;
    uint64_t v283 = 0;
    int v276 = 0;
    uint64_t v275 = 0;
    int v273 = 0;
    uint64_t v266 = 0;
    int v270 = 0;
    uint64_t v269 = 0;
    uint64_t v265 = 0;
    int v261 = 0;
    int v258 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    double v45 = 0.0;
    goto LABEL_130;
  }
LABEL_113:
  int v47 = __sb__runningInSpringBoard();
  if (v47)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v308 = 0;
      goto LABEL_356;
    }
  }
  else
  {
    v237 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v237 userInterfaceIdiom] != 1)
    {
      uint64_t v308 = 0x100000000;
      goto LABEL_356;
    }
  }
  HIDWORD(v308) = v47 ^ 1;
  uint64_t v28 = __sb__runningInSpringBoard();
  if (v28)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v223 = [MEMORY[0x1E4F42D90] mainScreen];
    [v223 _referenceBounds];
  }
  LODWORD(v308) = v28 ^ 1;
  BSSizeRoundForScale();
  if (v56 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    int v306 = 0;
    uint64_t v298 = 0;
    int v302 = 0;
    int v304 = 0;
    uint64_t v297 = 0;
    uint64_t v296 = 0;
    uint64_t v292 = 0;
    int v288 = 0;
    int v284 = 0;
    uint64_t v291 = 0;
    uint64_t v287 = 0;
    int v281 = 0;
    uint64_t v279 = 0;
    uint64_t v283 = 0;
    int v276 = 0;
    uint64_t v275 = 0;
    int v273 = 0;
    uint64_t v266 = 0;
    int v270 = 0;
    uint64_t v269 = 0;
    uint64_t v265 = 0;
    int v261 = 0;
    int v258 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    double v45 = 0.0;
    goto LABEL_130;
  }
LABEL_356:
  uint64_t v28 = __sb__runningInSpringBoard();
  if (v28)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_358;
    }
LABEL_364:
    uint64_t v298 = 0;
    int v302 = 0;
    int v304 = 0;
    uint64_t v297 = 0;
    uint64_t v296 = 0;
    uint64_t v292 = 0;
    int v288 = 0;
    int v284 = 0;
    uint64_t v291 = 0;
    uint64_t v287 = 0;
    int v281 = 0;
    uint64_t v279 = 0;
    uint64_t v283 = 0;
    int v276 = 0;
    uint64_t v275 = 0;
    int v273 = 0;
    uint64_t v266 = 0;
    int v270 = 0;
    uint64_t v269 = 0;
    uint64_t v265 = 0;
    int v261 = 0;
    int v258 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    double v45 = 0.0;
    int v306 = v28 ^ 1;
    goto LABEL_130;
  }
  v233 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v233 userInterfaceIdiom] == 1) {
    goto LABEL_364;
  }
LABEL_358:
  int v306 = v28 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_362:
    HIDWORD(v298) = 0;
    int v302 = 0;
    goto LABEL_400;
  }
  int v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_362;
    }
  }
  else
  {
    v220 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v220 userInterfaceIdiom])
    {
      int v302 = 0;
      HIDWORD(v298) = 1;
      goto LABEL_400;
    }
  }
  HIDWORD(v298) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v37 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v37 _referenceBounds];
    }
    v215 = (void *)v37;
    int v302 = v28 ^ 1;
    BSSizeRoundForScale();
    if (v67 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      int v304 = 0;
      LODWORD(v298) = 0;
      uint64_t v297 = 0;
      uint64_t v296 = 0;
      uint64_t v292 = 0;
      int v288 = 0;
      int v284 = 0;
      uint64_t v291 = 0;
      uint64_t v287 = 0;
      int v281 = 0;
      uint64_t v279 = 0;
      uint64_t v283 = 0;
      int v276 = 0;
      uint64_t v275 = 0;
      int v273 = 0;
      uint64_t v266 = 0;
      int v270 = 0;
      uint64_t v269 = 0;
      uint64_t v265 = 0;
      int v261 = 0;
      int v258 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      double v45 = 309.0;
      goto LABEL_130;
    }
  }
  else
  {
    int v302 = 0;
  }
LABEL_400:
  uint64_t v28 = __sb__runningInSpringBoard();
  if (v28)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v304 = 0;
      LODWORD(v298) = 0;
      goto LABEL_410;
    }
  }
  else
  {
    v221 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v221 userInterfaceIdiom])
    {
      LODWORD(v298) = 0;
      int v304 = 1;
      goto LABEL_410;
    }
  }
  int v304 = v28 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v211 = [MEMORY[0x1E4F42D90] mainScreen];
      [v211 _referenceBounds];
    }
    LODWORD(v298) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v64 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_414;
    }
  }
  else
  {
    LODWORD(v298) = 0;
  }
LABEL_410:
  if (_SBF_Private_IsD94Like())
  {
    uint64_t v297 = 0;
    uint64_t v296 = 0;
    uint64_t v292 = 0;
    int v288 = 0;
    int v284 = 0;
    uint64_t v291 = 0;
    uint64_t v287 = 0;
    int v281 = 0;
    uint64_t v279 = 0;
    uint64_t v283 = 0;
    int v276 = 0;
    uint64_t v275 = 0;
    int v273 = 0;
    uint64_t v266 = 0;
    int v270 = 0;
    uint64_t v269 = 0;
    uint64_t v265 = 0;
    int v261 = 0;
    int v258 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    double v45 = 270.66666;
    goto LABEL_130;
  }
LABEL_414:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_418:
    uint64_t v297 = 0;
    goto LABEL_465;
  }
  int v65 = __sb__runningInSpringBoard();
  if (v65)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_418;
    }
  }
  else
  {
    v213 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v213 userInterfaceIdiom])
    {
      uint64_t v297 = 0x100000000;
      goto LABEL_465;
    }
  }
  HIDWORD(v297) = v65 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v195 = [MEMORY[0x1E4F42D90] mainScreen];
      [v195 _referenceBounds];
    }
    LODWORD(v297) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v82 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      uint64_t v296 = 0;
      uint64_t v292 = 0;
      int v288 = 0;
      int v284 = 0;
      uint64_t v291 = 0;
      uint64_t v287 = 0;
      int v281 = 0;
      uint64_t v279 = 0;
      uint64_t v283 = 0;
      int v276 = 0;
      uint64_t v275 = 0;
      int v273 = 0;
      uint64_t v266 = 0;
      int v270 = 0;
      uint64_t v269 = 0;
      uint64_t v265 = 0;
      int v261 = 0;
      int v258 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      double v45 = 309.0;
      goto LABEL_130;
    }
  }
  else
  {
    LODWORD(v297) = 0;
  }
LABEL_465:
  uint64_t v28 = __sb__runningInSpringBoard();
  if (v28)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v296) = 0;
      HIDWORD(v292) = 0;
      goto LABEL_475;
    }
  }
  else
  {
    v218 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v218 userInterfaceIdiom])
    {
      HIDWORD(v292) = 0;
      HIDWORD(v296) = 1;
      goto LABEL_475;
    }
  }
  HIDWORD(v296) = v28 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v204 = [MEMORY[0x1E4F42D90] mainScreen];
      [v204 _referenceBounds];
    }
    HIDWORD(v292) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v75 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_479;
    }
  }
  else
  {
    HIDWORD(v292) = 0;
  }
LABEL_475:
  if (_SBF_Private_IsD64Like())
  {
    LODWORD(v296) = 0;
    LODWORD(v292) = 0;
    int v288 = 0;
    int v284 = 0;
    uint64_t v291 = 0;
    uint64_t v287 = 0;
    int v281 = 0;
    uint64_t v279 = 0;
    uint64_t v283 = 0;
    int v276 = 0;
    uint64_t v275 = 0;
    int v273 = 0;
    uint64_t v266 = 0;
    int v270 = 0;
    uint64_t v269 = 0;
    uint64_t v265 = 0;
    int v261 = 0;
    int v258 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    double v45 = 270.66666;
    goto LABEL_130;
  }
LABEL_479:
  int v76 = __sb__runningInSpringBoard();
  if (v76)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v296) = 0;
      LODWORD(v292) = 0;
      goto LABEL_489;
    }
  }
  else
  {
    v216 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v216 userInterfaceIdiom])
    {
      LODWORD(v292) = 0;
      LODWORD(v296) = 1;
      goto LABEL_489;
    }
  }
  LODWORD(v296) = v76 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v77 = __sb__runningInSpringBoard();
    if (v77)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v197 = [MEMORY[0x1E4F42D90] mainScreen];
      [v197 _referenceBounds];
    }
    uint64_t v28 = v77 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v292) = v28;
    if (v80 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      int v288 = 0;
      int v284 = 0;
      uint64_t v291 = 0;
      uint64_t v287 = 0;
      int v281 = 0;
      uint64_t v279 = 0;
      uint64_t v283 = 0;
      int v276 = 0;
      uint64_t v275 = 0;
      int v273 = 0;
      uint64_t v266 = 0;
      int v270 = 0;
      uint64_t v269 = 0;
      uint64_t v265 = 0;
      int v261 = 0;
      int v258 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      double v45 = 309.0;
      goto LABEL_130;
    }
  }
  else
  {
    LODWORD(v292) = 0;
  }
LABEL_489:
  uint64_t v28 = __sb__runningInSpringBoard();
  if (v28)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v288 = 0;
      int v284 = 0;
      goto LABEL_505;
    }
  }
  else
  {
    v209 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v209 userInterfaceIdiom])
    {
      int v284 = 0;
      int v288 = 1;
      goto LABEL_505;
    }
  }
  int v288 = v28 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v193 = [MEMORY[0x1E4F42D90] mainScreen];
      [v193 _referenceBounds];
    }
    int v284 = v28 ^ 1;
    BSSizeRoundForScale();
    if (v85 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_529;
    }
  }
  else
  {
    int v284 = 0;
  }
LABEL_505:
  if (_SBF_Private_IsD54())
  {
    uint64_t v291 = 0;
    uint64_t v287 = 0;
    int v281 = 0;
    uint64_t v279 = 0;
    uint64_t v283 = 0;
    int v276 = 0;
    uint64_t v275 = 0;
    int v273 = 0;
    uint64_t v266 = 0;
    int v270 = 0;
    uint64_t v269 = 0;
    uint64_t v265 = 0;
    int v261 = 0;
    int v258 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    double v45 = 270.66666;
    goto LABEL_130;
  }
LABEL_529:
  int v86 = __sb__runningInSpringBoard();
  if (v86)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v87 = 0;
      LODWORD(v291) = 0;
      goto LABEL_549;
    }
  }
  else
  {
    v207 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v207 userInterfaceIdiom])
    {
      LODWORD(v291) = 0;
      uint64_t v87 = 1;
      goto LABEL_549;
    }
  }
  uint64_t v87 = v86 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v90 = __sb__runningInSpringBoard();
    if (v90)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v188 = [MEMORY[0x1E4F42D90] mainScreen];
      [v188 _referenceBounds];
    }
    uint64_t v28 = v90 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v291) = v28;
    if (v93 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      HIDWORD(v291) = v87;
      uint64_t v287 = 0;
      int v281 = 0;
      uint64_t v279 = 0;
      uint64_t v283 = 0;
      int v276 = 0;
      uint64_t v275 = 0;
      int v273 = 0;
      uint64_t v266 = 0;
      int v270 = 0;
      uint64_t v269 = 0;
      uint64_t v265 = 0;
      int v261 = 0;
      int v258 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      double v45 = 0.0;
      goto LABEL_130;
    }
  }
  else
  {
    LODWORD(v291) = 0;
  }
LABEL_549:
  uint64_t v28 = __sb__runningInSpringBoard();
  HIDWORD(v291) = v87;
  if (v28)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v287 = 0;
      goto LABEL_566;
    }
  }
  else
  {
    v202 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v202 userInterfaceIdiom])
    {
      uint64_t v287 = 0x100000000;
      goto LABEL_566;
    }
  }
  HIDWORD(v287) = v28 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v186 = [MEMORY[0x1E4F42D90] mainScreen];
      [v186 _referenceBounds];
    }
    LODWORD(v287) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v96 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_588;
    }
  }
  else
  {
    LODWORD(v287) = 0;
  }
LABEL_566:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    int v281 = 0;
    uint64_t v279 = 0;
    uint64_t v283 = 0;
    int v276 = 0;
    uint64_t v275 = 0;
    int v273 = 0;
    uint64_t v266 = 0;
    int v270 = 0;
    uint64_t v269 = 0;
    uint64_t v265 = 0;
    int v261 = 0;
    int v258 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    double v45 = 0.0;
    goto LABEL_130;
  }
LABEL_588:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_592:
    int v281 = 0;
    HIDWORD(v279) = 0;
    goto LABEL_624;
  }
  int v97 = __sb__runningInSpringBoard();
  if (v97)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_592;
    }
  }
  else
  {
    v192 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v192 userInterfaceIdiom])
    {
      HIDWORD(v279) = 0;
      int v281 = 1;
      goto LABEL_624;
    }
  }
  int v281 = v97 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v103 = __sb__runningInSpringBoard();
    if (v103)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v87 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v87 _referenceBounds];
    }
    v183 = (void *)v87;
    uint64_t v28 = v103 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v279) = v28;
    if (v109 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      uint64_t v283 = 0;
      int v276 = 0;
      uint64_t v275 = 0;
      LODWORD(v279) = 0;
      int v273 = 0;
      uint64_t v266 = 0;
      int v270 = 0;
      uint64_t v269 = 0;
      uint64_t v265 = 0;
      int v261 = 0;
      int v258 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      double v45 = 309.0;
      goto LABEL_130;
    }
  }
  else
  {
    HIDWORD(v279) = 0;
  }
LABEL_624:
  int v104 = __sb__runningInSpringBoard();
  if (v104)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v283) = 0;
      uint64_t v28 = 0;
      goto LABEL_634;
    }
  }
  else
  {
    v200 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v200 userInterfaceIdiom])
    {
      uint64_t v28 = 0;
      HIDWORD(v283) = 1;
      goto LABEL_634;
    }
  }
  HIDWORD(v283) = v104 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v105 = __sb__runningInSpringBoard();
    if (v105)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v179 = [MEMORY[0x1E4F42D90] mainScreen];
      [v179 _referenceBounds];
    }
    uint64_t v28 = v105 ^ 1u;
    BSSizeRoundForScale();
    if (v106 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_638;
    }
  }
  else
  {
    uint64_t v28 = 0;
  }
LABEL_634:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v283) = v28;
    int v276 = 0;
    uint64_t v275 = 0;
    LODWORD(v279) = 0;
    int v273 = 0;
    uint64_t v266 = 0;
    int v270 = 0;
    uint64_t v269 = 0;
    uint64_t v265 = 0;
    int v261 = 0;
    int v258 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    double v45 = 253.5;
    goto LABEL_130;
  }
LABEL_638:
  LODWORD(v283) = v28;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_642:
    int v276 = 0;
    HIDWORD(v275) = 0;
    goto LABEL_689;
  }
  int v107 = __sb__runningInSpringBoard();
  if (v107)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_642;
    }
  }
  else
  {
    v181 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v181 userInterfaceIdiom])
    {
      HIDWORD(v275) = 0;
      int v276 = 1;
      goto LABEL_689;
    }
  }
  int v276 = v107 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v166 = [MEMORY[0x1E4F42D90] mainScreen];
      [v166 _referenceBounds];
    }
    HIDWORD(v275) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v124 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v279) = 0;
      LODWORD(v275) = 0;
      int v273 = 0;
      uint64_t v266 = 0;
      int v270 = 0;
      uint64_t v269 = 0;
      uint64_t v265 = 0;
      int v261 = 0;
      int v258 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      double v45 = 309.0;
      goto LABEL_130;
    }
  }
  else
  {
    HIDWORD(v275) = 0;
  }
LABEL_689:
  uint64_t v28 = __sb__runningInSpringBoard();
  if (v28)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v279) = 0;
      LODWORD(v275) = 0;
      goto LABEL_699;
    }
  }
  else
  {
    v190 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v190 userInterfaceIdiom])
    {
      LODWORD(v275) = 0;
      LODWORD(v279) = 1;
      goto LABEL_699;
    }
  }
  LODWORD(v279) = v28 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v172 = [MEMORY[0x1E4F42D90] mainScreen];
      [v172 _referenceBounds];
    }
    LODWORD(v275) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v117 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_703;
    }
  }
  else
  {
    LODWORD(v275) = 0;
  }
LABEL_699:
  if (_SBF_Private_IsD63Like())
  {
    int v273 = 0;
    uint64_t v266 = 0;
    int v270 = 0;
    uint64_t v269 = 0;
    uint64_t v265 = 0;
    int v261 = 0;
    int v258 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    double v45 = 253.5;
    goto LABEL_130;
  }
LABEL_703:
  int v118 = __sb__runningInSpringBoard();
  if (v118)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v273 = 0;
      HIDWORD(v266) = 0;
      goto LABEL_713;
    }
  }
  else
  {
    v184 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v184 userInterfaceIdiom])
    {
      HIDWORD(v266) = 0;
      int v273 = 1;
      goto LABEL_713;
    }
  }
  int v273 = v118 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v119 = __sb__runningInSpringBoard();
    if (v119)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v168 = [MEMORY[0x1E4F42D90] mainScreen];
      [v168 _referenceBounds];
    }
    uint64_t v28 = v119 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v266) = v28;
    if (v122 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      int v270 = 0;
      uint64_t v269 = 0;
      LODWORD(v266) = 0;
      uint64_t v265 = 0;
      int v261 = 0;
      int v258 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      double v45 = 0.0;
      goto LABEL_130;
    }
  }
  else
  {
    HIDWORD(v266) = 0;
  }
LABEL_713:
  uint64_t v28 = __sb__runningInSpringBoard();
  if (v28)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v270 = 0;
      HIDWORD(v269) = 0;
      goto LABEL_729;
    }
  }
  else
  {
    v177 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v177 userInterfaceIdiom])
    {
      HIDWORD(v269) = 0;
      int v270 = 1;
      goto LABEL_729;
    }
  }
  int v270 = v28 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v164 = [MEMORY[0x1E4F42D90] mainScreen];
      [v164 _referenceBounds];
    }
    HIDWORD(v269) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v127 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_753;
    }
  }
  else
  {
    HIDWORD(v269) = 0;
  }
LABEL_729:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    LODWORD(v269) = 0;
    LODWORD(v266) = 0;
    uint64_t v265 = 0;
    int v261 = 0;
    int v258 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    double v45 = 0.0;
    goto LABEL_130;
  }
LABEL_753:
  int v128 = __sb__runningInSpringBoard();
  if (v128)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v269) = 0;
      LODWORD(v266) = 0;
      goto LABEL_773;
    }
  }
  else
  {
    v175 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v175 userInterfaceIdiom])
    {
      LODWORD(v266) = 0;
      LODWORD(v269) = 1;
      goto LABEL_773;
    }
  }
  LODWORD(v269) = v128 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v162 = [MEMORY[0x1E4F42D90] mainScreen];
      [v162 _referenceBounds];
    }
    LODWORD(v266) = v28 ^ 1;
    BSSizeRoundForScale();
    if (v133 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      uint64_t v265 = 0;
      int v261 = 0;
      int v258 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      double v45 = 309.0;
      goto LABEL_130;
    }
  }
  else
  {
    LODWORD(v266) = 0;
  }
LABEL_773:
  uint64_t v28 = __sb__runningInSpringBoard();
  if (v28)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v265 = 0;
      goto LABEL_789;
    }
  }
  else
  {
    v170 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v170 userInterfaceIdiom])
    {
      uint64_t v265 = 0x100000000;
      goto LABEL_789;
    }
  }
  HIDWORD(v265) = v28 ^ 1;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    LODWORD(v265) = 0;
    goto LABEL_789;
  }
  uint64_t v28 = __sb__runningInSpringBoard();
  if (v28)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v160 = [MEMORY[0x1E4F42D90] mainScreen];
    [v160 _referenceBounds];
  }
  LODWORD(v265) = v28 ^ 1;
  BSSizeRoundForScale();
  if (v135 < *(double *)(MEMORY[0x1E4FA6E50] + 104))
  {
LABEL_789:
    if (_SBF_Private_IsD53())
    {
      int v261 = 0;
      int v258 = 0;
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      double v45 = 253.5;
      goto LABEL_130;
    }
  }
  uint64_t v28 = (uint64_t)&qword_1D8506000;
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice()) {
    goto LABEL_814;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16()) {
    goto LABEL_816;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
LABEL_814:
    int v261 = 0;
    int v258 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    double v45 = 309.0;
    goto LABEL_130;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
LABEL_816:
    int v261 = 0;
    int v258 = 0;
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    double v45 = 263.66666;
    goto LABEL_130;
  }
  uint64_t v28 = __sb__runningInSpringBoard();
  if (v28)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v261 = 0;
      int v258 = 0;
      goto LABEL_843;
    }
  }
  else
  {
    v159 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v159 userInterfaceIdiom])
    {
      int v258 = 0;
      int v261 = 1;
      goto LABEL_843;
    }
  }
  int v261 = v28 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v157 = [MEMORY[0x1E4F42D90] mainScreen];
      [v157 _referenceBounds];
    }
    int v258 = v28 ^ 1;
    BSSizeRoundForScale();
    if (v145 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v40 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      double v45 = 0.0;
      goto LABEL_130;
    }
  }
  else
  {
    int v258 = 0;
  }
LABEL_843:
  int v139 = __sb__runningInSpringBoard();
  if (v139)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v40 = 0;
      int v41 = 0;
      goto LABEL_863;
    }
  }
  else
  {
    v158 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v158 userInterfaceIdiom])
    {
      int v41 = 0;
      int v40 = 1;
      goto LABEL_863;
    }
  }
  int v40 = v139 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v142 = __sb__runningInSpringBoard();
    if (v142)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v156 = [MEMORY[0x1E4F42D90] mainScreen];
      [v156 _referenceBounds];
    }
    int v41 = v142 ^ 1;
    BSSizeRoundForScale();
    if (v153 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      double v45 = 0.0;
      goto LABEL_130;
    }
  }
  else
  {
    int v41 = 0;
  }
LABEL_863:
  int v143 = __sb__runningInSpringBoard();
  if (!v143)
  {
    uint64_t v28 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v28 userInterfaceIdiom])
    {
      int v43 = 0;
      int v42 = 1;
      goto LABEL_889;
    }
LABEL_885:
    int v42 = v143 ^ 1;
    int v149 = __sb__runningInSpringBoard();
    if (v149)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v26 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v26 _referenceBounds];
    }
    int v43 = v149 ^ 1;
    BSSizeRoundForScale();
    if (v150 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
      goto LABEL_892;
    }
    goto LABEL_889;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_885;
  }
  int v42 = 0;
  int v43 = 0;
LABEL_889:
  uint64_t v151 = __sb__runningInSpringBoard();
  if (v151)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_892:
      int v44 = 0;
      double v45 = 0.0;
      goto LABEL_130;
    }
  }
  else
  {
    v4 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v4 userInterfaceIdiom])
    {
      double v45 = 0.0;
      int v44 = 1;
      goto LABEL_130;
    }
  }
  int v44 = v151 ^ 1;
  int v154 = __sb__runningInSpringBoard();
  if (v154)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v151 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v151 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v45 = 0.0;
  if (v154 != 1) {

  }
LABEL_130:
  if (v44) {

  }
  if (v43) {
  if (v42)
  }

  if (v41) {
  if (v40)
  }

  if (v258) {
  if (v261)
  }

  if (v265) {
  if (HIDWORD(v265))
  }

  if (v266) {
  if (v269)
  }

  if (HIDWORD(v269)) {
  if (v270)
  }

  if (HIDWORD(v266)) {
  if (v273)
  }

  if (v275) {
  if (v279)
  }

  if (HIDWORD(v275)) {
  if (v276)
  }

  if (v283) {
  if (HIDWORD(v283))
  }

  if (HIDWORD(v279)) {
  if (v281)
  }

  if (v287) {
  if (HIDWORD(v287))
  }

  if (v291) {
  if (HIDWORD(v291))
  }

  if (v284) {
  if (v288)
  }

  if (v292) {
  if (v296)
  }

  if (HIDWORD(v292)) {
  if (HIDWORD(v296))
  }

  if (v297) {
  if (HIDWORD(v297))
  }

  if (v298) {
  if (v304)
  }

  if (v302) {
  if (HIDWORD(v298))
  }

  if (v306) {
  if (v308)
  }

  if (HIDWORD(v308)) {
  if (v315)
  }

  if (HIDWORD(v315)) {
  if (v310)
  }

  if (HIDWORD(v310)) {
  if (v311)
  }

  if (HIDWORD(v311)) {
  if (v312)
  }

  if (HIDWORD(v312)) {
  if (v319)
  }

  if (v320) {
  if (v262)
  }

  if (v263) {
  if (v259)
  }

  if (v260) {
  if (HIDWORD(v263))
  }

  if (v264) {
  if (HIDWORD(v260))
  }

  if (HIDWORD(v264)) {
  if (v267)
  }

  if (HIDWORD(v267)) {
  if (v268)
  }

  if (v271) {
  if (v272)
  }

  if (HIDWORD(v272)) {
  if (HIDWORD(v268))
  }

  if (v274) {
  if (v277)
  }

  if (v280) {
  if (v278)
  }

  if (HIDWORD(v278)) {
  if (v285)
  }

  if (v286) {
  if (HIDWORD(v280))
  }

  if (v282) {
  if (v289)
  }

  if (v290) {
  if (v293)
  }

  if (HIDWORD(v293)) {
  if (HIDWORD(v286))
  }

  if (HIDWORD(v290)) {
  if (v294)
  }

  if (v299) {
  if (v295)
  }

  if (v300) {
  if (DWORD1(v300))
  }

  if (DWORD2(v300)) {
  if (HIDWORD(v300))
  }

  if (v305) {
  if (v303)
  }

  if (v301) {
  if (v307)
  }

  if (v309) {
  if (HIDWORD(v309))
  }

  if (v316) {
  if (HIDWORD(v316))
  }

  if (v313) {
  if (HIDWORD(v313))
  }

  if (v317) {
  if (v314)
  }

  if (HIDWORD(v305)) {
  if (HIDWORD(v307))
  }

  if (v318) {
  if (v321)
  }

  return v15 / v45;
}

- (CSMagSafeRingConfiguration)initWithRingDiameter:(SBFScreenSpecificCGFloatValue *)a3 lineWidth:(SBFScreenSpecificCGFloatValue *)a4 splashRingDiamter:(SBFScreenSpecificCGFloatValue *)a5
{
  uint64_t v309 = a4;
  unint64_t v310 = a5;
  v312.receiver = self;
  v312.super_class = (Class)CSMagSafeRingConfiguration;
  int v6 = [(CSMagSafeRingConfiguration *)&v312 init];

  unint64_t v311 = v6;
  if (!v6) {
    goto LABEL_506;
  }
  int v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v8 = 0;
      int v9 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    int v273 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v273 userInterfaceIdiom] != 1)
    {
      int v8 = 0;
      int v9 = 1;
      goto LABEL_11;
    }
  }
  int v9 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v10 = __sb__runningInSpringBoard();
    if (v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v264 = [MEMORY[0x1E4F42D90] mainScreen];
      [v264 _referenceBounds];
    }
    int v8 = v10 ^ 1;
    BSSizeRoundForScale();
    if (v33 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v32 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      HIDWORD(v307[13]) = v10 ^ 1;
      int v308 = v9;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      int v29 = 0;
      uint64_t v276 = 0;
      uint64_t v279 = 0;
      int v275 = 0;
      uint64_t v282 = 0;
      uint64_t v285 = 0;
      uint64_t v288 = 0;
      int v295 = 0;
      int v304 = 0;
      int v298 = 0;
      int v292 = 0;
      int v301 = 0;
      memset(v307, 0, 108);
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 208);
      goto LABEL_68;
    }
  }
  else
  {
    int v8 = 0;
  }
LABEL_11:
  int v11 = __sb__runningInSpringBoard();
  HIDWORD(v307[13]) = v8;
  int v308 = v9;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v12 = 0;
      int v13 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v272 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v272 userInterfaceIdiom] != 1)
    {
      int v12 = 0;
      int v13 = 1;
      goto LABEL_20;
    }
  }
  int v13 = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v10 = __sb__runningInSpringBoard();
    if (v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v263 = [MEMORY[0x1E4F42D90] mainScreen];
      [v263 _referenceBounds];
    }
    int v12 = v10 ^ 1;
    BSSizeRoundForScale();
    if (v35 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      HIDWORD(v307[12]) = v10 ^ 1;
      LODWORD(v307[13]) = v13;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      int v29 = 0;
      uint64_t v276 = 0;
      uint64_t v279 = 0;
      int v275 = 0;
      uint64_t v282 = 0;
      uint64_t v285 = 0;
      uint64_t v288 = 0;
      int v295 = 0;
      int v304 = 0;
      int v298 = 0;
      int v292 = 0;
      int v301 = 0;
      memset(v307, 0, 100);
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 248);
      goto LABEL_68;
    }
  }
  else
  {
    int v12 = 0;
  }
LABEL_20:
  int v14 = __sb__runningInSpringBoard();
  HIDWORD(v307[12]) = v12;
  LODWORD(v307[13]) = v13;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v15 = 0;
      int v16 = 0;
      goto LABEL_29;
    }
  }
  else
  {
    int v271 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v271 userInterfaceIdiom] != 1)
    {
      int v15 = 0;
      int v16 = 1;
      goto LABEL_29;
    }
  }
  int v16 = v14 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v10 = __sb__runningInSpringBoard();
    if (v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v262 = [MEMORY[0x1E4F42D90] mainScreen];
      [v262 _referenceBounds];
    }
    int v15 = v10 ^ 1;
    BSSizeRoundForScale();
    if (v36 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      HIDWORD(v307[11]) = v10 ^ 1;
      LODWORD(v307[12]) = v16;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      int v29 = 0;
      uint64_t v276 = 0;
      uint64_t v279 = 0;
      int v275 = 0;
      uint64_t v282 = 0;
      uint64_t v285 = 0;
      uint64_t v288 = 0;
      int v295 = 0;
      int v304 = 0;
      int v298 = 0;
      int v292 = 0;
      int v301 = 0;
      memset(v307, 0, 92);
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 232);
      goto LABEL_68;
    }
  }
  else
  {
    int v15 = 0;
  }
LABEL_29:
  int v17 = __sb__runningInSpringBoard();
  HIDWORD(v307[11]) = v15;
  LODWORD(v307[12]) = v16;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v307[10]) = 0;
      int v18 = 0;
      goto LABEL_38;
    }
  }
  else
  {
    int v270 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v270 userInterfaceIdiom] != 1)
    {
      HIDWORD(v307[10]) = 0;
      int v18 = 1;
      goto LABEL_38;
    }
  }
  int v18 = v17 ^ 1;
  uint64_t v10 = __sb__runningInSpringBoard();
  if (v10)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v267 = [MEMORY[0x1E4F42D90] mainScreen];
    [v267 _referenceBounds];
  }
  HIDWORD(v307[10]) = v10 ^ 1;
  BSSizeRoundForScale();
  if (v20 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    LODWORD(v307[11]) = v18;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    int v29 = 0;
    uint64_t v276 = 0;
    uint64_t v279 = 0;
    int v275 = 0;
    uint64_t v282 = 0;
    uint64_t v285 = 0;
    uint64_t v288 = 0;
    int v295 = 0;
    int v304 = 0;
    int v298 = 0;
    int v292 = 0;
    int v301 = 0;
    memset(v307, 0, 84);
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 240);
    goto LABEL_68;
  }
LABEL_38:
  int v21 = __sb__runningInSpringBoard();
  LODWORD(v307[11]) = v18;
  if (v21)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)((char *)&v307[9] + 4) = 0;
      goto LABEL_48;
    }
  }
  else
  {
    uint64_t v269 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v269 userInterfaceIdiom] != 1)
    {
      *(void *)((char *)&v307[9] + 4) = 0x100000000;
      goto LABEL_48;
    }
  }
  LODWORD(v307[10]) = v21 ^ 1;
  uint64_t v10 = __sb__runningInSpringBoard();
  if (v10)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v265 = [MEMORY[0x1E4F42D90] mainScreen];
    [v265 _referenceBounds];
  }
  HIDWORD(v307[9]) = v10 ^ 1;
  BSSizeRoundForScale();
  if (v30 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    int v29 = 0;
    uint64_t v276 = 0;
    uint64_t v279 = 0;
    int v275 = 0;
    uint64_t v282 = 0;
    uint64_t v285 = 0;
    uint64_t v288 = 0;
    int v295 = 0;
    int v304 = 0;
    int v298 = 0;
    int v292 = 0;
    int v301 = 0;
    memset(v307, 0, 76);
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 224);
    goto LABEL_68;
  }
LABEL_48:
  int v31 = __sb__runningInSpringBoard();
  if (v31)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)((char *)&v307[8] + 4) = 0;
      goto LABEL_519;
    }
  }
  else
  {
    uint64_t v268 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v268 userInterfaceIdiom] != 1)
    {
      HIDWORD(v307[8]) = 0;
      LODWORD(v307[9]) = 1;
      goto LABEL_519;
    }
  }
  LODWORD(v307[9]) = v31 ^ 1;
  uint64_t v10 = __sb__runningInSpringBoard();
  if (v10)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    int v261 = [MEMORY[0x1E4F42D90] mainScreen];
    [v261 _referenceBounds];
  }
  HIDWORD(v307[8]) = v10 ^ 1;
  BSSizeRoundForScale();
  if (v99 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    int v29 = 0;
    uint64_t v276 = 0;
    uint64_t v279 = 0;
    int v275 = 0;
    uint64_t v282 = 0;
    uint64_t v285 = 0;
    uint64_t v288 = 0;
    int v295 = 0;
    int v304 = 0;
    int v298 = 0;
    int v292 = 0;
    int v301 = 0;
    memset(v307, 0, 68);
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 216);
    goto LABEL_68;
  }
LABEL_519:
  uint64_t v10 = __sb__runningInSpringBoard();
  if (v10)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_521;
    }
LABEL_527:
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    int v29 = 0;
    uint64_t v276 = 0;
    uint64_t v279 = 0;
    int v275 = 0;
    uint64_t v282 = 0;
    uint64_t v285 = 0;
    uint64_t v288 = 0;
    int v295 = 0;
    int v304 = 0;
    int v298 = 0;
    int v292 = 0;
    int v301 = 0;
    memset(v307, 0, 64);
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 200);
    LODWORD(v307[8]) = v10 ^ 1;
    goto LABEL_68;
  }
  uint64_t v266 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v266 userInterfaceIdiom] == 1) {
    goto LABEL_527;
  }
LABEL_521:
  LODWORD(v307[8]) = v10 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_525:
    *(void *)((char *)&v307[6] + 4) = 0;
    goto LABEL_565;
  }
  int v100 = __sb__runningInSpringBoard();
  if (v100)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_525;
    }
  }
  else
  {
    int v259 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v259 userInterfaceIdiom])
    {
      *(void *)((char *)&v307[6] + 4) = 0x100000000;
      goto LABEL_565;
    }
  }
  LODWORD(v307[7]) = v100 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v10 = __sb__runningInSpringBoard();
    if (v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v252 = [MEMORY[0x1E4F42D90] mainScreen];
      [v252 _referenceBounds];
    }
    HIDWORD(v307[6]) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v111 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      int v29 = 0;
      uint64_t v276 = 0;
      uint64_t v279 = 0;
      int v275 = 0;
      uint64_t v282 = 0;
      uint64_t v285 = 0;
      uint64_t v288 = 0;
      int v295 = 0;
      int v304 = 0;
      int v298 = 0;
      int v292 = 0;
      int v301 = 0;
      memset(v307, 0, 52);
      HIDWORD(v307[7]) = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 168);
      goto LABEL_68;
    }
  }
  else
  {
    HIDWORD(v307[6]) = 0;
  }
LABEL_565:
  uint64_t v10 = __sb__runningInSpringBoard();
  if (v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v307[6]) = 0;
      HIDWORD(v307[7]) = 0;
      goto LABEL_575;
    }
  }
  else
  {
    uint64_t v260 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v260 userInterfaceIdiom])
    {
      LODWORD(v307[6]) = 0;
      HIDWORD(v307[7]) = 1;
      goto LABEL_575;
    }
  }
  HIDWORD(v307[7]) = v10 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v10 = __sb__runningInSpringBoard();
    if (v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v255 = [MEMORY[0x1E4F42D90] mainScreen];
      [v255 _referenceBounds];
    }
    LODWORD(v307[6]) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v105 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_579;
    }
  }
  else
  {
    LODWORD(v307[6]) = 0;
  }
LABEL_575:
  if (_SBF_Private_IsD94Like())
  {
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    int v29 = 0;
    uint64_t v276 = 0;
    uint64_t v279 = 0;
    int v275 = 0;
    uint64_t v282 = 0;
    uint64_t v285 = 0;
    uint64_t v288 = 0;
    int v295 = 0;
    int v304 = 0;
    int v298 = 0;
    int v292 = 0;
    int v301 = 0;
    memset(v307, 0, 48);
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 176);
    goto LABEL_68;
  }
LABEL_579:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_583:
    v307[5] = 0;
    goto LABEL_649;
  }
  int v106 = __sb__runningInSpringBoard();
  if (v106)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_583;
    }
  }
  else
  {
    v256 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v256 userInterfaceIdiom])
    {
      v307[5] = 0x100000000;
      goto LABEL_649;
    }
  }
  HIDWORD(v307[5]) = v106 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v10 = __sb__runningInSpringBoard();
    if (v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v247 = [MEMORY[0x1E4F42D90] mainScreen];
      [v247 _referenceBounds];
    }
    LODWORD(v307[5]) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v126 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      int v29 = 0;
      uint64_t v276 = 0;
      uint64_t v279 = 0;
      int v275 = 0;
      uint64_t v282 = 0;
      uint64_t v285 = 0;
      uint64_t v288 = 0;
      int v295 = 0;
      int v304 = 0;
      int v298 = 0;
      int v292 = 0;
      int v301 = 0;
      memset(v307, 0, 40);
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 184);
      goto LABEL_68;
    }
  }
  else
  {
    LODWORD(v307[5]) = 0;
  }
LABEL_649:
  uint64_t v10 = __sb__runningInSpringBoard();
  if (v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v307[3]) = 0;
      HIDWORD(v307[4]) = 0;
      goto LABEL_659;
    }
  }
  else
  {
    int v258 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v258 userInterfaceIdiom])
    {
      HIDWORD(v307[3]) = 0;
      HIDWORD(v307[4]) = 1;
      goto LABEL_659;
    }
  }
  HIDWORD(v307[4]) = v10 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v10 = __sb__runningInSpringBoard();
    if (v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v251 = [MEMORY[0x1E4F42D90] mainScreen];
      [v251 _referenceBounds];
    }
    HIDWORD(v307[3]) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v114 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_663;
    }
  }
  else
  {
    HIDWORD(v307[3]) = 0;
  }
LABEL_659:
  if (_SBF_Private_IsD64Like())
  {
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    int v29 = 0;
    uint64_t v276 = 0;
    uint64_t v279 = 0;
    int v275 = 0;
    uint64_t v282 = 0;
    uint64_t v285 = 0;
    uint64_t v288 = 0;
    int v295 = 0;
    int v304 = 0;
    int v298 = 0;
    int v292 = 0;
    int v301 = 0;
    memset(v307, 0, 28);
    LODWORD(v307[4]) = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 192);
    goto LABEL_68;
  }
LABEL_663:
  int v115 = __sb__runningInSpringBoard();
  if (v115)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v307[3]) = 0;
      LODWORD(v307[4]) = 0;
      goto LABEL_673;
    }
  }
  else
  {
    v257 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v257 userInterfaceIdiom])
    {
      LODWORD(v307[3]) = 0;
      LODWORD(v307[4]) = 1;
      goto LABEL_673;
    }
  }
  LODWORD(v307[4]) = v115 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v116 = __sb__runningInSpringBoard();
    if (v116)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v248 = [MEMORY[0x1E4F42D90] mainScreen];
      [v248 _referenceBounds];
    }
    uint64_t v10 = v116 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v307[3]) = v10;
    if (v123 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      int v29 = 0;
      uint64_t v276 = 0;
      uint64_t v279 = 0;
      int v275 = 0;
      uint64_t v282 = 0;
      uint64_t v285 = 0;
      uint64_t v288 = 0;
      int v295 = 0;
      int v304 = 0;
      int v298 = 0;
      int v292 = 0;
      int v301 = 0;
      memset(v307, 0, 24);
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 152);
      goto LABEL_68;
    }
  }
  else
  {
    LODWORD(v307[3]) = 0;
  }
LABEL_673:
  uint64_t v10 = __sb__runningInSpringBoard();
  if (v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v307[0]) = 0;
      HIDWORD(v307[1]) = 0;
      goto LABEL_751;
    }
  }
  else
  {
    v254 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v254 userInterfaceIdiom])
    {
      LODWORD(v307[0]) = 0;
      HIDWORD(v307[1]) = 1;
      goto LABEL_751;
    }
  }
  HIDWORD(v307[1]) = v10 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v10 = __sb__runningInSpringBoard();
    if (v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v246 = [MEMORY[0x1E4F42D90] mainScreen];
      [v246 _referenceBounds];
    }
    LODWORD(v307[0]) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v129 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_785;
    }
  }
  else
  {
    LODWORD(v307[0]) = 0;
  }
LABEL_751:
  if (_SBF_Private_IsD54())
  {
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    int v29 = 0;
    uint64_t v276 = 0;
    uint64_t v279 = 0;
    int v275 = 0;
    uint64_t v282 = 0;
    uint64_t v285 = 0;
    uint64_t v288 = 0;
    int v295 = 0;
    int v304 = 0;
    int v298 = 0;
    int v292 = 0;
    int v301 = 0;
    *(void *)((char *)v307 + 4) = 0;
    v307[2] = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 160);
    goto LABEL_68;
  }
LABEL_785:
  int v130 = __sb__runningInSpringBoard();
  if (v130)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v307[2] = 0;
      goto LABEL_811;
    }
  }
  else
  {
    v253 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v253 userInterfaceIdiom])
    {
      v307[2] = 0x100000000;
      goto LABEL_811;
    }
  }
  HIDWORD(v307[2]) = v130 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v135 = __sb__runningInSpringBoard();
    if (v135)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v243 = [MEMORY[0x1E4F42D90] mainScreen];
      [v243 _referenceBounds];
    }
    uint64_t v10 = v135 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v307[2]) = v10;
    if (v138 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && _SBF_Private_IsN84OrSimilarDevice())
    {
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      int v29 = 0;
      uint64_t v276 = 0;
      uint64_t v279 = 0;
      int v275 = 0;
      uint64_t v282 = 0;
      uint64_t v285 = 0;
      uint64_t v288 = 0;
      int v295 = 0;
      int v304 = 0;
      int v298 = 0;
      int v292 = 0;
      int v301 = 0;
      *(void *)((char *)v307 + 4) = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 104);
      goto LABEL_68;
    }
  }
  else
  {
    LODWORD(v307[2]) = 0;
  }
LABEL_811:
  uint64_t v10 = __sb__runningInSpringBoard();
  if (v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)((char *)v307 + 4) = 0;
      goto LABEL_841;
    }
  }
  else
  {
    v250 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v250 userInterfaceIdiom])
    {
      *(void *)((char *)v307 + 4) = 0x100000000;
      goto LABEL_841;
    }
  }
  LODWORD(v307[1]) = v10 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v10 = __sb__runningInSpringBoard();
    if (v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v242 = [MEMORY[0x1E4F42D90] mainScreen];
      [v242 _referenceBounds];
    }
    HIDWORD(v307[0]) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v141 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_872;
    }
  }
  else
  {
    HIDWORD(v307[0]) = 0;
  }
LABEL_841:
  if (_SBF_Private_IsD33OrSimilarDevice() && _SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    int v29 = 0;
    uint64_t v276 = 0;
    uint64_t v279 = 0;
    int v275 = 0;
    uint64_t v282 = 0;
    uint64_t v285 = 0;
    uint64_t v288 = 0;
    int v295 = 0;
    int v304 = 0;
    int v298 = 0;
    int v292 = 0;
    int v301 = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 112);
    goto LABEL_68;
  }
LABEL_872:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_876:
    int v292 = 0;
    int v301 = 0;
    goto LABEL_901;
  }
  int v142 = __sb__runningInSpringBoard();
  if (v142)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_876;
    }
  }
  else
  {
    v245 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v245 userInterfaceIdiom])
    {
      int v292 = 0;
      int v301 = 1;
      goto LABEL_901;
    }
  }
  int v301 = v142 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v147 = __sb__runningInSpringBoard();
    if (v147)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v236 = [MEMORY[0x1E4F42D90] mainScreen];
      [v236 _referenceBounds];
    }
    uint64_t v10 = v147 ^ 1u;
    BSSizeRoundForScale();
    int v292 = v10;
    if (v162 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      int v29 = 0;
      uint64_t v276 = 0;
      uint64_t v279 = 0;
      int v275 = 0;
      uint64_t v282 = 0;
      uint64_t v285 = 0;
      uint64_t v288 = 0;
      int v295 = 0;
      int v304 = 0;
      int v298 = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 88);
      goto LABEL_68;
    }
  }
  else
  {
    int v292 = 0;
  }
LABEL_901:
  int v148 = __sb__runningInSpringBoard();
  if (v148)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v10 = 0;
      int v298 = 0;
      goto LABEL_911;
    }
  }
  else
  {
    v249 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v249 userInterfaceIdiom])
    {
      uint64_t v10 = 0;
      int v298 = 1;
      goto LABEL_911;
    }
  }
  int v298 = v148 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v149 = __sb__runningInSpringBoard();
    if (v149)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v239 = [MEMORY[0x1E4F42D90] mainScreen];
      [v239 _referenceBounds];
    }
    uint64_t v10 = v149 ^ 1u;
    BSSizeRoundForScale();
    if (v150 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_915;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_911:
  if (_SBF_Private_IsD93Like())
  {
    int v304 = v10;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    int v29 = 0;
    uint64_t v276 = 0;
    uint64_t v279 = 0;
    int v275 = 0;
    uint64_t v282 = 0;
    uint64_t v285 = 0;
    uint64_t v288 = 0;
    int v295 = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 96);
    goto LABEL_68;
  }
LABEL_915:
  int v304 = v10;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_919:
    HIDWORD(v288) = 0;
    HIDWORD(v285) = 0;
    goto LABEL_985;
  }
  int v151 = __sb__runningInSpringBoard();
  if (v151)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_919;
    }
  }
  else
  {
    v240 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v240 userInterfaceIdiom])
    {
      HIDWORD(v288) = 0;
      HIDWORD(v285) = 1;
      goto LABEL_985;
    }
  }
  HIDWORD(v285) = v151 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v10 = __sb__runningInSpringBoard();
    if (v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v232 = [MEMORY[0x1E4F42D90] mainScreen];
      [v232 _referenceBounds];
    }
    HIDWORD(v288) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v177 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      int v29 = 0;
      uint64_t v276 = 0;
      uint64_t v279 = 0;
      int v275 = 0;
      uint64_t v282 = 0;
      LODWORD(v285) = 0;
      LODWORD(v288) = 0;
      int v295 = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 136);
      goto LABEL_68;
    }
  }
  else
  {
    HIDWORD(v288) = 0;
  }
LABEL_985:
  uint64_t v10 = __sb__runningInSpringBoard();
  if (v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v288) = 0;
      int v295 = 0;
      goto LABEL_995;
    }
  }
  else
  {
    v244 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v244 userInterfaceIdiom])
    {
      LODWORD(v288) = 0;
      int v295 = 1;
      goto LABEL_995;
    }
  }
  int v295 = v10 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v10 = __sb__runningInSpringBoard();
    if (v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v235 = [MEMORY[0x1E4F42D90] mainScreen];
      [v235 _referenceBounds];
    }
    LODWORD(v288) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v165 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_999;
    }
  }
  else
  {
    LODWORD(v288) = 0;
  }
LABEL_995:
  if (_SBF_Private_IsD63Like())
  {
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    int v29 = 0;
    uint64_t v276 = 0;
    uint64_t v279 = 0;
    int v275 = 0;
    uint64_t v282 = 0;
    LODWORD(v285) = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 144);
    goto LABEL_68;
  }
LABEL_999:
  int v166 = __sb__runningInSpringBoard();
  if (v166)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v276) = 0;
      LODWORD(v285) = 0;
      goto LABEL_1009;
    }
  }
  else
  {
    v241 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v241 userInterfaceIdiom])
    {
      HIDWORD(v276) = 0;
      LODWORD(v285) = 1;
      goto LABEL_1009;
    }
  }
  LODWORD(v285) = v166 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v167 = __sb__runningInSpringBoard();
    if (v167)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v233 = [MEMORY[0x1E4F42D90] mainScreen];
      [v233 _referenceBounds];
    }
    uint64_t v10 = v167 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v276) = v10;
    if (v174 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      int v29 = 0;
      uint64_t v279 = 0;
      uint64_t v282 = 0;
      int v275 = 0;
      LODWORD(v276) = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 120);
      goto LABEL_68;
    }
  }
  else
  {
    HIDWORD(v276) = 0;
  }
LABEL_1009:
  uint64_t v10 = __sb__runningInSpringBoard();
  if (v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v282 = 0;
      goto LABEL_1087;
    }
  }
  else
  {
    v238 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v238 userInterfaceIdiom])
    {
      uint64_t v282 = 0x100000000;
      goto LABEL_1087;
    }
  }
  HIDWORD(v282) = v10 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v10 = __sb__runningInSpringBoard();
    if (v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v231 = [MEMORY[0x1E4F42D90] mainScreen];
      [v231 _referenceBounds];
    }
    LODWORD(v282) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v180 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1121;
    }
  }
  else
  {
    LODWORD(v282) = 0;
  }
LABEL_1087:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    int v29 = 0;
    uint64_t v279 = 0;
    int v275 = 0;
    LODWORD(v276) = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 128);
    goto LABEL_68;
  }
LABEL_1121:
  int v181 = __sb__runningInSpringBoard();
  if (v181)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v276) = 0;
      HIDWORD(v279) = 0;
      goto LABEL_1147;
    }
  }
  else
  {
    v237 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v237 userInterfaceIdiom])
    {
      LODWORD(v276) = 0;
      HIDWORD(v279) = 1;
      goto LABEL_1147;
    }
  }
  HIDWORD(v279) = v181 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v10 = __sb__runningInSpringBoard();
    if (v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v230 = [MEMORY[0x1E4F42D90] mainScreen];
      [v230 _referenceBounds];
    }
    LODWORD(v276) = v10 ^ 1;
    BSSizeRoundForScale();
    if (v192 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      int v29 = 0;
      LODWORD(v279) = 0;
      int v275 = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 72);
      goto LABEL_68;
    }
  }
  else
  {
    LODWORD(v276) = 0;
  }
LABEL_1147:
  int v186 = __sb__runningInSpringBoard();
  if (v186)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v10 = 0;
      int v275 = 0;
      goto LABEL_1177;
    }
  }
  else
  {
    v234 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v234 userInterfaceIdiom])
    {
      uint64_t v10 = 0;
      int v275 = 1;
      goto LABEL_1177;
    }
  }
  int v275 = v186 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v189 = __sb__runningInSpringBoard();
    if (v189)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v229 = [MEMORY[0x1E4F42D90] mainScreen];
      [v229 _referenceBounds];
    }
    uint64_t v10 = v189 ^ 1u;
    BSSizeRoundForScale();
    if (v195 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1202;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_1177:
  if (_SBF_Private_IsD53())
  {
    LODWORD(v279) = v10;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    int v29 = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 80);
    goto LABEL_68;
  }
LABEL_1202:
  LODWORD(v279) = v10;
  if (_SBF_Private_IsD16() && _SBF_Private_IsD52OrSimilarDevice())
  {
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    int v29 = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 40);
    goto LABEL_68;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && _SBF_Private_IsD16())
  {
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    int v29 = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 48);
    goto LABEL_68;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    int v29 = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 24);
    goto LABEL_68;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    int v29 = 0;
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 32);
    goto LABEL_68;
  }
  int v198 = __sb__runningInSpringBoard();
  if (v198)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v28 = 0;
      int v29 = 0;
      goto LABEL_1258;
    }
  }
  else
  {
    v228 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v228 userInterfaceIdiom])
    {
      int v28 = 0;
      int v29 = 1;
      goto LABEL_1258;
    }
  }
  int v29 = v198 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v10 = __sb__runningInSpringBoard();
    if (v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v224 = [MEMORY[0x1E4F42D90] mainScreen];
      [v224 _referenceBounds];
    }
    int v28 = v10 ^ 1;
    BSSizeRoundForScale();
    if (v210 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 56);
      goto LABEL_68;
    }
  }
  else
  {
    int v28 = 0;
  }
LABEL_1258:
  uint64_t v10 = __sb__runningInSpringBoard();
  if (v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v26 = 0;
      int v27 = 0;
      goto LABEL_1288;
    }
  }
  else
  {
    v227 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v227 userInterfaceIdiom])
    {
      int v26 = 0;
      int v27 = 1;
      goto LABEL_1288;
    }
  }
  int v27 = v10 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v203 = __sb__runningInSpringBoard();
    if (v203)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v223 = [MEMORY[0x1E4F42D90] mainScreen];
      [v223 _referenceBounds];
    }
    int v26 = v203 ^ 1;
    BSSizeRoundForScale();
    if (v213 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 64);
      goto LABEL_68;
    }
  }
  else
  {
    int v26 = 0;
  }
LABEL_1288:
  int v204 = __sb__runningInSpringBoard();
  if (!v204)
  {
    v226 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v226 userInterfaceIdiom])
    {
      int v24 = 0;
      int v25 = 1;
      goto LABEL_1318;
    }
LABEL_1314:
    int v25 = v204 ^ 1;
    int v205 = __sb__runningInSpringBoard();
    if (v205)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v225 = [MEMORY[0x1E4F42D90] mainScreen];
      [v225 _referenceBounds];
    }
    int v24 = v205 ^ 1;
    BSSizeRoundForScale();
    if (v206 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
    {
      int v22 = 0;
      int v23 = 0;
      a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 16);
      goto LABEL_68;
    }
    goto LABEL_1318;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_1314;
  }
  int v24 = 0;
  int v25 = 0;
LABEL_1318:
  int v207 = __sb__runningInSpringBoard();
  if (v207)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v22 = 0;
      int v23 = 0;
      goto LABEL_68;
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v10 userInterfaceIdiom])
    {
      int v22 = 0;
      int v23 = 1;
      goto LABEL_68;
    }
  }
  int v23 = v207 ^ 1;
  int v216 = __sb__runningInSpringBoard();
  if (v216)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v222 = [MEMORY[0x1E4F42D90] mainScreen];
    [v222 _referenceBounds];
  }
  int v22 = v216 ^ 1;
  BSSizeRoundForScale();
  if (v217 >= *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    a3 = (SBFScreenSpecificCGFloatValue *)((char *)a3 + 8);
  }
  int v19 = v222;
LABEL_68:
  v311->_ringDiameter = a3->var0;
  if (v22) {

  }
  if (v23) {
  if (v24)
  }

  if (v25) {
  uint64_t v37 = LODWORD(v307[11]);
  }
  if (v26) {

  }
  if (v27) {
  if (v28)
  }

  if (v29) {
  if (v279)
  }

  if (v275) {
  if (v276)
  }

  if (HIDWORD(v279)) {
  if (v282)
  }

  if (HIDWORD(v282)) {
  if (HIDWORD(v276))
  }

  if (v285) {
  if (v288)
  }

  if (v295) {
  if (HIDWORD(v288))
  }

  if (HIDWORD(v285)) {
  if (v304)
  }

  if (v298) {
  if (v292)
  }

  if (v301) {
  if (HIDWORD(v307[0]))
  }

  if (LODWORD(v307[1])) {
  if (LODWORD(v307[2]))
  }

  if (HIDWORD(v307[2])) {
  if (LODWORD(v307[0]))
  }

  if (HIDWORD(v307[1])) {
  if (LODWORD(v307[3]))
  }

  if (LODWORD(v307[4])) {
  if (HIDWORD(v307[3]))
  }

  if (HIDWORD(v307[4])) {
  if (LODWORD(v307[5]))
  }

  if (HIDWORD(v307[5])) {
  if (LODWORD(v307[6]))
  }

  if (HIDWORD(v307[7])) {
  if (HIDWORD(v307[6]))
  }

  if (LODWORD(v307[7])) {
  if (LODWORD(v307[8]))
  }

  if (HIDWORD(v307[8])) {
  if (LODWORD(v307[9]))
  }

  if (HIDWORD(v307[9])) {
  if (LODWORD(v307[10]))
  }

  if (HIDWORD(v307[10]))
  {

    if (!LODWORD(v307[11])) {
      goto LABEL_160;
    }
  }
  else if (!LODWORD(v307[11]))
  {
LABEL_160:
    if (HIDWORD(v307[11])) {
      goto LABEL_161;
    }
    goto LABEL_169;
  }

  if (HIDWORD(v307[11]))
  {
LABEL_161:

    if (!LODWORD(v307[12])) {
      goto LABEL_162;
    }
    goto LABEL_170;
  }
LABEL_169:
  if (!LODWORD(v307[12]))
  {
LABEL_162:
    if (HIDWORD(v307[12])) {
      goto LABEL_163;
    }
    goto LABEL_171;
  }
LABEL_170:

  if (HIDWORD(v307[12]))
  {
LABEL_163:

    if (!LODWORD(v307[13])) {
      goto LABEL_164;
    }
    goto LABEL_172;
  }
LABEL_171:
  if (!LODWORD(v307[13]))
  {
LABEL_164:
    if (HIDWORD(v307[13])) {
      goto LABEL_165;
    }
LABEL_173:
    if (!v308) {
      goto LABEL_175;
    }
    goto LABEL_174;
  }
LABEL_172:

  if (!HIDWORD(v307[13])) {
    goto LABEL_173;
  }
LABEL_165:

  if (v308) {
LABEL_174:
  }

LABEL_175:
  int v38 = __sb__runningInSpringBoard();
  if (v38)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v39 = 0;
      int v40 = 0;
      goto LABEL_184;
    }
  }
  else
  {
    int v273 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v273 userInterfaceIdiom] != 1)
    {
      int v40 = 0;
      int v39 = 1;
      goto LABEL_184;
    }
  }
  int v39 = v38 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v264 = [MEMORY[0x1E4F42D90] mainScreen];
      [v264 _referenceBounds];
    }
    int v40 = v41 ^ 1;
    BSSizeRoundForScale();
    if (v64 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v63 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      HIDWORD(v307[13]) = v41 ^ 1;
      int v308 = v39;
      memset(v307, 0, 108);
      int v302 = 0;
      int v293 = 0;
      int v299 = 0;
      int v305 = 0;
      uint64_t v286 = 0;
      uint64_t v289 = 0;
      int v296 = 0;
      uint64_t v277 = 0;
      uint64_t v280 = 0;
      uint64_t v283 = 0;
      LODWORD(v274) = 0;
      int v52 = 0;
      int v53 = 0;
      int v54 = 0;
      int v55 = 0;
      int v56 = 0;
      int v57 = 0;
      int v58 = 0;
      int v59 = 0;
      p_var26 = &v309->var26;
      goto LABEL_238;
    }
  }
  else
  {
    int v40 = 0;
  }
LABEL_184:
  int v42 = __sb__runningInSpringBoard();
  HIDWORD(v307[13]) = v40;
  int v308 = v39;
  if (v42)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v43 = 0;
      unsigned int v44 = 0;
      goto LABEL_193;
    }
  }
  else
  {
    uint64_t v272 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v272 userInterfaceIdiom] != 1)
    {
      unsigned int v44 = 0;
      int v43 = 1;
      goto LABEL_193;
    }
  }
  int v43 = v42 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v263 = [MEMORY[0x1E4F42D90] mainScreen];
      [v263 _referenceBounds];
    }
    unsigned int v44 = v41 ^ 1;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      HIDWORD(v307[12]) = v41 ^ 1;
      LODWORD(v307[13]) = v43;
      memset(v307, 0, 100);
      int v302 = 0;
      int v293 = 0;
      int v299 = 0;
      int v305 = 0;
      uint64_t v286 = 0;
      uint64_t v289 = 0;
      int v296 = 0;
      uint64_t v277 = 0;
      uint64_t v280 = 0;
      uint64_t v283 = 0;
      LODWORD(v274) = 0;
      int v52 = 0;
      int v53 = 0;
      int v54 = 0;
      int v55 = 0;
      int v56 = 0;
      int v57 = 0;
      int v58 = 0;
      int v59 = 0;
      p_var26 = &v309->var31;
      goto LABEL_238;
    }
  }
  else
  {
    unsigned int v44 = 0;
  }
LABEL_193:
  int v45 = __sb__runningInSpringBoard();
  *(void *)((char *)&v307[12] + 4) = __PAIR64__(v43, v44);
  if (v45)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v46 = 0;
      unsigned int v47 = 0;
      goto LABEL_202;
    }
  }
  else
  {
    int v271 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v271 userInterfaceIdiom] != 1)
    {
      unsigned int v47 = 0;
      int v46 = 1;
      goto LABEL_202;
    }
  }
  int v46 = v45 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      int v262 = [MEMORY[0x1E4F42D90] mainScreen];
      [v262 _referenceBounds];
    }
    unsigned int v47 = v41 ^ 1;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      HIDWORD(v307[11]) = v41 ^ 1;
      LODWORD(v307[12]) = v46;
      memset(v307, 0, 92);
      int v302 = 0;
      int v293 = 0;
      int v299 = 0;
      int v305 = 0;
      uint64_t v286 = 0;
      uint64_t v289 = 0;
      int v296 = 0;
      uint64_t v277 = 0;
      uint64_t v280 = 0;
      uint64_t v283 = 0;
      LODWORD(v274) = 0;
      int v52 = 0;
      int v53 = 0;
      int v54 = 0;
      int v55 = 0;
      int v56 = 0;
      int v57 = 0;
      int v58 = 0;
      int v59 = 0;
      p_var26 = &v309->var29;
      goto LABEL_238;
    }
  }
  else
  {
    unsigned int v47 = 0;
  }
LABEL_202:
  int v48 = __sb__runningInSpringBoard();
  *(void *)((char *)&v307[11] + 4) = __PAIR64__(v46, v47);
  if (v48)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v37 = 0;
      unsigned int v49 = 0;
      goto LABEL_211;
    }
  }
  else
  {
    int v270 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v270 userInterfaceIdiom] != 1)
    {
      unsigned int v49 = 0;
      uint64_t v37 = 1;
      goto LABEL_211;
    }
  }
  uint64_t v37 = v48 ^ 1u;
  uint64_t v41 = __sb__runningInSpringBoard();
  if (v41)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v267 = [MEMORY[0x1E4F42D90] mainScreen];
    [v267 _referenceBounds];
  }
  unsigned int v49 = v41 ^ 1;
  BSSizeRoundForScale();
  if (v50 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    HIDWORD(v307[10]) = v41 ^ 1;
    LODWORD(v307[11]) = v37;
    memset(v307, 0, 84);
    int v302 = 0;
    int v293 = 0;
    int v299 = 0;
    int v305 = 0;
    uint64_t v286 = 0;
    uint64_t v289 = 0;
    int v296 = 0;
    uint64_t v277 = 0;
    uint64_t v280 = 0;
    uint64_t v283 = 0;
    LODWORD(v274) = 0;
    int v52 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var30;
    goto LABEL_238;
  }
LABEL_211:
  int v51 = __sb__runningInSpringBoard();
  *(void *)((char *)&v307[10] + 4) = __PAIR64__(v37, v49);
  if (v51)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)((char *)&v307[9] + 4) = 0;
      goto LABEL_221;
    }
  }
  else
  {
    uint64_t v269 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v269 userInterfaceIdiom] != 1)
    {
      *(void *)((char *)&v307[9] + 4) = 0x100000000;
      goto LABEL_221;
    }
  }
  LODWORD(v307[10]) = v51 ^ 1;
  uint64_t v41 = __sb__runningInSpringBoard();
  if (v41)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v265 = [MEMORY[0x1E4F42D90] mainScreen];
    [v265 _referenceBounds];
  }
  HIDWORD(v307[9]) = v41 ^ 1;
  BSSizeRoundForScale();
  if (v61 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    memset(v307, 0, 76);
    int v302 = 0;
    int v293 = 0;
    int v299 = 0;
    int v305 = 0;
    uint64_t v286 = 0;
    uint64_t v289 = 0;
    int v296 = 0;
    uint64_t v277 = 0;
    uint64_t v280 = 0;
    uint64_t v283 = 0;
    LODWORD(v274) = 0;
    int v52 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var28;
    goto LABEL_238;
  }
LABEL_221:
  int v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)((char *)&v307[8] + 4) = 0;
      goto LABEL_531;
    }
  }
  else
  {
    uint64_t v268 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v268 userInterfaceIdiom] != 1)
    {
      *(void *)((char *)&v307[8] + 4) = 0x100000000;
      goto LABEL_531;
    }
  }
  LODWORD(v307[9]) = v62 ^ 1;
  uint64_t v41 = __sb__runningInSpringBoard();
  if (v41)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    int v261 = [MEMORY[0x1E4F42D90] mainScreen];
    [v261 _referenceBounds];
  }
  HIDWORD(v307[8]) = v41 ^ 1;
  BSSizeRoundForScale();
  if (v101 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    memset(v307, 0, 68);
    int v302 = 0;
    int v293 = 0;
    int v299 = 0;
    int v305 = 0;
    uint64_t v286 = 0;
    uint64_t v289 = 0;
    int v296 = 0;
    uint64_t v277 = 0;
    uint64_t v280 = 0;
    uint64_t v283 = 0;
    LODWORD(v274) = 0;
    int v52 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var27;
    goto LABEL_238;
  }
LABEL_531:
  uint64_t v41 = __sb__runningInSpringBoard();
  if (v41)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_533;
    }
LABEL_539:
    memset(v307, 0, 64);
    int v302 = 0;
    int v293 = 0;
    int v299 = 0;
    int v305 = 0;
    uint64_t v286 = 0;
    uint64_t v289 = 0;
    int v296 = 0;
    uint64_t v277 = 0;
    uint64_t v280 = 0;
    uint64_t v283 = 0;
    LODWORD(v274) = 0;
    int v52 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var25;
    LODWORD(v307[8]) = v41 ^ 1;
    goto LABEL_238;
  }
  uint64_t v266 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v266 userInterfaceIdiom] == 1) {
    goto LABEL_539;
  }
LABEL_533:
  LODWORD(v307[8]) = v41 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_537:
    *(void *)((char *)&v307[6] + 4) = 0;
    goto LABEL_590;
  }
  int v102 = __sb__runningInSpringBoard();
  if (v102)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_537;
    }
  }
  else
  {
    int v259 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v259 userInterfaceIdiom])
    {
      *(void *)((char *)&v307[6] + 4) = 0x100000000;
      goto LABEL_590;
    }
  }
  LODWORD(v307[7]) = v102 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v252 = [MEMORY[0x1E4F42D90] mainScreen];
      [v252 _referenceBounds];
    }
    HIDWORD(v307[6]) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v112 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      HIDWORD(v307[7]) = 0;
      memset(v307, 0, 52);
      int v302 = 0;
      int v293 = 0;
      int v299 = 0;
      int v305 = 0;
      uint64_t v286 = 0;
      uint64_t v289 = 0;
      int v296 = 0;
      uint64_t v277 = 0;
      uint64_t v280 = 0;
      uint64_t v283 = 0;
      LODWORD(v274) = 0;
      int v52 = 0;
      int v53 = 0;
      int v54 = 0;
      int v55 = 0;
      int v56 = 0;
      int v57 = 0;
      int v58 = 0;
      int v59 = 0;
      p_var26 = &v309->var21;
      goto LABEL_238;
    }
  }
  else
  {
    HIDWORD(v307[6]) = 0;
  }
LABEL_590:
  uint64_t v41 = __sb__runningInSpringBoard();
  if (v41)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v307[7]) = 0;
      LODWORD(v307[6]) = 0;
      goto LABEL_600;
    }
  }
  else
  {
    uint64_t v260 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v260 userInterfaceIdiom])
    {
      LODWORD(v307[6]) = 0;
      HIDWORD(v307[7]) = 1;
      goto LABEL_600;
    }
  }
  HIDWORD(v307[7]) = v41 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v255 = [MEMORY[0x1E4F42D90] mainScreen];
      [v255 _referenceBounds];
    }
    LODWORD(v307[6]) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v107 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_604;
    }
  }
  else
  {
    LODWORD(v307[6]) = 0;
  }
LABEL_600:
  if (_SBF_Private_IsD94Like())
  {
    memset(v307, 0, 48);
    int v302 = 0;
    int v293 = 0;
    int v299 = 0;
    int v305 = 0;
    uint64_t v286 = 0;
    uint64_t v289 = 0;
    int v296 = 0;
    uint64_t v277 = 0;
    uint64_t v280 = 0;
    uint64_t v283 = 0;
    LODWORD(v274) = 0;
    int v52 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var22;
    goto LABEL_238;
  }
LABEL_604:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_608:
    v307[5] = 0;
    goto LABEL_683;
  }
  int v108 = __sb__runningInSpringBoard();
  if (v108)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_608;
    }
  }
  else
  {
    v256 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v256 userInterfaceIdiom])
    {
      v307[5] = 0x100000000;
      goto LABEL_683;
    }
  }
  HIDWORD(v307[5]) = v108 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v247 = [MEMORY[0x1E4F42D90] mainScreen];
      [v247 _referenceBounds];
    }
    LODWORD(v307[5]) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v127 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v307, 0, 40);
      int v302 = 0;
      int v293 = 0;
      int v299 = 0;
      int v305 = 0;
      uint64_t v286 = 0;
      uint64_t v289 = 0;
      int v296 = 0;
      uint64_t v277 = 0;
      uint64_t v280 = 0;
      uint64_t v283 = 0;
      LODWORD(v274) = 0;
      int v52 = 0;
      int v53 = 0;
      int v54 = 0;
      int v55 = 0;
      int v56 = 0;
      int v57 = 0;
      int v58 = 0;
      int v59 = 0;
      p_var26 = &v309->var23;
      goto LABEL_238;
    }
  }
  else
  {
    LODWORD(v307[5]) = 0;
  }
LABEL_683:
  uint64_t v41 = __sb__runningInSpringBoard();
  if (v41)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v307[4]) = 0;
      HIDWORD(v307[3]) = 0;
      goto LABEL_693;
    }
  }
  else
  {
    int v258 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v258 userInterfaceIdiom])
    {
      HIDWORD(v307[3]) = 0;
      HIDWORD(v307[4]) = 1;
      goto LABEL_693;
    }
  }
  HIDWORD(v307[4]) = v41 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v251 = [MEMORY[0x1E4F42D90] mainScreen];
      [v251 _referenceBounds];
    }
    HIDWORD(v307[3]) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v117 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_697;
    }
  }
  else
  {
    HIDWORD(v307[3]) = 0;
  }
LABEL_693:
  if (_SBF_Private_IsD64Like())
  {
    LODWORD(v307[4]) = 0;
    memset(v307, 0, 28);
    int v302 = 0;
    int v293 = 0;
    int v299 = 0;
    int v305 = 0;
    uint64_t v286 = 0;
    uint64_t v289 = 0;
    int v296 = 0;
    uint64_t v277 = 0;
    uint64_t v280 = 0;
    uint64_t v283 = 0;
    LODWORD(v274) = 0;
    int v52 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var24;
    goto LABEL_238;
  }
LABEL_697:
  int v118 = __sb__runningInSpringBoard();
  if (v118)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v307[4]) = 0;
      LODWORD(v307[3]) = 0;
      goto LABEL_707;
    }
  }
  else
  {
    v257 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v257 userInterfaceIdiom])
    {
      LODWORD(v307[3]) = 0;
      LODWORD(v307[4]) = 1;
      goto LABEL_707;
    }
  }
  LODWORD(v307[4]) = v118 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v119 = __sb__runningInSpringBoard();
    if (v119)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v248 = [MEMORY[0x1E4F42D90] mainScreen];
      [v248 _referenceBounds];
    }
    uint64_t v41 = v119 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v307[3]) = v41;
    if (v124 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v307, 0, 24);
      int v302 = 0;
      int v293 = 0;
      int v299 = 0;
      int v305 = 0;
      uint64_t v286 = 0;
      uint64_t v289 = 0;
      int v296 = 0;
      uint64_t v277 = 0;
      uint64_t v280 = 0;
      uint64_t v283 = 0;
      LODWORD(v274) = 0;
      int v52 = 0;
      int v53 = 0;
      int v54 = 0;
      int v55 = 0;
      int v56 = 0;
      int v57 = 0;
      int v58 = 0;
      int v59 = 0;
      p_var26 = &v309->var19;
      goto LABEL_238;
    }
  }
  else
  {
    LODWORD(v307[3]) = 0;
  }
LABEL_707:
  uint64_t v41 = __sb__runningInSpringBoard();
  if (v41)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v307[1]) = 0;
      LODWORD(v307[0]) = 0;
      goto LABEL_757;
    }
  }
  else
  {
    v254 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v254 userInterfaceIdiom])
    {
      LODWORD(v307[0]) = 0;
      HIDWORD(v307[1]) = 1;
      goto LABEL_757;
    }
  }
  HIDWORD(v307[1]) = v41 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v246 = [MEMORY[0x1E4F42D90] mainScreen];
      [v246 _referenceBounds];
    }
    LODWORD(v307[0]) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v131 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_793;
    }
  }
  else
  {
    LODWORD(v307[0]) = 0;
  }
LABEL_757:
  if (_SBF_Private_IsD54())
  {
    v307[2] = 0;
    *(void *)((char *)v307 + 4) = 0;
    int v302 = 0;
    int v293 = 0;
    int v299 = 0;
    int v305 = 0;
    uint64_t v286 = 0;
    uint64_t v289 = 0;
    int v296 = 0;
    uint64_t v277 = 0;
    uint64_t v280 = 0;
    uint64_t v283 = 0;
    LODWORD(v274) = 0;
    int v52 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var20;
    goto LABEL_238;
  }
LABEL_793:
  int v132 = __sb__runningInSpringBoard();
  if (v132)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v307[2] = 0;
      goto LABEL_821;
    }
  }
  else
  {
    v253 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v253 userInterfaceIdiom])
    {
      v307[2] = 0x100000000;
      goto LABEL_821;
    }
  }
  HIDWORD(v307[2]) = v132 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v136 = __sb__runningInSpringBoard();
    if (v136)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v243 = [MEMORY[0x1E4F42D90] mainScreen];
      [v243 _referenceBounds];
    }
    uint64_t v41 = v136 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v307[2]) = v41;
    if (v139 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && _SBF_Private_IsN84OrSimilarDevice())
    {
      *(void *)((char *)v307 + 4) = 0;
      int v302 = 0;
      int v293 = 0;
      int v299 = 0;
      int v305 = 0;
      uint64_t v286 = 0;
      uint64_t v289 = 0;
      int v296 = 0;
      uint64_t v277 = 0;
      uint64_t v280 = 0;
      uint64_t v283 = 0;
      LODWORD(v274) = 0;
      int v52 = 0;
      int v53 = 0;
      int v54 = 0;
      int v55 = 0;
      int v56 = 0;
      int v57 = 0;
      int v58 = 0;
      int v59 = 0;
      p_var26 = &v309->var13;
      goto LABEL_238;
    }
  }
  else
  {
    LODWORD(v307[2]) = 0;
  }
LABEL_821:
  uint64_t v41 = __sb__runningInSpringBoard();
  if (v41)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)((char *)v307 + 4) = 0;
      goto LABEL_848;
    }
  }
  else
  {
    v250 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v250 userInterfaceIdiom])
    {
      HIDWORD(v307[0]) = 0;
      LODWORD(v307[1]) = 1;
      goto LABEL_848;
    }
  }
  LODWORD(v307[1]) = v41 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v242 = [MEMORY[0x1E4F42D90] mainScreen];
      [v242 _referenceBounds];
    }
    HIDWORD(v307[0]) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v143 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_881;
    }
  }
  else
  {
    HIDWORD(v307[0]) = 0;
  }
LABEL_848:
  if (_SBF_Private_IsD33OrSimilarDevice() && _SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    int v302 = 0;
    int v293 = 0;
    int v299 = 0;
    int v305 = 0;
    uint64_t v286 = 0;
    uint64_t v289 = 0;
    int v296 = 0;
    uint64_t v277 = 0;
    uint64_t v280 = 0;
    uint64_t v283 = 0;
    LODWORD(v274) = 0;
    int v52 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var14;
    goto LABEL_238;
  }
LABEL_881:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_885:
    int v302 = 0;
    int v293 = 0;
    goto LABEL_926;
  }
  int v144 = __sb__runningInSpringBoard();
  if (v144)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_885;
    }
  }
  else
  {
    v245 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v245 userInterfaceIdiom])
    {
      int v293 = 0;
      int v302 = 1;
      goto LABEL_926;
    }
  }
  int v302 = v144 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v152 = __sb__runningInSpringBoard();
    if (v152)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v236 = [MEMORY[0x1E4F42D90] mainScreen];
      [v236 _referenceBounds];
    }
    uint64_t v41 = v152 ^ 1u;
    BSSizeRoundForScale();
    int v293 = v41;
    if (v163 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      int v299 = 0;
      int v305 = 0;
      uint64_t v286 = 0;
      uint64_t v289 = 0;
      int v296 = 0;
      uint64_t v277 = 0;
      uint64_t v280 = 0;
      uint64_t v283 = 0;
      LODWORD(v274) = 0;
      int v52 = 0;
      int v53 = 0;
      int v54 = 0;
      int v55 = 0;
      int v56 = 0;
      int v57 = 0;
      int v58 = 0;
      int v59 = 0;
      p_var26 = &v309->var11;
      goto LABEL_238;
    }
  }
  else
  {
    int v293 = 0;
  }
LABEL_926:
  int v153 = __sb__runningInSpringBoard();
  if (v153)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v299 = 0;
      uint64_t v41 = 0;
      goto LABEL_936;
    }
  }
  else
  {
    v249 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v249 userInterfaceIdiom])
    {
      uint64_t v41 = 0;
      int v299 = 1;
      goto LABEL_936;
    }
  }
  int v299 = v153 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v154 = __sb__runningInSpringBoard();
    if (v154)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v239 = [MEMORY[0x1E4F42D90] mainScreen];
      [v239 _referenceBounds];
    }
    uint64_t v41 = v154 ^ 1u;
    BSSizeRoundForScale();
    if (v155 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_940;
    }
  }
  else
  {
    uint64_t v41 = 0;
  }
LABEL_936:
  if (_SBF_Private_IsD93Like())
  {
    int v305 = v41;
    uint64_t v286 = 0;
    uint64_t v289 = 0;
    int v296 = 0;
    uint64_t v277 = 0;
    uint64_t v280 = 0;
    uint64_t v283 = 0;
    LODWORD(v274) = 0;
    int v52 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var12;
    goto LABEL_238;
  }
LABEL_940:
  int v305 = v41;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_944:
    HIDWORD(v286) = 0;
    HIDWORD(v289) = 0;
    goto LABEL_1019;
  }
  int v156 = __sb__runningInSpringBoard();
  if (v156)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_944;
    }
  }
  else
  {
    v240 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v240 userInterfaceIdiom])
    {
      HIDWORD(v289) = 0;
      HIDWORD(v286) = 1;
      goto LABEL_1019;
    }
  }
  HIDWORD(v286) = v156 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v232 = [MEMORY[0x1E4F42D90] mainScreen];
      [v232 _referenceBounds];
    }
    HIDWORD(v289) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v178 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v296 = 0;
      LODWORD(v289) = 0;
      LODWORD(v286) = 0;
      uint64_t v277 = 0;
      uint64_t v280 = 0;
      uint64_t v283 = 0;
      LODWORD(v274) = 0;
      int v52 = 0;
      int v53 = 0;
      int v54 = 0;
      int v55 = 0;
      int v56 = 0;
      int v57 = 0;
      int v58 = 0;
      int v59 = 0;
      p_var26 = &v309->var17;
      goto LABEL_238;
    }
  }
  else
  {
    HIDWORD(v289) = 0;
  }
LABEL_1019:
  uint64_t v41 = __sb__runningInSpringBoard();
  if (v41)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v296 = 0;
      LODWORD(v289) = 0;
      goto LABEL_1029;
    }
  }
  else
  {
    v244 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v244 userInterfaceIdiom])
    {
      LODWORD(v289) = 0;
      int v296 = 1;
      goto LABEL_1029;
    }
  }
  int v296 = v41 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v235 = [MEMORY[0x1E4F42D90] mainScreen];
      [v235 _referenceBounds];
    }
    LODWORD(v289) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v168 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1033;
    }
  }
  else
  {
    LODWORD(v289) = 0;
  }
LABEL_1029:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v286) = 0;
    uint64_t v277 = 0;
    uint64_t v280 = 0;
    uint64_t v283 = 0;
    LODWORD(v274) = 0;
    int v52 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var18;
    goto LABEL_238;
  }
LABEL_1033:
  int v169 = __sb__runningInSpringBoard();
  if (v169)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v286) = 0;
      HIDWORD(v277) = 0;
      goto LABEL_1043;
    }
  }
  else
  {
    v241 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v241 userInterfaceIdiom])
    {
      HIDWORD(v277) = 0;
      LODWORD(v286) = 1;
      goto LABEL_1043;
    }
  }
  LODWORD(v286) = v169 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v170 = __sb__runningInSpringBoard();
    if (v170)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v233 = [MEMORY[0x1E4F42D90] mainScreen];
      [v233 _referenceBounds];
    }
    uint64_t v41 = v170 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v277) = v41;
    if (v175 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v280 = 0;
      uint64_t v283 = 0;
      LODWORD(v277) = 0;
      LODWORD(v274) = 0;
      int v52 = 0;
      int v53 = 0;
      int v54 = 0;
      int v55 = 0;
      int v56 = 0;
      int v57 = 0;
      int v58 = 0;
      int v59 = 0;
      p_var26 = &v309->var15;
      goto LABEL_238;
    }
  }
  else
  {
    HIDWORD(v277) = 0;
  }
LABEL_1043:
  uint64_t v41 = __sb__runningInSpringBoard();
  if (v41)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v283 = 0;
      goto LABEL_1093;
    }
  }
  else
  {
    v238 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v238 userInterfaceIdiom])
    {
      uint64_t v283 = 0x100000000;
      goto LABEL_1093;
    }
  }
  HIDWORD(v283) = v41 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v231 = [MEMORY[0x1E4F42D90] mainScreen];
      [v231 _referenceBounds];
    }
    LODWORD(v283) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v182 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1129;
    }
  }
  else
  {
    LODWORD(v283) = 0;
  }
LABEL_1093:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    uint64_t v280 = 0;
    LODWORD(v277) = 0;
    LODWORD(v274) = 0;
    int v52 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var16;
    goto LABEL_238;
  }
LABEL_1129:
  int v183 = __sb__runningInSpringBoard();
  if (v183)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v280) = 0;
      LODWORD(v277) = 0;
      goto LABEL_1157;
    }
  }
  else
  {
    v237 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v237 userInterfaceIdiom])
    {
      LODWORD(v277) = 0;
      HIDWORD(v280) = 1;
      goto LABEL_1157;
    }
  }
  HIDWORD(v280) = v183 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v230 = [MEMORY[0x1E4F42D90] mainScreen];
      [v230 _referenceBounds];
    }
    LODWORD(v277) = v41 ^ 1;
    BSSizeRoundForScale();
    if (v193 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v274) = 0;
      LODWORD(v280) = 0;
      int v52 = 0;
      int v53 = 0;
      int v54 = 0;
      int v55 = 0;
      int v56 = 0;
      int v57 = 0;
      int v58 = 0;
      int v59 = 0;
      p_var26 = &v309->var9;
      goto LABEL_238;
    }
  }
  else
  {
    LODWORD(v277) = 0;
  }
LABEL_1157:
  int v187 = __sb__runningInSpringBoard();
  if (v187)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v274) = 0;
      uint64_t v41 = 0;
      goto LABEL_1183;
    }
  }
  else
  {
    v234 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v234 userInterfaceIdiom])
    {
      uint64_t v41 = 0;
      LODWORD(v274) = 1;
      goto LABEL_1183;
    }
  }
  LODWORD(v274) = v187 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v190 = __sb__runningInSpringBoard();
    if (v190)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v229 = [MEMORY[0x1E4F42D90] mainScreen];
      [v229 _referenceBounds];
    }
    uint64_t v41 = v190 ^ 1u;
    BSSizeRoundForScale();
    if (v196 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1214;
    }
  }
  else
  {
    uint64_t v41 = 0;
  }
LABEL_1183:
  if (_SBF_Private_IsD53())
  {
    LODWORD(v280) = v41;
    int v52 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var10;
    goto LABEL_238;
  }
LABEL_1214:
  LODWORD(v280) = v41;
  if (_SBF_Private_IsD16() && _SBF_Private_IsD52OrSimilarDevice())
  {
    int v52 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var5;
    goto LABEL_238;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && _SBF_Private_IsD16())
  {
    int v52 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var6;
    goto LABEL_238;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v52 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var3;
    goto LABEL_238;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    int v52 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var4;
    goto LABEL_238;
  }
  int v199 = __sb__runningInSpringBoard();
  if (v199)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v52 = 0;
      int v53 = 0;
      goto LABEL_1268;
    }
  }
  else
  {
    v228 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v228 userInterfaceIdiom])
    {
      int v53 = 0;
      int v52 = 1;
      goto LABEL_1268;
    }
  }
  int v52 = v199 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v224 = [MEMORY[0x1E4F42D90] mainScreen];
      [v224 _referenceBounds];
    }
    int v53 = v41 ^ 1;
    BSSizeRoundForScale();
    if (v211 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v54 = 0;
      int v55 = 0;
      int v56 = 0;
      int v57 = 0;
      int v58 = 0;
      int v59 = 0;
      p_var26 = &v309->var7;
      goto LABEL_238;
    }
  }
  else
  {
    int v53 = 0;
  }
LABEL_1268:
  int v201 = __sb__runningInSpringBoard();
  if (v201)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v54 = 0;
      int v55 = 0;
      goto LABEL_1298;
    }
  }
  else
  {
    v227 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v227 userInterfaceIdiom])
    {
      int v55 = 0;
      int v54 = 1;
      goto LABEL_1298;
    }
  }
  int v54 = v201 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v223 = [MEMORY[0x1E4F42D90] mainScreen];
      [v223 _referenceBounds];
    }
    int v55 = v41 ^ 1;
    BSSizeRoundForScale();
    if (v214 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v56 = 0;
      int v57 = 0;
      int v58 = 0;
      int v59 = 0;
      p_var26 = &v309->var8;
      goto LABEL_238;
    }
  }
  else
  {
    int v55 = 0;
  }
LABEL_1298:
  uint64_t v41 = __sb__runningInSpringBoard();
  if (v41)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v56 = 0;
      int v57 = 0;
      goto LABEL_1329;
    }
  }
  else
  {
    v226 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v226 userInterfaceIdiom])
    {
      int v57 = 0;
      int v56 = 1;
      goto LABEL_1329;
    }
  }
  int v56 = v41 ^ 1;
  uint64_t v41 = __sb__runningInSpringBoard();
  if (v41)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v225 = [MEMORY[0x1E4F42D90] mainScreen];
    [v225 _referenceBounds];
  }
  int v57 = v41 ^ 1;
  BSSizeRoundForScale();
  if (v208 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v58 = 0;
    int v59 = 0;
    p_var26 = &v309->var2;
    goto LABEL_238;
  }
LABEL_1329:
  uint64_t v37 = __sb__runningInSpringBoard();
  if (v37)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v58 = 0;
      int v59 = 0;
LABEL_1375:
      p_var26 = &v309->var0;
      goto LABEL_238;
    }
  }
  else
  {
    uint64_t v41 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v41 userInterfaceIdiom])
    {
      int v59 = 0;
      int v58 = 1;
      goto LABEL_1375;
    }
  }
  int v58 = v37 ^ 1;
  int v218 = __sb__runningInSpringBoard();
  if (v218)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v37 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v37 _referenceBounds];
  }
  int v59 = v218 ^ 1;
  BSSizeRoundForScale();
  if (v219 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_1375;
  }
  p_var26 = &v309->var1;
LABEL_238:
  v311->_lineWidth = *p_var26;
  if (v59) {

  }
  if (v58) {
  uint64_t v67 = HIDWORD(v307[10]);
  }
  if (v57) {

  }
  if (v56) {
  if (v55)
  }

  if (v54) {
  if (v53)
  }

  if (v52) {
  if (v280)
  }

  if (v274) {
  if (v277)
  }

  if (HIDWORD(v280)) {
  if (v283)
  }

  if (HIDWORD(v283)) {
  if (HIDWORD(v277))
  }

  if (v286) {
  if (v289)
  }

  if (v296) {
  if (HIDWORD(v289))
  }

  if (HIDWORD(v286)) {
  if (v305)
  }

  if (v299) {
  if (v293)
  }

  if (v302) {
  if (HIDWORD(v307[0]))
  }

  if (LODWORD(v307[1])) {
  if (LODWORD(v307[2]))
  }

  if (HIDWORD(v307[2])) {
  if (LODWORD(v307[0]))
  }

  if (HIDWORD(v307[1])) {
  if (LODWORD(v307[3]))
  }

  if (LODWORD(v307[4])) {
  if (HIDWORD(v307[3]))
  }

  if (HIDWORD(v307[4])) {
  if (LODWORD(v307[5]))
  }

  if (HIDWORD(v307[5])) {
  if (LODWORD(v307[6]))
  }

  if (HIDWORD(v307[7])) {
  if (HIDWORD(v307[6]))
  }

  if (LODWORD(v307[7])) {
  if (LODWORD(v307[8]))
  }

  if (HIDWORD(v307[8])) {
  if (LODWORD(v307[9]))
  }

  if (HIDWORD(v307[9])) {
  if (LODWORD(v307[10]))
  }
  {

    if (!HIDWORD(v307[10])) {
      goto LABEL_328;
    }
  }
  else if (!HIDWORD(v307[10]))
  {
LABEL_328:
    if (LODWORD(v307[11])) {
      goto LABEL_329;
    }
    goto LABEL_341;
  }

  if (LODWORD(v307[11]))
  {
LABEL_329:

    if (!HIDWORD(v307[11])) {
      goto LABEL_330;
    }
    goto LABEL_342;
  }
LABEL_341:
  if (!HIDWORD(v307[11]))
  {
LABEL_330:
    if (LODWORD(v307[12])) {
      goto LABEL_331;
    }
    goto LABEL_343;
  }
LABEL_342:

  if (LODWORD(v307[12]))
  {
LABEL_331:

    if (!HIDWORD(v307[12])) {
      goto LABEL_332;
    }
    goto LABEL_344;
  }
LABEL_343:
  if (!HIDWORD(v307[12]))
  {
LABEL_332:
    if (LODWORD(v307[13])) {
      goto LABEL_333;
    }
    goto LABEL_345;
  }
LABEL_344:

  if (LODWORD(v307[13]))
  {
LABEL_333:

    if (!HIDWORD(v307[13])) {
      goto LABEL_334;
    }
    goto LABEL_346;
  }
LABEL_345:
  if (!HIDWORD(v307[13]))
  {
LABEL_334:
    if (!v308) {
      goto LABEL_336;
    }
    goto LABEL_335;
  }
LABEL_346:

  if (v308) {
LABEL_335:
  }

LABEL_336:
  int v68 = __sb__runningInSpringBoard();
  if (v68)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v69 = 0;
      int v70 = 0;
      goto LABEL_354;
    }
  }
  else
  {
    int v274 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v274 userInterfaceIdiom] != 1)
    {
      int v70 = 0;
      int v69 = 1;
      goto LABEL_354;
    }
  }
  int v69 = v68 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v71 = __sb__runningInSpringBoard();
    if (v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v265 = [MEMORY[0x1E4F42D90] mainScreen];
      [v265 _referenceBounds];
    }
    int v70 = v71 ^ 1;
    BSSizeRoundForScale();
    if (v94 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v93 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v308 = v71 ^ 1;
      LODWORD(v309) = v69;
      int v306 = 0;
      int v297 = 0;
      int v303 = 0;
      memset(v307, 0, sizeof(v307));
      int v290 = 0;
      int v294 = 0;
      int v300 = 0;
      int v291 = 0;
      uint64_t v284 = 0;
      uint64_t v287 = 0;
      uint64_t v278 = 0;
      uint64_t v281 = 0;
      int v82 = 0;
      int v83 = 0;
      int v84 = 0;
      int v85 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      p_var31 = &v310->var26;
      goto LABEL_408;
    }
  }
  else
  {
    int v70 = 0;
  }
LABEL_354:
  int v72 = __sb__runningInSpringBoard();
  int v308 = v70;
  LODWORD(v309) = v69;
  if (v72)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v73 = 0;
      unsigned int v74 = 0;
      goto LABEL_363;
    }
  }
  else
  {
    int v273 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v273 userInterfaceIdiom] != 1)
    {
      unsigned int v74 = 0;
      int v73 = 1;
      goto LABEL_363;
    }
  }
  int v73 = v72 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v71 = __sb__runningInSpringBoard();
    if (v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v264 = [MEMORY[0x1E4F42D90] mainScreen];
      [v264 _referenceBounds];
    }
    unsigned int v74 = v71 ^ 1;
    BSSizeRoundForScale();
    if (v95 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      LODWORD(v307[13]) = v71 ^ 1;
      HIDWORD(v307[13]) = v73;
      int v306 = 0;
      int v297 = 0;
      int v303 = 0;
      memset(v307, 0, 104);
      int v290 = 0;
      int v294 = 0;
      int v300 = 0;
      int v291 = 0;
      uint64_t v284 = 0;
      uint64_t v287 = 0;
      uint64_t v278 = 0;
      uint64_t v281 = 0;
      int v82 = 0;
      int v83 = 0;
      int v84 = 0;
      int v85 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      p_var31 = &v310->var31;
      goto LABEL_408;
    }
  }
  else
  {
    unsigned int v74 = 0;
  }
LABEL_363:
  int v75 = __sb__runningInSpringBoard();
  v307[13] = __PAIR64__(v73, v74);
  if (v75)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v76 = 0;
      unsigned int v77 = 0;
      goto LABEL_372;
    }
  }
  else
  {
    uint64_t v272 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v272 userInterfaceIdiom] != 1)
    {
      unsigned int v77 = 0;
      int v76 = 1;
      goto LABEL_372;
    }
  }
  int v76 = v75 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v71 = __sb__runningInSpringBoard();
    if (v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v263 = [MEMORY[0x1E4F42D90] mainScreen];
      [v263 _referenceBounds];
    }
    unsigned int v77 = v71 ^ 1;
    BSSizeRoundForScale();
    if (v96 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      LODWORD(v307[12]) = v71 ^ 1;
      HIDWORD(v307[12]) = v76;
      int v306 = 0;
      int v297 = 0;
      int v303 = 0;
      memset(v307, 0, 96);
      int v290 = 0;
      int v294 = 0;
      int v300 = 0;
      int v291 = 0;
      uint64_t v284 = 0;
      uint64_t v287 = 0;
      uint64_t v278 = 0;
      uint64_t v281 = 0;
      int v82 = 0;
      int v83 = 0;
      int v84 = 0;
      int v85 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      p_var31 = &v310->var29;
      goto LABEL_408;
    }
  }
  else
  {
    unsigned int v77 = 0;
  }
LABEL_372:
  int v78 = __sb__runningInSpringBoard();
  v307[12] = __PAIR64__(v76, v77);
  if (v78)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v79 = 0;
      uint64_t v67 = 0;
      goto LABEL_381;
    }
  }
  else
  {
    int v271 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v271 userInterfaceIdiom] != 1)
    {
      uint64_t v67 = 0;
      int v79 = 1;
      goto LABEL_381;
    }
  }
  int v79 = v78 ^ 1;
  uint64_t v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v268 = [MEMORY[0x1E4F42D90] mainScreen];
    [v268 _referenceBounds];
  }
  uint64_t v67 = v71 ^ 1;
  BSSizeRoundForScale();
  if (v80 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    v307[11] = __PAIR64__(v79, v67);
    int v306 = 0;
    int v297 = 0;
    int v303 = 0;
    memset(v307, 0, 88);
    int v290 = 0;
    int v294 = 0;
    int v300 = 0;
    int v291 = 0;
    uint64_t v284 = 0;
    uint64_t v287 = 0;
    uint64_t v278 = 0;
    uint64_t v281 = 0;
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var30;
    goto LABEL_408;
  }
LABEL_381:
  int v81 = __sb__runningInSpringBoard();
  v307[11] = __PAIR64__(v79, v67);
  if (v81)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v307[10] = 0;
      goto LABEL_391;
    }
  }
  else
  {
    int v270 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v270 userInterfaceIdiom] != 1)
    {
      v307[10] = 0x100000000;
      goto LABEL_391;
    }
  }
  HIDWORD(v307[10]) = v81 ^ 1;
  uint64_t v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v266 = [MEMORY[0x1E4F42D90] mainScreen];
    [v266 _referenceBounds];
  }
  LODWORD(v307[10]) = v71 ^ 1;
  BSSizeRoundForScale();
  if (v91 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    int v306 = 0;
    int v297 = 0;
    int v303 = 0;
    memset(v307, 0, 80);
    int v290 = 0;
    int v294 = 0;
    int v300 = 0;
    int v291 = 0;
    uint64_t v284 = 0;
    uint64_t v287 = 0;
    uint64_t v278 = 0;
    uint64_t v281 = 0;
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var28;
    goto LABEL_408;
  }
LABEL_391:
  int v92 = __sb__runningInSpringBoard();
  if (v92)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v307[9] = 0;
      goto LABEL_543;
    }
  }
  else
  {
    uint64_t v269 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v269 userInterfaceIdiom] != 1)
    {
      v307[9] = 0x100000000;
      goto LABEL_543;
    }
  }
  HIDWORD(v307[9]) = v92 ^ 1;
  uint64_t v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    int v262 = [MEMORY[0x1E4F42D90] mainScreen];
    [v262 _referenceBounds];
  }
  LODWORD(v307[9]) = v71 ^ 1;
  BSSizeRoundForScale();
  if (v103 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    int v306 = 0;
    int v297 = 0;
    int v303 = 0;
    memset(v307, 0, 72);
    int v290 = 0;
    int v294 = 0;
    int v300 = 0;
    int v291 = 0;
    uint64_t v284 = 0;
    uint64_t v287 = 0;
    uint64_t v278 = 0;
    uint64_t v281 = 0;
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var27;
    goto LABEL_408;
  }
LABEL_543:
  uint64_t v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_545;
    }
LABEL_551:
    int v306 = 0;
    int v297 = 0;
    int v303 = 0;
    memset(v307, 0, 68);
    int v290 = 0;
    int v294 = 0;
    int v300 = 0;
    int v291 = 0;
    uint64_t v284 = 0;
    uint64_t v287 = 0;
    uint64_t v278 = 0;
    uint64_t v281 = 0;
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var25;
    HIDWORD(v307[8]) = v71 ^ 1;
    goto LABEL_408;
  }
  uint64_t v267 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v267 userInterfaceIdiom] == 1) {
    goto LABEL_551;
  }
LABEL_545:
  HIDWORD(v307[8]) = v71 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_549:
    v307[7] = 0;
    goto LABEL_615;
  }
  int v104 = __sb__runningInSpringBoard();
  if (v104)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_549;
    }
  }
  else
  {
    uint64_t v260 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v260 userInterfaceIdiom])
    {
      v307[7] = 0x100000000;
      goto LABEL_615;
    }
  }
  HIDWORD(v307[7]) = v104 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v71 = __sb__runningInSpringBoard();
    if (v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v253 = [MEMORY[0x1E4F42D90] mainScreen];
      [v253 _referenceBounds];
    }
    LODWORD(v307[7]) = v71 ^ 1;
    BSSizeRoundForScale();
    if (v113 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      LODWORD(v307[8]) = 0;
      int v306 = 0;
      int v297 = 0;
      int v303 = 0;
      memset(v307, 0, 56);
      int v290 = 0;
      int v294 = 0;
      int v300 = 0;
      int v291 = 0;
      uint64_t v284 = 0;
      uint64_t v287 = 0;
      uint64_t v278 = 0;
      uint64_t v281 = 0;
      int v82 = 0;
      int v83 = 0;
      int v84 = 0;
      int v85 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      p_var31 = &v310->var21;
      goto LABEL_408;
    }
  }
  else
  {
    LODWORD(v307[7]) = 0;
  }
LABEL_615:
  uint64_t v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v307[8]) = 0;
      HIDWORD(v307[6]) = 0;
      goto LABEL_625;
    }
  }
  else
  {
    int v261 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v261 userInterfaceIdiom])
    {
      HIDWORD(v307[6]) = 0;
      LODWORD(v307[8]) = 1;
      goto LABEL_625;
    }
  }
  LODWORD(v307[8]) = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v71 = __sb__runningInSpringBoard();
    if (v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v256 = [MEMORY[0x1E4F42D90] mainScreen];
      [v256 _referenceBounds];
    }
    HIDWORD(v307[6]) = v71 ^ 1;
    BSSizeRoundForScale();
    if (v109 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_629;
    }
  }
  else
  {
    HIDWORD(v307[6]) = 0;
  }
LABEL_625:
  if (_SBF_Private_IsD94Like())
  {
    int v306 = 0;
    int v297 = 0;
    int v303 = 0;
    memset(v307, 0, 52);
    int v290 = 0;
    int v294 = 0;
    int v300 = 0;
    int v291 = 0;
    uint64_t v284 = 0;
    uint64_t v287 = 0;
    uint64_t v278 = 0;
    uint64_t v281 = 0;
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var22;
    goto LABEL_408;
  }
LABEL_629:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_633:
    *(void *)((char *)&v307[5] + 4) = 0;
    goto LABEL_717;
  }
  int v110 = __sb__runningInSpringBoard();
  if (v110)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_633;
    }
  }
  else
  {
    v257 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v257 userInterfaceIdiom])
    {
      HIDWORD(v307[5]) = 0;
      LODWORD(v307[6]) = 1;
      goto LABEL_717;
    }
  }
  LODWORD(v307[6]) = v110 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v71 = __sb__runningInSpringBoard();
    if (v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v248 = [MEMORY[0x1E4F42D90] mainScreen];
      [v248 _referenceBounds];
    }
    HIDWORD(v307[5]) = v71 ^ 1;
    BSSizeRoundForScale();
    if (v128 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      int v306 = 0;
      int v297 = 0;
      int v303 = 0;
      memset(v307, 0, 44);
      int v290 = 0;
      int v294 = 0;
      int v300 = 0;
      int v291 = 0;
      uint64_t v284 = 0;
      uint64_t v287 = 0;
      uint64_t v278 = 0;
      uint64_t v281 = 0;
      int v82 = 0;
      int v83 = 0;
      int v84 = 0;
      int v85 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      p_var31 = &v310->var23;
      goto LABEL_408;
    }
  }
  else
  {
    HIDWORD(v307[5]) = 0;
  }
LABEL_717:
  uint64_t v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v307[5]) = 0;
      LODWORD(v307[4]) = 0;
      goto LABEL_727;
    }
  }
  else
  {
    int v259 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v259 userInterfaceIdiom])
    {
      LODWORD(v307[4]) = 0;
      LODWORD(v307[5]) = 1;
      goto LABEL_727;
    }
  }
  LODWORD(v307[5]) = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v71 = __sb__runningInSpringBoard();
    if (v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v252 = [MEMORY[0x1E4F42D90] mainScreen];
      [v252 _referenceBounds];
    }
    LODWORD(v307[4]) = v71 ^ 1;
    BSSizeRoundForScale();
    if (v120 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_731;
    }
  }
  else
  {
    LODWORD(v307[4]) = 0;
  }
LABEL_727:
  if (_SBF_Private_IsD64Like())
  {
    HIDWORD(v307[4]) = 0;
    int v306 = 0;
    int v297 = 0;
    int v303 = 0;
    memset(v307, 0, 32);
    int v290 = 0;
    int v294 = 0;
    int v300 = 0;
    int v291 = 0;
    uint64_t v284 = 0;
    uint64_t v287 = 0;
    uint64_t v278 = 0;
    uint64_t v281 = 0;
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var24;
    goto LABEL_408;
  }
LABEL_731:
  int v121 = __sb__runningInSpringBoard();
  if (v121)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v307[4]) = 0;
      HIDWORD(v307[3]) = 0;
      goto LABEL_741;
    }
  }
  else
  {
    int v258 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v258 userInterfaceIdiom])
    {
      HIDWORD(v307[3]) = 0;
      HIDWORD(v307[4]) = 1;
      goto LABEL_741;
    }
  }
  HIDWORD(v307[4]) = v121 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v122 = __sb__runningInSpringBoard();
    if (v122)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v249 = [MEMORY[0x1E4F42D90] mainScreen];
      [v249 _referenceBounds];
    }
    uint64_t v71 = v122 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v307[3]) = v71;
    if (v125 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      int v306 = 0;
      int v297 = 0;
      int v303 = 0;
      memset(v307, 0, 28);
      int v290 = 0;
      int v294 = 0;
      int v300 = 0;
      int v291 = 0;
      uint64_t v284 = 0;
      uint64_t v287 = 0;
      uint64_t v278 = 0;
      uint64_t v281 = 0;
      int v82 = 0;
      int v83 = 0;
      int v84 = 0;
      int v85 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      p_var31 = &v310->var19;
      goto LABEL_408;
    }
  }
  else
  {
    HIDWORD(v307[3]) = 0;
  }
LABEL_741:
  uint64_t v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v307[2]) = 0;
      HIDWORD(v307[0]) = 0;
      goto LABEL_763;
    }
  }
  else
  {
    v255 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v255 userInterfaceIdiom])
    {
      HIDWORD(v307[0]) = 0;
      LODWORD(v307[2]) = 1;
      goto LABEL_763;
    }
  }
  LODWORD(v307[2]) = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v71 = __sb__runningInSpringBoard();
    if (v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v247 = [MEMORY[0x1E4F42D90] mainScreen];
      [v247 _referenceBounds];
    }
    HIDWORD(v307[0]) = v71 ^ 1;
    BSSizeRoundForScale();
    if (v133 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_801;
    }
  }
  else
  {
    HIDWORD(v307[0]) = 0;
  }
LABEL_763:
  if (_SBF_Private_IsD54())
  {
    *(void *)((char *)&v307[2] + 4) = 0;
    v307[1] = 0;
    int v306 = 0;
    int v297 = 0;
    int v303 = 0;
    LODWORD(v307[0]) = 0;
    int v290 = 0;
    int v294 = 0;
    int v300 = 0;
    int v291 = 0;
    uint64_t v284 = 0;
    uint64_t v287 = 0;
    uint64_t v278 = 0;
    uint64_t v281 = 0;
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var20;
    goto LABEL_408;
  }
LABEL_801:
  int v134 = __sb__runningInSpringBoard();
  if (v134)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)((char *)&v307[2] + 4) = 0;
      goto LABEL_831;
    }
  }
  else
  {
    v254 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v254 userInterfaceIdiom])
    {
      HIDWORD(v307[2]) = 0;
      LODWORD(v307[3]) = 1;
      goto LABEL_831;
    }
  }
  LODWORD(v307[3]) = v134 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v137 = __sb__runningInSpringBoard();
    if (v137)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v244 = [MEMORY[0x1E4F42D90] mainScreen];
      [v244 _referenceBounds];
    }
    uint64_t v71 = v137 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v307[2]) = v71;
    if (v140 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && _SBF_Private_IsN84OrSimilarDevice())
    {
      v307[1] = 0;
      int v306 = 0;
      int v297 = 0;
      int v303 = 0;
      LODWORD(v307[0]) = 0;
      int v290 = 0;
      int v294 = 0;
      int v300 = 0;
      int v291 = 0;
      uint64_t v284 = 0;
      uint64_t v287 = 0;
      uint64_t v278 = 0;
      uint64_t v281 = 0;
      int v82 = 0;
      int v83 = 0;
      int v84 = 0;
      int v85 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      p_var31 = &v310->var13;
      goto LABEL_408;
    }
  }
  else
  {
    HIDWORD(v307[2]) = 0;
  }
LABEL_831:
  uint64_t v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v307[1] = 0;
      goto LABEL_855;
    }
  }
  else
  {
    v251 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v251 userInterfaceIdiom])
    {
      v307[1] = 0x100000000;
      goto LABEL_855;
    }
  }
  HIDWORD(v307[1]) = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v71 = __sb__runningInSpringBoard();
    if (v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v243 = [MEMORY[0x1E4F42D90] mainScreen];
      [v243 _referenceBounds];
    }
    LODWORD(v307[1]) = v71 ^ 1;
    BSSizeRoundForScale();
    if (v145 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_890;
    }
  }
  else
  {
    LODWORD(v307[1]) = 0;
  }
LABEL_855:
  if (_SBF_Private_IsD33OrSimilarDevice() && _SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    int v306 = 0;
    int v297 = 0;
    int v303 = 0;
    LODWORD(v307[0]) = 0;
    int v290 = 0;
    int v294 = 0;
    int v300 = 0;
    int v291 = 0;
    uint64_t v284 = 0;
    uint64_t v287 = 0;
    uint64_t v278 = 0;
    uint64_t v281 = 0;
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var14;
    goto LABEL_408;
  }
LABEL_890:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_894:
    int v306 = 0;
    int v297 = 0;
    goto LABEL_951;
  }
  int v146 = __sb__runningInSpringBoard();
  if (v146)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_894;
    }
  }
  else
  {
    v246 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v246 userInterfaceIdiom])
    {
      int v297 = 0;
      int v306 = 1;
      goto LABEL_951;
    }
  }
  int v306 = v146 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v157 = __sb__runningInSpringBoard();
    if (v157)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v237 = [MEMORY[0x1E4F42D90] mainScreen];
      [v237 _referenceBounds];
    }
    uint64_t v71 = v157 ^ 1u;
    BSSizeRoundForScale();
    int v297 = v71;
    if (v164 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      int v303 = 0;
      LODWORD(v307[0]) = 0;
      int v290 = 0;
      int v294 = 0;
      int v300 = 0;
      int v291 = 0;
      uint64_t v284 = 0;
      uint64_t v287 = 0;
      uint64_t v278 = 0;
      uint64_t v281 = 0;
      int v82 = 0;
      int v83 = 0;
      int v84 = 0;
      int v85 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      p_var31 = &v310->var11;
      goto LABEL_408;
    }
  }
  else
  {
    int v297 = 0;
  }
LABEL_951:
  int v158 = __sb__runningInSpringBoard();
  if (v158)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v303 = 0;
      uint64_t v71 = 0;
      goto LABEL_961;
    }
  }
  else
  {
    v250 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v250 userInterfaceIdiom])
    {
      uint64_t v71 = 0;
      int v303 = 1;
      goto LABEL_961;
    }
  }
  int v303 = v158 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v159 = __sb__runningInSpringBoard();
    if (v159)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v240 = [MEMORY[0x1E4F42D90] mainScreen];
      [v240 _referenceBounds];
    }
    uint64_t v71 = v159 ^ 1u;
    BSSizeRoundForScale();
    if (v160 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_965;
    }
  }
  else
  {
    uint64_t v71 = 0;
  }
LABEL_961:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v307[0]) = v71;
    int v290 = 0;
    int v294 = 0;
    int v300 = 0;
    int v291 = 0;
    uint64_t v284 = 0;
    uint64_t v287 = 0;
    uint64_t v278 = 0;
    uint64_t v281 = 0;
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var12;
    goto LABEL_408;
  }
LABEL_965:
  LODWORD(v307[0]) = v71;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_969:
    int v290 = 0;
    int v294 = 0;
    goto LABEL_1053;
  }
  int v161 = __sb__runningInSpringBoard();
  if (v161)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_969;
    }
  }
  else
  {
    v241 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v241 userInterfaceIdiom])
    {
      int v294 = 0;
      int v290 = 1;
      goto LABEL_1053;
    }
  }
  int v290 = v161 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v71 = __sb__runningInSpringBoard();
    if (v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v233 = [MEMORY[0x1E4F42D90] mainScreen];
      [v233 _referenceBounds];
    }
    int v294 = v71 ^ 1;
    BSSizeRoundForScale();
    if (v179 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v300 = 0;
      int v291 = 0;
      uint64_t v284 = 0;
      uint64_t v287 = 0;
      uint64_t v278 = 0;
      uint64_t v281 = 0;
      int v82 = 0;
      int v83 = 0;
      int v84 = 0;
      int v85 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      p_var31 = &v310->var17;
      goto LABEL_408;
    }
  }
  else
  {
    int v294 = 0;
  }
LABEL_1053:
  uint64_t v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v300 = 0;
      int v291 = 0;
      goto LABEL_1063;
    }
  }
  else
  {
    v245 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v245 userInterfaceIdiom])
    {
      int v291 = 0;
      int v300 = 1;
      goto LABEL_1063;
    }
  }
  int v300 = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v71 = __sb__runningInSpringBoard();
    if (v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v236 = [MEMORY[0x1E4F42D90] mainScreen];
      [v236 _referenceBounds];
    }
    int v291 = v71 ^ 1;
    BSSizeRoundForScale();
    if (v171 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1067;
    }
  }
  else
  {
    int v291 = 0;
  }
LABEL_1063:
  if (_SBF_Private_IsD63Like())
  {
    uint64_t v284 = 0;
    uint64_t v287 = 0;
    uint64_t v278 = 0;
    uint64_t v281 = 0;
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var18;
    goto LABEL_408;
  }
LABEL_1067:
  int v172 = __sb__runningInSpringBoard();
  if (v172)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v287) = 0;
      LODWORD(v281) = 0;
      goto LABEL_1077;
    }
  }
  else
  {
    v242 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v242 userInterfaceIdiom])
    {
      LODWORD(v281) = 0;
      HIDWORD(v287) = 1;
      goto LABEL_1077;
    }
  }
  HIDWORD(v287) = v172 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v173 = __sb__runningInSpringBoard();
    if (v173)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v234 = [MEMORY[0x1E4F42D90] mainScreen];
      [v234 _referenceBounds];
    }
    uint64_t v71 = v173 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v281) = v71;
    if (v176 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      LODWORD(v287) = 0;
      uint64_t v284 = 0;
      uint64_t v278 = 0;
      HIDWORD(v281) = 0;
      int v82 = 0;
      int v83 = 0;
      int v84 = 0;
      int v85 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      p_var31 = &v310->var15;
      goto LABEL_408;
    }
  }
  else
  {
    LODWORD(v281) = 0;
  }
LABEL_1077:
  uint64_t v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v287) = 0;
      HIDWORD(v284) = 0;
      goto LABEL_1099;
    }
  }
  else
  {
    v239 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v239 userInterfaceIdiom])
    {
      HIDWORD(v284) = 0;
      LODWORD(v287) = 1;
      goto LABEL_1099;
    }
  }
  LODWORD(v287) = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v71 = __sb__runningInSpringBoard();
    if (v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v232 = [MEMORY[0x1E4F42D90] mainScreen];
      [v232 _referenceBounds];
    }
    HIDWORD(v284) = v71 ^ 1;
    BSSizeRoundForScale();
    if (v184 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1137;
    }
  }
  else
  {
    HIDWORD(v284) = 0;
  }
LABEL_1099:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    LODWORD(v284) = 0;
    uint64_t v278 = 0;
    HIDWORD(v281) = 0;
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var16;
    goto LABEL_408;
  }
LABEL_1137:
  int v185 = __sb__runningInSpringBoard();
  if (v185)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v284) = 0;
      HIDWORD(v278) = 0;
      goto LABEL_1167;
    }
  }
  else
  {
    v238 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v238 userInterfaceIdiom])
    {
      HIDWORD(v278) = 0;
      LODWORD(v284) = 1;
      goto LABEL_1167;
    }
  }
  LODWORD(v284) = v185 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v71 = __sb__runningInSpringBoard();
    if (v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v231 = [MEMORY[0x1E4F42D90] mainScreen];
      [v231 _referenceBounds];
    }
    HIDWORD(v278) = v71 ^ 1;
    BSSizeRoundForScale();
    if (v194 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v278) = 0;
      HIDWORD(v281) = 0;
      int v82 = 0;
      int v83 = 0;
      int v84 = 0;
      int v85 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      p_var31 = &v310->var9;
      goto LABEL_408;
    }
  }
  else
  {
    HIDWORD(v278) = 0;
  }
LABEL_1167:
  int v188 = __sb__runningInSpringBoard();
  if (v188)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v278) = 0;
      uint64_t v71 = 0;
      goto LABEL_1189;
    }
  }
  else
  {
    v235 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v235 userInterfaceIdiom])
    {
      uint64_t v71 = 0;
      LODWORD(v278) = 1;
      goto LABEL_1189;
    }
  }
  LODWORD(v278) = v188 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v191 = __sb__runningInSpringBoard();
    if (v191)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v230 = [MEMORY[0x1E4F42D90] mainScreen];
      [v230 _referenceBounds];
    }
    uint64_t v71 = v191 ^ 1u;
    BSSizeRoundForScale();
    if (v197 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1226;
    }
  }
  else
  {
    uint64_t v71 = 0;
  }
LABEL_1189:
  if (_SBF_Private_IsD53())
  {
    HIDWORD(v281) = v71;
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var10;
    goto LABEL_408;
  }
LABEL_1226:
  HIDWORD(v281) = v71;
  if (_SBF_Private_IsD16() && _SBF_Private_IsD52OrSimilarDevice())
  {
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var5;
    goto LABEL_408;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && _SBF_Private_IsD16())
  {
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var6;
    goto LABEL_408;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var3;
    goto LABEL_408;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    int v82 = 0;
    int v83 = 0;
    int v84 = 0;
    int v85 = 0;
    int v86 = 0;
    int v87 = 0;
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var4;
    goto LABEL_408;
  }
  int v200 = __sb__runningInSpringBoard();
  if (v200)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v82 = 0;
      int v83 = 0;
      goto LABEL_1278;
    }
  }
  else
  {
    v229 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v229 userInterfaceIdiom])
    {
      int v83 = 0;
      int v82 = 1;
      goto LABEL_1278;
    }
  }
  int v82 = v200 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v71 = __sb__runningInSpringBoard();
    if (v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v225 = [MEMORY[0x1E4F42D90] mainScreen];
      [v225 _referenceBounds];
    }
    int v83 = v71 ^ 1;
    BSSizeRoundForScale();
    if (v212 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v84 = 0;
      int v85 = 0;
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      p_var31 = &v310->var7;
      goto LABEL_408;
    }
  }
  else
  {
    int v83 = 0;
  }
LABEL_1278:
  int v202 = __sb__runningInSpringBoard();
  if (v202)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v84 = 0;
      int v85 = 0;
      goto LABEL_1308;
    }
  }
  else
  {
    v228 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v228 userInterfaceIdiom])
    {
      int v85 = 0;
      int v84 = 1;
      goto LABEL_1308;
    }
  }
  int v84 = v202 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v71 = __sb__runningInSpringBoard();
    if (v71)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v224 = [MEMORY[0x1E4F42D90] mainScreen];
      [v224 _referenceBounds];
    }
    int v85 = v71 ^ 1;
    BSSizeRoundForScale();
    if (v215 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v86 = 0;
      int v87 = 0;
      int v88 = 0;
      int v89 = 0;
      p_var31 = &v310->var8;
      goto LABEL_408;
    }
  }
  else
  {
    int v85 = 0;
  }
LABEL_1308:
  uint64_t v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v86 = 0;
      int v87 = 0;
      goto LABEL_1340;
    }
  }
  else
  {
    v227 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v227 userInterfaceIdiom])
    {
      int v87 = 0;
      int v86 = 1;
      goto LABEL_1340;
    }
  }
  int v86 = v71 ^ 1;
  uint64_t v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v226 = [MEMORY[0x1E4F42D90] mainScreen];
    [v226 _referenceBounds];
  }
  int v87 = v71 ^ 1;
  BSSizeRoundForScale();
  if (v209 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v88 = 0;
    int v89 = 0;
    p_var31 = &v310->var2;
    goto LABEL_408;
  }
LABEL_1340:
  uint64_t v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v88 = 0;
      int v89 = 0;
LABEL_1381:
      p_var31 = &v310->var0;
      goto LABEL_408;
    }
  }
  else
  {
    uint64_t v71 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v71 userInterfaceIdiom])
    {
      int v89 = 0;
      int v88 = 1;
      goto LABEL_1381;
    }
  }
  int v88 = v67 ^ 1;
  int v220 = __sb__runningInSpringBoard();
  if (v220)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v67 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v67 _referenceBounds];
  }
  int v89 = v220 ^ 1;
  BSSizeRoundForScale();
  if (v221 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_1381;
  }
  p_var31 = &v310->var1;
LABEL_408:
  v311->_splashRingDiameter = *p_var31;
  if (v89) {

  }
  if (v88) {
  if (v87)
  }

  if (v86) {
  if (v85)
  }

  if (v84) {
  if (v83)
  }

  if (v82) {
  if (HIDWORD(v281))
  }

  if (v278) {
  if (HIDWORD(v278))
  }

  if (v284) {
  if (HIDWORD(v284))
  }

  if (v287) {
  if (v281)
  }

  if (HIDWORD(v287)) {
  if (v291)
  }

  if (v300) {
  if (v294)
  }

  if (v290) {
  if (LODWORD(v307[0]))
  }

  if (v303) {
  if (v297)
  }

  if (v306) {
  if (LODWORD(v307[1]))
  }

  if (HIDWORD(v307[1])) {
  if (HIDWORD(v307[2]))
  }

  if (LODWORD(v307[3])) {
  if (HIDWORD(v307[0]))
  }

  if (LODWORD(v307[2])) {
  if (HIDWORD(v307[3]))
  }

  if (HIDWORD(v307[4])) {
  if (LODWORD(v307[4]))
  }

  if (LODWORD(v307[5])) {
  if (HIDWORD(v307[5]))
  }

  if (LODWORD(v307[6])) {
  if (HIDWORD(v307[6]))
  }

  if (LODWORD(v307[8])) {
  if (LODWORD(v307[7]))
  }

  if (HIDWORD(v307[7])) {
  if (HIDWORD(v307[8]))
  }

  if (LODWORD(v307[9])) {
  if (HIDWORD(v307[9]))
  }

  if (LODWORD(v307[10])) {
  if (HIDWORD(v307[10]))
  }
  {

    if (!LODWORD(v307[11])) {
      goto LABEL_498;
    }
  }
  else if (!LODWORD(v307[11]))
  {
LABEL_498:
    if (HIDWORD(v307[11])) {
      goto LABEL_499;
    }
    goto LABEL_509;
  }

  if (HIDWORD(v307[11]))
  {
LABEL_499:

    if (!LODWORD(v307[12])) {
      goto LABEL_500;
    }
    goto LABEL_510;
  }
LABEL_509:
  if (!LODWORD(v307[12]))
  {
LABEL_500:
    if (HIDWORD(v307[12])) {
      goto LABEL_501;
    }
    goto LABEL_511;
  }
LABEL_510:

  if (HIDWORD(v307[12]))
  {
LABEL_501:

    if (!LODWORD(v307[13])) {
      goto LABEL_502;
    }
    goto LABEL_512;
  }
LABEL_511:
  if (!LODWORD(v307[13]))
  {
LABEL_502:
    if (HIDWORD(v307[13])) {
      goto LABEL_503;
    }
    goto LABEL_513;
  }
LABEL_512:

  if (HIDWORD(v307[13]))
  {
LABEL_503:

    if (!v308) {
      goto LABEL_504;
    }
LABEL_514:

    if (!v309) {
      goto LABEL_506;
    }
    goto LABEL_505;
  }
LABEL_513:
  if (v308) {
    goto LABEL_514;
  }
LABEL_504:
  if (v309) {
LABEL_505:
  }

LABEL_506:
  int v97 = v311;

  return v97;
}

- (double)ringDiameter
{
  return self->_ringDiameter;
}

- (void)setRingDiameter:(double)a3
{
  self->_ringDiameter = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (CGPoint)ringCenter
{
  double x = self->_ringCenter.x;
  double y = self->_ringCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setRingCenter:(CGPoint)a3
{
  self->_ringCenter = a3;
}

- (double)splashRingDiameter
{
  return self->_splashRingDiameter;
}

- (void)setSplashRingDiameter:(double)a3
{
  self->_splashRingDiameter = a3;
}

@end