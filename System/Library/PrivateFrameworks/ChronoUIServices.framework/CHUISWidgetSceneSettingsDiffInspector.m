@interface CHUISWidgetSceneSettingsDiffInspector
- (void)_observerForKey:(int64_t)a3 observer:(id)a4;
- (void)inspectDiff:(id)a3 withContext:(id)a4;
- (void)observeAnimationsPausedWithBlock:(id)a3;
- (void)observeCanAppearInSecureEnvironmentWithBlock:(id)a3;
- (void)observeClipBehaviorWithBlock:(id)a3;
- (void)observeColorSchemeWithBlock:(id)a3;
- (void)observeContentPausedWithBlock:(id)a3;
- (void)observeContentTypeWithBlock:(id)a3;
- (void)observeInlineTextParametersWithBlock:(id)a3;
- (void)observeInteractionDisabledWithBlock:(id)a3;
- (void)observeKeybagLockPolicyWithBlock:(id)a3;
- (void)observeMetricsWithBlock:(id)a3;
- (void)observePrefersUnredactedContentInLowLuminanceEnvironmentWithBlock:(id)a3;
- (void)observeRenderSchemeWithBlock:(id)a3;
- (void)observeShowsWidgetLabelWithBlock:(id)a3;
- (void)observeSupportsLowLuminanceWithBlock:(id)a3;
- (void)observeTintingParametersWithBlock:(id)a3;
- (void)observeVisibilityWithBlock:(id)a3;
- (void)observeVisibleEntryShouldSnapshotWithBlock:(id)a3;
- (void)observeWantsBaseContentTouchEventsWithBlock:(id)a3;
- (void)observeWidgetConfigurationIdentifierBlock:(id)a3;
- (void)observeWidgetPriorityWithBlock:(id)a3;
- (void)observeWidgetWithBlock:(id)a3;
@end

@implementation CHUISWidgetSceneSettingsDiffInspector

- (void)inspectDiff:(id)a3 withContext:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CHUISWidgetSceneSettingsDiffInspector;
  [(FBSSettingsDiffInspector *)&v4 inspectDiff:a3 withContext:a4];
}

- (void)observeWidgetWithBlock:(id)a3
{
}

- (void)observeMetricsWithBlock:(id)a3
{
}

- (void)observeWidgetConfigurationIdentifierBlock:(id)a3
{
}

- (void)observeVisibilityWithBlock:(id)a3
{
}

- (void)observeContentTypeWithBlock:(id)a3
{
}

- (void)observeAnimationsPausedWithBlock:(id)a3
{
}

- (void)observeContentPausedWithBlock:(id)a3
{
}

- (void)observeVisibleEntryShouldSnapshotWithBlock:(id)a3
{
}

- (void)observeCanAppearInSecureEnvironmentWithBlock:(id)a3
{
}

- (void)observeKeybagLockPolicyWithBlock:(id)a3
{
}

- (void)observePrefersUnredactedContentInLowLuminanceEnvironmentWithBlock:(id)a3
{
}

- (void)observeSupportsLowLuminanceWithBlock:(id)a3
{
}

- (void)observeTintingParametersWithBlock:(id)a3
{
}

- (void)observeInlineTextParametersWithBlock:(id)a3
{
}

- (void)observeColorSchemeWithBlock:(id)a3
{
}

- (void)observeShowsWidgetLabelWithBlock:(id)a3
{
}

- (void)observeWidgetPriorityWithBlock:(id)a3
{
}

- (void)observeInteractionDisabledWithBlock:(id)a3
{
}

- (void)observeRenderSchemeWithBlock:(id)a3
{
}

- (void)observeClipBehaviorWithBlock:(id)a3
{
}

- (void)observeWantsBaseContentTouchEventsWithBlock:(id)a3
{
}

- (void)_observerForKey:(int64_t)a3 observer:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__CHUISWidgetSceneSettingsDiffInspector__observerForKey_observer___block_invoke;
    v8[3] = &unk_1E62AF430;
    id v9 = v6;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:a3 withBlock:v8];
  }
}

uint64_t __66__CHUISWidgetSceneSettingsDiffInspector__observerForKey_observer___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end