@interface _SFActivityItemProviderCollection
- (BOOL)displayingDigitalHealthLockoutView;
- (BOOL)displayingStandaloneImage;
- (BOOL)displayingStandaloneMedia;
- (WKWebView)webView;
- (_SFActivityItemProvider)documentProvider;
- (_SFActivityItemProvider)downloadProvider;
- (_SFActivityItemProvider)javaScriptExtensionProvider;
- (_SFActivityItemProvider)linkProvider;
- (_SFActivityItemProvider)standaloneImageProvider;
- (_SFActivityItemProvider)webArchiveProvider;
- (_SFActivityItemProviderCollection)initWithWebView:(id)a3;
- (_SFPrintActivityItemProvider)printProvider;
- (id)activityItemProvidersWithCustomizationController:(id)a3;
- (void)setDisplayingDigitalHealthLockoutView:(BOOL)a3;
- (void)setDisplayingStandaloneImage:(BOOL)a3;
- (void)setDisplayingStandaloneMedia:(BOOL)a3;
- (void)setDocumentProvider:(id)a3;
- (void)setDownloadProvider:(id)a3;
- (void)setJavaScriptExtensionProvider:(id)a3;
- (void)setLinkProvider:(id)a3;
- (void)setPrintProvider:(id)a3;
@end

@implementation _SFActivityItemProviderCollection

- (_SFActivityItemProviderCollection)initWithWebView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFActivityItemProviderCollection;
  v6 = [(_SFActivityItemProviderCollection *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webView, a3);
    v8 = v7;
  }

  return v7;
}

- (_SFActivityItemProvider)standaloneImageProvider
{
  standaloneImageProvider = self->_standaloneImageProvider;
  if (standaloneImageProvider) {
    goto LABEL_4;
  }
  if ([(_SFActivityItemProviderCollection *)self displayingStandaloneImage])
  {
    v4 = [[_SFImageActivityItemProvider alloc] initWithWebView:self->_webView];
    id v5 = self->_standaloneImageProvider;
    self->_standaloneImageProvider = &v4->super;

    standaloneImageProvider = self->_standaloneImageProvider;
LABEL_4:
    v6 = standaloneImageProvider;
    goto LABEL_6;
  }
  v6 = 0;
LABEL_6:

  return v6;
}

- (_SFActivityItemProvider)webArchiveProvider
{
  webArchiveProvider = self->_webArchiveProvider;
  if (!webArchiveProvider)
  {
    v4 = [_SFWebArchiveActivityItemProvider alloc];
    id v5 = [[_SFWebArchiveProvider alloc] initWithWebView:self->_webView];
    v6 = [(_SFWebArchiveActivityItemProvider *)v4 initWithWebArchiveProvider:v5];
    v7 = self->_webArchiveProvider;
    self->_webArchiveProvider = v6;

    webArchiveProvider = self->_webArchiveProvider;
  }
  v8 = webArchiveProvider;

  return v8;
}

- (id)activityItemProvidersWithCustomizationController:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 canShareAsLink])
  {
    v6 = [(_SFActivityItemProviderCollection *)self linkProvider];
    objc_msgSend(v5, "safari_addObjectUnlessNil:", v6);
    v7 = [(_SFActivityItemProviderCollection *)self javaScriptExtensionProvider];
    objc_msgSend(v5, "safari_addObjectUnlessNil:", v7);
  }
  else
  {
    v6 = 0;
  }
  v8 = [(_SFActivityItemProviderCollection *)self standaloneImageProvider];
  if ([v4 canShareAsStandaloneImage] && v8)
  {
    [v5 addObject:v8];
    v9 = [v6 excludedActivityTypes];
    uint64_t v10 = [v9 setByAddingObject:*MEMORY[0x1E4F435C0]];
  }
  else
  {
    v9 = [v6 excludedActivityTypes];
    uint64_t v10 = objc_msgSend(v9, "safari_setByRemovingObject:", *MEMORY[0x1E4F435C0]);
  }
  v11 = (void *)v10;
  [v6 setExcludedActivityTypes:v10];

  if ([v4 canPrint])
  {
    v12 = [(_SFActivityItemProviderCollection *)self printProvider];
    objc_msgSend(v5, "safari_addObjectUnlessNil:", v12);

    -[_SFPrintActivityItemProvider setCanVendPDFRepresentation:](self->_printProvider, "setCanVendPDFRepresentation:", [v4 canShareAsPDF]);
  }
  if ([v4 canShareAsDownload])
  {
    v13 = [(_SFActivityItemProviderCollection *)self downloadProvider];
    if (v13)
    {
      [v5 addObject:v13];
      v14 = [v6 excludedActivityTypes];
      v15 = [v14 setByAddingObject:*MEMORY[0x1E4F43590]];
      [v6 setExcludedActivityTypes:v15];
    }
  }
  if ([v4 canShareAsWebArchive]
    && ![(_SFActivityItemProviderCollection *)self displayingDigitalHealthLockoutView])
  {
    v16 = [(_SFActivityItemProviderCollection *)self webArchiveProvider];
    objc_msgSend(v5, "safari_addObjectUnlessNil:", v16);
  }
  v17 = [(_SFActivityItemProviderCollection *)self documentProvider];
  objc_msgSend(v5, "safari_addObjectUnlessNil:", v17);

  return v5;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (BOOL)displayingDigitalHealthLockoutView
{
  return self->_displayingDigitalHealthLockoutView;
}

- (void)setDisplayingDigitalHealthLockoutView:(BOOL)a3
{
  self->_displayingDigitalHealthLockoutView = a3;
}

- (BOOL)displayingStandaloneImage
{
  return self->_displayingStandaloneImage;
}

- (void)setDisplayingStandaloneImage:(BOOL)a3
{
  self->_displayingStandaloneImage = a3;
}

- (BOOL)displayingStandaloneMedia
{
  return self->_displayingStandaloneMedia;
}

- (void)setDisplayingStandaloneMedia:(BOOL)a3
{
  self->_displayingStandaloneMedia = a3;
}

- (_SFActivityItemProvider)linkProvider
{
  return self->_linkProvider;
}

- (void)setLinkProvider:(id)a3
{
}

- (_SFPrintActivityItemProvider)printProvider
{
  return self->_printProvider;
}

- (void)setPrintProvider:(id)a3
{
}

- (_SFActivityItemProvider)javaScriptExtensionProvider
{
  return self->_javaScriptExtensionProvider;
}

- (void)setJavaScriptExtensionProvider:(id)a3
{
}

- (_SFActivityItemProvider)downloadProvider
{
  return self->_downloadProvider;
}

- (void)setDownloadProvider:(id)a3
{
}

- (_SFActivityItemProvider)documentProvider
{
  return self->_documentProvider;
}

- (void)setDocumentProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentProvider, 0);
  objc_storeStrong((id *)&self->_downloadProvider, 0);
  objc_storeStrong((id *)&self->_javaScriptExtensionProvider, 0);
  objc_storeStrong((id *)&self->_printProvider, 0);
  objc_storeStrong((id *)&self->_linkProvider, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_webArchiveProvider, 0);

  objc_storeStrong((id *)&self->_standaloneImageProvider, 0);
}

@end