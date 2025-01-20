@interface CSMagSafeAccessoryConfiguration
+ (id)batteryCaseConfiguration;
+ (id)configuration:(id)a3 withBatteryPack:(BOOL)a4;
+ (id)defaultConfiguration;
+ (id)staticViewConfiguration;
- (BOOL)containsCenteredDateTimeLayout;
- (BOOL)staticViewNeeded;
- (CGRect)visibleScreenCoordinatesForSleeve;
- (CSLayoutStrategy)layoutStrategy;
- (CSMagSafeAccessoryConfiguration)initWithStaticViewNeeded:(BOOL)a3;
- (CSMagSafeRingConfiguration)auxiliaryRing;
- (CSMagSafeRingConfiguration)ring;
- (double)bottomContentInset;
- (double)complicationContainerHeight;
- (double)dateBaselineToComplicationY;
- (double)dateTimeMostExtremeLeadingX;
- (double)dateTimeMostExtremeTrailingX;
- (double)dateTimeSubtitleMaximumWidth;
- (double)listMinY;
- (double)prominentBaselineToListY;
- (double)staticViewRingDiameter;
- (double)timeLabelBaselineY;
- (double)timeLabelOffsetForScrollPercent:(double)a3;
- (double)timeToSubtitleLabelBaselineDifferenceY;
- (double)windowedAccessoryInset;
- (void)setAuxiliaryRing:(id)a3;
- (void)setLayoutStrategy:(id)a3;
- (void)setRing:(id)a3;
- (void)setStaticViewNeeded:(BOOL)a3;
- (void)setStaticViewRingDiameter:(double)a3;
@end

@implementation CSMagSafeAccessoryConfiguration

+ (id)defaultConfiguration
{
  if (defaultConfiguration_onceToken != -1) {
    dispatch_once(&defaultConfiguration_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)defaultConfiguration___defaultConfiguration;

  return v2;
}

uint64_t __55__CSMagSafeAccessoryConfiguration_defaultConfiguration__block_invoke()
{
  v0 = [[CSMagSafeAccessoryConfiguration alloc] initWithStaticViewNeeded:0];
  uint64_t v1 = defaultConfiguration___defaultConfiguration;
  defaultConfiguration___defaultConfiguration = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)batteryCaseConfiguration
{
  if (batteryCaseConfiguration_onceToken != -1) {
    dispatch_once(&batteryCaseConfiguration_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)batteryCaseConfiguration___batteryCaseConfiguration;

  return v2;
}

void __59__CSMagSafeAccessoryConfiguration_batteryCaseConfiguration__block_invoke()
{
  v0 = [[CSMagSafeAccessoryConfiguration alloc] initWithStaticViewNeeded:0];
  uint64_t v1 = (void *)batteryCaseConfiguration___batteryCaseConfiguration;
  batteryCaseConfiguration___batteryCaseConfiguration = (uint64_t)v0;

  v2 = (void *)batteryCaseConfiguration___batteryCaseConfiguration;
  id v3 = +[CSMagSafeRingConfiguration auxiliaryConfiguration];
  [v2 setAuxiliaryRing:v3];
}

+ (id)staticViewConfiguration
{
  if (staticViewConfiguration_onceToken != -1) {
    dispatch_once(&staticViewConfiguration_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)staticViewConfiguration___staticViewConfiguration;

  return v2;
}

uint64_t __58__CSMagSafeAccessoryConfiguration_staticViewConfiguration__block_invoke()
{
  v0 = [[CSMagSafeAccessoryConfiguration alloc] initWithStaticViewNeeded:1];
  uint64_t v1 = staticViewConfiguration___staticViewConfiguration;
  staticViewConfiguration___staticViewConfiguration = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)configuration:(id)a3 withBatteryPack:(BOOL)a4
{
  v4 = (void *)[a3 copy];

  return v4;
}

- (CSMagSafeAccessoryConfiguration)initWithStaticViewNeeded:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CSMagSafeAccessoryConfiguration;
  v4 = [(CSMagSafeAccessoryConfiguration *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_staticViewNeeded = a3;
    if (a3) {
      +[CSMagSafeRingConfiguration staticConfiguration];
    }
    else {
    v6 = +[CSMagSafeRingConfiguration defaultConfiguration];
    }
    v5->_ring = v6;

    v7 = objc_alloc_init(CSLayoutStrategy);
    layoutStrategy = v5->_layoutStrategy;
    v5->_layoutStrategy = v7;

    [(CSLayoutStrategy *)v5->_layoutStrategy setPersistentLayout:v5];
  }
  return v5;
}

- (CGRect)visibleScreenCoordinatesForSleeve
{
  v2 = [(CSMagSafeAccessoryConfiguration *)self layoutStrategy];
  id v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 bounds];
  objc_msgSend(v2, "suggestedVisibleFrameForSleeveInScreenCoordinates:forceCenteredX:", 1);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)timeLabelBaselineY
{
  int v3 = __sb__runningInSpringBoard();
  uint64_t v4 = (uint64_t)&CSTimeLabelPortraitBaselineY;
  if (v3)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v5 = 0;
      int v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v120 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v120 userInterfaceIdiom] != 1)
    {
      uint64_t v5 = 0;
      int v6 = 1;
      goto LABEL_10;
    }
  }
  int v6 = v3 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v121 = [MEMORY[0x1E4F42D90] mainScreen];
      [v121 _referenceBounds];
    }
    uint64_t v5 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v28 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v27 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v143 = v7 ^ 1;
      int v144 = v6;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      int v129 = 0;
      int v136 = 0;
      uint64_t v126 = 0;
      int v137 = 0;
      int v138 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      int v139 = 0;
      uint64_t v123 = 0;
      int v140 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v141 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D85061F0;
      goto LABEL_67;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_10:
  int v8 = __sb__runningInSpringBoard();
  int v143 = v5;
  int v144 = v6;
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v9 = 0;
      int v10 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v119 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v119 userInterfaceIdiom] != 1)
    {
      int v9 = 0;
      int v10 = 1;
      goto LABEL_19;
    }
  }
  int v10 = v8 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v111 = [MEMORY[0x1E4F42D90] mainScreen];
      [v111 _referenceBounds];
    }
    int v9 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v30 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      int v140 = v7 ^ 1;
      int v141 = v10;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      int v129 = 0;
      int v136 = 0;
      uint64_t v126 = 0;
      int v137 = 0;
      int v138 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      int v139 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506218;
      goto LABEL_67;
    }
  }
  else
  {
    int v9 = 0;
  }
LABEL_19:
  int v11 = __sb__runningInSpringBoard();
  int v140 = v9;
  int v141 = v10;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v12 = 0;
      int v13 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    v118 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v118 userInterfaceIdiom] != 1)
    {
      int v12 = 0;
      int v13 = 1;
      goto LABEL_28;
    }
  }
  int v13 = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v110 = [MEMORY[0x1E4F42D90] mainScreen];
      [v110 _referenceBounds];
    }
    int v12 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      int v138 = v7 ^ 1;
      int v139 = v13;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      int v129 = 0;
      int v136 = 0;
      uint64_t v126 = 0;
      int v137 = 0;
      uint64_t v125 = 0;
      uint64_t v124 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506208;
      goto LABEL_67;
    }
  }
  else
  {
    int v12 = 0;
  }
LABEL_28:
  int v14 = __sb__runningInSpringBoard();
  int v138 = v12;
  int v139 = v13;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v15 = 0;
      uint64_t v2 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    v117 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v117 userInterfaceIdiom] != 1)
    {
      int v15 = 0;
      uint64_t v2 = 1;
      goto LABEL_37;
    }
  }
  uint64_t v2 = v14 ^ 1u;
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v114 = [MEMORY[0x1E4F42D90] mainScreen];
    [v114 _referenceBounds];
  }
  int v15 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v16 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v136 = v7 ^ 1;
    int v137 = v2;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    long long v135 = 0uLL;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v142 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506210;
    goto LABEL_67;
  }
LABEL_37:
  int v17 = __sb__runningInSpringBoard();
  int v136 = v15;
  int v137 = v2;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v142 = 0;
      uint64_t v4 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    v116 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v116 userInterfaceIdiom] != 1)
    {
      int v142 = 0;
      uint64_t v4 = 1;
      goto LABEL_47;
    }
  }
  uint64_t v4 = v17 ^ 1u;
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v112 = [MEMORY[0x1E4F42D90] mainScreen];
    [v112 _referenceBounds];
  }
  int v142 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    DWORD2(v135) = 0;
    HIDWORD(v135) = v4;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    *(void *)&long long v135 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506200;
    goto LABEL_67;
  }
LABEL_47:
  int v26 = __sb__runningInSpringBoard();
  HIDWORD(v135) = v4;
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)((char *)&v135 + 4) = 0;
      goto LABEL_178;
    }
  }
  else
  {
    v115 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v115 userInterfaceIdiom] != 1)
    {
      *(void *)((char *)&v135 + 4) = 0x100000000;
      goto LABEL_178;
    }
  }
  DWORD2(v135) = v26 ^ 1;
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v109 = [MEMORY[0x1E4F42D90] mainScreen];
    [v109 _referenceBounds];
  }
  DWORD1(v135) = v7 ^ 1;
  BSSizeRoundForScale();
  if (v34 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    LODWORD(v135) = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85061F8;
    goto LABEL_67;
  }
LABEL_178:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_180;
    }
LABEL_186:
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85061E8;
    LODWORD(v135) = v7 ^ 1;
    goto LABEL_67;
  }
  v113 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v113 userInterfaceIdiom] == 1) {
    goto LABEL_186;
  }
LABEL_180:
  LODWORD(v135) = v7 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_184:
    *(void *)v134 = 0;
    goto LABEL_194;
  }
  int v35 = __sb__runningInSpringBoard();
  if (v35)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_184;
    }
  }
  else
  {
    v107 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v107 userInterfaceIdiom])
    {
      *(void *)v134 = 1;
      goto LABEL_194;
    }
  }
  *(_DWORD *)v134 = v35 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v100 = [MEMORY[0x1E4F42D90] mainScreen];
      [v100 _referenceBounds];
    }
    *(_DWORD *)&v134[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v38 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      memset(v133, 0, sizeof(v133));
      *(_DWORD *)&v134[8] = 0;
      memset(v132, 0, sizeof(v132));
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D85061C8;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v134[4] = 0;
  }
LABEL_194:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 0;
      goto LABEL_204;
    }
  }
  else
  {
    v108 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v108 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 1;
      goto LABEL_204;
    }
  }
  *(_DWORD *)&v134[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v103 = [MEMORY[0x1E4F42D90] mainScreen];
      [v103 _referenceBounds];
    }
    *(_DWORD *)&v133[36] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v36 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_208;
    }
  }
  else
  {
    *(_DWORD *)&v133[36] = 0;
  }
LABEL_204:
  if (_SBF_Private_IsD94Like())
  {
    memset(v133, 0, 36);
    memset(v132, 0, sizeof(v132));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85061D0;
    goto LABEL_67;
  }
LABEL_208:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_212:
    *(void *)&v133[28] = 0;
    goto LABEL_222;
  }
  int v37 = __sb__runningInSpringBoard();
  if (v37)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_212;
    }
  }
  else
  {
    v104 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v104 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[28] = 0;
      *(_DWORD *)&v133[32] = 1;
      goto LABEL_222;
    }
  }
  *(_DWORD *)&v133[32] = v37 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v95 = [MEMORY[0x1E4F42D90] mainScreen];
      [v95 _referenceBounds];
    }
    *(_DWORD *)&v133[28] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v43 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v133, 0, 28);
      memset(v132, 0, sizeof(v132));
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D85061D8;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[28] = 0;
  }
LABEL_222:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[24] = 0;
      *(_DWORD *)&v133[16] = 0;
      goto LABEL_232;
    }
  }
  else
  {
    v106 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v106 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[16] = 0;
      *(_DWORD *)&v133[24] = 1;
      goto LABEL_232;
    }
  }
  *(_DWORD *)&v133[24] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v99 = [MEMORY[0x1E4F42D90] mainScreen];
      [v99 _referenceBounds];
    }
    *(_DWORD *)&v133[16] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v39 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_236;
    }
  }
  else
  {
    *(_DWORD *)&v133[16] = 0;
  }
LABEL_232:
  if (_SBF_Private_IsD64Like())
  {
    *(_DWORD *)&v133[20] = 0;
    *(_OWORD *)v133 = 0uLL;
    memset(v132, 0, sizeof(v132));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85061E0;
    goto LABEL_67;
  }
LABEL_236:
  int v40 = __sb__runningInSpringBoard();
  if (v40)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[20] = 0;
      *(_DWORD *)&v133[12] = 0;
      goto LABEL_246;
    }
  }
  else
  {
    v105 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v105 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[12] = 0;
      *(_DWORD *)&v133[20] = 1;
      goto LABEL_246;
    }
  }
  *(_DWORD *)&v133[20] = v40 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v96 = [MEMORY[0x1E4F42D90] mainScreen];
      [v96 _referenceBounds];
    }
    uint64_t v7 = v41 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[12] = v7;
    if (v42 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      *(void *)v133 = 0;
      memset(v132, 0, sizeof(v132));
      *(_DWORD *)&v133[8] = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D85061B8;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[12] = 0;
  }
LABEL_246:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v133 = 0;
      *(_DWORD *)v132 = 0;
      goto LABEL_256;
    }
  }
  else
  {
    v102 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v102 userInterfaceIdiom])
    {
      *(_DWORD *)v132 = 0;
      *(_DWORD *)v133 = 1;
      goto LABEL_256;
    }
  }
  *(_DWORD *)v133 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v94 = [MEMORY[0x1E4F42D90] mainScreen];
      [v94 _referenceBounds];
    }
    *(_DWORD *)v132 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v44 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_266;
    }
  }
  else
  {
    *(_DWORD *)v132 = 0;
  }
LABEL_256:
  if (_SBF_Private_IsD54())
  {
    *(void *)&v133[4] = 0;
    *(void *)&v132[4] = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85061C0;
    goto LABEL_67;
  }
LABEL_266:
  int v45 = __sb__runningInSpringBoard();
  if (v45)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v133[4] = 0;
      goto LABEL_276;
    }
  }
  else
  {
    v101 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v101 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[4] = 0;
      *(_DWORD *)&v133[8] = 1;
      goto LABEL_276;
    }
  }
  *(_DWORD *)&v133[8] = v45 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v46 = __sb__runningInSpringBoard();
    if (v46)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v91 = [MEMORY[0x1E4F42D90] mainScreen];
      [v91 _referenceBounds];
    }
    uint64_t v7 = v46 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[4] = v7;
    if (v47 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(void *)&v132[4] = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506188;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[4] = 0;
  }
LABEL_276:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v132[4] = 0;
      goto LABEL_286;
    }
  }
  else
  {
    v98 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v98 userInterfaceIdiom])
    {
      *(_DWORD *)&v132[4] = 0;
      *(_DWORD *)&v132[8] = 1;
      goto LABEL_286;
    }
  }
  *(_DWORD *)&v132[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v90 = [MEMORY[0x1E4F42D90] mainScreen];
      [v90 _referenceBounds];
    }
    *(_DWORD *)&v132[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v48 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_295;
    }
  }
  else
  {
    *(_DWORD *)&v132[4] = 0;
  }
LABEL_286:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506190;
    goto LABEL_67;
  }
LABEL_295:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_299:
    uint64_t v130 = 0;
    goto LABEL_306;
  }
  int v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_299;
    }
  }
  else
  {
    v93 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v93 userInterfaceIdiom])
    {
      uint64_t v130 = 0x100000000;
      goto LABEL_306;
    }
  }
  HIDWORD(v130) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v50 = __sb__runningInSpringBoard();
    if (v50)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v84 = [MEMORY[0x1E4F42D90] mainScreen];
      [v84 _referenceBounds];
    }
    uint64_t v7 = v50 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v130) = v7;
    if (v55 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506178;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v130) = 0;
  }
LABEL_306:
  int v51 = __sb__runningInSpringBoard();
  if (v51)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v131) = 0;
      uint64_t v7 = 0;
      goto LABEL_316;
    }
  }
  else
  {
    v97 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v97 userInterfaceIdiom])
    {
      uint64_t v7 = 0;
      HIDWORD(v131) = 1;
      goto LABEL_316;
    }
  }
  HIDWORD(v131) = v51 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v87 = [MEMORY[0x1E4F42D90] mainScreen];
      [v87 _referenceBounds];
    }
    uint64_t v7 = v52 ^ 1u;
    BSSizeRoundForScale();
    if (v53 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_320;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_316:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v131) = v7;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506180;
    goto LABEL_67;
  }
LABEL_320:
  LODWORD(v131) = v7;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_324:
    uint64_t v128 = 0;
    goto LABEL_334;
  }
  int v54 = __sb__runningInSpringBoard();
  if (v54)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_324;
    }
  }
  else
  {
    v88 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v88 userInterfaceIdiom])
    {
      uint64_t v128 = 0x100000000;
      goto LABEL_334;
    }
  }
  HIDWORD(v128) = v54 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v80 = [MEMORY[0x1E4F42D90] mainScreen];
      [v80 _referenceBounds];
    }
    LODWORD(v128) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v60 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v129 = 0;
      uint64_t v127 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D85061A8;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v128) = 0;
  }
LABEL_334:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v129 = 0;
      HIDWORD(v127) = 0;
      goto LABEL_344;
    }
  }
  else
  {
    v92 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v92 userInterfaceIdiom])
    {
      HIDWORD(v127) = 0;
      int v129 = 1;
      goto LABEL_344;
    }
  }
  int v129 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v83 = [MEMORY[0x1E4F42D90] mainScreen];
      [v83 _referenceBounds];
    }
    HIDWORD(v127) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v56 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_348;
    }
  }
  else
  {
    HIDWORD(v127) = 0;
  }
LABEL_344:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v127) = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85061B0;
    goto LABEL_67;
  }
LABEL_348:
  int v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v127) = 0;
      HIDWORD(v124) = 0;
      goto LABEL_358;
    }
  }
  else
  {
    v89 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v89 userInterfaceIdiom])
    {
      HIDWORD(v124) = 0;
      LODWORD(v127) = 1;
      goto LABEL_358;
    }
  }
  LODWORD(v127) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v58 = __sb__runningInSpringBoard();
    if (v58)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v81 = [MEMORY[0x1E4F42D90] mainScreen];
      [v81 _referenceBounds];
    }
    uint64_t v7 = v58 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v124) = v7;
    if (v59 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      LODWORD(v124) = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506198;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v124) = 0;
  }
LABEL_358:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v126 = 0;
      goto LABEL_368;
    }
  }
  else
  {
    v86 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v86 userInterfaceIdiom])
    {
      uint64_t v126 = 0x100000000;
      goto LABEL_368;
    }
  }
  HIDWORD(v126) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v79 = [MEMORY[0x1E4F42D90] mainScreen];
      [v79 _referenceBounds];
    }
    LODWORD(v126) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v61 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_378;
    }
  }
  else
  {
    LODWORD(v126) = 0;
  }
LABEL_368:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    uint64_t v125 = 0;
    LODWORD(v124) = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85061A0;
    goto LABEL_67;
  }
LABEL_378:
  int v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v125) = 0;
      LODWORD(v124) = 0;
      goto LABEL_388;
    }
  }
  else
  {
    v85 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v85 userInterfaceIdiom])
    {
      LODWORD(v124) = 0;
      HIDWORD(v125) = 1;
      goto LABEL_388;
    }
  }
  HIDWORD(v125) = v62 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v78 = [MEMORY[0x1E4F42D90] mainScreen];
      [v78 _referenceBounds];
    }
    LODWORD(v124) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      uint64_t v123 = 0;
      LODWORD(v125) = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506168;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v124) = 0;
  }
LABEL_388:
  int v63 = __sb__runningInSpringBoard();
  if (v63)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v123) = 0;
      uint64_t v7 = 0;
      goto LABEL_398;
    }
  }
  else
  {
    v82 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v82 userInterfaceIdiom])
    {
      uint64_t v7 = 0;
      HIDWORD(v123) = 1;
      goto LABEL_398;
    }
  }
  HIDWORD(v123) = v63 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v64 = __sb__runningInSpringBoard();
    if (v64)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v77 = [MEMORY[0x1E4F42D90] mainScreen];
      [v77 _referenceBounds];
    }
    uint64_t v7 = v64 ^ 1u;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_405;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_398:
  if (_SBF_Private_IsD53())
  {
    LODWORD(v125) = v7;
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506170;
    goto LABEL_67;
  }
LABEL_405:
  LODWORD(v125) = v7;
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506148;
    goto LABEL_67;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506150;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506138;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506140;
    goto LABEL_67;
  }
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v123) = 0;
      int v122 = 0;
      goto LABEL_425;
    }
  }
  else
  {
    v76 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v76 userInterfaceIdiom])
    {
      int v122 = 0;
      LODWORD(v123) = 1;
      goto LABEL_425;
    }
  }
  LODWORD(v123) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v74 = [MEMORY[0x1E4F42D90] mainScreen];
      [v74 _referenceBounds];
    }
    int v122 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v69 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506158;
      goto LABEL_67;
    }
  }
  else
  {
    int v122 = 0;
  }
LABEL_425:
  int v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v18 = 0;
      int v19 = 0;
      goto LABEL_435;
    }
  }
  else
  {
    v75 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v75 userInterfaceIdiom])
    {
      int v19 = 0;
      int v18 = 1;
      goto LABEL_435;
    }
  }
  int v18 = v67 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v73 = [MEMORY[0x1E4F42D90] mainScreen];
      [v73 _referenceBounds];
    }
    int v19 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v70 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506160;
      goto LABEL_67;
    }
  }
  else
  {
    int v19 = 0;
  }
LABEL_435:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v20 = 0;
      int v21 = 0;
      goto LABEL_445;
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v7 userInterfaceIdiom])
    {
      int v21 = 0;
      int v20 = 1;
      goto LABEL_445;
    }
  }
  int v20 = v5 ^ 1;
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v2 _referenceBounds];
  }
  int v21 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v68 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506130;
    goto LABEL_67;
  }
LABEL_445:
  uint64_t v4 = __sb__runningInSpringBoard();
  if (v4)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v22 = 0;
      int v23 = 0;
LABEL_462:
      v24 = &CSTimeLabelPortraitBaselineY;
      goto LABEL_67;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v5 userInterfaceIdiom])
    {
      int v23 = 0;
      int v22 = 1;
      goto LABEL_462;
    }
  }
  int v22 = v4 ^ 1;
  int v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v4 _referenceBounds];
  }
  int v23 = v71 ^ 1;
  BSSizeRoundForScale();
  if (v72 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_462;
  }
  v24 = &qword_1D8506128;
LABEL_67:
  double v32 = *(double *)v24;
  if (v23) {

  }
  if (v22) {
  if (v21)
  }

  if (v20) {
  if (v19)
  }

  if (v18) {
  if (v122)
  }

  if (v123) {
  if (v125)
  }

  if (HIDWORD(v123)) {
  if (v124)
  }

  if (HIDWORD(v125)) {
  if (v126)
  }

  if (HIDWORD(v126)) {
  if (HIDWORD(v124))
  }

  if (v127) {
  if (HIDWORD(v127))
  }

  if (v129) {
  if (v128)
  }

  if (HIDWORD(v128)) {
  if (v131)
  }

  if (HIDWORD(v131)) {
  if (v130)
  }

  if (HIDWORD(v130)) {
  if (*(_DWORD *)&v132[4])
  }

  if (*(_DWORD *)&v132[8]) {
  if (*(_DWORD *)&v133[4])
  }

  if (*(_DWORD *)&v133[8]) {
  if (*(_DWORD *)v132)
  }

  if (*(_DWORD *)v133) {
  if (*(_DWORD *)&v133[12])
  }

  if (*(_DWORD *)&v133[20]) {
  if (*(_DWORD *)&v133[16])
  }

  if (*(_DWORD *)&v133[24]) {
  if (*(_DWORD *)&v133[28])
  }

  if (*(_DWORD *)&v133[32]) {
  if (*(_DWORD *)&v133[36])
  }

  if (*(_DWORD *)&v134[8]) {
  if (*(_DWORD *)&v134[4])
  }

  if (*(_DWORD *)v134) {
  if (v135)
  }

  if (DWORD1(v135)) {
  if (DWORD2(v135))
  }

  if (v142)
  {

    if (!HIDWORD(v135)) {
      goto LABEL_155;
    }
  }
  else if (!HIDWORD(v135))
  {
LABEL_155:
    if (v136) {
      goto LABEL_156;
    }
    goto LABEL_166;
  }

  if (v136)
  {
LABEL_156:

    if (!v137) {
      goto LABEL_157;
    }
    goto LABEL_167;
  }
LABEL_166:
  if (!v137)
  {
LABEL_157:
    if (v138) {
      goto LABEL_158;
    }
    goto LABEL_168;
  }
LABEL_167:

  if (v138)
  {
LABEL_158:

    if (!v139) {
      goto LABEL_159;
    }
    goto LABEL_169;
  }
LABEL_168:
  if (!v139)
  {
LABEL_159:
    if (v140) {
      goto LABEL_160;
    }
    goto LABEL_170;
  }
LABEL_169:

  if (v140)
  {
LABEL_160:

    if (!v141) {
      goto LABEL_161;
    }
    goto LABEL_171;
  }
LABEL_170:
  if (!v141)
  {
LABEL_161:
    if (v143) {
      goto LABEL_162;
    }
    goto LABEL_172;
  }
LABEL_171:

  if (v143)
  {
LABEL_162:

    if (!v144) {
      return v32;
    }
    goto LABEL_173;
  }
LABEL_172:
  if (v144) {
LABEL_173:
  }

  return v32;
}

- (double)windowedAccessoryInset
{
  int v3 = __sb__runningInSpringBoard();
  uint64_t v4 = (uint64_t)&CSWindowedAccessoryInset;
  if (v3)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v5 = 0;
      int v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v120 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v120 userInterfaceIdiom] != 1)
    {
      uint64_t v5 = 0;
      int v6 = 1;
      goto LABEL_10;
    }
  }
  int v6 = v3 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v121 = [MEMORY[0x1E4F42D90] mainScreen];
      [v121 _referenceBounds];
    }
    uint64_t v5 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v28 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v27 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v143 = v7 ^ 1;
      int v144 = v6;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      int v129 = 0;
      int v136 = 0;
      uint64_t v126 = 0;
      int v137 = 0;
      int v138 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      int v139 = 0;
      uint64_t v123 = 0;
      int v140 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v141 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D85065F0;
      goto LABEL_67;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_10:
  int v8 = __sb__runningInSpringBoard();
  int v143 = v5;
  int v144 = v6;
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v9 = 0;
      int v10 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v119 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v119 userInterfaceIdiom] != 1)
    {
      int v9 = 0;
      int v10 = 1;
      goto LABEL_19;
    }
  }
  int v10 = v8 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v111 = [MEMORY[0x1E4F42D90] mainScreen];
      [v111 _referenceBounds];
    }
    int v9 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v30 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      int v140 = v7 ^ 1;
      int v141 = v10;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      int v129 = 0;
      int v136 = 0;
      uint64_t v126 = 0;
      int v137 = 0;
      int v138 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      int v139 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506618;
      goto LABEL_67;
    }
  }
  else
  {
    int v9 = 0;
  }
LABEL_19:
  int v11 = __sb__runningInSpringBoard();
  int v140 = v9;
  int v141 = v10;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v12 = 0;
      int v13 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    v118 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v118 userInterfaceIdiom] != 1)
    {
      int v12 = 0;
      int v13 = 1;
      goto LABEL_28;
    }
  }
  int v13 = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v110 = [MEMORY[0x1E4F42D90] mainScreen];
      [v110 _referenceBounds];
    }
    int v12 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      int v138 = v7 ^ 1;
      int v139 = v13;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      int v129 = 0;
      int v136 = 0;
      uint64_t v126 = 0;
      int v137 = 0;
      uint64_t v125 = 0;
      uint64_t v124 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506608;
      goto LABEL_67;
    }
  }
  else
  {
    int v12 = 0;
  }
LABEL_28:
  int v14 = __sb__runningInSpringBoard();
  int v138 = v12;
  int v139 = v13;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v15 = 0;
      uint64_t v2 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    v117 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v117 userInterfaceIdiom] != 1)
    {
      int v15 = 0;
      uint64_t v2 = 1;
      goto LABEL_37;
    }
  }
  uint64_t v2 = v14 ^ 1u;
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v114 = [MEMORY[0x1E4F42D90] mainScreen];
    [v114 _referenceBounds];
  }
  int v15 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v16 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v136 = v7 ^ 1;
    int v137 = v2;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    long long v135 = 0uLL;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v142 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506610;
    goto LABEL_67;
  }
LABEL_37:
  int v17 = __sb__runningInSpringBoard();
  int v136 = v15;
  int v137 = v2;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v142 = 0;
      uint64_t v4 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    v116 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v116 userInterfaceIdiom] != 1)
    {
      int v142 = 0;
      uint64_t v4 = 1;
      goto LABEL_47;
    }
  }
  uint64_t v4 = v17 ^ 1u;
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v112 = [MEMORY[0x1E4F42D90] mainScreen];
    [v112 _referenceBounds];
  }
  int v142 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    DWORD2(v135) = 0;
    HIDWORD(v135) = v4;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    *(void *)&long long v135 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506600;
    goto LABEL_67;
  }
LABEL_47:
  int v26 = __sb__runningInSpringBoard();
  HIDWORD(v135) = v4;
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)((char *)&v135 + 4) = 0;
      goto LABEL_178;
    }
  }
  else
  {
    v115 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v115 userInterfaceIdiom] != 1)
    {
      *(void *)((char *)&v135 + 4) = 0x100000000;
      goto LABEL_178;
    }
  }
  DWORD2(v135) = v26 ^ 1;
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v109 = [MEMORY[0x1E4F42D90] mainScreen];
    [v109 _referenceBounds];
  }
  DWORD1(v135) = v7 ^ 1;
  BSSizeRoundForScale();
  if (v34 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    LODWORD(v135) = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85065F8;
    goto LABEL_67;
  }
LABEL_178:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_180;
    }
LABEL_186:
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85065E8;
    LODWORD(v135) = v7 ^ 1;
    goto LABEL_67;
  }
  v113 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v113 userInterfaceIdiom] == 1) {
    goto LABEL_186;
  }
LABEL_180:
  LODWORD(v135) = v7 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_184:
    *(void *)v134 = 0;
    goto LABEL_194;
  }
  int v35 = __sb__runningInSpringBoard();
  if (v35)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_184;
    }
  }
  else
  {
    v107 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v107 userInterfaceIdiom])
    {
      *(void *)v134 = 1;
      goto LABEL_194;
    }
  }
  *(_DWORD *)v134 = v35 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v100 = [MEMORY[0x1E4F42D90] mainScreen];
      [v100 _referenceBounds];
    }
    *(_DWORD *)&v134[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v38 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      memset(v133, 0, sizeof(v133));
      *(_DWORD *)&v134[8] = 0;
      memset(v132, 0, sizeof(v132));
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D85065C8;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v134[4] = 0;
  }
LABEL_194:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 0;
      goto LABEL_204;
    }
  }
  else
  {
    v108 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v108 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 1;
      goto LABEL_204;
    }
  }
  *(_DWORD *)&v134[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v103 = [MEMORY[0x1E4F42D90] mainScreen];
      [v103 _referenceBounds];
    }
    *(_DWORD *)&v133[36] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v36 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_208;
    }
  }
  else
  {
    *(_DWORD *)&v133[36] = 0;
  }
LABEL_204:
  if (_SBF_Private_IsD94Like())
  {
    memset(v133, 0, 36);
    memset(v132, 0, sizeof(v132));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85065D0;
    goto LABEL_67;
  }
LABEL_208:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_212:
    *(void *)&v133[28] = 0;
    goto LABEL_222;
  }
  int v37 = __sb__runningInSpringBoard();
  if (v37)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_212;
    }
  }
  else
  {
    v104 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v104 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[28] = 0;
      *(_DWORD *)&v133[32] = 1;
      goto LABEL_222;
    }
  }
  *(_DWORD *)&v133[32] = v37 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v95 = [MEMORY[0x1E4F42D90] mainScreen];
      [v95 _referenceBounds];
    }
    *(_DWORD *)&v133[28] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v43 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v133, 0, 28);
      memset(v132, 0, sizeof(v132));
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D85065D8;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[28] = 0;
  }
LABEL_222:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[24] = 0;
      *(_DWORD *)&v133[16] = 0;
      goto LABEL_232;
    }
  }
  else
  {
    v106 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v106 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[16] = 0;
      *(_DWORD *)&v133[24] = 1;
      goto LABEL_232;
    }
  }
  *(_DWORD *)&v133[24] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v99 = [MEMORY[0x1E4F42D90] mainScreen];
      [v99 _referenceBounds];
    }
    *(_DWORD *)&v133[16] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v39 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_236;
    }
  }
  else
  {
    *(_DWORD *)&v133[16] = 0;
  }
LABEL_232:
  if (_SBF_Private_IsD64Like())
  {
    *(_DWORD *)&v133[20] = 0;
    *(_OWORD *)v133 = 0uLL;
    memset(v132, 0, sizeof(v132));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85065E0;
    goto LABEL_67;
  }
LABEL_236:
  int v40 = __sb__runningInSpringBoard();
  if (v40)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[20] = 0;
      *(_DWORD *)&v133[12] = 0;
      goto LABEL_246;
    }
  }
  else
  {
    v105 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v105 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[12] = 0;
      *(_DWORD *)&v133[20] = 1;
      goto LABEL_246;
    }
  }
  *(_DWORD *)&v133[20] = v40 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v96 = [MEMORY[0x1E4F42D90] mainScreen];
      [v96 _referenceBounds];
    }
    uint64_t v7 = v41 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[12] = v7;
    if (v42 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      *(void *)v133 = 0;
      memset(v132, 0, sizeof(v132));
      *(_DWORD *)&v133[8] = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D85065B8;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[12] = 0;
  }
LABEL_246:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v133 = 0;
      *(_DWORD *)v132 = 0;
      goto LABEL_256;
    }
  }
  else
  {
    v102 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v102 userInterfaceIdiom])
    {
      *(_DWORD *)v132 = 0;
      *(_DWORD *)v133 = 1;
      goto LABEL_256;
    }
  }
  *(_DWORD *)v133 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v94 = [MEMORY[0x1E4F42D90] mainScreen];
      [v94 _referenceBounds];
    }
    *(_DWORD *)v132 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v44 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_266;
    }
  }
  else
  {
    *(_DWORD *)v132 = 0;
  }
LABEL_256:
  if (_SBF_Private_IsD54())
  {
    *(void *)&v133[4] = 0;
    *(void *)&v132[4] = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85065C0;
    goto LABEL_67;
  }
LABEL_266:
  int v45 = __sb__runningInSpringBoard();
  if (v45)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v133[4] = 0;
      goto LABEL_276;
    }
  }
  else
  {
    v101 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v101 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[4] = 0;
      *(_DWORD *)&v133[8] = 1;
      goto LABEL_276;
    }
  }
  *(_DWORD *)&v133[8] = v45 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v46 = __sb__runningInSpringBoard();
    if (v46)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v91 = [MEMORY[0x1E4F42D90] mainScreen];
      [v91 _referenceBounds];
    }
    uint64_t v7 = v46 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[4] = v7;
    if (v47 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(void *)&v132[4] = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506588;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[4] = 0;
  }
LABEL_276:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v132[4] = 0;
      goto LABEL_286;
    }
  }
  else
  {
    v98 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v98 userInterfaceIdiom])
    {
      *(_DWORD *)&v132[4] = 0;
      *(_DWORD *)&v132[8] = 1;
      goto LABEL_286;
    }
  }
  *(_DWORD *)&v132[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v90 = [MEMORY[0x1E4F42D90] mainScreen];
      [v90 _referenceBounds];
    }
    *(_DWORD *)&v132[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v48 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_295;
    }
  }
  else
  {
    *(_DWORD *)&v132[4] = 0;
  }
LABEL_286:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506590;
    goto LABEL_67;
  }
LABEL_295:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_299:
    uint64_t v130 = 0;
    goto LABEL_306;
  }
  int v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_299;
    }
  }
  else
  {
    v93 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v93 userInterfaceIdiom])
    {
      uint64_t v130 = 0x100000000;
      goto LABEL_306;
    }
  }
  HIDWORD(v130) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v50 = __sb__runningInSpringBoard();
    if (v50)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v84 = [MEMORY[0x1E4F42D90] mainScreen];
      [v84 _referenceBounds];
    }
    uint64_t v7 = v50 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v130) = v7;
    if (v55 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506578;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v130) = 0;
  }
LABEL_306:
  int v51 = __sb__runningInSpringBoard();
  if (v51)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v131) = 0;
      uint64_t v7 = 0;
      goto LABEL_316;
    }
  }
  else
  {
    v97 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v97 userInterfaceIdiom])
    {
      uint64_t v7 = 0;
      HIDWORD(v131) = 1;
      goto LABEL_316;
    }
  }
  HIDWORD(v131) = v51 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v87 = [MEMORY[0x1E4F42D90] mainScreen];
      [v87 _referenceBounds];
    }
    uint64_t v7 = v52 ^ 1u;
    BSSizeRoundForScale();
    if (v53 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_320;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_316:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v131) = v7;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506580;
    goto LABEL_67;
  }
LABEL_320:
  LODWORD(v131) = v7;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_324:
    uint64_t v128 = 0;
    goto LABEL_334;
  }
  int v54 = __sb__runningInSpringBoard();
  if (v54)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_324;
    }
  }
  else
  {
    v88 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v88 userInterfaceIdiom])
    {
      uint64_t v128 = 0x100000000;
      goto LABEL_334;
    }
  }
  HIDWORD(v128) = v54 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v80 = [MEMORY[0x1E4F42D90] mainScreen];
      [v80 _referenceBounds];
    }
    LODWORD(v128) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v60 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v129 = 0;
      uint64_t v127 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D85065A8;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v128) = 0;
  }
LABEL_334:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v129 = 0;
      HIDWORD(v127) = 0;
      goto LABEL_344;
    }
  }
  else
  {
    v92 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v92 userInterfaceIdiom])
    {
      HIDWORD(v127) = 0;
      int v129 = 1;
      goto LABEL_344;
    }
  }
  int v129 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v83 = [MEMORY[0x1E4F42D90] mainScreen];
      [v83 _referenceBounds];
    }
    HIDWORD(v127) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v56 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_348;
    }
  }
  else
  {
    HIDWORD(v127) = 0;
  }
LABEL_344:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v127) = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85065B0;
    goto LABEL_67;
  }
LABEL_348:
  int v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v127) = 0;
      HIDWORD(v124) = 0;
      goto LABEL_358;
    }
  }
  else
  {
    v89 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v89 userInterfaceIdiom])
    {
      HIDWORD(v124) = 0;
      LODWORD(v127) = 1;
      goto LABEL_358;
    }
  }
  LODWORD(v127) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v58 = __sb__runningInSpringBoard();
    if (v58)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v81 = [MEMORY[0x1E4F42D90] mainScreen];
      [v81 _referenceBounds];
    }
    uint64_t v7 = v58 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v124) = v7;
    if (v59 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      LODWORD(v124) = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506598;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v124) = 0;
  }
LABEL_358:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v126 = 0;
      goto LABEL_368;
    }
  }
  else
  {
    v86 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v86 userInterfaceIdiom])
    {
      uint64_t v126 = 0x100000000;
      goto LABEL_368;
    }
  }
  HIDWORD(v126) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v79 = [MEMORY[0x1E4F42D90] mainScreen];
      [v79 _referenceBounds];
    }
    LODWORD(v126) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v61 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_378;
    }
  }
  else
  {
    LODWORD(v126) = 0;
  }
LABEL_368:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    uint64_t v125 = 0;
    LODWORD(v124) = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85065A0;
    goto LABEL_67;
  }
LABEL_378:
  int v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v125) = 0;
      LODWORD(v124) = 0;
      goto LABEL_388;
    }
  }
  else
  {
    v85 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v85 userInterfaceIdiom])
    {
      LODWORD(v124) = 0;
      HIDWORD(v125) = 1;
      goto LABEL_388;
    }
  }
  HIDWORD(v125) = v62 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v78 = [MEMORY[0x1E4F42D90] mainScreen];
      [v78 _referenceBounds];
    }
    LODWORD(v124) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      uint64_t v123 = 0;
      LODWORD(v125) = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506568;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v124) = 0;
  }
LABEL_388:
  int v63 = __sb__runningInSpringBoard();
  if (v63)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v123) = 0;
      uint64_t v7 = 0;
      goto LABEL_398;
    }
  }
  else
  {
    v82 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v82 userInterfaceIdiom])
    {
      uint64_t v7 = 0;
      HIDWORD(v123) = 1;
      goto LABEL_398;
    }
  }
  HIDWORD(v123) = v63 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v64 = __sb__runningInSpringBoard();
    if (v64)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v77 = [MEMORY[0x1E4F42D90] mainScreen];
      [v77 _referenceBounds];
    }
    uint64_t v7 = v64 ^ 1u;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_405;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_398:
  if (_SBF_Private_IsD53())
  {
    LODWORD(v125) = v7;
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506570;
    goto LABEL_67;
  }
LABEL_405:
  LODWORD(v125) = v7;
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506548;
    goto LABEL_67;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506550;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506538;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506540;
    goto LABEL_67;
  }
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v123) = 0;
      int v122 = 0;
      goto LABEL_425;
    }
  }
  else
  {
    v76 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v76 userInterfaceIdiom])
    {
      int v122 = 0;
      LODWORD(v123) = 1;
      goto LABEL_425;
    }
  }
  LODWORD(v123) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v74 = [MEMORY[0x1E4F42D90] mainScreen];
      [v74 _referenceBounds];
    }
    int v122 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v69 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506558;
      goto LABEL_67;
    }
  }
  else
  {
    int v122 = 0;
  }
LABEL_425:
  int v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v18 = 0;
      int v19 = 0;
      goto LABEL_435;
    }
  }
  else
  {
    v75 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v75 userInterfaceIdiom])
    {
      int v19 = 0;
      int v18 = 1;
      goto LABEL_435;
    }
  }
  int v18 = v67 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v73 = [MEMORY[0x1E4F42D90] mainScreen];
      [v73 _referenceBounds];
    }
    int v19 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v70 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506560;
      goto LABEL_67;
    }
  }
  else
  {
    int v19 = 0;
  }
LABEL_435:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v20 = 0;
      int v21 = 0;
      goto LABEL_445;
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v7 userInterfaceIdiom])
    {
      int v21 = 0;
      int v20 = 1;
      goto LABEL_445;
    }
  }
  int v20 = v5 ^ 1;
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v2 _referenceBounds];
  }
  int v21 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v68 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506530;
    goto LABEL_67;
  }
LABEL_445:
  uint64_t v4 = __sb__runningInSpringBoard();
  if (v4)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v22 = 0;
      int v23 = 0;
LABEL_462:
      v24 = &CSWindowedAccessoryInset;
      goto LABEL_67;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v5 userInterfaceIdiom])
    {
      int v23 = 0;
      int v22 = 1;
      goto LABEL_462;
    }
  }
  int v22 = v4 ^ 1;
  int v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v4 _referenceBounds];
  }
  int v23 = v71 ^ 1;
  BSSizeRoundForScale();
  if (v72 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_462;
  }
  v24 = &qword_1D8506528;
LABEL_67:
  double v32 = *(double *)v24;
  if (v23) {

  }
  if (v22) {
  if (v21)
  }

  if (v20) {
  if (v19)
  }

  if (v18) {
  if (v122)
  }

  if (v123) {
  if (v125)
  }

  if (HIDWORD(v123)) {
  if (v124)
  }

  if (HIDWORD(v125)) {
  if (v126)
  }

  if (HIDWORD(v126)) {
  if (HIDWORD(v124))
  }

  if (v127) {
  if (HIDWORD(v127))
  }

  if (v129) {
  if (v128)
  }

  if (HIDWORD(v128)) {
  if (v131)
  }

  if (HIDWORD(v131)) {
  if (v130)
  }

  if (HIDWORD(v130)) {
  if (*(_DWORD *)&v132[4])
  }

  if (*(_DWORD *)&v132[8]) {
  if (*(_DWORD *)&v133[4])
  }

  if (*(_DWORD *)&v133[8]) {
  if (*(_DWORD *)v132)
  }

  if (*(_DWORD *)v133) {
  if (*(_DWORD *)&v133[12])
  }

  if (*(_DWORD *)&v133[20]) {
  if (*(_DWORD *)&v133[16])
  }

  if (*(_DWORD *)&v133[24]) {
  if (*(_DWORD *)&v133[28])
  }

  if (*(_DWORD *)&v133[32]) {
  if (*(_DWORD *)&v133[36])
  }

  if (*(_DWORD *)&v134[8]) {
  if (*(_DWORD *)&v134[4])
  }

  if (*(_DWORD *)v134) {
  if (v135)
  }

  if (DWORD1(v135)) {
  if (DWORD2(v135))
  }

  if (v142)
  {

    if (!HIDWORD(v135)) {
      goto LABEL_155;
    }
  }
  else if (!HIDWORD(v135))
  {
LABEL_155:
    if (v136) {
      goto LABEL_156;
    }
    goto LABEL_166;
  }

  if (v136)
  {
LABEL_156:

    if (!v137) {
      goto LABEL_157;
    }
    goto LABEL_167;
  }
LABEL_166:
  if (!v137)
  {
LABEL_157:
    if (v138) {
      goto LABEL_158;
    }
    goto LABEL_168;
  }
LABEL_167:

  if (v138)
  {
LABEL_158:

    if (!v139) {
      goto LABEL_159;
    }
    goto LABEL_169;
  }
LABEL_168:
  if (!v139)
  {
LABEL_159:
    if (v140) {
      goto LABEL_160;
    }
    goto LABEL_170;
  }
LABEL_169:

  if (v140)
  {
LABEL_160:

    if (!v141) {
      goto LABEL_161;
    }
    goto LABEL_171;
  }
LABEL_170:
  if (!v141)
  {
LABEL_161:
    if (v143) {
      goto LABEL_162;
    }
    goto LABEL_172;
  }
LABEL_171:

  if (v143)
  {
LABEL_162:

    if (!v144) {
      return v32;
    }
    goto LABEL_173;
  }
LABEL_172:
  if (v144) {
LABEL_173:
  }

  return v32;
}

- (double)bottomContentInset
{
  return 66.0;
}

- (double)prominentBaselineToListY
{
  int v3 = __sb__runningInSpringBoard();
  uint64_t v4 = (uint64_t)&CSProminentBaselineToListY;
  if (v3)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v5 = 0;
      int v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v120 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v120 userInterfaceIdiom] != 1)
    {
      uint64_t v5 = 0;
      int v6 = 1;
      goto LABEL_10;
    }
  }
  int v6 = v3 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v121 = [MEMORY[0x1E4F42D90] mainScreen];
      [v121 _referenceBounds];
    }
    uint64_t v5 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v28 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v27 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v143 = v7 ^ 1;
      int v144 = v6;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      int v129 = 0;
      int v136 = 0;
      uint64_t v126 = 0;
      int v137 = 0;
      int v138 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      int v139 = 0;
      uint64_t v123 = 0;
      int v140 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v141 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D85063F0;
      goto LABEL_67;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_10:
  int v8 = __sb__runningInSpringBoard();
  int v143 = v5;
  int v144 = v6;
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v9 = 0;
      int v10 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v119 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v119 userInterfaceIdiom] != 1)
    {
      int v9 = 0;
      int v10 = 1;
      goto LABEL_19;
    }
  }
  int v10 = v8 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v111 = [MEMORY[0x1E4F42D90] mainScreen];
      [v111 _referenceBounds];
    }
    int v9 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v30 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      int v140 = v7 ^ 1;
      int v141 = v10;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      int v129 = 0;
      int v136 = 0;
      uint64_t v126 = 0;
      int v137 = 0;
      int v138 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      int v139 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506418;
      goto LABEL_67;
    }
  }
  else
  {
    int v9 = 0;
  }
LABEL_19:
  int v11 = __sb__runningInSpringBoard();
  int v140 = v9;
  int v141 = v10;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v12 = 0;
      int v13 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    v118 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v118 userInterfaceIdiom] != 1)
    {
      int v12 = 0;
      int v13 = 1;
      goto LABEL_28;
    }
  }
  int v13 = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v110 = [MEMORY[0x1E4F42D90] mainScreen];
      [v110 _referenceBounds];
    }
    int v12 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      int v138 = v7 ^ 1;
      int v139 = v13;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      long long v135 = 0uLL;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      int v129 = 0;
      int v136 = 0;
      uint64_t v126 = 0;
      int v137 = 0;
      uint64_t v125 = 0;
      uint64_t v124 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506408;
      goto LABEL_67;
    }
  }
  else
  {
    int v12 = 0;
  }
LABEL_28:
  int v14 = __sb__runningInSpringBoard();
  int v138 = v12;
  int v139 = v13;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v15 = 0;
      uint64_t v2 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    v117 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v117 userInterfaceIdiom] != 1)
    {
      int v15 = 0;
      uint64_t v2 = 1;
      goto LABEL_37;
    }
  }
  uint64_t v2 = v14 ^ 1u;
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v114 = [MEMORY[0x1E4F42D90] mainScreen];
    [v114 _referenceBounds];
  }
  int v15 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v16 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v136 = v7 ^ 1;
    int v137 = v2;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    long long v135 = 0uLL;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v142 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506410;
    goto LABEL_67;
  }
LABEL_37:
  int v17 = __sb__runningInSpringBoard();
  int v136 = v15;
  int v137 = v2;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v142 = 0;
      uint64_t v4 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    v116 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v116 userInterfaceIdiom] != 1)
    {
      int v142 = 0;
      uint64_t v4 = 1;
      goto LABEL_47;
    }
  }
  uint64_t v4 = v17 ^ 1u;
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v112 = [MEMORY[0x1E4F42D90] mainScreen];
    [v112 _referenceBounds];
  }
  int v142 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    DWORD2(v135) = 0;
    HIDWORD(v135) = v4;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    *(void *)&long long v135 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506400;
    goto LABEL_67;
  }
LABEL_47:
  int v26 = __sb__runningInSpringBoard();
  HIDWORD(v135) = v4;
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)((char *)&v135 + 4) = 0;
      goto LABEL_178;
    }
  }
  else
  {
    v115 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v115 userInterfaceIdiom] != 1)
    {
      *(void *)((char *)&v135 + 4) = 0x100000000;
      goto LABEL_178;
    }
  }
  DWORD2(v135) = v26 ^ 1;
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v109 = [MEMORY[0x1E4F42D90] mainScreen];
    [v109 _referenceBounds];
  }
  DWORD1(v135) = v7 ^ 1;
  BSSizeRoundForScale();
  if (v34 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    LODWORD(v135) = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85063F8;
    goto LABEL_67;
  }
LABEL_178:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_180;
    }
LABEL_186:
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85063E8;
    LODWORD(v135) = v7 ^ 1;
    goto LABEL_67;
  }
  v113 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v113 userInterfaceIdiom] == 1) {
    goto LABEL_186;
  }
LABEL_180:
  LODWORD(v135) = v7 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_184:
    *(void *)v134 = 0;
    goto LABEL_194;
  }
  int v35 = __sb__runningInSpringBoard();
  if (v35)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_184;
    }
  }
  else
  {
    v107 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v107 userInterfaceIdiom])
    {
      *(void *)v134 = 1;
      goto LABEL_194;
    }
  }
  *(_DWORD *)v134 = v35 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v100 = [MEMORY[0x1E4F42D90] mainScreen];
      [v100 _referenceBounds];
    }
    *(_DWORD *)&v134[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v38 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      memset(v133, 0, sizeof(v133));
      *(_DWORD *)&v134[8] = 0;
      memset(v132, 0, sizeof(v132));
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D85063C8;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v134[4] = 0;
  }
LABEL_194:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 0;
      goto LABEL_204;
    }
  }
  else
  {
    v108 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v108 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 1;
      goto LABEL_204;
    }
  }
  *(_DWORD *)&v134[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v103 = [MEMORY[0x1E4F42D90] mainScreen];
      [v103 _referenceBounds];
    }
    *(_DWORD *)&v133[36] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v36 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_208;
    }
  }
  else
  {
    *(_DWORD *)&v133[36] = 0;
  }
LABEL_204:
  if (_SBF_Private_IsD94Like())
  {
    memset(v133, 0, 36);
    memset(v132, 0, sizeof(v132));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85063D0;
    goto LABEL_67;
  }
LABEL_208:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_212:
    *(void *)&v133[28] = 0;
    goto LABEL_222;
  }
  int v37 = __sb__runningInSpringBoard();
  if (v37)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_212;
    }
  }
  else
  {
    v104 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v104 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[28] = 0;
      *(_DWORD *)&v133[32] = 1;
      goto LABEL_222;
    }
  }
  *(_DWORD *)&v133[32] = v37 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v95 = [MEMORY[0x1E4F42D90] mainScreen];
      [v95 _referenceBounds];
    }
    *(_DWORD *)&v133[28] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v43 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v133, 0, 28);
      memset(v132, 0, sizeof(v132));
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D85063D8;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[28] = 0;
  }
LABEL_222:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[24] = 0;
      *(_DWORD *)&v133[16] = 0;
      goto LABEL_232;
    }
  }
  else
  {
    v106 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v106 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[16] = 0;
      *(_DWORD *)&v133[24] = 1;
      goto LABEL_232;
    }
  }
  *(_DWORD *)&v133[24] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v99 = [MEMORY[0x1E4F42D90] mainScreen];
      [v99 _referenceBounds];
    }
    *(_DWORD *)&v133[16] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v39 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_236;
    }
  }
  else
  {
    *(_DWORD *)&v133[16] = 0;
  }
LABEL_232:
  if (_SBF_Private_IsD64Like())
  {
    *(_DWORD *)&v133[20] = 0;
    *(_OWORD *)v133 = 0uLL;
    memset(v132, 0, sizeof(v132));
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85063E0;
    goto LABEL_67;
  }
LABEL_236:
  int v40 = __sb__runningInSpringBoard();
  if (v40)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[20] = 0;
      *(_DWORD *)&v133[12] = 0;
      goto LABEL_246;
    }
  }
  else
  {
    v105 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v105 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[12] = 0;
      *(_DWORD *)&v133[20] = 1;
      goto LABEL_246;
    }
  }
  *(_DWORD *)&v133[20] = v40 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v96 = [MEMORY[0x1E4F42D90] mainScreen];
      [v96 _referenceBounds];
    }
    uint64_t v7 = v41 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[12] = v7;
    if (v42 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      *(void *)v133 = 0;
      memset(v132, 0, sizeof(v132));
      *(_DWORD *)&v133[8] = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D85063B8;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[12] = 0;
  }
LABEL_246:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v133 = 0;
      *(_DWORD *)v132 = 0;
      goto LABEL_256;
    }
  }
  else
  {
    v102 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v102 userInterfaceIdiom])
    {
      *(_DWORD *)v132 = 0;
      *(_DWORD *)v133 = 1;
      goto LABEL_256;
    }
  }
  *(_DWORD *)v133 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v94 = [MEMORY[0x1E4F42D90] mainScreen];
      [v94 _referenceBounds];
    }
    *(_DWORD *)v132 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v44 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_266;
    }
  }
  else
  {
    *(_DWORD *)v132 = 0;
  }
LABEL_256:
  if (_SBF_Private_IsD54())
  {
    *(void *)&v133[4] = 0;
    *(void *)&v132[4] = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85063C0;
    goto LABEL_67;
  }
LABEL_266:
  int v45 = __sb__runningInSpringBoard();
  if (v45)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v133[4] = 0;
      goto LABEL_276;
    }
  }
  else
  {
    v101 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v101 userInterfaceIdiom])
    {
      *(_DWORD *)&v133[4] = 0;
      *(_DWORD *)&v133[8] = 1;
      goto LABEL_276;
    }
  }
  *(_DWORD *)&v133[8] = v45 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v46 = __sb__runningInSpringBoard();
    if (v46)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v91 = [MEMORY[0x1E4F42D90] mainScreen];
      [v91 _referenceBounds];
    }
    uint64_t v7 = v46 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[4] = v7;
    if (v47 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(void *)&v132[4] = 0;
      uint64_t v130 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506388;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[4] = 0;
  }
LABEL_276:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v132[4] = 0;
      goto LABEL_286;
    }
  }
  else
  {
    v98 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v98 userInterfaceIdiom])
    {
      *(_DWORD *)&v132[4] = 0;
      *(_DWORD *)&v132[8] = 1;
      goto LABEL_286;
    }
  }
  *(_DWORD *)&v132[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v90 = [MEMORY[0x1E4F42D90] mainScreen];
      [v90 _referenceBounds];
    }
    *(_DWORD *)&v132[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v48 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_295;
    }
  }
  else
  {
    *(_DWORD *)&v132[4] = 0;
  }
LABEL_286:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506390;
    goto LABEL_67;
  }
LABEL_295:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_299:
    uint64_t v130 = 0;
    goto LABEL_306;
  }
  int v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_299;
    }
  }
  else
  {
    v93 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v93 userInterfaceIdiom])
    {
      uint64_t v130 = 0x100000000;
      goto LABEL_306;
    }
  }
  HIDWORD(v130) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v50 = __sb__runningInSpringBoard();
    if (v50)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v84 = [MEMORY[0x1E4F42D90] mainScreen];
      [v84 _referenceBounds];
    }
    uint64_t v7 = v50 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v130) = v7;
    if (v55 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      int v129 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506378;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v130) = 0;
  }
LABEL_306:
  int v51 = __sb__runningInSpringBoard();
  if (v51)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v131) = 0;
      uint64_t v7 = 0;
      goto LABEL_316;
    }
  }
  else
  {
    v97 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v97 userInterfaceIdiom])
    {
      uint64_t v7 = 0;
      HIDWORD(v131) = 1;
      goto LABEL_316;
    }
  }
  HIDWORD(v131) = v51 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v87 = [MEMORY[0x1E4F42D90] mainScreen];
      [v87 _referenceBounds];
    }
    uint64_t v7 = v52 ^ 1u;
    BSSizeRoundForScale();
    if (v53 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_320;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_316:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v131) = v7;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    int v129 = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506380;
    goto LABEL_67;
  }
LABEL_320:
  LODWORD(v131) = v7;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_324:
    uint64_t v128 = 0;
    goto LABEL_334;
  }
  int v54 = __sb__runningInSpringBoard();
  if (v54)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_324;
    }
  }
  else
  {
    v88 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v88 userInterfaceIdiom])
    {
      uint64_t v128 = 0x100000000;
      goto LABEL_334;
    }
  }
  HIDWORD(v128) = v54 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v80 = [MEMORY[0x1E4F42D90] mainScreen];
      [v80 _referenceBounds];
    }
    LODWORD(v128) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v60 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v129 = 0;
      uint64_t v127 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D85063A8;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v128) = 0;
  }
LABEL_334:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v129 = 0;
      HIDWORD(v127) = 0;
      goto LABEL_344;
    }
  }
  else
  {
    v92 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v92 userInterfaceIdiom])
    {
      HIDWORD(v127) = 0;
      int v129 = 1;
      goto LABEL_344;
    }
  }
  int v129 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v83 = [MEMORY[0x1E4F42D90] mainScreen];
      [v83 _referenceBounds];
    }
    HIDWORD(v127) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v56 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_348;
    }
  }
  else
  {
    HIDWORD(v127) = 0;
  }
LABEL_344:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v127) = 0;
    uint64_t v124 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85063B0;
    goto LABEL_67;
  }
LABEL_348:
  int v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v127) = 0;
      HIDWORD(v124) = 0;
      goto LABEL_358;
    }
  }
  else
  {
    v89 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v89 userInterfaceIdiom])
    {
      HIDWORD(v124) = 0;
      LODWORD(v127) = 1;
      goto LABEL_358;
    }
  }
  LODWORD(v127) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v58 = __sb__runningInSpringBoard();
    if (v58)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v81 = [MEMORY[0x1E4F42D90] mainScreen];
      [v81 _referenceBounds];
    }
    uint64_t v7 = v58 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v124) = v7;
    if (v59 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      LODWORD(v124) = 0;
      uint64_t v123 = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506398;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v124) = 0;
  }
LABEL_358:
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v126 = 0;
      goto LABEL_368;
    }
  }
  else
  {
    v86 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v86 userInterfaceIdiom])
    {
      uint64_t v126 = 0x100000000;
      goto LABEL_368;
    }
  }
  HIDWORD(v126) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v79 = [MEMORY[0x1E4F42D90] mainScreen];
      [v79 _referenceBounds];
    }
    LODWORD(v126) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v61 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_378;
    }
  }
  else
  {
    LODWORD(v126) = 0;
  }
LABEL_368:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    uint64_t v125 = 0;
    LODWORD(v124) = 0;
    uint64_t v123 = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D85063A0;
    goto LABEL_67;
  }
LABEL_378:
  int v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v125) = 0;
      LODWORD(v124) = 0;
      goto LABEL_388;
    }
  }
  else
  {
    v85 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v85 userInterfaceIdiom])
    {
      LODWORD(v124) = 0;
      HIDWORD(v125) = 1;
      goto LABEL_388;
    }
  }
  HIDWORD(v125) = v62 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v78 = [MEMORY[0x1E4F42D90] mainScreen];
      [v78 _referenceBounds];
    }
    LODWORD(v124) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      uint64_t v123 = 0;
      LODWORD(v125) = 0;
      int v122 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506368;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v124) = 0;
  }
LABEL_388:
  int v63 = __sb__runningInSpringBoard();
  if (v63)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v123) = 0;
      uint64_t v7 = 0;
      goto LABEL_398;
    }
  }
  else
  {
    v82 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v82 userInterfaceIdiom])
    {
      uint64_t v7 = 0;
      HIDWORD(v123) = 1;
      goto LABEL_398;
    }
  }
  HIDWORD(v123) = v63 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v64 = __sb__runningInSpringBoard();
    if (v64)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v77 = [MEMORY[0x1E4F42D90] mainScreen];
      [v77 _referenceBounds];
    }
    uint64_t v7 = v64 ^ 1u;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_405;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_398:
  if (_SBF_Private_IsD53())
  {
    LODWORD(v125) = v7;
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506370;
    goto LABEL_67;
  }
LABEL_405:
  LODWORD(v125) = v7;
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506348;
    goto LABEL_67;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506350;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506338;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    LODWORD(v123) = 0;
    int v122 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506340;
    goto LABEL_67;
  }
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v123) = 0;
      int v122 = 0;
      goto LABEL_425;
    }
  }
  else
  {
    v76 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v76 userInterfaceIdiom])
    {
      int v122 = 0;
      LODWORD(v123) = 1;
      goto LABEL_425;
    }
  }
  LODWORD(v123) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v74 = [MEMORY[0x1E4F42D90] mainScreen];
      [v74 _referenceBounds];
    }
    int v122 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v69 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v18 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506358;
      goto LABEL_67;
    }
  }
  else
  {
    int v122 = 0;
  }
LABEL_425:
  int v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v18 = 0;
      int v19 = 0;
      goto LABEL_435;
    }
  }
  else
  {
    v75 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v75 userInterfaceIdiom])
    {
      int v19 = 0;
      int v18 = 1;
      goto LABEL_435;
    }
  }
  int v18 = v67 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v5 = __sb__runningInSpringBoard();
    if (v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v73 = [MEMORY[0x1E4F42D90] mainScreen];
      [v73 _referenceBounds];
    }
    int v19 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v70 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      v24 = &qword_1D8506360;
      goto LABEL_67;
    }
  }
  else
  {
    int v19 = 0;
  }
LABEL_435:
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v20 = 0;
      int v21 = 0;
      goto LABEL_445;
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v7 userInterfaceIdiom])
    {
      int v21 = 0;
      int v20 = 1;
      goto LABEL_445;
    }
  }
  int v20 = v5 ^ 1;
  uint64_t v5 = __sb__runningInSpringBoard();
  if (v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v2 _referenceBounds];
  }
  int v21 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v68 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v22 = 0;
    int v23 = 0;
    v24 = &qword_1D8506330;
    goto LABEL_67;
  }
LABEL_445:
  uint64_t v4 = __sb__runningInSpringBoard();
  if (v4)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v22 = 0;
      int v23 = 0;
LABEL_462:
      v24 = &CSProminentBaselineToListY;
      goto LABEL_67;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v5 userInterfaceIdiom])
    {
      int v23 = 0;
      int v22 = 1;
      goto LABEL_462;
    }
  }
  int v22 = v4 ^ 1;
  int v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v4 _referenceBounds];
  }
  int v23 = v71 ^ 1;
  BSSizeRoundForScale();
  if (v72 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_462;
  }
  v24 = &qword_1D8506328;
LABEL_67:
  double v32 = *(double *)v24;
  if (v23) {

  }
  if (v22) {
  if (v21)
  }

  if (v20) {
  if (v19)
  }

  if (v18) {
  if (v122)
  }

  if (v123) {
  if (v125)
  }

  if (HIDWORD(v123)) {
  if (v124)
  }

  if (HIDWORD(v125)) {
  if (v126)
  }

  if (HIDWORD(v126)) {
  if (HIDWORD(v124))
  }

  if (v127) {
  if (HIDWORD(v127))
  }

  if (v129) {
  if (v128)
  }

  if (HIDWORD(v128)) {
  if (v131)
  }

  if (HIDWORD(v131)) {
  if (v130)
  }

  if (HIDWORD(v130)) {
  if (*(_DWORD *)&v132[4])
  }

  if (*(_DWORD *)&v132[8]) {
  if (*(_DWORD *)&v133[4])
  }

  if (*(_DWORD *)&v133[8]) {
  if (*(_DWORD *)v132)
  }

  if (*(_DWORD *)v133) {
  if (*(_DWORD *)&v133[12])
  }

  if (*(_DWORD *)&v133[20]) {
  if (*(_DWORD *)&v133[16])
  }

  if (*(_DWORD *)&v133[24]) {
  if (*(_DWORD *)&v133[28])
  }

  if (*(_DWORD *)&v133[32]) {
  if (*(_DWORD *)&v133[36])
  }

  if (*(_DWORD *)&v134[8]) {
  if (*(_DWORD *)&v134[4])
  }

  if (*(_DWORD *)v134) {
  if (v135)
  }

  if (DWORD1(v135)) {
  if (DWORD2(v135))
  }

  if (v142)
  {

    if (!HIDWORD(v135)) {
      goto LABEL_155;
    }
  }
  else if (!HIDWORD(v135))
  {
LABEL_155:
    if (v136) {
      goto LABEL_156;
    }
    goto LABEL_166;
  }

  if (v136)
  {
LABEL_156:

    if (!v137) {
      goto LABEL_157;
    }
    goto LABEL_167;
  }
LABEL_166:
  if (!v137)
  {
LABEL_157:
    if (v138) {
      goto LABEL_158;
    }
    goto LABEL_168;
  }
LABEL_167:

  if (v138)
  {
LABEL_158:

    if (!v139) {
      goto LABEL_159;
    }
    goto LABEL_169;
  }
LABEL_168:
  if (!v139)
  {
LABEL_159:
    if (v140) {
      goto LABEL_160;
    }
    goto LABEL_170;
  }
LABEL_169:

  if (v140)
  {
LABEL_160:

    if (!v141) {
      goto LABEL_161;
    }
    goto LABEL_171;
  }
LABEL_170:
  if (!v141)
  {
LABEL_161:
    if (v143) {
      goto LABEL_162;
    }
    goto LABEL_172;
  }
LABEL_171:

  if (v143)
  {
LABEL_162:

    if (!v144) {
      return v32;
    }
    goto LABEL_173;
  }
LABEL_172:
  if (v144) {
LABEL_173:
  }

  return v32;
}

- (double)dateBaselineToComplicationY
{
  return 0.0;
}

- (double)complicationContainerHeight
{
  return 0.0;
}

- (double)listMinY
{
  [(CSMagSafeAccessoryConfiguration *)self timeLabelBaselineY];
  double v4 = v3;
  [(CSMagSafeAccessoryConfiguration *)self timeToSubtitleLabelBaselineDifferenceY];
  double v6 = v4 + v5;
  [(CSMagSafeAccessoryConfiguration *)self prominentBaselineToListY];
  return v6 + v7;
}

- (double)timeLabelOffsetForScrollPercent:(double)a3
{
  return 0.0;
}

- (double)timeToSubtitleLabelBaselineDifferenceY
{
  return 37.0;
}

- (BOOL)containsCenteredDateTimeLayout
{
  return 1;
}

- (double)dateTimeMostExtremeLeadingX
{
  uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  double MidX = CGRectGetMidX(v5);

  return MidX;
}

- (double)dateTimeMostExtremeTrailingX
{
  uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  double MidX = CGRectGetMidX(v5);

  return MidX;
}

- (double)dateTimeSubtitleMaximumWidth
{
  return 0.0;
}

- (CSMagSafeRingConfiguration)ring
{
  return self->_ring;
}

- (void)setRing:(id)a3
{
  self->_ring = (CSMagSafeRingConfiguration *)a3;
}

- (CSMagSafeRingConfiguration)auxiliaryRing
{
  return self->_auxiliaryRing;
}

- (void)setAuxiliaryRing:(id)a3
{
  self->_auxiliaryRing = (CSMagSafeRingConfiguration *)a3;
}

- (BOOL)staticViewNeeded
{
  return self->_staticViewNeeded;
}

- (void)setStaticViewNeeded:(BOOL)a3
{
  self->_staticViewNeeded = a3;
}

- (double)staticViewRingDiameter
{
  return self->_staticViewRingDiameter;
}

- (void)setStaticViewRingDiameter:(double)a3
{
  self->_staticViewRingDiameter = a3;
}

- (CSLayoutStrategy)layoutStrategy
{
  return self->_layoutStrategy;
}

- (void)setLayoutStrategy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end