@interface CHUISWatchComplicationsWidgetSceneSettingsDiffInspector
- (void)_observerForKey:(int64_t)a3 observer:(id)a4;
- (void)observeBezelContentCenterWithBlock:(id)a3;
- (void)observeCornerPositionWithBlock:(id)a3;
- (void)observeCurvedLabelMetricsWithBlock:(id)a3;
- (void)observeGenerateSnapshotMetadataWithBlock:(id)a3;
- (void)observeIncludeAccessoryViewsWithBlock:(id)a3;
@end

@implementation CHUISWatchComplicationsWidgetSceneSettingsDiffInspector

- (void)observeCornerPositionWithBlock:(id)a3
{
}

- (void)observeCurvedLabelMetricsWithBlock:(id)a3
{
}

- (void)observeBezelContentCenterWithBlock:(id)a3
{
}

- (void)observeIncludeAccessoryViewsWithBlock:(id)a3
{
}

- (void)observeGenerateSnapshotMetadataWithBlock:(id)a3
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
    v8[2] = __84__CHUISWatchComplicationsWidgetSceneSettingsDiffInspector__observerForKey_observer___block_invoke;
    v8[3] = &unk_1E62AF430;
    id v9 = v6;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:a3 withBlock:v8];
  }
}

uint64_t __84__CHUISWatchComplicationsWidgetSceneSettingsDiffInspector__observerForKey_observer___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end