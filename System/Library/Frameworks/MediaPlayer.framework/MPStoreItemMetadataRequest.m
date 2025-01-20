@interface MPStoreItemMetadataRequest
- (BOOL)allowLocalEquivalencies;
- (BOOL)isPersonalized;
- (BOOL)shouldIgnoreCache;
- (BOOL)shouldIgnoreExpiration;
- (BOOL)shouldRequireCachedResults;
- (ICClientInfo)clientInfo;
- (ICStorePlatformRequest)storePlatformRequest;
- (ICUserIdentity)delegatedUserIdentity;
- (ICUserIdentity)userIdentity;
- (ICUserIdentityStore)userIdentityStore;
- (MPStoreItemMetadataRequest)init;
- (NSArray)itemIdentifiers;
- (NSNumber)timeoutInterval;
- (NSString)clientIdentifier;
- (NSString)platform;
- (NSString)requestingBundleIdentifier;
- (NSString)requestingBundleVersion;
- (double)retryDelay;
- (int64_t)personalizationStyle;
- (unint64_t)reason;
- (void)setAllowLocalEquivalencies:(BOOL)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setDelegatedUserIdentity:(id)a3;
- (void)setItemIdentifiers:(id)a3;
- (void)setPersonalizationStyle:(int64_t)a3;
- (void)setPlatform:(id)a3;
- (void)setReason:(unint64_t)a3;
- (void)setRequestingBundleIdentifier:(id)a3;
- (void)setRequestingBundleVersion:(id)a3;
- (void)setRetryDelay:(double)a3;
- (void)setShouldIgnoreCache:(BOOL)a3;
- (void)setShouldIgnoreExpiration:(BOOL)a3;
- (void)setShouldRequireCachedResults:(BOOL)a3;
- (void)setTimeoutInterval:(id)a3;
- (void)setUserIdentity:(id)a3;
- (void)setUserIdentityStore:(id)a3;
@end

@implementation MPStoreItemMetadataRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityStore, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_delegatedUserIdentity, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_timeoutInterval, 0);

  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
}

- (void)setUserIdentityStore:(id)a3
{
}

- (void)setUserIdentity:(id)a3
{
}

- (void)setDelegatedUserIdentity:(id)a3
{
}

- (ICUserIdentity)delegatedUserIdentity
{
  return self->_delegatedUserIdentity;
}

- (void)setClientInfo:(id)a3
{
}

- (void)setPersonalizationStyle:(int64_t)a3
{
  self->_personalizationStyle = a3;
}

- (int64_t)personalizationStyle
{
  return self->_personalizationStyle;
}

- (void)setClientIdentifier:(id)a3
{
}

- (void)setShouldRequireCachedResults:(BOOL)a3
{
  self->_shouldRequireCachedResults = a3;
}

- (BOOL)shouldRequireCachedResults
{
  return self->_shouldRequireCachedResults;
}

- (void)setShouldIgnoreExpiration:(BOOL)a3
{
  self->_shouldIgnoreExpiration = a3;
}

- (BOOL)shouldIgnoreExpiration
{
  return self->_shouldIgnoreExpiration;
}

- (void)setShouldIgnoreCache:(BOOL)a3
{
  self->_shouldIgnoreCache = a3;
}

- (BOOL)shouldIgnoreCache
{
  return self->_shouldIgnoreCache;
}

- (void)setRetryDelay:(double)a3
{
  self->_retryDelay = a3;
}

- (double)retryDelay
{
  return self->_retryDelay;
}

- (void)setPlatform:(id)a3
{
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setTimeoutInterval:(id)a3
{
}

- (NSNumber)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setItemIdentifiers:(id)a3
{
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setAllowLocalEquivalencies:(BOOL)a3
{
  self->_allowLocalEquivalencies = a3;
}

- (BOOL)allowLocalEquivalencies
{
  return self->_allowLocalEquivalencies;
}

- (ICStorePlatformRequest)storePlatformRequest
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB8750]);
  v4 = [(MPStoreItemMetadataRequest *)self itemIdentifiers];
  [v3 setItemIdentifiers:v4];

  unint64_t v5 = [(MPStoreItemMetadataRequest *)self reason];
  if (v5 - 1 > 2) {
    v6 = (void *)MEMORY[0x1E4FB84F0];
  }
  else {
    v6 = (void *)qword_1E57EE090[v5 - 1];
  }
  [v3 setKeyProfile:*v6];
  unint64_t v7 = [(MPStoreItemMetadataRequest *)self personalizationStyle];
  if (v7 >= 3) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = v7;
  }
  [v3 setPersonalizationStyle:v8];
  objc_msgSend(v3, "setReturnsLocalEquivalencies:", -[MPStoreItemMetadataRequest allowLocalEquivalencies](self, "allowLocalEquivalencies"));
  [(MPStoreItemMetadataRequest *)self retryDelay];
  objc_msgSend(v3, "setRetryDelay:");
  id v9 = objc_alloc(MEMORY[0x1E4FB8758]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__MPStoreItemMetadataRequest_storePlatformRequest__block_invoke;
  v13[3] = &unk_1E57F7888;
  v13[4] = self;
  v10 = (void *)[v9 initWithBlock:v13];
  [v3 setRequestContext:v10];
  if ([(NSString *)self->_clientIdentifier length]) {
    [v3 setClientIdentifier:self->_clientIdentifier];
  }
  if ([(NSString *)self->_platform length]) {
    [v3 setPlatformIdentifier:self->_platform];
  }
  timeoutInterval = self->_timeoutInterval;
  if (timeoutInterval)
  {
    [(NSNumber *)timeoutInterval doubleValue];
    objc_msgSend(v3, "setTimeoutInterval:");
  }
  if (self->_shouldIgnoreCache) {
    [v3 setShouldIgnoreCache:1];
  }

  return (ICStorePlatformRequest *)v3;
}

void __50__MPStoreItemMetadataRequest_storePlatformRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  unint64_t v5 = [v3 delegatedUserIdentity];
  [v4 setDelegatedIdentity:v5];

  v6 = [*(id *)(a1 + 32) userIdentity];
  [v4 setIdentity:v6];

  unint64_t v7 = [*(id *)(a1 + 32) userIdentityStore];
  [v4 setIdentityStore:v7];

  id v8 = [*(id *)(a1 + 32) clientInfo];
  [v4 setClientInfo:v8];
}

- (ICUserIdentityStore)userIdentityStore
{
  userIdentityStore = self->_userIdentityStore;
  if (userIdentityStore)
  {
    id v3 = userIdentityStore;
  }
  else
  {
    id v3 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  }

  return v3;
}

- (ICUserIdentity)userIdentity
{
  userIdentity = self->_userIdentity;
  if (!userIdentity)
  {
    id v4 = [MEMORY[0x1E4FB87B8] activeAccount];
    unint64_t v5 = self->_userIdentity;
    self->_userIdentity = v4;

    userIdentity = self->_userIdentity;
  }

  return userIdentity;
}

- (void)setRequestingBundleVersion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MPStoreItemMetadataRequest *)self clientInfo];
  id v8 = (id)[v5 mutableCopy];

  [v8 setRequestingBundleVersion:v4];
  v6 = (ICClientInfo *)[v8 copy];
  clientInfo = self->_clientInfo;
  self->_clientInfo = v6;
}

- (void)setRequestingBundleIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MPStoreItemMetadataRequest *)self clientInfo];
  id v8 = (id)[v5 mutableCopy];

  [v8 setRequestingBundleIdentifier:v4];
  v6 = (ICClientInfo *)[v8 copy];
  clientInfo = self->_clientInfo;
  self->_clientInfo = v6;
}

- (NSString)requestingBundleVersion
{
  v2 = [(ICClientInfo *)self->_clientInfo requestingBundleVersion];
  id v3 = v2;
  if (!v2) {
    v2 = &stru_1EE680640;
  }
  id v4 = v2;

  return v4;
}

- (NSString)requestingBundleIdentifier
{
  v2 = [(ICClientInfo *)self->_clientInfo requestingBundleIdentifier];
  id v3 = v2;
  if (!v2) {
    v2 = &stru_1EE680640;
  }
  id v4 = v2;

  return v4;
}

- (NSArray)itemIdentifiers
{
  if (self->_itemIdentifiers) {
    return self->_itemIdentifiers;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (BOOL)isPersonalized
{
  return self->_personalizationStyle != 0;
}

- (ICClientInfo)clientInfo
{
  clientInfo = self->_clientInfo;
  if (clientInfo)
  {
    id v3 = clientInfo;
  }
  else
  {
    id v3 = [MEMORY[0x1E4FB85B0] defaultInfo];
  }

  return v3;
}

- (NSString)clientIdentifier
{
  if (self->_clientIdentifier) {
    return self->_clientIdentifier;
  }
  else {
    return (NSString *)&stru_1EE680640;
  }
}

- (MPStoreItemMetadataRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPStoreItemMetadataRequest;
  result = [(MPStoreItemMetadataRequest *)&v3 init];
  if (result) {
    result->_retryDelay = 5.0;
  }
  return result;
}

@end