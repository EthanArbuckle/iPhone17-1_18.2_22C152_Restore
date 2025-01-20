@interface LPYouTubePlayerScriptMessageHandler
- (LPYouTubePlayerScriptMessageHandler)initWithPlayerView:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
@end

@implementation LPYouTubePlayerScriptMessageHandler

- (LPYouTubePlayerScriptMessageHandler)initWithPlayerView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPYouTubePlayerScriptMessageHandler;
  v5 = [(LPYouTubePlayerScriptMessageHandler *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playerView, v4);
    v7 = v6;
  }

  return v6;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  p_playerView = &self->_playerView;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_playerView);
  [WeakRetained didReceiveScriptMessage:v5];
}

- (void).cxx_destruct
{
}

@end