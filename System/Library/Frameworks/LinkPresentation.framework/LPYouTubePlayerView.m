@interface LPYouTubePlayerView
- (BOOL)_shouldUseElementFullScreen;
- (BOOL)isMuted;
- (BOOL)showsControls;
- (BOOL)startsPlayingAutomatically;
- (LPYouTubePlayerDelegate)delegate;
- (LPYouTubePlayerView)initWithFrame:(CGRect)a3;
- (double)endTime;
- (double)startTime;
- (id)_parameterScript;
- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6;
- (void)_evaluatePlayerCommand:(id)a3;
- (void)_webView:(id)a3 navigation:(id)a4 didFailProvisionalLoadInSubframe:(id)a5 withError:(id)a6;
- (void)createVideoPlayerView;
- (void)dealloc;
- (void)didReceiveScriptMessage:(id)a3;
- (void)dispatchErrorWithCode:(int64_t)a3;
- (void)enterFullScreen;
- (void)exitFullScreen;
- (void)layoutSubviews;
- (void)loadVideoWithEmbedURL:(id)a3;
- (void)loadVideoWithID:(id)a3;
- (void)loadVideoWithURL:(id)a3;
- (void)pause;
- (void)play;
- (void)scrollViewDidScroll:(id)a3;
- (void)seekTo:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setMuted:(BOOL)a3;
- (void)setShowsControls:(BOOL)a3;
- (void)setStartTime:(double)a3;
- (void)setStartsPlayingAutomatically:(BOOL)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 preferences:(id)a5 decisionHandler:(id)a6;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webViewWebContentProcessDidTerminate:(id)a3;
@end

@implementation LPYouTubePlayerView

- (LPYouTubePlayerView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)LPYouTubePlayerView;
  v3 = -[LPYouTubePlayerView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_startsPlayingAutomatically = 1;
    v3->_showsControls = 1;
    v3->_startTime = 0.0;
    v3->_endTime = -1.0;
    if (+[LPSettings showDebugIndicators])
    {
      id v5 = [MEMORY[0x1E4FB1618] redColor];
      uint64_t v6 = [v5 CGColor];
      v7 = [(LPYouTubePlayerView *)v4 layer];
      [v7 setBorderColor:v6];

      v8 = [(LPYouTubePlayerView *)v4 layer];
      [v8 setBorderWidth:6.0];
    }
    v9 = v4;
  }

  return v4;
}

- (void)dispatchErrorWithCode:(int64_t)a3
{
  id v7 = [(LPYouTubePlayerView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v8 = [(LPYouTubePlayerView *)self delegate];
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"LPYouTubePlayerErrorDomain" code:a3 userInfo:0];
    [v8 youTubePlayer:self didReceiveError:v6];
  }
}

- (void)loadVideoWithURL:(id)a3
{
  v4 = +[LPPresentationSpecializations youTubeVideoComponentsForVideoURL:a3];
  id v5 = [v4 videoID];

  if (v5) {
    [(LPYouTubePlayerView *)self loadVideoWithID:v5];
  }
  else {
    [(LPYouTubePlayerView *)self dispatchErrorWithCode:4];
  }
}

- (void)loadVideoWithEmbedURL:(id)a3
{
  v4 = +[LPPresentationSpecializations youTubeVideoComponentsForEmbedURL:a3];
  id v5 = [v4 videoID];

  if (v5) {
    [(LPYouTubePlayerView *)self loadVideoWithID:v5];
  }
  else {
    [(LPYouTubePlayerView *)self dispatchErrorWithCode:4];
  }
}

- (void)loadVideoWithID:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_videoID, a3);
  self->_state = 0;
  if (self->_videoID
    || ([(LPYouTubePlayerView *)self delegate],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) == 0))
  {
    [(LPYouTubePlayerView *)self createVideoPlayerView];
  }
  else
  {
    id v7 = [(LPYouTubePlayerView *)self delegate];
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"LPYouTubePlayerErrorDomain" code:5 userInfo:0];
    [v7 youTubePlayer:self didReceiveError:v8];
  }
}

- (void)dealloc
{
  v3 = [(LPYouTubePlayerWebView *)self->_webView configuration];
  v4 = [v3 userContentController];
  [v4 removeScriptMessageHandlerForName:@"playerContainer"];

  [(LPYouTubePlayerWebView *)self->_webView _close];
  webView = self->_webView;
  self->_webView = 0;

  v6.receiver = self;
  v6.super_class = (Class)LPYouTubePlayerView;
  [(LPYouTubePlayerView *)&v6 dealloc];
}

- (void)_evaluatePlayerCommand:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_ready)
  {
    [(LPYouTubePlayerWebView *)self->_webView evaluateJavaScript:v4 completionHandler:0];
  }
  else
  {
    commandsPendingPlayerReadiness = self->_commandsPendingPlayerReadiness;
    if (!commandsPendingPlayerReadiness)
    {
      objc_super v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v7 = self->_commandsPendingPlayerReadiness;
      self->_commandsPendingPlayerReadiness = v6;

      commandsPendingPlayerReadiness = self->_commandsPendingPlayerReadiness;
      id v4 = v8;
    }
    [(NSMutableArray *)commandsPendingPlayerReadiness addObject:v4];
  }
}

- (void)play
{
}

- (void)pause
{
}

- (void)seekTo:(double)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"seekTo(%f)", *(void *)&a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LPYouTubePlayerView _evaluatePlayerCommand:](self, "_evaluatePlayerCommand:");
}

- (BOOL)_shouldUseElementFullScreen
{
  return 0;
}

- (void)enterFullScreen
{
  if ((unint64_t)(self->_state - 2) <= 3)
  {
    if ([(LPYouTubePlayerView *)self _shouldUseElementFullScreen])
    {
      [(LPYouTubePlayerWebView *)self->_webView setAllowFirstResponder:1];
      [(LPYouTubePlayerWebView *)self->_webView becomeFirstResponder];
      v3 = @"enterElementFullScreen()";
    }
    else
    {
      v3 = @"enterVideoFullScreen()";
    }
    [(LPYouTubePlayerView *)self _evaluatePlayerCommand:v3];
  }
}

- (void)exitFullScreen
{
  [(LPYouTubePlayerView *)self _evaluatePlayerCommand:@"exitFullScreen()"];
  webView = self->_webView;

  [(LPYouTubePlayerWebView *)webView setAllowFirstResponder:0];
}

- (void)setMuted:(BOOL)a3
{
  if (self->_muted != a3)
  {
    self->_muted = a3;
    if (a3) {
      v3 = @"mute()";
    }
    else {
      v3 = @"unMute()";
    }
    [(LPYouTubePlayerView *)self _evaluatePlayerCommand:v3];
  }
}

- (id)_parameterScript
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v19[0] = @"rel";
  v19[1] = @"showinfo";
  v19[2] = @"iv_load_policy";
  v19[3] = @"controls";
  BOOL v4 = !self->_showsControls;
  id v5 = &unk_1EF712840;
  v20[0] = &unk_1EF712810;
  v20[1] = &unk_1EF712810;
  if (v4) {
    id v5 = &unk_1EF712810;
  }
  v20[2] = &unk_1EF712828;
  v20[3] = v5;
  objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
  id v7 = (void *)[v3 initWithDictionary:v6];

  if (self->_startTime != 0.0)
  {
    id v8 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v7 setObject:v8 forKeyedSubscript:@"start"];
  }
  if (self->_endTime != -1.0)
  {
    id v9 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v7 setObject:v9 forKeyedSubscript:@"end"];
  }
  v18[0] = self->_videoID;
  v17[0] = @"videoId";
  v17[1] = @"startsPlayingAutomatically";
  v10 = [NSNumber numberWithBool:self->_startsPlayingAutomatically];
  v18[1] = v10;
  v17[2] = @"startsPlayingMuted";
  objc_super v11 = [NSNumber numberWithBool:self->_muted];
  v17[3] = @"playerVars";
  v18[2] = v11;
  v18[3] = v7;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  v13 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v12 options:0 error:0];
  v14 = (void *)[[NSString alloc] initWithData:v13 encoding:4];
  v15 = [NSString stringWithFormat:@"window.parameters = %@", v14];;

  return v15;
}

- (void)createVideoPlayerView
{
  id v3 = [[LPYouTubePlayerScriptMessageHandler alloc] initWithPlayerView:self];
  scriptMessageHandler = self->_scriptMessageHandler;
  self->_scriptMessageHandler = v3;

  id v38 = objc_alloc_init(MEMORY[0x1E4F466F8]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F46780]);
  objc_super v6 = linkPresentationBundle();
  id v7 = [v6 builtInPlugInsURL];
  id v8 = [v7 URLByAppendingPathComponent:@"YouTubePlayer.wkbundle"];
  [v5 setInjectedBundleURL:v8];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F46690]) _initWithConfiguration:v5];
  [v38 setProcessPool:v9];

  v10 = [v38 processPool];
  objc_super v11 = objc_msgSend(NSNumber, "numberWithBool:", +[LPApplicationIdentification isMessagesOrMessagesViewService](LPApplicationIdentification, "isMessagesOrMessagesViewService"));
  [v10 _setObject:v11 forBundleParameter:@"isMessagesOrMessagesViewService"];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F467D8]) initNonPersistentConfiguration];
  [v12 setDeviceManagementRestrictionsEnabled:1];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F46710]) _initWithConfiguration:v12];
  [v38 setWebsiteDataStore:v13];

  [v38 _setIgnoresAppBoundDomains:1];
  [v38 setMediaTypesRequiringUserActionForPlayback:0];
  [v38 setAllowsInlineMediaPlayback:1];
  [v38 _setInlineMediaPlaybackRequiresPlaysInlineAttribute:0];
  [v38 setAllowsPictureInPictureMediaPlayback:0];
  if (+[LPSettings showDebugIndicators])
  {
    v14 = [v38 preferences];
    [v14 _setCompositingBordersVisible:1];
  }
  if ([(LPYouTubePlayerView *)self _shouldUseElementFullScreen])
  {
    v15 = [v38 preferences];
    [v15 _setFullScreenEnabled:1];
  }
  v16 = [v38 userContentController];
  [v16 addScriptMessageHandler:self->_scriptMessageHandler name:@"playerContainer"];
  id v17 = objc_alloc(MEMORY[0x1E4F466A8]);
  v18 = [(LPYouTubePlayerView *)self _parameterScript];
  v19 = (void *)[v17 initWithSource:v18 injectionTime:0 forMainFrameOnly:1];
  [v16 addUserScript:v19];

  v20 = [LPYouTubePlayerWebView alloc];
  [(LPYouTubePlayerView *)self bounds];
  v21 = -[LPYouTubePlayerWebView initWithFrame:configuration:](v20, "initWithFrame:configuration:", v38);
  webView = self->_webView;
  self->_webView = v21;

  [(LPYouTubePlayerWebView *)self->_webView setNavigationDelegate:self];
  [(LPYouTubePlayerWebView *)self->_webView setUIDelegate:self];
  [(LPYouTubePlayerWebView *)self->_webView setCustomUserAgent:@"Mozilla/5.0 (iPhone; CPU iPhone OS 13_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.5 Mobile/15E148 Safari/604.1"];
  v23 = [(LPYouTubePlayerWebView *)self->_webView scrollView];
  [v23 setDelegate:self];

  v24 = [(LPYouTubePlayerWebView *)self->_webView scrollView];
  [v24 setScrollEnabled:0];

  v25 = [(LPYouTubePlayerWebView *)self->_webView scrollView];
  [v25 setContentInsetAdjustmentBehavior:2];

  v26 = objc_alloc_init(LPYouTubePlayerViewFullScreenDelegate);
  fullScreenDelegate = self->_fullScreenDelegate;
  self->_fullScreenDelegate = v26;

  [(LPYouTubePlayerWebView *)self->_webView _setFullscreenDelegate:self->_fullScreenDelegate];
  if (+[LPSettings showDebugIndicators])
  {
    id v28 = [MEMORY[0x1E4FB1618] greenColor];
    uint64_t v29 = [v28 CGColor];
    v30 = [(LPYouTubePlayerWebView *)self->_webView layer];
    [v30 setBorderColor:v29];

    v31 = [(LPYouTubePlayerWebView *)self->_webView layer];
    [v31 setBorderWidth:9.0];
  }
  v32 = linkPresentationBundle();
  v33 = [v32 URLForResource:@"YouTubeContainer" withExtension:@"html"];

  v34 = [NSString stringWithContentsOfURL:v33 encoding:4 error:0];
  v35 = self->_webView;
  v36 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://www.youtube.com/"];
  id v37 = (id)[(LPYouTubePlayerWebView *)v35 loadHTMLString:v34 baseURL:v36];

  [(LPYouTubePlayerView *)self addSubview:self->_webView];
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  BOOL v4 = LPLogChannelVideo();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[LPYouTubePlayerView webViewWebContentProcessDidTerminate:](v4);
  }
  [(LPYouTubePlayerView *)self dispatchErrorWithCode:7];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 preferences:(id)a5 decisionHandler:(id)a6
{
  id v14 = a4;
  id v8 = a5;
  id v9 = (void (**)(id, uint64_t, id))a6;
  v10 = [v14 request];
  objc_super v11 = [v10 URL];

  if ([v14 navigationType] || !objc_msgSend(v11, "_lp_isHTTPFamilyURL"))
  {
    uint64_t v13 = 1;
  }
  else
  {
    v12 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v12 openURL:v11 options:MEMORY[0x1E4F1CC08] completionHandler:&__block_literal_global_21];

    uint64_t v13 = 0;
  }
  v9[2](v9, v13, v8);
}

- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6
{
  objc_super v6 = objc_msgSend(a5, "request", a3, a4);
  id v7 = [v6 URL];

  if (objc_msgSend(v7, "_lp_isHTTPFamilyURL"))
  {
    id v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v8 openURL:v7 options:MEMORY[0x1E4F1CC08] completionHandler:&__block_literal_global_204];
  }
  return 0;
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
}

- (void)_webView:(id)a3 navigation:(id)a4 didFailProvisionalLoadInSubframe:(id)a5 withError:(id)a6
{
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)LPYouTubePlayerView;
  [(LPYouTubePlayerView *)&v18 layoutSubviews];
  [(LPYouTubePlayerWebView *)self->_webView frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(LPYouTubePlayerView *)self bounds];
  v20.origin.x = v11;
  v20.origin.y = v12;
  v20.size.width = v13;
  v20.size.height = v14;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  if (!CGRectEqualToRect(v19, v20))
  {
    [(LPYouTubePlayerView *)self bounds];
    -[LPYouTubePlayerWebView setFrame:](self->_webView, "setFrame:");
    double v15 = *MEMORY[0x1E4F1DAD8];
    double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    id v17 = [(LPYouTubePlayerWebView *)self->_webView scrollView];
    objc_msgSend(v17, "setContentOffset:", v15, v16);
  }
}

- (void)didReceiveScriptMessage:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  CGFloat v4 = [a3 body];
  double v5 = [v4 objectForKeyedSubscript:@"message"];
  if (![v5 isEqualToString:@"onReady"])
  {
    if ([v5 isEqualToString:@"onStateChange"])
    {
      id v14 = [v4 objectForKeyedSubscript:@"data"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (uint64_t v15 = [v14 integerValue], (unint64_t)(v15 + 1) <= 6))
      {
        int64_t v16 = qword_1A3711E60[v15 + 1];
      }
      else
      {
        int64_t v16 = 6;
      }

      self->_state = v16;
      v21 = [(LPYouTubePlayerView *)self delegate];
      char v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) == 0) {
        goto LABEL_40;
      }
      v23 = [(LPYouTubePlayerView *)self delegate];
      [v23 youTubePlayer:self didChangeToState:self->_state];
LABEL_39:

      goto LABEL_40;
    }
    if (![v5 isEqualToString:@"onError"])
    {
      if (![v5 isEqualToString:@"onPresentationModeChange"]) {
        goto LABEL_40;
      }
      v23 = [v4 objectForKeyedSubscript:@"isFullScreen"];
      if (([v23 BOOLValue] & 1) == 0) {
        [(LPYouTubePlayerWebView *)self->_webView resignFirstResponder];
      }
      v24 = [(LPYouTubePlayerView *)self delegate];
      char v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) == 0) {
        goto LABEL_39;
      }
      v26 = [(LPYouTubePlayerView *)self delegate];
      objc_msgSend(v26, "youTubePlayer:didChangeToFullScreen:", self, objc_msgSend(v23, "BOOLValue"));
LABEL_38:

      goto LABEL_39;
    }
    id v17 = [(LPYouTubePlayerView *)self delegate];
    char v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0) {
      goto LABEL_40;
    }
    id v19 = [v4 objectForKeyedSubscript:@"data"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = [v19 integerValue];
      if (v20 <= 100)
      {
        if (v20 == 2)
        {
          uint64_t v27 = 0;
          goto LABEL_37;
        }
        if (v20 == 5)
        {
          uint64_t v27 = 1;
          goto LABEL_37;
        }
        if (v20 != 100) {
          goto LABEL_36;
        }
LABEL_41:
        uint64_t v27 = 2;
        goto LABEL_37;
      }
      switch(v20)
      {
        case 101:
          goto LABEL_35;
        case 105:
          goto LABEL_41;
        case 150:
LABEL_35:
          uint64_t v27 = 3;
LABEL_37:

          v23 = [(LPYouTubePlayerView *)self delegate];
          v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"LPYouTubePlayerErrorDomain" code:v27 userInfo:0];
          [v23 youTubePlayer:self didReceiveError:v26];
          goto LABEL_38;
      }
    }
LABEL_36:
    uint64_t v27 = 6;
    goto LABEL_37;
  }
  CGFloat v6 = [(LPYouTubePlayerView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    CGFloat v8 = [(LPYouTubePlayerView *)self delegate];
    [v8 youTubePlayerDidBecomeReady:self];
  }
  self->_ready = 1;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  double v9 = self->_commandsPendingPlayerReadiness;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v29;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v9);
        }
        -[LPYouTubePlayerView _evaluatePlayerCommand:](self, "_evaluatePlayerCommand:", *(void *)(*((void *)&v28 + 1) + 8 * v12++), (void)v28);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }

  commandsPendingPlayerReadiness = self->_commandsPendingPlayerReadiness;
  self->_commandsPendingPlayerReadiness = 0;

LABEL_40:
}

- (LPYouTubePlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LPYouTubePlayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)startsPlayingAutomatically
{
  return self->_startsPlayingAutomatically;
}

- (void)setStartsPlayingAutomatically:(BOOL)a3
{
  self->_startsPlayingAutomatically = a3;
}

- (BOOL)showsControls
{
  return self->_showsControls;
}

- (void)setShowsControls:(BOOL)a3
{
  self->_showsControls = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_commandsPendingPlayerReadiness, 0);
  objc_storeStrong((id *)&self->_scriptMessageHandler, 0);
  objc_storeStrong((id *)&self->_videoID, 0);
  objc_storeStrong((id *)&self->_webView, 0);

  objc_storeStrong((id *)&self->_fullScreenDelegate, 0);
}

- (void)webViewWebContentProcessDidTerminate:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A35DC000, log, OS_LOG_TYPE_ERROR, "LPYouTubePlayerView: Web Content process was terminated", v1, 2u);
}

@end