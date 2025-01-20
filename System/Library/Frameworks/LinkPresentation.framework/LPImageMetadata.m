@interface LPImageMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (LPImageMetadata)init;
- (LPImageMetadata)initWithCoder:(id)a3;
- (NSString)accessibilityText;
- (NSString)type;
- (NSURL)URL;
- (id)_initWithDictionary:(id)a3;
- (unint64_t)hash;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityText:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setType:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation LPImageMetadata

- (LPImageMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPImageMetadata;
  v2 = [(LPImageMetadata *)&v6 init];
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
  v5 = [(LPImageMetadata *)self init];
  if (v5
    && (URLForKey(v4, @"LPMetadataImageURL"),
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        URL = v5->_URL,
        v5->_URL = (NSURL *)v6,
        URL,
        v5->_URL))
  {
    uint64_t v8 = stringForKey(v4, @"LPMetadataImageType");
    type = v5->_type;
    v5->_type = (NSString *)v8;

    uint64_t v10 = stringForKey(v4, @"LPMetadataImageAccessibilityText");
    accessibilityText = v5->_accessibilityText;
    v5->_accessibilityText = (NSString *)v10;

    v12 = numberForKey(v4, @"LPMetadataImageWidth");
    uint64_t v13 = numberForKey(v4, @"LPMetadataImageHeight");
    v14 = (void *)v13;
    if (v12 && v13)
    {
      [v12 doubleValue];
      CGFloat v16 = v15;
      [v14 doubleValue];
      v5->_size.width = v16;
      v5->_size.height = v17;
    }
    v18 = v5;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPImageMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LPImageMetadata;
  v5 = [(LPImageMetadata *)&v16 init];
  if (v5)
  {
    v5->_version = [v4 decodeInt32ForKey:@"version"];
    uint64_t v6 = decodeURLForKey(v4, @"URL");
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"type");
    type = v5->_type;
    v5->_type = (NSString *)v8;

    [v4 decodeCGSizeForKey:@"size"];
    v5->_size.width = v10;
    v5->_size.height = v11;
    uint64_t v12 = decodeStringForKey(v4, @"accessibilityText");
    accessibilityText = v5->_accessibilityText;
    v5->_accessibilityText = (NSString *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt32:self->_version forKey:@"version"];
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_URL, @"URL");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_type, @"type");
  objc_msgSend(v4, "encodeCGSize:forKey:", @"size", self->_size.width, self->_size.height);
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_accessibilityText, @"accessibilityText");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPImageMetadata;
  if ([(LPImageMetadata *)&v9 isEqual:v4])
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
      if (*((_DWORD *)v6 + 2) == self->_version
        && (objectsAreEqual_0(v6[2], self->_URL) & 1) != 0
        && objectsAreEqual_0(v7[3], self->_type))
      {
        char v5 = 0;
        if (*((double *)v7 + 5) == self->_size.width && *((double *)v7 + 6) == self->_size.height) {
          char v5 = objectsAreEqual_0(v7[4], self->_accessibilityText);
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