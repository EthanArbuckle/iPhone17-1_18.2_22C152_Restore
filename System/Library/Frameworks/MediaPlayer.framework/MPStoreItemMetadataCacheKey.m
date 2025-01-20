@interface MPStoreItemMetadataCacheKey
+ (void)_fastGetCacheKeyWithRequest:(id)a3 completionHandler:(id)a4;
+ (void)_slowGetCacheKeyWithRequest:(id)a3 completionHandler:(id)a4;
+ (void)getCacheKeyWithRequest:(id)a3 completionHandler:(id)a4;
- (BOOL)_isGoodCacheKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPersonalized;
- (MPStoreItemMetadataCacheKey)initWithRequest:(id)a3 response:(id)a4;
- (NSNumber)accountIdentifier;
- (NSNumber)enqueuerAccountIdentifier;
- (NSString)storefrontIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setAccountIdentifier:(id)a3;
- (void)setEnqueuerAccountIdentifier:(id)a3;
- (void)setPersonalized:(BOOL)a3;
- (void)setStorefrontIdentifier:(id)a3;
@end

@implementation MPStoreItemMetadataCacheKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_enqueuerAccountIdentifier, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

- (void)setStorefrontIdentifier:(id)a3
{
}

- (NSString)storefrontIdentifier
{
  return self->_storefrontIdentifier;
}

- (void)setPersonalized:(BOOL)a3
{
  self->_personalized = a3;
}

- (BOOL)isPersonalized
{
  return self->_personalized;
}

- (void)setEnqueuerAccountIdentifier:(id)a3
{
}

- (NSNumber)enqueuerAccountIdentifier
{
  return self->_enqueuerAccountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (BOOL)_isGoodCacheKey
{
  NSUInteger v3 = [(NSString *)self->_storefrontIdentifier length];
  if (v3) {
    LOBYTE(v3) = !self->_personalized || self->_accountIdentifier || self->_enqueuerAccountIdentifier != 0;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MPStoreItemMetadataCacheKey *)a3;
  if (self == v4) {
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_personalized != v4->_personalized) {
    goto LABEL_16;
  }
  accountIdentifier = self->_accountIdentifier;
  v6 = v4->_accountIdentifier;
  if (accountIdentifier != v6)
  {
    char v7 = 0;
    if (!accountIdentifier || !v6) {
      goto LABEL_18;
    }
    if (!-[NSNumber isEqualToNumber:](accountIdentifier, "isEqualToNumber:")) {
      goto LABEL_16;
    }
  }
  enqueuerAccountIdentifier = self->_enqueuerAccountIdentifier;
  v9 = v4->_enqueuerAccountIdentifier;
  if (enqueuerAccountIdentifier != v9)
  {
    char v7 = 0;
    if (!enqueuerAccountIdentifier || !v9) {
      goto LABEL_18;
    }
    if (!-[NSNumber isEqualToNumber:](enqueuerAccountIdentifier, "isEqualToNumber:"))
    {
LABEL_16:
      char v7 = 0;
      goto LABEL_18;
    }
  }
  storefrontIdentifier = self->_storefrontIdentifier;
  v11 = v4->_storefrontIdentifier;
  if (storefrontIdentifier == v11)
  {
LABEL_17:
    char v7 = 1;
    goto LABEL_18;
  }
  char v7 = 0;
  if (storefrontIdentifier && v11) {
    char v7 = -[NSString isEqualToString:](storefrontIdentifier, "isEqualToString:");
  }
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_accountIdentifier hash];
  uint64_t v4 = [(NSNumber *)self->_enqueuerAccountIdentifier hash] ^ v3;
  BOOL personalized = self->_personalized;
  return v4 ^ personalized ^ [(NSString *)self->_storefrontIdentifier hash];
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MPStoreItemMetadataCacheKey;
  uint64_t v4 = [(MPStoreItemMetadataCacheKey *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: [Account: %@, Enqueuer: %@, Personalized? %d, Storefront: %@]", v4, self->_accountIdentifier, self->_enqueuerAccountIdentifier, self->_personalized, self->_storefrontIdentifier];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSNumber *)self->_accountIdentifier copyWithZone:a3];
    objc_super v7 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v6;

    uint64_t v8 = [(NSNumber *)self->_enqueuerAccountIdentifier copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    *(unsigned char *)(v5 + 8) = self->_personalized;
    uint64_t v10 = [(NSString *)self->_storefrontIdentifier copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;
  }
  return (id)v5;
}

- (MPStoreItemMetadataCacheKey)initWithRequest:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MPStoreItemMetadataCacheKey;
  uint64_t v8 = [(MPStoreItemMetadataCacheKey *)&v18 init];
  if (v8)
  {
    v9 = [v7 storefrontIdentifier];
    uint64_t v10 = v9;
    if (v9)
    {
      uint64_t v11 = MPStoreItemMetadataCacheableStorefrontForStorefront(v9);
      storefrontIdentifier = v8->_storefrontIdentifier;
      v8->_storefrontIdentifier = (NSString *)v11;
    }
    if ([v6 isPersonalized])
    {
      uint64_t v13 = [v7 accountIdentifier];
      accountIdentifier = v8->_accountIdentifier;
      v8->_accountIdentifier = (NSNumber *)v13;

      uint64_t v15 = [v7 enqueuerAccountIdentifier];
      enqueuerAccountIdentifier = v8->_enqueuerAccountIdentifier;
      v8->_enqueuerAccountIdentifier = (NSNumber *)v15;

      v8->_BOOL personalized = 1;
    }
  }
  return v8;
}

+ (void)_slowGetCacheKeyWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"https:///"];
  id v8 = objc_alloc(MEMORY[0x1E4FB8758]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__MPStoreItemMetadataCacheKey__slowGetCacheKeyWithRequest_completionHandler___block_invoke;
  v17[3] = &unk_1E57F7888;
  id v9 = v5;
  id v18 = v9;
  uint64_t v10 = (void *)[v8 initWithBlock:v17];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB8760]) initWithURL:v7 requestContext:v10];
  [v11 setAnisetteVersion:0];
  [v11 setShouldUseMescalSigning:0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__MPStoreItemMetadataCacheKey__slowGetCacheKeyWithRequest_completionHandler___block_invoke_2;
  v14[3] = &unk_1E57F78B0;
  id v15 = v9;
  id v16 = v6;
  id v12 = v6;
  id v13 = v9;
  [v11 buildURLRequestWithCompletionHandler:v14];
}

void __77__MPStoreItemMetadataCacheKey__slowGetCacheKeyWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) delegatedUserIdentity];
  if (v3) {
    [v6 setDelegatedIdentity:v3];
  }
  uint64_t v4 = [*(id *)(a1 + 32) userIdentity];
  if (v4) {
    [v6 setIdentity:v4];
  }
  id v5 = [*(id *)(a1 + 32) userIdentityStore];
  if (v5) {
    [v6 setIdentityStore:v5];
  }
}

void __77__MPStoreItemMetadataCacheKey__slowGetCacheKeyWithRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = objc_alloc_init(MPStoreItemMetadataCacheKey);
  int v4 = [*(id *)(a1 + 32) isPersonalized];
  id v5 = v13;
  if (v4)
  {
    id v6 = objc_msgSend(v13, "ic_valueForHTTPHeaderField:", *MEMORY[0x1E4FB84B8]);
    if ([v6 length])
    {
      id v7 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v6, "longLongValue"));
      [(MPStoreItemMetadataCacheKey *)v3 setAccountIdentifier:v7];
    }
    id v8 = objc_msgSend(v13, "ic_valueForHTTPHeaderField:", *MEMORY[0x1E4FB84C0]);
    if ([v8 length])
    {
      id v9 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v8, "longLongValue"));
      [(MPStoreItemMetadataCacheKey *)v3 setAccountIdentifier:v9];
    }
    [(MPStoreItemMetadataCacheKey *)v3 setPersonalized:1];

    id v5 = v13;
  }
  uint64_t v10 = objc_msgSend(v5, "ic_valueForHTTPHeaderField:", *MEMORY[0x1E4FB84B0]);
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = MPStoreItemMetadataCacheableStorefrontForStorefront(v10);
    [(MPStoreItemMetadataCacheKey *)v3 setStorefrontIdentifier:v12];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)_fastGetCacheKeyWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_group_create();
  id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v9 = dispatch_queue_create("com.apple.MediaPlayer.MPStoreItemMetadataCacheKey", v8);

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__47207;
  v24[4] = __Block_byref_object_dispose__47208;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__47207;
  v22[4] = __Block_byref_object_dispose__47208;
  id v23 = 0;
  uint64_t v10 = [v5 userIdentityStore];
  if (v10)
  {
    uint64_t v11 = [v5 userIdentity];
    if (v11)
    {
      dispatch_group_enter(v7);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __77__MPStoreItemMetadataCacheKey__fastGetCacheKeyWithRequest_completionHandler___block_invoke;
      v21[3] = &unk_1E57F7838;
      v21[4] = v7;
      v21[5] = v22;
      [v10 getPropertiesForUserIdentity:v11 completionHandler:v21];
    }
    id v12 = [v5 delegatedUserIdentity];
    if (v12)
    {
      dispatch_group_enter(v7);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __77__MPStoreItemMetadataCacheKey__fastGetCacheKeyWithRequest_completionHandler___block_invoke_2;
      v20[3] = &unk_1E57F7838;
      v20[4] = v7;
      v20[5] = v24;
      [v10 getPropertiesForUserIdentity:v12 completionHandler:v20];
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__MPStoreItemMetadataCacheKey__fastGetCacheKeyWithRequest_completionHandler___block_invoke_3;
  v15[3] = &unk_1E57F7860;
  id v18 = v22;
  v19 = v24;
  id v16 = v5;
  id v17 = v6;
  id v13 = v6;
  id v14 = v5;
  dispatch_group_notify(v7, v9, v15);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
}

void __77__MPStoreItemMetadataCacheKey__fastGetCacheKeyWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__MPStoreItemMetadataCacheKey__fastGetCacheKeyWithRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isDelegated]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__MPStoreItemMetadataCacheKey__fastGetCacheKeyWithRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = objc_alloc_init(MPStoreItemMetadataCacheKey);
  if ([*(id *)(a1 + 32) isPersonalized])
  {
    v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) DSID];
    [(MPStoreItemMetadataCacheKey *)v10 setAccountIdentifier:v2];

    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) DSID];
    [(MPStoreItemMetadataCacheKey *)v10 setEnqueuerAccountIdentifier:v3];

    [(MPStoreItemMetadataCacheKey *)v10 setPersonalized:1];
  }
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v4 || (id v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) != 0)
  {
    id v5 = [v4 storefrontIdentifier];
    id v6 = v5;
LABEL_6:
    id v7 = MPStoreItemMetadataCacheableStorefrontForStorefront(v5);
    goto LABEL_7;
  }
  id v8 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  id v9 = [v8 localStoreAccountProperties];
  id v6 = [v9 storefrontIdentifier];

  if (v6)
  {
    id v5 = v6;
    goto LABEL_6;
  }
  id v7 = 0;
LABEL_7:

  [(MPStoreItemMetadataCacheKey *)v10 setStorefrontIdentifier:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)getCacheKeyWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__MPStoreItemMetadataCacheKey_getCacheKeyWithRequest_completionHandler___block_invoke;
  v10[3] = &unk_1E57F7810;
  id v12 = v7;
  id v13 = a1;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [a1 _fastGetCacheKeyWithRequest:v8 completionHandler:v10];
}

void __72__MPStoreItemMetadataCacheKey_getCacheKeyWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _isGoodCacheKey]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    [*(id *)(a1 + 48) _slowGetCacheKeyWithRequest:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
}

@end