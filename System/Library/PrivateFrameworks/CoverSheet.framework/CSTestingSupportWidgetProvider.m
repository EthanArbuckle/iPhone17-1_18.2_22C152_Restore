@interface CSTestingSupportWidgetProvider
- (CSTestingSupportWidgetProvider)init;
- (id)newWidgetGroupViewControllerWithSettings:(WGWidgetListSettings)a3;
- (id)newWidgetListViewControllerWithSettings:(WGWidgetListSettings)a3;
@end

@implementation CSTestingSupportWidgetProvider

- (CSTestingSupportWidgetProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSTestingSupportWidgetProvider;
  v2 = [(CSTestingSupportWidgetProvider *)&v6 init];
  if (v2)
  {
    v3 = (WGWidgetDiscoveryController *)objc_alloc_init(MEMORY[0x1E4FB7040]);
    widgetDiscoveryController = v2->_widgetDiscoveryController;
    v2->_widgetDiscoveryController = v3;

    [(WGWidgetDiscoveryController *)v2->_widgetDiscoveryController setDelegate:v2];
    [(WGWidgetDiscoveryController *)v2->_widgetDiscoveryController beginDiscovery];
  }
  return v2;
}

- (id)newWidgetGroupViewControllerWithSettings:(WGWidgetListSettings)a3
{
  uint64_t v3 = *(void *)&a3.var1;
  unint64_t var0 = a3.var0;
  id v6 = objc_alloc(MEMORY[0x1E4FB7048]);
  widgetDiscoveryController = self->_widgetDiscoveryController;

  return (id)objc_msgSend(v6, "initWithWidgetDiscoveryController:listSettings:", widgetDiscoveryController, var0, v3);
}

- (id)newWidgetListViewControllerWithSettings:(WGWidgetListSettings)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4FB7038]);
  widgetDiscoveryController = self->_widgetDiscoveryController;

  return (id)[v4 initWithWidgetDiscoveryController:widgetDiscoveryController];
}

- (void).cxx_destruct
{
}

@end