@interface MapsSuggestionsMapsInstalledTriggeringToggle
- (BOOL)isTrue;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)didAddFirstObserver;
- (void)didRemoveLastObserver;
@end

@implementation MapsSuggestionsMapsInstalledTriggeringToggle

- (BOOL)isTrue
{
  if (![(MapsSuggestionsTriggeringToggle *)self timesUpdated]) {
    [(MapsSuggestionsTriggeringToggle *)self setState:MapsSuggestionsMapsAppIsInstalled()];
  }
  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsMapsInstalledTriggeringToggle;
  return [(MapsSuggestionsTriggeringToggle *)&v4 isTrue];
}

- (void)didAddFirstObserver
{
  v3 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v4 addObserver:self];
}

- (void)didRemoveLastObserver
{
  v3 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v4 removeObserver:self];
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    v6 = "-[MapsSuggestionsMapsInstalledTriggeringToggle applicationsDidInstall:]";
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(MapsSuggestionsTriggeringToggle *)self setState:MapsSuggestionsMapsAppIsInstalled()];
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    v6 = "-[MapsSuggestionsMapsInstalledTriggeringToggle applicationsDidUninstall:]";
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(MapsSuggestionsTriggeringToggle *)self setState:MapsSuggestionsMapsAppIsInstalled()];
}

@end