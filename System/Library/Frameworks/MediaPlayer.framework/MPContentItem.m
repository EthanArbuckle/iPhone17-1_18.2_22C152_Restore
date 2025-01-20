@interface MPContentItem
+ (BOOL)isSuppressingChangeNotifications;
+ (BOOL)shouldPushArtworkData;
+ (void)performChangeImmediately:(id)a3;
+ (void)performSuppressingChangeNotifications:(id)a3;
- (BOOL)isContainer;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitContent;
- (BOOL)isPlayable;
- (BOOL)isStreamingContent;
- (MPContentItem)init;
- (MPContentItem)initWithExternalRepresentation:(id)a3;
- (MPContentItem)initWithIdentifier:(NSString *)identifier;
- (MPMediaItemArtwork)artwork;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (float)playbackProgress;
- (id)_initWithMediaRemoteContentItem:(void *)a3;
- (id)createExternalRepresentation;
- (id)description;
- (void)_loadArtwork:(id)a3 completion:(id)a4;
- (void)_mediaRemoteContentItem;
- (void)_postItemChangedNotificationWithDeltaBlock:(id)a3;
- (void)dealloc;
- (void)postChangeNotificationImmediately:(BOOL)a3;
- (void)setArtwork:(MPMediaItemArtwork *)artwork;
- (void)setContainer:(BOOL)container;
- (void)setExplicitContent:(BOOL)explicitContent;
- (void)setPlayable:(BOOL)playable;
- (void)setPlaybackProgress:(float)playbackProgress;
- (void)setStreamingContent:(BOOL)streamingContent;
- (void)setSubtitle:(NSString *)subtitle;
- (void)setTitle:(NSString *)title;
@end

@implementation MPContentItem

- (void)_postItemChangedNotificationWithDeltaBlock:(id)a3
{
  v4 = (void (**)(id, const void *))a3;
  v5 = [MEMORY[0x1E4F29060] currentThread];
  v6 = [v5 threadDictionary];

  v7 = [v6 objectForKeyedSubscript:@"_MPContentItemNotificationsSuppressedKey"];
  char v8 = [v7 BOOLValue];

  if ((v8 & 1) == 0)
  {
    v9 = MRContentItemGetIdentifier();
    if (v9)
    {
      if (v4)
      {
        v10 = (const void *)MRContentItemCreate();
        v4[2](v4, v10);
        v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
        [v11 setObject:v10 forKeyedSubscript:@"_MPContentItemDidChangeUserInfoKeyDeltaItem"];
        v12 = [v6 objectForKeyedSubscript:@"_MPContentItemNotificationsImmediateKey"];
        int v13 = [v12 BOOLValue];

        if (v13) {
          [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_MPContentItemDidChangeUserInfoKeyImmediately"];
        }
        CFRelease(v10);
      }
      else
      {
        v11 = 0;
      }
      v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 postNotificationName:@"_MPContentItemDidChangeNotification" object:self userInfo:v11];
    }
    else
    {
      v11 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_ERROR, "Cannot post _MPContentItemDidChangeNotification, item is missing required identifier.", v15, 2u);
      }
    }
  }
}

- (void).cxx_destruct
{
}

- (void)setExplicitContent:(BOOL)explicitContent
{
  if ([(MPContentItem *)self isExplicitContent] != explicitContent)
  {
    v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetExplicitItem();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__MPContentItem_setExplicitContent___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    BOOL v7 = explicitContent;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (BOOL)isExplicitContent
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF78](v2);
}

- (void)setTitle:(NSString *)title
{
  v4 = title;
  v5 = [(MPContentItem *)self title];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == v4)
  {
  }
  else
  {
    int v7 = [(NSString *)v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!((unint64_t)v4 | v6))
  {
LABEL_6:
    char v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetTitle();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __26__MPContentItem_setTitle___block_invoke;
    v9[3] = &unk_1E57F7278;
    v10 = v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

- (NSString)title
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412E068](v2);
}

- (NSString)identifier
{
  [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MRContentItemGetIdentifier();
}

- (void)_mediaRemoteContentItem
{
  return self->_mediaRemoteContentItem;
}

+ (void)performSuppressingChangeNotifications:(id)a3
{
  int v7 = (void (**)(void))a3;
  v3 = [MEMORY[0x1E4F29060] currentThread];
  v4 = [v3 threadDictionary];

  v5 = [v4 objectForKeyedSubscript:@"_MPContentItemNotificationsSuppressedKey"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7[2]();
  }
  else
  {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_MPContentItemNotificationsSuppressedKey"];
    v7[2]();
    [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"_MPContentItemNotificationsSuppressedKey"];
  }
}

- (id)_initWithMediaRemoteContentItem:(void *)a3
{
  v3 = a3;
  if (a3)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
    int v6 = [(MPContentItem *)self initWithIdentifier:v5];

    if (v6) {
      v6->_mediaRemoteContentItem = (void *)CFRetain(v3);
    }
    self = v6;
    v3 = self;
  }

  return (id)v3;
}

- (MPContentItem)initWithIdentifier:(NSString *)identifier
{
  v5 = identifier;
  v12.receiver = self;
  v12.super_class = (Class)MPContentItem;
  int v6 = [(MPContentItem *)&v12 init];
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:v6 file:@"MPContentItem.m" lineNumber:75 description:@"Can't create an MPContentItem object with a nil identifier."];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v7 = v5;
    v5 = v7;
    if (objc_opt_respondsToSelector())
    {
      v5 = [(NSString *)v7 stringValue];
    }
  }
  if (v6) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];

    if (v5 != v9) {
      v6->_mediaRemoteContentItem = (void *)MRContentItemCreate();
    }
  }

  return v6;
}

- (void)postChangeNotificationImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = MRContentItemGetIdentifier();
  if (v5)
  {
    int v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    [v6 setObject:self->_mediaRemoteContentItem forKeyedSubscript:@"_MPContentItemDidChangeUserInfoKeyDeltaItem"];
    if (v3) {
      [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_MPContentItemDidChangeUserInfoKeyImmediately"];
    }
    int v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"_MPContentItemDidChangeNotification" object:self userInfo:v6];
  }
  else
  {
    BOOL v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "Cannot post _MPContentItemDidChangeNotification, item is missing required identifier.", v9, 2u);
    }
  }
}

- (void)dealloc
{
  mediaRemoteContentItem = self->_mediaRemoteContentItem;
  if (mediaRemoteContentItem) {
    CFRelease(mediaRemoteContentItem);
  }
  v4.receiver = self;
  v4.super_class = (Class)MPContentItem;
  [(MPContentItem *)&v4 dealloc];
}

- (void)setPlayable:(BOOL)playable
{
  if ([(MPContentItem *)self isPlayable] != playable)
  {
    v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetPlayable();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __29__MPContentItem_setPlayable___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    BOOL v7 = playable;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

- (BOOL)isPlayable
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF90](v2);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (MPContentItem *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(MPContentItem *)self createExternalRepresentation];
      int v6 = [(MPContentItem *)v4 createExternalRepresentation];
      char v7 = [v5 isEqualToData:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (MPMediaItemArtwork)artwork
{
  return self->_artwork;
}

- (void)_loadArtwork:(id)a3 completion:(id)a4
{
  id v5 = a4;
  int v6 = +[MPPlayableContentManager sharedContentManager];
  artwork = self->_artwork;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__MPContentItem__loadArtwork_completion___block_invoke;
  v9[3] = &unk_1E57F7308;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  objc_msgSend(v6, "_enqueueArtworkUpdate:size:withCompletion:", artwork, v9, -1.0, -1.0);
}

void __41__MPContentItem__loadArtwork_completion___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MPContentItem__loadArtwork_completion___block_invoke_2;
  block[3] = &unk_1E57F72E0;
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  id v12 = v7;
  uint64_t v13 = v8;
  double v15 = a3;
  double v16 = a4;
  id v14 = v9;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __41__MPContentItem__loadArtwork_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) length];
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "Received artwork with length %llu for content item %@.", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) _mediaRemoteContentItem];
  MRContentItemSetArtworkData();
  MRContentItemSetArtworkDataSize();
  [*(id *)(a1 + 40) _postItemChangedNotificationWithDeltaBlock:0];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setArtwork:(MPMediaItemArtwork *)artwork
{
  id v5 = artwork;
  if (self->_artwork != v5)
  {
    objc_storeStrong((id *)&self->_artwork, artwork);
    MRContentItemSetHasArtworkData();
    if (self->_artwork)
    {
      if ([(id)objc_opt_class() shouldPushArtworkData]) {
        [(MPContentItem *)self _loadArtwork:self->_artwork completion:0];
      }
    }
  }
}

uint64_t __29__MPContentItem_setPlayable___block_invoke()
{
  return MRContentItemSetPlayable();
}

- (void)setStreamingContent:(BOOL)streamingContent
{
  if ([(MPContentItem *)self isStreamingContent] != streamingContent)
  {
    id v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetIsStreamingContent();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__MPContentItem_setStreamingContent___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    BOOL v7 = streamingContent;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

uint64_t __37__MPContentItem_setStreamingContent___block_invoke()
{
  return MRContentItemSetIsStreamingContent();
}

- (BOOL)isStreamingContent
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DFA0](v2);
}

uint64_t __36__MPContentItem_setExplicitContent___block_invoke()
{
  return MRContentItemSetExplicitItem();
}

- (void)setContainer:(BOOL)container
{
  if ([(MPContentItem *)self isContainer] != container)
  {
    id v5 = self;
    [(MPContentItem *)v5 _mediaRemoteContentItem];
    MRContentItemSetIsContainer();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __30__MPContentItem_setContainer___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    BOOL v7 = container;
    [(MPContentItem *)v5 _postItemChangedNotificationWithDeltaBlock:v6];
  }
}

uint64_t __30__MPContentItem_setContainer___block_invoke()
{
  return MRContentItemSetIsContainer();
}

- (BOOL)isContainer
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return MEMORY[0x1F412DF70](v2);
}

- (void)setPlaybackProgress:(float)playbackProgress
{
  [(MPContentItem *)self playbackProgress];
  float v6 = -v5;
  if (v5 >= 0.0) {
    float v6 = v5;
  }
  if (v6 > 0.00000011921) {
    goto LABEL_7;
  }
  float v7 = -playbackProgress;
  if (playbackProgress >= 0.0) {
    float v7 = playbackProgress;
  }
  if (v7 > 0.00000011921)
  {
LABEL_7:
    float v8 = v5 - playbackProgress;
    if (v8 < 0.0) {
      float v8 = -v8;
    }
    if (v8 > 0.00000011921)
    {
      uint64_t v9 = self;
      [(MPContentItem *)v9 _mediaRemoteContentItem];
      MRContentItemSetPlaybackProgress();
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __37__MPContentItem_setPlaybackProgress___block_invoke;
      v10[3] = &__block_descriptor_36_e9_v16__0_v8l;
      float v11 = playbackProgress;
      [(MPContentItem *)v9 _postItemChangedNotificationWithDeltaBlock:v10];
    }
  }
}

uint64_t __37__MPContentItem_setPlaybackProgress___block_invoke()
{
  return MRContentItemSetPlaybackProgress();
}

- (float)playbackProgress
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  MEMORY[0x1F412DFF0](v2);
  return result;
}

- (void)setSubtitle:(NSString *)subtitle
{
  uint64_t v4 = subtitle;
  float v5 = [(MPContentItem *)self subtitle];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == v4)
  {
  }
  else
  {
    int v7 = [(NSString *)v5 isEqual:v4];

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (!((unint64_t)v4 | v6))
  {
LABEL_6:
    float v8 = self;
    [(MPContentItem *)v8 _mediaRemoteContentItem];
    MRContentItemSetSubtitle();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __29__MPContentItem_setSubtitle___block_invoke;
    v9[3] = &unk_1E57F7278;
    uint64_t v10 = v4;
    [(MPContentItem *)v8 _postItemChangedNotificationWithDeltaBlock:v9];
  }
}

uint64_t __29__MPContentItem_setSubtitle___block_invoke()
{
  return MRContentItemSetSubtitle();
}

- (NSString)subtitle
{
  v2 = [(MPContentItem *)self _mediaRemoteContentItem];

  return (NSString *)MEMORY[0x1F412E060](v2);
}

uint64_t __26__MPContentItem_setTitle___block_invoke()
{
  return MRContentItemSetTitle();
}

- (id)createExternalRepresentation
{
  ExternalRepresentation = (void *)MRContentItemCreateExternalRepresentation();

  return ExternalRepresentation;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  float v5 = [(MPContentItem *)self identifier];
  unint64_t v6 = [(MPContentItem *)self title];
  int v7 = [v3 stringWithFormat:@"<%@: %p id=%@ title=\"%@\">", v4, self, v5, v6];

  return v7;
}

- (MPContentItem)initWithExternalRepresentation:(id)a3
{
  uint64_t v4 = MRContentItemCreateFromExternalRepresentation();

  return (MPContentItem *)[(MPContentItem *)self _initWithMediaRemoteContentItem:v4];
}

- (MPContentItem)init
{
  uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v4 = [v3 UUIDString];
  float v5 = [(MPContentItem *)self initWithIdentifier:v4];

  return v5;
}

+ (BOOL)shouldPushArtworkData
{
  return 1;
}

+ (void)performChangeImmediately:(id)a3
{
  int v7 = (void (**)(void))a3;
  uint64_t v3 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v4 = [v3 threadDictionary];

  float v5 = [v4 objectForKeyedSubscript:@"_MPContentItemNotificationsImmediateKey"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7[2]();
  }
  else
  {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_MPContentItemNotificationsImmediateKey"];
    v7[2]();
    [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"_MPContentItemNotificationsImmediateKey"];
  }
}

+ (BOOL)isSuppressingChangeNotifications
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v3 = [v2 threadDictionary];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"_MPContentItemNotificationsSuppressedKey"];
  char v5 = [v4 BOOLValue];

  return v5;
}

@end