@interface ATXHomeScreenSuggestionClientGuardedData
@end

@implementation ATXHomeScreenSuggestionClientGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->widgetDismissManager, 0);
  objc_storeStrong((id *)&self->logger, 0);
  objc_storeStrong((id *)&self->store, 0);
  objc_storeStrong((id *)&self->stagedTodayPagePanels, 0);
  objc_storeStrong((id *)&self->stagedTodayPageStacks, 0);
  objc_storeStrong((id *)&self->stagedDockAppList, 0);
  objc_storeStrong((id *)&self->stagedHomeScreenPageConfigurations, 0);
  objc_storeStrong((id *)&self->stacksAffectedByDebugRotation, 0);
  objc_storeStrong((id *)&self->currentBlendingCacheId, 0);
  objc_storeStrong((id *)&self->pagesToUsedFallbackAppSuggestions, 0);
  objc_storeStrong((id *)&self->currentFallbacks, 0);
  objc_storeStrong((id *)&self->currentStackSuggestions, 0);
  objc_storeStrong((id *)&self->currentAppPredictionPanelLayouts, 0);
  objc_storeStrong((id *)&self->currentSuggestionWidgetLayouts, 0);
  objc_storeStrong((id *)&self->previousSuggestedSuggestionWidgetLayouts, 0);
  objc_storeStrong((id *)&self->appPanelIdentifierToPageIndex, 0);
  objc_storeStrong((id *)&self->suppressedSuggestions, 0);
  objc_storeStrong((id *)&self->knownTodayPageProactiveWidgetUniqueIdsAtTimeOfBlending, 0);
  objc_storeStrong((id *)&self->knownHomeScreenProactiveWidgetUniqueIdsAtTimeOfBlending, 0);
  objc_storeStrong((id *)&self->layoutUpdateSuppressionTimer, 0);
  objc_storeStrong((id *)&self->rotationSuppressionTimer, 0);

  objc_storeStrong((id *)&self->observers, 0);
}

@end