@interface MADVIVisualSearchRegionAttributes
+ (BOOL)supportsSecureCoding;
- (MADVIVisualSearchRegionAttributes)initWithCoder:(id)a3;
- (MADVIVisualSearchRegionAttributes)initWithDomain:(id)a3 knowledgeGraphID:(id)a4 title:(id)a5 thumbnailURL:(id)a6 thumbnailAspectRatio:(float)a7 shortDescription:(id)a8 detailedDescription:(id)a9 webURL:(id)a10 knowledgeProperties:(id)a11;
- (MADVIVisualSearchThirdPartyObject)thirdPartyObject;
- (NSDictionary)knowledgeProperties;
- (NSString)detailedDescription;
- (NSString)domain;
- (NSString)knowledgeGraphID;
- (NSString)shortDescription;
- (NSString)title;
- (NSURL)thumbnailURL;
- (NSURL)webURL;
- (float)thumbnailAspectRatio;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setThirdPartyObject:(id)a3;
@end

@implementation MADVIVisualSearchRegionAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIVisualSearchRegionAttributes)initWithDomain:(id)a3 knowledgeGraphID:(id)a4 title:(id)a5 thumbnailURL:(id)a6 thumbnailAspectRatio:(float)a7 shortDescription:(id)a8 detailedDescription:(id)a9 webURL:(id)a10 knowledgeProperties:(id)a11
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a8;
  id v24 = a9;
  id v23 = a10;
  id v19 = a11;
  v30.receiver = self;
  v30.super_class = (Class)MADVIVisualSearchRegionAttributes;
  v20 = [(MADVIVisualSearchRegionAttributes *)&v30 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_domain, a3);
    objc_storeStrong((id *)&v21->_knowledgeGraphID, a4);
    objc_storeStrong((id *)&v21->_title, a5);
    objc_storeStrong((id *)&v21->_thumbnailURL, a6);
    v21->_thumbnailAspectRatio = a7;
    objc_storeStrong((id *)&v21->_shortDescription, a8);
    objc_storeStrong((id *)&v21->_detailedDescription, a9);
    objc_storeStrong((id *)&v21->_webURL, a10);
    objc_storeStrong((id *)&v21->_knowledgeProperties, a11);
  }

  return v21;
}

- (MADVIVisualSearchRegionAttributes)initWithCoder:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MADVIVisualSearchRegionAttributes;
  v5 = [(MADVIVisualSearchRegionAttributes *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Domain"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"KnowledgeGraphID"];
    knowledgeGraphID = v5->_knowledgeGraphID;
    v5->_knowledgeGraphID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Title"];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ThumbnailURL"];
    thumbnailURL = v5->_thumbnailURL;
    v5->_thumbnailURL = (NSURL *)v12;

    [v4 decodeFloatForKey:@"ThumbnailAspectRatio"];
    v5->_thumbnailAspectRatio = v14;
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ShortDescription"];
    shortDescription = v5->_shortDescription;
    v5->_shortDescription = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DetailedDescription"];
    detailedDescription = v5->_detailedDescription;
    v5->_detailedDescription = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WebURL"];
    webURL = v5->_webURL;
    v5->_webURL = (NSURL *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    id v23 = [v21 setWithArray:v22];

    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"KnowledgeProperties"];
    knowledgeProperties = v5->_knowledgeProperties;
    v5->_knowledgeProperties = (NSDictionary *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ThirdPartyObject"];
    thirdPartyObject = v5->_thirdPartyObject;
    v5->_thirdPartyObject = (MADVIVisualSearchThirdPartyObject *)v26;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  domain = self->_domain;
  id v6 = a3;
  [v6 encodeObject:domain forKey:@"Domain"];
  [v6 encodeObject:self->_knowledgeGraphID forKey:@"KnowledgeGraphID"];
  [v6 encodeObject:self->_title forKey:@"Title"];
  [v6 encodeObject:self->_thumbnailURL forKey:@"ThumbnailURL"];
  *(float *)&double v5 = self->_thumbnailAspectRatio;
  [v6 encodeFloat:@"ThumbnailAspectRatio" forKey:v5];
  [v6 encodeObject:self->_shortDescription forKey:@"ShortDescription"];
  [v6 encodeObject:self->_detailedDescription forKey:@"DetailedDescription"];
  [v6 encodeObject:self->_webURL forKey:@"WebURL"];
  [v6 encodeObject:self->_knowledgeProperties forKey:@"KnowledgeProperties"];
  [v6 encodeObject:self->_thirdPartyObject forKey:@"ThirdPartyObject"];
}

- (void)setThirdPartyObject:(id)a3
{
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"domain: '%@', ", self->_domain];
  [v3 appendFormat:@"knowledgeGraphID: '%@', ", self->_knowledgeGraphID];
  [v3 appendFormat:@"title: '%@', ", self->_title];
  [v3 appendFormat:@"thumbnailURL: '%@', ", self->_thumbnailURL];
  [v3 appendFormat:@"thumbnailAspectRatio: %0.2f, ", self->_thumbnailAspectRatio];
  [v3 appendFormat:@"shortDescription: '%@', ", self->_shortDescription];
  [v3 appendFormat:@"detailedDescription: '%@', ", self->_detailedDescription];
  [v3 appendFormat:@"webURL: '%@', ", self->_webURL];
  [v3 appendFormat:@"knowledgeProperties: %@", self->_knowledgeProperties];
  if (self->_thirdPartyObject) {
    [v3 appendFormat:@", thirdPartyObject: %@", self->_thirdPartyObject];
  }
  [v3 appendString:@">"];
  return v3;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)knowledgeGraphID
{
  return self->_knowledgeGraphID;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)thumbnailURL
{
  return self->_thumbnailURL;
}

- (float)thumbnailAspectRatio
{
  return self->_thumbnailAspectRatio;
}

- (NSString)shortDescription
{
  return self->_shortDescription;
}

- (NSString)detailedDescription
{
  return self->_detailedDescription;
}

- (NSURL)webURL
{
  return self->_webURL;
}

- (NSDictionary)knowledgeProperties
{
  return self->_knowledgeProperties;
}

- (MADVIVisualSearchThirdPartyObject)thirdPartyObject
{
  return self->_thirdPartyObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyObject, 0);
  objc_storeStrong((id *)&self->_knowledgeProperties, 0);
  objc_storeStrong((id *)&self->_webURL, 0);
  objc_storeStrong((id *)&self->_detailedDescription, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_knowledgeGraphID, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end