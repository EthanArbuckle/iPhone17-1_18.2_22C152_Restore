@interface LPLinkHTMLTextGenerator
+ (void)initialize;
- (BOOL)generateEmailCompatibleMarkup;
- (LPLinkHTMLTextGenerator)init;
- (LPLinkHTMLTextGenerator)initWithPresentationProperties:(id)a3 URL:(id)a4;
- (LPLinkHTMLTextGenerator)initWithURL:(id)a3;
- (LPLinkHTMLTextGeneratorDelegate)delegate;
- (LPLinkMetadata)metadata;
- (NSNumber)layoutDirection;
- (NSString)HTMLFragmentString;
- (NSString)htmlPrefix;
- (NSURL)URL;
- (id)linkHTMLGenerator:(id)a3 URLForResource:(id)a4 withMIMEType:(id)a5;
- (void)_cleanUpDOMDocumentBody;
- (void)_commonInitWithPresentationProperties:(id)a3 URL:(id)a4;
- (void)_generateDOMDocumentBody;
- (void)generateHTMLFragmentString:(id)a3;
- (void)generateWebArchiveData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHtmlPrefix:(id)a3;
- (void)setLayoutDirection:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation LPLinkHTMLTextGenerator

+ (void)initialize
{
}

- (LPLinkHTMLTextGenerator)init
{
  return 0;
}

- (LPLinkHTMLTextGenerator)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPLinkHTMLTextGenerator;
  v5 = [(LPLinkHTMLTextGenerator *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(LPLinkHTMLTextGenerator *)v5 _commonInitWithPresentationProperties:0 URL:v4];
    v7 = v6;
  }

  return v6;
}

- (LPLinkHTMLTextGenerator)initWithPresentationProperties:(id)a3 URL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LPLinkHTMLTextGenerator;
  v8 = [(LPLinkHTMLTextGenerator *)&v12 init];
  objc_super v9 = v8;
  if (v8)
  {
    [(LPLinkHTMLTextGenerator *)v8 _commonInitWithPresentationProperties:v6 URL:v7];
    v10 = v9;
  }

  return v9;
}

- (void)_commonInitWithPresentationProperties:(id)a3 URL:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  LPWebLock(v6, v7);
  v8 = (WebView *)objc_alloc_init(MEMORY[0x1E4F46740]);
  webView = self->_webView;
  self->_webView = v8;

  v10 = [(WebView *)self->_webView mainFrame];
  [v10 loadHTMLString:&stru_1EF6D6D90 baseURL:0];

  v11 = [LPLinkHTMLGenerator alloc];
  objc_super v12 = [(WebView *)self->_webView mainFrame];
  v13 = [v12 DOMDocument];
  if (v16) {
    v14 = [(LPLinkHTMLGenerator *)v11 initWithPresentationProperties:v16 URL:v6 document:v13];
  }
  else {
    v14 = [(LPLinkHTMLGenerator *)v11 initWithURL:v6 document:v13];
  }
  DOMGenerator = self->_DOMGenerator;
  self->_DOMGenerator = v14;

  [(LPLinkHTMLGenerator *)self->_DOMGenerator setDelegate:self];
}

- (BOOL)generateEmailCompatibleMarkup
{
  return 1;
}

- (void)setMetadata:(id)a3
{
  [(LPLinkHTMLGenerator *)self->_DOMGenerator setMetadata:a3];
  generatedFragmentText = self->_generatedFragmentText;
  self->_generatedFragmentText = 0;
}

- (LPLinkMetadata)metadata
{
  return [(LPLinkHTMLGenerator *)self->_DOMGenerator metadata];
}

- (NSURL)URL
{
  return [(LPLinkHTMLGenerator *)self->_DOMGenerator URL];
}

- (void)_generateDOMDocumentBody
{
  LPWebLock(self, a2);
  id v16 = [(LPLinkHTMLGenerator *)self->_DOMGenerator documentFragment];
  v3 = [(WebView *)self->_webView mainFrame];
  id v4 = [v3 DOMDocument];
  v5 = [v4 body];

  layoutDirection = self->_layoutDirection;
  if (layoutDirection)
  {
    uint64_t v7 = [(NSNumber *)layoutDirection unsignedIntegerValue];
    if (v7)
    {
      if (v7 != 1) {
        goto LABEL_7;
      }
      v8 = @"rtl";
    }
    else
    {
      v8 = @"ltr";
    }
    [v5 setDir:v8];
  }
LABEL_7:
  htmlPrefix = self->_htmlPrefix;
  if (htmlPrefix)
  {
    webView = self->_webView;
    v11 = NSString;
    objc_super v12 = [(NSString *)htmlPrefix stringByReplacingOccurrencesOfString:@"'" withString:@"\\'"];
    objc_msgSend(v11, "stringWithFormat:", @"(function () { const parser = new DOMParser(); const doc = parser.parseFromString('%@', 'text/html'); Array.from(doc.body.childNodes).forEach((child)=>{document.body.appendChild(child)}) })()",
    v13 = v12);
    id v14 = [(WebView *)webView stringByEvaluatingJavaScriptFromString:v13];
  }
  id v15 = (id)[v5 appendChild:v16];
}

- (void)_cleanUpDOMDocumentBody
{
  v2 = [(WebView *)self->_webView mainFrame];
  v3 = [v2 DOMDocument];
  id v5 = [v3 body];

  while (1)
  {

    if (![v5 hasChildNodes]) {
      break;
    }
    v2 = [v5 lastChild];
    id v4 = (id)[v5 removeChild:v2];
  }
}

- (NSString)HTMLFragmentString
{
  p_generatedFragmentText = &self->_generatedFragmentText;
  generatedFragmentText = self->_generatedFragmentText;
  if (!generatedFragmentText)
  {
    [(LPLinkHTMLTextGenerator *)self _generateDOMDocumentBody];
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v6 = [(WebView *)self->_webView mainFrame];
    uint64_t v7 = [v6 DOMDocument];
    v8 = [v7 body];
    objc_super v9 = [v8 childNodes];

    for (uint64_t i = 0; i < [v9 length]; uint64_t i = (i + 1))
    {
      v11 = [v9 item:i];
      objc_super v12 = [v11 markupString];
      [v5 appendString:v12];
    }
    objc_storeStrong((id *)p_generatedFragmentText, v5);
    [(LPLinkHTMLTextGenerator *)self _cleanUpDOMDocumentBody];

    generatedFragmentText = *p_generatedFragmentText;
  }
  v13 = (void *)[(NSString *)generatedFragmentText copy];

  return (NSString *)v13;
}

- (void)generateHTMLFragmentString:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__LPLinkHTMLTextGenerator_generateHTMLFragmentString___block_invoke;
  v6[3] = &unk_1E5B04F80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __54__LPLinkHTMLTextGenerator_generateHTMLFragmentString___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) HTMLFragmentString];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)generateWebArchiveData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__LPLinkHTMLTextGenerator_generateWebArchiveData___block_invoke;
  v6[3] = &unk_1E5B05068;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __50__LPLinkHTMLTextGenerator_generateWebArchiveData___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _generateDOMDocumentBody];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) mainFrame];
  v3 = [v2 DOMDocument];
  id v4 = [v3 webArchive];
  id v5 = [v4 data];

  [*(id *)(a1 + 32) _cleanUpDOMDocumentBody];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)linkHTMLGenerator:(id)a3 URLForResource:(id)a4 withMIMEType:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (v10 = WeakRetained,
        id v11 = objc_loadWeakRetained((id *)&self->_delegate),
        char v12 = objc_opt_respondsToSelector(),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    id v14 = [v13 linkHTMLTextGenerator:self URLForResource:v7 withMIMEType:v8];
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F1CB10];
    id v16 = NSString;
    v13 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    v17 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:v13];
    v18 = [v7 base64EncodedStringWithOptions:0];
    v19 = [v16 stringWithFormat:@"data:%@;base64,%@", v17, v18];
    id v14 = [v15 URLWithString:v19];
  }

  return v14;
}

- (LPLinkHTMLTextGeneratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LPLinkHTMLTextGeneratorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)htmlPrefix
{
  return self->_htmlPrefix;
}

- (void)setHtmlPrefix:(id)a3
{
}

- (NSNumber)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutDirection, 0);
  objc_storeStrong((id *)&self->_htmlPrefix, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_generatedFragmentText, 0);
  objc_storeStrong((id *)&self->_DOMGenerator, 0);

  objc_storeStrong((id *)&self->_webView, 0);
}

@end