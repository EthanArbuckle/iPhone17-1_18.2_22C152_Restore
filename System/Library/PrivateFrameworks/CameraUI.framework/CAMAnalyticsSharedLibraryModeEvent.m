@interface CAMAnalyticsSharedLibraryModeEvent
- (CAMAnalyticsSharedLibraryModeEvent)initWithLibrarySelectionController:(id)a3;
- (id)eventName;
- (void)publish;
@end

@implementation CAMAnalyticsSharedLibraryModeEvent

- (CAMAnalyticsSharedLibraryModeEvent)initWithLibrarySelectionController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMAnalyticsSharedLibraryModeEvent;
  v6 = [(CAMAnalyticsEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_librarySelectionController, a3);
  }

  return v7;
}

- (id)eventName
{
  return @"session.libraryswitch";
}

- (void)publish
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(CAMAnalyticsEvent *)self _eventMap];
  v4 = CAMSharedLibraryModeDescription([(CAMLibrarySelectionController *)self->_librarySelectionController sharedLibraryMode]);
  [v3 setObject:v4 forKeyedSubscript:@"currentMode"];

  id v5 = CAMSharedLibraryModeDescription([(CAMLibrarySelectionController *)self->_librarySelectionController sharedLibraryInitialMode]);
  [v3 setObject:v5 forKeyedSubscript:@"initialMode"];

  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMLibrarySelectionController userInteractionsCount](self->_librarySelectionController, "userInteractionsCount"));
  [v3 setObject:v6 forKeyedSubscript:@"userInteractionCount"];

  v9.receiver = self;
  v9.super_class = (Class)CAMAnalyticsSharedLibraryModeEvent;
  [(CAMAnalyticsEvent *)&v9 publish];
  v7 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(CAMAnalyticsSharedLibraryModeEvent *)self eventName];
    *(_DWORD *)buf = 138543618;
    v11 = v8;
    __int16 v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "CoreAnalytics: %{public}@: %{public}@", buf, 0x16u);
  }
}

- (void).cxx_destruct
{
}

@end