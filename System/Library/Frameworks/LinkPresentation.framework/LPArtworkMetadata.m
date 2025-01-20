@interface LPArtworkMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LPArtworkMetadata)init;
- (LPArtworkMetadata)initWithCoder:(id)a3;
- (NSDictionary)colors;
- (NSURL)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
- (void)setColors:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation LPArtworkMetadata

- (LPArtworkMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPArtworkMetadata;
  v2 = [(LPArtworkMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v4 = v2;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPArtworkMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LPArtworkMetadata;
  v5 = [(LPArtworkMetadata *)&v13 init];
  if (v5)
  {
    v5->_version = [v4 decodeInt32ForKey:@"version"];
    uint64_t v6 = decodeURLForKey(v4, @"URL");
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v4, "_lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass:andObjectsOfClass:forKey:", v8, objc_opt_class(), @"colors");
    colors = v5->_colors;
    v5->_colors = (NSDictionary *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt32:self->_version forKey:@"version"];
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_URL, @"URL");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_colors, @"colors");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPArtworkMetadata allocWithZone:a3];
  if (v4)
  {
    v4->_version = [(LPArtworkMetadata *)self version];
    v5 = [(LPArtworkMetadata *)self URL];
    [(LPArtworkMetadata *)v4 setURL:v5];

    uint64_t v6 = [(LPArtworkMetadata *)self colors];
    [(LPArtworkMetadata *)v4 setColors:v6];

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPArtworkMetadata;
  if ([(LPArtworkMetadata *)&v9 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      v7 = v6;
      if (*((_DWORD *)v6 + 2) == self->_version && (objectsAreEqual_0(v6[2], self->_URL) & 1) != 0) {
        char v5 = objectsAreEqual_0(v7[3], self->_colors);
      }
      else {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSURL *)self->_URL hash];
}

- (unsigned)version
{
  return self->_version;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSDictionary)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end