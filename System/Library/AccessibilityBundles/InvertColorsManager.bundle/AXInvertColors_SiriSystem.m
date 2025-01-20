@interface AXInvertColors_SiriSystem
+ (id)bundleName;
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
@end

@implementation AXInvertColors_SiriSystem

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"SRTapToEditViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SRGuideViewCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SRGuideDetailPhraseViewCellInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 4;
}

+ (id)bundleName
{
  return @"System.siriUIBundle";
}

@end