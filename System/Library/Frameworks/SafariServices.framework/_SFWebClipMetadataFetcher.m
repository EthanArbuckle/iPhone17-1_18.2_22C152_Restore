@interface _SFWebClipMetadataFetcher
+ (id)_webClipLinkTagWithDictionary:(id)a3;
+ (id)metadataFetcherScriptSource;
+ (void)parseRawMetadataDictionary:(id)a3 consumer:(id)a4;
- (_SFWebClipMetadataFetcher)initWithInjectedJavascriptController:(id)a3;
- (void)_startFetchingMetadata;
- (void)fetchMetadataWithConsumer:(id)a3;
@end

@implementation _SFWebClipMetadataFetcher

+ (id)metadataFetcherScriptSource
{
  id v2 = [NSString alloc];
  v3 = objc_msgSend(v2, "initWithBytesNoCopy:length:encoding:freeWhenDone:", "//# sourceURL=__InjectedScript_WebClipMetadataFetcher.js\n/* Copyright (c) 2024 Apple Inc. All rights reserved. */\n/*\n * Copyright (c) 2014 Apple Inc. All rights reserved.\n */\nconst MetaTagNamesToScrape=[\"apple-mobile-web-app-capable\",\"apple-mobile-web-app-title\",\"viewport\",\"apple-mobile-web-app-status-bar-style\"],LinkRelTypesToScrape=[\"apple-touch-icon\",\"apple-touch-icon-precomposed\",\"apple-touch-startup-image\",\"icon\",\"shortcut icon\"];var Orientation={Portrait:0,"
                 "Landscape:1},WebClipMetadataFinder=function(){};WebClipMetadataFinder.prototype={webClipMetadata:functi"
                 "on(){return{metaTags:this.metaTagsMetadata(),linkTags:this.linkTagsMetadata(),canonicalURLString:this.c"
                 "anonicalURLStringForPage()}},metaTagsMetadata:function(){function e(e){if (\"apple-mobile-web-app-status"
                 "-bar-style\"===e.name)e.content.toLowerCase()}for (var t={},a=document.head.getElementsByTagName(\"meta\""
                 "),i=a.length,n=0;n<i;++n){var r=a[n],o=r.name;-1!==MetaTagNamesToScrape.indexOf(o)&&(e(r),t[o]=r.conten"
                 "t)}return t},currentOrientation:function(){return void 0===this._currentOrientation&&(window.matchMedia"
                 "(\"(orientation: portrait)\").matches?this._currentOrientation=Orientation.Portrait:this._currentOrient"
                 "ation=Orientation.Landscape),this._currentOrientation},canonicalURLStringForPage:function(){var e=docum"
                 "ent.head.querySelector(\"link[rel='canonical']\");return e?e.href:\"\"},linkTagsMetadata:function(){for"
                 "(var e=[],t=document.head.getElementsByTagName(\"link\"),a=t.length,i=0;i<a;++i){var n=t[i],r=n.rel;if ("
                 "-1!==LinkRelTypesToScrape.indexOf(r)){var o=n.href,c=n.getAttribute(\"sizes\");if (o){var s=n.media,p=!0"
                 ",d=!0;if (s){var u=window.matchMedia(s);p=this.mediaQueryListMatchesOrientation(u,Orientation.Portrait),"
                 "d=this.mediaQueryListMatchesOrientation(u,Orientation.Landscape)}var l={rel:r,href:o,mediaMatchesPortra"
                 "itOrientation:p,mediaMatchesLandscapeOrientation:d};c&&(l.sizes=c),e.push(l)}}}return e},mediaQueryList"
                 "MatchesOrientation:function(e,t){var a=e.media;if (\"invalid\"===a)return!1;if (t===this.currentOrientati"
                 "on())return e.matches;var i=this.reverseMediaQueryOrientation(a);return window.matchMedia(i).matches},r"
                 "everseMediaQueryOrientation:function(e){return e.replace(/orientation: (portrait|landscape)/,(function("
                 "e,t){return\"orientation: \"+(\"portrait\"===t?\"landscape\":\"portrait\")}))}};var WebClipMetadataFind"
                 "erJS=new WebClipMetadataFinder;",
                 webClipMetadataFetcherSourceLength,
                 4,
                 0);

  return v3;
}

- (_SFWebClipMetadataFetcher)initWithInjectedJavascriptController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFWebClipMetadataFetcher;
  v5 = [(_SFWebClipMetadataFetcher *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_jsController, v4);
    uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    metadataConsumers = v6->_metadataConsumers;
    v6->_metadataConsumers = (NSMutableArray *)v7;

    [(_SFWebClipMetadataFetcher *)v6 _startFetchingMetadata];
    v9 = v6;
  }

  return v6;
}

- (void)_startFetchingMetadata
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_jsController);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51___SFWebClipMetadataFetcher__startFetchingMetadata__block_invoke;
  v4[3] = &unk_1E5C77798;
  v4[4] = self;
  [WeakRetained runJavaScriptForActivity:@"WebClipMetadataJS" withScript:0 object:@"WebClipMetadataFinderJS" invokeMethod:@"webClipMetadata" completionHandler:v4];
}

+ (id)_webClipLinkTagWithDictionary:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4FB1F20];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = objc_msgSend(v4, "safari_stringForKey:", @"href");
  [v5 setHref:v6];

  uint64_t v7 = objc_msgSend(v4, "safari_stringForKey:", @"rel");
  [v5 setRel:v7];

  v8 = objc_msgSend(v4, "safari_stringForKey:", @"sizes");
  [v5 setSizes:v8];

  objc_msgSend(v5, "setMediaMatchesPortraitOrientation:", objc_msgSend(v4, "safari_BOOLForKey:", @"mediaMatchesPortraitOrientation"));
  uint64_t v9 = objc_msgSend(v4, "safari_BOOLForKey:", @"mediaMatchesLandscapeOrientation");

  [v5 setMediaMatchesLandscapeOrientation:v9];

  return v5;
}

+ (void)parseRawMetadataDictionary:(id)a3 consumer:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void *, void *))a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v8 = objc_msgSend(v5, "safari_arrayForKey:", @"linkTags", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [(id)objc_opt_class() _webClipLinkTagWithDictionary:*(void *)(*((void *)&v16 + 1) + 8 * v12)];
          [v7 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    v14 = objc_msgSend(v5, "safari_dictionaryForKey:", @"metaTags");
    v15 = (void *)[v7 copy];
    v6[2](v6, v14, v15);
  }
  else
  {
    v6[2](v6, (void *)MEMORY[0x1E4F1CC08], (void *)MEMORY[0x1E4F1CBF0]);
  }
}

- (void)fetchMetadataWithConsumer:(id)a3
{
  if (self->_fetchingCompleted)
  {
    metaTags = self->_metaTags;
    linkTags = self->_linkTags;
    v6 = (void (*)(id, NSDictionary *, NSArray *))*((void *)a3 + 2);
    v6(a3, metaTags, linkTags);
  }
  else
  {
    metadataConsumers = self->_metadataConsumers;
    id v8 = (id)MEMORY[0x1AD0C36A0](a3, a2);
    [(NSMutableArray *)metadataConsumers addObject:v8];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_jsController);
  objc_storeStrong((id *)&self->_metadataConsumers, 0);
  objc_storeStrong((id *)&self->_linkTags, 0);

  objc_storeStrong((id *)&self->_metaTags, 0);
}

@end