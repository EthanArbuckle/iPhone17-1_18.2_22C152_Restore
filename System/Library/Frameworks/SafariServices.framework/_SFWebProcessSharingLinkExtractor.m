@interface _SFWebProcessSharingLinkExtractor
- (_SFWebProcessSharingLinkExtractor)initWithPageController:(id)a3;
- (id)_extractCanonicalLinkWithInjectedObject:(id)a3;
- (id)_extractDominantIFrameWithInjectedObject:(id)a3;
- (id)_extractSharingLink;
- (id)_injectedLinkExtractorSourceString;
- (void)_setUpRemoteInterface;
- (void)_withInjectedLinkExtractorObjectInFrame:(id)a3 callback:(id)a4;
- (void)fetchSharingLinkWithCompletionHandler:(id)a3;
@end

@implementation _SFWebProcessSharingLinkExtractor

- (_SFWebProcessSharingLinkExtractor)initWithPageController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFWebProcessSharingLinkExtractor;
  v5 = [(_SFWebProcessSharingLinkExtractor *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_pageController, v4);
    [(_SFWebProcessSharingLinkExtractor *)v6 _setUpRemoteInterface];
    v7 = v6;
  }

  return v6;
}

- (void)_setUpRemoteInterface
{
  v3 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFC77F40];
  sharingLinkExtractorInterface = self->_sharingLinkExtractorInterface;
  self->_sharingLinkExtractorInterface = v3;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  v6 = [WeakRetained browserContextController];
  id v7 = [v6 _remoteObjectRegistry];

  [v7 registerExportedObject:self interface:self->_sharingLinkExtractorInterface];
}

- (id)_injectedLinkExtractorSourceString
{
  v2 = (void *)_injectedLinkExtractorSourceString_sourceString;
  if (!_injectedLinkExtractorSourceString_sourceString)
  {
    id v3 = [NSString alloc];
    uint64_t v4 = objc_msgSend(v3, "initWithBytesNoCopy:length:encoding:freeWhenDone:", "//# sourceURL=__InjectedScript_SharingLinkExtractor.js\n/* Copyright (c) 2024 Apple Inc. All rights reserved. */\n/*\n * Copyright (c) 2017 Apple Inc. All rights reserved.\n */\nvar SharingLinkExtractor=function(){};SharingLinkExtractor.prototype={extractCanonicalLink:function(){var n=d"
           "ocument.head.querySelector(\"link[rel='canonical']\");if (!n)return null;var t=n.getAttribute(\"href\");if (!t)"
           "return null;var r=document.baseURI,e=new URL(t,r);return\"/\"!==document.location.pathname&&\"/\"===e.pathnam"
           "e||\"localhost\"===e.hostname&&\"localhost\"!==document.location.hostname?null:e.href},hitTestingPoints:funct"
           "ion(){const n=60,t=window.innerWidth-n,r=window.innerHeight-n;return[[n,n],[n,r],[t,n],[t,r]]},viewportDomina"
           "ntIFrameElement:function(){for (var n,t=this.hitTestingPoints(),r=t.length,e=0;e<r;e++){var i=t[e],o=document."
           "elementFromPoint(i[0],i[1]);if (!o)return null;if (\"IFRAME\"!==o.tagName)return null;if (n){if (n!==o)return nul"
           "l}else n=o}return n}};var SharingLinkExtractorJS=new SharingLinkExtractor;",
           sharingLinkExtractorSourceLength,
           4,
           0);
    v5 = (void *)_injectedLinkExtractorSourceString_sourceString;
    _injectedLinkExtractorSourceString_sourceString = v4;

    v2 = (void *)_injectedLinkExtractorSourceString_sourceString;
  }

  return v2;
}

- (void)_withInjectedLinkExtractorObjectInFrame:(id)a3 callback:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F466E8];
  id v7 = (void (**)(id, void *))a4;
  id v8 = a3;
  id v14 = [v6 world];
  objc_super v9 = [v8 jsContextForWorld:v14];

  v10 = [(_SFWebProcessSharingLinkExtractor *)self _injectedLinkExtractorSourceString];
  id v11 = (id)[v9 evaluateScript:v10];

  v12 = [v9 globalObject];
  v13 = [v12 valueForProperty:@"SharingLinkExtractorJS"];

  v7[2](v7, v13);
  [v14 clearWrappers];
}

- (void)fetchSharingLinkWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v5 = [(_SFWebProcessSharingLinkExtractor *)self _extractSharingLink];
  v4[2](v4, v5);
}

- (id)_extractSharingLink
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  uint64_t v4 = [WeakRetained browserContextController];
  id v5 = [v4 mainFrame];

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__15;
  v28 = __Block_byref_object_dispose__15;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__15;
  v22 = __Block_byref_object_dispose__15;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56___SFWebProcessSharingLinkExtractor__extractSharingLink__block_invoke;
  v17[3] = &unk_1E5C786E8;
  v17[4] = self;
  v17[5] = &v24;
  v17[6] = &v18;
  [(_SFWebProcessSharingLinkExtractor *)self _withInjectedLinkExtractorObjectInFrame:v5 callback:v17];
  v6 = (void *)v25[5];
  if (v6 || (uint64_t v8 = v19[5]) == 0)
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__15;
    v15 = __Block_byref_object_dispose__15;
    id v16 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56___SFWebProcessSharingLinkExtractor__extractSharingLink__block_invoke_2;
    v10[3] = &unk_1E5C78710;
    v10[4] = self;
    v10[5] = &v11;
    [(_SFWebProcessSharingLinkExtractor *)self _withInjectedLinkExtractorObjectInFrame:v8 callback:v10];
    id v7 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v7;
}

- (id)_extractCanonicalLinkWithInjectedObject:(id)a3
{
  id v3 = [a3 invokeMethod:@"extractCanonicalLink" withArguments:0];
  uint64_t v4 = [v3 toObjectOfClass:objc_opt_class()];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_extractDominantIFrameWithInjectedObject:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 invokeMethod:@"viewportDominantIFrameElement" withArguments:0];
  id v5 = 0;
  if ([v4 isObject])
  {
    v6 = (void *)MEMORY[0x1E4F466E0];
    id v7 = [v3 context];
    uint64_t v8 = [v6 nodeHandleWithJSValue:v4 inContext:v7];

    id v5 = [v8 htmlIFrameElementContentFrame];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingLinkExtractorInterface, 0);

  objc_destroyWeak((id *)&self->_pageController);
}

@end