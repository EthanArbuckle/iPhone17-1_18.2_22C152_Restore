@interface IKJSMediaItem
- (BOOL)isExplicit;
- (IKAppMediaItemBridge)bridge;
- (IKJSMediaItem)initWithType:(id)a3 :(id)a4;
- (NSArray)highlightGroups;
- (NSArray)interstitials;
- (NSDictionary)metadata;
- (NSNumber)contentRatingRanking;
- (NSNumber)resumeTime;
- (NSString)artworkImageSrcset;
- (NSString)artworkImageURL;
- (NSString)contentRatingDomain;
- (NSString)description;
- (NSString)externalID;
- (NSString)subtitle;
- (NSString)title;
- (NSString)type;
- (NSString)url;
- (double)contentProposalAutomaticAcceptanceInterval;
- (double)contentProposalPresentationTime;
- (id)ratingBadge;
- (void)dealloc;
- (void)loadCertificateDataForURI:(id)a3 withCallback:(id)a4;
- (void)loadContentIdentifierDataForURI:(id)a3 withCallback:(id)a4;
- (void)loadKeyDataForURI:(id)a3 requestData:(id)a4 withCallback:(id)a5;
- (void)setArtworkImageSrcset:(id)a3;
- (void)setArtworkImageURL:(id)a3;
- (void)setContentProposalAutomaticAcceptanceInterval:(double)a3;
- (void)setContentProposalPresentationTime:(double)a3;
- (void)setContentRatingDomain:(id)a3;
- (void)setContentRatingRanking:(id)a3;
- (void)setDescription:(id)a3;
- (void)setExternalID:(id)a3;
- (void)setHighlightGroups:(id)a3;
- (void)setInterstitials:(id)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setRatingBadge:(id)a3;
- (void)setResumeTime:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation IKJSMediaItem

- (IKJSMediaItem)initWithType:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[IKAppContext currentAppContext];
  v15.receiver = self;
  v15.super_class = (Class)IKJSMediaItem;
  v9 = [(IKJSObject *)&v15 initWithAppContext:v8];

  if (v9)
  {
    v10 = [IKAppMediaItemBridge alloc];
    v11 = [(IKJSObject *)v9 appContext];
    uint64_t v12 = [(IKAppMediaItemBridge *)v10 initWithAppContext:v11 jsMediaItem:v9];
    bridge = v9->_bridge;
    v9->_bridge = (IKAppMediaItemBridge *)v12;

    if (v7 && ([v7 isEqualToString:@"undefined"] & 1) == 0) {
      [(IKAppMediaItemBridge *)v9->_bridge setUrl:v7];
    }
    [(IKJSMediaItem *)v9 setType:v6];
  }

  return v9;
}

- (void)dealloc
{
  [(IKAppMediaItemBridge *)self->_bridge cleanup];
  v3.receiver = self;
  v3.super_class = (Class)IKJSMediaItem;
  [(IKJSMediaItem *)&v3 dealloc];
}

- (void)setType:(id)a3
{
  id v6 = (__CFString *)a3;
  if (([(__CFString *)v6 isEqualToString:@"video"] & 1) == 0
    && ([(__CFString *)v6 isEqualToString:@"audio"] & 1) == 0)
  {
    v4 = @"video";

    id v6 = v4;
  }
  v5 = [(IKJSMediaItem *)self bridge];
  [v5 setType:v6];
}

- (NSString)type
{
  v2 = [(IKJSMediaItem *)self bridge];
  objc_super v3 = [v2 type];

  return (NSString *)v3;
}

- (void)setUrl:(id)a3
{
}

- (NSString)url
{
  return [(IKAppMediaItemBridge *)self->_bridge url];
}

- (void)setExternalID:(id)a3
{
}

- (NSString)externalID
{
  return [(IKAppMediaItemBridge *)self->_bridge externalID];
}

- (void)setInterstitials:(id)a3
{
}

- (NSArray)interstitials
{
  return [(IKAppMediaItemBridge *)self->_bridge interstitials];
}

- (void)setHighlightGroups:(id)a3
{
}

- (NSArray)highlightGroups
{
  return [(IKAppMediaItemBridge *)self->_bridge chapterGroups];
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return [(IKAppMediaItemBridge *)self->_bridge title];
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return [(IKAppMediaItemBridge *)self->_bridge subtitle];
}

- (void)setDescription:(id)a3
{
}

- (NSString)description
{
  return [(IKAppMediaItemBridge *)self->_bridge description];
}

- (void)setContentRatingRanking:(id)a3
{
}

- (NSNumber)contentRatingRanking
{
  return [(IKAppMediaItemBridge *)self->_bridge contentRatingRanking];
}

- (void)setRatingBadge:(id)a3
{
}

- (id)ratingBadge
{
  return [(IKAppMediaItemBridge *)self->_bridge ratingBadge];
}

- (void)setArtworkImageURL:(id)a3
{
}

- (NSString)artworkImageURL
{
  return [(IKAppMediaItemBridge *)self->_bridge artworkImageURL];
}

- (void)setArtworkImageSrcset:(id)a3
{
}

- (NSString)artworkImageSrcset
{
  return [(IKAppMediaItemBridge *)self->_bridge artworkImageSrcset];
}

- (void)setIsExplicit:(BOOL)a3
{
}

- (BOOL)isExplicit
{
  return [(IKAppMediaItemBridge *)self->_bridge isExplicit];
}

- (void)setResumeTime:(id)a3
{
}

- (NSNumber)resumeTime
{
  return [(IKAppMediaItemBridge *)self->_bridge resumeTime];
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)metadata
{
  return [(IKAppMediaItemBridge *)self->_bridge extraMetadata];
}

- (void)setContentRatingDomain:(id)a3
{
}

- (NSString)contentRatingDomain
{
  return [(IKAppMediaItemBridge *)self->_bridge contentRatingDomain];
}

- (void)setContentProposalAutomaticAcceptanceInterval:(double)a3
{
}

- (double)contentProposalAutomaticAcceptanceInterval
{
  [(IKAppMediaItemBridge *)self->_bridge contentProposalAutomaticAcceptanceInterval];
  return result;
}

- (void)setContentProposalPresentationTime:(double)a3
{
}

- (double)contentProposalPresentationTime
{
  [(IKAppMediaItemBridge *)self->_bridge contentProposalPresentationTime];
  return result;
}

- (void)loadCertificateDataForURI:(id)a3 withCallback:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __56__IKJSMediaItem_loadCertificateDataForURI_withCallback___block_invoke;
  v20 = &unk_1E6DE60A8;
  id v8 = v7;
  id v21 = v8;
  v9 = (void *)MEMORY[0x1E4E65800](&v17);
  v10 = (void *)MEMORY[0x1E4F30938];
  v11 = [(IKJSObject *)self appContext];
  uint64_t v12 = [v11 jsContext];
  v13 = [v10 valueWithObject:self inContext:v12];

  if ([v13 hasProperty:@"loadCertificate"])
  {
    v22[0] = v6;
    v14 = (void *)MEMORY[0x1E4E65800](v9);
    v22[1] = v14;
    objc_super v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    id v16 = [(IKJSObject *)self invokeMethod:@"loadCertificate" withArguments:v15];
  }
  else
  {
    v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ITMLKitErrorDomain" code:103 userInfo:0];
    (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v14);
  }
}

void __56__IKJSMediaItem_loadCertificateDataForURI_withCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v9 isString])
  {
    id v6 = [v9 toString];
  }
  else
  {
    id v6 = 0;
  }
  if ([v5 isString])
  {
    id v7 = [v5 toString];
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:v7 code:1 userInfo:0];
  }
  else
  {
    id v7 = 0;
    id v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadContentIdentifierDataForURI:(id)a3 withCallback:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __62__IKJSMediaItem_loadContentIdentifierDataForURI_withCallback___block_invoke;
  v20 = &unk_1E6DE60A8;
  id v8 = v7;
  id v21 = v8;
  id v9 = (void *)MEMORY[0x1E4E65800](&v17);
  v10 = (void *)MEMORY[0x1E4F30938];
  v11 = [(IKJSObject *)self appContext];
  uint64_t v12 = [v11 jsContext];
  v13 = [v10 valueWithObject:self inContext:v12];

  if ([v13 hasProperty:@"loadAssetID"])
  {
    v22[0] = v6;
    v14 = (void *)MEMORY[0x1E4E65800](v9);
    v22[1] = v14;
    objc_super v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    id v16 = [(IKJSObject *)self invokeMethod:@"loadAssetID" withArguments:v15];
  }
  else
  {
    v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ITMLKitErrorDomain" code:103 userInfo:0];
    (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v14);
  }
}

void __62__IKJSMediaItem_loadContentIdentifierDataForURI_withCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v9 isString])
  {
    id v6 = [v9 toString];
  }
  else
  {
    id v6 = 0;
  }
  if ([v5 isString])
  {
    id v7 = [v5 toString];
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:v7 code:1 userInfo:0];
  }
  else
  {
    id v7 = 0;
    id v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadKeyDataForURI:(id)a3 requestData:(id)a4 withCallback:(id)a5
{
  void v22[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __60__IKJSMediaItem_loadKeyDataForURI_requestData_withCallback___block_invoke;
  v20[3] = &unk_1E6DE60D0;
  id v11 = v10;
  id v21 = v11;
  uint64_t v12 = (void *)MEMORY[0x1E4E65800](v20);
  v13 = (void *)MEMORY[0x1E4F30938];
  v14 = [(IKJSObject *)self appContext];
  objc_super v15 = [v14 jsContext];
  id v16 = [v13 valueWithObject:self inContext:v15];

  if ([v16 hasProperty:@"loadKey"])
  {
    v22[0] = v8;
    v22[1] = v9;
    uint64_t v17 = (void *)MEMORY[0x1E4E65800](v12);
    v22[2] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
    id v19 = [(IKJSObject *)self invokeMethod:@"loadKey" withArguments:v18];
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ITMLKitErrorDomain" code:103 userInfo:0];
    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v17);
  }
}

void __60__IKJSMediaItem_loadKeyDataForURI_requestData_withCallback___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  if ([v13 isString])
  {
    id v9 = [v13 toString];
  }
  else
  {
    id v9 = 0;
  }
  if ([v7 isObject])
  {
    id v10 = [v7 toObjectOfClass:objc_opt_class()];
  }
  else
  {
    id v10 = 0;
  }
  if ([v8 isString])
  {
    id v11 = [v8 toString];
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:v11 code:1 userInfo:0];
  }
  else
  {
    id v11 = 0;
    uint64_t v12 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (IKAppMediaItemBridge)bridge
{
  return self->_bridge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridge, 0);
  objc_storeStrong((id *)&self->_resumeTime, 0);
}

@end