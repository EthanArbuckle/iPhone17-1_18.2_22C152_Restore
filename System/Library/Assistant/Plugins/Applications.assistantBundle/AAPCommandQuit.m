@interface AAPCommandQuit
- (void)_closeApp:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation AAPCommandQuit

- (void)performWithCompletion:(id)a3
{
  id v5 = [(AAPCommandQuit *)self sceneId];
  v6 = AFSiriLogContextPlugin;
  BOOL v7 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      int v9 = 136315138;
      v10 = "-[AAPCommandQuit performWithCompletion:]";
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%s Shell not available, unable to close scene", (uint8_t *)&v9, 0xCu);
    }
    id v8 = objc_alloc_init((Class)SACommandFailed);
    (*((void (**)(id, id))a3 + 2))(a3, [v8 dictionary]);
  }
  else
  {
    if (v7)
    {
      int v9 = 136315138;
      v10 = "-[AAPCommandQuit performWithCompletion:]";
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%s Null sceneId, closing app instead", (uint8_t *)&v9, 0xCu);
    }
    [(AAPCommandQuit *)self _closeApp:a3];
  }
}

- (void)_closeApp:(id)a3
{
  v4 = AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    BOOL v7 = "-[AAPCommandQuit _closeApp:]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s Shell not available, unable to close app", (uint8_t *)&v6, 0xCu);
  }
  id v5 = objc_alloc_init((Class)SACommandFailed);
  (*((void (**)(id, id))a3 + 2))(a3, [v5 dictionary]);
}

@end