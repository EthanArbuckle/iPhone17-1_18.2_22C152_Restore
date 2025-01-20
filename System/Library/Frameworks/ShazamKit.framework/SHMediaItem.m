@interface SHMediaItem
+ (BOOL)supportsSecureCoding;
+ (SHMediaItem)mediaItemWithProperties:(NSDictionary *)properties;
+ (id)sh_uiServerConnection;
+ (void)fetchHapticsWithMediaItems:(id)a3 completionHandler:(id)a4;
+ (void)fetchMediaItemWithShazamID:(NSString *)shazamID completionHandler:(void *)completionHandler;
+ (void)fetchMediaItemsWithShazamIDs:(id)a3 completionHandler:(id)a4;
+ (void)isHapticTrackAvailableForMediaItem:(id)a3 completionHandler:(id)a4;
+ (void)presentMediaItem:(id)a3 completionHandler:(id)a4;
+ (void)presentMediaItem:(id)a3 presentationSettings:(id)a4 completionHandler:(id)a5;
- (BOOL)describesFrequencySkew:(double)a3;
- (BOOL)describesOffset:(double)a3;
- (BOOL)explicitContent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualMediaItem:(id)a3;
- (CLLocation)matchLocation;
- (NSArray)frequencySkewRanges;
- (NSArray)genres;
- (NSArray)staticLyricLines;
- (NSArray)timeRanges;
- (NSDate)creationDate;
- (NSDate)releaseDate;
- (NSDictionary)_rawResponseSongs;
- (NSDictionary)properties;
- (NSString)albumName;
- (NSString)appleMusicID;
- (NSString)artist;
- (NSString)fuzzyRepresentation;
- (NSString)isrc;
- (NSString)lyricsSnippet;
- (NSString)providerIdentifier;
- (NSString)shazamID;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)appleMusicURL;
- (NSURL)artworkURL;
- (NSURL)videoURL;
- (NSURL)webURL;
- (NSUUID)identifier;
- (NSUUID)underlyingIdentifier;
- (SHMediaItem)initWithCoder:(id)a3;
- (SHMediaItem)initWithProperties:(id)a3;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)objectForKeyedSubscript:(SHMediaItemProperty)key;
- (id)validValueForProperty:(id)a3;
- (id)valueForProperty:(SHMediaItemProperty)property;
- (int64_t)shazamCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUnderlyingIdentifier:(id)a3;
- (void)set_rawResponseSongs:(id)a3;
@end

@implementation SHMediaItem

+ (id)sh_uiServerConnection
{
  if (sh_uiServerConnection_onceToken_0 != -1) {
    dispatch_once(&sh_uiServerConnection_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)sh_uiServerConnection_serverConnection_0;

  return v2;
}

void __50__SHMediaItem_Presentation__sh_uiServerConnection__block_invoke()
{
  v0 = [SHShazamKitUIServiceConnection alloc];
  id v3 = (id)objc_opt_new();
  uint64_t v1 = [(SHShazamKitUIServiceConnection *)v0 initWithConnectionProvider:v3];
  v2 = (void *)sh_uiServerConnection_serverConnection_0;
  sh_uiServerConnection_serverConnection_0 = v1;
}

+ (void)presentMediaItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    v8 = objc_msgSend(a1, "sh_uiServerConnection");
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __64__SHMediaItem_Presentation__presentMediaItem_completionHandler___block_invoke;
    v9[3] = &unk_2646EF550;
    id v10 = v6;
    [v8 presentMediaItem:v7 completionHandler:v9];
  }
}

void __64__SHMediaItem_Presentation__presentMediaItem_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[SHError remapErrorToClientError:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)presentMediaItem:(id)a3 presentationSettings:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    id v9 = a4;
    id v10 = a3;
    v11 = objc_msgSend(a1, "sh_uiServerConnection");
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __85__SHMediaItem_Presentation__presentMediaItem_presentationSettings_completionHandler___block_invoke;
    v12[3] = &unk_2646EF598;
    id v13 = v8;
    [v11 presentMediaItem:v10 presentationSettings:v9 completionHandler:v12];
  }
}

void __85__SHMediaItem_Presentation__presentMediaItem_presentationSettings_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = +[SHError remapErrorToClientError:a4];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (SHMediaItem)mediaItemWithProperties:(NSDictionary *)properties
{
  id v3 = properties;
  v4 = [[SHMediaItem alloc] initWithProperties:v3];

  return v4;
}

- (SHMediaItem)initWithProperties:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHMediaItem;
  id v6 = [(SHMediaItem *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_properties, a3);
    uint64_t v8 = [MEMORY[0x263F08C38] UUID];
    underlyingIdentifier = v7->_underlyingIdentifier;
    v7->_underlyingIdentifier = (NSUUID *)v8;
  }
  return v7;
}

- (id)valueForProperty:(SHMediaItemProperty)property
{
  v4 = property;
  id v5 = [(SHMediaItem *)self properties];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)objectForKeyedSubscript:(SHMediaItemProperty)key
{
  v4 = key;
  id v5 = [(SHMediaItem *)self properties];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [SHMediaItem alloc];
  id v6 = [(SHMediaItem *)self properties];
  id v7 = (void *)[v6 copyWithZone:a3];
  uint64_t v8 = [(SHMediaItem *)v5 initWithProperties:v7];

  id v9 = [(SHMediaItem *)self _rawResponseSongs];
  id v10 = (void *)[v9 copyWithZone:a3];
  [(SHMediaItem *)v8 set_rawResponseSongs:v10];

  objc_super v11 = [(SHMediaItem *)self underlyingIdentifier];
  v12 = (void *)[v11 copyWithZone:a3];
  [(SHMediaItem *)v8 setUnderlyingIdentifier:v12];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SHMediaItem *)self properties];
  [v4 encodeObject:v5 forKey:@"properties"];

  id v6 = [(SHMediaItem *)self _rawResponseSongs];
  [v4 encodeObject:v6 forKey:@"SHMediaItemRawResponseDictionary"];

  id v7 = [(SHMediaItem *)self underlyingIdentifier];
  [v4 encodeObject:v7 forKey:@"underlyingIdentifier"];
}

- (SHMediaItem)initWithCoder:(id)a3
{
  v22[11] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SHMediaItem;
  id v5 = [(SHMediaItem *)&v20 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFF9C0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    v22[3] = objc_opt_class();
    v22[4] = objc_opt_class();
    v22[5] = objc_opt_class();
    v22[6] = objc_opt_class();
    v22[7] = objc_opt_class();
    v22[8] = objc_opt_class();
    v22[9] = objc_opt_class();
    v22[10] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:11];
    uint64_t v8 = [v6 setWithArray:v7];

    [v8 addObject:objc_opt_class()];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"properties"];
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v9;

    objc_super v11 = (void *)MEMORY[0x263EFFA08];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
    id v13 = [v11 setWithArray:v12];

    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"SHMediaItemRawResponseDictionary"];
    objc_storeStrong((id *)&v5->__rawResponseSongs, v14);
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"underlyingIdentifier"];
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      v17 = [MEMORY[0x263F08C38] UUID];
    }
    underlyingIdentifier = v5->_underlyingIdentifier;
    v5->_underlyingIdentifier = v17;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SHMediaItem *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(SHMediaItem *)self isEqualMediaItem:v4];
  }

  return v5;
}

- (BOOL)isEqualMediaItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SHMediaItem *)self identifier];
  id v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(SHMediaItem *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)debugDescription
{
  v2 = [(SHMediaItem *)self properties];
  unint64_t v3 = [v2 debugDescription];

  return v3;
}

- (NSString)shazamID
{
  return (NSString *)[(SHMediaItem *)self validValueForProperty:@"sh_shazamID"];
}

- (NSString)title
{
  return (NSString *)[(SHMediaItem *)self validValueForProperty:@"sh_title"];
}

- (NSString)subtitle
{
  return (NSString *)[(SHMediaItem *)self validValueForProperty:@"sh_subtitle"];
}

- (NSString)artist
{
  return (NSString *)[(SHMediaItem *)self validValueForProperty:@"sh_artist"];
}

- (NSURL)webURL
{
  return (NSURL *)[(SHMediaItem *)self validValueForProperty:@"sh_webURL"];
}

- (NSURL)artworkURL
{
  return (NSURL *)[(SHMediaItem *)self validValueForProperty:@"sh_artworkURL"];
}

- (NSURL)appleMusicURL
{
  return (NSURL *)[(SHMediaItem *)self validValueForProperty:@"sh_appleMusicURL"];
}

- (NSString)appleMusicID
{
  return (NSString *)[(SHMediaItem *)self validValueForProperty:@"sh_appleMusicID"];
}

- (NSURL)videoURL
{
  return (NSURL *)[(SHMediaItem *)self validValueForProperty:@"sh_videoURL"];
}

- (BOOL)explicitContent
{
  v2 = [(SHMediaItem *)self validValueForProperty:@"sh_explicitContent"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSDate)releaseDate
{
  return (NSDate *)[(SHMediaItem *)self validValueForProperty:@"sh_releaseDate"];
}

- (NSArray)genres
{
  v2 = [(SHMediaItem *)self validValueForProperty:@"sh_genres"];
  char v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x263EFFA68];
  }
  id v4 = v2;

  return v4;
}

- (NSString)isrc
{
  return (NSString *)[(SHMediaItem *)self validValueForProperty:@"sh_isrc"];
}

- (NSString)albumName
{
  return (NSString *)[(SHMediaItem *)self validValueForProperty:@"sh_albumName"];
}

- (NSString)lyricsSnippet
{
  return (NSString *)[(SHMediaItem *)self validValueForProperty:@"sh_lyricsSnippet"];
}

- (int64_t)shazamCount
{
  v2 = [(SHMediaItem *)self validValueForProperty:@"sh_shazamCount"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (NSArray)staticLyricLines
{
  return (NSArray *)[(SHMediaItem *)self validValueForProperty:@"sh_staticLyricLines"];
}

- (NSArray)timeRanges
{
  return (NSArray *)[(SHMediaItem *)self validValueForProperty:@"sh_timeRanges"];
}

- (NSArray)frequencySkewRanges
{
  return (NSArray *)[(SHMediaItem *)self validValueForProperty:@"sh_frequencySkewRanges"];
}

- (NSDate)creationDate
{
  return (NSDate *)[(SHMediaItem *)self validValueForProperty:@"sh_creationDate"];
}

- (NSUUID)identifier
{
  int64_t v3 = [(SHMediaItem *)self validValueForProperty:@"sh_identifier"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SHMediaItem *)self underlyingIdentifier];
  }
  id v6 = v5;

  return (NSUUID *)v6;
}

- (NSString)providerIdentifier
{
  return (NSString *)[(SHMediaItem *)self validValueForProperty:@"sh_providerIdentifier"];
}

- (CLLocation)matchLocation
{
  return (CLLocation *)[(SHMediaItem *)self validValueForProperty:@"sh_matchLocation"];
}

- (double)duration
{
  v2 = [(SHMediaItem *)self validValueForProperty:@"sh_duration"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (id)validValueForProperty:(id)a3
{
  id v4 = a3;
  id v5 = [(SHMediaItem *)self properties];
  id v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && +[SHMediaItemPropertyUtilities isShazamKitDefinedMediaItemProperty:v4])
  {
    id v7 = 0;
  }
  else
  {
    if (v6)
    {
      if (+[SHMediaItemPropertyUtilities isShazamKitDefinedMediaItemProperty:v4])
      {
        +[SHMediaItemPropertyUtilities typeForShazamKitProperty:v4];
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v9 = (void *)MEMORY[0x263EFF940];
          uint64_t v10 = *MEMORY[0x263EFF498];
          objc_super v11 = [NSString stringWithFormat:@"Value for %@ is not of the correct type: %@", v4, v6];
          id v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];

          objc_exception_throw(v12);
        }
      }
    }
    id v7 = v6;
  }

  return v7;
}

- (NSString)fuzzyRepresentation
{
  fuzzyRepresentation = self->_fuzzyRepresentation;
  if (!fuzzyRepresentation)
  {
    id v4 = [(SHMediaItem *)self title];
    id v5 = objc_msgSend(MEMORY[0x263F08708], "characterSetWithCharactersInString:", @"([");
    uint64_t v6 = [v4 rangeOfCharacterFromSet:v5];

    id v7 = [MEMORY[0x263F08708] alphanumericCharacterSet];
    uint64_t v8 = [v7 invertedSet];

    uint64_t v9 = [(SHMediaItem *)self title];
    uint64_t v10 = v9;
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_super v11 = [v9 lowercaseString];
      id v12 = [v11 componentsSeparatedByCharactersInSet:v8];
      id v13 = [v12 componentsJoinedByString:&stru_26D7DBEB0];
      v14 = self->_fuzzyRepresentation;
      self->_fuzzyRepresentation = v13;
    }
    else
    {
      objc_super v11 = [v9 substringToIndex:v6];
      id v12 = [v11 lowercaseString];
      v14 = [v12 componentsSeparatedByCharactersInSet:v8];
      v15 = [v14 componentsJoinedByString:&stru_26D7DBEB0];
      v16 = self->_fuzzyRepresentation;
      self->_fuzzyRepresentation = v15;
    }
    fuzzyRepresentation = self->_fuzzyRepresentation;
  }

  return fuzzyRepresentation;
}

- (BOOL)describesFrequencySkew:(double)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = [(SHMediaItem *)self frequencySkewRanges];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = [(SHMediaItem *)self frequencySkewRanges];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          if ([*(id *)(*((void *)&v12 + 1) + 8 * i) contains:a3])
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)describesOffset:(double)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = [(SHMediaItem *)self timeRanges];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = [(SHMediaItem *)self timeRanges];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      double v10 = a3 + 0.01;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          if ([*(id *)(*((void *)&v13 + 1) + 8 * i) contains:v10])
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

+ (void)fetchMediaItemWithShazamID:(NSString *)shazamID completionHandler:(void *)completionHandler
{
}

+ (void)fetchMediaItemsWithShazamIDs:(id)a3 completionHandler:(id)a4
{
}

+ (void)fetchHapticsWithMediaItems:(id)a3 completionHandler:(id)a4
{
}

+ (void)isHapticTrackAvailableForMediaItem:(id)a3 completionHandler:(id)a4
{
}

- (NSUUID)underlyingIdentifier
{
  return self->_underlyingIdentifier;
}

- (void)setUnderlyingIdentifier:(id)a3
{
}

- (NSDictionary)_rawResponseSongs
{
  return self->__rawResponseSongs;
}

- (void)set_rawResponseSongs:(id)a3
{
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->__rawResponseSongs, 0);
  objc_storeStrong((id *)&self->_underlyingIdentifier, 0);

  objc_storeStrong((id *)&self->_fuzzyRepresentation, 0);
}

@end