@interface MapsSuggestionsMapsLocationAllowedTriggeringToggle
- (BOOL)isTrue;
- (void)dealloc;
- (void)didAddFirstObserver;
- (void)didRemoveLastObserver;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation MapsSuggestionsMapsLocationAllowedTriggeringToggle

- (void)didAddFirstObserver
{
  v6 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  dispatch_assert_queue_V2(v6);

  if (!self->_locationManager)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1E600]);
    id v7 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
    v4 = (CLLocationManager *)objc_msgSend(v3, "initWithEffectiveBundleIdentifier:delegate:onQueue:", @"com.apple.Maps", self);
    locationManager = self->_locationManager;
    self->_locationManager = v4;
  }
}

- (void)didRemoveLastObserver
{
  id v3 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  locationManager = self->_locationManager;
  self->_locationManager = 0;
}

- (void)dealloc
{
  id v3 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  v8 = __61__MapsSuggestionsMapsLocationAllowedTriggeringToggle_dealloc__block_invoke;
  v9 = &unk_1E5CB85E0;
  v10 = self;
  label = dispatch_queue_get_label(v3);
  if (label == dispatch_queue_get_label(0))
  {
    v5 = (void *)MEMORY[0x1AD0C8E80]();
    v8((uint64_t)block);
  }
  else
  {
    dispatch_sync(v3, block);
  }

  v6.receiver = self;
  v6.super_class = (Class)MapsSuggestionsMapsLocationAllowedTriggeringToggle;
  [(MapsSuggestionsMapsLocationAllowedTriggeringToggle *)&v6 dealloc];
}

void __61__MapsSuggestionsMapsLocationAllowedTriggeringToggle_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 56);
  *(void *)(v1 + 56) = 0;
}

- (BOOL)isTrue
{
  if (![(MapsSuggestionsTriggeringToggle *)self timesUpdated]) {
    [(MapsSuggestionsTriggeringToggle *)self setState:MapsSuggestionsMapsAppIsAllowedLocations()];
  }
  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsMapsLocationAllowedTriggeringToggle;
  return [(MapsSuggestionsTriggeringToggle *)&v4 isTrue];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 authorizationStatus];
  objc_super v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    v8 = "-[MapsSuggestionsMapsLocationAllowedTriggeringToggle locationManagerDidChangeAuthorization:]";
    __int16 v9 = 1024;
    int v10 = v5;
    _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "%s status=%d", (uint8_t *)&v7, 0x12u);
  }

  [(MapsSuggestionsTriggeringToggle *)self setState:(v5 - 3) < 2];
}

- (void).cxx_destruct
{
}

@end