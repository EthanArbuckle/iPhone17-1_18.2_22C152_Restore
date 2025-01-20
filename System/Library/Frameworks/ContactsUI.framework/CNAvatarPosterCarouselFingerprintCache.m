@interface CNAvatarPosterCarouselFingerprintCache
+ (CNAvatarPosterCarouselFingerprintCache)cacheWithCapacity:(unint64_t)a3 contactStore:(id)a4;
+ (CNAvatarPosterCarouselFingerprintCache)cacheWithCapacity:(unint64_t)a3 contactStore:(id)a4 resourceScheduler:(id)a5;
+ (id)cacheKeyForContact:(id)a3;
+ (id)cacheKeyForContactIdentifier:(id)a3;
- (CNAvatarCacheChangeListener)changeHistoryListener;
- (CNAvatarPosterCarouselFingerprintCache)initWithCache:(id)a3 contactStore:(id)a4;
- (CNCache)cache;
- (id)fingerprintForKey:(id)a3;
- (void)invalidateFingerprintsForContactIdentifiers:(id)a3;
- (void)removeObjectForCacheKey:(id)a3;
- (void)removeObjectForContact:(id)a3;
- (void)setFingerprint:(id)a3 forKey:(id)a4;
@end

@implementation CNAvatarPosterCarouselFingerprintCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeHistoryListener, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

- (CNAvatarCacheChangeListener)changeHistoryListener
{
  return self->_changeHistoryListener;
}

- (CNCache)cache
{
  return self->_cache;
}

- (void)invalidateFingerprintsForContactIdentifiers:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __86__CNAvatarPosterCarouselFingerprintCache_invalidateFingerprintsForContactIdentifiers___block_invoke;
  v3[3] = &unk_1E549B460;
  v3[4] = self;
  objc_msgSend(a3, "_cn_each:", v3);
}

void __86__CNAvatarPosterCarouselFingerprintCache_invalidateFingerprintsForContactIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() cacheKeyForContactIdentifier:v3];

  [*(id *)(a1 + 32) removeObjectForCacheKey:v4];
}

- (void)removeObjectForCacheKey:(id)a3
{
  id v5 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
    id v4 = [(CNAvatarPosterCarouselFingerprintCache *)self cache];
    [v4 setObject:0 forKey:v5];
  }
}

- (void)removeObjectForContact:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() cacheKeyForContact:v4];

  [(CNAvatarPosterCarouselFingerprintCache *)self removeObjectForCacheKey:v5];
}

- (id)fingerprintForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAvatarPosterCarouselFingerprintCache *)self cache];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setFingerprint:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNAvatarPosterCarouselFingerprintCache *)self cache];
  [v8 setObject:v7 forKey:v6];
}

- (CNAvatarPosterCarouselFingerprintCache)initWithCache:(id)a3 contactStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNAvatarPosterCarouselFingerprintCache;
  v9 = [(CNAvatarPosterCarouselFingerprintCache *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cache, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F5A5F0]) initWithContactStore:v8 delegate:v10];
    changeHistoryListener = v10->_changeHistoryListener;
    v10->_changeHistoryListener = (CNAvatarCacheChangeListener *)v11;

    [(CNAvatarCacheChangeListener *)v10->_changeHistoryListener start];
    v13 = v10;
  }

  return v10;
}

+ (CNAvatarPosterCarouselFingerprintCache)cacheWithCapacity:(unint64_t)a3 contactStore:(id)a4 resourceScheduler:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F5A360];
  id v7 = a5;
  id v8 = a4;
  id v9 = [v6 alloc];
  v10 = [MEMORY[0x1E4F5A360] boundingStrategyWithCapacity:100];
  v15[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v12 = (void *)[v9 initWithBoundingStrategies:v11 resourceScheduler:v7];

  v13 = [[CNAvatarPosterCarouselFingerprintCache alloc] initWithCache:v12 contactStore:v8];

  return v13;
}

+ (CNAvatarPosterCarouselFingerprintCache)cacheWithCapacity:(unint64_t)a3 contactStore:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F5A4E8];
  id v6 = a4;
  id v7 = [v5 synchronousSerialDispatchQueueWithName:@"com.apple.contactsui.CNAvatarPosterCarouselFingerprintCache"];
  id v8 = +[CNAvatarPosterCarouselFingerprintCache cacheWithCapacity:a3 contactStore:v6 resourceScheduler:v7];

  return (CNAvatarPosterCarouselFingerprintCache *)v8;
}

+ (id)cacheKeyForContactIdentifier:(id)a3
{
  return (id)objc_msgSend(a3, "_cn_take:", 36);
}

+ (id)cacheKeyForContact:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  id v5 = [v3 identifier];

  id v6 = [v4 cacheKeyForContactIdentifier:v5];

  return v6;
}

@end