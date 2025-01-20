@interface ATXHomeScreenLogUnlockSessionManagerSettingsWrapper
- (BOOL)appLibraryEnabled;
- (BOOL)hasAppPredictionPanel;
- (BOOL)hasAppPredictionPanelToday;
- (BOOL)hasSuggestionsWidget;
- (BOOL)hasSuggestionsWidgetToday;
- (BOOL)spotlightEnabled;
- (void)setAppLibraryEnabled:(BOOL)a3;
- (void)setHasAppPredictionPanel:(BOOL)a3;
- (void)setHasAppPredictionPanelToday:(BOOL)a3;
- (void)setHasSuggestionsWidget:(BOOL)a3;
- (void)setHasSuggestionsWidgetToday:(BOOL)a3;
- (void)setSpotlightEnabled:(BOOL)a3;
@end

@implementation ATXHomeScreenLogUnlockSessionManagerSettingsWrapper

- (BOOL)spotlightEnabled
{
  return self->_spotlightEnabled;
}

- (void)setSpotlightEnabled:(BOOL)a3
{
  self->_spotlightEnabled = a3;
}

- (BOOL)hasSuggestionsWidget
{
  return self->_hasSuggestionsWidget;
}

- (void)setHasSuggestionsWidget:(BOOL)a3
{
  self->_hasSuggestionsWidget = a3;
}

- (BOOL)hasSuggestionsWidgetToday
{
  return self->_hasSuggestionsWidgetToday;
}

- (void)setHasSuggestionsWidgetToday:(BOOL)a3
{
  self->_hasSuggestionsWidgetToday = a3;
}

- (BOOL)hasAppPredictionPanel
{
  return self->_hasAppPredictionPanel;
}

- (void)setHasAppPredictionPanel:(BOOL)a3
{
  self->_hasAppPredictionPanel = a3;
}

- (BOOL)hasAppPredictionPanelToday
{
  return self->_hasAppPredictionPanelToday;
}

- (void)setHasAppPredictionPanelToday:(BOOL)a3
{
  self->_hasAppPredictionPanelToday = a3;
}

- (BOOL)appLibraryEnabled
{
  return self->_appLibraryEnabled;
}

- (void)setAppLibraryEnabled:(BOOL)a3
{
  self->_appLibraryEnabled = a3;
}

@end