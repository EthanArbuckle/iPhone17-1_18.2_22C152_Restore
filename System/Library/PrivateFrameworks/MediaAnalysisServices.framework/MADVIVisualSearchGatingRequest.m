@interface MADVIVisualSearchGatingRequest
+ (BOOL)supportsSecureCoding;
+ (unint64_t)targetResolution;
- (CLLocation)location;
- (MADVIVisualSearchGatingRequest)initWithCoder:(id)a3;
- (NSArray)domains;
- (NSNumber)imageType;
- (NSNumber)queryID;
- (NSString)engagementSuggestionType;
- (NSString)featureIdentifier;
- (NSURL)imageURL;
- (NSURL)referralURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDomains:(id)a3;
- (void)setEngagementSuggestionType:(id)a3;
- (void)setFeatureIdentifier:(id)a3;
- (void)setImageType:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setLocation:(id)a3;
- (void)setQueryID:(id)a3;
- (void)setReferralURL:(id)a3;
@end

@implementation MADVIVisualSearchGatingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)targetResolution
{
  return 3048192;
}

- (MADVIVisualSearchGatingRequest)initWithCoder:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MADVIVisualSearchGatingRequest;
  v5 = [(MADRequest *)&v26 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"QueryID"];
    queryID = v5->_queryID;
    v5->_queryID = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Location"];
    location = v5->_location;
    v5->_location = (CLLocation *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ImageURL"];
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReferralURL"];
    referralURL = v5->_referralURL;
    v5->_referralURL = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ImageType"];
    imageType = v5->_imageType;
    v5->_imageType = (NSNumber *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    v18 = [v16 setWithArray:v17];

    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"Domains"];
    domains = v5->_domains;
    v5->_domains = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FeatureIdentifier"];
    featureIdentifier = v5->_featureIdentifier;
    v5->_featureIdentifier = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EngagementSuggestionType"];
    engagementSuggestionType = v5->_engagementSuggestionType;
    v5->_engagementSuggestionType = (NSString *)v23;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADVIVisualSearchGatingRequest;
  id v4 = a3;
  [(MADRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryID, @"QueryID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_location forKey:@"Location"];
  [v4 encodeObject:self->_imageURL forKey:@"ImageURL"];
  [v4 encodeObject:self->_referralURL forKey:@"ReferralURL"];
  [v4 encodeObject:self->_imageType forKey:@"ImageType"];
  [v4 encodeObject:self->_domains forKey:@"Domains"];
  [v4 encodeObject:self->_featureIdentifier forKey:@"FeatureIdentifier"];
  [v4 encodeObject:self->_engagementSuggestionType forKey:@"EngagementSuggestionType"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  if (self->_queryID) {
    [v3 appendFormat:@"queryID: %@, ", self->_queryID];
  }
  if (self->_location) {
    [v3 appendFormat:@"location: %@, ", self->_location];
  }
  if (self->_imageURL) {
    [v3 appendFormat:@"imageURL: <redacted>, "];
  }
  if (self->_referralURL) {
    [v3 appendFormat:@"referralURL: <redacted>, "];
  }
  if (self->_imageType) {
    [v3 appendFormat:@"imageType: %@, ", self->_imageType];
  }
  if (self->_domains) {
    [v3 appendFormat:@"domains: %@, ", self->_domains];
  }
  if (self->_featureIdentifier) {
    [v3 appendFormat:@"featureIdentifier: %@, ", self->_featureIdentifier];
  }
  if (self->_engagementSuggestionType) {
    [v3 appendFormat:@"engagementSuggestionType: %@, ", self->_engagementSuggestionType];
  }
  uint64_t v6 = [(MADRequest *)self results];
  [v3 appendFormat:@"results: %@, ", v6];

  v7 = [(MADRequest *)self error];
  [v3 appendFormat:@"error: %@>", v7];

  return v3;
}

- (NSNumber)queryID
{
  return self->_queryID;
}

- (void)setQueryID:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (NSURL)referralURL
{
  return self->_referralURL;
}

- (void)setReferralURL:(id)a3
{
}

- (NSNumber)imageType
{
  return self->_imageType;
}

- (void)setImageType:(id)a3
{
}

- (NSArray)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(id)a3
{
}

- (NSString)engagementSuggestionType
{
  return self->_engagementSuggestionType;
}

- (void)setEngagementSuggestionType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementSuggestionType, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_referralURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_queryID, 0);
}

@end