@interface MUWebViewMessageHandlerProxy
- (WKScriptMessageHandler)target;
- (void)setTarget:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
@end

@implementation MUWebViewMessageHandlerProxy

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MUWebViewMessageHandlerProxy *)self target];
  [v8 userContentController:v7 didReceiveScriptMessage:v6];
}

- (WKScriptMessageHandler)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  return (WKScriptMessageHandler *)WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end