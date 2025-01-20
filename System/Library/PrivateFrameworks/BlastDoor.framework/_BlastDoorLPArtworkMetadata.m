@interface _BlastDoorLPArtworkMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)colors;
- (NSURL)URL;
- (_BlastDoorLPArtworkMetadata)init;
- (_BlastDoorLPArtworkMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
- (void)setColors:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation _BlastDoorLPArtworkMetadata

- (_BlastDoorLPArtworkMetadata)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)_BlastDoorLPArtworkMetadata;
  v2 = [(_BlastDoorLPArtworkMetadata *)&v6 init];
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

- (_BlastDoorLPArtworkMetadata)initWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_BlastDoorLPArtworkMetadata;
  v5 = [(_BlastDoorLPArtworkMetadata *)&v13 init];
  if (v5)
  {
    v5->_version = [v4 decodeInt32ForKey:@"version"];
    uint64_t v6 = decodeURLForKey(v4, @"URL");
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v4, "_bd_lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass:andObjectsOfClass:forKey:", v8, objc_opt_class(), @"colors");
    colors = v5->_colors;
    v5->_colors = (NSDictionary *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInt32:version forKey:@"version"];
  objc_msgSend(v5, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_URL, @"URL");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_colors, @"colors");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPArtworkMetadata allocWithZone:a3];
  if (v4)
  {
    v4->_uint64_t version = [(_BlastDoorLPArtworkMetadata *)self version];
    id v5 = [(_BlastDoorLPArtworkMetadata *)self URL];
    [(_BlastDoorLPArtworkMetadata *)v4 setURL:v5];

    uint64_t v6 = [(_BlastDoorLPArtworkMetadata *)self colors];
    [(_BlastDoorLPArtworkMetadata *)v4 setColors:v6];

    uint64_t v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BlastDoorLPArtworkMetadata;
  if ([(_BlastDoorLPArtworkMetadata *)&v11 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v4;
      uint64_t v7 = v6;
      if (*((_DWORD *)v6 + 2) == self->_version
        && ((unint64_t v8 = v6[2], !(v8 | (unint64_t)self->_URL)) || objc_msgSend((id)v8, "isEqual:")))
      {
        unint64_t v9 = v7[3];
        if (v9 | (unint64_t)self->_colors) {
          char v5 = objc_msgSend((id)v9, "isEqual:");
        }
        else {
          char v5 = 1;
        }
      }
      else
      {
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