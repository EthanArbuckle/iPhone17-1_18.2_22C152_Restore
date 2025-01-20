@interface IAMWebProcessPlugInLoadDelegate
- (IAMWebProcessDelegate)webProcessDelegate;
- (IAMWebProcessJSO)webProcessJSO;
- (JSContext)currentJSContext;
- (void)setCurrentJSContext:(id)a3;
- (void)setWebProcessDelegate:(id)a3;
- (void)setWebProcessJSO:(id)a3;
- (void)setWebProcessJSOContentPages:(id)a3;
- (void)setWebProcessJSOState:(int64_t)a3;
- (void)webProcessJSODidCallClose;
- (void)webProcessJSODidCallOpen:(id)a3 options:(id)a4;
- (void)webProcessJSODidCallPerformAction:(id)a3 options:(id)a4;
- (void)webProcessJSODidReportEvent:(id)a3;
- (void)webProcessPlugInBrowserContextController:(id)a3 globalObjectIsAvailableForFrame:(id)a4 inScriptWorld:(id)a5;
@end

@implementation IAMWebProcessPlugInLoadDelegate

- (void)webProcessPlugInBrowserContextController:(id)a3 globalObjectIsAvailableForFrame:(id)a4 inScriptWorld:(id)a5
{
  id v17 = a4;
  id v7 = a5;
  v8 = [(IAMWebProcessPlugInLoadDelegate *)self currentJSContext];

  if (!v8)
  {
    v9 = [v17 jsContextForWorld:v7];
    [(IAMWebProcessPlugInLoadDelegate *)self setCurrentJSContext:v9];

    v10 = objc_opt_new();
    [(IAMWebProcessPlugInLoadDelegate *)self setWebProcessJSO:v10];

    v11 = [(IAMWebProcessPlugInLoadDelegate *)self webProcessJSO];
    [v11 setDelegate:self];

    v12 = [(IAMWebProcessPlugInLoadDelegate *)self webProcessJSO];
    v13 = [(IAMWebProcessPlugInLoadDelegate *)self currentJSContext];
    [v13 setObject:v12 forKeyedSubscript:@"inappmessages"];

    v14 = [(IAMWebProcessPlugInLoadDelegate *)self webProcessJSO];
    v15 = [(IAMWebProcessPlugInLoadDelegate *)self currentJSContext];
    [v14 initializeInContext:v15];

    v16 = [(IAMWebProcessPlugInLoadDelegate *)self webProcessDelegate];
    [v16 webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame];
  }
}

- (void)webProcessJSODidReportEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(IAMWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  [v5 webProcessJSODidReportEvent:v4];
}

- (void)webProcessJSODidCallPerformAction:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IAMWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  [v8 webProcessJSODidCallPerformAction:v7 options:v6];
}

- (void)webProcessJSODidCallOpen:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IAMWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  [v8 webProcessJSODidCallOpen:v7 options:v6];
}

- (void)webProcessJSODidCallClose
{
  id v2 = [(IAMWebProcessPlugInLoadDelegate *)self webProcessDelegate];
  [v2 webProcessJSODidCallClose];
}

- (void)setWebProcessJSOContentPages:(id)a3
{
  id v6 = a3;
  id v4 = [(IAMWebProcessPlugInLoadDelegate *)self webProcessJSO];

  if (v4)
  {
    id v5 = [(IAMWebProcessPlugInLoadDelegate *)self webProcessJSO];
    [v5 setContentPages:v6];
  }
}

- (void)setWebProcessJSOState:(int64_t)a3
{
  id v5 = [(IAMWebProcessPlugInLoadDelegate *)self webProcessJSO];

  if (v5)
  {
    id v6 = [(IAMWebProcessPlugInLoadDelegate *)self webProcessJSO];
    [v6 setState:a3];
  }
}

- (IAMWebProcessDelegate)webProcessDelegate
{
  return self->_webProcessDelegate;
}

- (void)setWebProcessDelegate:(id)a3
{
}

- (JSContext)currentJSContext
{
  return self->_currentJSContext;
}

- (void)setCurrentJSContext:(id)a3
{
}

- (IAMWebProcessJSO)webProcessJSO
{
  return self->_webProcessJSO;
}

- (void)setWebProcessJSO:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webProcessJSO, 0);
  objc_storeStrong((id *)&self->_currentJSContext, 0);

  objc_storeStrong((id *)&self->_webProcessDelegate, 0);
}

@end