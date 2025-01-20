@interface AVAssetCache
+ (AVAssetCache)assetCacheWithURL:(id)a3;
+ (id)assetCacheForHTTPLiveStreamingWithURL:(id)a3;
+ (id)assetCacheForProgressiveDownloadAndHTTPLiveStreamingWithURL:(id)a3;
+ (id)assetCacheForProgressiveDownloadWithURL:(id)a3;
- (AVAssetCache)initWithURL:(id)a3;
- (BOOL)isDefunct;
- (BOOL)isPlayableOffline;
- (NSArray)mediaSelectionOptionsInMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup;
- (id)URL;
- (id)_init;
- (id)allKeys;
- (id)lastModifiedDateOfEntryForKey:(id)a3;
- (int64_t)currentSize;
- (int64_t)maxEntrySize;
- (int64_t)maxSize;
- (int64_t)sizeOfEntryForKey:(id)a3;
- (void)removeEntryForKey:(id)a3;
@end

@implementation AVAssetCache

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetCache;
  return [(AVAssetCache *)&v3 init];
}

- (AVAssetCache)initWithURL:(id)a3
{
  v4 = [AVManagedAssetCache alloc];
  return (AVAssetCache *)[(AVManagedAssetCache *)v4 initWithURL:a3];
}

+ (AVAssetCache)assetCacheWithURL:(id)a3
{
  return (AVAssetCache *)+[AVManagedAssetCache assetCacheWithURL:a3];
}

+ (id)assetCacheForHTTPLiveStreamingWithURL:(id)a3
{
  return +[AVManagedAssetCache assetCacheForHTTPLiveStreamingWithURL:a3];
}

+ (id)assetCacheForProgressiveDownloadWithURL:(id)a3
{
  return +[AVManagedAssetCache assetCacheForProgressiveDownloadWithURL:a3];
}

+ (id)assetCacheForProgressiveDownloadAndHTTPLiveStreamingWithURL:(id)a3
{
  return +[AVManagedAssetCache assetCacheForProgressiveDownloadAndHTTPLiveStreamingWithURL:a3];
}

- (NSArray)mediaSelectionOptionsInMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup
{
  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  v6 = (void *)MEMORY[0x1E4F1C978];
  return (NSArray *)[v6 array];
}

- (BOOL)isPlayableOffline
{
  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (int64_t)maxSize
{
  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (int64_t)maxEntrySize
{
  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (int64_t)currentSize
{
  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (id)URL
{
  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (void)removeEntryForKey:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
}

- (int64_t)sizeOfEntryForKey:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (id)lastModifiedDateOfEntryForKey:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (id)allKeys
{
  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (BOOL)isDefunct
{
  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

@end