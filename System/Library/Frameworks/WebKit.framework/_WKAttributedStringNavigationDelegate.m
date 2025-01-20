@interface _WKAttributedStringNavigationDelegate
- (id)decidePolicyForNavigationAction;
- (id)didFailNavigation;
- (id)didFailProvisionalNavigation;
- (id)didFinishNavigation;
- (id)webContentProcessDidTerminate;
- (void)dealloc;
- (void)setDecidePolicyForNavigationAction:(id)a3;
- (void)setDidFailNavigation:(id)a3;
- (void)setDidFailProvisionalNavigation:(id)a3;
- (void)setDidFinishNavigation:(id)a3;
- (void)setWebContentProcessDidTerminate:(id)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webViewWebContentProcessDidTerminate:(id)a3;
@end

@implementation _WKAttributedStringNavigationDelegate

- (void)dealloc
{
  self->_webContentProcessDidTerminate = 0;
  self->_decidePolicyForNavigationAction = 0;

  self->_didFailProvisionalNavigation = 0;
  self->_didFailNavigation = 0;

  self->_didFinishNavigation = 0;
  v3.receiver = self;
  v3.super_class = (Class)_WKAttributedStringNavigationDelegate;
  [(_WKAttributedStringNavigationDelegate *)&v3 dealloc];
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  webContentProcessDidTerminate = (void (**)(id, id))self->_webContentProcessDidTerminate;
  if (webContentProcessDidTerminate) {
    webContentProcessDidTerminate[2](webContentProcessDidTerminate, a3);
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  decidePolicyForNavigationAction = (void (**)(id, id, id))self->_decidePolicyForNavigationAction;
  if (decidePolicyForNavigationAction) {
    decidePolicyForNavigationAction[2](decidePolicyForNavigationAction, a4, a5);
  }
  else {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  didFailProvisionalNavigation = (void (**)(id, id, id, id))self->_didFailProvisionalNavigation;
  if (didFailProvisionalNavigation) {
    didFailProvisionalNavigation[2](didFailProvisionalNavigation, a3, a4, a5);
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  didFailNavigation = (void (**)(id, id, id, id))self->_didFailNavigation;
  if (didFailNavigation) {
    didFailNavigation[2](didFailNavigation, a3, a4, a5);
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  didFinishNavigation = (void (**)(id, id, id))self->_didFinishNavigation;
  if (didFinishNavigation) {
    didFinishNavigation[2](didFinishNavigation, a3, a4);
  }
}

- (id)webContentProcessDidTerminate
{
  return self->_webContentProcessDidTerminate;
}

- (void)setWebContentProcessDidTerminate:(id)a3
{
}

- (id)decidePolicyForNavigationAction
{
  return self->_decidePolicyForNavigationAction;
}

- (void)setDecidePolicyForNavigationAction:(id)a3
{
}

- (id)didFailProvisionalNavigation
{
  return self->_didFailProvisionalNavigation;
}

- (void)setDidFailProvisionalNavigation:(id)a3
{
}

- (id)didFailNavigation
{
  return self->_didFailNavigation;
}

- (void)setDidFailNavigation:(id)a3
{
}

- (id)didFinishNavigation
{
  return self->_didFinishNavigation;
}

- (void)setDidFinishNavigation:(id)a3
{
}

@end