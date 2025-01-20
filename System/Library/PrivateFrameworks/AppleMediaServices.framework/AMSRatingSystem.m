@interface AMSRatingSystem
+ (id)ratingSystemWithDictionary:(id)a3;
- (AMSRatingSystem)initWithDictionary:(id)a3;
- (NSArray)contentRatings;
- (NSArray)types;
- (NSString)kind;
- (NSString)label;
- (NSString)ratingSystemID;
- (id)description;
@end

@implementation AMSRatingSystem

- (AMSRatingSystem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSRatingSystem;
  v5 = [(AMSRatingSystem *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"id"];
    ratingSystemID = v5->_ratingSystemID;
    v5->_ratingSystemID = (NSString *)v6;

    uint64_t v8 = [v4 valueForKeyPath:@"attributes.kind"];
    kind = v5->_kind;
    v5->_kind = (NSString *)v8;

    uint64_t v10 = [v4 valueForKeyPath:@"attributes.label"];
    label = v5->_label;
    v5->_label = (NSString *)v10;

    uint64_t v12 = [v4 valueForKeyPath:@"attributes.types"];
    types = v5->_types;
    v5->_types = (NSArray *)v12;

    v14 = [v4 valueForKeyPath:@"relationships.ratings.data"];
    uint64_t v15 = objc_msgSend(v14, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_113);
    contentRatings = v5->_contentRatings;
    v5->_contentRatings = (NSArray *)v15;
  }
  return v5;
}

AMSContentRating *__38__AMSRatingSystem_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AMSContentRating contentRatingWithDictionary:a2];
}

+ (id)ratingSystemWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [[AMSRatingSystem alloc] initWithDictionary:v3];

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(AMSRatingSystem *)self kind];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, @"kind");

  v5 = [(AMSRatingSystem *)self ratingSystemID];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, @"id");

  uint64_t v6 = [(AMSRatingSystem *)self label];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, @"label");

  v7 = [(AMSRatingSystem *)self types];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, @"types");

  uint64_t v8 = [(AMSRatingSystem *)self contentRatings];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, @"contentRatings");

  v9 = [self ams_generateDescriptionWithSubObjects:v3];

  return v9;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)label
{
  return self->_label;
}

- (NSArray)contentRatings
{
  return self->_contentRatings;
}

- (NSString)ratingSystemID
{
  return self->_ratingSystemID;
}

- (NSArray)types
{
  return self->_types;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_ratingSystemID, 0);
  objc_storeStrong((id *)&self->_contentRatings, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

@end