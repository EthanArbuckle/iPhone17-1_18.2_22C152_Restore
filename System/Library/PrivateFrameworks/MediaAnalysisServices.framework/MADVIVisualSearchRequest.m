@interface MADVIVisualSearchRequest
+ (BOOL)supportsSecureCoding;
+ (unint64_t)targetResolution;
- (CLLocation)location;
- (MADVIVisualSearchRequest)init;
- (MADVIVisualSearchRequest)initWithCoder:(id)a3;
- (MADVIVisualSearchRequest)initWithGatingResultItems:(id)a3 andPayload:(id)a4;
- (MADVIVisualSearchRequest)initWithGatingResultItems:(id)a3 payload:(id)a4 documentObservations:(id)a5;
- (NSArray)catalogIDs;
- (NSArray)documentObservations;
- (NSArray)gatingResultItems;
- (NSData)gatingPayload;
- (NSNumber)imageType;
- (NSNumber)queryID;
- (NSNumber)uiScale;
- (NSString)engagementSuggestionType;
- (NSString)featureIdentifier;
- (NSURL)imageURL;
- (NSURL)referralURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCatalogIDs:(id)a3;
- (void)setEngagementSuggestionType:(id)a3;
- (void)setFeatureIdentifier:(id)a3;
- (void)setImageType:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setLocation:(id)a3;
- (void)setQueryID:(id)a3;
- (void)setReferralURL:(id)a3;
- (void)setUiScale:(id)a3;
@end

@implementation MADVIVisualSearchRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)targetResolution
{
  return 3048192;
}

- (MADVIVisualSearchRequest)initWithGatingResultItems:(id)a3 payload:(id)a4 documentObservations:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MADVIVisualSearchRequest;
  v12 = [(MADVIVisualSearchRequest *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_gatingResultItems, a3);
    objc_storeStrong((id *)&v13->_gatingPayload, a4);
    objc_storeStrong((id *)&v13->_documentObservations, a5);
  }

  return v13;
}

- (MADVIVisualSearchRequest)initWithGatingResultItems:(id)a3 andPayload:(id)a4
{
  return [(MADVIVisualSearchRequest *)self initWithGatingResultItems:a3 payload:a4 documentObservations:0];
}

- (MADVIVisualSearchRequest)init
{
  return [(MADVIVisualSearchRequest *)self initWithGatingResultItems:MEMORY[0x1E4F1CBF0] payload:0 documentObservations:0];
}

- (MADVIVisualSearchRequest)initWithCoder:(id)a3
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)MADVIVisualSearchRequest;
  v5 = [(MADRequest *)&v42 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v50[0] = objc_opt_class();
    v50[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"GatingResultItems"];
    gatingResultItems = v5->_gatingResultItems;
    v5->_gatingResultItems = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GatingPayload"];
    gatingPayload = v5->_gatingPayload;
    v5->_gatingPayload = (NSData *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"QueryID"];
    queryID = v5->_queryID;
    v5->_queryID = (NSNumber *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIScale"];
    uiScale = v5->_uiScale;
    v5->_uiScale = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Location"];
    location = v5->_location;
    v5->_location = (CLLocation *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ImageURL"];
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReferralURL"];
    referralURL = v5->_referralURL;
    v5->_referralURL = (NSURL *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ImageType"];
    imageType = v5->_imageType;
    v5->_imageType = (NSNumber *)v23;

    v25 = (void *)MEMORY[0x1E4F1CAD0];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    v27 = [v25 setWithArray:v26];

    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"CatalogIDs"];
    catalogIDs = v5->_catalogIDs;
    v5->_catalogIDs = (NSArray *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FeatureIdentifier"];
    featureIdentifier = v5->_featureIdentifier;
    v5->_featureIdentifier = (NSString *)v30;

    v32 = (void *)MEMORY[0x1E4F1CAD0];
    v48[0] = objc_opt_class();
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2050000000;
    v33 = (void *)getVNDocumentObservationClass_softClass;
    uint64_t v47 = getVNDocumentObservationClass_softClass;
    if (!getVNDocumentObservationClass_softClass)
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __getVNDocumentObservationClass_block_invoke;
      v43[3] = &unk_1E6CAD0C8;
      v43[4] = &v44;
      __getVNDocumentObservationClass_block_invoke((uint64_t)v43);
      v33 = (void *)v45[3];
    }
    id v34 = v33;
    _Block_object_dispose(&v44, 8);
    v48[1] = objc_opt_class();
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
    v36 = [v32 setWithArray:v35];

    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"DocumentObservations"];
    documentObservations = v5->_documentObservations;
    v5->_documentObservations = (NSArray *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EngagementSuggestionType"];
    engagementSuggestionType = v5->_engagementSuggestionType;
    v5->_engagementSuggestionType = (NSString *)v39;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADVIVisualSearchRequest;
  id v4 = a3;
  [(MADRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_gatingResultItems, @"GatingResultItems", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_gatingPayload forKey:@"GatingPayload"];
  [v4 encodeObject:self->_queryID forKey:@"QueryID"];
  [v4 encodeObject:self->_uiScale forKey:@"UIScale"];
  [v4 encodeObject:self->_location forKey:@"Location"];
  [v4 encodeObject:self->_imageURL forKey:@"ImageURL"];
  [v4 encodeObject:self->_referralURL forKey:@"ReferralURL"];
  [v4 encodeObject:self->_imageType forKey:@"ImageType"];
  [v4 encodeObject:self->_catalogIDs forKey:@"CatalogIDs"];
  [v4 encodeObject:self->_featureIdentifier forKey:@"FeatureIdentifier"];
  [v4 encodeObject:self->_documentObservations forKey:@"DocumentObservations"];
  [v4 encodeObject:self->_engagementSuggestionType forKey:@"EngagementSuggestionType"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"gatingResultItems: %@, ", self->_gatingResultItems];
  [v3 appendFormat:@"gatingPayload: %@, ", self->_gatingPayload];
  if (self->_queryID) {
    [v3 appendFormat:@"queryID: %@, ", self->_queryID];
  }
  if (self->_uiScale) {
    [v3 appendFormat:@"uiScale: %@, ", self->_uiScale];
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
  if (self->_catalogIDs) {
    [v3 appendFormat:@"catalogIDs: %@, ", self->_catalogIDs];
  }
  if (self->_featureIdentifier) {
    [v3 appendFormat:@"featureIdentifier: %@, ", self->_featureIdentifier];
  }
  if (self->_documentObservations) {
    [v3 appendFormat:@"documentObservations: %@, ", self->_documentObservations];
  }
  if (self->_engagementSuggestionType) {
    [v3 appendFormat:@"engagementSuggestionType: %@, ", self->_engagementSuggestionType];
  }
  v6 = [(MADRequest *)self results];
  [v3 appendFormat:@"results: %@, ", v6];

  v7 = [(MADRequest *)self error];
  [v3 appendFormat:@"error: %@>", v7];

  return v3;
}

- (NSArray)gatingResultItems
{
  return self->_gatingResultItems;
}

- (NSData)gatingPayload
{
  return self->_gatingPayload;
}

- (NSArray)documentObservations
{
  return self->_documentObservations;
}

- (NSNumber)queryID
{
  return self->_queryID;
}

- (void)setQueryID:(id)a3
{
}

- (NSNumber)uiScale
{
  return self->_uiScale;
}

- (void)setUiScale:(id)a3
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

- (NSArray)catalogIDs
{
  return self->_catalogIDs;
}

- (void)setCatalogIDs:(id)a3
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
  objc_storeStrong((id *)&self->_catalogIDs, 0);
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_referralURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_uiScale, 0);
  objc_storeStrong((id *)&self->_queryID, 0);
  objc_storeStrong((id *)&self->_documentObservations, 0);
  objc_storeStrong((id *)&self->_gatingPayload, 0);
  objc_storeStrong((id *)&self->_gatingResultItems, 0);
}

@end