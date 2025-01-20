@interface CRKShareRequest
+ (BOOL)supportsSecureCoding;
- (CRKShareRequest)initWithCoder:(id)a3;
- (DMFControlGroupIdentifier)courseIdentifier;
- (NSArray)urls;
- (NSData)previewImageData;
- (NSDictionary)sandboxExtensions;
- (NSString)shareDescription;
- (NSString)sourceBundleIdentifier;
- (NSString)targetIdentifier;
- (NSString)targetType;
- (void)encodeWithCoder:(id)a3;
- (void)setCourseIdentifier:(id)a3;
- (void)setPreviewImageData:(id)a3;
- (void)setSandboxExtensions:(id)a3;
- (void)setShareDescription:(id)a3;
- (void)setSourceBundleIdentifier:(id)a3;
- (void)setTargetIdentifier:(id)a3;
- (void)setTargetType:(id)a3;
- (void)setUrls:(id)a3;
@end

@implementation CRKShareRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKShareRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CRKShareRequest;
  v5 = [(CATTaskRequest *)&v32 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"courseIdentifier"];
    courseIdentifier = v5->_courseIdentifier;
    v5->_courseIdentifier = (DMFControlGroupIdentifier *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"targetType"];
    targetType = v5->_targetType;
    v5->_targetType = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"targetIdentifier"];
    targetIdentifier = v5->_targetIdentifier;
    v5->_targetIdentifier = (NSString *)v13;

    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"urls"];
    urls = v5->_urls;
    v5->_urls = (NSArray *)v18;

    v20 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"shareDescription"];
    shareDescription = v5->_shareDescription;
    v5->_shareDescription = (NSString *)v21;

    v23 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"previewImageData"];
    previewImageData = v5->_previewImageData;
    v5->_previewImageData = (NSData *)v24;

    uint64_t v26 = [v4 decodePropertyListForKey:@"sandboxExtensions"];
    sandboxExtensions = v5->_sandboxExtensions;
    v5->_sandboxExtensions = (NSDictionary *)v26;

    v28 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"sourceBundleIdentifier"];
    sourceBundleIdentifier = v5->_sourceBundleIdentifier;
    v5->_sourceBundleIdentifier = (NSString *)v29;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CRKShareRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v13 encodeWithCoder:v4];
  v5 = [(CRKShareRequest *)self courseIdentifier];
  [v4 encodeObject:v5 forKey:@"courseIdentifier"];

  v6 = [(CRKShareRequest *)self targetType];
  [v4 encodeObject:v6 forKey:@"targetType"];

  uint64_t v7 = [(CRKShareRequest *)self targetIdentifier];
  [v4 encodeObject:v7 forKey:@"targetIdentifier"];

  v8 = [(CRKShareRequest *)self urls];
  [v4 encodeObject:v8 forKey:@"urls"];

  v9 = [(CRKShareRequest *)self shareDescription];
  [v4 encodeObject:v9 forKey:@"shareDescription"];

  uint64_t v10 = [(CRKShareRequest *)self previewImageData];
  [v4 encodeObject:v10 forKey:@"previewImageData"];

  v11 = [(CRKShareRequest *)self sandboxExtensions];
  [v4 encodeObject:v11 forKey:@"sandboxExtensions"];

  v12 = [(CRKShareRequest *)self sourceBundleIdentifier];
  [v4 encodeObject:v12 forKey:@"sourceBundleIdentifier"];
}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
}

- (NSString)targetType
{
  return self->_targetType;
}

- (void)setTargetType:(id)a3
{
}

- (NSString)targetIdentifier
{
  return self->_targetIdentifier;
}

- (void)setTargetIdentifier:(id)a3
{
}

- (NSArray)urls
{
  return self->_urls;
}

- (void)setUrls:(id)a3
{
}

- (NSString)shareDescription
{
  return self->_shareDescription;
}

- (void)setShareDescription:(id)a3
{
}

- (NSData)previewImageData
{
  return self->_previewImageData;
}

- (void)setPreviewImageData:(id)a3
{
}

- (NSDictionary)sandboxExtensions
{
  return self->_sandboxExtensions;
}

- (void)setSandboxExtensions:(id)a3
{
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (void)setSourceBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sandboxExtensions, 0);
  objc_storeStrong((id *)&self->_previewImageData, 0);
  objc_storeStrong((id *)&self->_shareDescription, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
  objc_storeStrong((id *)&self->_targetType, 0);

  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end