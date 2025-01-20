@interface MADVIVisualSearchThirdPartyObject
+ (BOOL)supportsSecureCoding;
- (MADVIVisualSearchThirdPartyObject)initWithCoder:(id)a3;
- (MADVIVisualSearchThirdPartyObject)initWithObjectIdentifier:(id)a3 imageURL:(id)a4 thumbnailURL:(id)a5 metadata:(id)a6;
- (NSData)metadata;
- (NSString)imageURL;
- (NSString)objectIdentifier;
- (NSString)thumbnailURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVIVisualSearchThirdPartyObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIVisualSearchThirdPartyObject)initWithObjectIdentifier:(id)a3 imageURL:(id)a4 thumbnailURL:(id)a5 metadata:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MADVIVisualSearchThirdPartyObject;
  v15 = [(MADVIVisualSearchThirdPartyObject *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_objectIdentifier, a3);
    objc_storeStrong((id *)&v16->_imageURL, a4);
    objc_storeStrong((id *)&v16->_thumbnailURL, a5);
    objc_storeStrong((id *)&v16->_metadata, a6);
  }

  return v16;
}

- (MADVIVisualSearchThirdPartyObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MADVIVisualSearchThirdPartyObject;
  v5 = [(MADVIVisualSearchThirdPartyObject *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ObjectIdentifier"];
    objectIdentifier = v5->_objectIdentifier;
    v5->_objectIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ImageURL"];
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ThumbnailURL"];
    thumbnailURL = v5->_thumbnailURL;
    v5->_thumbnailURL = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (NSData *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objectIdentifier = self->_objectIdentifier;
  id v5 = a3;
  [v5 encodeObject:objectIdentifier forKey:@"ObjectIdentifier"];
  [v5 encodeObject:self->_imageURL forKey:@"ImageURL"];
  [v5 encodeObject:self->_thumbnailURL forKey:@"ThumbnailURL"];
  [v5 encodeObject:self->_metadata forKey:@"Metadata"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"objectIdentifier: '%@'", self->_objectIdentifier];
  if (self->_imageURL) {
    [v3 appendFormat:@", imageURL: '%@'", self->_imageURL];
  }
  if (self->_thumbnailURL) {
    [v3 appendFormat:@", thumbnailURL: '%@'", self->_thumbnailURL];
  }
  if (self->_metadata) {
    [v3 appendFormat:@", metadata: '%@'", self->_metadata];
  }
  [v3 appendString:@">"];
  return v3;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (NSString)thumbnailURL
{
  return self->_thumbnailURL;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

@end