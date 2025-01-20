@interface CRKDownloadResourcesRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (BOOL)openAfterDownloadCompletes;
- (CRKDownloadResourcesRequest)initWithCoder:(id)a3;
- (DMFControlGroupIdentifier)courseIdentifier;
- (NSArray)resources;
- (NSData)previewImageData;
- (NSString)resourcesDescription;
- (NSString)sourceBundleIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setCourseIdentifier:(id)a3;
- (void)setOpenAfterDownloadCompletes:(BOOL)a3;
- (void)setPreviewImageData:(id)a3;
- (void)setResources:(id)a3;
- (void)setResourcesDescription:(id)a3;
- (void)setSourceBundleIdentifier:(id)a3;
@end

@implementation CRKDownloadResourcesRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKDownloadResourcesRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CRKDownloadResourcesRequest;
  v5 = [(CATTaskRequest *)&v25 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"courseIdentifier"];
    courseIdentifier = v5->_courseIdentifier;
    v5->_courseIdentifier = (DMFControlGroupIdentifier *)v7;

    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"resources"];
    resources = v5->_resources;
    v5->_resources = (NSArray *)v12;

    v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"resourcesDescription"];
    resourcesDescription = v5->_resourcesDescription;
    v5->_resourcesDescription = (NSString *)v15;

    v17 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"previewImageData"];
    previewImageData = v5->_previewImageData;
    v5->_previewImageData = (NSData *)v18;

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"openAfterDownloadCompletes"];
    v5->_openAfterDownloadCompletes = [v20 BOOLValue];

    v21 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"sourceBundleIdentifier"];
    sourceBundleIdentifier = v5->_sourceBundleIdentifier;
    v5->_sourceBundleIdentifier = (NSString *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CRKDownloadResourcesRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v11 encodeWithCoder:v4];
  v5 = [(CRKDownloadResourcesRequest *)self courseIdentifier];
  [v4 encodeObject:v5 forKey:@"courseIdentifier"];

  v6 = [(CRKDownloadResourcesRequest *)self resources];
  [v4 encodeObject:v6 forKey:@"resources"];

  uint64_t v7 = [(CRKDownloadResourcesRequest *)self resourcesDescription];
  [v4 encodeObject:v7 forKey:@"resourcesDescription"];

  v8 = [(CRKDownloadResourcesRequest *)self previewImageData];
  [v4 encodeObject:v8 forKey:@"previewImageData"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKDownloadResourcesRequest openAfterDownloadCompletes](self, "openAfterDownloadCompletes"));
  [v4 encodeObject:v9 forKey:@"openAfterDownloadCompletes"];

  uint64_t v10 = [(CRKDownloadResourcesRequest *)self sourceBundleIdentifier];
  [v4 encodeObject:v10 forKey:@"sourceBundleIdentifier"];
}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
}

- (NSString)resourcesDescription
{
  return self->_resourcesDescription;
}

- (void)setResourcesDescription:(id)a3
{
}

- (NSData)previewImageData
{
  return self->_previewImageData;
}

- (void)setPreviewImageData:(id)a3
{
}

- (BOOL)openAfterDownloadCompletes
{
  return self->_openAfterDownloadCompletes;
}

- (void)setOpenAfterDownloadCompletes:(BOOL)a3
{
  self->_openAfterDownloadCompletes = a3;
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
  objc_storeStrong((id *)&self->_previewImageData, 0);
  objc_storeStrong((id *)&self->_resourcesDescription, 0);
  objc_storeStrong((id *)&self->_resources, 0);

  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end