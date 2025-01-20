@interface WKWebExtensionTabConfiguration
- (BOOL)shouldAddToSelection;
- (BOOL)shouldBeActive;
- (BOOL)shouldBeMuted;
- (BOOL)shouldBePinned;
- (BOOL)shouldReaderModeBeActive;
- (NSURL)url;
- (WKWebExtensionTab)parentTab;
- (WKWebExtensionWindow)window;
- (id)_init;
- (unint64_t)index;
- (void)_setIndex:(unint64_t)a3;
- (void)_setParentTab:(id)a3;
- (void)_setShouldAddToSelection:(BOOL)a3;
- (void)_setShouldBeActive:(BOOL)a3;
- (void)_setShouldBeMuted:(BOOL)a3;
- (void)_setShouldBePinned:(BOOL)a3;
- (void)_setShouldReaderModeBeActive:(BOOL)a3;
- (void)_setURL:(id)a3;
- (void)_setWindow:(id)a3;
@end

@implementation WKWebExtensionTabConfiguration

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)WKWebExtensionTabConfiguration;
  return [(WKWebExtensionTabConfiguration *)&v3 init];
}

- (WKWebExtensionWindow)window
{
  return self->_window;
}

- (void)_setWindow:(id)a3
{
}

- (unint64_t)index
{
  return self->_index;
}

- (void)_setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (WKWebExtensionTab)parentTab
{
  return self->_parentTab;
}

- (void)_setParentTab:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)_setURL:(id)a3
{
}

- (BOOL)shouldBeActive
{
  return self->_shouldBeActive;
}

- (void)_setShouldBeActive:(BOOL)a3
{
  self->_shouldBeActive = a3;
}

- (BOOL)shouldAddToSelection
{
  return self->_shouldAddToSelection;
}

- (void)_setShouldAddToSelection:(BOOL)a3
{
  self->_shouldAddToSelection = a3;
}

- (BOOL)shouldBePinned
{
  return self->_shouldBePinned;
}

- (void)_setShouldBePinned:(BOOL)a3
{
  self->_shouldBePinned = a3;
}

- (BOOL)shouldBeMuted
{
  return self->_shouldBeMuted;
}

- (void)_setShouldBeMuted:(BOOL)a3
{
  self->_shouldBeMuted = a3;
}

- (BOOL)shouldReaderModeBeActive
{
  return self->_shouldReaderModeBeActive;
}

- (void)_setShouldReaderModeBeActive:(BOOL)a3
{
  self->_shouldReaderModeBeActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_parentTab, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end