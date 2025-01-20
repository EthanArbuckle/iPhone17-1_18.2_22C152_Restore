@interface _BlastDoorLPVideoMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (NSString)accessibilityText;
- (NSString)type;
- (NSURL)URL;
- (_BlastDoorLPVideoMetadata)init;
- (_BlastDoorLPVideoMetadata)initWithCoder:(id)a3;
- (id)_initWithDictionary:(id)a3;
- (unint64_t)hash;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityText:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setType:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation _BlastDoorLPVideoMetadata

- (_BlastDoorLPVideoMetadata)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)_BlastDoorLPVideoMetadata;
  v2 = [(_BlastDoorLPVideoMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v4 = v2;
  }

  return v3;
}

- (id)_initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(_BlastDoorLPVideoMetadata *)self init];
  if (v5
    && (URLForKey(v4, @"LPMetadataVideoURL"),
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        URL = v5->_URL,
        v5->_URL = (NSURL *)v6,
        URL,
        v5->_URL))
  {
    uint64_t v8 = stringForKey(v4, @"LPMetadataVideoType");
    type = v5->_type;
    v5->_type = (NSString *)v8;

    v10 = numberForKey(v4, @"LPMetadataVideoWidth");
    uint64_t v11 = numberForKey(v4, @"LPMetadataVideoHeight");
    v12 = (void *)v11;
    if (v10 && v11)
    {
      [v10 doubleValue];
      CGFloat v14 = v13;
      [v12 doubleValue];
      v5->_size.width = v14;
      v5->_size.height = v15;
    }
    v16 = v5;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPVideoMetadata)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_BlastDoorLPVideoMetadata;
  v5 = [(_BlastDoorLPVideoMetadata *)&v16 init];
  if (v5)
  {
    v5->_version = [v4 decodeInt32ForKey:@"version"];
    uint64_t v6 = decodeURLForKey(v4, @"URL");
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"type");
    type = v5->_type;
    v5->_type = (NSString *)v8;

    [v4 decodeSizeForKey:@"size"];
    v5->_size.width = v10;
    v5->_size.height = v11;
    uint64_t v12 = decodeStringForKey(v4, @"accessibilityText");
    accessibilityText = v5->_accessibilityText;
    v5->_accessibilityText = (NSString *)v12;

    CGFloat v14 = v5;
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
  objc_msgSend(v5, "encodeSize:forKey:", @"size", self->_size.width, self->_size.height);
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_accessibilityText, @"accessibilityText");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_BlastDoorLPVideoMetadata;
  if ([(_BlastDoorLPVideoMetadata *)&v13 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (unint64_t *)v4;
      uint64_t v7 = (double *)v6;
      if (*((_DWORD *)v6 + 2) == self->_version
        && ((unint64_t v8 = v6[2], !(v8 | (unint64_t)self->_URL)) || objc_msgSend((id)v8, "isEqual:"))
        && ((unint64_t v9 = *((void *)v7 + 3), !(v9 | (unint64_t)self->_type))
         || objc_msgSend((id)v9, "isEqual:"))
        && (v7[5] == self->_size.width ? (BOOL v10 = v7[6] == self->_size.height) : (BOOL v10 = 0), v10))
      {
        unint64_t v12 = *((void *)v7 + 4);
        if (v12 | (unint64_t)self->_accessibilityText) {
          char v5 = objc_msgSend((id)v12, "isEqual:");
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

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
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