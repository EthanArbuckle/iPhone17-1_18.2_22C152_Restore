@interface SLComposeSheetConfigurationItem
- (BOOL)valuePending;
- (NSString)title;
- (NSString)value;
- (SLComposeSheetConfigurationItem)init;
- (SLComposeSheetConfigurationItemTapHandler)tapHandler;
- (id)changeObserver;
- (void)setChangeObserver:(id)a3;
- (void)setTapHandler:(SLComposeSheetConfigurationItemTapHandler)tapHandler;
- (void)setTitle:(NSString *)title;
- (void)setValue:(NSString *)value;
- (void)setValuePending:(BOOL)valuePending;
@end

@implementation SLComposeSheetConfigurationItem

- (SLComposeSheetConfigurationItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)SLComposeSheetConfigurationItem;
  return [(SLComposeSheetConfigurationItem *)&v3 init];
}

- (void)setTitle:(NSString *)title
{
  objc_storeStrong((id *)&self->_title, title);
  id v4 = [(SLComposeSheetConfigurationItem *)self changeObserver];
  [v4 configurationItemDidChange:self];
}

- (void)setValue:(NSString *)value
{
  objc_storeStrong((id *)&self->_value, value);
  id v4 = [(SLComposeSheetConfigurationItem *)self changeObserver];
  [v4 configurationItemDidChange:self];
}

- (void)setValuePending:(BOOL)valuePending
{
  self->_valuePending = valuePending;
  id v4 = [(SLComposeSheetConfigurationItem *)self changeObserver];
  [v4 configurationItemDidChange:self];
}

- (id)changeObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);

  return WeakRetained;
}

- (void)setChangeObserver:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (NSString)value
{
  return self->_value;
}

- (BOOL)valuePending
{
  return self->_valuePending;
}

- (SLComposeSheetConfigurationItemTapHandler)tapHandler
{
  return self->_tapHandler;
}

- (void)setTapHandler:(SLComposeSheetConfigurationItemTapHandler)tapHandler
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tapHandler, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_destroyWeak((id *)&self->_changeObserver);
}

@end