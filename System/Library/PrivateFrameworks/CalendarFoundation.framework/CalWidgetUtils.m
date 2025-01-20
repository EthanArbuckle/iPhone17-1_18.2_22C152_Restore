@interface CalWidgetUtils
+ (double)lookaheadIntervalForDaysPerEntry:(int64_t)a3;
+ (void)_refreshWidgetKinds:(id)a3 reason:(id)a4;
+ (void)refreshDateWidgets;
+ (void)refreshEventWidgets;
@end

@implementation CalWidgetUtils

+ (void)refreshDateWidgets
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CalWidgetUtils_refreshDateWidgets__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (refreshDateWidgets_onceToken != -1) {
    dispatch_once(&refreshDateWidgets_onceToken, block);
  }
  [(id)refreshDateWidgets_refreshQueue executeBlock];
}

void __36__CalWidgetUtils_refreshDateWidgets__block_invoke(uint64_t a1)
{
  v2 = (void *)refreshDateWidgets_widgetKinds;
  refreshDateWidgets_widgetKinds = (uint64_t)&unk_1EE0D4540;

  v3 = [CalLimitingQueue alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__CalWidgetUtils_refreshDateWidgets__block_invoke_2;
  v6[3] = &__block_descriptor_40_e5_v8__0l;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = [(CalLimitingQueue *)v3 initWithQueue:0 andBlock:v6];
  v5 = (void *)refreshDateWidgets_refreshQueue;
  refreshDateWidgets_refreshQueue = v4;
}

uint64_t __36__CalWidgetUtils_refreshDateWidgets__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshWidgetKinds:refreshDateWidgets_widgetKinds reason:&stru_1EE0C39E0];
}

+ (void)refreshEventWidgets
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CalWidgetUtils_refreshEventWidgets__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (refreshEventWidgets_onceToken != -1) {
    dispatch_once(&refreshEventWidgets_onceToken, block);
  }
  [(id)refreshEventWidgets_refreshQueue executeBlock];
}

void __37__CalWidgetUtils_refreshEventWidgets__block_invoke(uint64_t a1)
{
  v2 = (void *)refreshEventWidgets_widgetKinds;
  refreshEventWidgets_widgetKinds = (uint64_t)&unk_1EE0D4558;

  v3 = [CalLimitingQueue alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__CalWidgetUtils_refreshEventWidgets__block_invoke_2;
  v6[3] = &__block_descriptor_40_e5_v8__0l;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = [(CalLimitingQueue *)v3 initWithQueue:0 andBlock:v6];
  v5 = (void *)refreshEventWidgets_refreshQueue;
  refreshEventWidgets_refreshQueue = v4;
}

uint64_t __37__CalWidgetUtils_refreshEventWidgets__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshWidgetKinds:refreshEventWidgets_widgetKinds reason:&stru_1EE0C39E0];
}

+ (void)_refreshWidgetKinds:(id)a3 reason:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v5 = a4;
  if (ChronoServicesLibraryCore())
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v6 = (void *)getCHSTimelineControllerClass_softClass;
    uint64_t v24 = getCHSTimelineControllerClass_softClass;
    if (!getCHSTimelineControllerClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCHSTimelineControllerClass_block_invoke;
      v27 = &unk_1E56CD8C0;
      v28 = &v21;
      __getCHSTimelineControllerClass_block_invoke((uint64_t)buf);
      v6 = (void *)v22[3];
    }
    v7 = v6;
    _Block_object_dispose(&v21, 8);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = v15;
    uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
          v12 = (void *)[[v7 alloc] initWithExtensionBundleIdentifier:@"com.apple.mobilecal.CalendarWidgetExtension" kind:v11];
          v13 = [v12 reloadTimelineWithReason:v5];
          if (v13)
          {
            v14 = +[CalFoundationLogSubsystem defaultCategory];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v11;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v13;
              _os_log_error_impl(&dword_190D88000, v14, OS_LOG_TYPE_ERROR, "Error while trying to reload widget with kind %@: %@", buf, 0x16u);
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v8);
    }
  }
}

+ (double)lookaheadIntervalForDaysPerEntry:(int64_t)a3
{
  return (double)a3 * 86400.0;
}

@end