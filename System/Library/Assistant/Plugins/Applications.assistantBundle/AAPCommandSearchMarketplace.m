@interface AAPCommandSearchMarketplace
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4 executionInfo:(id)a5;
@end

@implementation AAPCommandSearchMarketplace

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4 executionInfo:(id)a5
{
  v9 = AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    v14 = "-[AAPCommandSearchMarketplace performWithCompletion:serviceHelper:executionInfo:]";
    __int16 v15 = 2114;
    uint64_t v16 = objc_opt_class();
    __int16 v17 = 2048;
    v18 = self;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: <%{public}@:%p> processing SearchMarketplace command", (uint8_t *)&v13, 0x20u);
  }
  if (objc_msgSend(-[AAPCommandSearchMarketplace keyword](self, "keyword"), "length"))
  {
    v10 = [[_TtC12Applications34AAPCommandSearchMarketplaceWrapper alloc] initWithMarketplace:[(AAPCommandSearchMarketplace *)self marketplace] keyword:[(AAPCommandSearchMarketplace *)self keyword]];
  }
  else
  {
    v11 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_opt_class();
      int v13 = 136315650;
      v14 = "-[AAPCommandSearchMarketplace performWithCompletion:serviceHelper:executionInfo:]";
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      __int16 v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: <%{public}@:%p> keyword empty, launching marketplace app instead of searching it.", (uint8_t *)&v13, 0x20u);
    }
    v10 = objc_alloc_init(AAPCommandLaunch);
    [(AAPCommandSearchMarketplaceWrapper *)v10 setAppId:[(AAPCommandSearchMarketplace *)self marketplace]];
    [(AAPCommandSearchMarketplaceWrapper *)v10 setLaunchId:[(AAPCommandSearchMarketplace *)self marketplace]];
  }
  [(AAPCommandSearchMarketplaceWrapper *)v10 performWithCompletion:a3 serviceHelper:a4 executionInfo:a5];
  [(AAPCommandSearchMarketplaceWrapper *)v10 dealloc];
}

@end