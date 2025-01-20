@interface SFAccountIconSharingBadgeImageProvider
+ (id)sharedProvider;
- (SFAccountIconSharingBadgeImageProvider)init;
- (id)_createBadgeImageWithDiameter:(unint64_t)a3;
- (id)badgeImageForDiameter:(unint64_t)a3;
- (void)_resetAndInformSubscribers;
- (void)addCoordinatorAsSubscriber:(id)a3;
@end

@implementation SFAccountIconSharingBadgeImageProvider

- (SFAccountIconSharingBadgeImageProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)SFAccountIconSharingBadgeImageProvider;
  v2 = [(SFAccountIconSharingBadgeImageProvider *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    subscribers = v2->_subscribers;
    v2->_subscribers = (NSHashTable *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__resetAndInformSubscribers name:*MEMORY[0x1E4FB32A8] object:0];

    v6 = v2;
  }

  return v2;
}

+ (id)sharedProvider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SFAccountIconSharingBadgeImageProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, block);
  }
  v2 = (void *)sharedProvider_provider;

  return v2;
}

void __56__SFAccountIconSharingBadgeImageProvider_sharedProvider__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedProvider_provider;
  sharedProvider_provider = (uint64_t)v1;
}

- (id)badgeImageForDiameter:(unint64_t)a3
{
  badgeDiameterToImageCache = self->_badgeDiameterToImageCache;
  if (!badgeDiameterToImageCache)
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    v7 = self->_badgeDiameterToImageCache;
    self->_badgeDiameterToImageCache = v6;

    badgeDiameterToImageCache = self->_badgeDiameterToImageCache;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInteger:a3];
  v9 = [(NSMutableDictionary *)badgeDiameterToImageCache objectForKeyedSubscript:v8];

  if (!v9)
  {
    v9 = [(SFAccountIconSharingBadgeImageProvider *)self _createBadgeImageWithDiameter:a3];
    v10 = self->_badgeDiameterToImageCache;
    v11 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:v11];
  }
  id v12 = v9;

  return v12;
}

- (id)_createBadgeImageWithDiameter:(unint64_t)a3
{
  double v3 = (double)a3;
  v4 = [MEMORY[0x1E4FB17E0] defaultFormat];
  [v4 setOpaque:0];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v4, v3, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__SFAccountIconSharingBadgeImageProvider__createBadgeImageWithDiameter___block_invoke;
  v8[3] = &__block_descriptor_80_e40_v16__0__UIGraphicsImageRendererContext_8l;
  v8[4] = 0;
  v8[5] = 0;
  *(double *)&v8[6] = v3;
  *(double *)&v8[7] = v3;
  *(double *)&v8[8] = v3;
  *(double *)&v8[9] = v3;
  v6 = [v5 imageWithActions:v8];

  return v6;
}

void __72__SFAccountIconSharingBadgeImageProvider__createBadgeImageWithDiameter___block_invoke(double *a1)
{
  v2 = [MEMORY[0x1E4FB1618] darkGrayColor];
  [v2 set];

  double v3 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", a1[4], a1[5], a1[6], a1[7]);
  [v3 fill];

  v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.2.fill"];
  v5 = [MEMORY[0x1E4FB1618] whiteColor];
  id v6 = [v4 imageWithTintColor:v5 renderingMode:1];

  [v6 size];
  [v6 size];
  _SFCGRectOfSizeAlignedWithinRect();
  _SFRoundRectToPixels();
  objc_msgSend(v6, "drawInRect:");
}

- (void)addCoordinatorAsSubscriber:(id)a3
{
}

- (void)_resetAndInformSubscribers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(NSMutableDictionary *)self->_badgeDiameterToImageCache removeAllObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  double v3 = self->_subscribers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "reset", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeDiameterToImageCache, 0);

  objc_storeStrong((id *)&self->_subscribers, 0);
}

@end