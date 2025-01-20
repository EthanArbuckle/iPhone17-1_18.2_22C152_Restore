@interface LPARAssetMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LPARAssetMetadata)init;
- (LPARAssetMetadata)initWithCoder:(id)a3;
- (NSString)accessibilityText;
- (NSString)type;
- (NSURL)URL;
- (id)_initWithDictionary:(id)a3;
- (id)_initWithURL:(id)a3;
- (unint64_t)hash;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityText:(id)a3;
- (void)setType:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation LPARAssetMetadata

- (LPARAssetMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPARAssetMetadata;
  v2 = [(LPARAssetMetadata *)&v6 init];
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
  objc_super v6 = [(LPARAssetMetadata *)self init];
  v7 = v6;
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
  id v5 = [(LPARAssetMetadata *)self init];
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

- (LPARAssetMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LPARAssetMetadata;
  id v5 = [(LPARAssetMetadata *)&v14 init];
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
  id v4 = a3;
  [v4 encodeInt32:self->_version forKey:@"version"];
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_URL, @"URL");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_type, @"type");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_accessibilityText, @"accessibilityText");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPARAssetMetadata;
  if ([(LPARAssetMetadata *)&v9 isEqual:v4])
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
        char v5 = objectsAreEqual_0(v7[4], self->_accessibilityText);
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