@interface MUPlaceHeaderButtonsSectionControllerConfiguration
- (BOOL)canShowDetourTime;
- (BOOL)showMoreButton;
- (GEOHeaderButtonModuleConfiguration)buttonModuleConfiguration;
- (MKETAProvider)etaProvider;
- (MUHeaderButtonMenuActionProvider)menuProvider;
- (void)setButtonModuleConfiguration:(id)a3;
- (void)setCanShowDetourTime:(BOOL)a3;
- (void)setEtaProvider:(id)a3;
- (void)setMenuProvider:(id)a3;
- (void)setShowMoreButton:(BOOL)a3;
@end

@implementation MUPlaceHeaderButtonsSectionControllerConfiguration

- (MKETAProvider)etaProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_etaProvider);
  return (MKETAProvider *)WeakRetained;
}

- (void)setEtaProvider:(id)a3
{
}

- (BOOL)showMoreButton
{
  return self->_showMoreButton;
}

- (void)setShowMoreButton:(BOOL)a3
{
  self->_showMoreButton = a3;
}

- (BOOL)canShowDetourTime
{
  return self->_canShowDetourTime;
}

- (void)setCanShowDetourTime:(BOOL)a3
{
  self->_canShowDetourTime = a3;
}

- (GEOHeaderButtonModuleConfiguration)buttonModuleConfiguration
{
  return self->_buttonModuleConfiguration;
}

- (void)setButtonModuleConfiguration:(id)a3
{
}

- (MUHeaderButtonMenuActionProvider)menuProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuProvider);
  return (MUHeaderButtonMenuActionProvider *)WeakRetained;
}

- (void)setMenuProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menuProvider);
  objc_storeStrong((id *)&self->_buttonModuleConfiguration, 0);
  objc_destroyWeak((id *)&self->_etaProvider);
}

@end