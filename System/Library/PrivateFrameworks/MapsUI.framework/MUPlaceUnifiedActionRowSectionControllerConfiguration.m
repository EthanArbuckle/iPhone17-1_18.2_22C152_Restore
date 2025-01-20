@interface MUPlaceUnifiedActionRowSectionControllerConfiguration
- (BOOL)canShowDetourTime;
- (BOOL)canShowDownloadOffline;
- (BOOL)isSearchAlongRoute;
- (BOOL)shouldPerformMapsExtensionDiscovery;
- (BOOL)shouldPromoteDownloadOffline;
- (BOOL)shouldShowContactsAction;
- (BOOL)showMoreButtonIfAvailable;
- (GEOUnifiedActionButtonModuleConfiguration)buttonModuleConfiguration;
- (MKETAProvider)etaProvider;
- (MKPlaceActionManager)actionManager;
- (MUAMSResultProvider)amsResultProvider;
- (MUExternalActionHandling)externalActionHandler;
- (MUHeaderButtonMenuActionProvider)moreActionsProvider;
- (MUPlaceActionRowMenuProvider)actionRowMenuProvider;
- (MUTimeExpirableLRUCache)artworkCache;
- (_MKPlaceActionButtonController)secondaryActionButtonController;
- (unint64_t)primaryButtonType;
- (void)setActionManager:(id)a3;
- (void)setActionRowMenuProvider:(id)a3;
- (void)setAmsResultProvider:(id)a3;
- (void)setArtworkCache:(id)a3;
- (void)setButtonModuleConfiguration:(id)a3;
- (void)setCanShowDetourTime:(BOOL)a3;
- (void)setCanShowDownloadOffline:(BOOL)a3;
- (void)setEtaProvider:(id)a3;
- (void)setExternalActionHandler:(id)a3;
- (void)setIsSearchAlongRoute:(BOOL)a3;
- (void)setMoreActionsProvider:(id)a3;
- (void)setPrimaryButtonType:(unint64_t)a3;
- (void)setSecondaryActionButtonController:(id)a3;
- (void)setShouldPerformMapsExtensionDiscovery:(BOOL)a3;
- (void)setShouldPromoteDownloadOffline:(BOOL)a3;
- (void)setShouldShowContactsAction:(BOOL)a3;
- (void)setShowMoreButtonIfAvailable:(BOOL)a3;
@end

@implementation MUPlaceUnifiedActionRowSectionControllerConfiguration

- (MKPlaceActionManager)actionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionManager);
  return (MKPlaceActionManager *)WeakRetained;
}

- (void)setActionManager:(id)a3
{
}

- (unint64_t)primaryButtonType
{
  return self->_primaryButtonType;
}

- (void)setPrimaryButtonType:(unint64_t)a3
{
  self->_primaryButtonType = a3;
}

- (MUHeaderButtonMenuActionProvider)moreActionsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_moreActionsProvider);
  return (MUHeaderButtonMenuActionProvider *)WeakRetained;
}

- (void)setMoreActionsProvider:(id)a3
{
}

- (MUPlaceActionRowMenuProvider)actionRowMenuProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionRowMenuProvider);
  return (MUPlaceActionRowMenuProvider *)WeakRetained;
}

- (void)setActionRowMenuProvider:(id)a3
{
}

- (MKETAProvider)etaProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_etaProvider);
  return (MKETAProvider *)WeakRetained;
}

- (void)setEtaProvider:(id)a3
{
}

- (MUExternalActionHandling)externalActionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_externalActionHandler);
  return (MUExternalActionHandling *)WeakRetained;
}

- (void)setExternalActionHandler:(id)a3
{
}

- (GEOUnifiedActionButtonModuleConfiguration)buttonModuleConfiguration
{
  return self->_buttonModuleConfiguration;
}

- (void)setButtonModuleConfiguration:(id)a3
{
}

- (BOOL)shouldPerformMapsExtensionDiscovery
{
  return self->_shouldPerformMapsExtensionDiscovery;
}

- (void)setShouldPerformMapsExtensionDiscovery:(BOOL)a3
{
  self->_shouldPerformMapsExtensionDiscovery = a3;
}

- (BOOL)canShowDetourTime
{
  return self->_canShowDetourTime;
}

- (void)setCanShowDetourTime:(BOOL)a3
{
  self->_canShowDetourTime = a3;
}

- (BOOL)isSearchAlongRoute
{
  return self->_isSearchAlongRoute;
}

- (void)setIsSearchAlongRoute:(BOOL)a3
{
  self->_isSearchAlongRoute = a3;
}

- (BOOL)showMoreButtonIfAvailable
{
  return self->_showMoreButtonIfAvailable;
}

- (void)setShowMoreButtonIfAvailable:(BOOL)a3
{
  self->_showMoreButtonIfAvailable = a3;
}

- (BOOL)shouldShowContactsAction
{
  return self->_shouldShowContactsAction;
}

- (void)setShouldShowContactsAction:(BOOL)a3
{
  self->_shouldShowContactsAction = a3;
}

- (_MKPlaceActionButtonController)secondaryActionButtonController
{
  return self->_secondaryActionButtonController;
}

- (void)setSecondaryActionButtonController:(id)a3
{
}

- (MUTimeExpirableLRUCache)artworkCache
{
  return self->_artworkCache;
}

- (void)setArtworkCache:(id)a3
{
}

- (MUAMSResultProvider)amsResultProvider
{
  return self->_amsResultProvider;
}

- (void)setAmsResultProvider:(id)a3
{
}

- (BOOL)canShowDownloadOffline
{
  return self->_canShowDownloadOffline;
}

- (void)setCanShowDownloadOffline:(BOOL)a3
{
  self->_canShowDownloadOffline = a3;
}

- (BOOL)shouldPromoteDownloadOffline
{
  return self->_shouldPromoteDownloadOffline;
}

- (void)setShouldPromoteDownloadOffline:(BOOL)a3
{
  self->_shouldPromoteDownloadOffline = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsResultProvider, 0);
  objc_storeStrong((id *)&self->_artworkCache, 0);
  objc_storeStrong((id *)&self->_secondaryActionButtonController, 0);
  objc_storeStrong((id *)&self->_buttonModuleConfiguration, 0);
  objc_destroyWeak((id *)&self->_externalActionHandler);
  objc_destroyWeak((id *)&self->_etaProvider);
  objc_destroyWeak((id *)&self->_actionRowMenuProvider);
  objc_destroyWeak((id *)&self->_moreActionsProvider);
  objc_destroyWeak((id *)&self->_actionManager);
}

@end