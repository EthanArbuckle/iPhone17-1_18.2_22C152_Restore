@interface _SFWebArchiveProvider
- (BOOL)canGenerateWebArchive;
- (NSString)suggestedFilenameWithExtension;
- (WKWebView)webView;
- (_SFWebArchiveProvider)initWithWebView:(id)a3;
- (id)_quickLookDocument;
- (id)_suggestedFilenameWithoutExtension;
- (id)_webViewUTI;
- (id)dataForQuickLookDocument:(id)a3;
- (id)suggestedFileExtensionForQuickLookDocument:(id)a3;
- (void)generateWebArchiveWithCompletionHandler:(id)a3;
@end

@implementation _SFWebArchiveProvider

- (_SFWebArchiveProvider)initWithWebView:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFWebArchiveProvider;
  v5 = [(_SFWebArchiveProvider *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    uint64_t v7 = [v4 URL];
    cachedWebViewURL = v6->_cachedWebViewURL;
    v6->_cachedWebViewURL = (NSURL *)v7;

    uint64_t v9 = [v4 title];
    cachedWebViewTitle = v6->_cachedWebViewTitle;
    v6->_cachedWebViewTitle = (NSString *)v9;

    v11 = v6;
  }

  return v6;
}

- (NSString)suggestedFilenameWithExtension
{
  v2 = [(_SFWebArchiveProvider *)self _suggestedFilenameWithoutExtension];
  v3 = objc_msgSend(v2, "safari_ensurePathExtension:", @"webarchive");

  return (NSString *)v3;
}

- (BOOL)canGenerateWebArchive
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);

  if (!WeakRetained) {
    return 0;
  }
  CFStringRef v4 = [(_SFWebArchiveProvider *)self _webViewUTI];
  return UTTypeConformsTo(v4, (CFStringRef)*MEMORY[0x1E4F226F0]) != 0;
}

- (id)dataForQuickLookDocument:(id)a3
{
  return self->_webArchiveData;
}

- (id)suggestedFileExtensionForQuickLookDocument:(id)a3
{
  return @"webarchive";
}

- (void)generateWebArchiveWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65___SFWebArchiveProvider_generateWebArchiveWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5C73380;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (id)_quickLookDocument
{
  quickLookDocument = self->_quickLookDocument;
  if (quickLookDocument)
  {
    v3 = quickLookDocument;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F78328]);
    v6 = [(_SFWebArchiveProvider *)self suggestedFilenameWithExtension];
    id v7 = (void *)[v5 initWithFileName:v6 mimeType:*MEMORY[0x1E4F789E8] uti:0 needsQuickLookDocumentView:0];

    [v7 setDocumentSource:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    uint64_t v9 = [WeakRetained URL];
    [v7 setSourceURL:v9];

    v10 = self->_quickLookDocument;
    self->_quickLookDocument = (SFQuickLookDocument *)v7;
    id v11 = v7;

    [(SFQuickLookDocument *)self->_quickLookDocument saveToFileIfNeeded];
    v3 = self->_quickLookDocument;
  }

  return v3;
}

- (id)_suggestedFilenameWithoutExtension
{
  v3 = [(NSString *)self->_cachedWebViewTitle safari_suggestedFilenameFromTitleString];
  if ([v3 length])
  {
    id v4 = v3;
    goto LABEL_10;
  }
  CFStringRef v5 = [(_SFWebArchiveProvider *)self _webViewUTI];
  if (UTTypeEqual(v5, (CFStringRef)*MEMORY[0x1E4F225E8]))
  {
LABEL_4:
    v6 = [(NSURL *)self->_cachedWebViewURL host];
    id v7 = objc_msgSend(v6, "safari_highLevelDomainFromHost");

    if ([v7 length])
    {
      id v8 = v7;
    }
    else
    {
      _WBSLocalizedString();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v4 = v8;

    goto LABEL_10;
  }
  uint64_t v9 = [(NSURL *)self->_cachedWebViewURL safari_userVisibleString];
  objc_msgSend(v9, "safari_lastPathComponentWithoutZipExtension");
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  if (![v4 length])
  {

    goto LABEL_4;
  }
LABEL_10:

  return v4;
}

- (id)_webViewUTI
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v3 = [WeakRetained _MIMEType];

  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F22500], v3, 0);

  return PreferredIdentifierForTag;
}

- (WKWebView)webView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);

  return (WKWebView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_cachedWebViewURL, 0);
  objc_storeStrong((id *)&self->_cachedWebViewTitle, 0);
  objc_storeStrong((id *)&self->_webArchiveData, 0);

  objc_storeStrong((id *)&self->_quickLookDocument, 0);
}

@end