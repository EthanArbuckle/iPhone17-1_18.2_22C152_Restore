@interface ComposeBodyFieldBundleController
+ (id)log;
- (BOOL)_webProcessPlugInBrowserContextController:(id)a3 shouldChangeSelectedRange:(id)a4 toRange:(id)a5 affinity:(int64_t)a6 stillSelecting:(BOOL)a7;
- (ComposeBodyFieldBundleController)initWithPlugIn:(id)a3 contextController:(id)a4;
- (MFComposeBodyFieldObserver)observerProxy;
- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7;
- (void)_addMarkupString:(id)a3 quote:(BOOL)a4 emptyFirst:(BOOL)a5 prepended:(BOOL)a6 composeType:(int64_t)a7 attachmentInfoByURL:(id)a8 completionHandler:(id)a9;
- (void)_performSignatureControllerMethodOnPage:(id)a3 withArguments:(id)a4;
- (void)_setDirty:(BOOL)a3;
- (void)_webProcessPlugInBrowserContextControllerDidChangeByEditing:(id)a3;
- (void)addLink:(id)a3;
- (void)addMailAttributesBeforeDisplayHidingTrailingEmptyQuotes:(BOOL)a3 shouldQuote:(BOOL)a4;
- (void)addMarkupString:(id)a3 quote:(BOOL)a4 emptyFirst:(BOOL)a5 prepended:(BOOL)a6 composeType:(int64_t)a7 attachmentInfoByURL:(id)a8;
- (void)addSignature:(id)a3 prepend:(BOOL)a4;
- (void)addTextDescriptionToLink:(id)a3;
- (void)appendOrReplace:(id)a3 withMarkupString:(id)a4 quote:(BOOL)a5 composeType:(int64_t)a6 attachmentInfoByURL:(id)a7 completionHandler:(id)a8;
- (void)containsRichText:(id)a3;
- (void)countDuplicatedAttachments:(id)a3 completionHandler:(id)a4;
- (void)displayAttachmentWithIdentifierAsSinglePagePDF:(id)a3 completionHandler:(id)a4;
- (void)finalizeSignature:(id)a3;
- (void)forceNextSelectionFromSecondToFirstLine;
- (void)getCaretPosition:(id)a3;
- (void)htmlStringUsingAttachmentInfoByIdentifier:(id)a3 completionHandler:(id)a4;
- (void)htmlStringsAttachmentURLsAndPlainTextAlternativeRemovingSignature:(BOOL)a3 attachmentInfoByIdentifier:(id)a4 completion:(id)a5;
- (void)initializeBodyField:(id)a3;
- (void)initializeGlobalObject;
- (void)insertAttachmentAsImage:(BOOL)a3 isSinglePagePDF:(BOOL)a4 contentType:(id)a5 completionHandler:(id)a6;
- (void)invalidate;
- (void)placeCaretAtStartOfBody;
- (void)plainTextContentUsingAttachmentInfoByIdentifier:(id)a3 completionHandler:(id)a4;
- (void)prependPreamble:(id)a3 quote:(BOOL)a4 layoutDirection:(int64_t)a5;
- (void)removeLink;
- (void)removeMediaAttachment:(id)a3 completionHandler:(id)a4;
- (void)removeSignature;
- (void)replaceFilenamePlaceholderWithAttachment:(id)a3 identifier:(id)a4;
- (void)replaceFilenamePlaceholderWithImage:(id)a3 completionHandler:(id)a4;
- (void)replaceImagesIfNecessary;
- (void)replaceRichLinkPlaceholderImage:(id)a3 completionHandler:(id)a4;
- (void)setCaretPosition:(unint64_t)a3;
- (void)setDirty:(BOOL)a3 completionHandler:(id)a4;
- (void)setEditLinkFlag;
- (void)setReplacementFilenamesByContentID:(id)a3;
- (void)updateLinkFromExistingLink:(id)a3 isEditing:(BOOL)a4;
- (void)updateSignature:(id)a3;
@end

@implementation ComposeBodyFieldBundleController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4614;
  block[3] = &unk_182C0;
  block[4] = a1;
  if (qword_1ECC0 != -1) {
    dispatch_once(&qword_1ECC0, block);
  }
  v2 = (void *)qword_1ECB8;

  return v2;
}

- (ComposeBodyFieldBundleController)initWithPlugIn:(id)a3 contextController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)ComposeBodyFieldBundleController;
  v8 = [(ComposeBodyFieldBundleController *)&v38 initWithPlugIn:v6 contextController:v7];
  if (v8)
  {
    [v7 _setEditingDelegate:v8];
    [v7 setLoadDelegate:v8];
    v37 = [v7 _remoteObjectRegistry];
    uint64_t v9 = +[_WKRemoteObjectInterface remoteObjectInterfaceWithProtocol:&OBJC_PROTOCOL___MFComposeBodyFieldController];
    bodyFieldInterface = v8->_bodyFieldInterface;
    v8->_bodyFieldInterface = (_WKRemoteObjectInterface *)v9;

    v11 = v8->_bodyFieldInterface;
    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
    [(_WKRemoteObjectInterface *)v11 setClasses:v13 forSelector:"setReplacementFilenamesByContentID:" argumentIndex:0 ofReply:0];

    v14 = v8->_bodyFieldInterface;
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    [(_WKRemoteObjectInterface *)v14 setClasses:v17 forSelector:"htmlStringsAttachmentURLsAndPlainTextAlternativeRemovingSignature:attachmentInfoByIdentifier:completion:" argumentIndex:1 ofReply:0];

    v18 = v8->_bodyFieldInterface;
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    v21 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    [(_WKRemoteObjectInterface *)v18 setClasses:v21 forSelector:"plainTextContentUsingAttachmentInfoByIdentifier:completionHandler:" argumentIndex:0 ofReply:0];

    v22 = v8->_bodyFieldInterface;
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v23, v24, objc_opt_class(), 0);
    [(_WKRemoteObjectInterface *)v22 setClasses:v25 forSelector:"addMarkupString:quote:emptyFirst:prepended:composeType:attachmentInfoByURL:" argumentIndex:5 ofReply:0];

    v26 = v8->_bodyFieldInterface;
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    v29 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v27, v28, objc_opt_class(), 0);
    [(_WKRemoteObjectInterface *)v26 setClasses:v29 forSelector:"appendOrReplace:withMarkupString:quote:composeType:attachmentInfoByURL:completionHandler:" argumentIndex:4 ofReply:0];

    v30 = v8->_bodyFieldInterface;
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    v33 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v31, v32, objc_opt_class(), 0);
    [(_WKRemoteObjectInterface *)v30 setClasses:v33 forSelector:"htmlStringUsingAttachmentInfoByIdentifier:completionHandler:" argumentIndex:0 ofReply:0];

    [v37 registerExportedObject:v8 interface:v8->_bodyFieldInterface];
    uint64_t v34 = +[_WKRemoteObjectInterface remoteObjectInterfaceWithProtocol:&OBJC_PROTOCOL___MFMailSignatureController];
    signatureControllerInterface = v8->_signatureControllerInterface;
    v8->_signatureControllerInterface = (_WKRemoteObjectInterface *)v34;

    [v37 registerExportedObject:v8 interface:v8->_signatureControllerInterface];
  }

  return v8;
}

- (void)invalidate
{
  v3 = [(ComposeBodyFieldBundleController *)self controller];
  [v3 _setEditingDelegate:0];
  [v3 setLoadDelegate:0];
  v4 = [v3 _remoteObjectRegistry];
  [v4 unregisterExportedObject:self interface:self->_bodyFieldInterface];
  [v4 unregisterExportedObject:self interface:self->_signatureControllerInterface];
  jsSignatureController = self->_jsSignatureController;
  self->_jsSignatureController = 0;

  v6.receiver = self;
  v6.super_class = (Class)ComposeBodyFieldBundleController;
  [(ComposeBodyFieldBundleController *)&v6 invalidate];
}

- (void)initializeGlobalObject
{
  v28.receiver = self;
  v28.super_class = (Class)ComposeBodyFieldBundleController;
  [(ComposeBodyFieldBundleController *)&v28 initializeGlobalObject];
  v3 = [(ComposeBodyFieldBundleController *)self jsContext];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"MFMessageBodyParser"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"MessageBodyDOMParser"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:@"MessageBodyDOMQuoteSubparser"];
  uint64_t v4 = 0;
  v33[0] = "BodyField.js";
  v33[1] = aCopyrightCTime;
  v33[2] = qword_1EC58;
  v33[3] = "Constants.js";
  v33[4] = "/*\n"
           " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
           " */\n"
           "\"use strict\";const MFAttachmentAttributeContentIDKey=\"id\",MFAttributeOriginalWidth=\"X-APPLE-ORIGINAL-WID"
           "TH\",MFAttributeOriginalHeight=\"X-APPLE-ORIGINAL-HEIGHT\",MFMailSignatureAttribute=\"AppleMailSignature\",kM"
           "FComposeFileAttachmentClass=\"Apple-mail-fileattach\",kMFComposeImageAttachmentClass=\"Apple-mail-imageattach"
           "\",kMFComposeSinglePagePDFClass=\"Apple-mail-pdf\";";
  v33[5] = qword_1EC60;
  v33[6] = "ElementExtras.js";
  v33[7] = "/*\n"
           " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
           " */\n"
           "\"use strict\";Element.prototype.mf_stripCSSStyle=function(){for (let t of this.querySelectorAll(\"style[type="
           "'text/css']\"))t.parentNode.removeChild(t)},Element.prototype.mf_setDirAttributeToComputedValue=function(){th"
           "is.setAttribute(\"dir\",\"auto\");let t=getComputedStyle(this).direction;\"ltr\"===t||\"rtl\"===t?this.setAtt"
           "ribute(\"dir\",t):this.removeAttribute(\"dir\")};";
  v33[8] = qword_1EC68;
  v33[9] = "HTMLBodyElementExtras.js";
  v33[10] = "/*\n"
            " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
            " */\n"
            "\"use strict\";HTMLBodyElement.prototype.recursivelyRemoveMailAttributes=function(){this.removeAttribute(\"a"
            "ria-label\"),this.removeAttribute(\"role\"),Object.getPrototypeOf(HTMLBodyElement).prototype.recursivelyRemo"
            "veMailAttributes.call(this)};";
  v33[11] = qword_1EC70;
  v33[12] = "HTMLDocumentExtras.js";
  v33[13] = "/*\n"
            " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
            " */\n"
            "\"use strict\";";
  v33[14] = qword_1EC78;
  v33[15] = "HTMLElementExtras.js";
  v33[16] = "/*\n"
            " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
            " */\n"
            "\"use strict\";const _MFIsComposeAttachmentClassName=function(t){return t===kMFComposeImageAttachmentClass||"
            "t===kMFComposeFileAttachmentClass||t==kMFComposeSinglePagePDFClass};HTMLElement.prototype.recursivelyRemoveM"
            "ailAttributes=function(){if (_MFIsComposeAttachmentClassName(this.getAttribute(\"CLASS\"))&&this.removeAttrib"
            "ute(\"CLASS\"),this.classList.contains(kMFComposeImageAttachmentClass)&&this.classList.remove(kMFComposeImag"
            "eAttachmentClass),Object.getPrototypeOf(HTMLElement).prototype.recursivelyRemoveMailAttributes.call(this),MF"
            "HtmlTemporaryPresentationElement===this.getAttribute(\"x-apple-mail\")&&null!=this.parentElement){let t=this"
            ".firstChild;for (;t;){let e=t.nextSibling;this.parentElement.insertBefore(t,this),t=e}this.parentElement.remo"
            "veChild(this)}};";
  v33[17] = qword_1EC80;
  v33[18] = "HTMLImageElementExtras.js";
  v33[19] = "/*\n"
            " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
            " */\n"
            "\"use strict\";HTMLImageElement.prototype.mf_unconstrainImageSize=function(){if (this.hasAttribute(MFAttribut"
            "eOriginalWidth)){let t=this.getAttribute(MFAttributeOriginalWidth);\"\"===t?(this.removeAttribute(\"WIDTH\")"
            ",this.style.removeProperty(\"width\"),this.style.removeProperty(\"max-width\")):this.width=t}if (this.hasAttr"
            "ibute(MFAttributeOriginalHeight)){let t=this.getAttribute(MFAttributeOriginalHeight);\"\"===t?(this.removeAt"
            "tribute(\"HEIGHT\"),this.style.removeProperty(\"height\"),this.style.removeProperty(\"max-height\")):this.he"
            "ight=t}this.removeAttribute(MFAttributeOriginalWidth),this.removeAttribute(MFAttributeOriginalHeight)},HTMLI"
            "mageElement.prototype.recursivelyRemoveMailAttributes=function(){_MFIsComposeAttachmentClassName(this.getAtt"
            "ribute(\"CLASS\"))&&this.mf_unconstrainImageSize(),Object.getPrototypeOf(HTMLImageElement).prototype.recursi"
            "velyRemoveMailAttributes.call(this)};";
  v33[20] = qword_1EC88;
  v33[21] = "MessageBodyDOMParser.js";
  v33[22] = "/*\n"
            " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
            " */\n"
            "\"use strict\";MessageBodyDOMParser.prototype.enqueueParagraphNode=function(e,t){this.enqueueParagraphJSNode"
            "WithTagName(e,t)},MessageBodyDOMParser.prototype._consumeAccumulatedNodes=function(e){for (let t of e)this.en"
            "queueParagraphNode(t,t.tagName);this.flushParagraphNodes()},MessageBodyDOMParser.prototype.parse=function(){"
            "let e=this._document.body,t=[],s=[],n=e,o=0,a=o;for (this.willBeginParsing();n&&this.shouldProceedParsing();)"
            "{let r=null,i=o;if (n.hasChildNodes())r=n.firstChild,i++,s=[],t.push(s);else if (s.push(n),!(r=n.nextSibling))"
            "{let o=n;for (;!(r=o.nextSibling)&&(o=o.parentNode)&&o!==e;){let e=--i>=a;if (!e){for (let e of t)this._consume"
            "AccumulatedNodes(e),e.length=0;a=-1}t.pop(),s=t[t.length-1],e&&s.push(o)}}if (n=r,o=i,n instanceof Element){l"
            "et e=n.tagName;if (this.isLandmarkTagName(e)){a=o;for (let e of t)this._consumeAccumulatedNodes(e),e.length=0}"
            "}}for (let e of t)this._consumeAccumulatedNodes(e);return this.didFinishParsing(),!0},MessageBodyDOMParser.pr"
            "ototype.copyConsumableNodesAndAppendInnerTextToStringAccumulator=function(e,t){for (let s of e.jsNodes()){let"
            " e=null,n=null;if (s instanceof Element){let t=s;n=t.mf_isAttachment()?\"\\xa0\":t.innerText,e=t.tagName}else"
            " s instanceof Text&&(n=s.data);if (MFMessageBodyParser.isLinebreakImpliedBeforeTagName(e)&&t.appendNewline(),"
            "n&&t.appendRange(0,n.length,n),MFMessageBodyParser.isLinebreakImpliedAfterTagName(e)&&t.appendNewline(),t.is"
            "Full())break}return null},MessageBodyDOMParser.prototype.rangeForElement=function(e){let t=this._document.cr"
            "eateRange(),s=e.jsNodes();return t.setStartBefore(s[0]),t.setEndAfter(s[s.length-1]),t},MessageBodyDOMParser"
            ".prototype.extendRangeToElement=function(e,t){let s=t.jsNodes();e.setEndAfter(s[s.length-1])},MessageBodyDOM"
            "Parser.prototype.rangeFromElementToElement=function(e,t){let s=this._document.createRange();s.setStartBefore"
            "(e.jsNodes()[0]);let n=t.jsNodes();return s.setEndAfter(n[n.length-1]),s};";
  v33[23] = qword_1EC90;
  v33[24] = "MessageBodyDOMQuoteSubparser.js";
  v33[25] = "/*\n"
            " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
            " */\n"
            "\"use strict\";MessageBodyDOMQuoteSubparser.prototype.AttributeEmpty=1,MessageBodyDOMQuoteSubparser.prototyp"
            "e.AttributeWhitespace=4,MessageBodyDOMQuoteSubparser.prototype.AttributeAttribution=8,MessageBodyDOMQuoteSub"
            "parser.prototype.AttributeAttributionPrefix=128,MessageBodyDOMQuoteSubparser.prototype.doesRangeContainAnyEl"
            "ementWithTagName=function(t,e){let n=!1,i=t.commonAncestorContainer;if (i instanceof Element){let s=i.getElem"
            "entsByTagName(e),r=s.length;for (let e=0;e<r;e++)if (t.intersectsNode(s.item(e))){n=!0;break}}return n},Messag"
            "eBodyDOMQuoteSubparser.prototype._enumerateSurroundableRangesInRange=function(t,e){let n=t.startContainer,i="
            "t.endContainer;if (n===i)e(t);else{let s=t.commonAncestorContainer,r=t.cloneRange(),o=n.mf_childNodeAtIndex(t"
            ".startOffset),a=!0;for (;n!==s;)a?r.setStartBefore(o):r.setStartAfter(o),r.setEndAfter(o.mf_lastSibling()),e("
            "r),n=(o=n).parentNode,a=!1;let d=i.mf_childNodeAtIndex(t.endOffset-1),l=!0;for (;i!==s;)l?r.setEndAfter(d):r."
            "setEndBefore(d),r.setStartBefore(d.mf_firstSibling()),e(r),i=(d=i).parentNode,l=!1;a?r.setStartBefore(o):r.s"
            "etStartAfter(o),l?r.setEndAfter(d):r.setEndBefore(d),e(r)}},MessageBodyDOMQuoteSubparser.prototype.messageBo"
            "dyParserFoundMessageBodyElement=function(t,e){if (this.foundDedentedAttributionRangeHandler){const n=2;if (thi"
            "s._unindentedSiblingNodes||(this._unindentedSiblingNodes=[]),this._lastUnindentedAttributionHint&&e.quoteLev"
            "el()===this._lastUnindentedElement.quoteLevel()+1&&(this._lastUnindentedAttributionHint.setJSNodes(this._las"
            "tUnindentedAttributionHint.jsNodes().concat(this._unindentedSiblingNodes)),this._lastUnindentedAttributionHi"
            "nt.valueForAttributes(this.AttributeAttribution))){let e=t.rangeFromElementToElement(this._lastUnindentedAtt"
            "ributionHint,this._lastUnindentedElement);this._enumerateSurroundableRangesInRange(e,t=>{this.foundDedentedA"
            "ttributionRangeHandler(t)}),this._lastUnindentedAttributionHint&&this._lastUnindentedAttributionHint.release"
            "Externally(),this._lastUnindentedAttributionHint=undefined,this._unindentedSiblingGap=0,this._unindentedSibl"
            "ingNodes.length=0}if (e.valueForAttributes(this.AttributeAttributionPrefix)){this._lastUnindentedAttributionH"
            "int&&this._lastUnindentedAttributionHint.releaseExternally(),this._lastUnindentedAttributionHint=e.retainExt"
            "ernally();for (let t of e.jsNodes())this._unindentedSiblingNodes.push(t)}else if (this._lastUnindentedAttribut"
            "ionHint)if (this._unindentedSiblingGap>n)this._lastUnindentedAttributionHint&&this._lastUnindentedAttribution"
            "Hint.releaseExternally(),this._lastUnindentedAttributionHint=undefined,this._unindentedSiblingGap=0,this._un"
            "indentedSiblingNodes.length=0;else{for (let t of e.jsNodes())this._unindentedSiblingNodes.push(t);this._unind"
            "entedSiblingGap++}this._lastUnindentedElement&&this._lastUnindentedElement.releaseExternally(),this._lastUni"
            "ndentedElement=e.retainExternally()}if (this.foundTrailingEmptyQuoteRangeHandler){if (this._trailingEmptyQuote"
            "Range){let n=!1;e.quoteLevel()<this._trailingEmptyQuoteLevel?this.doesRangeContainAnyElementWithTagName(this"
            "._trailingEmptyQuoteRange,\"img\")||this._enumerateSurroundableRangesInRange(this._trailingEmptyQuoteRange,t"
            "=>{this.foundTrailingEmptyQuoteRangeHandler(t)}):e.quoteLevel()===this._trailingEmptyQuoteLevel&&0!==e.value"
            "ForAttributes(this.AttributeEmpty|this.AttributeWhitespace)&&(n=!0),n?t.extendRangeToElement(this._trailingE"
            "mptyQuoteRange,e):this._trailingEmptyQuoteRange=null}!this._trailingEmptyQuoteRange&&e.quoteLevel()>0&&0!==e"
            ".valueForAttributes(this.AttributeEmpty|this.AttributeWhitespace)&&(this._trailingEmptyQuoteRange=t.rangeFor"
            "Element(e),this._trailingEmptyQuoteLevel=e.quoteLevel())}};";
  v33[26] = qword_1EC98;
  v33[27] = "NodeExtras.js";
  v33[28] = "/*\n"
            " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
            " */\n"
            "\"use strict\";Node.prototype.mf_isAttachment=function(){let t=!1;if (this instanceof Element){let e=this;\"w"
            "rapper\"===e.getAttribute(\"x-apple-mail\")?t=!0:IS_PAD()&&\"ATTACHMENT\"===e.tagName&&(t=!0)}return t},Node"
            ".prototype.mf_childNodeAtIndex=function(t){let e=this.firstChild;for (;e&&t>0;)e=e.nextSibling,t--;return e},"
            "Node.prototype.mf_firstSibling=function(){let t=this,e=null;for (;e=t.previousSibling;)t=e;return t},Node.pro"
            "totype.mf_lastSibling=function(){let t=this,e=null;for (;e=t.nextSibling;)t=e;return t},Node.prototype.recurs"
            "ivelyRemoveMailAttributes=function(){let t=this.firstChild;for (;t;){let e=t.nextSibling;t.recursivelyRemoveM"
            "ailAttributes(),t=e}};";
  v33[29] = qword_1ECA0;
  v33[30] = "RangeExtras.js";
  v33[31] = "/*\n"
            " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
            " */\n"
            "\"use strict\";";
  v33[32] = qword_1ECA8;
  v33[33] = "SignatureController.js";
  v33[34] = aCopyrightCTime_10;
  v33[35] = qword_1ECB0;
  do
  {
    id v5 = [objc_alloc((Class)NSString) initWithBytes:v33[v4 + 1] length:v33[v4 + 2] encoding:4];
    objc_super v6 = +[NSString stringWithUTF8String:v33[v4]];
    id v7 = +[NSURL URLWithString:v6];
    id v8 = [v3 evaluateScript:v5 withSourceURL:v7];

    v4 += 3;
  }
  while (v4 != 36);
  uint64_t v9 = [v3 objectForKeyedSubscript:@"BodyFieldIOS"];
  v10 = [v9 constructWithArguments:&__NSArray0__struct];

  [(ComposeBodyFieldBundleController *)self initializeBodyField:v10];
  v11 = [v3 objectForKeyedSubscript:@"SignatureController"];
  uint64_t v12 = [v11 constructWithArguments:&__NSArray0__struct];
  jsSignatureController = self->_jsSignatureController;
  self->_jsSignatureController = v12;

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_52F4;
  v27[3] = &unk_182E8;
  v27[4] = self;
  v14 = objc_retainBlock(v27);
  [v3 setObject:v14 forKeyedSubscript:@"IS_PAD"];

  [v3 setObject:&stru_18328 forKeyedSubscript:@"MFCreateURLForContentID"];
  uint64_t v15 = [v3 globalObject];
  v32[0] = &__kCFBooleanTrue;
  v31[0] = JSPropertyDescriptorEnumerableKey;
  v31[1] = JSPropertyDescriptorGetKey;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_536C;
  v26[3] = &unk_18350;
  v26[4] = self;
  uint64_t v16 = objc_retainBlock(v26);
  v32[1] = v16;
  v17 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
  [v15 defineProperty:@"defaultComposeFontPixelSize" descriptor:v17];

  v18 = [v3 globalObject];
  v29[1] = JSPropertyDescriptorGetKey;
  v30[0] = &__kCFBooleanTrue;
  v29[0] = JSPropertyDescriptorEnumerableKey;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_53C0;
  v25[3] = &unk_18378;
  v25[4] = self;
  uint64_t v19 = objc_retainBlock(v25);
  v30[1] = v19;
  uint64_t v20 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  [v18 defineProperty:@"defaultComposeFontFamily" descriptor:v20];

  [v3 setObject:&stru_183B8 forKeyedSubscript:@"charsetForString"];
  v21 = [v3 objectForKeyedSubscript:@"Range"];
  v22 = [v21 objectForKeyedSubscript:@"prototype"];

  [v22 setObject:&stru_183F8 forKeyedSubscript:@"linkify"];
  uint64_t v23 = [v3 objectForKeyedSubscript:@"String"];
  uint64_t v24 = [v23 objectForKeyedSubscript:@"prototype"];

  [v24 setObject:&stru_18438 forKeyedSubscript:@"mf_isAttribution"];
  [v24 setObject:&stru_18458 forKeyedSubscript:@"mf_isForwardSeparator"];
}

- (void)initializeBodyField:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ComposeBodyFieldBundleController;
  [(ComposeBodyFieldBundleController *)&v28 initializeBodyField:v4];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_5C34;
  v25[3] = &unk_18480;
  objc_copyWeak(&v26, &location);
  id v5 = objc_retainBlock(v25);
  [v4 setObject:v5 forKeyedSubscript:@"_selectedAttachmentIdentifiersDidChange"];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_5CFC;
  v23[3] = &unk_184A8;
  objc_copyWeak(&v24, &location);
  objc_super v6 = objc_retainBlock(v23);
  [v4 setObject:v6 forKeyedSubscript:@"_attachmentWasTapped"];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_5D94;
  v21[3] = &unk_184D0;
  objc_copyWeak(&v22, &location);
  id v7 = objc_retainBlock(v21);
  [v4 setObject:v7 forKeyedSubscript:@"_selectionContainsLinkStateDidChange"];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_5E14;
  v19[3] = &unk_184D0;
  objc_copyWeak(&v20, &location);
  id v8 = objc_retainBlock(v19);
  [v4 setObject:v8 forKeyedSubscript:@"_selectedLinkTextDidChange"];

  v30[0] = JSPropertyDescriptorEnumerableKey;
  v30[1] = JSPropertyDescriptorConfigurableKey;
  v31[0] = &__kCFBooleanTrue;
  v31[1] = &__kCFBooleanTrue;
  void v30[2] = JSPropertyDescriptorGetKey;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_5E8C;
  v18[3] = &unk_184F8;
  v18[4] = self;
  uint64_t v9 = objc_retainBlock(v18);
  void v31[2] = v9;
  v30[3] = JSPropertyDescriptorSetKey;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_5F1C;
  v17[3] = &unk_18520;
  v17[4] = self;
  v10 = objc_retainBlock(v17);
  v31[3] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];
  [v4 defineProperty:@"_dirty" descriptor:v11];

  uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"ACCESSIBILITY_BODY_LABEL" value:&stru_189B8 table:@"Localizable"];
  [v4 setObject:v13 forKeyedSubscript:@"_localizedAccessibilityLabel"];

  v14 = [(ComposeBodyFieldBundleController *)self plugIn];
  uint64_t v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v14 blockRemoteContent] ^ 1);
  v29 = v15;
  uint64_t v16 = +[NSArray arrayWithObjects:&v29 count:1];
  [(ComposeBodyFieldBundleController *)self performBodyFieldMethodOnPage:@"remoteContentEnabled" withArguments:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (MFComposeBodyFieldObserver)observerProxy
{
  observerProxy = self->_observerProxy;
  if (!observerProxy)
  {
    id v4 = [(ComposeBodyFieldBundleController *)self controller];
    id v5 = [v4 _remoteObjectRegistry];
    objc_super v6 = +[_WKRemoteObjectInterface remoteObjectInterfaceWithProtocol:&OBJC_PROTOCOL___MFComposeBodyFieldObserver];
    id v7 = [v5 remoteObjectProxyWithInterface:v6];
    id v8 = self->_observerProxy;
    self->_observerProxy = v7;

    observerProxy = self->_observerProxy;
  }

  return observerProxy;
}

- (void)_setDirty:(BOOL)a3
{
  BOOL dirty = self->_dirty;
  self->_BOOL dirty = a3;
  if (dirty != a3)
  {
    BOOL v4 = a3;
    id v5 = [(ComposeBodyFieldBundleController *)self observerProxy];
    [v5 composeBodyFieldIsDirtyChanged:v4];
  }
}

- (void)prependPreamble:(id)a3 quote:(BOOL)a4 layoutDirection:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6, v8);
  v12[1] = v9;
  v10 = +[NSNumber numberWithInt:a5 == 0];
  v12[2] = v10;
  v11 = +[NSArray arrayWithObjects:v12 count:3];
  [(ComposeBodyFieldBundleController *)self performBodyFieldMethodOnPage:@"prependPreamble" withArguments:v11];
}

- (void)_addMarkupString:(id)a3 quote:(BOOL)a4 emptyFirst:(BOOL)a5 prepended:(BOOL)a6 composeType:(int64_t)a7 attachmentInfoByURL:(id)a8 completionHandler:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v13 = a4;
  id v27 = a3;
  id v15 = a8;
  uint64_t v16 = (void (**)(id, void *))a9;
  v17 = +[ComposeBodyFieldBundleController log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [v15 allKeys];
    *(_DWORD *)buf = 138543362;
    v30 = v18;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "addMarkupString attachments %{public}@", buf, 0xCu);
  }
  uint64_t v19 = [(ComposeBodyFieldBundleController *)self jsBodyField];
  v28[0] = v27;
  id v20 = +[NSNumber numberWithBool:v13];
  v28[1] = v20;
  v21 = +[NSNumber numberWithBool:v12];
  v28[2] = v21;
  id v22 = +[NSNumber numberWithBool:v11];
  v28[3] = v22;
  uint64_t v23 = +[NSNumber numberWithBool:((unint64_t)a7 < 0xA) & (0x274u >> a7)];
  v28[4] = v23;
  v28[5] = v15;
  id v24 = +[NSArray arrayWithObjects:v28 count:6];
  v25 = [v19 invokeMethod:@"addMarkupString" withArguments:v24];

  if (v16)
  {
    id v26 = [v25 toObject];
    v16[2](v16, v26);
  }
}

- (void)addMarkupString:(id)a3 quote:(BOOL)a4 emptyFirst:(BOOL)a5 prepended:(BOOL)a6 composeType:(int64_t)a7 attachmentInfoByURL:(id)a8
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_65EC;
  v15[3] = &unk_18548;
  uint64_t v16 = self;
  id v17 = a3;
  BOOL v20 = a4;
  BOOL v21 = a5;
  BOOL v22 = a6;
  id v18 = a8;
  int64_t v19 = a7;
  id v13 = v18;
  id v14 = v17;
  [(ComposeBodyFieldBundleController *)v16 performOnPage:v15];
}

- (void)appendOrReplace:(id)a3 withMarkupString:(id)a4 quote:(BOOL)a5 composeType:(int64_t)a6 attachmentInfoByURL:(id)a7 completionHandler:(id)a8
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_6784;
  v17[3] = &unk_18570;
  id v18 = self;
  id v19 = a3;
  BOOL v24 = a5;
  id v20 = a4;
  id v21 = a7;
  id v22 = a8;
  int64_t v23 = a6;
  id v13 = v22;
  id v14 = v21;
  id v15 = v20;
  id v16 = v19;
  [(ComposeBodyFieldBundleController *)v18 performOnPage:v17];
}

- (void)addMailAttributesBeforeDisplayHidingTrailingEmptyQuotes:(BOOL)a3 shouldQuote:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = +[NSNumber numberWithBool:a3];
  v9[0] = v6;
  id v7 = +[NSNumber numberWithBool:v4];
  v9[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v9 count:2];
  [(ComposeBodyFieldBundleController *)self performBodyFieldMethodOnPage:@"addMailAttributesBeforeDisplay" withArguments:v8];
}

- (void)setReplacementFilenamesByContentID:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_6A00;
  v4[3] = &unk_18598;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ComposeBodyFieldBundleController *)v5 performOnPage:v4];
}

- (void)replaceImagesIfNecessary
{
}

- (void)containsRichText:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_6B2C;
  v4[3] = &unk_185C0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ComposeBodyFieldBundleController *)v5 performOnPage:v4];
}

- (void)plainTextContentUsingAttachmentInfoByIdentifier:(id)a3 completionHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6CB4;
  v8[3] = &unk_185E8;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(ComposeBodyFieldBundleController *)self performOnPage:v8];
}

- (void)htmlStringUsingAttachmentInfoByIdentifier:(id)a3 completionHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6EC0;
  v8[3] = &unk_185E8;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(ComposeBodyFieldBundleController *)self performOnPage:v8];
}

- (void)htmlStringsAttachmentURLsAndPlainTextAlternativeRemovingSignature:(BOOL)a3 attachmentInfoByIdentifier:(id)a4 completion:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_70D0;
  v8[3] = &unk_18610;
  BOOL v12 = a3;
  id v9 = self;
  id v10 = a4;
  id v11 = a5;
  id v6 = v11;
  id v7 = v10;
  [(ComposeBodyFieldBundleController *)v9 performOnPage:v8];
}

- (void)placeCaretAtStartOfBody
{
}

- (void)setCaretPosition:(unint64_t)a3
{
  BOOL v4 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = v4;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [(ComposeBodyFieldBundleController *)self performBodyFieldMethodOnPage:@"setCaretPosition" withArguments:v5];
}

- (void)getCaretPosition:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_76D8;
  v4[3] = &unk_185C0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ComposeBodyFieldBundleController *)v5 performOnPage:v4];
}

- (void)insertAttachmentAsImage:(BOOL)a3 isSinglePagePDF:(BOOL)a4 contentType:(id)a5 completionHandler:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_7898;
  void v12[3] = &unk_18638;
  id v13 = a5;
  id v14 = a6;
  BOOL v15 = a3;
  BOOL v16 = a4;
  v12[4] = self;
  id v10 = v13;
  id v11 = v14;
  [(ComposeBodyFieldBundleController *)self performOnPage:v12];
}

- (void)countDuplicatedAttachments:(id)a3 completionHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_7AFC;
  v8[3] = &unk_185E8;
  id v9 = a3;
  id v10 = a4;
  void v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(ComposeBodyFieldBundleController *)self performOnPage:v8];
}

- (void)replaceFilenamePlaceholderWithImage:(id)a3 completionHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_7D08;
  v8[3] = &unk_185E8;
  id v9 = a3;
  id v10 = a4;
  void v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(ComposeBodyFieldBundleController *)self performOnPage:v8];
}

- (void)replaceFilenamePlaceholderWithAttachment:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9[0] = v6;
  v9[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v9 count:2];
  [(ComposeBodyFieldBundleController *)self performBodyFieldMethodOnPage:@"replaceFilenamePlaceholderWithAttachment" withArguments:v8];
}

- (void)replaceRichLinkPlaceholderImage:(id)a3 completionHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_7FEC;
  v8[3] = &unk_185E8;
  id v9 = a3;
  id v10 = a4;
  void v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(ComposeBodyFieldBundleController *)self performOnPage:v8];
}

- (void)removeMediaAttachment:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_81F4;
  v7[3] = &unk_18660;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ComposeBodyFieldBundleController *)v8 performOnPage:v7];
}

- (void)displayAttachmentWithIdentifierAsSinglePagePDF:(id)a3 completionHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_83C4;
  v8[3] = &unk_185E8;
  id v9 = a3;
  id v10 = a4;
  void v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(ComposeBodyFieldBundleController *)self performOnPage:v8];
}

- (void)forceNextSelectionFromSecondToFirstLine
{
  self->_shouldForceSelectionFromSecondToFirstLine = 1;
}

- (void)setDirty:(BOOL)a3 completionHandler:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_85B0;
  v5[3] = &unk_18688;
  BOOL v8 = a3;
  id v6 = self;
  id v7 = a4;
  id v4 = v7;
  [(ComposeBodyFieldBundleController *)v6 performOnPage:v5];
}

- (void)addLink:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [(ComposeBodyFieldBundleController *)self performBodyFieldMethodOnPage:@"updateLink" withArguments:v5];
}

- (void)updateLinkFromExistingLink:(id)a3 isEditing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v9[0] = v6;
  id v7 = +[NSNumber numberWithBool:v4];
  v9[1] = v7;
  BOOL v8 = +[NSArray arrayWithObjects:v9 count:2];
  [(ComposeBodyFieldBundleController *)self performBodyFieldMethodOnPage:@"updateLink" withArguments:v8];
}

- (void)setEditLinkFlag
{
}

- (void)removeLink
{
}

- (void)addTextDescriptionToLink:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [(ComposeBodyFieldBundleController *)self performBodyFieldMethodOnPage:@"addTextDescriptionToLink" withArguments:v5];
}

- (void)_performSignatureControllerMethodOnPage:(id)a3 withArguments:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_895C;
  v7[3] = &unk_186B0;
  BOOL v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ComposeBodyFieldBundleController *)v8 performOnPage:v7];
}

- (void)addSignature:(id)a3 prepend:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v9[0] = v6;
  id v7 = +[NSNumber numberWithBool:v4];
  v9[1] = v7;
  BOOL v8 = +[NSArray arrayWithObjects:v9 count:2];
  [(ComposeBodyFieldBundleController *)self _performSignatureControllerMethodOnPage:@"addSignature" withArguments:v8];
}

- (void)updateSignature:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [(ComposeBodyFieldBundleController *)self _performSignatureControllerMethodOnPage:@"updateSignature" withArguments:v5];
}

- (void)finalizeSignature:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(ComposeBodyFieldBundleController *)self _performSignatureControllerMethodOnPage:@"finalizeSignature" withArguments:&__NSArray0__struct];
  v4[2]();
}

- (void)removeSignature
{
}

- (BOOL)_webProcessPlugInBrowserContextController:(id)a3 shouldChangeSelectedRange:(id)a4 toRange:(id)a5 affinity:(int64_t)a6 stillSelecting:(BOOL)a7
{
  id v8 = a5;
  id v9 = [v8 _copyBundleRangeHandleRef];
  id v10 = [v9 frame];
  id v11 = +[WKWebProcessPlugInScriptWorld normalWorld];
  BOOL v12 = [v10 jsRangeForRangeHandle:v9 inWorld:v11];

  if (v12)
  {
    id v13 = [(ComposeBodyFieldBundleController *)self jsBodyField];
    v19[0] = v12;
    id v14 = +[NSNumber numberWithBool:self->_shouldForceSelectionFromSecondToFirstLine];
    v19[1] = v14;
    BOOL v15 = +[NSArray arrayWithObjects:v19 count:2];
    BOOL v16 = [v13 invokeMethod:@"shouldChangeSelectedRange" withArguments:v15];

    self->_shouldForceSelectionFromSecondToFirstLine = 0;
    unsigned __int8 v17 = [v16 toBool];
  }
  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (void)_webProcessPlugInBrowserContextControllerDidChangeByEditing:(id)a3
{
  [(ComposeBodyFieldBundleController *)self _setDirty:1];
  id v4 = [(ComposeBodyFieldBundleController *)self observerProxy];
  [v4 composeBodyFieldDidChange];
}

- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7
{
  id v8 = a6;
  id v9 = [v8 URL];
  id v10 = [v9 scheme];
  id v11 = [v10 lowercaseString];

  v26[0] = MSContentIDURLScheme;
  v26[1] = MSBlobURLScheme;
  v26[2] = MSDataURLScheme;
  v26[3] = MSFileURLScheme;
  BOOL v12 = +[NSArray arrayWithObjects:v26 count:4];
  unsigned int v13 = [v12 containsObject:v11];

  if (v13)
  {
    id v14 = v8;
    goto LABEL_13;
  }
  BOOL v15 = [(ComposeBodyFieldBundleController *)self plugIn];
  if ([v15 blockRemoteContent])
  {

    BOOL v16 = +[ComposeBodyFieldBundleController log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      unsigned __int8 v17 = [0 URL];
      id v18 = [v17 absoluteString];
      sub_A320(v18, v25, v16, v17);
    }
    id v19 = 0;
  }
  else
  {
    if (!objc_msgSend(v9, "ef_isHTTPOrHTTPSURL")
      || ([v15 remoteContentProxySchemePrefix],
          id v20 = objc_claimAutoreleasedReturnValue(),
          BOOL v21 = v20 == 0,
          v20,
          v21))
    {
      id v19 = v8;
      goto LABEL_12;
    }
    BOOL v16 = [v15 remoteContentProxySchemePrefix];
    id v19 = [v8 mutableCopy];
    id v22 = [v16 stringByAppendingString:v11];
    int64_t v23 = objc_msgSend(v9, "ef_urlByReplacingSchemeWithScheme:", v22);
    [v19 setURL:v23];
  }
LABEL_12:
  id v14 = v19;

LABEL_13:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAttachmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_observerProxy, 0);
  objc_storeStrong((id *)&self->_jsSignatureController, 0);
  objc_storeStrong((id *)&self->_signatureControllerInterface, 0);

  objc_storeStrong((id *)&self->_bodyFieldInterface, 0);
}

@end