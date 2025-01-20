@interface WKWebExtensionWindowConfiguration
- (BOOL)shouldBeFocused;
- (BOOL)shouldBePrivate;
- (CGRect)frame;
- (NSArray)tabURLs;
- (NSArray)tabs;
- (id)_init;
- (int64_t)windowState;
- (int64_t)windowType;
- (void)_setFrame:(CGRect)a3;
- (void)_setShouldBeFocused:(BOOL)a3;
- (void)_setShouldBePrivate:(BOOL)a3;
- (void)_setTabURLs:(id)a3;
- (void)_setTabs:(id)a3;
- (void)_setWindowState:(int64_t)a3;
- (void)_setWindowType:(int64_t)a3;
@end

@implementation WKWebExtensionWindowConfiguration

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)WKWebExtensionWindowConfiguration;
  return [(WKWebExtensionWindowConfiguration *)&v3 init];
}

- (int64_t)windowType
{
  return self->_windowType;
}

- (void)_setWindowType:(int64_t)a3
{
  self->_windowType = a3;
}

- (int64_t)windowState
{
  return self->_windowState;
}

- (void)_setWindowState:(int64_t)a3
{
  self->_windowState = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (NSArray)tabURLs
{
  return self->_tabURLs;
}

- (void)_setTabURLs:(id)a3
{
}

- (NSArray)tabs
{
  return self->_tabs;
}

- (void)_setTabs:(id)a3
{
}

- (BOOL)shouldBeFocused
{
  return self->_shouldBeFocused;
}

- (void)_setShouldBeFocused:(BOOL)a3
{
  self->_shouldBeFocused = a3;
}

- (BOOL)shouldBePrivate
{
  return self->_shouldBePrivate;
}

- (void)_setShouldBePrivate:(BOOL)a3
{
  self->_shouldBePrivate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabs, 0);

  objc_storeStrong((id *)&self->_tabURLs, 0);
}

@end