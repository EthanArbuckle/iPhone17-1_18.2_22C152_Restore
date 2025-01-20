@interface AVManagedAssetCache
+ (id)assetCacheForHTTPLiveStreamingWithURL:(id)a3;
+ (id)assetCacheForProgressiveDownloadAndHTTPLiveStreamingWithURL:(id)a3;
+ (id)assetCacheForProgressiveDownloadWithURL:(id)a3;
+ (id)assetCacheWithURL:(id)a3;
- (AVManagedAssetCache)initWithURL:(id)a3;
- (AVManagedAssetCache)initWithURL:(id)a3 enableCRABSCache:(BOOL)a4 enableHLSCache:(BOOL)a5;
- (BOOL)isDefunct;
- (BOOL)isHTTPLiveStreamingCacheEnabled;
- (BOOL)isPlayableOffline;
- (BOOL)isProgressiveDownloadCacheEnabled;
- (id)URL;
- (id)allKeys;
- (id)lastModifiedDateOfEntryForKey:(id)a3;
- (id)mediaSelectionOptionsInMediaSelectionGroup:(id)a3;
- (int64_t)currentSize;
- (int64_t)maxEntrySize;
- (int64_t)maxSize;
- (int64_t)sizeOfEntryForKey:(id)a3;
- (void)dealloc;
- (void)enableAutomaticCacheSizeManagement;
- (void)removeEntryForKey:(id)a3;
- (void)setMaxEntrySize:(int64_t)a3;
- (void)setMaxSize:(int64_t)a3;
@end

@implementation AVManagedAssetCache

+ (id)assetCacheWithURL:(id)a3
{
  v3 = [[AVManagedAssetCache alloc] initWithURL:a3];
  return v3;
}

+ (id)assetCacheForHTTPLiveStreamingWithURL:(id)a3
{
  v3 = [[AVManagedAssetCache alloc] initWithURL:a3 enableCRABSCache:0 enableHLSCache:1];
  return v3;
}

+ (id)assetCacheForProgressiveDownloadWithURL:(id)a3
{
  v3 = [[AVManagedAssetCache alloc] initWithURL:a3 enableCRABSCache:1 enableHLSCache:0];
  return v3;
}

+ (id)assetCacheForProgressiveDownloadAndHTTPLiveStreamingWithURL:(id)a3
{
  v3 = [[AVManagedAssetCache alloc] initWithURL:a3 enableCRABSCache:1 enableHLSCache:1];
  return v3;
}

- (AVManagedAssetCache)initWithURL:(id)a3
{
  return [(AVManagedAssetCache *)self initWithURL:a3 enableCRABSCache:1 enableHLSCache:0];
}

- (AVManagedAssetCache)initWithURL:(id)a3 enableCRABSCache:(BOOL)a4 enableHLSCache:(BOOL)a5
{
  v11.receiver = self;
  v11.super_class = (Class)AVManagedAssetCache;
  v8 = [(AVAssetCache *)&v11 _init];
  if (v8)
  {
    priv = objc_alloc_init(AVManagedAssetCacheInternal);
    v8->_priv = priv;
    if (priv)
    {
      if (a3)
      {
        v8->_priv->url = (NSURL *)[a3 copy];
        priv = v8->_priv;
      }
      priv->enableCRABSCache = a4;
      v8->_priv->enableHLSCache = a5;
      CFRetain(v8->_priv);
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  priv = self->_priv;
  if (priv)
  {

    CFRelease(self->_priv);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVManagedAssetCache;
  [(AVManagedAssetCache *)&v4 dealloc];
}

- (int64_t)maxSize
{
  return 0;
}

- (void)setMaxSize:(int64_t)a3
{
  if (a3 >= 1)
  {
    v5 = [(NSURL *)self->_priv->url absoluteString];
    MEMORY[0x1F40EDBD8](v5, a3, 0, 0);
  }
}

- (int64_t)maxEntrySize
{
  return 0;
}

- (void)setMaxEntrySize:(int64_t)a3
{
  if (a3 >= 1)
  {
    v5 = [(NSURL *)self->_priv->url absoluteString];
    MEMORY[0x1F40EDBD8](v5, 0, a3, 0);
  }
}

- (int64_t)currentSize
{
  return 0;
}

- (void)enableAutomaticCacheSizeManagement
{
  v2 = [(NSURL *)self->_priv->url absoluteString];
  MEMORY[0x1F40EDBD8](v2, 0, 0, 1);
}

- (id)URL
{
  return self->_priv->url;
}

- (void)removeEntryForKey:(id)a3
{
  objc_super v4 = [(NSURL *)self->_priv->url absoluteString];
  MEMORY[0x1F40EDBC8](v4, a3);
}

- (int64_t)sizeOfEntryForKey:(id)a3
{
  return 0;
}

- (id)lastModifiedDateOfEntryForKey:(id)a3
{
  return 0;
}

- (id)allKeys
{
  return 0;
}

- (id)mediaSelectionOptionsInMediaSelectionGroup:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "array", a3);
}

- (BOOL)isPlayableOffline
{
  return 0;
}

- (BOOL)isProgressiveDownloadCacheEnabled
{
  return self->_priv->enableCRABSCache;
}

- (BOOL)isHTTPLiveStreamingCacheEnabled
{
  return self->_priv->enableHLSCache;
}

- (BOOL)isDefunct
{
  return 0;
}

@end