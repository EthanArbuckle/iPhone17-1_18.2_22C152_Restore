@interface CHUISWatchComplicationsWidgetSceneClientSettingsDiffInspector
- (void)_observerForKey:(int64_t)a3 observer:(id)a4;
- (void)observeCurvedTextAngularWidthWithBlock:(id)a3;
@end

@implementation CHUISWatchComplicationsWidgetSceneClientSettingsDiffInspector

- (void)observeCurvedTextAngularWidthWithBlock:(id)a3
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
    v8[2] = __90__CHUISWatchComplicationsWidgetSceneClientSettingsDiffInspector__observerForKey_observer___block_invoke;
    v8[3] = &unk_1E62AF430;
    id v9 = v6;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:a3 withBlock:v8];
  }
}

uint64_t __90__CHUISWatchComplicationsWidgetSceneClientSettingsDiffInspector__observerForKey_observer___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end