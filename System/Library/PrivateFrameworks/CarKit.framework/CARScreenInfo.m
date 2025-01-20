@interface CARScreenInfo
- (BOOL)_currentProcessHasEntitlement;
- (BOOL)initialFocusOwner;
- (BOOL)isLimitedUI;
- (BOOL)isNightMode;
- (BOOL)supportsAppearanceMode;
- (BOOL)supportsHighFidelityTouch;
- (BOOL)supportsLayerTracking;
- (BOOL)supportsMapAppearanceMode;
- (BOOL)supportsPerDisplayNightMode;
- (BOOL)wantsCornerMasks;
- (CARDisplayInfo)physicalDisplay;
- (CARScreenInfo)initWithPropertySupplier:(id)a3 screenType:(unint64_t)a4;
- (CARScreenInfo)initWithPropertySupplier:(id)a3 screenType:(unint64_t)a4 additionalInsets:(NSEdgeInsets)a5 displayDictionary:(id)a6 physicalDisplay:(id)a7;
- (CARScreenViewArea)adjacentViewArea;
- (CARScreenViewArea)currentViewArea;
- (CGPoint)originInDisplay;
- (CGSize)displayPixelSize;
- (CGSize)physicalSize;
- (CGSize)pixelSize;
- (CGSize)squaredPixelSize;
- (NSArray)viewAreas;
- (NSDictionary)screenInfoResponse;
- (NSString)identifier;
- (NSURL)initialURL;
- (id)_descriptionForInteractionModel:(unint64_t)a3;
- (id)description;
- (id)descriptionForAvailableInteractionModels;
- (id)descriptionForPrimaryInteractionModel;
- (unint64_t)availableInteractionModels;
- (unint64_t)currentViewAreaTransitionControlType;
- (unint64_t)limitedUIElements;
- (unint64_t)maxFramesPerSecond;
- (unint64_t)primaryInteractionModel;
- (unint64_t)screenType;
- (unint64_t)systemAvailableInteractionModels;
- (unint64_t)systemPrimaryInteractionModel;
- (void)limitedUIChanged:(BOOL)a3;
- (void)nightModeChanged:(BOOL)a3;
- (void)setAdjacentViewArea:(id)a3;
- (void)setCurrentViewArea:(id)a3;
- (void)setCurrentViewAreaTransitionControlType:(unint64_t)a3;
- (void)setInitialFocusOwner:(BOOL)a3;
- (void)setPhysicalDisplay:(id)a3;
- (void)setSupportsAppearanceMode:(BOOL)a3;
- (void)setSupportsLayerTracking:(BOOL)a3;
- (void)setSupportsMapAppearanceMode:(BOOL)a3;
- (void)setSupportsPerDisplayNightMode:(BOOL)a3;
- (void)setSystemAvailableInteractionModels:(unint64_t)a3;
- (void)setSystemPrimaryInteractionModel:(unint64_t)a3;
- (void)setWantsCornerMasks:(BOOL)a3;
@end

@implementation CARScreenInfo

- (CARScreenInfo)initWithPropertySupplier:(id)a3 screenType:(unint64_t)a4
{
  return -[CARScreenInfo initWithPropertySupplier:screenType:additionalInsets:displayDictionary:physicalDisplay:](self, "initWithPropertySupplier:screenType:additionalInsets:displayDictionary:physicalDisplay:", a3, a4, 0, 0, *MEMORY[0x1E4F28250], *(double *)(MEMORY[0x1E4F28250] + 8), *(double *)(MEMORY[0x1E4F28250] + 16), *(double *)(MEMORY[0x1E4F28250] + 24));
}

- (CARScreenInfo)initWithPropertySupplier:(id)a3 screenType:(unint64_t)a4 additionalInsets:(NSEdgeInsets)a5 displayDictionary:(id)a6 physicalDisplay:(id)a7
{
  CGFloat right = a5.right;
  CGFloat bottom = a5.bottom;
  CGFloat left = a5.left;
  CGFloat top = a5.top;
  v15 = (void (**)(id, void))a3;
  id v16 = a6;
  id v17 = a7;
  v120.receiver = self;
  v120.super_class = (Class)CARScreenInfo;
  v18 = [(CARScreenInfo *)&v120 init];
  v19 = v18;
  if (!v15 || !v18) {
    goto LABEL_86;
  }
  id v97 = v17;
  uint64_t v20 = [v16 copy];
  screenInfoResponse = v19->_screenInfoResponse;
  v19->_screenInfoResponse = (NSDictionary *)v20;

  objc_storeStrong((id *)&v19->_physicalDisplay, a7);
  uint64_t v22 = v15[2](v15, *MEMORY[0x1E4F21168]);
  identifier = v19->_identifier;
  v19->_identifier = (NSString *)v22;

  v19->_screenType = a4;
  v19->_unint64_t systemAvailableInteractionModels = 0;
  v19->_supportsLayerTracking = [(CARDisplayInfo *)v19->_physicalDisplay supportsDDPContent];
  v24 = ((void (**)(id, __CFString *))v15)[2](v15, @"cornerMasks");
  objc_opt_class();
  id v25 = v24;
  id v26 = 0;
  if (objc_opt_isKindOfClass()) {
    id v26 = v25;
  }

  v107 = v26;
  v19->_wantsCornerMasks = [v26 BOOLValue];
  v27 = [v16 objectForKey:@"accessoryGiveFocus"];
  objc_opt_class();
  id v28 = v27;
  if (objc_opt_isKindOfClass()) {
    id v29 = v28;
  }
  else {
    id v29 = 0;
  }

  v106 = v29;
  v19->_initialFocusOwner = [v29 BOOLValue];
  v30 = [v16 objectForKey:@"features"];
  objc_opt_class();
  id v31 = v30;
  if (objc_opt_isKindOfClass()) {
    id v32 = v31;
  }
  else {
    id v32 = 0;
  }

  v105 = v32;
  if (v32)
  {
    unint64_t v33 = [v32 unsignedIntegerValue];
    if ((v33 & 0xFFFFFFFFFFFFFFC1) != 0)
    {
      v34 = CarGeneralLogging();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[CARScreenInfo initWithPropertySupplier:screenType:additionalInsets:displayDictionary:physicalDisplay:](v33 & 0xFFFFFFFFFFFFFFC1);
      }
    }
    uint64_t v35 = (v33 >> 1) & 2;
    if ((v33 & 8) != 0) {
      uint64_t v35 = 2;
    }
    unint64_t v36 = ((2 * v33) | (v33 >> 3)) & 4 | (v33 >> 1) & 8 | v35;
    if (v36 <= 1) {
      unint64_t v36 = 1;
    }
    v19->_unint64_t systemAvailableInteractionModels = v36;
    v19->_supportsHighFidelityTouch = (v33 & 8) != 0;
  }
  else
  {
    if (!a4)
    {
      v37 = CarGeneralLogging();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        -[CARScreenInfo initWithPropertySupplier:screenType:additionalInsets:displayDictionary:physicalDisplay:]((uint64_t)&v19->_identifier, v37, v38, v39, v40, v41, v42, v43);
      }
    }
    v19->_unint64_t systemAvailableInteractionModels = 1;
    v19->_supportsHighFidelityTouch = 0;
  }
  v44 = [v16 objectForKey:@"primaryInputDevice"];
  objc_opt_class();
  id v45 = v44;
  if (objc_opt_isKindOfClass()) {
    id v46 = v45;
  }
  else {
    id v46 = 0;
  }

  v104 = v46;
  if (v46)
  {
    uint64_t v47 = [v46 unsignedIntegerValue];
    uint64_t v48 = 2;
    switch(v47)
    {
      case 0:
        break;
      case 1:
        goto LABEL_40;
      case 2:
        goto LABEL_37;
      case 3:
      case 4:
        goto LABEL_38;
      default:
        v49 = CarGeneralLogging();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          -[CARScreenInfo initWithPropertySupplier:screenType:additionalInsets:displayDictionary:physicalDisplay:](v47);
        }

        break;
    }
  }
  v19->_systemPrimaryInteractionModel = 1;
  unint64_t systemAvailableInteractionModels = v19->_systemAvailableInteractionModels;
  if ((systemAvailableInteractionModels & 2) != 0)
  {
    uint64_t v48 = 2;
    goto LABEL_40;
  }
  if ((systemAvailableInteractionModels & 4) != 0)
  {
LABEL_38:
    uint64_t v48 = 4;
    goto LABEL_40;
  }
  if ((systemAvailableInteractionModels & 8) != 0)
  {
LABEL_37:
    uint64_t v48 = 8;
LABEL_40:
    v19->_systemPrimaryInteractionModel = v48;
  }
  v51 = v15[2](v15, *MEMORY[0x1E4F21198]);
  objc_opt_class();
  id v52 = v51;
  if (objc_opt_isKindOfClass()) {
    id v53 = v52;
  }
  else {
    id v53 = 0;
  }

  v19->_maxFramesPerSecond = [v53 unsignedIntegerValue];
  CFDictionaryRef v54 = (const __CFDictionary *)((uint64_t (*)(id, void))v15[2])(v15, *MEMORY[0x1E4F211A0]);
  CRSizeFromDictionary(v54, &v19->_physicalSize);
  CFDictionaryRef v55 = (const __CFDictionary *)((uint64_t (*)(id, void))v15[2])(v15, *MEMORY[0x1E4F211A8]);
  CRSizeFromDictionary(v55, &v19->_pixelSize);
  CFDictionaryRef v56 = (const __CFDictionary *)((uint64_t (*)(id, void))v15[2])(v15, *MEMORY[0x1E4F211B8]);
  CRSizeFromDictionary(v56, &v19->_squaredPixelSize);
  v57 = v15[2](v15, *MEMORY[0x1E4F21180]);
  objc_opt_class();
  id v58 = v57;
  if (objc_opt_isKindOfClass()) {
    id v59 = v58;
  }
  else {
    id v59 = 0;
  }

  v102 = v59;
  v19->_limitedUI = [v59 BOOLValue];
  v60 = v15[2](v15, *MEMORY[0x1E4F21188]);
  objc_opt_class();
  id v61 = v60;
  v103 = v53;
  if (objc_opt_isKindOfClass()) {
    id v62 = v61;
  }
  else {
    id v62 = 0;
  }

  v101 = v62;
  v19->_nightMode = [v62 BOOLValue];
  v63 = v15[2](v15, *MEMORY[0x1E4F21190]);
  objc_opt_class();
  id v64 = v63;
  if (objc_opt_isKindOfClass()) {
    id v65 = v64;
  }
  else {
    id v65 = 0;
  }

  v100 = v65;
  v19->_limitedUIElements = +[CARSessionConfiguration _limitableUserInterfacesFromLimitedUIValues:v65];
  v66 = v15[2](v15, *MEMORY[0x1E4F211C0]);
  objc_opt_class();
  id v67 = v66;
  unint64_t v108 = a4;
  if (objc_opt_isKindOfClass()) {
    id v68 = v67;
  }
  else {
    id v68 = 0;
  }

  id v69 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v70 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v118[0] = MEMORY[0x1E4F143A8];
  v118[1] = 3221225472;
  v118[2] = __104__CARScreenInfo_initWithPropertySupplier_screenType_additionalInsets_displayDictionary_physicalDisplay___block_invoke;
  v118[3] = &unk_1E5E3B2A8;
  id v71 = v69;
  id v119 = v71;
  v99 = v68;
  [v68 enumerateObjectsUsingBlock:v118];
  v72 = [v16 objectForKey:@"viewAreas"];
  objc_opt_class();
  id v73 = v72;
  v109 = v16;
  if (objc_opt_isKindOfClass()) {
    id v74 = v73;
  }
  else {
    id v74 = 0;
  }

  v110[0] = MEMORY[0x1E4F143A8];
  v110[1] = 3221225472;
  v110[2] = __104__CARScreenInfo_initWithPropertySupplier_screenType_additionalInsets_displayDictionary_physicalDisplay___block_invoke_2;
  v110[3] = &unk_1E5E3B2F8;
  CGFloat v114 = top;
  CGFloat v115 = left;
  CGFloat v116 = bottom;
  CGFloat v117 = right;
  id v75 = v74;
  id v111 = v75;
  v76 = v19;
  v112 = v76;
  id v77 = v70;
  id v113 = v77;
  [v71 enumerateObjectsUsingBlock:v110];
  objc_storeStrong((id *)&v76->_viewAreas, v70);
  if (v108 == 1)
  {
    v78 = v15[2](v15, *MEMORY[0x1E4F21170]);
    objc_opt_class();
    id v79 = v78;
    if (objc_opt_isKindOfClass()) {
      v80 = (NSURL *)v79;
    }
    else {
      v80 = 0;
    }

    initialURL = v76->_initialURL;
    v76->_initialURL = v80;
  }
  v82 = [v109 objectForKey:@"uiAppearanceMode"];
  objc_opt_class();
  id v83 = v82;
  v98 = v71;
  v84 = v77;
  if (objc_opt_isKindOfClass()) {
    id v85 = v83;
  }
  else {
    id v85 = 0;
  }

  v76->_supportsAppearanceMode = v85 != 0;
  v86 = [v109 objectForKey:@"mapAppearanceMode"];
  objc_opt_class();
  id v87 = v86;
  if (objc_opt_isKindOfClass()) {
    id v88 = v87;
  }
  else {
    id v88 = 0;
  }

  if (v108) {
    BOOL v89 = v88 == 0;
  }
  else {
    BOOL v89 = 1;
  }
  char v90 = !v89;
  v76->_supportsMapAppearanceMode = v90;
  v91 = [v109 objectForKey:@"nightMode"];
  objc_opt_class();
  id v92 = v91;
  if (objc_opt_isKindOfClass()) {
    id v93 = v92;
  }
  else {
    id v93 = 0;
  }
  id v17 = v97;

  if (v108) {
    BOOL v94 = v93 == 0;
  }
  else {
    BOOL v94 = 0;
  }
  char v95 = !v94;
  v76->_supportsPerDisplayNightMode = v95;

  id v16 = v109;
LABEL_86:

  return v19;
}

void __104__CARScreenInfo_initWithPropertySupplier_screenType_additionalInsets_displayDictionary_physicalDisplay___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass())
  {
    if (!v4) {
      goto LABEL_5;
    }
    [*(id *)(a1 + 32) addObject:v4];
  }

LABEL_5:
}

void __104__CARScreenInfo_initWithPropertySupplier_screenType_additionalInsets_displayDictionary_physicalDisplay___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [CARScreenViewArea alloc];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __104__CARScreenInfo_initWithPropertySupplier_screenType_additionalInsets_displayDictionary_physicalDisplay___block_invoke_3;
  v11[3] = &unk_1E5E3B2D0;
  id v12 = v5;
  v7 = *(void **)(a1 + 32);
  id v8 = v5;
  v9 = [v7 objectAtIndexedSubscript:a3];
  v10 = -[CARScreenViewArea initWithPropertySupplier:additionalInsets:viewAreaDictionary:wantsCornerMasks:displayInfoProvider:](v6, "initWithPropertySupplier:additionalInsets:viewAreaDictionary:wantsCornerMasks:displayInfoProvider:", v11, v9, *(unsigned __int8 *)(*(void *)(a1 + 40) + 11), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  [*(id *)(a1 + 48) addObject:v10];
}

uint64_t __104__CARScreenInfo_initWithPropertySupplier_screenType_additionalInsets_displayDictionary_physicalDisplay___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKey:a2];
}

- (id)descriptionForAvailableInteractionModels
{
  unint64_t v3 = [(CARScreenInfo *)self systemAvailableInteractionModels];
  return [(CARScreenInfo *)self _descriptionForInteractionModel:v3];
}

- (id)descriptionForPrimaryInteractionModel
{
  unint64_t v3 = [(CARScreenInfo *)self systemPrimaryInteractionModel];
  return [(CARScreenInfo *)self _descriptionForInteractionModel:v3];
}

- (id)_descriptionForInteractionModel:(unint64_t)a3
{
  char v3 = a3;
  id v4 = [MEMORY[0x1E4F1C978] array];
  id v5 = v4;
  if ((v3 & 2) != 0)
  {
    uint64_t v6 = [v4 arrayByAddingObject:@"Touch"];

    id v5 = (void *)v6;
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v7 = [v5 arrayByAddingObject:@"Knob"];

  id v5 = (void *)v7;
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if (v3) {
      goto LABEL_10;
    }
LABEL_9:
    if ([v5 count]) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v8 = [v5 arrayByAddingObject:@"Touchpad"];

  id v5 = (void *)v8;
  if ((v3 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v9 = [v5 arrayByAddingObject:@"Unknown"];

  id v5 = (void *)v9;
LABEL_11:
  v10 = [v5 componentsJoinedByString:@", "];

  return v10;
}

- (BOOL)_currentProcessHasEntitlement
{
  if (_currentProcessHasEntitlement_onceToken != -1) {
    dispatch_once(&_currentProcessHasEntitlement_onceToken, &__block_literal_global_15);
  }
  return _currentProcessHasEntitlement___appHasEntitlement;
}

void __46__CARScreenInfo__currentProcessHasEntitlement__block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F223F0] bundleProxyForCurrentProcess];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v1 = [v0 containingBundle];

    v0 = (void *)v1;
  }
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  char v3 = CARInteractionModelEntitlements();
  id v4 = [v2 setWithArray:v3];
  id v5 = [v0 entitlementValuesForKeys:v4];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = CARInteractionModelEntitlements();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(v5, "BOOLForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v10), (void)v11)) {
          _currentProcessHasEntitlement___appHasEntitlement = 1;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (unint64_t)primaryInteractionModel
{
  if ([(CARScreenInfo *)self _currentProcessHasEntitlement]) {
    return 1;
  }
  return [(CARScreenInfo *)self systemPrimaryInteractionModel];
}

- (unint64_t)availableInteractionModels
{
  if ([(CARScreenInfo *)self _currentProcessHasEntitlement]) {
    return 1;
  }
  return [(CARScreenInfo *)self systemAvailableInteractionModels];
}

- (id)description
{
  v23 = NSString;
  v24.receiver = self;
  v24.super_class = (Class)CARScreenInfo;
  uint64_t v22 = [(CARScreenInfo *)&v24 description];
  v21 = [(CARScreenInfo *)self identifier];
  uint64_t v20 = [(CARScreenInfo *)self descriptionForAvailableInteractionModels];
  char v3 = [(CARScreenInfo *)self descriptionForPrimaryInteractionModel];
  id v4 = @"YES";
  if ([(CARScreenInfo *)self isLimitedUI]) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  v19 = v5;
  if ([(CARScreenInfo *)self isNightMode]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  if ([(CARScreenInfo *)self supportsHighFidelityTouch]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  unint64_t v8 = [(CARScreenInfo *)self maxFramesPerSecond];
  [(CARScreenInfo *)self physicalSize];
  long long v11 = [NSString stringWithFormat:@"{w: %f, h: %f}", v9, v10];
  [(CARScreenInfo *)self pixelSize];
  long long v14 = [NSString stringWithFormat:@"{w: %f, h: %f}", v12, v13];
  if ([(CARScreenInfo *)self wantsCornerMasks]) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  if (![(CARScreenInfo *)self initialFocusOwner]) {
    id v4 = @"NO";
  }
  uint64_t v16 = [(CARScreenInfo *)self viewAreas];
  id v17 = [v23 stringWithFormat:@"%@, identifier: %@, availableInteractionModels: %@, primaryInteractionModel: %@, isLimited: %@, isNightMode: %@, supportsHiFi: %@, maxFPS: %lu, physicalSize: %@, pixelSize: %@, wantsCornerMasks: %@, initialFocusOwner: %@, viewAreas: %@", v22, v21, v20, v3, v19, v6, v7, v8, v11, v14, v15, v4, v16];

  return v17;
}

- (void)nightModeChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(CARScreenInfo *)self identifier];
    uint64_t v7 = [NSNumber numberWithBool:v3];
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    long long v11 = v7;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "Updating night mode on screen %@ to %{public}@", (uint8_t *)&v8, 0x16u);
  }
  self->_nightMode = v3;
}

- (void)limitedUIChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(CARScreenInfo *)self identifier];
    uint64_t v7 = [NSNumber numberWithBool:v3];
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    long long v11 = v7;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "Updating limited UI on screen %@ to %{public}@", (uint8_t *)&v8, 0x16u);
  }
  self->_limitedUI = v3;
}

- (void)setPhysicalDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_physicalDisplay, a3);
  id v4 = [(CARScreenInfo *)self viewAreas];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_291];
}

uint64_t __36__CARScreenInfo_setPhysicalDisplay___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateEffectiveSafeFrame];
}

- (CGPoint)originInDisplay
{
  BOOL v3 = [(CARScreenInfo *)self physicalDisplay];
  id v4 = [(CARScreenInfo *)self identifier];
  [v3 originForScreenInfoIdentifier:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGSize)displayPixelSize
{
  v2 = [(CARScreenInfo *)self physicalDisplay];
  [v2 pixelSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)screenType
{
  return self->_screenType;
}

- (BOOL)isLimitedUI
{
  return self->_limitedUI;
}

- (unint64_t)limitedUIElements
{
  return self->_limitedUIElements;
}

- (BOOL)isNightMode
{
  return self->_nightMode;
}

- (BOOL)supportsHighFidelityTouch
{
  return self->_supportsHighFidelityTouch;
}

- (unint64_t)maxFramesPerSecond
{
  return self->_maxFramesPerSecond;
}

- (CGSize)physicalSize
{
  double width = self->_physicalSize.width;
  double height = self->_physicalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)pixelSize
{
  double width = self->_pixelSize.width;
  double height = self->_pixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)squaredPixelSize
{
  double width = self->_squaredPixelSize.width;
  double height = self->_squaredPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSArray)viewAreas
{
  return self->_viewAreas;
}

- (CARScreenViewArea)currentViewArea
{
  return self->_currentViewArea;
}

- (void)setCurrentViewArea:(id)a3
{
}

- (CARScreenViewArea)adjacentViewArea
{
  return self->_adjacentViewArea;
}

- (void)setAdjacentViewArea:(id)a3
{
}

- (unint64_t)currentViewAreaTransitionControlType
{
  return self->_currentViewAreaTransitionControlType;
}

- (void)setCurrentViewAreaTransitionControlType:(unint64_t)a3
{
  self->_currentViewAreaTransitionControlType = a3;
}

- (NSURL)initialURL
{
  return self->_initialURL;
}

- (unint64_t)systemAvailableInteractionModels
{
  return self->_systemAvailableInteractionModels;
}

- (void)setSystemAvailableInteractionModels:(unint64_t)a3
{
  self->_unint64_t systemAvailableInteractionModels = a3;
}

- (unint64_t)systemPrimaryInteractionModel
{
  return self->_systemPrimaryInteractionModel;
}

- (void)setSystemPrimaryInteractionModel:(unint64_t)a3
{
  self->_systemPrimaryInteractionModel = a3;
}

- (BOOL)wantsCornerMasks
{
  return self->_wantsCornerMasks;
}

- (void)setWantsCornerMasks:(BOOL)a3
{
  self->_wantsCornerMasks = a3;
}

- (BOOL)initialFocusOwner
{
  return self->_initialFocusOwner;
}

- (void)setInitialFocusOwner:(BOOL)a3
{
  self->_initialFocusOwner = a3;
}

- (BOOL)supportsAppearanceMode
{
  return self->_supportsAppearanceMode;
}

- (void)setSupportsAppearanceMode:(BOOL)a3
{
  self->_supportsAppearanceMode = a3;
}

- (BOOL)supportsPerDisplayNightMode
{
  return self->_supportsPerDisplayNightMode;
}

- (void)setSupportsPerDisplayNightMode:(BOOL)a3
{
  self->_supportsPerDisplayNightMode = a3;
}

- (BOOL)supportsMapAppearanceMode
{
  return self->_supportsMapAppearanceMode;
}

- (void)setSupportsMapAppearanceMode:(BOOL)a3
{
  self->_supportsMapAppearanceMode = a3;
}

- (NSDictionary)screenInfoResponse
{
  return self->_screenInfoResponse;
}

- (BOOL)supportsLayerTracking
{
  return self->_supportsLayerTracking;
}

- (void)setSupportsLayerTracking:(BOOL)a3
{
  self->_supportsLayerTracking = a3;
}

- (CARDisplayInfo)physicalDisplay
{
  return self->_physicalDisplay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalDisplay, 0);
  objc_storeStrong((id *)&self->_screenInfoResponse, 0);
  objc_storeStrong((id *)&self->_initialURL, 0);
  objc_storeStrong((id *)&self->_adjacentViewArea, 0);
  objc_storeStrong((id *)&self->_currentViewArea, 0);
  objc_storeStrong((id *)&self->_viewAreas, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithPropertySupplier:(uint64_t)a1 screenType:additionalInsets:displayDictionary:physicalDisplay:.cold.1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_1ABB00000, v2, v3, "Unknown primary input device: %@", v4, v5, v6, v7, v8);
}

- (void)initWithPropertySupplier:(uint64_t)a3 screenType:(uint64_t)a4 additionalInsets:(uint64_t)a5 displayDictionary:(uint64_t)a6 physicalDisplay:(uint64_t)a7 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithPropertySupplier:(uint64_t)a1 screenType:additionalInsets:displayDictionary:physicalDisplay:.cold.3(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_1ABB00000, v2, v3, "Unknown display input methods: %@", v4, v5, v6, v7, v8);
}

@end