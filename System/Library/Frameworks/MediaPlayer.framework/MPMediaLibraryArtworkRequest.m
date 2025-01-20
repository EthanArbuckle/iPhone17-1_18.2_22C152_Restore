@interface MPMediaLibraryArtworkRequest
+ (id)artworkTokenWithParameters:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ICUserIdentity)userIdentity;
- (ML3MusicLibrary)musicLibrary;
- (MPMediaLibrary)library;
- (MPMediaLibraryArtwork)libraryArtwork;
- (MPMediaLibraryArtworkRequest)initWithLibrary:(id)a3 identifier:(unint64_t)a4 entityType:(int64_t)a5 artworkType:(int64_t)a6;
- (MPMediaLibraryArtworkRequest)initWithLibrary:(id)a3 identifier:(unint64_t)a4 entityType:(int64_t)a5 artworkType:(int64_t)a6 mediaType:(unint64_t)a7;
- (NSNumber)fetchableArtworkSource;
- (NSString)availableArtworkToken;
- (NSString)description;
- (NSString)fetchableArtworkToken;
- (double)retrievalTime;
- (id)_onQueue_musicLibrary;
- (id)artworkTokenParameters;
- (int64_t)artworkType;
- (int64_t)entityType;
- (unint64_t)hash;
- (unint64_t)libraryID;
- (unint64_t)mediaType;
- (void)_onQueue_updateTokens;
- (void)clearFailedFetchableToken;
- (void)promoteFetchableArtworkTokenIfNeeded;
- (void)setAvailableArtworkToken:(id)a3;
- (void)setFetchableArtworkSource:(id)a3;
- (void)setFetchableArtworkToken:(id)a3;
- (void)setLibraryArtwork:(id)a3;
- (void)setRetrievalTime:(double)a3;
@end

@implementation MPMediaLibraryArtworkRequest

- (void)setFetchableArtworkToken:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSString *)[v5 copy];

  fetchableArtworkToken = self->_fetchableArtworkToken;
  self->_fetchableArtworkToken = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setFetchableArtworkSource:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSNumber *)[v5 copy];

  fetchableArtworkSource = self->_fetchableArtworkSource;
  self->_fetchableArtworkSource = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setAvailableArtworkToken:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSString *)[v5 copy];

  availableArtworkToken = self->_availableArtworkToken;
  self->_availableArtworkToken = v6;

  os_unfair_lock_unlock(p_lock);
}

- (MPMediaLibraryArtworkRequest)initWithLibrary:(id)a3 identifier:(unint64_t)a4 entityType:(int64_t)a5 artworkType:(int64_t)a6
{
  id v10 = a3;
  v11 = v10;
  if (a6 == 4)
  {
    uint64_t v12 = 0;
  }
  else
  {
    v13 = [v10 itemWithPersistentID:a4 verifyExistence:0];
    uint64_t v12 = [v13 mediaType];
  }
  v14 = [(MPMediaLibraryArtworkRequest *)self initWithLibrary:v11 identifier:a4 entityType:a5 artworkType:a6 mediaType:v12];

  return v14;
}

- (MPMediaLibraryArtworkRequest)initWithLibrary:(id)a3 identifier:(unint64_t)a4 entityType:(int64_t)a5 artworkType:(int64_t)a6 mediaType:(unint64_t)a7
{
  id v13 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MPMediaLibraryArtworkRequest;
  v14 = [(MPMediaLibraryArtworkRequest *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_library, a3);
    v15->_libraryID = a4;
    v15->_artworkType = a6;
    v15->_entityType = a5;
    v15->_mediaType = a7;
    uint64_t v16 = [v13 userIdentity];
    userIdentity = v15->_userIdentity;
    v15->_userIdentity = (ICUserIdentity *)v16;
  }
  return v15;
}

- (NSString)fetchableArtworkToken
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  fetchableArtworkToken = self->_fetchableArtworkToken;
  if (!fetchableArtworkToken)
  {
    if (self->_hasRetrievedTokens)
    {
      fetchableArtworkToken = 0;
    }
    else
    {
      [(MPMediaLibraryArtworkRequest *)self _onQueue_updateTokens];
      fetchableArtworkToken = self->_fetchableArtworkToken;
    }
  }
  id v5 = fetchableArtworkToken;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (NSString)availableArtworkToken
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  availableArtworkToken = self->_availableArtworkToken;
  if (!availableArtworkToken)
  {
    if (self->_hasRetrievedTokens)
    {
      availableArtworkToken = 0;
    }
    else
    {
      [(MPMediaLibraryArtworkRequest *)self _onQueue_updateTokens];
      availableArtworkToken = self->_availableArtworkToken;
    }
  }
  id v5 = availableArtworkToken;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (int64_t)artworkType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t artworkType = self->_artworkType;
  os_unfair_lock_unlock(p_lock);
  return artworkType;
}

- (void)_onQueue_updateTokens
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = [(MPMediaLibraryArtworkRequest *)self _onQueue_musicLibrary];
  int64_t entityType = self->_entityType;
  unint64_t libraryID = self->_libraryID;
  int64_t artworkType = self->_artworkType;
  double retrievalTime = self->_retrievalTime;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__MPMediaLibraryArtworkRequest__onQueue_updateTokens__block_invoke;
  v8[3] = &unk_1E57F50E0;
  v8[4] = self;
  [v3 retrieveBestArtworkTokensForEntityPersistentID:libraryID entityType:entityType artworkType:artworkType retrievalTime:v8 completionHandler:retrievalTime];
}

- (id)_onQueue_musicLibrary
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = [(MPMediaLibrary *)self->_library libraryDataProvider];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 library];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __53__MPMediaLibraryArtworkRequest__onQueue_updateTokens__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(*(void *)(a1 + 32) + 8));
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v17 = v7;

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 48);
  *(void *)(v11 + 48) = v8;
  id v13 = v8;

  uint64_t v14 = [NSNumber numberWithInteger:a4];
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void **)(v15 + 56);
  *(void *)(v15 + 56) = v14;

  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
}

- (MPMediaLibraryArtwork)libraryArtwork
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_libraryArtwork;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setLibraryArtwork:(id)a3
{
  v4 = (MPMediaLibraryArtwork *)a3;
  os_unfair_lock_lock(&self->_lock);
  libraryArtwork = self->_libraryArtwork;
  self->_libraryArtwork = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)mediaType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_artworkType == 4)
  {
    unint64_t mediaType = -1;
  }
  else
  {
    unint64_t mediaType = self->_mediaType;
    if (!mediaType)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F79B50]);
      unint64_t libraryID = self->_libraryID;
      id v7 = [(MPMediaLibraryArtworkRequest *)self _onQueue_musicLibrary];
      id v8 = (void *)[v5 initWithPersistentID:libraryID inLibrary:v7];

      uint64_t v9 = [v8 valueForProperty:*MEMORY[0x1E4F797A8]];
      LODWORD(v7) = [v9 unsignedIntValue];

      self->_unint64_t mediaType = MPMediaTypeForMLMediaType(v7);
      unint64_t mediaType = self->_mediaType;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return mediaType;
}

- (ML3MusicLibrary)musicLibrary
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(MPMediaLibraryArtworkRequest *)self _onQueue_musicLibrary];
  os_unfair_lock_unlock(p_lock);

  return (ML3MusicLibrary *)v4;
}

- (unint64_t)libraryID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t libraryID = self->_libraryID;
  os_unfair_lock_unlock(p_lock);
  return libraryID;
}

- (int64_t)entityType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t entityType = self->_entityType;
  os_unfair_lock_unlock(p_lock);
  return entityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_libraryArtwork, 0);
  objc_storeStrong((id *)&self->_fetchableArtworkSource, 0);
  objc_storeStrong((id *)&self->_fetchableArtworkToken, 0);

  objc_storeStrong((id *)&self->_availableArtworkToken, 0);
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (MPMediaLibrary)library
{
  return self->_library;
}

- (void)promoteFetchableArtworkTokenIfNeeded
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  fetchableArtworkToken = self->_fetchableArtworkToken;
  if (fetchableArtworkToken)
  {
    objc_storeStrong((id *)&self->_availableArtworkToken, fetchableArtworkToken);
    libraryArtwork = self->_libraryArtwork;
    self->_libraryArtwork = 0;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)clearFailedFetchableToken
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  fetchableArtworkToken = self->_fetchableArtworkToken;
  self->_fetchableArtworkToken = 0;

  fetchableArtworkSource = self->_fetchableArtworkSource;
  self->_fetchableArtworkSource = 0;

  self->_hasRetrievedTokens = 1;

  os_unfair_lock_unlock(p_lock);
}

- (id)artworkTokenParameters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(MPMediaLibrary *)self->_library uniqueIdentifier];
  if (v5) {
    [v3 setObject:v5 forKey:@"lid"];
  }
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", self->_libraryID);
  if (v6) {
    [v3 setObject:v6 forKey:@"id"];
  }
  int64_t entityType = self->_entityType;
  if (entityType)
  {
    uint64_t v8 = 0;
    uint64_t v9 = _MPMediaEntityTypeDescriptions;
    while (1)
    {
      uint64_t v10 = *v9;
      v9 += 2;
      if (v10 == entityType) {
        break;
      }
      if (++v8 == 7) {
        goto LABEL_11;
      }
    }
    id v11 = (id)_MPMediaEntityTypeDescriptions[2 * v8 + 1];
    [v3 setObject:v11 forKey:@"et"];
  }
LABEL_11:
  int64_t artworkType = self->_artworkType;
  if (artworkType)
  {
    id v13 = _NSStringFromMPMediaLibraryArtworkType(artworkType);
    if (v13) {
      [v3 setObject:v13 forKey:@"at"];
    }
  }
  uint64_t v14 = _NSStringFromMPMediaType(self->_mediaType, @",");
  if (v14) {
    [v3 setObject:v14 forKey:@"mt"];
  }
  if (self->_retrievalTime > 0.00000011920929)
  {
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&self->_retrievalTime);
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      [v3 setObject:v15 forKey:@"rt"];
    }
  }
  availableArtworkToken = self->_availableArtworkToken;
  if (availableArtworkToken) {
    [v3 setObject:availableArtworkToken forKey:@"aat"];
  }
  fetchableArtworkToken = self->_fetchableArtworkToken;
  if (fetchableArtworkToken) {
    [v3 setObject:fetchableArtworkToken forKey:@"fat"];
  }
  NSInteger v19 = [(NSNumber *)self->_fetchableArtworkSource integerValue];
  if (v19)
  {
    uint64_t v20 = 0;
    v21 = _MPMediaLibraryArtworkSourceTypeDescriptions;
    while (1)
    {
      uint64_t v22 = *v21;
      v21 += 2;
      if (v22 == v19) {
        break;
      }
      if (++v20 == 7) {
        goto LABEL_30;
      }
    }
    id v23 = (id)_MPMediaLibraryArtworkSourceTypeDescriptions[2 * v20 + 1];
    [v3 setObject:v23 forKey:@"fas"];
  }
LABEL_30:
  os_unfair_lock_unlock(p_lock);

  return v3;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p libraryID=%llu entityType=%ld artworkType=%ld", objc_opt_class(), self, -[MPMediaLibraryArtworkRequest libraryID](self, "libraryID"), -[MPMediaLibraryArtworkRequest entityType](self, "entityType"), -[MPMediaLibraryArtworkRequest artworkType](self, "artworkType")];
  [(MPMediaLibraryArtworkRequest *)self retrievalTime];
  if (v4 > 0.0)
  {
    [(MPMediaLibraryArtworkRequest *)self retrievalTime];
    objc_msgSend(v3, "appendFormat:", @" retrievalTime=%f", v5);
  }
  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 libraryID];
    unint64_t v7 = [(MPMediaLibraryArtworkRequest *)self libraryID];
    uint64_t v8 = [v5 entityType];
    int64_t v9 = [(MPMediaLibraryArtworkRequest *)self entityType];
    uint64_t v10 = [v5 artworkType];
    int64_t v11 = [(MPMediaLibraryArtworkRequest *)self artworkType];
    [v5 retrievalTime];
    double v13 = v12;
    [(MPMediaLibraryArtworkRequest *)self retrievalTime];
    BOOL v16 = v13 == v14 && v10 == v11;
    if (v8 != v9) {
      BOOL v16 = 0;
    }
    BOOL v17 = v6 == v7 && v16;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  os_unfair_lock_lock(&self->_lock);
  int64_t entityType = self->_entityType;
  unint64_t libraryID = self->_libraryID;
  uint64_t v11 = v5 ^ 0x7465646279746573 ^ libraryID;
  uint64_t v12 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v13 = v8 + v11;
  uint64_t v14 = (v8 + v11) ^ __ROR8__(v11, 48);
  uint64_t v15 = v14 + __ROR8__(v6 + v7, 32);
  uint64_t v16 = v15 ^ __ROR8__(v14, 43);
  uint64_t v17 = v13 + v12;
  uint64_t v18 = v17 ^ __ROR8__(v12, 47);
  unint64_t v19 = v15 ^ libraryID;
  int64_t artworkType = self->_artworkType;
  int64_t v21 = v16 ^ artworkType;
  unint64_t v22 = v19 + v18;
  uint64_t v23 = v22 ^ __ROR8__(v18, 51);
  int64_t v24 = __ROR8__(v17, 32) + v21;
  uint64_t v25 = __ROR8__(v21, 48);
  int64_t v26 = (v24 ^ v25) + __ROR8__(v22, 32);
  uint64_t v27 = v26 ^ __ROR8__(v24 ^ v25, 43);
  uint64_t v28 = v24 + v23;
  int64_t v71 = v26 ^ artworkType;
  uint64_t v74 = v28 ^ __ROR8__(v23, 47);
  int64_t v29 = ((v26 ^ artworkType) + v74) ^ __ROR8__(v74, 51);
  int64_t v30 = __ROR8__(v28, 32) + (v27 ^ entityType);
  uint64_t v31 = __ROR8__(v27 ^ entityType, 48);
  int64_t v32 = (v30 ^ v31) + __ROR8__(v71 + v74, 32);
  int64_t v33 = v32 ^ __ROR8__(v30 ^ v31, 43);
  int64_t v34 = v30 + v29;
  int64_t v72 = v32 ^ entityType;
  int64_t v75 = v34 ^ __ROR8__(v29, 47);
  unint64_t retrievalTime = (unint64_t)self->_retrievalTime;
  int64_t v36 = (v72 + v75) ^ __ROR8__(v75, 51);
  unint64_t v37 = __ROR8__(v34, 32) + (v33 ^ retrievalTime);
  uint64_t v38 = __ROR8__(v33 ^ retrievalTime, 48);
  unint64_t v39 = (v37 ^ v38) + __ROR8__(v72 + v75, 32);
  unint64_t v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
  unint64_t v41 = v37 + v36;
  uint64_t v77 = __ROR8__(v41, 32);
  unint64_t v78 = v40;
  unint64_t v73 = v39 ^ retrievalTime;
  uint64_t v76 = v41 ^ __ROR8__(v36, 47);
  os_unfair_lock_unlock(&self->_lock);
  unint64_t v42 = (v73 + v76) ^ __ROR8__(v76, 51);
  uint64_t v43 = v77 + (v78 ^ 0x2000000000000000);
  uint64_t v44 = __ROR8__(v78 ^ 0x2000000000000000, 48);
  uint64_t v45 = (v43 ^ v44) + __ROR8__(v73 + v76, 32);
  uint64_t v46 = v45 ^ __ROR8__(v43 ^ v44, 43);
  uint64_t v47 = v43 + v42;
  uint64_t v48 = v47 ^ __ROR8__(v42, 47);
  uint64_t v49 = (v45 ^ 0x2000000000000000) + v48;
  uint64_t v50 = v49 ^ __ROR8__(v48, 51);
  uint64_t v51 = (__ROR8__(v47, 32) ^ 0xFFLL) + v46;
  uint64_t v52 = __ROR8__(v46, 48);
  uint64_t v53 = __ROR8__(v49, 32) + (v51 ^ v52);
  uint64_t v54 = v53 ^ __ROR8__(v51 ^ v52, 43);
  uint64_t v55 = v50 + v51;
  uint64_t v56 = v55 ^ __ROR8__(v50, 47);
  uint64_t v57 = v56 + v53;
  uint64_t v58 = v57 ^ __ROR8__(v56, 51);
  uint64_t v59 = __ROR8__(v55, 32) + v54;
  uint64_t v60 = __ROR8__(v54, 48);
  uint64_t v61 = __ROR8__(v57, 32) + (v59 ^ v60);
  uint64_t v62 = v61 ^ __ROR8__(v59 ^ v60, 43);
  uint64_t v63 = v58 + v59;
  uint64_t v64 = v63 ^ __ROR8__(v58, 47);
  uint64_t v65 = v64 + v61;
  uint64_t v66 = v65 ^ __ROR8__(v64, 51);
  uint64_t v67 = __ROR8__(v63, 32) + v62;
  uint64_t v68 = __ROR8__(v62, 48);
  uint64_t v69 = __ROR8__(v65, 32) + (v67 ^ v68);
  return (v66 + v67) ^ __ROR8__(v66, 47) ^ v69 ^ __ROR8__(v66 + v67, 32) ^ v69 ^ __ROR8__(v67 ^ v68, 43);
}

- (void)setRetrievalTime:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t retrievalTime = a3;

  os_unfair_lock_unlock(p_lock);
}

- (double)retrievalTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double retrievalTime = self->_retrievalTime;
  os_unfair_lock_unlock(p_lock);
  return retrievalTime;
}

- (NSNumber)fetchableArtworkSource
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  fetchableArtworkSource = self->_fetchableArtworkSource;
  if (!fetchableArtworkSource)
  {
    if (self->_hasRetrievedTokens)
    {
      fetchableArtworkSource = 0;
    }
    else
    {
      [(MPMediaLibraryArtworkRequest *)self _onQueue_updateTokens];
      fetchableArtworkSource = self->_fetchableArtworkSource;
    }
  }
  uint64_t v5 = fetchableArtworkSource;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

+ (id)artworkTokenWithParameters:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v49 = [v4 objectForKey:@"lid"];
  uint64_t v51 = +[MPMediaLibrary mediaLibraryWithUniqueIdentifier:allowsLoadingFromDisk:](MPMediaLibrary, "mediaLibraryWithUniqueIdentifier:allowsLoadingFromDisk:");
  id v48 = [v4 objectForKey:@"id"];
  unint64_t v5 = strtoull((const char *)[v48 UTF8String], 0, 0);
  id v6 = [v4 objectForKey:@"et"];
  uint64_t v7 = 0;
  uint64_t v8 = (id *)&off_1E57F51A8;
  while (1)
  {
    id v9 = *v8;
    if (v9 == v6) {
      break;
    }
    uint64_t v10 = v9;
    int v11 = [v6 isEqual:v9];

    if (v11) {
      goto LABEL_7;
    }
    ++v7;
    v8 += 2;
    if (v7 == 7)
    {
      uint64_t v12 = 0;
      goto LABEL_8;
    }
  }

LABEL_7:
  uint64_t v12 = _MPMediaEntityTypeDescriptions[2 * v7];
LABEL_8:

  id v13 = [v4 objectForKey:@"at"];
  uint64_t v14 = 0;
  uint64_t v15 = (id *)&off_1E57F5218;
  while (1)
  {
    id v16 = *v15;
    if (v16 == v13) {
      break;
    }
    uint64_t v17 = v16;
    int v18 = [v13 isEqual:v16];

    if (v18) {
      goto LABEL_14;
    }
    ++v14;
    v15 += 2;
    if (v14 == 6)
    {
      uint64_t v19 = 0;
      goto LABEL_15;
    }
  }

LABEL_14:
  uint64_t v19 = _MPMediaLibraryArtworkTypeDescriptions[2 * v14];
LABEL_15:

  id v20 = [v4 objectForKey:@"mt"];
  int64_t v21 = @",";
  id v50 = v4;
  if ([v20 isEqualToString:@"anyMedia"])
  {
    uint64_t v22 = -1;
  }
  else
  {
    id v47 = a1;
    id v46 = v20;
    [v20 componentsSeparatedByString:@","];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v22 = 0;
      uint64_t v25 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v54 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = 0;
          uint64_t v28 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          do
          {
            if ([v28 isEqualToString:_NSStringFromMPMediaType_strings1[v27]]) {
              v22 |= _NSStringFromMPMediaType_types1[v27];
            }
            ++v27;
          }
          while (v27 != 6);
          for (uint64_t j = 0; j != 7; ++j)
          {
            if ([v28 isEqualToString:_NSStringFromMPMediaType_strings2[j]]) {
              v22 |= _NSStringFromMPMediaType_types2[j];
            }
          }
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v24);
    }
    else
    {
      uint64_t v22 = 0;
    }

    id v4 = v50;
    a1 = v47;
    id v20 = v46;
  }

  int64_t v30 = (void *)[objc_alloc((Class)a1) initWithLibrary:v51 identifier:v5 entityType:v12 artworkType:v19 mediaType:v22];
  uint64_t v31 = [v4 objectForKey:@"rt"];
  int64_t v32 = v31;
  if (v31)
  {
    [v31 doubleValue];
    objc_msgSend(v30, "setRetrievalTime:");
  }
  int64_t v33 = [v4 objectForKey:@"aat"];
  if (v33) {
    [v30 setAvailableArtworkToken:v33];
  }
  int64_t v34 = [v4 objectForKey:@"fat"];
  if (v34) {
    [v30 setFetchableArtworkToken:v34];
  }
  v35 = [v4 objectForKey:@"fas"];
  int64_t v36 = v35;
  if (v35)
  {
    id v37 = v35;
    uint64_t v38 = 0;
    unint64_t v39 = (id *)&off_1E57F5278;
    while (1)
    {
      id v40 = *v39;
      if (v40 == v37) {
        break;
      }
      unint64_t v41 = v40;
      int v42 = [v37 isEqual:v40];

      if (v42) {
        goto LABEL_48;
      }
      ++v38;
      v39 += 2;
      if (v38 == 7)
      {
        uint64_t v43 = 0;
        goto LABEL_49;
      }
    }

LABEL_48:
    uint64_t v43 = _MPMediaLibraryArtworkSourceTypeDescriptions[2 * v38];
LABEL_49:

    uint64_t v44 = [NSNumber numberWithInteger:v43];
    [v30 setFetchableArtworkSource:v44];

    id v4 = v50;
  }

  return v30;
}

@end