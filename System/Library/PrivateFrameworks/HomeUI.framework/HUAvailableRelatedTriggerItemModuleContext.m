@interface HUAvailableRelatedTriggerItemModuleContext
- (BOOL)commitsAutomatically;
- (BOOL)hidesAddAutomationItem;
- (BOOL)hidesCustomTriggers;
- (BOOL)itemsAreEditable;
- (BOOL)showNaturalLightingItem;
- (BOOL)showsIcons;
- (HUAvailableRelatedTriggerItemModuleContext)init;
- (HUAvailableRelatedTriggerItemModuleContext)initWithContext:(id)a3;
- (NSNumber)defaultActiveValue;
- (NSString)analyticsPresentationContext;
- (unint64_t)engineOptions;
- (unint64_t)errorHandlingStrategy;
- (void)setAnalyticsPresentationContext:(id)a3;
- (void)setCommitsAutomatically:(BOOL)a3;
- (void)setDefaultActiveValue:(id)a3;
- (void)setEngineOptions:(unint64_t)a3;
- (void)setErrorHandlingStrategy:(unint64_t)a3;
- (void)setHidesAddAutomationItem:(BOOL)a3;
- (void)setHidesCustomTriggers:(BOOL)a3;
- (void)setItemsAreEditable:(BOOL)a3;
- (void)setShowNaturalLightingItem:(BOOL)a3;
- (void)setShowsIcons:(BOOL)a3;
@end

@implementation HUAvailableRelatedTriggerItemModuleContext

- (HUAvailableRelatedTriggerItemModuleContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)HUAvailableRelatedTriggerItemModuleContext;
  v2 = [(HUAvailableRelatedTriggerItemModuleContext *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(HUAvailableRelatedTriggerItemModuleContext *)v2 setShowsIcons:0];
    [(HUAvailableRelatedTriggerItemModuleContext *)v3 setHidesAddAutomationItem:0];
    [(HUAvailableRelatedTriggerItemModuleContext *)v3 setCommitsAutomatically:1];
    [(HUAvailableRelatedTriggerItemModuleContext *)v3 setItemsAreEditable:1];
    [(HUAvailableRelatedTriggerItemModuleContext *)v3 setErrorHandlingStrategy:1];
    [(HUAvailableRelatedTriggerItemModuleContext *)v3 setHidesCustomTriggers:0];
    [(HUAvailableRelatedTriggerItemModuleContext *)v3 setAnalyticsPresentationContext:0];
    [(HUAvailableRelatedTriggerItemModuleContext *)v3 setDefaultActiveValue:0];
    [(HUAvailableRelatedTriggerItemModuleContext *)v3 setEngineOptions:83];
    [(HUAvailableRelatedTriggerItemModuleContext *)v3 setShowNaturalLightingItem:0];
  }
  return v3;
}

- (HUAvailableRelatedTriggerItemModuleContext)initWithContext:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HUAvailableRelatedTriggerItemModuleContext *)self init];
  -[HUAvailableRelatedTriggerItemModuleContext setShowsIcons:](v5, "setShowsIcons:", [v4 showsIcons]);
  -[HUAvailableRelatedTriggerItemModuleContext setHidesAddAutomationItem:](v5, "setHidesAddAutomationItem:", [v4 hidesAddAutomationItem]);
  -[HUAvailableRelatedTriggerItemModuleContext setCommitsAutomatically:](v5, "setCommitsAutomatically:", [v4 commitsAutomatically]);
  -[HUAvailableRelatedTriggerItemModuleContext setItemsAreEditable:](v5, "setItemsAreEditable:", [v4 itemsAreEditable]);
  -[HUAvailableRelatedTriggerItemModuleContext setErrorHandlingStrategy:](v5, "setErrorHandlingStrategy:", [v4 errorHandlingStrategy]);
  -[HUAvailableRelatedTriggerItemModuleContext setHidesCustomTriggers:](v5, "setHidesCustomTriggers:", [v4 hidesCustomTriggers]);
  v6 = [v4 analyticsPresentationContext];
  [(HUAvailableRelatedTriggerItemModuleContext *)v5 setAnalyticsPresentationContext:v6];

  v7 = [v4 defaultActiveValue];
  [(HUAvailableRelatedTriggerItemModuleContext *)v5 setDefaultActiveValue:v7];

  -[HUAvailableRelatedTriggerItemModuleContext setEngineOptions:](v5, "setEngineOptions:", [v4 engineOptions]);
  uint64_t v8 = [v4 showNaturalLightingItem];

  [(HUAvailableRelatedTriggerItemModuleContext *)v5 setShowNaturalLightingItem:v8];
  return v5;
}

- (BOOL)showsIcons
{
  return self->_showsIcons;
}

- (void)setShowsIcons:(BOOL)a3
{
  self->_showsIcons = a3;
}

- (BOOL)hidesAddAutomationItem
{
  return self->_hidesAddAutomationItem;
}

- (void)setHidesAddAutomationItem:(BOOL)a3
{
  self->_hidesAddAutomationItem = a3;
}

- (BOOL)commitsAutomatically
{
  return self->_commitsAutomatically;
}

- (void)setCommitsAutomatically:(BOOL)a3
{
  self->_commitsAutomatically = a3;
}

- (BOOL)itemsAreEditable
{
  return self->_itemsAreEditable;
}

- (void)setItemsAreEditable:(BOOL)a3
{
  self->_itemsAreEditable = a3;
}

- (BOOL)hidesCustomTriggers
{
  return self->_hidesCustomTriggers;
}

- (void)setHidesCustomTriggers:(BOOL)a3
{
  self->_hidesCustomTriggers = a3;
}

- (unint64_t)errorHandlingStrategy
{
  return self->_errorHandlingStrategy;
}

- (void)setErrorHandlingStrategy:(unint64_t)a3
{
  self->_errorHandlingStrategy = a3;
}

- (BOOL)showNaturalLightingItem
{
  return self->_showNaturalLightingItem;
}

- (void)setShowNaturalLightingItem:(BOOL)a3
{
  self->_showNaturalLightingItem = a3;
}

- (NSString)analyticsPresentationContext
{
  return self->_analyticsPresentationContext;
}

- (void)setAnalyticsPresentationContext:(id)a3
{
}

- (NSNumber)defaultActiveValue
{
  return self->_defaultActiveValue;
}

- (void)setDefaultActiveValue:(id)a3
{
}

- (unint64_t)engineOptions
{
  return self->_engineOptions;
}

- (void)setEngineOptions:(unint64_t)a3
{
  self->_engineOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultActiveValue, 0);

  objc_storeStrong((id *)&self->_analyticsPresentationContext, 0);
}

@end