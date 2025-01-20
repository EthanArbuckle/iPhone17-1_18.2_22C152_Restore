@interface MADVITextLookupRequest
+ (BOOL)supportsSecureCoding;
- (MADVITextLookupRequest)initWithCoder:(id)a3;
- (MADVITextLookupRequest)initWithQueryTerm:(id)a3;
- (MADVITextLookupRequest)initWithQueryTerm:(id)a3 domain:(id)a4 textContext:(id)a5;
- (NSArray)normalizedBoundingBoxes;
- (NSNumber)queryID;
- (NSNumber)uiScale;
- (NSString)engagementSuggestionType;
- (NSString)hintDomain;
- (NSString)queryTerm;
- (NSString)surroundingText;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEngagementSuggestionType:(id)a3;
- (void)setHintDomain:(id)a3;
- (void)setNormalizedBoundingBoxes:(id)a3;
- (void)setQueryID:(id)a3;
- (void)setSurroundingText:(id)a3;
- (void)setUiScale:(id)a3;
@end

@implementation MADVITextLookupRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVITextLookupRequest)initWithQueryTerm:(id)a3 domain:(id)a4 textContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MADVITextLookupRequest;
  v11 = [(MADVITextLookupRequest *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    queryTerm = v11->_queryTerm;
    v11->_queryTerm = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    hintDomain = v11->_hintDomain;
    v11->_hintDomain = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    surroundingText = v11->_surroundingText;
    v11->_surroundingText = (NSString *)v16;

    normalizedBoundingBoxes = v11->_normalizedBoundingBoxes;
    v11->_normalizedBoundingBoxes = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v11;
}

- (MADVITextLookupRequest)initWithQueryTerm:(id)a3
{
  return [(MADVITextLookupRequest *)self initWithQueryTerm:a3 domain:0 textContext:0];
}

- (MADVITextLookupRequest)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MADVITextLookupRequest;
  v5 = [(MADRequest *)&v24 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"QueryTerm"];
    queryTerm = v5->_queryTerm;
    v5->_queryTerm = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HintDomain"];
    hintDomain = v5->_hintDomain;
    v5->_hintDomain = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SurroundingText"];
    surroundingText = v5->_surroundingText;
    v5->_surroundingText = (NSString *)v10;

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    uint64_t v14 = [v12 setWithArray:v13];

    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"NormalizedBoundingBoxes"];
    normalizedBoundingBoxes = v5->_normalizedBoundingBoxes;
    v5->_normalizedBoundingBoxes = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"QueryID"];
    queryID = v5->_queryID;
    v5->_queryID = (NSNumber *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIScale"];
    uiScale = v5->_uiScale;
    v5->_uiScale = (NSNumber *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EngagementSuggestionType"];
    engagementSuggestionType = v5->_engagementSuggestionType;
    v5->_engagementSuggestionType = (NSString *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADVITextLookupRequest;
  id v4 = a3;
  [(MADRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryTerm, @"QueryTerm", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_hintDomain forKey:@"HintDomain"];
  [v4 encodeObject:self->_surroundingText forKey:@"SurroundingText"];
  [v4 encodeObject:self->_normalizedBoundingBoxes forKey:@"NormalizedBoundingBoxes"];
  [v4 encodeObject:self->_queryID forKey:@"QueryID"];
  [v4 encodeObject:self->_uiScale forKey:@"UIScale"];
  [v4 encodeObject:self->_engagementSuggestionType forKey:@"EngagementSuggestionType"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"queryTerm: %@, ", self->_queryTerm];
  if (self->_hintDomain) {
    [v3 appendFormat:@"hintDomain: %@, ", self->_hintDomain];
  }
  if (self->_surroundingText) {
    [v3 appendFormat:@"surroundingText: %@, ", self->_surroundingText];
  }
  if (self->_normalizedBoundingBoxes) {
    [v3 appendFormat:@"normalizedBoundingBoxes: %@, ", self->_normalizedBoundingBoxes];
  }
  if (self->_queryID) {
    [v3 appendFormat:@"queryID: %@, ", self->_queryID];
  }
  if (self->_uiScale) {
    [v3 appendFormat:@"uiScale: %@, ", self->_uiScale];
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

- (NSString)hintDomain
{
  return self->_hintDomain;
}

- (void)setHintDomain:(id)a3
{
}

- (NSString)surroundingText
{
  return self->_surroundingText;
}

- (void)setSurroundingText:(id)a3
{
}

- (NSArray)normalizedBoundingBoxes
{
  return self->_normalizedBoundingBoxes;
}

- (void)setNormalizedBoundingBoxes:(id)a3
{
}

- (NSString)queryTerm
{
  return self->_queryTerm;
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
  objc_storeStrong((id *)&self->_uiScale, 0);
  objc_storeStrong((id *)&self->_queryID, 0);
  objc_storeStrong((id *)&self->_queryTerm, 0);
  objc_storeStrong((id *)&self->_normalizedBoundingBoxes, 0);
  objc_storeStrong((id *)&self->_surroundingText, 0);
  objc_storeStrong((id *)&self->_hintDomain, 0);
}

@end