@interface _BlastDoorLPARAssetMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)accessibilityText;
- (NSString)type;
- (NSURL)URL;
- (_BlastDoorLPARAssetMetadata)init;
- (_BlastDoorLPARAssetMetadata)initWithCoder:(id)a3;
- (id)_initWithDictionary:(id)a3;
- (id)_initWithURL:(id)a3;
- (unint64_t)hash;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityText:(id)a3;
- (void)setType:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation _BlastDoorLPARAssetMetadata

- (_BlastDoorLPARAssetMetadata)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)_BlastDoorLPARAssetMetadata;
  v2 = [(_BlastDoorLPARAssetMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v4 = v2;
  }

  return v3;
}

- (id)_initWithURL:(id)a3
{
  id v5 = a3;
  objc_super v6 = [(_BlastDoorLPARAssetMetadata *)self init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URL, a3);
    v8 = v7;
  }

  return v7;
}

- (id)_initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(_BlastDoorLPARAssetMetadata *)self init];
  if (v5
    && (URLForKey(v4, @"LPMetadataARAssetURL"),
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        URL = v5->_URL,
        v5->_URL = (NSURL *)v6,
        URL,
        v5->_URL))
  {
    uint64_t v8 = stringForKey(v4, @"LPMetadataARAssetType");
    type = v5->_type;
    v5->_type = (NSString *)v8;

    uint64_t v10 = stringForKey(v4, @"LPMetadataARAssetAccessibilityText");
    accessibilityText = v5->_accessibilityText;
    v5->_accessibilityText = (NSString *)v10;

    v12 = v5;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPARAssetMetadata)initWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPARAssetMetadata;
  id v5 = [(_BlastDoorLPARAssetMetadata *)&v14 init];
  if (v5)
  {
    v5->_version = [v4 decodeInt32ForKey:@"version"];
    uint64_t v6 = decodeURLForKey(v4, @"URL");
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"type");
    type = v5->_type;
    v5->_type = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"accessibilityText");
    accessibilityText = v5->_accessibilityText;
    v5->_accessibilityText = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInt32:version forKey:@"version"];
  objc_msgSend(v5, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_URL, @"URL");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_type, @"type");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_accessibilityText, @"accessibilityText");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BlastDoorLPARAssetMetadata;
  if ([(_BlastDoorLPARAssetMetadata *)&v11 isEqual:v4])
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
        unint64_t v9 = v7[4];
        if (v9 | (unint64_t)self->_accessibilityText) {
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

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (void)setAccessibilityText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityText, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end