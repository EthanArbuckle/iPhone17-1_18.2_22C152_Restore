@interface PHMemoryPresentationHints
+ (int64_t)tripTypeFromMemory:(id)a3;
+ (unint64_t)socialRelationshipsFromMemory:(id)a3;
- (NSDictionary)musicGenreDistribution;
- (NSString)description;
- (PHMemoryPresentationHints)initWithMemory:(id)a3;
- (int64_t)qualityCategory;
- (int64_t)tripType;
- (unint64_t)forbiddenMoods;
- (unint64_t)recommendedMoods;
- (unint64_t)socialRelationships;
@end

@implementation PHMemoryPresentationHints

- (void).cxx_destruct
{
}

- (int64_t)qualityCategory
{
  return self->_qualityCategory;
}

- (NSDictionary)musicGenreDistribution
{
  return self->_musicGenreDistribution;
}

- (int64_t)tripType
{
  return self->_tripType;
}

- (unint64_t)socialRelationships
{
  return self->_socialRelationships;
}

- (unint64_t)forbiddenMoods
{
  return self->_forbiddenMoods;
}

- (unint64_t)recommendedMoods
{
  return self->_recommendedMoods;
}

- (NSString)description
{
  v3 = PHCollectionPresentationHintsStringsFromSocialRelationships([(PHMemoryPresentationHints *)self socialRelationships]);
  v4 = [v3 componentsJoinedByString:@", "];

  v11.receiver = self;
  v11.super_class = (Class)PHMemoryPresentationHints;
  v5 = [(PHMemoryPresentationHints *)&v11 description];
  v6 = PHCollectionPresentationHintsStringFromTripType([(PHMemoryPresentationHints *)self tripType]);
  v7 = PHCollectionPresentationHintsStringFromQualityCategory([(PHMemoryPresentationHints *)self qualityCategory]);
  v8 = [(PHMemoryPresentationHints *)self musicGenreDistribution];
  v9 = [v5 stringByAppendingFormat:@"%@|%@|%@|%@", v6, v7, v4, v8];

  return (NSString *)v9;
}

- (PHMemoryPresentationHints)initWithMemory:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHMemoryPresentationHints;
  v5 = [(PHMemoryPresentationHints *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 musicGenreDistribution];
    musicGenreDistribution = v5->_musicGenreDistribution;
    v5->_musicGenreDistribution = (NSDictionary *)v6;

    v5->_tripType = [(id)objc_opt_class() tripTypeFromMemory:v4];
    v5->_socialRelationships = [(id)objc_opt_class() socialRelationshipsFromMemory:v4];
    v8 = [v4 photosGraphProperties];
    v5->_recommendedMoods = 0;
    v9 = [v8 objectForKeyedSubscript:@"recommendedMoods"];
    v10 = v9;
    if (v9) {
      v5->_recommendedMoods = PHMemoryMoodForString(v9);
    }
    v5->_forbiddenMoods = 0;
    objc_super v11 = [v8 objectForKeyedSubscript:@"forbiddenMoods"];
    v12 = v11;
    if (v11) {
      v5->_forbiddenMoods = PHMemoryMoodForString(v11);
    }
    v5->_qualityCategory = 0;
    if ([v4 isMustSee])
    {
      uint64_t v13 = 3;
    }
    else if ([v4 isStellar])
    {
      uint64_t v13 = 2;
    }
    else
    {
      if (![v4 isGreat])
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v13 = 1;
    }
    v5->_qualityCategory = v13;
    goto LABEL_13;
  }
LABEL_14:

  return v5;
}

+ (int64_t)tripTypeFromMemory:(id)a3
{
  id v3 = a3;
  if ([v3 category] == 301)
  {
    uint64_t v4 = [v3 subcategory];
    if (v4 == 215) {
      int64_t v5 = 2;
    }
    else {
      int64_t v5 = v4 == 205;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

+ (unint64_t)socialRelationshipsFromMemory:(id)a3
{
  return 0;
}

@end