BOOL MTIsValidVisualStyle(unint64_t a1)
{
  return a1 < 6 || a1 - 20 < 5;
}

void sub_2156C3D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2156C4588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MTCoreMaterialVisualStyleForVisualStyle(uint64_t a1)
{
  uint64_t v2 = a1 + 1;
  if (unint64_t)(a1 + 1) <= 0x19 && ((0x3E0007Fu >> v2))
  {
    id v3 = **((id **)&unk_264256BF8 + v2);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

__CFString *NSStringFromMTLumaDodgePillStyle(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%li)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2642569E0[a1];
  }

  return v1;
}

uint64_t __supportedAnimationPropertyKey(void *a1)
{
  uint64_t v1 = __supportedAnimationPropertyKey_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&__supportedAnimationPropertyKey_onceToken, &__block_literal_global_1);
  }
  uint64_t v3 = [(id)__supportedAnimationPropertyKey___animatableKeys containsObject:v2];

  return v3;
}

uint64_t MTMaterialRecipeForUIBlurEffectStyle(uint64_t a1)
{
  if ((unint64_t)(a1 - 6) > 0xE) {
    return 0;
  }
  else {
    return qword_2156D2AC8[a1 - 6];
  }
}

BOOL MTIsUIBlurEffectStyleDynamic(uint64_t a1)
{
  return (unint64_t)(a1 - 21) < 0xFFFFFFFFFFFFFFF6;
}

void MTRegisterMaterialKitLogging()
{
  if (MTRegisterMaterialKitLogging_onceToken != -1) {
    dispatch_once(&MTRegisterMaterialKitLogging_onceToken, &__block_literal_global);
  }
}

uint64_t __MTRegisterMaterialKitLogging_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)MTLogSubsystem, "Materials");
  uint64_t v1 = (void *)MTLogMaterials;
  MTLogMaterials = (uint64_t)v0;

  MTLogLuma = (uint64_t)os_log_create((const char *)MTLogSubsystem, "Luma");

  return MEMORY[0x270F9A758]();
}

double _MainScreenReferenceBounds()
{
  if (_MainScreenReferenceBounds___once != -1) {
    dispatch_once(&_MainScreenReferenceBounds___once, &__block_literal_global_311);
  }
  return *(double *)&_MainScreenReferenceBounds___bounds_0;
}

__CFString *NSStringFromMTLumaDodgePillBackgroundLuminance(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%li)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_264256A08[a1];
  }

  return v1;
}

__CFString *NSStringFromMTLumaDodgeGraphicsQuality(uint64_t a1)
{
  if (a1)
  {
    if (a1 == -100)
    {
      id v2 = @"low";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(%li)", a1);
      id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v2 = @"high";
  }
  return v2;
}

uint64_t ____supportedAnimationPropertyKey_block_invoke()
{
  __supportedAnimationPropertyKey___animatableKeys = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"filters.homeAffordanceBase.inputAddWhite", @"filters.homeAffordanceBase.inputAmount", @"filters.homeAffordanceBase.inputOverlayOpacity", @"filters.gaussianBlur.inputRadius", @"filters.colorBrightness.inputAmount", @"filters.colorSaturate.inputAmount", @"filters.colorMatrix.inputColorMatrix", 0);

  return MEMORY[0x270F9A758]();
}

uint64_t MTIsValidBlurInputQuality(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"default"] & 1) != 0
    || ([v1 isEqualToString:@"low"] & 1) != 0
    || ([v1 isEqualToString:@"medium"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"high"];
  }

  return v2;
}

uint64_t MTCompareBlurInputQualities(void *a1, void *a2)
{
  uint64_t v3 = a2;
  v4 = a1;
  if (!MTIsValidBlurInputQuality(v4) || (MTIsValidBlurInputQuality(v3) & 1) == 0)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    v12 = objc_msgSend(NSString, "stringWithUTF8String:", "NSComparisonResult MTCompareBlurInputQualities(NSString *__strong, NSString *__strong)");
    [v11 handleFailureInFunction:v12, @"MTUtilities.m", 18, @"Invalid parameter not satisfying: %@", @"MTIsValidBlurInputQuality(inputQuality1) && MTIsValidBlurInputQuality(inputQuality2)" file lineNumber description];
  }
  if ([(__CFString *)v4 isEqualToString:@"default"]) {
    v5 = @"medium";
  }
  else {
    v5 = v4;
  }
  v6 = v5;

  if ([(__CFString *)v3 isEqualToString:@"default"]) {
    v7 = @"medium";
  }
  else {
    v7 = v3;
  }
  v8 = v7;

  if ([(__CFString *)v6 isEqualToString:v8])
  {
    uint64_t v9 = 0;
  }
  else if ([(__CFString *)v6 isEqualToString:@"low"])
  {
    uint64_t v9 = -1;
  }
  else if ([(__CFString *)v6 isEqualToString:@"high"])
  {
    uint64_t v9 = 1;
  }
  else if ([(__CFString *)v8 isEqualToString:@"low"])
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

double MTEdgeInsetsInvert(double a1)
{
  return -a1;
}

uint64_t MTRectApplyInsets(__n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, double a6, __n128 a7, double a8)
{
  return MEMORY[0x270F06248](a1, a2, a3, a4, a5, a8, a7, a6);
}

uint64_t MTRectApplyOutsets(__n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, double a6, __n128 a7, double a8)
{
  a5.n128_f64[0] = -a5.n128_f64[0];
  a7.n128_f64[0] = -a7.n128_f64[0];
  return MEMORY[0x270F06248](a1, a2, a3, a4, a5, -a8, a7, -a6);
}

__CFString *MTStringFromMaterialRecipe(uint64_t a1)
{
  result = @"[Undefined]";
  switch(a1)
  {
    case 0:
      result = @"MTMaterialRecipeNone";
      break;
    case 1:
      result = @"MTMaterialRecipeNotifications";
      break;
    case 2:
      result = @"MTMaterialRecipeWidgetHosts";
      break;
    case 3:
      result = @"MTMaterialRecipeWidgets";
      break;
    case 4:
      result = @"MTMaterialRecipeControlCenterModules";
      break;
    case 5:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
      return result;
    case 6:
      result = @"MTMaterialRecipePreviewBackground";
      break;
    case 7:
      goto LABEL_4;
    case 8:
      result = @"MTMaterialRecipeControlCenterModulesSheer";
      break;
    case 9:
      result = @"MTMaterialRecipeSiriPlatter";
      break;
    case 10:
      result = @"MTMaterialRecipeSiriPlatterSheer";
      break;
    case 11:
      result = @"MTMaterialRecipeSiriDialogue";
      break;
    case 12:
      result = @"MTMaterialRecipeSpotlightPlatter";
      break;
    case 13:
      result = @"MTMaterialRecipeSpotlightPlatterSheer";
      break;
    case 14:
      result = @"MTMaterialRecipeSpotlightBackground";
      break;
    case 15:
      result = @"MTMaterialRecipeCarPlayNotifications";
      break;
    case 16:
      result = @"MTMaterialRecipeSiriBackground";
      break;
    case 17:
      result = @"MTMaterialRecipeSleepPlatter";
      break;
    case 18:
      result = @"MTMaterialRecipeSleepPlatterSheer";
      break;
    case 19:
      result = @"MTMaterialRecipeDock";
      break;
    case 20:
      result = @"MTMaterialRecipeControlCenterBackground";
      break;
    case 21:
      result = @"MTMaterialRecipeControlCenterBackgroundSheer";
      break;
    case 22:
      result = @"MTMaterialRecipeSessions";
      break;
    case 23:
      result = @"MTMaterialRecipeActivityAmbientCompact";
      break;
    case 50:
      result = @"MTMaterialRecipeSystemChromeBackground";
      break;
    case 51:
      result = @"MTMaterialRecipeSystemVibrantBackgroundUltraThin";
      break;
    case 52:
      result = @"MTMaterialRecipeSystemVibrantBackgroundThin";
      break;
    case 53:
      result = @"MTMaterialRecipeSystemVibrantBackgroundRegular";
      break;
    case 54:
      result = @"MTMaterialRecipeSystemVibrantBackgroundThick";
      break;
    default:
      if (a1 == 101) {
LABEL_4:
      }
        result = @"MTMaterialRecipeNotificationsDark";
      break;
  }
  return result;
}

id _MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle(uint64_t a1, uint64_t a2)
{
  return MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyleInShadow(a1, a2, 0);
}

id MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyle(uint64_t a1, uint64_t a2)
{
  return MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyleInShadow(a1, a2, 0);
}

uint64_t _MTInternalVibrancyEffectStyleForPublicStyle(uint64_t a1)
{
  if (!v2 & v1)
  {
    if (((1 << (a1 - 101)) & 0x80E0F) != 0) {
      uint64_t v3 = a1;
    }
    else {
      uint64_t v3 = 0;
    }
    if ((unint64_t)(a1 - 101) <= 0x13) {
      return v3;
    }
    else {
      return 0;
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        uint64_t result = 101;
        break;
      case 1:
        uint64_t result = 102;
        break;
      case 2:
        uint64_t result = 103;
        break;
      case 3:
        uint64_t result = 104;
        break;
      case 4:
        uint64_t result = 110;
        break;
      case 5:
        uint64_t result = 111;
        break;
      case 6:
        uint64_t result = 112;
        break;
      case 7:
        uint64_t result = 120;
        break;
      default:
        JUMPOUT(0);
    }
  }
  return result;
}

id _MTCoreMaterialRecipeNameForSystemColorCompatibleWithTraitCollection(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)*MEMORY[0x263F366D0];
  if ((unint64_t)(a1 - 20) <= 4)
  {
    v5 = MTCoreMaterialVisualStyleForVisualStyle(a1);
    if (v5)
    {
      uint64_t v6 = [v3 userInterfaceStyle];
      v7 = (void *)MEMORY[0x263F367B0];
      if (v6 != 2) {
        v7 = (void *)MEMORY[0x263F367B8];
      }
      if (*v7)
      {
        uint64_t v8 = MTCoreMaterialRecipeForVisualStyleFromStyleWithName();

        id v4 = (id)v8;
      }
    }
  }

  return v4;
}

id MTCoreMaterialPlatformColorsStyleNameForUserInterfaceStyle(uint64_t a1)
{
  char v1 = (id *)MEMORY[0x263F367B0];
  if (a1 != 2) {
    char v1 = (id *)MEMORY[0x263F367B8];
  }
  return *v1;
}

id _MTCoreMaterialRecipeNameForSystemColor(uint64_t a1)
{
  char v2 = [MEMORY[0x263F1CB00] currentTraitCollection];
  id v3 = _MTCoreMaterialRecipeNameForSystemColorCompatibleWithTraitCollection(a1, v2);

  return v3;
}

id MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyleInShadow(uint64_t a1, uint64_t a2, int a3)
{
  id v4 = 0;
  switch(a1)
  {
    case 0:
      v5 = (void **)MEMORY[0x263F366D0];
      goto LABEL_29;
    case 1:
    case 2:
    case 3:
      v5 = (void **)MEMORY[0x263F36738];
      uint64_t v6 = (void **)MEMORY[0x263F36730];
      goto LABEL_27;
    case 4:
    case 16:
      v5 = (void **)MEMORY[0x263F366B0];
      goto LABEL_29;
    case 5:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
      goto LABEL_31;
    case 6:
      v5 = (void **)MEMORY[0x263F36740];
      goto LABEL_29;
    case 7:
    case 11:
      goto LABEL_8;
    case 8:
      v5 = (void **)MEMORY[0x263F366C8];
      goto LABEL_29;
    case 9:
    case 12:
    case 17:
      v5 = (void **)MEMORY[0x263F36698];
      uint64_t v6 = (void **)MEMORY[0x263F36690];
      goto LABEL_27;
    case 10:
    case 13:
    case 18:
      v5 = (void **)MEMORY[0x263F366A8];
      uint64_t v6 = (void **)MEMORY[0x263F366A0];
      goto LABEL_27;
    case 14:
      v7 = (void **)MEMORY[0x263F36688];
      if (a2 != 2 && _os_feature_enabled_impl()) {
        v7 = (void **)MEMORY[0x263F36680];
      }
      uint64_t v8 = *v7;
      goto LABEL_30;
    case 15:
    case 53:
      v5 = (void **)MEMORY[0x263F366E8];
      uint64_t v6 = (void **)MEMORY[0x263F366F0];
      goto LABEL_27;
    case 19:
      v5 = (void **)MEMORY[0x263F36678];
      uint64_t v6 = (void **)MEMORY[0x263F36670];
      goto LABEL_27;
    case 20:
      v5 = (void **)MEMORY[0x263F366B8];
      goto LABEL_29;
    case 21:
      v5 = (void **)MEMORY[0x263F366C0];
      goto LABEL_29;
    case 22:
      v5 = (void **)MEMORY[0x263F36748];
      goto LABEL_29;
    case 23:
      v5 = (void **)MEMORY[0x263F36668];
      goto LABEL_29;
    case 50:
      v5 = (void **)MEMORY[0x263F366D8];
      uint64_t v6 = (void **)MEMORY[0x263F366E0];
      goto LABEL_27;
    case 51:
      v5 = (void **)MEMORY[0x263F36720];
      uint64_t v6 = (void **)MEMORY[0x263F36728];
      goto LABEL_27;
    case 52:
      v5 = (void **)MEMORY[0x263F36710];
      uint64_t v6 = (void **)MEMORY[0x263F36718];
      goto LABEL_27;
    case 54:
      v5 = (void **)MEMORY[0x263F366F8];
      uint64_t v6 = (void **)MEMORY[0x263F36708];
      if (!a3) {
        uint64_t v6 = (void **)MEMORY[0x263F36700];
      }
LABEL_27:
      if (a2 != 2) {
        v5 = v6;
      }
      goto LABEL_29;
    default:
      if (a1 != 101) {
        goto LABEL_31;
      }
LABEL_8:
      v5 = (void **)MEMORY[0x263F36738];
LABEL_29:
      uint64_t v8 = *v5;
LABEL_30:
      id v4 = v8;
LABEL_31:
      return v4;
  }
}

id MTCoreMaterialRecipeForMaterialRecipe(uint64_t a1)
{
  return MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyleInShadow(a1, 0, 0);
}

id MTCoreMaterialVisualStyleCategoryForVisualStyleCategory(uint64_t a1)
{
  id v2 = (id)*MEMORY[0x263F36758];
  if ((unint64_t)(a1 - 1) <= 2)
  {
    id v3 = **((id **)&unk_264256CC8 + a1 - 1);

    id v2 = v3;
  }

  return v2;
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x270F10748]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x270F10758]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x270F107E8]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x270F10800]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x270F10820]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x270F108D8]();
}

uint64_t BSSizeEqualToSize()
{
  return MEMORY[0x270F10958]();
}

void CGImageRelease(CGImageRef image)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MTCoreMaterialRecipeForVisualStyleFromRecipeFromBundle()
{
  return MEMORY[0x270F1A790]();
}

uint64_t MTCoreMaterialRecipeForVisualStyleFromStyleWithName()
{
  return MEMORY[0x270F1A798]();
}

uint64_t MTDimensionsForContinuousCornerRadiusInBounds()
{
  return MEMORY[0x270F1A7A0]();
}

uint64_t MTDynamicBlurRadiusGraphicsQuality()
{
  return MEMORY[0x270F1A7A8]();
}

uint64_t MTEdgeOutsetsForCoreMaterialShadowProperties()
{
  return MEMORY[0x270F1A7B0]();
}

uint64_t MTResizableAreaForCornerDimensionsInBounds()
{
  return MEMORY[0x270F1A7C0]();
}

uint64_t MTShadowImageCreateWithCoreMaterialShadowProperties()
{
  return MEMORY[0x270F1A7C8]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F05F20]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x270F05F28]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

void UIRectFill(CGRect rect)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x270F9A478](cls, name);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}