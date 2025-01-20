@interface IKAppMediaItemBridge
- (BOOL)isExplicit;
- (IKAppContext)appContext;
- (IKAppMediaItem)appMediaItem;
- (IKAppMediaItemBridge)initWithAppContext:(id)a3 jsMediaItem:(id)a4;
- (IKJSMediaItem)jsMediaItem;
- (NSArray)chapterGroups;
- (NSArray)interstitials;
- (NSDictionary)extraMetadata;
- (NSNumber)contentRatingRanking;
- (NSNumber)resumeTime;
- (NSString)artworkImageSrcset;
- (NSString)artworkImageURL;
- (NSString)contentRatingDomain;
- (NSString)description;
- (NSString)externalID;
- (NSString)ratingBadge;
- (NSString)subtitle;
- (NSString)title;
- (NSString)type;
- (NSString)url;
- (double)contentProposalAutomaticAcceptanceInterval;
- (double)contentProposalPresentationTime;
- (void)_evaluateDelegateBlockSync:(id)a3;
- (void)_resolveArtworkImageURL;
- (void)cleanup;
- (void)loadCertificateDataForURL:(id)a3 withCallback:(id)a4;
- (void)loadContentIdentifierDataForURL:(id)a3 withCallback:(id)a4;
- (void)loadKeyDataForURL:(id)a3 keyRequestData:(id)a4 withCallback:(id)a5;
- (void)prepareForLoadingWithCallback:(id)a3;
- (void)setArtworkImageSrcset:(id)a3;
- (void)setArtworkImageURL:(id)a3;
- (void)setChapterGroups:(id)a3;
- (void)setContentProposalAutomaticAcceptanceInterval:(double)a3;
- (void)setContentProposalPresentationTime:(double)a3;
- (void)setContentRatingDomain:(id)a3;
- (void)setContentRatingRanking:(id)a3;
- (void)setDescription:(id)a3;
- (void)setExternalID:(id)a3;
- (void)setExtraMetadata:(id)a3;
- (void)setInterstitials:(id)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setRatingBadge:(id)a3;
- (void)setResumeTime:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation IKAppMediaItemBridge

- (IKAppMediaItemBridge)initWithAppContext:(id)a3 jsMediaItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)IKAppMediaItemBridge;
  v8 = [(IKAppMediaItemBridge *)&v23 init];
  if (v8)
  {
    if (initWithAppContext_jsMediaItem__onceToken != -1) {
      dispatch_once(&initWithAppContext_jsMediaItem__onceToken, &__block_literal_global_25);
    }
    objc_storeWeak((id *)&v8->_appContext, v6);
    objc_storeWeak((id *)&v8->_jsMediaItem, v7);
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__24;
    v21 = __Block_byref_object_dispose__24;
    id v22 = 0;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __55__IKAppMediaItemBridge_initWithAppContext_jsMediaItem___block_invoke_89;
    v14 = &unk_1E6DE3860;
    v16 = &v17;
    v9 = v8;
    v15 = v9;
    [v6 evaluateDelegateBlockSync:&v11];
    objc_msgSend((id)_globalMediaItems, "addObject:", v18[5], v11, v12, v13, v14);
    objc_storeWeak(v9 + 3, (id)v18[5]);

    _Block_object_dispose(&v17, 8);
  }

  return v8;
}

uint64_t __55__IKAppMediaItemBridge_initWithAppContext_jsMediaItem___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
  uint64_t v1 = _globalMediaItems;
  _globalMediaItems = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __55__IKAppMediaItemBridge_initWithAppContext_jsMediaItem___block_invoke_89(uint64_t a1, void *a2)
{
  id v6 = [a2 delegate];
  uint64_t v3 = [v6 objectForMediaItem:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)cleanup
{
  p_appMediaItem = &self->_appMediaItem;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appMediaItem);
  uint64_t v4 = (void *)_globalMediaItems;
  id v5 = objc_loadWeakRetained((id *)p_appMediaItem);
  [v4 removeObject:v5];

  objc_storeWeak((id *)p_appMediaItem, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__IKAppMediaItemBridge_cleanup__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __31__IKAppMediaItemBridge_cleanup__block_invoke(uint64_t a1)
{
}

- (void)setUrl:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__IKAppMediaItemBridge_setUrl___block_invoke;
  v6[3] = &unk_1E6DE62C8;
  id v7 = v4;
  id v5 = v4;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v6];
}

void __31__IKAppMediaItemBridge_setUrl___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 appMediaItem];
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(a1 + 32)];
  [v5 setUrl:v4];
}

- (NSString)url
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__IKAppMediaItemBridge_url__block_invoke;
  v4[3] = &unk_1E6DE62F0;
  v4[4] = &v5;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __27__IKAppMediaItemBridge_url__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = [a3 appMediaItem];
  id v4 = [v8 url];
  uint64_t v5 = [v4 absoluteString];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)setType:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__IKAppMediaItemBridge_setType___block_invoke;
  v6[3] = &unk_1E6DE62C8;
  id v7 = v4;
  id v5 = v4;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v6];
}

void __32__IKAppMediaItemBridge_setType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appMediaItem];
  [v4 setType:*(void *)(a1 + 32)];
}

- (NSString)type
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__IKAppMediaItemBridge_type__block_invoke;
  v4[3] = &unk_1E6DE62F0;
  v4[4] = &v5;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __28__IKAppMediaItemBridge_type__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appMediaItem];
  uint64_t v4 = [v7 type];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setInterstitials:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__IKAppMediaItemBridge_setInterstitials___block_invoke;
  v6[3] = &unk_1E6DE62C8;
  id v7 = v4;
  id v5 = v4;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v6];
}

void __41__IKAppMediaItemBridge_setInterstitials___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appMediaItem];
  [v4 setObject:*(void *)(a1 + 32) forKey:@"interstitials"];
}

- (NSArray)interstitials
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__IKAppMediaItemBridge_interstitials__block_invoke;
  v4[3] = &unk_1E6DE62F0;
  v4[4] = &v5;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __37__IKAppMediaItemBridge_interstitials__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appMediaItem];
  uint64_t v4 = [v7 objectForKey:@"interstitials"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setChapterGroups:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__IKAppMediaItemBridge_setChapterGroups___block_invoke;
  v6[3] = &unk_1E6DE62C8;
  id v7 = v4;
  id v5 = v4;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v6];
}

void __41__IKAppMediaItemBridge_setChapterGroups___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appMediaItem];
  [v4 setObject:*(void *)(a1 + 32) forKey:@"chapterGroups"];
}

- (NSArray)chapterGroups
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__IKAppMediaItemBridge_chapterGroups__block_invoke;
  v4[3] = &unk_1E6DE62F0;
  v4[4] = &v5;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __37__IKAppMediaItemBridge_chapterGroups__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appMediaItem];
  uint64_t v4 = [v7 objectForKey:@"chapterGroups"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setExternalID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__IKAppMediaItemBridge_setExternalID___block_invoke;
  v6[3] = &unk_1E6DE62C8;
  id v7 = v4;
  id v5 = v4;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v6];
}

void __38__IKAppMediaItemBridge_setExternalID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appMediaItem];
  [v4 setObject:*(void *)(a1 + 32) forKey:@"externalID"];
}

- (NSString)externalID
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__IKAppMediaItemBridge_externalID__block_invoke;
  v4[3] = &unk_1E6DE62F0;
  v4[4] = &v5;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __34__IKAppMediaItemBridge_externalID__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appMediaItem];
  uint64_t v4 = [v7 objectForKey:@"externalID"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__IKAppMediaItemBridge_setTitle___block_invoke;
  v6[3] = &unk_1E6DE62C8;
  id v7 = v4;
  id v5 = v4;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v6];
}

void __33__IKAppMediaItemBridge_setTitle___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appMediaItem];
  [v4 setObject:*(void *)(a1 + 32) forKey:@"title"];
}

- (NSString)title
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__IKAppMediaItemBridge_title__block_invoke;
  v4[3] = &unk_1E6DE62F0;
  v4[4] = &v5;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __29__IKAppMediaItemBridge_title__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appMediaItem];
  uint64_t v4 = [v7 objectForKey:@"title"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__IKAppMediaItemBridge_setSubtitle___block_invoke;
  v6[3] = &unk_1E6DE62C8;
  id v7 = v4;
  id v5 = v4;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v6];
}

void __36__IKAppMediaItemBridge_setSubtitle___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appMediaItem];
  [v4 setObject:*(void *)(a1 + 32) forKey:@"subtite"];
}

- (NSString)subtitle
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__IKAppMediaItemBridge_subtitle__block_invoke;
  v4[3] = &unk_1E6DE62F0;
  v4[4] = &v5;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __32__IKAppMediaItemBridge_subtitle__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appMediaItem];
  uint64_t v4 = [v7 objectForKey:@"subtite"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setDescription:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__IKAppMediaItemBridge_setDescription___block_invoke;
  v6[3] = &unk_1E6DE62C8;
  id v7 = v4;
  id v5 = v4;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v6];
}

void __39__IKAppMediaItemBridge_setDescription___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appMediaItem];
  [v4 setObject:*(void *)(a1 + 32) forKey:@"description"];
}

- (NSString)description
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__IKAppMediaItemBridge_description__block_invoke;
  v4[3] = &unk_1E6DE62F0;
  v4[4] = &v5;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __35__IKAppMediaItemBridge_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appMediaItem];
  uint64_t v4 = [v7 objectForKey:@"description"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setContentRatingRanking:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__IKAppMediaItemBridge_setContentRatingRanking___block_invoke;
  v6[3] = &unk_1E6DE62C8;
  id v7 = v4;
  id v5 = v4;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v6];
}

void __48__IKAppMediaItemBridge_setContentRatingRanking___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appMediaItem];
  [v4 setObject:*(void *)(a1 + 32) forKey:@"contentRatingRanking"];
}

- (NSNumber)contentRatingRanking
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__IKAppMediaItemBridge_contentRatingRanking__block_invoke;
  v4[3] = &unk_1E6DE62F0;
  v4[4] = &v5;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __44__IKAppMediaItemBridge_contentRatingRanking__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appMediaItem];
  uint64_t v4 = [v7 objectForKey:@"contentRatingRanking"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setContentRatingDomain:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__IKAppMediaItemBridge_setContentRatingDomain___block_invoke;
  v6[3] = &unk_1E6DE62C8;
  id v7 = v4;
  id v5 = v4;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v6];
}

void __47__IKAppMediaItemBridge_setContentRatingDomain___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appMediaItem];
  [v4 setObject:*(void *)(a1 + 32) forKey:@"contentRatingDomain"];
}

- (NSString)contentRatingDomain
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__IKAppMediaItemBridge_contentRatingDomain__block_invoke;
  v4[3] = &unk_1E6DE62F0;
  v4[4] = &v5;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __43__IKAppMediaItemBridge_contentRatingDomain__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appMediaItem];
  uint64_t v4 = [v7 objectForKey:@"contentRatingDomain"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setArtworkImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImageURL, a3);
  [(IKAppMediaItemBridge *)self _resolveArtworkImageURL];
}

- (NSString)artworkImageURL
{
  return self->_artworkImageURL;
}

- (void)setArtworkImageSrcset:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImageSrcset, a3);
  [(IKAppMediaItemBridge *)self _resolveArtworkImageURL];
}

- (NSString)artworkImageSrcset
{
  return self->_artworkImageSrcset;
}

- (void)setRatingBadge:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__IKAppMediaItemBridge_setRatingBadge___block_invoke;
  v6[3] = &unk_1E6DE62C8;
  id v7 = v4;
  id v5 = v4;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v6];
}

void __39__IKAppMediaItemBridge_setRatingBadge___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appMediaItem];
  [v4 setObject:*(void *)(a1 + 32) forKey:@"ratingBadge"];
}

- (NSString)ratingBadge
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__IKAppMediaItemBridge_ratingBadge__block_invoke;
  v4[3] = &unk_1E6DE62F0;
  v4[4] = &v5;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __35__IKAppMediaItemBridge_ratingBadge__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appMediaItem];
  uint64_t v4 = [v7 objectForKey:@"ratingBadge"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setIsExplicit:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__IKAppMediaItemBridge_setIsExplicit___block_invoke;
  v6[3] = &unk_1E6DE62C8;
  id v7 = v4;
  id v5 = v4;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v6];
}

void __38__IKAppMediaItemBridge_setIsExplicit___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appMediaItem];
  [v4 setObject:*(void *)(a1 + 32) forKey:@"isExplicit"];
}

- (BOOL)isExplicit
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__IKAppMediaItemBridge_isExplicit__block_invoke;
  v4[3] = &unk_1E6DE62F0;
  v4[4] = &v5;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v4];
  char v2 = [(id)v6[5] BOOLValue];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__IKAppMediaItemBridge_isExplicit__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appMediaItem];
  uint64_t v4 = [v7 objectForKey:@"isExplicit"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setResumeTime:(id)a3
{
  id v4 = &unk_1F3E3DD10;
  if (a3) {
    id v4 = a3;
  }
  id v5 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__IKAppMediaItemBridge_setResumeTime___block_invoke;
  v7[3] = &unk_1E6DE62C8;
  id v8 = v5;
  id v6 = v5;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v7];
}

void __38__IKAppMediaItemBridge_setResumeTime___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appMediaItem];
  [v4 setObject:*(void *)(a1 + 32) forKey:@"resumeTime"];
}

- (NSNumber)resumeTime
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__IKAppMediaItemBridge_resumeTime__block_invoke;
  v4[3] = &unk_1E6DE62F0;
  v4[4] = &v5;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __34__IKAppMediaItemBridge_resumeTime__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appMediaItem];
  uint64_t v4 = [v7 objectForKey:@"resumeTime"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setExtraMetadata:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__IKAppMediaItemBridge_setExtraMetadata___block_invoke;
  v6[3] = &unk_1E6DE62C8;
  id v7 = v4;
  id v5 = v4;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v6];
}

void __41__IKAppMediaItemBridge_setExtraMetadata___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 appMediaItem];
  [v4 setObject:*(void *)(a1 + 32) forKey:@"extraMetadata"];
}

- (NSDictionary)extraMetadata
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__IKAppMediaItemBridge_extraMetadata__block_invoke;
  v4[3] = &unk_1E6DE62F0;
  v4[4] = &v5;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

void __37__IKAppMediaItemBridge_extraMetadata__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appMediaItem];
  uint64_t v4 = [v7 objectForKey:@"extraMetadata"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (double)contentProposalPresentationTime
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  id v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__IKAppMediaItemBridge_contentProposalPresentationTime__block_invoke;
  v5[3] = &unk_1E6DE62F0;
  v5[4] = &v6;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v5];
  [(id)v7[5] doubleValue];
  double v3 = v2;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __55__IKAppMediaItemBridge_contentProposalPresentationTime__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appMediaItem];
  uint64_t v4 = [v7 objectForKey:@"contentProposalPresentationTime"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setContentProposalPresentationTime:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__IKAppMediaItemBridge_setContentProposalPresentationTime___block_invoke;
  v3[3] = &__block_descriptor_40_e47_v24__0__IKAppContext_8__IKAppMediaItemBridge_16l;
  *(double *)&v3[4] = a3;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v3];
}

void __59__IKAppMediaItemBridge_setContentProposalPresentationTime___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 appMediaItem];
  uint64_t v4 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  [v5 setObject:v4 forKey:@"contentProposalPresentationTime"];
}

- (double)contentProposalAutomaticAcceptanceInterval
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24;
  id v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__IKAppMediaItemBridge_contentProposalAutomaticAcceptanceInterval__block_invoke;
  v5[3] = &unk_1E6DE62F0;
  v5[4] = &v6;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v5];
  [(id)v7[5] doubleValue];
  double v3 = v2;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __66__IKAppMediaItemBridge_contentProposalAutomaticAcceptanceInterval__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 appMediaItem];
  uint64_t v4 = [v7 objectForKey:@"contentProposalPresentationTime"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setContentProposalAutomaticAcceptanceInterval:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__IKAppMediaItemBridge_setContentProposalAutomaticAcceptanceInterval___block_invoke;
  v3[3] = &__block_descriptor_40_e47_v24__0__IKAppContext_8__IKAppMediaItemBridge_16l;
  *(double *)&v3[4] = a3;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v3];
}

void __70__IKAppMediaItemBridge_setContentProposalAutomaticAcceptanceInterval___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 appMediaItem];
  uint64_t v4 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  [v5 setObject:v4 forKey:@"contentProposalAutomaticAcceptanceInterval"];
}

- (void)prepareForLoadingWithCallback:(id)a3
{
  id v4 = a3;
  objc_copyWeak(&to, (id *)&self->_appContext);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__IKAppMediaItemBridge_prepareForLoadingWithCallback___block_invoke;
  v13[3] = &unk_1E6DE6360;
  objc_copyWeak(&v15, &to);
  id v5 = v4;
  id v14 = v5;
  uint64_t v6 = (void *)MEMORY[0x1E4E65800](v13);
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__IKAppMediaItemBridge_prepareForLoadingWithCallback___block_invoke_3;
  v9[3] = &unk_1E6DE5408;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [WeakRetained evaluate:v9 completionBlock:0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&to);
}

void __54__IKAppMediaItemBridge_prepareForLoadingWithCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isBoolean]) {
    char v7 = [v5 toBool];
  }
  else {
    char v7 = 0;
  }
  if ([v6 isString])
  {
    id v8 = [v6 toString];
    v9 = [MEMORY[0x1E4F28C58] errorWithDomain:v8 code:1 userInfo:0];
  }
  else
  {
    id v8 = 0;
    v9 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__IKAppMediaItemBridge_prepareForLoadingWithCallback___block_invoke_2;
  v13[3] = &unk_1E6DE6338;
  id v11 = *(id *)(a1 + 32);
  char v16 = v7;
  id v14 = v9;
  id v15 = v11;
  id v12 = v9;
  [WeakRetained evaluateDelegateBlockSync:v13];
}

uint64_t __54__IKAppMediaItemBridge_prepareForLoadingWithCallback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __54__IKAppMediaItemBridge_prepareForLoadingWithCallback___block_invoke_3(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  double v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v3);
  id v6 = (void *)MEMORY[0x1E4F30938];
  id v7 = objc_loadWeakRetained(WeakRetained + 5);
  id v8 = [v6 valueWithObject:v7 inContext:v4];

  if ([v8 hasProperty:@"prepareForLoadingWithCompletion"])
  {
    id v9 = objc_loadWeakRetained(WeakRetained + 5);
    id v10 = (void *)MEMORY[0x1E4E65800](*(void *)(a1 + 32));
    v13[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v12 = (id)[v9 invokeMethod:@"prepareForLoadingWithCompletion" withArguments:v11];
  }
}

- (void)loadCertificateDataForURL:(id)a3 withCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_copyWeak(&to, (id *)&self->_appContext);
  id v8 = [v6 absoluteString];
  id v9 = [(IKAppMediaItemBridge *)self jsMediaItem];
  id v10 = objc_loadWeakRetained(&to);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__IKAppMediaItemBridge_loadCertificateDataForURL_withCallback___block_invoke;
  v14[3] = &unk_1E6DE63D8;
  id v11 = v9;
  id v15 = v11;
  id v12 = v8;
  id v16 = v12;
  objc_copyWeak(&v18, &to);
  id v13 = v7;
  id v17 = v13;
  [v10 evaluate:v14 completionBlock:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&to);
}

void __63__IKAppMediaItemBridge_loadCertificateDataForURL_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__IKAppMediaItemBridge_loadCertificateDataForURL_withCallback___block_invoke_2;
  v6[3] = &unk_1E6DE63B0;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 48);
  [v4 loadCertificateDataForURI:v5 withCallback:v6];

  objc_destroyWeak(&v8);
}

void __63__IKAppMediaItemBridge_loadCertificateDataForURL_withCallback___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    id v9 = (objc_class *)MEMORY[0x1E4F1C9B8];
    id v10 = a2;
    a2 = (void *)[[v9 alloc] initWithBase64EncodedString:v10 options:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__IKAppMediaItemBridge_loadCertificateDataForURL_withCallback___block_invoke_3;
  v16[3] = &unk_1E6DE6388;
  id v12 = *(id *)(a1 + 32);
  id v17 = a2;
  id v18 = v7;
  id v19 = v8;
  id v20 = v12;
  id v13 = v8;
  id v14 = v7;
  id v15 = a2;
  [WeakRetained evaluateDelegateBlockSync:v16];
}

uint64_t __63__IKAppMediaItemBridge_loadCertificateDataForURL_withCallback___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)loadContentIdentifierDataForURL:(id)a3 withCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_copyWeak(&to, (id *)&self->_appContext);
  id v8 = [v6 absoluteString];
  id v9 = [(IKAppMediaItemBridge *)self jsMediaItem];
  id v10 = objc_loadWeakRetained(&to);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__IKAppMediaItemBridge_loadContentIdentifierDataForURL_withCallback___block_invoke;
  v14[3] = &unk_1E6DE63D8;
  id v11 = v9;
  id v15 = v11;
  id v12 = v8;
  id v16 = v12;
  objc_copyWeak(&v18, &to);
  id v13 = v7;
  id v17 = v13;
  [v10 evaluate:v14 completionBlock:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&to);
}

void __69__IKAppMediaItemBridge_loadContentIdentifierDataForURL_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__IKAppMediaItemBridge_loadContentIdentifierDataForURL_withCallback___block_invoke_2;
  v6[3] = &unk_1E6DE63B0;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 48);
  [v4 loadContentIdentifierDataForURI:v5 withCallback:v6];

  objc_destroyWeak(&v8);
}

void __69__IKAppMediaItemBridge_loadContentIdentifierDataForURL_withCallback___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    id v9 = (objc_class *)MEMORY[0x1E4F1C9B8];
    id v10 = a2;
    a2 = (void *)[[v9 alloc] initWithBase64EncodedString:v10 options:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__IKAppMediaItemBridge_loadContentIdentifierDataForURL_withCallback___block_invoke_3;
  v16[3] = &unk_1E6DE6388;
  id v12 = *(id *)(a1 + 32);
  id v17 = a2;
  id v18 = v7;
  id v19 = v8;
  id v20 = v12;
  id v13 = v8;
  id v14 = v7;
  id v15 = a2;
  [WeakRetained evaluateDelegateBlockSync:v16];
}

uint64_t __69__IKAppMediaItemBridge_loadContentIdentifierDataForURL_withCallback___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)loadKeyDataForURL:(id)a3 keyRequestData:(id)a4 withCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_copyWeak(&to, (id *)&self->_appContext);
  id v11 = [v8 absoluteString];
  id v12 = [v9 base64EncodedStringWithOptions:0];
  id v13 = [(IKAppMediaItemBridge *)self jsMediaItem];
  id v14 = objc_loadWeakRetained(&to);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__IKAppMediaItemBridge_loadKeyDataForURL_keyRequestData_withCallback___block_invoke;
  v19[3] = &unk_1E6DE6400;
  id v15 = v13;
  id v20 = v15;
  id v16 = v11;
  id v21 = v16;
  id v17 = v12;
  id v22 = v17;
  objc_copyWeak(&v24, &to);
  id v18 = v10;
  id v23 = v18;
  [v14 evaluate:v19 completionBlock:0];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&to);
}

void __70__IKAppMediaItemBridge_loadKeyDataForURL_keyRequestData_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__IKAppMediaItemBridge_loadKeyDataForURL_keyRequestData_withCallback___block_invoke_2;
  v7[3] = &unk_1E6DE63B0;
  objc_copyWeak(&v9, (id *)(a1 + 64));
  id v8 = *(id *)(a1 + 56);
  [v4 loadKeyDataForURI:v5 requestData:v6 withCallback:v7];

  objc_destroyWeak(&v9);
}

void __70__IKAppMediaItemBridge_loadKeyDataForURL_keyRequestData_withCallback___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    id v9 = (objc_class *)MEMORY[0x1E4F1C9B8];
    id v10 = a2;
    a2 = (void *)[[v9 alloc] initWithBase64EncodedString:v10 options:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__IKAppMediaItemBridge_loadKeyDataForURL_keyRequestData_withCallback___block_invoke_3;
  v16[3] = &unk_1E6DE6388;
  id v12 = *(id *)(a1 + 32);
  id v17 = a2;
  id v18 = v7;
  id v19 = v8;
  id v20 = v12;
  id v13 = v8;
  id v14 = v7;
  id v15 = a2;
  [WeakRetained evaluateDelegateBlockSync:v16];
}

uint64_t __70__IKAppMediaItemBridge_loadKeyDataForURL_keyRequestData_withCallback___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)_resolveArtworkImageURL
{
  id v3 = [[IKSrcsetParser alloc] initWithSrcsetStr:self->_artworkImageSrcset defaultStr:self->_artworkImageURL];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__IKAppMediaItemBridge__resolveArtworkImageURL__block_invoke;
  v5[3] = &unk_1E6DE62C8;
  uint64_t v6 = v3;
  id v4 = v3;
  [(IKAppMediaItemBridge *)self _evaluateDelegateBlockSync:v5];
}

void __47__IKAppMediaItemBridge__resolveArtworkImageURL__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = [a3 appMediaItem];
  id v4 = [*(id *)(a1 + 32) resolvedURL];
  uint64_t v5 = [v4 absoluteString];
  [v6 setObject:v5 forKey:@"artworkImageURL"];
}

- (void)_evaluateDelegateBlockSync:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(IKAppMediaItemBridge *)self appContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__IKAppMediaItemBridge__evaluateDelegateBlockSync___block_invoke;
  v7[3] = &unk_1E6DE47E8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 evaluateDelegateBlockSync:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__IKAppMediaItemBridge__evaluateDelegateBlockSync___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, WeakRetained);
    }
  }
}

- (IKAppMediaItem)appMediaItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appMediaItem);
  return (IKAppMediaItem *)WeakRetained;
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (IKJSMediaItem)jsMediaItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_jsMediaItem);
  return (IKJSMediaItem *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_jsMediaItem);
  objc_destroyWeak((id *)&self->_appContext);
  objc_destroyWeak((id *)&self->_appMediaItem);
  objc_storeStrong((id *)&self->_artworkImageSrcset, 0);
  objc_storeStrong((id *)&self->_artworkImageURL, 0);
}

@end