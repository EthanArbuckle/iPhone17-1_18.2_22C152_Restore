@interface _SFDownloadDispatcher
+ (id)sharedDownloadDispatcher;
- (_SFDownloadDispatcher)init;
- (id)downloadFromWKDownload:(id)a3 userInitiatedAction:(id)a4;
- (id)prepareForDownloadFromWebView:(id)a3 request:(id)a4 MIMEType:(id)a5 uti:(id)a6 userInitiatedAction:(id)a7;
- (id)startDownloadForCurrentURLFromWebView:(id)a3;
- (id)startDownloadFromWebView:(id)a3 URL:(id)a4;
- (void)_download:(id)a3 decidePlaceholderPolicy:(id)a4;
- (void)_download:(id)a3 didReceiveFinalURL:(id)a4;
- (void)_download:(id)a3 didReceivePlaceholderURL:(id)a4 completionHandler:(id)a5;
- (void)download:(id)a3 decideDestinationUsingResponse:(id)a4 suggestedFilename:(id)a5 completionHandler:(id)a6;
- (void)download:(id)a3 didFailWithError:(id)a4 resumeData:(id)a5;
- (void)download:(id)a3 didWriteTotalBytes:(unint64_t)a4 totalBytesExpectedToWrite:(unint64_t)a5;
- (void)downloadDidFinish:(id)a3;
- (void)downloadDidStart:(id)a3;
- (void)registerResumedDownload:(id)a3;
- (void)setPendingDownload:(id)a3 forWebView:(id)a4;
@end

@implementation _SFDownloadDispatcher

+ (id)sharedDownloadDispatcher
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49___SFDownloadDispatcher_sharedDownloadDispatcher__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDownloadDispatcher_onceToken != -1) {
    dispatch_once(&sharedDownloadDispatcher_onceToken, block);
  }
  v2 = (void *)sharedDownloadDispatcher_instance;

  return v2;
}

- (_SFDownloadDispatcher)init
{
  v8.receiver = self;
  v8.super_class = (Class)_SFDownloadDispatcher;
  v2 = [(_SFDownloadDispatcher *)&v8 init];
  uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  pendingDownloadMap = v2->_pendingDownloadMap;
  v2->_pendingDownloadMap = (NSMapTable *)v3;

  v5 = (NSMapTable *)objc_alloc_init(MEMORY[0x1E4F28E10]);
  activeDownloadMap = v2->_activeDownloadMap;
  v2->_activeDownloadMap = v5;

  return v2;
}

- (id)prepareForDownloadFromWebView:(id)a3 request:(id)a4 MIMEType:(id)a5 uti:(id)a6 userInitiatedAction:(id)a7
{
  id v12 = a3;
  v13 = +[_SFDownload provisionalDownloadWithMIMEType:a5 request:a4 response:0 filename:0 uti:a6 userInitiatedAction:a7];
  [(_SFDownloadDispatcher *)self setPendingDownload:v13 forWebView:v12];

  return v13;
}

- (void)setPendingDownload:(id)a3 forWebView:(id)a4
{
}

- (id)startDownloadFromWebView:(id)a3 URL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [v6 pathExtension];
  if ([(__CFString *)v8 length]) {
    CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], v8, 0);
  }
  else {
    CFStringRef PreferredIdentifierForTag = (CFStringRef)(id)*MEMORY[0x1E4F22590];
  }
  v10 = (__CFString *)PreferredIdentifierForTag;
  v11 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", v6);
  id v12 = [(_SFDownloadDispatcher *)self prepareForDownloadFromWebView:v7 request:v11 MIMEType:0 uti:v10 userInitiatedAction:0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54___SFDownloadDispatcher_startDownloadFromWebView_URL___block_invoke;
  v14[3] = &unk_1E5C78168;
  v14[4] = self;
  [v7 startDownloadUsingRequest:v11 completionHandler:v14];

  return v12;
}

- (id)startDownloadForCurrentURLFromWebView:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F18DA8];
  id v5 = a3;
  id v6 = [v5 URL];
  id v7 = objc_msgSend(v4, "safari_nonAppInitiatedRequestWithURL:", v6);

  objc_super v8 = [v5 _MIMEType];
  v9 = objc_msgSend(v5, "_sf_suggestedFilename");
  v10 = +[_SFDownload provisionalDownloadWithMIMEType:v8 request:v7 response:0 filename:v9 uti:0 userInitiatedAction:0];

  [(_SFDownloadDispatcher *)self setPendingDownload:v10 forWebView:v5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63___SFDownloadDispatcher_startDownloadForCurrentURLFromWebView___block_invoke;
  v12[3] = &unk_1E5C78168;
  v12[4] = self;
  [v5 startDownloadUsingRequest:v7 completionHandler:v12];

  return v10;
}

- (id)downloadFromWKDownload:(id)a3 userInitiatedAction:(id)a4
{
  id v5 = a4;
  id v6 = [a3 originalRequest];
  id v7 = +[_SFDownload provisionalDownloadWithMIMEType:0 request:v6 response:0 filename:0 uti:0 userInitiatedAction:v5];

  return v7;
}

- (void)registerResumedDownload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 wkDownload];
  [v5 setDelegate:self];
  [(NSMapTable *)self->_activeDownloadMap setObject:v4 forKey:v5];
}

- (void)downloadDidStart:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:self];
  id v5 = [(NSMapTable *)self->_activeDownloadMap objectForKey:v4];
  if (!v5)
  {
    id v7 = [v4 webView];
    id v6 = [(NSMapTable *)self->_pendingDownloadMap objectForKey:v7];
    if (v6)
    {
LABEL_4:
      [(NSMapTable *)self->_pendingDownloadMap removeObjectForKey:v7];
      [(NSMapTable *)self->_activeDownloadMap setObject:v6 forKey:v4];
      [v6 downloadDidStart:v4];
LABEL_11:

      goto LABEL_12;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      v9 = [v8 delegate];
      if (objc_opt_respondsToSelector())
      {
        id v6 = [v9 sfWebView:v8 didStartDownload:v4];

        if (v6) {
          goto LABEL_4;
        }
      }
      else
      {
      }
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42___SFDownloadDispatcher_downloadDidStart___block_invoke;
    v10[3] = &unk_1E5C78190;
    v10[4] = self;
    id v11 = v4;
    [v11 cancel:v10];

    id v6 = 0;
    goto LABEL_11;
  }
  id v6 = v5;
  [v5 downloadDidStart:v4];
LABEL_12:
}

- (void)download:(id)a3 didWriteTotalBytes:(unint64_t)a4 totalBytesExpectedToWrite:(unint64_t)a5
{
  activeDownloadMap = self->_activeDownloadMap;
  id v8 = a3;
  id v9 = [(NSMapTable *)activeDownloadMap objectForKey:v8];
  [v9 download:v8 didWriteTotalBytes:a4 totalBytesExpectedToWrite:a5];
}

- (void)download:(id)a3 decideDestinationUsingResponse:(id)a4 suggestedFilename:(id)a5 completionHandler:(id)a6
{
  id v15 = a3;
  id v10 = a5;
  activeDownloadMap = self->_activeDownloadMap;
  id v12 = (void (**)(id, void))a6;
  id v13 = a4;
  v14 = [(NSMapTable *)activeDownloadMap objectForKey:v15];
  [v14 download:v15 didReceiveResponse:v13];

  if (v14) {
    [v14 download:v15 decideDestinationWithSuggestedFilename:v10 completionHandler:v12];
  }
  else {
    v12[2](v12, 0);
  }
}

- (void)downloadDidFinish:(id)a3
{
  activeDownloadMap = self->_activeDownloadMap;
  id v5 = a3;
  id v6 = [(NSMapTable *)activeDownloadMap objectForKey:v5];
  [v6 downloadDidFinish:v5];
  [(NSMapTable *)self->_activeDownloadMap removeObjectForKey:v5];
}

- (void)download:(id)a3 didFailWithError:(id)a4 resumeData:(id)a5
{
  activeDownloadMap = self->_activeDownloadMap;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(NSMapTable *)activeDownloadMap objectForKey:v11];
  [v12 download:v11 didFailWithError:v10 resumeData:v9];

  [(NSMapTable *)self->_activeDownloadMap removeObjectForKey:v11];
}

- (void)_download:(id)a3 decidePlaceholderPolicy:(id)a4
{
  activeDownloadMap = self->_activeDownloadMap;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSMapTable *)activeDownloadMap objectForKey:v7];
  [v8 download:v7 decidePlaceholderPolicy:v6];
}

- (void)_download:(id)a3 didReceivePlaceholderURL:(id)a4 completionHandler:(id)a5
{
  activeDownloadMap = self->_activeDownloadMap;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NSMapTable *)activeDownloadMap objectForKey:v10];
  [v11 download:v10 didReceivePlaceholderURL:v9 completionHandler:v8];
}

- (void)_download:(id)a3 didReceiveFinalURL:(id)a4
{
  activeDownloadMap = self->_activeDownloadMap;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSMapTable *)activeDownloadMap objectForKey:v7];
  [v8 download:v7 didReceiveFinalURL:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDownloadMap, 0);

  objc_storeStrong((id *)&self->_activeDownloadMap, 0);
}

@end