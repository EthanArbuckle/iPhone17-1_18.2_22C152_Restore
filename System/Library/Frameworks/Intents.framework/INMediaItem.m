@interface INMediaItem
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INImage)artwork;
- (INMediaItem)initWithCoder:(id)a3;
- (INMediaItem)initWithIdentifier:(NSString *)identifier title:(NSString *)title type:(INMediaItemType)type artwork:(INImage *)artwork;
- (INMediaItem)initWithIdentifier:(NSString *)identifier title:(NSString *)title type:(INMediaItemType)type artwork:(INImage *)artwork artist:(NSString *)artist;
- (INMediaItem)initWithIdentifier:(id)a3 title:(id)a4 type:(int64_t)a5 artwork:(id)a6 artist:(id)a7 topics:(id)a8 namedEntities:(id)a9;
- (INMediaItem)initWithIdentifier:(id)a3 title:(id)a4 type:(int64_t)a5 artwork:(id)a6 artist:(id)a7 topics:(id)a8 namedEntities:(id)a9 assetInfo:(id)a10;
- (INMediaItem)initWithIdentifier:(id)a3 title:(id)a4 type:(int64_t)a5 artwork:(id)a6 artist:(id)a7 topics:(id)a8 namedEntities:(id)a9 privateMediaItemValueData:(id)a10;
- (INMediaItemType)type;
- (INPrivateMediaItemValueData)privateMediaItemValueData;
- (NSDictionary)namedEntities;
- (NSDictionary)topics;
- (NSString)artist;
- (NSString)assetInfo;
- (NSString)description;
- (NSString)identifier;
- (NSString)title;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (id)spokenPhrase;
- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4;
- (unint64_t)hash;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setPrivateMediaItemValueData:(id)a3;
@end

@implementation INMediaItem

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  return INKeyImageUtilitiesDefaultCompareSubProducers(a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateMediaItemValueData, 0);
  objc_storeStrong((id *)&self->_assetInfo, 0);
  objc_storeStrong((id *)&self->_namedEntities, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setPrivateMediaItemValueData:(id)a3
{
}

- (INPrivateMediaItemValueData)privateMediaItemValueData
{
  return self->_privateMediaItemValueData;
}

- (NSString)assetInfo
{
  return self->_assetInfo;
}

- (NSDictionary)namedEntities
{
  return self->_namedEntities;
}

- (NSDictionary)topics
{
  return self->_topics;
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtwork:(id)a3
{
}

- (INImage)artwork
{
  return self->_artwork;
}

- (INMediaItemType)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)_dictionaryRepresentation
{
  v15[5] = *MEMORY[0x1E4F143B8];
  v14[0] = @"identifier";
  identifier = self->_identifier;
  v4 = identifier;
  if (!identifier)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v4;
  v14[1] = @"title";
  title = self->_title;
  v6 = title;
  if (!title)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v6;
  v14[2] = @"type";
  v7 = [NSNumber numberWithInteger:self->_type];
  v15[2] = v7;
  v14[3] = @"artwork";
  artwork = self->_artwork;
  v9 = artwork;
  if (!artwork)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[3] = v9;
  v14[4] = @"artist";
  artist = self->_artist;
  v11 = artist;
  if (!artist)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[4] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];
  if (artist)
  {
    if (artwork) {
      goto LABEL_11;
    }
  }
  else
  {

    if (artwork) {
      goto LABEL_11;
    }
  }

LABEL_11:
  if (title)
  {
    if (identifier) {
      goto LABEL_13;
    }
  }
  else
  {

    if (identifier) {
      goto LABEL_13;
    }
  }

LABEL_13:

  return v12;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INMediaItem;
  v6 = [(INMediaItem *)&v11 description];
  v7 = [(INMediaItem *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INMediaItem *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_identifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"identifier");

  v9 = [v6 encodeObject:self->_title];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"title");

  unint64_t v10 = self->_type - 1;
  if (v10 > 0x13) {
    objc_super v11 = @"unknown";
  }
  else {
    objc_super v11 = *(&off_1E551E500 + v10);
  }
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"type");

  v13 = [v6 encodeObject:self->_artwork];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"artwork");

  v14 = [v6 encodeObject:self->_artist];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"artist");

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", self->_topics, @"topics");
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", self->_namedEntities, @"namedEntities");
  v15 = [v6 encodeObject:self->_privateMediaItemValueData];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"privateMediaItemValueData");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_artwork forKey:@"artwork"];
  [v5 encodeObject:self->_artist forKey:@"artist"];
  [v5 encodeObject:self->_topics forKey:@"topics"];
  [v5 encodeObject:self->_namedEntities forKey:@"namedEntities"];
  [v5 encodeObject:self->_privateMediaItemValueData forKey:@"privateMediaItemValueData"];
}

- (INMediaItem)initWithCoder:(id)a3
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v25 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v24 = [v3 decodeObjectOfClasses:v6 forKey:@"title"];

  uint64_t v23 = [v3 decodeIntegerForKey:@"type"];
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"artwork"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  unint64_t v10 = [v3 decodeObjectOfClasses:v9 forKey:@"artist"];

  objc_super v11 = (void *)MEMORY[0x1E4F1CAD0];
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v28[2] = objc_opt_class();
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  v13 = [v11 setWithArray:v12];
  v14 = [v3 decodeObjectOfClasses:v13 forKey:@"topics"];

  v15 = (void *)MEMORY[0x1E4F1CAD0];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
  v17 = [v15 setWithArray:v16];
  v18 = [v3 decodeObjectOfClasses:v17 forKey:@"namedEntities"];

  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"privateMediaItemValueData"];

  v20 = [(INMediaItem *)self initWithIdentifier:v25 title:v24 type:v23 artwork:v22 artist:v10 topics:v14 namedEntities:v18 privateMediaItemValueData:v19];
  return v20;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INMediaItem *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      identifier = self->_identifier;
      BOOL v9 = 0;
      if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
      {
        title = self->_title;
        if ((title == v5->_title || -[NSString isEqual:](title, "isEqual:")) && self->_type == v5->_type)
        {
          artist = self->_artist;
          if (artist == v5->_artist || -[NSString isEqual:](artist, "isEqual:")) {
            BOOL v9 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_title hash] ^ v3;
  uint64_t v5 = [NSNumber numberWithInteger:self->_type];
  uint64_t v6 = [v5 hash];
  NSUInteger v7 = v4 ^ [(NSString *)self->_artist hash] ^ v6;

  return v7;
}

- (INMediaItem)initWithIdentifier:(id)a3 title:(id)a4 type:(int64_t)a5 artwork:(id)a6 artist:(id)a7 topics:(id)a8 namedEntities:(id)a9 privateMediaItemValueData:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v39.receiver = self;
  v39.super_class = (Class)INMediaItem;
  uint64_t v23 = [(INMediaItem *)&v39 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    identifier = v23->_identifier;
    v23->_identifier = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    title = v23->_title;
    v23->_title = (NSString *)v26;

    v23->_type = a5;
    uint64_t v28 = [v18 copy];
    artwork = v23->_artwork;
    v23->_artwork = (INImage *)v28;

    uint64_t v30 = [v19 copy];
    artist = v23->_artist;
    v23->_artist = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    topics = v23->_topics;
    v23->_topics = (NSDictionary *)v32;

    uint64_t v34 = [v21 copy];
    namedEntities = v23->_namedEntities;
    v23->_namedEntities = (NSDictionary *)v34;

    uint64_t v36 = [v22 copy];
    privateMediaItemValueData = v23->_privateMediaItemValueData;
    v23->_privateMediaItemValueData = (INPrivateMediaItemValueData *)v36;
  }
  return v23;
}

- (INMediaItem)initWithIdentifier:(id)a3 title:(id)a4 type:(int64_t)a5 artwork:(id)a6 artist:(id)a7 topics:(id)a8 namedEntities:(id)a9 assetInfo:(id)a10
{
  return -[INMediaItem initWithIdentifier:title:type:artwork:artist:topics:namedEntities:privateMediaItemValueData:](self, "initWithIdentifier:title:type:artwork:artist:topics:namedEntities:privateMediaItemValueData:", a3, a4, a5, a6, a7, a8);
}

- (INMediaItem)initWithIdentifier:(id)a3 title:(id)a4 type:(int64_t)a5 artwork:(id)a6 artist:(id)a7 topics:(id)a8 namedEntities:(id)a9
{
  return [(INMediaItem *)self initWithIdentifier:a3 title:a4 type:a5 artwork:a6 artist:a7 topics:a8 namedEntities:a9 privateMediaItemValueData:0];
}

- (INMediaItem)initWithIdentifier:(NSString *)identifier title:(NSString *)title type:(INMediaItemType)type artwork:(INImage *)artwork
{
  return [(INMediaItem *)self initWithIdentifier:identifier title:title type:type artwork:artwork artist:0 topics:0 namedEntities:0 privateMediaItemValueData:0];
}

- (INMediaItem)initWithIdentifier:(NSString *)identifier title:(NSString *)title type:(INMediaItemType)type artwork:(INImage *)artwork artist:(NSString *)artist
{
  v12 = identifier;
  v13 = title;
  v14 = artwork;
  v15 = artist;
  v26.receiver = self;
  v26.super_class = (Class)INMediaItem;
  id v16 = [(INMediaItem *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [(NSString *)v12 copy];
    id v18 = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    uint64_t v19 = [(NSString *)v13 copy];
    id v20 = v16->_title;
    v16->_title = (NSString *)v19;

    v16->_type = type;
    uint64_t v21 = [(INImage *)v14 copy];
    id v22 = v16->_artwork;
    v16->_artwork = (INImage *)v21;

    uint64_t v23 = [(NSString *)v15 copy];
    uint64_t v24 = v16->_artist;
    v16->_artist = (NSString *)v23;
  }
  return v16;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  BOOL v9 = [v7 objectForKeyedSubscript:@"identifier"];
  unint64_t v10 = [v7 objectForKeyedSubscript:@"title"];
  objc_super v11 = [v7 objectForKeyedSubscript:@"type"];
  uint64_t v12 = INMediaItemTypeWithString(v11);

  uint64_t v13 = objc_opt_class();
  v14 = [v7 objectForKeyedSubscript:@"artwork"];
  v15 = [v8 decodeObjectOfClass:v13 from:v14];

  id v16 = [v7 objectForKeyedSubscript:@"artist"];
  uint64_t v17 = [v7 objectForKeyedSubscript:@"topics"];
  id v18 = [v7 objectForKeyedSubscript:@"topics"];
  uint64_t v19 = [v7 objectForKeyedSubscript:@"privateMediaItemValueData"];

  id v20 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v9 title:v10 type:v12 artwork:v15 artist:v16 topics:v17 namedEntities:v18 privateMediaItemValueData:v19];

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, void *, void *))a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (void *)[(INMediaItem *)self copy];
    BOOL v9 = [(INMediaItem *)self artwork];
    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __73__INMediaItem_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
      v10[3] = &unk_1E551E2D0;
      v10[4] = v8;
      id v11 = v7;
      v6[2](v6, v9, v10);
    }
    else
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v8);
    }
  }
}

uint64_t __73__INMediaItem_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setArtwork:a2];
  NSUInteger v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (id)spokenPhrase
{
  NSUInteger v3 = [(INMediaItem *)self title];
  NSUInteger v4 = [(INMediaItem *)self artist];
  if ([v3 length] && objc_msgSend(v4, "length"))
  {
    uint64_t v5 = NSString;
    uint64_t v6 = +[INStringLocalizer siriLocalizer];
    id v7 = INLocalizedStringWithLocalizer(@"%1$@ by %2$@", 0, v6);
    objc_msgSend(v5, "stringWithFormat:", v7, v3, v4);
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_4:
    goto LABEL_10;
  }
  if ([v3 length])
  {
    BOOL v9 = v3;
  }
  else
  {
    if (![v4 length])
    {
      uint64_t v6 = [(INMediaItem *)self identifier];
      uint64_t v11 = [(__CFString *)v6 length];
      uint64_t v12 = &stru_1EDA6DB28;
      if (v11) {
        uint64_t v12 = v6;
      }
      id v8 = v12;
      goto LABEL_4;
    }
    BOOL v9 = v4;
  }
  id v8 = v9;
LABEL_10:

  return v8;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(INMediaItem *)self artwork];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [(INMediaItem *)self artwork];
    id v7 = [v6 _identifier];
    id v8 = [v13 cacheableObjectForIdentifier:v7];

    if (v8)
    {
      BOOL v9 = [(INMediaItem *)self artwork];
      unint64_t v10 = [v9 _identifier];
      uint64_t v11 = [v13 cacheableObjectForIdentifier:v10];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [(INMediaItem *)self artwork];
        [v11 _imageSize];
        objc_msgSend(v12, "_setImageSize:");
      }
    }
  }
}

- (id)_intents_cacheableObjects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(INMediaItem *)self artwork];

  if (v4)
  {
    uint64_t v5 = [(INMediaItem *)self artwork];
    [v3 addObject:v5];
  }
  if ([v3 count]) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

@end