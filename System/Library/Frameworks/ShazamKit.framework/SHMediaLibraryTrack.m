@interface SHMediaLibraryTrack
+ (BOOL)supportsSecureCoding;
- (BOOL)explicitContent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualTrack:(id)a3;
- (CLLocation)location;
- (NSArray)genres;
- (NSDate)creationDate;
- (NSDate)lastUpdatedDate;
- (NSDate)releaseDate;
- (NSDictionary)rawSongResponse;
- (NSMutableSet)labelSet;
- (NSSet)labels;
- (NSString)albumName;
- (NSString)appleMusicID;
- (NSString)associatedGroupIdentifier;
- (NSString)identifier;
- (NSString)isrc;
- (NSString)providerIdentifier;
- (NSString)providerName;
- (NSString)recognitionIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)appleMusicURL;
- (NSURL)artworkURL;
- (NSURL)shazamURL;
- (NSURL)videoURL;
- (SHMediaItem)mediaItemValue;
- (SHMediaLibraryItemMetadata)metadata;
- (SHMediaLibraryTrack)initWithCoder:(id)a3;
- (SHMediaLibraryTrack)initWithIdentifier:(id)a3 builder:(id)a4;
- (SHMediaLibraryTrack)initWithIdentifier:(id)a3 metadata:(id)a4 builder:(id)a5;
- (SHMediaLibraryTrack)initWithManagedTrack:(id)a3;
- (SHMediaLibraryTrack)initWithMediaItem:(id)a3;
- (SHShazamKey)shazamKey;
- (id)_initWithIdentifier:(id)a3 metadata:(id)a4 labels:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)platformLabel;
- (int64_t)shazamCount;
- (unint64_t)hash;
- (void)addLabel:(id)a3;
- (void)addPlatformLabel;
- (void)encodeWithCoder:(id)a3;
- (void)setAlbumName:(id)a3;
- (void)setAppleMusicID:(id)a3;
- (void)setAppleMusicURL:(id)a3;
- (void)setArtworkURL:(id)a3;
- (void)setAssociatedGroupIdentifier:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setExplicitContent:(BOOL)a3;
- (void)setGenres:(id)a3;
- (void)setIsrc:(id)a3;
- (void)setLabelSet:(id)a3;
- (void)setLastUpdatedDate:(id)a3;
- (void)setLocation:(id)a3;
- (void)setProviderIdentifier:(id)a3;
- (void)setProviderName:(id)a3;
- (void)setRawSongResponse:(id)a3;
- (void)setRecognitionIdentifier:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setShazamCount:(int64_t)a3;
- (void)setShazamKey:(id)a3;
- (void)setShazamURL:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVideoURL:(id)a3;
- (void)updateWithBuilderBlock:(id)a3;
- (void)updateWithMediaItem:(id)a3;
@end

@implementation SHMediaLibraryTrack

- (SHMediaLibraryTrack)initWithIdentifier:(id)a3 builder:(id)a4
{
  id v6 = a4;
  v7 = (SHMediaLibraryTrack *)[(SHMediaLibraryTrack *)self _initWithIdentifier:a3 metadata:0 labels:MEMORY[0x263EFFA68]];
  [(SHMediaLibraryTrack *)v7 updateWithBuilderBlock:v6];

  return v7;
}

- (SHMediaLibraryTrack)initWithIdentifier:(id)a3 metadata:(id)a4 builder:(id)a5
{
  id v8 = a5;
  v9 = (SHMediaLibraryTrack *)[(SHMediaLibraryTrack *)self _initWithIdentifier:a3 metadata:a4 labels:MEMORY[0x263EFFA68]];
  [(SHMediaLibraryTrack *)v9 updateWithBuilderBlock:v8];

  return v9;
}

- (SHMediaLibraryTrack)initWithMediaItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 shazamID];

  if (!v5)
  {
    id v8 = sh_log_object();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224B4B000, v8, OS_LOG_TYPE_ERROR, "A media item must have a shazamID when creating a library track", buf, 2u);
    }
    goto LABEL_13;
  }
  id v6 = [SHShazamKey alloc];
  v7 = [v4 shazamID];
  id v8 = [(SHShazamKey *)v6 initWithKey:v7];

  if (!v8)
  {
    v19 = sh_log_object();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_224B4B000, v19, OS_LOG_TYPE_ERROR, "A media item must have a valid (numeric only) format when creating a library track", v21, 2u);
    }

LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  v9 = [v4 identifier];
  v10 = [v9 UUIDString];
  self = (SHMediaLibraryTrack *)[(SHMediaLibraryTrack *)self _initWithIdentifier:v10 metadata:0 labels:MEMORY[0x263EFFA68]];

  [(SHMediaLibraryTrack *)self setShazamKey:v8];
  v11 = [MEMORY[0x263F08C38] UUID];
  v12 = [v11 UUIDString];
  [(SHMediaLibraryTrack *)self setRecognitionIdentifier:v12];

  v13 = [v4 providerIdentifier];
  [(SHMediaLibraryTrack *)self setProviderIdentifier:v13];

  v14 = [v4 creationDate];

  if (v14)
  {
    v15 = [v4 creationDate];
    [(SHMediaLibraryTrack *)self setCreationDate:v15];
  }
  v16 = [v4 matchLocation];
  [(SHMediaLibraryTrack *)self setLocation:v16];

  [(SHMediaLibraryTrack *)self updateWithMediaItem:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [MEMORY[0x263EFF910] date];
    [(SHMediaLibraryTrack *)self setLastUpdatedDate:v17];
  }
  v18 = self;
LABEL_14:

  return v18;
}

- (SHMediaLibraryTrack)initWithManagedTrack:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 metadata];
  id v6 = [v5 data];

  if (v6)
  {
    v7 = [SHMediaLibraryItemMetadata alloc];
    id v8 = [v4 metadata];
    v9 = [v8 data];
    v10 = [(SHMediaLibraryItemMetadata *)v7 initWithEncodedSystemData:v9];
  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)MEMORY[0x263EFF980];
  v12 = [v4 labels];
  v13 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v14 = objc_msgSend(v4, "labels", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v54;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v54 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [[SHMediaLibraryLabel alloc] initWithName:*(void *)(*((void *)&v53 + 1) + 8 * v18)];
        [v13 addObject:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v16);
  }

  v20 = [v4 syncID];
  v21 = (void *)[v13 copy];
  v22 = (SHMediaLibraryTrack *)[(SHMediaLibraryTrack *)self _initWithIdentifier:v20 metadata:v10 labels:v21];

  v23 = [v4 shazamKey];

  if (v23)
  {
    v24 = [SHShazamKey alloc];
    v25 = [v4 shazamKey];
    v26 = [(SHShazamKey *)v24 initWithKey:v25];
    [(SHMediaLibraryTrack *)v22 setShazamKey:v26];
  }
  v27 = [v4 providerID];
  [(SHMediaLibraryTrack *)v22 setProviderIdentifier:v27];

  v28 = [v4 providerName];
  [(SHMediaLibraryTrack *)v22 setProviderName:v28];

  v29 = [v4 date];
  [(SHMediaLibraryTrack *)v22 setCreationDate:v29];

  v30 = [v4 recognitionID];
  [(SHMediaLibraryTrack *)v22 setRecognitionIdentifier:v30];

  v31 = [v4 title];
  [(SHMediaLibraryTrack *)v22 setTitle:v31];

  v32 = [v4 subtitle];
  [(SHMediaLibraryTrack *)v22 setSubtitle:v32];

  v33 = [v4 artworkURL];
  [(SHMediaLibraryTrack *)v22 setArtworkURL:v33];

  v34 = [v4 shazamURL];
  [(SHMediaLibraryTrack *)v22 setShazamURL:v34];

  v35 = [v4 group];
  v36 = [v35 syncID];
  [(SHMediaLibraryTrack *)v22 setAssociatedGroupIdentifier:v36];

  id v37 = objc_alloc(MEMORY[0x263F00A50]);
  [v4 latitude];
  double v39 = v38;
  [v4 longitude];
  v41 = (void *)[v37 initWithLatitude:v39 longitude:v40];
  [(SHMediaLibraryTrack *)v22 setLocation:v41];

  v42 = [v4 albumName];
  [(SHMediaLibraryTrack *)v22 setAlbumName:v42];

  v43 = [v4 appleMusicID];
  [(SHMediaLibraryTrack *)v22 setAppleMusicID:v43];

  v44 = [v4 appleMusicURL];
  [(SHMediaLibraryTrack *)v22 setAppleMusicURL:v44];

  -[SHMediaLibraryTrack setExplicitContent:](v22, "setExplicitContent:", [v4 explicit]);
  v45 = [v4 genres];
  [(SHMediaLibraryTrack *)v22 setGenres:v45];

  v46 = [v4 isrc];
  [(SHMediaLibraryTrack *)v22 setIsrc:v46];

  v47 = [v4 rawSongResponse];
  [(SHMediaLibraryTrack *)v22 setRawSongResponse:v47];

  v48 = [v4 releaseDate];
  [(SHMediaLibraryTrack *)v22 setReleaseDate:v48];

  v49 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "shazamCount"));
  -[SHMediaLibraryTrack setShazamCount:](v22, "setShazamCount:", [v49 integerValue]);

  v50 = [v4 videoURL];
  [(SHMediaLibraryTrack *)v22 setVideoURL:v50];

  v51 = [v4 modifiedDate];
  [(SHMediaLibraryTrack *)v22 setLastUpdatedDate:v51];

  return v22;
}

- (id)_initWithIdentifier:(id)a3 metadata:(id)a4 labels:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SHMediaLibraryTrack;
  v11 = [(SHMediaLibraryTrack *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 precomposedStringWithCanonicalMapping];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_metadata, a4);
    uint64_t v14 = [MEMORY[0x263EFF910] date];
    creationDate = v11->_creationDate;
    v11->_creationDate = (NSDate *)v14;

    uint64_t v16 = [MEMORY[0x263EFF9C0] setWithArray:v10];
    labelSet = v11->_labelSet;
    v11->_labelSet = (NSMutableSet *)v16;

    [(SHMediaLibraryTrack *)v11 addPlatformLabel];
  }

  return v11;
}

- (void)updateWithBuilderBlock:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  v5 = [SHMediaLibraryTrackBuilder alloc];
  id v6 = [(SHMediaLibraryTrack *)self creationDate];
  v20 = [(SHMediaLibraryTrackBuilder *)v5 initWithCreationDate:v6];

  v4[2](v4, v20);
  v7 = [(SHMediaLibraryTrackBuilder *)v20 creationDate];
  [(SHMediaLibraryTrack *)self setCreationDate:v7];

  id v8 = [(SHMediaLibraryTrackBuilder *)v20 title];
  [(SHMediaLibraryTrack *)self setTitle:v8];

  id v9 = [(SHMediaLibraryTrackBuilder *)v20 subtitle];
  [(SHMediaLibraryTrack *)self setSubtitle:v9];

  id v10 = [(SHMediaLibraryTrackBuilder *)v20 providerName];
  [(SHMediaLibraryTrack *)self setProviderName:v10];

  v11 = [(SHMediaLibraryTrackBuilder *)v20 providerIdentifier];
  [(SHMediaLibraryTrack *)self setProviderIdentifier:v11];

  uint64_t v12 = [(SHMediaLibraryTrackBuilder *)v20 recognitionIdentifier];
  [(SHMediaLibraryTrack *)self setRecognitionIdentifier:v12];

  v13 = [(SHMediaLibraryTrackBuilder *)v20 shazamKey];
  [(SHMediaLibraryTrack *)self setShazamKey:v13];

  uint64_t v14 = [(SHMediaLibraryTrackBuilder *)v20 location];
  [(SHMediaLibraryTrack *)self setLocation:v14];

  uint64_t v15 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v16 = [(SHMediaLibraryTrackBuilder *)v20 labels];
  uint64_t v17 = [v15 setWithSet:v16];
  [(SHMediaLibraryTrack *)self setLabelSet:v17];

  uint64_t v18 = [(SHMediaLibraryTrackBuilder *)v20 artworkURL];
  [(SHMediaLibraryTrack *)self setArtworkURL:v18];

  objc_super v19 = [(SHMediaLibraryTrackBuilder *)v20 shazamURL];
  [(SHMediaLibraryTrack *)self setShazamURL:v19];

  [(SHMediaLibraryTrack *)self addPlatformLabel];
}

- (void)updateWithMediaItem:(id)a3
{
  id v21 = a3;
  id v4 = [v21 shazamID];

  if (v4)
  {
    v5 = [SHShazamKey alloc];
    id v6 = [v21 shazamID];
    v7 = [(SHShazamKey *)v5 initWithKey:v6];

    if (v7) {
      [(SHMediaLibraryTrack *)self setShazamKey:v7];
    }
  }
  id v8 = [v21 title];
  [(SHMediaLibraryTrack *)self setTitle:v8];

  id v9 = [v21 subtitle];
  if (v9)
  {
    [(SHMediaLibraryTrack *)self setSubtitle:v9];
  }
  else
  {
    id v10 = [v21 artist];
    [(SHMediaLibraryTrack *)self setSubtitle:v10];
  }
  v11 = [v21 artworkURL];
  [(SHMediaLibraryTrack *)self setArtworkURL:v11];

  uint64_t v12 = [v21 webURL];
  [(SHMediaLibraryTrack *)self setShazamURL:v12];

  v13 = [v21 albumName];
  [(SHMediaLibraryTrack *)self setAlbumName:v13];

  uint64_t v14 = [v21 appleMusicID];
  [(SHMediaLibraryTrack *)self setAppleMusicID:v14];

  uint64_t v15 = [v21 appleMusicURL];
  [(SHMediaLibraryTrack *)self setAppleMusicURL:v15];

  -[SHMediaLibraryTrack setExplicitContent:](self, "setExplicitContent:", [v21 explicitContent]);
  uint64_t v16 = [v21 genres];
  [(SHMediaLibraryTrack *)self setGenres:v16];

  uint64_t v17 = [v21 isrc];
  [(SHMediaLibraryTrack *)self setIsrc:v17];

  uint64_t v18 = [v21 _rawResponseSongs];
  [(SHMediaLibraryTrack *)self setRawSongResponse:v18];

  objc_super v19 = [v21 releaseDate];
  [(SHMediaLibraryTrack *)self setReleaseDate:v19];

  -[SHMediaLibraryTrack setShazamCount:](self, "setShazamCount:", [v21 shazamCount]);
  v20 = [v21 videoURL];
  [(SHMediaLibraryTrack *)self setVideoURL:v20];
}

- (NSSet)labels
{
  v2 = [(SHMediaLibraryTrack *)self labelSet];
  v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

- (SHMediaItem)mediaItemValue
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = objc_alloc(MEMORY[0x263F08C38]);
  v5 = [(SHMediaLibraryTrack *)self identifier];
  id v6 = (void *)[v4 initWithUUIDString:v5];
  [v3 setValue:v6 forKey:@"sh_identifier"];

  v7 = [(SHMediaLibraryTrack *)self creationDate];
  [v3 setValue:v7 forKey:@"sh_creationDate"];

  id v8 = [(SHMediaLibraryTrack *)self shazamKey];
  id v9 = [v8 validatedKey];
  [v3 setValue:v9 forKey:@"sh_shazamID"];

  id v10 = [(SHMediaLibraryTrack *)self title];
  [v3 setValue:v10 forKey:@"sh_title"];

  v11 = [(SHMediaLibraryTrack *)self subtitle];
  [v3 setValue:v11 forKey:@"sh_subtitle"];

  uint64_t v12 = [(SHMediaLibraryTrack *)self subtitle];
  [v3 setValue:v12 forKey:@"sh_artist"];

  v13 = [(SHMediaLibraryTrack *)self artworkURL];
  [v3 setValue:v13 forKey:@"sh_artworkURL"];

  uint64_t v14 = [(SHMediaLibraryTrack *)self shazamURL];
  [v3 setValue:v14 forKey:@"sh_webURL"];

  uint64_t v15 = [(SHMediaLibraryTrack *)self providerIdentifier];
  [v3 setValue:v15 forKey:@"sh_providerIdentifier"];

  uint64_t v16 = [(SHMediaLibraryTrack *)self albumName];
  [v3 setValue:v16 forKey:@"sh_albumName"];

  uint64_t v17 = [(SHMediaLibraryTrack *)self appleMusicID];
  [v3 setValue:v17 forKey:@"sh_appleMusicID"];

  uint64_t v18 = [(SHMediaLibraryTrack *)self appleMusicURL];
  [v3 setValue:v18 forKey:@"sh_appleMusicURL"];

  objc_super v19 = [(SHMediaLibraryTrack *)self genres];
  [v3 setValue:v19 forKey:@"sh_genres"];

  v20 = [(SHMediaLibraryTrack *)self isrc];
  [v3 setValue:v20 forKey:@"sh_isrc"];

  id v21 = objc_msgSend(NSNumber, "numberWithBool:", -[SHMediaLibraryTrack explicitContent](self, "explicitContent"));
  [v3 setValue:v21 forKey:@"sh_explicitContent"];

  v22 = objc_msgSend(NSNumber, "numberWithInteger:", -[SHMediaLibraryTrack shazamCount](self, "shazamCount"));
  [v3 setValue:v22 forKey:@"sh_shazamCount"];

  v23 = [(SHMediaLibraryTrack *)self releaseDate];
  [v3 setValue:v23 forKey:@"sh_releaseDate"];

  v24 = [(SHMediaLibraryTrack *)self videoURL];
  [v3 setValue:v24 forKey:@"sh_videoURL"];

  v25 = [(SHMediaLibraryTrack *)self location];
  [v3 setValue:v25 forKey:@"sh_matchLocation"];

  v26 = (void *)[v3 copy];
  v27 = +[SHMediaItem mediaItemWithProperties:v26];

  v28 = [(SHMediaLibraryTrack *)self rawSongResponse];
  objc_msgSend(v27, "set_rawResponseSongs:", v28);

  return (SHMediaItem *)v27;
}

- (SHMediaLibraryTrack)initWithCoder:(id)a3
{
  v67[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)SHMediaLibraryTrack;
  v5 = [(SHMediaLibraryTrack *)&v66 init];
  if (v5)
  {
    context = (void *)MEMORY[0x22A61F6E0]();
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLibraryTrackMetadata"];
    if (v6)
    {
      v7 = [[SHMediaLibraryItemMetadata alloc] initWithEncodedSystemData:v6];
      metadata = v5->_metadata;
      v5->_metadata = v7;
    }
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLibraryTrackShazamKey"];
    if (v9)
    {
      id v10 = [[SHShazamKey alloc] initWithKey:v9];
      shazamKey = v5->_shazamKey;
      v5->_shazamKey = v10;
    }
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLibraryTrackIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLibraryTrackRecognitionIdentifierKey"];
    recognitionIdentifier = v5->_recognitionIdentifier;
    v5->_recognitionIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLibraryTrackProviderIdentifier"];
    providerIdentifier = v5->_providerIdentifier;
    v5->_providerIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLibraryTrackProviderName"];
    providerName = v5->_providerName;
    v5->_providerName = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLibraryTrackDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLibraryTrackTitle"];
    title = v5->_title;
    v5->_title = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLibraryTrackSubtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLibraryTrackAssociatedGroupIdentifier"];
    associatedGroupIdentifier = v5->_associatedGroupIdentifier;
    v5->_associatedGroupIdentifier = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLibraryTrackArtworkURL"];
    artworkURL = v5->_artworkURL;
    v5->_artworkURL = (NSURL *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLibraryTrackShazamURL"];
    shazamURL = v5->_shazamURL;
    v5->_shazamURL = (NSURL *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLibraryTrackLocation"];
    location = v5->_location;
    v5->_location = (CLLocation *)v32;

    v34 = (void *)MEMORY[0x263EFFA08];
    uint64_t v35 = objc_opt_class();
    v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    id v37 = [v4 decodeObjectOfClasses:v36 forKey:@"SHLibraryTrackLibrarySet"];
    uint64_t v38 = [v37 mutableCopy];
    labelSet = v5->_labelSet;
    v5->_labelSet = (NSMutableSet *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHMediaLibraryTrackAlbumName"];
    albumName = v5->_albumName;
    v5->_albumName = (NSString *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHMediaLibraryTrackAppleMusicURL"];
    appleMusicURL = v5->_appleMusicURL;
    v5->_appleMusicURL = (NSURL *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHMediaLibraryTrackAppleMusicID"];
    appleMusicID = v5->_appleMusicID;
    v5->_appleMusicID = (NSString *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHMediaLibraryTrackISRC"];
    isrc = v5->_isrc;
    v5->_isrc = (NSString *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHMediaLibraryTrackReleaseDate"];
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHMediaLibraryTrackVideoURL"];
    videoURL = v5->_videoURL;
    v5->_videoURL = (NSURL *)v50;

    v5->_explicitContent = [v4 decodeBoolForKey:@"SHMediaLibraryTrackExplicitContent"];
    v5->_shazamCount = [v4 decodeIntegerForKey:@"SHMediaLibraryTrackShazamCount"];
    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHMediaLibraryTrackLastUpdatedDate"];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v52;

    long long v54 = (void *)MEMORY[0x263EFFA08];
    v67[0] = objc_opt_class();
    v67[1] = objc_opt_class();
    v67[2] = objc_opt_class();
    v67[3] = objc_opt_class();
    long long v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:4];
    long long v56 = [v54 setWithArray:v55];

    uint64_t v57 = [v4 decodeObjectOfClasses:v56 forKey:@"SHMediaLibraryTrackRawSongResponse"];
    rawSongResponse = v5->_rawSongResponse;
    v5->_rawSongResponse = (NSDictionary *)v57;

    v59 = (void *)MEMORY[0x263EFFA08];
    uint64_t v60 = objc_opt_class();
    v61 = objc_msgSend(v59, "setWithObjects:", v60, objc_opt_class(), 0);
    uint64_t v62 = [v4 decodeObjectOfClasses:v61 forKey:@"SHMediaLibraryTrackGenres"];
    genres = v5->_genres;
    v5->_genres = (NSArray *)v62;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = (void *)MEMORY[0x22A61F6E0]();
  [v8 encodeObject:self->_identifier forKey:@"SHLibraryTrackIdentifier"];
  [v8 encodeObject:self->_recognitionIdentifier forKey:@"SHLibraryTrackRecognitionIdentifierKey"];
  v5 = [(SHShazamKey *)self->_shazamKey validatedKey];
  [v8 encodeObject:v5 forKey:@"SHLibraryTrackShazamKey"];

  id v6 = [(SHMediaLibraryItemMetadata *)self->_metadata encodedSystemData];
  [v8 encodeObject:v6 forKey:@"SHLibraryTrackMetadata"];

  [v8 encodeObject:self->_providerIdentifier forKey:@"SHLibraryTrackProviderIdentifier"];
  [v8 encodeObject:self->_providerName forKey:@"SHLibraryTrackProviderName"];
  [v8 encodeObject:self->_creationDate forKey:@"SHLibraryTrackDate"];
  [v8 encodeObject:self->_title forKey:@"SHLibraryTrackTitle"];
  [v8 encodeObject:self->_subtitle forKey:@"SHLibraryTrackSubtitle"];
  [v8 encodeObject:self->_associatedGroupIdentifier forKey:@"SHLibraryTrackAssociatedGroupIdentifier"];
  v7 = (void *)[(NSMutableSet *)self->_labelSet copy];
  [v8 encodeObject:v7 forKey:@"SHLibraryTrackLibrarySet"];

  [v8 encodeObject:self->_artworkURL forKey:@"SHLibraryTrackArtworkURL"];
  [v8 encodeObject:self->_shazamURL forKey:@"SHLibraryTrackShazamURL"];
  [v8 encodeObject:self->_location forKey:@"SHLibraryTrackLocation"];
  [v8 encodeObject:self->_albumName forKey:@"SHMediaLibraryTrackAlbumName"];
  [v8 encodeObject:self->_appleMusicURL forKey:@"SHMediaLibraryTrackAppleMusicURL"];
  [v8 encodeObject:self->_appleMusicID forKey:@"SHMediaLibraryTrackAppleMusicID"];
  [v8 encodeObject:self->_genres forKey:@"SHMediaLibraryTrackGenres"];
  [v8 encodeObject:self->_isrc forKey:@"SHMediaLibraryTrackISRC"];
  [v8 encodeObject:self->_rawSongResponse forKey:@"SHMediaLibraryTrackRawSongResponse"];
  [v8 encodeObject:self->_releaseDate forKey:@"SHMediaLibraryTrackReleaseDate"];
  [v8 encodeObject:self->_videoURL forKey:@"SHMediaLibraryTrackVideoURL"];
  [v8 encodeBool:self->_explicitContent forKey:@"SHMediaLibraryTrackExplicitContent"];
  [v8 encodeInteger:self->_shazamCount forKey:@"SHMediaLibraryTrackShazamCount"];
  [v8 encodeObject:self->_lastUpdatedDate forKey:@"SHMediaLibraryTrackLastUpdatedDate"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[SHMediaLibraryTrack allocWithZone:](SHMediaLibraryTrack, "allocWithZone:");
  id v6 = [(SHMediaLibraryTrack *)self identifier];
  v7 = (void *)[v6 copyWithZone:a3];
  id v8 = [(SHMediaLibraryTrack *)self metadata];
  id v9 = (void *)[v8 copyWithZone:a3];
  id v10 = [(SHMediaLibraryTrack *)self labels];
  v11 = [v10 allObjects];
  uint64_t v12 = (void *)[v11 copyWithZone:a3];
  id v13 = [(SHMediaLibraryTrack *)v5 _initWithIdentifier:v7 metadata:v9 labels:v12];

  uint64_t v14 = [(SHMediaLibraryTrack *)self recognitionIdentifier];
  uint64_t v15 = (void *)[v14 copyWithZone:a3];
  [v13 setRecognitionIdentifier:v15];

  uint64_t v16 = [(SHMediaLibraryTrack *)self shazamKey];
  uint64_t v17 = (void *)[v16 copyWithZone:a3];
  [v13 setShazamKey:v17];

  uint64_t v18 = [(SHMediaLibraryTrack *)self creationDate];
  objc_super v19 = (void *)[v18 copyWithZone:a3];
  [v13 setCreationDate:v19];

  uint64_t v20 = [(SHMediaLibraryTrack *)self providerIdentifier];
  id v21 = (void *)[v20 copyWithZone:a3];
  [v13 setProviderIdentifier:v21];

  uint64_t v22 = [(SHMediaLibraryTrack *)self providerName];
  v23 = (void *)[v22 copyWithZone:a3];
  [v13 setProviderName:v23];

  uint64_t v24 = [(SHMediaLibraryTrack *)self title];
  v25 = (void *)[v24 copyWithZone:a3];
  [v13 setTitle:v25];

  uint64_t v26 = [(SHMediaLibraryTrack *)self subtitle];
  v27 = (void *)[v26 copyWithZone:a3];
  [v13 setSubtitle:v27];

  uint64_t v28 = [(SHMediaLibraryTrack *)self associatedGroupIdentifier];
  v29 = (void *)[v28 copyWithZone:a3];
  [v13 setAssociatedGroupIdentifier:v29];

  uint64_t v30 = [(SHMediaLibraryTrack *)self artworkURL];
  v31 = (void *)[v30 copyWithZone:a3];
  [v13 setArtworkURL:v31];

  uint64_t v32 = [(SHMediaLibraryTrack *)self shazamURL];
  v33 = (void *)[v32 copyWithZone:a3];
  [v13 setShazamURL:v33];

  v34 = [(SHMediaLibraryTrack *)self location];
  uint64_t v35 = (void *)[v34 copyWithZone:a3];
  [v13 setLocation:v35];

  v36 = [(SHMediaLibraryTrack *)self albumName];
  id v37 = (void *)[v36 copyWithZone:a3];
  [v13 setAlbumName:v37];

  uint64_t v38 = [(SHMediaLibraryTrack *)self appleMusicID];
  double v39 = (void *)[v38 copyWithZone:a3];
  [v13 setAppleMusicID:v39];

  uint64_t v40 = [(SHMediaLibraryTrack *)self appleMusicURL];
  v41 = (void *)[v40 copyWithZone:a3];
  [v13 setAppleMusicURL:v41];

  objc_msgSend(v13, "setExplicitContent:", -[SHMediaLibraryTrack explicitContent](self, "explicitContent"));
  uint64_t v42 = [(SHMediaLibraryTrack *)self genres];
  v43 = (void *)[v42 copyWithZone:a3];
  [v13 setGenres:v43];

  uint64_t v44 = [(SHMediaLibraryTrack *)self isrc];
  v45 = (void *)[v44 copyWithZone:a3];
  [v13 setIsrc:v45];

  uint64_t v46 = [(SHMediaLibraryTrack *)self rawSongResponse];
  v47 = (void *)[v46 copyWithZone:a3];
  [v13 setRawSongResponse:v47];

  uint64_t v48 = [(SHMediaLibraryTrack *)self releaseDate];
  v49 = (void *)[v48 copyWithZone:a3];
  [v13 setReleaseDate:v49];

  objc_msgSend(v13, "setShazamCount:", -[SHMediaLibraryTrack shazamCount](self, "shazamCount"));
  uint64_t v50 = [(SHMediaLibraryTrack *)self videoURL];
  v51 = (void *)[v50 copyWithZone:a3];
  [v13 setVideoURL:v51];

  uint64_t v52 = [(SHMediaLibraryTrack *)self lastUpdatedDate];
  long long v53 = (void *)[v52 copyWithZone:a3];
  [v13 setLastUpdatedDate:v53];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SHMediaLibraryTrack *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(SHMediaLibraryTrack *)self isEqualTrack:v4];
  }

  return v5;
}

- (BOOL)isEqualTrack:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SHMediaLibraryTrack *)self identifier];
  id v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(SHMediaLibraryTrack *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)platformLabel
{
  v2 = [SHMediaLibraryLabel alloc];
  unint64_t v3 = [NSString stringWithFormat:@"%@_ios", @"platform"];
  id v4 = [(SHMediaLibraryLabel *)v2 initWithName:v3];

  return v4;
}

- (void)addPlatformLabel
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v3 = [(SHMediaLibraryTrack *)self labels];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v9 != v6) {
        objc_enumerationMutation(v3);
      }
      if (![*(id *)(*((void *)&v8 + 1) + 8 * v7) type]) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    unint64_t v3 = [(SHMediaLibraryTrack *)self platformLabel];
    [(SHMediaLibraryTrack *)self addLabel:v3];
  }
}

- (void)addLabel:(id)a3
{
  id v4 = a3;
  id v5 = [(SHMediaLibraryTrack *)self labelSet];
  [v5 addObject:v4];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (SHMediaLibraryItemMetadata)metadata
{
  return self->_metadata;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSString)recognitionIdentifier
{
  return self->_recognitionIdentifier;
}

- (void)setRecognitionIdentifier:(id)a3
{
}

- (SHShazamKey)shazamKey
{
  return self->_shazamKey;
}

- (void)setShazamKey:(id)a3
{
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
}

- (NSURL)shazamURL
{
  return self->_shazamURL;
}

- (void)setShazamURL:(id)a3
{
}

- (NSString)associatedGroupIdentifier
{
  return self->_associatedGroupIdentifier;
}

- (void)setAssociatedGroupIdentifier:(id)a3
{
}

- (NSMutableSet)labelSet
{
  return self->_labelSet;
}

- (void)setLabelSet:(id)a3
{
}

- (NSString)albumName
{
  return self->_albumName;
}

- (void)setAlbumName:(id)a3
{
}

- (NSString)appleMusicID
{
  return self->_appleMusicID;
}

- (void)setAppleMusicID:(id)a3
{
}

- (NSString)isrc
{
  return self->_isrc;
}

- (void)setIsrc:(id)a3
{
}

- (NSURL)appleMusicURL
{
  return self->_appleMusicURL;
}

- (void)setAppleMusicURL:(id)a3
{
}

- (NSArray)genres
{
  return self->_genres;
}

- (void)setGenres:(id)a3
{
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
}

- (NSDictionary)rawSongResponse
{
  return self->_rawSongResponse;
}

- (void)setRawSongResponse:(id)a3
{
}

- (BOOL)explicitContent
{
  return self->_explicitContent;
}

- (void)setExplicitContent:(BOOL)a3
{
  self->_explicitContent = a3;
}

- (int64_t)shazamCount
{
  return self->_shazamCount;
}

- (void)setShazamCount:(int64_t)a3
{
  self->_shazamCount = a3;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_rawSongResponse, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_genres, 0);
  objc_storeStrong((id *)&self->_appleMusicURL, 0);
  objc_storeStrong((id *)&self->_isrc, 0);
  objc_storeStrong((id *)&self->_appleMusicID, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_labelSet, 0);
  objc_storeStrong((id *)&self->_associatedGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_shazamURL, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_shazamKey, 0);
  objc_storeStrong((id *)&self->_recognitionIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end