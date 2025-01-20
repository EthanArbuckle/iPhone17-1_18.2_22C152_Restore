@interface MUHeaderButtonsViewConfiguration
- (BOOL)showMoreButton;
- (MUHeaderButtonMenuActionProvider)menuProvider;
- (NSArray)possibleAnalyticActions;
- (double)detourTime;
- (void)setDetourTime:(double)a3;
- (void)setMenuProvider:(id)a3;
- (void)setPossibleAnalyticActions:(id)a3;
- (void)setShowMoreButton:(BOOL)a3;
@end

@implementation MUHeaderButtonsViewConfiguration

- (double)detourTime
{
  return self->_detourTime;
}

- (void)setDetourTime:(double)a3
{
  self->_detourTime = a3;
}

- (BOOL)showMoreButton
{
  return self->_showMoreButton;
}

- (void)setShowMoreButton:(BOOL)a3
{
  self->_showMoreButton = a3;
}

- (MUHeaderButtonMenuActionProvider)menuProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuProvider);
  return (MUHeaderButtonMenuActionProvider *)WeakRetained;
}

- (void)setMenuProvider:(id)a3
{
}

- (NSArray)possibleAnalyticActions
{
  return self->_possibleAnalyticActions;
}

- (void)setPossibleAnalyticActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleAnalyticActions, 0);
  objc_destroyWeak((id *)&self->_menuProvider);
}

@end