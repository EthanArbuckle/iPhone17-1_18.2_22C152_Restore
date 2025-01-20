@interface CPLMomentShare
+ (BOOL)supportsSecureCoding;
+ (id)cplAdditionalSecureClassesForProperty:(id)a3;
- (CPLMomentShare)initWithCoder:(id)a3;
- (CPLMomentShare)initWithScopeChange:(id)a3;
- (NSArray)participants;
- (NSData)previewData;
- (NSData)thumbnailImageData;
- (NSDate)creationDate;
- (NSDate)endDate;
- (NSDate)expiryDate;
- (NSDate)startDate;
- (NSString)identifier;
- (NSString)originatingScopeIdentifier;
- (NSString)title;
- (NSURL)shareURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)translateToScopeChangeWithScopeType:(int64_t)a3;
- (int64_t)assetCount;
- (int64_t)photosCount;
- (int64_t)videosCount;
- (signed)mode;
- (void)setAssetCount:(int64_t)a3;
- (void)setCreationDate:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setExpiryDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMode:(signed __int16)a3;
- (void)setOriginatingScopeIdentifier:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setPhotosCount:(int64_t)a3;
- (void)setPreviewData:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setThumbnailImageData:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVideosCount:(int64_t)a3;
- (void)updateScopeChange:(id)a3;
@end

@implementation CPLMomentShare

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 cplCopyPropertiesFromObject:self withCopyBlock:0];
  return v4;
}

- (CPLMomentShare)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLMomentShare;
  v5 = [(CPLMomentShare *)&v8 init];
  v6 = v5;
  if (v5) {
    [v5 cplDecodePropertiesFromCoder:v4];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)cplAdditionalSecureClassesForProperty:(id)a3
{
  id v4 = a3;
  if (cplAdditionalSecureClassesForProperty__onceToken_124 != -1) {
    dispatch_once(&cplAdditionalSecureClassesForProperty__onceToken_124, &__block_literal_global_126);
  }
  v5 = [(id)cplAdditionalSecureClassesForProperty__additionalClasses_123 objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___CPLMomentShare;
    objc_msgSendSuper2(&v10, sel_cplAdditionalSecureClassesForProperty_, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_super v8 = v7;

  return v8;
}

void __69__CPLMomentShare_CPLNSCoding__cplAdditionalSecureClassesForProperty___block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"participants";
  v0 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)cplAdditionalSecureClassesForProperty__additionalClasses_123;
  cplAdditionalSecureClassesForProperty__additionalClasses_123 = v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_previewData, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setOriginatingScopeIdentifier:(id)a3
{
}

- (NSString)originatingScopeIdentifier
{
  return self->_originatingScopeIdentifier;
}

- (void)setShareURL:(id)a3
{
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setParticipants:(id)a3
{
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setPreviewData:(id)a3
{
}

- (NSData)previewData
{
  return self->_previewData;
}

- (void)setThumbnailImageData:(id)a3
{
}

- (NSData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (void)setVideosCount:(int64_t)a3
{
  self->_videosCount = a3;
}

- (int64_t)videosCount
{
  return self->_videosCount;
}

- (void)setPhotosCount:(int64_t)a3
{
  self->_photosCount = a3;
}

- (int64_t)photosCount
{
  return self->_photosCount;
}

- (void)setAssetCount:(int64_t)a3
{
  self->_assetCount = a3;
}

- (int64_t)assetCount
{
  return self->_assetCount;
}

- (void)setExpiryDate:(id)a3
{
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setMode:(signed __int16)a3
{
  self->_mode = a3;
}

- (signed)mode
{
  return self->_mode;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)description
{
  id v19 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v18 = objc_opt_class();
  uint64_t v3 = [(CPLMomentShare *)self identifier];
  id v4 = [(CPLMomentShare *)self title];
  v5 = [(CPLMomentShare *)self creationDate];
  int64_t v6 = [(CPLMomentShare *)self assetCount];
  int64_t v7 = [(CPLMomentShare *)self photosCount];
  int64_t v8 = [(CPLMomentShare *)self videosCount];
  v9 = [(CPLMomentShare *)self expiryDate];
  objc_super v10 = [(CPLMomentShare *)self shareURL];
  v11 = objc_msgSend(v10, "cpl_redactedShareURL");
  int64_t v17 = v6;
  v12 = (void *)v3;
  v13 = (void *)[v19 initWithFormat:@"<%@ %@ '%@'> %@ %lu assets (%lu photos %lu videos) expiry %@ url %@", v18, v3, v4, v5, v17, v7, v8, v9, v11];

  uint64_t v14 = [(CPLMomentShare *)self originatingScopeIdentifier];
  v15 = (void *)v14;
  if (v14) {
    [v13 appendFormat:@" orig %@", v14];
  }

  return v13;
}

- (id)translateToScopeChangeWithScopeType:(int64_t)a3
{
  id v4 = +[CPLScopeChange newScopeChangeWithScopeIdentifier:self->_identifier type:a3];
  [(CPLMomentShare *)self updateScopeChange:v4];
  return v4;
}

- (void)updateScopeChange:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 share];
  if (!v5)
  {
    v5 = objc_alloc_init(CPLShare);
    [(CPLShare *)v5 setURL:self->_shareURL];
    int64_t v6 = [(CPLMomentShare *)self participants];
    if ([v6 count])
    {
      int64_t v7 = +[CPLMomentShareParticipant shareParticipantsFromMomentShareParticipants:v6];
      [(CPLShare *)v5 setParticipants:v7];
    }
    v16 = v6;
    if (self->_mode >= 4) {
      uint64_t mode = 2;
    }
    else {
      uint64_t mode = self->_mode;
    }
    [(CPLShare *)v5 setPublicPermission:mode];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v9 = [(CPLShare *)v5 participants];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v14 role] == 1) {
            uint64_t v15 = 3;
          }
          else {
            uint64_t v15 = mode;
          }
          [v14 setPermission:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    [v4 setShare:v5];
  }
  if (self->_title) {
    objc_msgSend(v4, "setTitle:");
  }
  if (self->_creationDate) {
    objc_msgSend(v4, "setCreationDate:");
  }
  if (self->_startDate) {
    objc_msgSend(v4, "setStartDate:");
  }
  if (self->_endDate) {
    objc_msgSend(v4, "setEndDate:");
  }
  if (self->_expiryDate) {
    objc_msgSend(v4, "setExpiryDate:");
  }
  if (self->_assetCount >= 1)
  {
    objc_msgSend(v4, "setPromisedAssetCount:");
    [v4 setPromisedPhotosCount:self->_photosCount];
    [v4 setPromisedVideosCount:self->_videosCount];
  }
  if (self->_thumbnailImageData) {
    objc_msgSend(v4, "setThumbnailImageData:");
  }
  if (self->_previewData) {
    objc_msgSend(v4, "setPreviewImageData:");
  }
  if (self->_originatingScopeIdentifier) {
    objc_msgSend(v4, "setOriginatingScopeIdentifier:");
  }
}

- (CPLMomentShare)initWithScopeChange:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CPLMomentShare;
  v5 = [(CPLMomentShare *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 scopeIdentifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    int64_t v8 = [v4 share];
    v9 = [v8 participants];
    uint64_t v10 = +[CPLMomentShareParticipant momentShareParticipantsFromParticipants:v9];
    participants = v5->_participants;
    v5->_participants = (NSArray *)v10;

    uint64_t v12 = [v8 currentUserParticipant];
    v13 = v12;
    if (v12) {
      unint64_t v14 = [v12 permission];
    }
    else {
      unint64_t v14 = [v8 publicPermission];
    }
    if (v14 <= 3) {
      v5->_uint64_t mode = v14;
    }
    uint64_t v15 = [v8 URL];
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v15;

    uint64_t v17 = [v4 title];
    title = v5->_title;
    v5->_title = (NSString *)v17;

    uint64_t v19 = [v4 creationDate];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v19;

    uint64_t v21 = [v4 startDate];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v21;

    uint64_t v23 = [v4 endDate];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v23;

    uint64_t v25 = [v4 expiryDate];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v25;

    v5->_assetCount = [v4 promisedAssetCount];
    v5->_photosCount = [v4 promisedPhotosCount];
    v5->_videosCount = [v4 promisedVideosCount];
    uint64_t v27 = [v4 thumbnailImageData];
    thumbnailImageData = v5->_thumbnailImageData;
    v5->_thumbnailImageData = (NSData *)v27;

    uint64_t v29 = [v4 previewImageData];
    previewData = v5->_previewData;
    v5->_previewData = (NSData *)v29;

    uint64_t v31 = [v4 originatingScopeIdentifier];
    originatingScopeIdentifier = v5->_originatingScopeIdentifier;
    v5->_originatingScopeIdentifier = (NSString *)v31;
  }
  return v5;
}

@end