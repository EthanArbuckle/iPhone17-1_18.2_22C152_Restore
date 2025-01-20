@interface HNObjCFeatureFlags
+ (BOOL)isContextualUnderstandingEnabled;
+ (BOOL)isHumanUnderstandingDataCollectionEnabled;
+ (BOOL)isHumanUnderstandingEvidenceEnabled;
@end

@implementation HNObjCFeatureFlags

+ (BOOL)isHumanUnderstandingDataCollectionEnabled
{
  return MEMORY[0x270F9A6D0](HNFeatureFlags, sel_isHumanUnderstandingDataCollectionEnabled);
}

+ (BOOL)isHumanUnderstandingEvidenceEnabled
{
  return MEMORY[0x270F9A6D0](HNFeatureFlags, sel_isHumanUnderstandingEvidenceEnabled);
}

+ (BOOL)isContextualUnderstandingEnabled
{
  return MEMORY[0x270F9A6D0](HNFeatureFlags, sel_isContextualUnderstandingEnabled);
}

@end