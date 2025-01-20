@interface SLFacebookAlbum
+ (BOOL)supportsSecureCoding;
+ (id)albumWithDataDictionary:(id)a3;
+ (id)albumsWithAlbumDataDictionaries:(id)a3;
- (BOOL)canUpload;
- (BOOL)isDefaultAlbum;
- (NSString)coverPhotoIdentifier;
- (NSString)identifier;
- (NSString)name;
- (SLFacebookAlbum)initWithCoder:(id)a3;
- (id)description;
- (int64_t)count;
- (void)encodeWithCoder:(id)a3;
- (void)setCanUpload:(BOOL)a3;
- (void)setCount:(int64_t)a3;
- (void)setCoverPhotoIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsDefaultAlbum:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation SLFacebookAlbum

- (SLFacebookAlbum)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SLFacebookAlbum;
  v5 = [(SLFacebookAlbum *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(SLFacebookAlbum *)v5 setIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(SLFacebookAlbum *)v5 setName:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coverPhotoIdentifier"];
    [(SLFacebookAlbum *)v5 setCoverPhotoIdentifier:v8];

    -[SLFacebookAlbum setCount:](v5, "setCount:", [v4 decodeIntegerForKey:@"count"]);
    -[SLFacebookAlbum setCanUpload:](v5, "setCanUpload:", [v4 decodeBoolForKey:@"canUpload"]);
    -[SLFacebookAlbum setIsDefaultAlbum:](v5, "setIsDefaultAlbum:", [v4 decodeBoolForKey:@"isDefaultAlbum"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(SLFacebookAlbum *)self identifier];
  [v7 encodeObject:v4 forKey:@"identifier"];

  v5 = [(SLFacebookAlbum *)self name];
  [v7 encodeObject:v5 forKey:@"name"];

  v6 = [(SLFacebookAlbum *)self coverPhotoIdentifier];
  [v7 encodeObject:v6 forKey:@"coverPhotoIdentifier"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[SLFacebookAlbum count](self, "count"), @"count");
  objc_msgSend(v7, "encodeBool:forKey:", -[SLFacebookAlbum canUpload](self, "canUpload"), @"canUpload");
  objc_msgSend(v7, "encodeBool:forKey:", -[SLFacebookAlbum isDefaultAlbum](self, "isDefaultAlbum"), @"isDefaultAlbum");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)albumWithDataDictionary:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && ([v4 objectForKeyedSubscript:@"id"],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    _SLLog(v3, 6, @"Creating album with dict %@");
    id v7 = objc_alloc_init(SLFacebookAlbum);
    v8 = objc_msgSend(v5, "objectForKeyedSubscript:", @"id", v5);
    [(SLFacebookAlbum *)v7 setIdentifier:v8];

    v9 = [v5 objectForKeyedSubscript:@"name"];
    [(SLFacebookAlbum *)v7 setName:v9];

    objc_super v10 = [v5 objectForKeyedSubscript:@"photo_count"];
    -[SLFacebookAlbum setCount:](v7, "setCount:", (int)[v10 intValue]);

    v11 = [v5 objectForKeyedSubscript:@"cover_photo"];
    [(SLFacebookAlbum *)v7 setCoverPhotoIdentifier:v11];

    v12 = [v5 objectForKeyedSubscript:@"can_upload"];

    if (v12)
    {
      v13 = [v5 objectForKeyedSubscript:@"can_upload"];
      -[SLFacebookAlbum setCanUpload:](v7, "setCanUpload:", [v13 BOOLValue]);

      [(SLFacebookAlbum *)v7 canUpload];
      _SLLog(v3, 6, @"Setting canUpload=%s");
    }
    else
    {
      _SLLog(v3, 6, @"Assuming can_upload");
      [(SLFacebookAlbum *)v7 setCanUpload:1];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)albumsWithAlbumDataDictionaries:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = objc_msgSend((id)objc_opt_class(), "albumWithDataDictionary:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(SLFacebookAlbum *)self identifier];
  id v5 = [(SLFacebookAlbum *)self name];
  BOOL v6 = [(SLFacebookAlbum *)self isDefaultAlbum];
  uint64_t v7 = @"NO";
  if (v6) {
    uint64_t v7 = @"YES";
  }
  uint64_t v8 = [v3 stringWithFormat:@"<SLFacebookAlbum: identifier=%@ name=%@ isDefaultAlbum=%@", v4, v5, v7];

  return v8;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)coverPhotoIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCoverPhotoIdentifier:(id)a3
{
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (BOOL)canUpload
{
  return self->_canUpload;
}

- (void)setCanUpload:(BOOL)a3
{
  self->_canUpload = a3;
}

- (BOOL)isDefaultAlbum
{
  return self->_isDefaultAlbum;
}

- (void)setIsDefaultAlbum:(BOOL)a3
{
  self->_isDefaultAlbum = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverPhotoIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end