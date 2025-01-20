@interface CRLFeatureFlagGroup
+ (BOOL)isAaBrandingEnabled;
+ (BOOL)isAdoptTipsNextEnabled;
+ (BOOL)isAllowMinRequiredVersionForGoodEnoughFidelityToSaveToCloudKitEnabled;
+ (BOOL)isAppAnalyticsEnabled;
+ (BOOL)isChangeShapeEnabled;
+ (BOOL)isDrawingDataDetectorsEnabled;
+ (BOOL)isEasierConnectionLinesEnabled;
+ (BOOL)isFileImportExportEnabled;
+ (BOOL)isFollowEnabled;
+ (BOOL)isHandwritingIntelligenceEnabled;
+ (BOOL)isMagicListsEnabled;
+ (BOOL)isMathPaperEnabled;
+ (BOOL)isMathPaperFeatureEnabled;
+ (BOOL)isPKDrawingExportEnabled;
+ (BOOL)isRedesignedTextCursorEnabled;
+ (BOOL)isScenesEnabled;
+ (BOOL)isSendACopyEnabled;
+ (BOOL)isSnapToGridEnabled;
+ (BOOL)isStencilsEnabled;
+ (BOOL)isThreeDimensionalObjectsEnabled;
+ (BOOL)isToolPickerItemAPIEnabled;
+ (BOOL)isUseSandboxEnvironmentEnabled;
+ (BOOL)isVerticalTextBoxAlignmentEnabled;
- (_TtC22FreeformDataclassOwner19CRLFeatureFlagGroup)init;
@end

@implementation CRLFeatureFlagGroup

+ (BOOL)isAaBrandingEnabled
{
  return @objc static CRLFeatureFlagGroup.isAaBrandingEnabled.getter((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for CRLAppleAccountFeatureFlags, (uint64_t (*)(void))lazy protocol witness table accessor for type CRLAppleAccountFeatureFlags and conformance CRLAppleAccountFeatureFlags);
}

+ (BOOL)isAdoptTipsNextEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 0);
}

+ (BOOL)isAllowMinRequiredVersionForGoodEnoughFidelityToSaveToCloudKitEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 24);
}

+ (BOOL)isAppAnalyticsEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 1);
}

+ (BOOL)isChangeShapeEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 5);
}

+ (BOOL)isDrawingDataDetectorsEnabled
{
  return @objc static CRLFeatureFlagGroup.isDrawingDataDetectorsEnabled.getter((uint64_t)a1, (uint64_t)a2, 1, 7);
}

+ (BOOL)isEasierConnectionLinesEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 8);
}

+ (BOOL)isFileImportExportEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 9);
}

+ (BOOL)isFollowEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 12);
}

+ (BOOL)isHandwritingIntelligenceEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 14);
}

+ (BOOL)isMagicListsEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 16);
}

+ (BOOL)isMathPaperEnabled
{
  return specialized static CRLFeatureFlagGroup.isMathPaperEnabled.getter() & 1;
}

+ (BOOL)isMathPaperFeatureEnabled
{
  return @objc static CRLFeatureFlagGroup.isDrawingDataDetectorsEnabled.getter((uint64_t)a1, (uint64_t)a2, 0, 15);
}

+ (BOOL)isPKDrawingExportEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 10);
}

+ (BOOL)isRedesignedTextCursorEnabled
{
  return @objc static CRLFeatureFlagGroup.isAaBrandingEnabled.getter((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for CRLUIKitFeatureFlags, (uint64_t (*)(void))lazy protocol witness table accessor for type CRLUIKitFeatureFlags and conformance CRLUIKitFeatureFlags);
}

+ (BOOL)isScenesEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 17);
}

+ (BOOL)isSendACopyEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 18);
}

+ (BOOL)isSnapToGridEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 19);
}

+ (BOOL)isStencilsEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 20);
}

+ (BOOL)isThreeDimensionalObjectsEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 21);
}

+ (BOOL)isToolPickerItemAPIEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 22);
}

+ (BOOL)isUseSandboxEnvironmentEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 25);
}

+ (BOOL)isVerticalTextBoxAlignmentEnabled
{
  return @objc static CRLFeatureFlagGroup.isAdoptTipsNextEnabled.getter((uint64_t)a1, (uint64_t)a2, 23);
}

- (_TtC22FreeformDataclassOwner19CRLFeatureFlagGroup)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLFeatureFlagGroup();
  return [(CRLFeatureFlagGroup *)&v3 init];
}

@end