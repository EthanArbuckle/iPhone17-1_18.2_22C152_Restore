@interface MSComposeBundlePageController
- (JSContext)jsContext;
- (JSValue)jsBodyField;
- (MSComposeBodyFieldObserver)observerProxy;
- (MSComposeBundlePageController)initWithPlugIn:(id)a3 contextController:(id)a4;
- (WKWebProcessPlugIn)plugIn;
- (WKWebProcessPlugInBrowserContextController)controller;
- (id)_linkGeneratorProxy;
- (id)createRichLink:(id)a3;
- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7;
- (id)willSendRequest:(id)a3;
- (void)changeQuoteLevelBy:(int64_t)a3 withUndoActionName:(id)a4;
- (void)enableQuickReply:(BOOL)a3;
- (void)enableSmartReply:(BOOL)a3;
- (void)initializeBodyField:(id)a3;
- (void)initializeGlobalObject;
- (void)insertRichLinkWithURL:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)makeRichLinkFromSelection;
- (void)performBodyFieldMethodOnPage:(id)a3 withArguments:(id)a4;
- (void)performOnPage:(id)a3;
- (void)removeRichLinkFromSelection;
- (void)resumePerformOnPage;
- (void)stripCustomBodyIdentifiers;
- (void)suspendPerformOnPage;
- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishDocumentLoadForFrame:(id)a4;
- (void)webProcessPlugInBrowserContextController:(id)a3 globalObjectIsAvailableForFrame:(id)a4 inScriptWorld:(id)a5;
@end

@implementation MSComposeBundlePageController

- (MSComposeBundlePageController)initWithPlugIn:(id)a3 contextController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MSComposeBundlePageController;
  v8 = [(MSComposeBundlePageController *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_plugIn, v6);
    objc_storeStrong((id *)&v9->_controller, a4);
    v9->_performOnPageSuspendCount = 1;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    blocksToPerformOnPage = v9->_blocksToPerformOnPage;
    v9->_blocksToPerformOnPage = v10;

    [(WKWebProcessPlugInBrowserContextController *)v9->_controller setLoadDelegate:v9];
    uint64_t v12 = [MEMORY[0x263F3B390] transactionWithDescription:@"Compose WebContent process transaction"];
    webContentProcessTransaction = v9->_webContentProcessTransaction;
    v9->_webContentProcessTransaction = (EFProcessTransaction *)v12;
  }
  return v9;
}

- (void)invalidate
{
  [(WKWebProcessPlugInBrowserContextController *)self->_controller setLoadDelegate:0];
  jsContext = self->_jsContext;
  self->_jsContext = 0;

  jsBodyField = self->_jsBodyField;
  self->_jsBodyField = 0;

  [(EFProcessTransaction *)self->_webContentProcessTransaction invalidate];
  webContentProcessTransaction = self->_webContentProcessTransaction;
  self->_webContentProcessTransaction = 0;
}

- (MSComposeBodyFieldObserver)observerProxy
{
}

- (void)performOnPage:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_performOnPageSuspendCount)
  {
    blocksToPerformOnPage = self->_blocksToPerformOnPage;
    id v6 = (void *)MEMORY[0x22A6A8930]();
    [(NSMutableArray *)blocksToPerformOnPage addObject:v6];
  }
  else
  {
    self->_performOnPageSuspendCount = 1;
    (*((void (**)(void))v4 + 2))();
    [(MSComposeBundlePageController *)self resumePerformOnPage];
  }
}

- (void)suspendPerformOnPage
{
}

- (void)resumePerformOnPage
{
  unint64_t v2 = self->_performOnPageSuspendCount - 1;
  self->_performOnPageSuspendCount = v2;
  if (!v2)
  {
    do
    {
      uint64_t v4 = [(NSMutableArray *)self->_blocksToPerformOnPage firstObject];
      if (!v4) {
        break;
      }
      v5 = (void (**)(void))v4;
      [(NSMutableArray *)self->_blocksToPerformOnPage removeObjectAtIndex:0];
      ++self->_performOnPageSuspendCount;
      v5[2](v5);

      unint64_t v6 = self->_performOnPageSuspendCount - 1;
      self->_performOnPageSuspendCount = v6;
    }
    while (!v6);
  }
}

- (void)performBodyFieldMethodOnPage:(id)a3 withArguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__MSComposeBundlePageController_performBodyFieldMethodOnPage_withArguments___block_invoke;
  v10[3] = &unk_264853220;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MSComposeBundlePageController *)self performOnPage:v10];
}

id __76__MSComposeBundlePageController_performBodyFieldMethodOnPage_withArguments___block_invoke(void *a1)
{
  return (id)[*(id *)(a1[4] + 24) invokeMethod:a1[5] withArguments:a1[6]];
}

- (id)_linkGeneratorProxy
{
  linkGeneratorProxy = self->_linkGeneratorProxy;
  if (!linkGeneratorProxy)
  {
    uint64_t v4 = [(MSComposeBundlePageController *)self controller];
    v5 = [v4 _remoteObjectRegistry];
    id v6 = [MEMORY[0x263F1FAB8] remoteObjectInterfaceWithProtocol:&unk_26DD345A0];
    id v7 = [v5 remoteObjectProxyWithInterface:v6];
    id v8 = self->_linkGeneratorProxy;
    self->_linkGeneratorProxy = v7;

    linkGeneratorProxy = self->_linkGeneratorProxy;
  }

  return linkGeneratorProxy;
}

- (id)createRichLink:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F10378] currentContext];
  id v6 = [v5 objectForKeyedSubscript:@"Promise"];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__MSComposeBundlePageController_createRichLink___block_invoke;
  v13[3] = &unk_264853270;
  id v7 = v4;
  id v14 = v7;
  objc_super v15 = self;
  id v8 = v5;
  id v16 = v8;
  id v9 = (void *)MEMORY[0x22A6A8930](v13);
  v17[0] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  id v11 = [v6 constructWithArguments:v10];

  return v11;
}

void __48__MSComposeBundlePageController_createRichLink___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(NSURL, "_lp_URLWithUserTypedString:relativeToURL:", *(void *)(a1 + 32), 0);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 40));
  v5 = [*(id *)(a1 + 40) _linkGeneratorProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__MSComposeBundlePageController_createRichLink___block_invoke_2;
  v7[3] = &unk_264853248;
  objc_copyWeak(&v10, &location);
  id v8 = *(id *)(a1 + 48);
  id v6 = v3;
  id v9 = v6;
  [v5 createRichLinkWithURL:v4 completionHandler:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __48__MSComposeBundlePageController_createRichLink___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  v23[1] = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v11)
  {
    if (v12)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      v17 = [WeakRetained observerProxy];
      [v17 composeBodyFieldAddAttachmentWithData:v12 filename:v13 mimeType:v14 uniqueID:v15];
    }
    v18 = [MEMORY[0x263F10390] valueWithObject:v11 inContext:*(void *)(a1 + 32)];
    v19 = *(void **)(a1 + 40);
    v23[0] = v18;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    id v21 = (id)[v19 callWithArguments:v20];
  }
  else
  {
    id v22 = (id)[*(id *)(a1 + 40) callWithArguments:MEMORY[0x263EFFA68]];
  }
}

- (void)insertRichLinkWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__MSComposeBundlePageController_insertRichLinkWithURL_completionHandler___block_invoke;
  v10[3] = &unk_2648532C0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MSComposeBundlePageController *)self performOnPage:v10];
}

void __73__MSComposeBundlePageController_insertRichLinkWithURL_completionHandler___block_invoke(id *a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  [a1[4] suspendPerformOnPage];
  unint64_t v2 = (void *)*((void *)a1[4] + 3);
  id v3 = [a1[5] absoluteString];
  v13[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  v5 = [v2 invokeMethod:@"insertRichLink" withArguments:v4];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__MSComposeBundlePageController_insertRichLinkWithURL_completionHandler___block_invoke_2;
  v10[3] = &unk_264853298;
  id v6 = a1[6];
  v10[4] = a1[4];
  id v11 = v6;
  id v7 = (void *)MEMORY[0x22A6A8930](v10);
  id v12 = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
  id v9 = (id)[v5 invokeMethod:@"then" withArguments:v8];
}

uint64_t __73__MSComposeBundlePageController_insertRichLinkWithURL_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  unint64_t v2 = *(void **)(a1 + 32);

  return [v2 resumePerformOnPage];
}

- (void)makeRichLinkFromSelection
{
}

- (void)removeRichLinkFromSelection
{
}

- (void)stripCustomBodyIdentifiers
{
}

- (void)changeQuoteLevelBy:(int64_t)a3 withUndoActionName:(id)a4
{
  v9[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [NSNumber numberWithInteger:a3];
  v9[0] = v7;
  v9[1] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  [(MSComposeBundlePageController *)self performBodyFieldMethodOnPage:@"changeQuoteLevel" withArguments:v8];
}

- (id)willSendRequest:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)enableQuickReply:(BOOL)a3
{
  BOOL v3 = a3;
  v7[1] = *MEMORY[0x263EF8340];
  self->_isQuickReplyEnabled = _os_feature_enabled_impl() & a3;
  v5 = [NSNumber numberWithBool:v3];
  v7[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [(MSComposeBundlePageController *)self performBodyFieldMethodOnPage:@"enableQuickReply" withArguments:v6];
}

- (void)enableSmartReply:(BOOL)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  self->_isSmartReplyAvailable = a3;
  id v4 = objc_msgSend(NSNumber, "numberWithBool:");
  v6[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(MSComposeBundlePageController *)self performBodyFieldMethodOnPage:@"enableSmartReply" withArguments:v5];
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishDocumentLoadForFrame:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [v8 mainFrame];

  if (v7 == v6) {
    [(MSComposeBundlePageController *)self resumePerformOnPage];
  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 globalObjectIsAvailableForFrame:(id)a4 inScriptWorld:(id)a5
{
  v27[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 mainFrame];
  if (v11 == v9)
  {
    id v12 = [MEMORY[0x263F1FA50] normalWorld];

    if (v12 == v10)
    {
      id v13 = [v9 jsContextForWorld:v10];
      jsContext = self->_jsContext;
      self->_jsContext = v13;

      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __120__MSComposeBundlePageController_webProcessPlugInBrowserContextController_globalObjectIsAvailableForFrame_inScriptWorld___block_invoke;
      v24[3] = &unk_2648532E8;
      objc_copyWeak(&v25, &location);
      [(JSContext *)self->_jsContext setExceptionHandler:v24];
      id v15 = [(JSContext *)self->_jsContext globalObject];
      v27[0] = @"unhandledrejection";
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      id v21 = __120__MSComposeBundlePageController_webProcessPlugInBrowserContextController_globalObjectIsAvailableForFrame_inScriptWorld___block_invoke_2;
      id v22 = &unk_264853310;
      objc_copyWeak(&v23, &location);
      id v16 = (void *)MEMORY[0x22A6A8930](&v19);
      v27[1] = v16;
      v17 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v27, 2, v19, v20, v21, v22);
      id v18 = (id)[v15 invokeMethod:@"addEventListener" withArguments:v17];

      [(MSComposeBundlePageController *)self initializeGlobalObject];
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

void __120__MSComposeBundlePageController_webProcessPlugInBrowserContextController_globalObjectIsAvailableForFrame_inScriptWorld___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v24[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v23[0] = *MEMORY[0x263F536B8];
  v5 = [MEMORY[0x263F08B88] callStackSymbols];
  v24[0] = v5;
  v23[1] = *MEMORY[0x263F536C0];
  id v6 = [v4 objectForKeyedSubscript:@"stack"];
  id v7 = [v6 toString];
  id v8 = [v7 componentsSeparatedByString:@"\n"];
  v24[1] = v8;
  id v22 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

  id v9 = (void *)MEMORY[0x263EFF940];
  id v10 = NSString;
  id v11 = [v4 objectForKeyedSubscript:@"sourceURL"];
  id v12 = [v11 toString];
  id v13 = [v4 objectForKeyedSubscript:@"line"];
  id v14 = [v13 toString];
  id v15 = [v4 objectForKeyedSubscript:@"column"];
  id v16 = [v15 toString];
  v17 = [v4 toString];
  id v18 = [v10 stringWithFormat:@"JavaScript exception: %@:%@:%@: %@", v12, v14, v16, v17];
  uint64_t v19 = [v9 exceptionWithName:*MEMORY[0x263EFF488] reason:v18 userInfo:v22];

  uint64_t v20 = [WeakRetained observerProxy];
  [v20 composeBodyFieldDidThrowException:v19];
}

void __120__MSComposeBundlePageController_webProcessPlugInBrowserContextController_globalObjectIsAvailableForFrame_inScriptWorld___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained jsContext];
    id v6 = [v5 exceptionHandler];
    id v7 = [v8 objectForKeyedSubscript:@"reason"];
    ((void (**)(void, void *, void *))v6)[2](v6, v5, v7);
  }
}

- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7
{
  id v7 = -[MSComposeBundlePageController willSendRequest:](self, "willSendRequest:", a6, a4, a5);

  return v7;
}

- (void)initializeGlobalObject
{
  uint64_t v3 = 0;
  v46[27] = *MEMORY[0x263EF8340];
  v46[0] = "MailSupport/BodyField.js";
  v46[1] = kBodyFieldSource;
  v46[2] = kBodyFieldSourceLength;
  v46[3] = "MailSupport/BodyInputController.js";
  v46[4] = kBodyInputControllerSource;
  v46[5] = kBodyInputControllerSourceLength;
  v46[6] = "MailSupport/Constants.js";
  v46[7] = "/*\n"
           " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
           " */\n"
           "\"use strict\";const MFContentIDScheme=\"cid\",MFHtmlIDSelectionEnd=\"x-apple-selection:end\",MFHtmlIDSelecti"
           "onStart=\"x-apple-selection:start\",MFHtmlTemporaryEditingElement=\"AppleTemporaryEditingElement\",MFHtmlTemp"
           "oraryPresentationElement=\"AppleTemporaryPresentationElement\",MFMailDropBannerClass=\"x-apple-maildropbanner"
           "\",MFMailDropItemClass=\"x-apple-maildrop\",MFHtmlIDSignature=\"AppleMailSignature\",MFHtmlIDLineBreakAtSigna"
           "ture=\"lineBreakAtBeginningOfSignature\",MFHtmlIDLineBreakAtBeginning=\"lineBreakAtBeginningOfMessage\",MFRic"
           "hLinkClass=\"apple-rich-link\",MFLPRichLinkClassPrefix=\"lp-rich-link\",MFMailTemporaryAttachmentWrapper=\"x-"
           "apple-attachment-mark\",MFHtmlIDQuickReplyStyle=\"x-mail-quick-reply-style\",HtmlClassOriginalContent=\"Apple"
           "OriginalContents\",linkPlaceHolderClass=\"linkPlaceholder\",MFMailBigEmojiAttribute=\"AppleMailBigEmoji\",big"
           "EmojiFontSize=\"-webkit-xxx-large\",defaultEmojiFontSize=\"-apple-system-body\",maxNumberBigEmoji=3,largeInhe"
           "ritedFontSize=7;";
  v46[8] = kConstantsSourceLength;
  v46[9] = "MailSupport/DocumentExtras.js";
  v46[10] = "/*\n"
            " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
            " */\n"
            "\"use strict\";Document.prototype.createBlockPlaceholder=function(){let e=this.createElement(\"BR\");return "
            "e.className=\"webkit-block-placeholder\",e};";
  v46[11] = kDocumentExtrasSourceLength;
  v46[12] = "MailSupport/ElementExtras.js";
  v46[13] = kElementExtrasSource;
  v46[14] = kElementExtrasSourceLength;
  v46[15] = "MailSupport/HTMLDocumentExtras.js";
  v46[16] = "/*\n"
            " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
            " */\n"
            "\"use strict\";HTMLDocument.prototype.mf_createMessageQuoteElement=function(){let e=this.createElement(\"BLO"
            "CKQUOTE\");return e.setAttribute(\"TYPE\",\"cite\"),e},HTMLDocument.prototype.createElementFromMarkup=functi"
            "on(e){let t=this.createElement(\"template\");return t.innerHTML=e,t.content.firstChild},HTMLDocument.mf_list"
            "Elements=[\"ul\",\"ol\",\"dl\"],HTMLDocument.mf_quickReplyElementsToHideSelector=\"blockquote[type=cite], #l"
            "ineBreakAtBeginningOfMessage, #lineBreakAtBeginningOfSignature, .\"+HtmlClassOriginalContent+\", #\"+MFHtmlI"
            "DSignature,HTMLDocument.prototype.mf_getQuickReplyStyleElement=function(){return this.querySelector(\"#\"+MF"
            "HtmlIDQuickReplyStyle)},HTMLDocument.prototype.mf_quickReplyDisplayHiddenNodes=function(e){if (!isQuickReplyE"
            "nabled)return;let t=this.mf_getQuickReplyStyleElement();if (e){if (t&&t.remove(),this.quickReplyHiddenNodes)fo"
            "r(let e of this.quickReplyHiddenNodes)this.body.appendChild(e)}else if (this.quickReplyHiddenNodes===undefine"
            "d)(t=this.createElement(\"style\")).setAttribute(\"id\",MFHtmlIDQuickReplyStyle),this.head.appendChild(t),t."
            "sheet.insertRule(HTMLDocument.mf_quickReplyElementsToHideSelector+\" {display:none;}\");else for (let e of th"
            "is.quickReplyHiddenNodes)e.remove()},HTMLDocument.prototype.mf_quickReplyClearStylesAndSaveNodesIfNeeded=fun"
            "ction(){if (!isQuickReplyEnabled||this.quickReplyHiddenNodes!==undefined)return;let e=this.querySelectorAll(H"
            "TMLDocument.mf_quickReplyElementsToHideSelector);this.quickReplyHiddenNodes=Array.from(e);for (let t=0;t<e.le"
            "ngth;++t){let i=e[t];for (let l=t+1;l<e.length;++l){let t=e[l];if (i.contains(t)){let e=this.quickReplyHiddenN"
            "odes.indexOf(t);e>-1&&this.quickReplyHiddenNodes.splice(e,1)}}}for (let e of this.quickReplyHiddenNodes)e.rem"
            "ove();let t=this.mf_getQuickReplyStyleElement();t&&t.remove()};";
  v46[17] = kHTMLDocumentExtrasSourceLength;
  v46[18] = "MailSupport/HTMLElementExtras.js";
  v46[19] = "/*\n"
            " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
            " */\n"
            "\"use strict\";HTMLElement.prototype.mf_quoteLevelDelta=function(){if (\"BLOCKQUOTE\"!==this.nodeName.toUpper"
            "Case())return 0;let t=this.getAttribute(\"type\");if (t&&\"CITE\"===t.toUpperCase())return 1;let e=this.getAt"
            "tribute(\"class\");return e&&\"GMAIL_QUOTE\"===e.toUpperCase()?1:0};";
  v46[20] = kHTMLElementExtrasSourceLength;
  v46[21] = "MailSupport/NodeExtras.js";
  v46[22] = kNodeExtrasSource;
  v46[23] = kNodeExtrasSourceLength;
  v46[24] = "MailSupport/RangeExtras.js";
  v46[25] = "/*\n"
            " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
            " */\n"
            "\"use strict\";const blockElementNames=new Set([\"HTML\",\"BODY\",\"BR\",\"OL\",\"UL\",\"TD\",\"TH\",\"HR\","
            "\"DD\",\"DL\",\"DT\",\"PRE\",\"BLOCKQUOTE\",\"DIV\",\"P\",\"TR\",\"H1\",\"H2\",\"H3\",\"H4\",\"H5\",\"H6\"])"
            ",isBlockElementName=function(e){return blockElementNames.has(e)};Range.prototype.stringValue=function(){let "
            "e=this.text();return isBlockElementName(this.endContainer.nodeName)&&0===this.endOffset&&(e+=\"\\n\"),e},Ran"
            "ge.prototype.mf_hoistRange=function(){let e,t=!1;for (e=this.startContainer;!t&&!e.mf_isBody()&&!e.mf_quoteLe"
            "velDelta();)t=!0,this.endContainer===e&&(this.startOffset||this.endOffset!==e.childNodes.length||(this.setSt"
            "artBefore(e),this.setEndAfter(e),e=this.startContainer,t=!1))},Range.prototype.mf_firstNode=function(){let e"
            ";if (this.collapsed)return e;let t=this.startContainer,n=this.startOffset,i=!1;if (t instanceof Text)e=(i=n>0)"
            "?t.mf_traverseNextNodeStayingWithin():t;else{for (e=t.firstChild;n-- >0;)e=e.nextSibling;e||(e=t.mf_traverseN"
            "extSiblingStayingWithin())}return e&&!this.intersectsNode(e)&&(e=undefined),e},Range.prototype.mf_takeFocus="
            "function(e){e===undefined&&(e=!0),e&&this.collapse(!0);let t=document.getSelection();t.removeAllRanges(),t.a"
            "ddRange(this)},Range.prototype.mf_lastNode=function(){let e;if (this.collapsed)return e;let t=this.endContain"
            "er,n=this.endOffset,i=!1;if (t instanceof Text)e=(i=n<t.length)?t.mf_traversePreviousNode():t;else{for (e=t.fi"
            "rstChild;--n>0;)e=e.nextSibling;e&&this.endOffset||(e=t.mf_traversePreviousNode())}return e&&!this.intersect"
            "sNode(e)&&(e=undefined),e};const IS_BLOCK_ELEMENT_NAME=function(e){const t=[\"HTML\",\"BODY\",\"BR\",\"LI\","
            "\"OL\",\"UL\",\"TD\",\"TH\",\"HR\",\"DD\",\"DL\",\"DT\",\"PRE\",\"BLOCKQUOTE\",\"DIV\",\"P\",\"TR\",\"H1\",\""
            "H2\",\"H3\",\"H4\",\"H5\",\"H6\"];return e&&-1!==t.indexOf(e)},isBlockLevelNode=function(e){let t=!1;return "
            "t=!!IS_BLOCK_ELEMENT_NAME(e.nodeName)};Range.prototype.mf_getBlockBoundaryParentAndNextSibling=function(e){l"
            "et t,n;if (e){let e=this.mf_firstNode(),t=e&&e.mf_topmostContainingNodeWithNameInArray(HTMLDocument.mf_listEl"
            "ements);if (t)return{parent:t.parentNode,nextSibling:t}}else{let e=this.mf_lastNode(),t=e&&e.mf_topmostContai"
            "ningNodeWithNameInArray(HTMLDocument.mf_listElements);if (t)return{parent:t.parentNode,nextSibling:t.nextSibl"
            "ing}}let i,s,o;if (e?(i=this.startContainer,o=this.startOffset):(i=this.endContainer,o=this.endOffset),i inst"
            "anceof Text)i=(s=i).parentNode;else for (s=i.firstChild;o-- >0;s=s.nextSibling);for (e&&(s=s?s.previousSibling"
            ":i.lastChild);!t&&i;){for (;!t&&s;)isBlockLevelNode(s)?(t=i,n=e||\"BR\"===s.nodeName.toUpperCase()?s.nextSibl"
            "ing:s):s=e?s.previousSibling:s.nextSibling;s||(isOrContainsBlockLevelNode(i)?(t=i,n=e?t.firstChild:undefined"
            "):(s=i,i=i.parentNode))}return{parent:t,nextSibling:n}};const isOrContainsBlockLevelNode=function(e){let t,n"
            "=!1;if (IS_BLOCK_ELEMENT_NAME(e.nodeName))n=!0;else for (t=e.firstChild;!n&&t;)n=isOrContainsBlockLevelNode(t)"
            ",t=t.nextSibling;return n};";
  v46[26] = kRangeExtrasSourceLength;
  do
  {
    jsContext = self->_jsContext;
    v5 = (void *)[[NSString alloc] initWithBytes:v46[v3 + 1] length:v46[v3 + 2] encoding:4];
    id v6 = NSURL;
    id v7 = [NSString stringWithUTF8String:v46[v3]];
    id v8 = [v6 URLWithString:v7];
    id v9 = [(JSContext *)jsContext evaluateScript:v5 withSourceURL:v8];

    v3 += 3;
  }
  while (v3 != 27);
  [(JSContext *)self->_jsContext setObject:&unk_26DD31450 forKeyedSubscript:@"NSUTF8StringEncoding"];
  [(JSContext *)self->_jsContext setObject:objc_opt_class() forKeyedSubscript:@"NSURL"];
  [(JSContext *)self->_jsContext setObject:&__block_literal_global forKeyedSubscript:@"bigEmojiEnabled"];
  [(JSContext *)self->_jsContext setObject:&__block_literal_global_141 forKeyedSubscript:@"isInlineGenmojiEnabled"];
  [(JSContext *)self->_jsContext setObject:&__block_literal_global_147 forKeyedSubscript:@"canUseNamedLinks"];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v10 = [(MSComposeBundlePageController *)self observerProxy];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_4;
  v37[3] = &unk_264853358;
  objc_copyWeak(&v38, &location);
  [v10 composeBodyFieldQuickReplyEnabled:v37];

  v26 = [(JSContext *)self->_jsContext globalObject];
  uint64_t v11 = *MEMORY[0x263F10350];
  uint64_t v12 = MEMORY[0x263EFFA88];
  v45[0] = MEMORY[0x263EFFA88];
  uint64_t v13 = *MEMORY[0x263F10358];
  v44[0] = v11;
  v44[1] = v13;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_5;
  v35[3] = &unk_264853380;
  objc_copyWeak(&v36, &location);
  id v14 = (void *)MEMORY[0x22A6A8930](v35);
  v45[1] = v14;
  id v15 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
  [v26 defineProperty:@"isQuickReplyEnabled" descriptor:v15];

  id v16 = [(MSComposeBundlePageController *)self observerProxy];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_6;
  v33[3] = &unk_264853358;
  objc_copyWeak(&v34, &location);
  [v16 composeBodyFieldSmartReplyAvailable:v33];

  v42[1] = v13;
  v43[0] = v12;
  v42[0] = v11;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_7;
  v31[3] = &unk_264853380;
  objc_copyWeak(&v32, &location);
  v17 = (void *)MEMORY[0x22A6A8930](v31);
  v43[1] = v17;
  id v18 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
  [v26 defineProperty:@"isSmartReplyEnabled" descriptor:v18];

  uint64_t v19 = [(MSComposeBundlePageController *)self observerProxy];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_8;
  v29[3] = &unk_264853358;
  objc_copyWeak(&v30, &location);
  [v19 composeBodyFieldAddLinkPreviewsEnabled:v29];

  v40[1] = v13;
  v41[0] = v12;
  v40[0] = v11;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_9;
  void v27[3] = &unk_264853380;
  objc_copyWeak(&v28, &location);
  uint64_t v20 = (void *)MEMORY[0x22A6A8930](v27);
  v41[1] = v20;
  id v21 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
  [v26 defineProperty:@"addLinkPreviewsEnabled" descriptor:v21];

  [(JSContext *)self->_jsContext setObject:@"[\\n\\r\\s]+" forKeyedSubscript:@"whitespaceRegex"];
  [(JSContext *)self->_jsContext setObject:@"(\\p{Emoji_Presentation}|\\p{Extended_Pictographic})" forKeyedSubscript:@"emojiRegex"];
  [(JSContext *)self->_jsContext setObject:@"\\p{RI}\\p{RI}|\\p{Emoji}(\\p{EMod}|️⃣?|[\uE0020-\uE007E]+\uE007F)?(‍\\p{Emoji}(\\p{EMod}|️⃣?|[\uE0020-\uE007E]+\uE007F)?)*|." forKeyedSubscript:@"stringToArrayRegex"];
  id v22 = [(JSContext *)self->_jsContext objectForKeyedSubscript:@"Range"];
  id v23 = [v22 objectForKeyedSubscript:@"prototype"];

  [v23 setObject:&__block_literal_global_189 forKeyedSubscript:@"text"];
  v24 = [(JSContext *)self->_jsContext objectForKeyedSubscript:@"String"];
  id v25 = [v24 objectForKeyedSubscript:@"prototype"];

  [v25 setObject:&__block_literal_global_198 forKeyedSubscript:@"ef_isWebAddress"];
  [v25 setObject:&__block_literal_global_204 forKeyedSubscript:@"ef_rangeOfWebAddressContainingRange"];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

uint64_t __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_2()
{
  return _os_feature_enabled_impl();
}

uint64_t __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_3()
{
  return _os_feature_enabled_impl();
}

void __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_4(uint64_t a1, char a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[48] = _os_feature_enabled_impl() & a2;
  id v4 = (void *)*((void *)WeakRetained + 3);
  v5 = objc_msgSend(NSNumber, "numberWithBool:");
  v8[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  id v7 = (id)[v4 invokeMethod:@"enableQuickReply" withArguments:v6];
}

id __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_5(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = (void *)MEMORY[0x263F10390];
  int v3 = WeakRetained[48];
  id v4 = [MEMORY[0x263F10378] currentContext];
  v5 = [v2 valueWithBool:v3 != 0 inContext:v4];

  return v5;
}

void __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_6(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[50] = a2;
  }
}

id __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_7(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = (void *)MEMORY[0x263F10390];
  int v3 = WeakRetained[50];
  id v4 = [MEMORY[0x263F10378] currentContext];
  v5 = [v2 valueWithBool:v3 != 0 inContext:v4];

  return v5;
}

void __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_8(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[49] = a2;
}

id __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_9(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = (void *)MEMORY[0x263F10390];
  int v3 = WeakRetained[49];
  id v4 = [MEMORY[0x263F10378] currentContext];
  v5 = [v2 valueWithBool:v3 != 0 inContext:v4];

  return v5;
}

id __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_10()
{
  v0 = (void *)MEMORY[0x263F1FA48];
  v1 = [MEMORY[0x263F10378] currentThis];
  unint64_t v2 = [MEMORY[0x263F10378] currentContext];
  int v3 = [v0 rangeHandleWithJSValue:v1 inContext:v2];
  id v4 = [v3 text];

  return v4;
}

uint64_t __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_11()
{
  v0 = [MEMORY[0x263F10378] currentThis];
  v1 = [v0 toString];
  uint64_t v2 = objc_msgSend(v1, "ef_isWebAddress");

  return v2;
}

uint64_t __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = [MEMORY[0x263F10378] currentThis];
  id v6 = [v5 toString];
  uint64_t v7 = objc_msgSend(v6, "ef_rangeOfWebAddressContainingRange:", a2, a3);

  return v7;
}

- (void)initializeBodyField:(id)a3
{
  id v4 = (JSValue *)a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __53__MSComposeBundlePageController_initializeBodyField___block_invoke;
  id v10 = &unk_2648533E8;
  objc_copyWeak(&v11, &location);
  v5 = (void *)MEMORY[0x22A6A8930](&v7);
  [(JSValue *)v4 setObject:v5, @"_createRichLink", v7, v8, v9, v10 forKeyedSubscript];

  jsBodyField = self->_jsBodyField;
  self->_jsBodyField = v4;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

id __53__MSComposeBundlePageController_initializeBodyField___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained createRichLink:v3];

  return v5;
}

- (WKWebProcessPlugIn)plugIn
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_plugIn);

  return (WKWebProcessPlugIn *)WeakRetained;
}

- (WKWebProcessPlugInBrowserContextController)controller
{
  return self->_controller;
}

- (JSContext)jsContext
{
  return self->_jsContext;
}

- (JSValue)jsBodyField
{
  return self->_jsBodyField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsContext, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_destroyWeak((id *)&self->_plugIn);
  objc_storeStrong((id *)&self->_webContentProcessTransaction, 0);
  objc_storeStrong((id *)&self->_linkGeneratorProxy, 0);
  objc_storeStrong((id *)&self->_jsBodyField, 0);

  objc_storeStrong((id *)&self->_blocksToPerformOnPage, 0);
}

@end