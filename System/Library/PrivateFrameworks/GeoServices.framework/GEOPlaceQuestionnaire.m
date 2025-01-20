@interface GEOPlaceQuestionnaire
- (BOOL)alwaysPositionInitialRatingCtaTowardsTop;
- (BOOL)canCollectPhotos;
- (BOOL)canCollectRatings;
- (BOOL)canShowCallToAction;
- (GEOPlaceQuestionnaire)initWithGEOPDPlaceQuestionnaire:(id)a3;
- (NSArray)ratingCategories;
- (NSString)version;
- (float)maxAspectRatio;
- (unint64_t)maxPixels;
- (unint64_t)maximumNumberOfPhotos;
- (unint64_t)minPixels;
@end

@implementation GEOPlaceQuestionnaire

- (GEOPlaceQuestionnaire)initWithGEOPDPlaceQuestionnaire:(id)a3
{
  v4 = (id *)a3;
  v5 = -[GEOPDPlaceQuestionnaireResult scorecardLayout](v4);
  if (v5)
  {
  }
  else if (!-[GEOPDPlaceQuestionnaireResult collectPhotos]((BOOL)v4))
  {
    v18 = 0;
    goto LABEL_17;
  }
  v20.receiver = self;
  v20.super_class = (Class)GEOPlaceQuestionnaire;
  v6 = [(GEOPlaceQuestionnaire *)&v20 init];
  if (v6)
  {
    uint64_t v7 = -[GEOPDPlaceQuestionnaireResult scorecardLayout](v4);
    scorecardLayout = v6->_scorecardLayout;
    v6->_scorecardLayout = (GEOPDScorecardLayout *)v7;

    if (v4) {
      BOOL v9 = *((unsigned char *)v4 + 64) != 0;
    }
    else {
      BOOL v9 = 0;
    }
    v6->_alwaysPositionInitialRatingCtaTowardsTop = v9;
    v6->_canCollectPhotos = -[GEOPDPlaceQuestionnaireResult collectPhotos]((BOOL)v4);
    -[GEOPDPlaceQuestionnaireResult photoConstraints](v4);
    v10 = (unsigned int *)objc_claimAutoreleasedReturnValue();
    if (v10) {
      unint64_t v11 = v10[9];
    }
    else {
      unint64_t v11 = 0;
    }
    v6->_maximumNumberOfPhotos = v11;

    v12 = -[GEOPDPlaceQuestionnaireResult photoConstraints](v4);
    if (v12) {
      unint64_t v13 = v12[1];
    }
    else {
      unint64_t v13 = 0;
    }
    v6->_maxPixels = v13;

    v14 = -[GEOPDPlaceQuestionnaireResult photoConstraints](v4);
    if (v14) {
      unint64_t v15 = v14[3];
    }
    else {
      unint64_t v15 = 0;
    }
    v6->_minPixels = v15;

    -[GEOPDPlaceQuestionnaireResult photoConstraints](v4);
    v16 = (float *)objc_claimAutoreleasedReturnValue();
    if (v16) {
      float v17 = v16[8];
    }
    else {
      float v17 = 0.0;
    }
    v6->_maxAspectRatio = v17;
  }
  self = v6;
  v18 = self;
LABEL_17:

  return v18;
}

- (BOOL)canCollectRatings
{
  return self->_scorecardLayout != 0;
}

- (BOOL)canShowCallToAction
{
  if ([(GEOPlaceQuestionnaire *)self canCollectPhotos]) {
    return 1;
  }

  return [(GEOPlaceQuestionnaire *)self canCollectRatings];
}

- (NSString)version
{
  return -[GEOPDScorecardLayout version]((id *)&self->_scorecardLayout->super.super.isa);
}

- (NSArray)ratingCategories
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  ratingCategories = self->_ratingCategories;
  if (!ratingCategories)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = -[GEOPDScorecardLayout ratingCategorys]((id *)&self->_scorecardLayout->super.super.isa);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
          unint64_t v11 = [GEOAppleRatingCategory alloc];
          v12 = -[GEOAppleRatingCategory initWithRatingCategory:](v11, "initWithRatingCategory:", v10, (void)v16);
          [v4 addObject:v12];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    unint64_t v13 = (NSArray *)[v4 copy];
    v14 = self->_ratingCategories;
    self->_ratingCategories = v13;

    ratingCategories = self->_ratingCategories;
  }

  return ratingCategories;
}

- (BOOL)alwaysPositionInitialRatingCtaTowardsTop
{
  return self->_alwaysPositionInitialRatingCtaTowardsTop;
}

- (BOOL)canCollectPhotos
{
  return self->_canCollectPhotos;
}

- (unint64_t)maximumNumberOfPhotos
{
  return self->_maximumNumberOfPhotos;
}

- (unint64_t)maxPixels
{
  return self->_maxPixels;
}

- (unint64_t)minPixels
{
  return self->_minPixels;
}

- (float)maxAspectRatio
{
  return self->_maxAspectRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingCategories, 0);
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_scorecardLayout, 0);
}

@end