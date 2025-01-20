@interface ATXUserEducationSuggestionCustomizeFocus(Internal)
+ (id)supportedModeSemanticTypeStrings;
+ (uint64_t)suggestionsAreSupportedForModeSemanticType:()Internal;
+ (void)supportedModeSemanticTypes;
- (id)server;
- (id)userDefaultsKeyForTrackingSuggestionState;
- (uint64_t)metricClass;
@end

@implementation ATXUserEducationSuggestionCustomizeFocus(Internal)

- (uint64_t)metricClass
{
  return objc_opt_class();
}

- (id)server
{
  v0 = +[ATXUserEducationSuggestionServer sharedInstance];
  v1 = [v0 customizeFocusServer];

  return v1;
}

+ (void)supportedModeSemanticTypes
{
  return &unk_1F27F3738;
}

+ (id)supportedModeSemanticTypeStrings
{
  v1 = [a1 supportedModeSemanticTypes];
  v2 = objc_msgSend(v1, "_pas_mappedArrayWithTransform:", &__block_literal_global_177);

  return v2;
}

+ (uint64_t)suggestionsAreSupportedForModeSemanticType:()Internal
{
  v4 = [a1 supportedModeSemanticTypes];
  v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 containsObject:v5];

  return v6;
}

- (id)userDefaultsKeyForTrackingSuggestionState
{
  v2 = NSString;
  v7.receiver = a1;
  v7.super_class = (Class)&off_1F2899280;
  v3 = objc_msgSendSuper2(&v7, sel_userDefaultsKeyForTrackingSuggestionState);
  [a1 modeSemanticType];
  v4 = DNDModeSemanticTypeToString();
  v5 = [v2 stringWithFormat:@"%@.%@.%@", v3, @"CustomizeFocus", v4];

  return v5;
}

@end