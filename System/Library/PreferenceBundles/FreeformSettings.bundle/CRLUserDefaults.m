@interface CRLUserDefaults
+ (NSDictionary)defaultDefaults;
+ (void)registerUserDefaults;
@end

@implementation CRLUserDefaults

+ (NSDictionary)defaultDefaults
{
  if (defaultDefaults_onceToken != -1) {
    dispatch_once(&defaultDefaults_onceToken, &__block_literal_global);
  }
  v2 = (void *)defaultDefaults_defaultDefaults;

  return (NSDictionary *)v2;
}

void __34__CRLUserDefaults_defaultDefaults__block_invoke(id a1)
{
  v6[0] = @"CRLSnapToGrid";
  v6[1] = @"CRLDisplayEdgeGuides";
  v7[0] = &__kCFBooleanFalse;
  v7[1] = &__kCFBooleanFalse;
  v6[2] = @"CRLDisplayCenterGuides";
  v6[3] = @"CRLDisplaySpacingGuides";
  v7[2] = &__kCFBooleanTrue;
  v7[3] = &__kCFBooleanTrue;
  v6[4] = @"CRLDisplaySizingGuides";
  v6[5] = @"CRLUseHapticFeedbackWhenSnapping";
  v6[6] = @"CRLEncryptSharePlayData";
  v6[7] = @"CRLDeleteBoardCleanupTolerance";
  v7[6] = &__kCFBooleanTrue;
  v7[7] = &off_4D30;
  v7[4] = &__kCFBooleanTrue;
  v7[5] = &__kCFBooleanTrue;
  v6[8] = @"CRLDeletedBoardTTL";
  v6[9] = @"CRLSelectAndScrollWithApplePencil";
  v7[8] = &off_4D48;
  v7[9] = &__kCFBooleanFalse;
  v6[10] = @"CRLMathRecognitionMode";
  v6[11] = @"CRLAppAnalyticsResetIdentifier";
  v7[10] = &off_4D60;
  v7[11] = &__kCFBooleanFalse;
  v6[12] = @"enableOSSignpost";
  v6[13] = @"CRLMultiSelectionShouldDisplaySingleBoundsUserDefault";
  v7[12] = &__kCFBooleanFalse;
  v7[13] = &__kCFBooleanTrue;
  v6[14] = @"CRLRulerUnitTypeUserDefault";
  v1 = +[NSLocale currentLocale];
  if ([v1 usesMetricSystem]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }
  v3 = +[NSNumber numberWithUnsignedInteger:v2];
  v7[14] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:15];
  v5 = (void *)defaultDefaults_defaultDefaults;
  defaultDefaults_defaultDefaults = v4;
}

+ (void)registerUserDefaults
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  v3 = [a1 defaultDefaults];
  [v4 registerDefaults:v3];
}

@end