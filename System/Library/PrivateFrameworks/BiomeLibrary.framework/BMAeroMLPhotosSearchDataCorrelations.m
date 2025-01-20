@interface BMAeroMLPhotosSearchDataCorrelations
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAeroMLPhotosSearchDataCorrelations)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAeroMLPhotosSearchDataCorrelations)initWithSearchSessionUUID:(id)a3 uiSurface:(int)a4 matchedPeopleRatio:(id)a5 matchedLocationRatio:(id)a6 matchedSceneRatio:(id)a7 matchedSceneConfidence:(id)a8 matchedSceneBoundingBox:(id)a9 matchedOCRCharacterRatio:(id)a10 matchedOCRImportance:(id)a11 matchedFieldsCount:(id)a12 L1Score:(id)a13 freshness:(id)a14 favorited:(id)a15 aestheticScore:(id)a16 curationScore:(id)a17 hasEverClickInLastWeek:(id)a18 hasEverClickInLastMonth:(id)a19 hasEverShareInLastWeek:(id)a20 hasEverShareInLastMonth:(id)a21 clickCountInLastWeekNormalizedAcrossItems:(id)a22 clickCountInLastMonthNormalizedAcrossItems:(id)a23 shareCountInLastWeekNormalizedAcrossItems:(id)a24 shareCountInLastMonthNormalizedAcrossItems:(id)a25 clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(id)a26 clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(id)a27 clickCountGivenLocationInLastWeekNormalizedAcrossItems:(id)a28 clickCountGivenLocationInLastMonthNormalizedAcrossItems:(id)a29 clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(id)a30 clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(id)a31 clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(id)a32 clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(id)a33 clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(id)a34 clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(id)a35 clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(id)a36 clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(id)a37 shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(id)a38 shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(id)a39 shareCountGivenLocationInLastWeekNormalizedAcrossItems:(id)a40 shareCountGivenLocationInLastMonthNormalizedAcrossItems:(id)a41 shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(id)a42 shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(id)a43 shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(id)a44 shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(id)a45 shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(id)a46 shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(id)a47 shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(id)a48 shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(id)a49 clipScore:(id)a50 correlationMetricVersion:(id)a51 correlationMetricWindowInDays:(id)a52;
- (BOOL)favorited;
- (BOOL)hasAestheticScore;
- (BOOL)hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
- (BOOL)hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
- (BOOL)hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
- (BOOL)hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
- (BOOL)hasClickCountGivenLocationInLastMonthNormalizedAcrossItems;
- (BOOL)hasClickCountGivenLocationInLastWeekNormalizedAcrossItems;
- (BOOL)hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
- (BOOL)hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
- (BOOL)hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
- (BOOL)hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
- (BOOL)hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
- (BOOL)hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
- (BOOL)hasClickCountInLastMonthNormalizedAcrossItems;
- (BOOL)hasClickCountInLastWeekNormalizedAcrossItems;
- (BOOL)hasClipScore;
- (BOOL)hasCorrelationMetricVersion;
- (BOOL)hasCorrelationMetricWindowInDays;
- (BOOL)hasCurationScore;
- (BOOL)hasFavorited;
- (BOOL)hasFreshness;
- (BOOL)hasHasEverClickInLastMonth;
- (BOOL)hasHasEverClickInLastWeek;
- (BOOL)hasHasEverShareInLastMonth;
- (BOOL)hasHasEverShareInLastWeek;
- (BOOL)hasL1Score;
- (BOOL)hasMatchedFieldsCount;
- (BOOL)hasMatchedLocationRatio;
- (BOOL)hasMatchedOCRCharacterRatio;
- (BOOL)hasMatchedOCRImportance;
- (BOOL)hasMatchedPeopleRatio;
- (BOOL)hasMatchedSceneBoundingBox;
- (BOOL)hasMatchedSceneConfidence;
- (BOOL)hasMatchedSceneRatio;
- (BOOL)hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
- (BOOL)hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
- (BOOL)hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
- (BOOL)hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
- (BOOL)hasShareCountGivenLocationInLastMonthNormalizedAcrossItems;
- (BOOL)hasShareCountGivenLocationInLastWeekNormalizedAcrossItems;
- (BOOL)hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
- (BOOL)hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
- (BOOL)hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
- (BOOL)hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
- (BOOL)hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
- (BOOL)hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
- (BOOL)hasShareCountInLastMonthNormalizedAcrossItems;
- (BOOL)hasShareCountInLastWeekNormalizedAcrossItems;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)searchSessionUUID;
- (double)L1Score;
- (double)aestheticScore;
- (double)clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
- (double)clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
- (double)clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
- (double)clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
- (double)clickCountGivenLocationInLastMonthNormalizedAcrossItems;
- (double)clickCountGivenLocationInLastWeekNormalizedAcrossItems;
- (double)clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
- (double)clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
- (double)clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
- (double)clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
- (double)clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
- (double)clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
- (double)clickCountInLastMonthNormalizedAcrossItems;
- (double)clickCountInLastWeekNormalizedAcrossItems;
- (double)clipScore;
- (double)curationScore;
- (double)freshness;
- (double)hasEverClickInLastMonth;
- (double)hasEverClickInLastWeek;
- (double)hasEverShareInLastMonth;
- (double)hasEverShareInLastWeek;
- (double)matchedLocationRatio;
- (double)matchedOCRCharacterRatio;
- (double)matchedOCRImportance;
- (double)matchedPeopleRatio;
- (double)matchedSceneBoundingBox;
- (double)matchedSceneConfidence;
- (double)matchedSceneRatio;
- (double)shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
- (double)shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
- (double)shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
- (double)shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
- (double)shareCountGivenLocationInLastMonthNormalizedAcrossItems;
- (double)shareCountGivenLocationInLastWeekNormalizedAcrossItems;
- (double)shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
- (double)shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
- (double)shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
- (double)shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
- (double)shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
- (double)shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
- (double)shareCountInLastMonthNormalizedAcrossItems;
- (double)shareCountInLastWeekNormalizedAcrossItems;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)uiSurface;
- (unsigned)correlationMetricVersion;
- (unsigned)correlationMetricWindowInDays;
- (unsigned)dataVersion;
- (unsigned)matchedFieldsCount;
- (void)setHasAestheticScore:(BOOL)a3;
- (void)setHasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)setHasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)setHasClickCountGivenLocationInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasClickCountGivenLocationInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)setHasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)setHasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)setHasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)setHasClickCountInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasClickCountInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)setHasClipScore:(BOOL)a3;
- (void)setHasCorrelationMetricVersion:(BOOL)a3;
- (void)setHasCorrelationMetricWindowInDays:(BOOL)a3;
- (void)setHasCurationScore:(BOOL)a3;
- (void)setHasFavorited:(BOOL)a3;
- (void)setHasFreshness:(BOOL)a3;
- (void)setHasHasEverClickInLastMonth:(BOOL)a3;
- (void)setHasHasEverClickInLastWeek:(BOOL)a3;
- (void)setHasHasEverShareInLastMonth:(BOOL)a3;
- (void)setHasHasEverShareInLastWeek:(BOOL)a3;
- (void)setHasL1Score:(BOOL)a3;
- (void)setHasMatchedFieldsCount:(BOOL)a3;
- (void)setHasMatchedLocationRatio:(BOOL)a3;
- (void)setHasMatchedOCRCharacterRatio:(BOOL)a3;
- (void)setHasMatchedOCRImportance:(BOOL)a3;
- (void)setHasMatchedPeopleRatio:(BOOL)a3;
- (void)setHasMatchedSceneBoundingBox:(BOOL)a3;
- (void)setHasMatchedSceneConfidence:(BOOL)a3;
- (void)setHasMatchedSceneRatio:(BOOL)a3;
- (void)setHasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountGivenLocationInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountGivenLocationInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAeroMLPhotosSearchDataCorrelations

- (void).cxx_destruct
{
}

- (void)setHasCorrelationMetricWindowInDays:(BOOL)a3
{
  self->_hasCorrelationMetricWindowInDays = a3;
}

- (BOOL)hasCorrelationMetricWindowInDays
{
  return self->_hasCorrelationMetricWindowInDays;
}

- (unsigned)correlationMetricWindowInDays
{
  return self->_correlationMetricWindowInDays;
}

- (void)setHasCorrelationMetricVersion:(BOOL)a3
{
  self->_hasCorrelationMetricVersion = a3;
}

- (BOOL)hasCorrelationMetricVersion
{
  return self->_hasCorrelationMetricVersion;
}

- (unsigned)correlationMetricVersion
{
  return self->_correlationMetricVersion;
}

- (void)setHasClipScore:(BOOL)a3
{
  self->_hasClipScore = a3;
}

- (BOOL)hasClipScore
{
  return self->_hasClipScore;
}

- (double)clipScore
{
  return self->_clipScore;
}

- (void)setHasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (BOOL)hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems
{
  return self->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
}

- (double)shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
}

- (void)setHasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (BOOL)hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems
{
  return self->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
}

- (double)shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
}

- (void)setHasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (BOOL)hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems
{
  return self->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
}

- (double)shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
}

- (void)setHasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (BOOL)hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems
{
  return self->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
}

- (double)shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
}

- (void)setHasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (BOOL)hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems
{
  return self->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
}

- (double)shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
}

- (void)setHasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (BOOL)hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems
{
  return self->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
}

- (double)shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
}

- (void)setHasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (BOOL)hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems
{
  return self->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
}

- (double)shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
}

- (void)setHasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (BOOL)hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems
{
  return self->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
}

- (double)shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
}

- (void)setHasShareCountGivenLocationInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems = a3;
}

- (BOOL)hasShareCountGivenLocationInLastMonthNormalizedAcrossItems
{
  return self->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems;
}

- (double)shareCountGivenLocationInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems;
}

- (void)setHasShareCountGivenLocationInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems = a3;
}

- (BOOL)hasShareCountGivenLocationInLastWeekNormalizedAcrossItems
{
  return self->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems;
}

- (double)shareCountGivenLocationInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems;
}

- (void)setHasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = a3;
}

- (BOOL)hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems
{
  return self->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
}

- (double)shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
}

- (void)setHasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = a3;
}

- (BOOL)hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems
{
  return self->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
}

- (double)shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
}

- (void)setHasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (BOOL)hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems
{
  return self->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
}

- (void)setHasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (BOOL)hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems
{
  return self->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
}

- (void)setHasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (BOOL)hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems
{
  return self->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
}

- (void)setHasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (BOOL)hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems
{
  return self->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
}

- (void)setHasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (BOOL)hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems
{
  return self->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
}

- (void)setHasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (BOOL)hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems
{
  return self->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
}

- (void)setHasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (BOOL)hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems
{
  return self->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
}

- (void)setHasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (BOOL)hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems
{
  return self->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
}

- (void)setHasClickCountGivenLocationInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems = a3;
}

- (BOOL)hasClickCountGivenLocationInLastMonthNormalizedAcrossItems
{
  return self->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenLocationInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems;
}

- (void)setHasClickCountGivenLocationInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems = a3;
}

- (BOOL)hasClickCountGivenLocationInLastWeekNormalizedAcrossItems
{
  return self->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenLocationInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems;
}

- (void)setHasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = a3;
}

- (BOOL)hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems
{
  return self->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
}

- (void)setHasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = a3;
}

- (BOOL)hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems
{
  return self->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
}

- (void)setHasShareCountInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountInLastMonthNormalizedAcrossItems = a3;
}

- (BOOL)hasShareCountInLastMonthNormalizedAcrossItems
{
  return self->_hasShareCountInLastMonthNormalizedAcrossItems;
}

- (double)shareCountInLastMonthNormalizedAcrossItems
{
  return self->_shareCountInLastMonthNormalizedAcrossItems;
}

- (void)setHasShareCountInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasShareCountInLastWeekNormalizedAcrossItems = a3;
}

- (BOOL)hasShareCountInLastWeekNormalizedAcrossItems
{
  return self->_hasShareCountInLastWeekNormalizedAcrossItems;
}

- (double)shareCountInLastWeekNormalizedAcrossItems
{
  return self->_shareCountInLastWeekNormalizedAcrossItems;
}

- (void)setHasClickCountInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountInLastMonthNormalizedAcrossItems = a3;
}

- (BOOL)hasClickCountInLastMonthNormalizedAcrossItems
{
  return self->_hasClickCountInLastMonthNormalizedAcrossItems;
}

- (double)clickCountInLastMonthNormalizedAcrossItems
{
  return self->_clickCountInLastMonthNormalizedAcrossItems;
}

- (void)setHasClickCountInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  self->_hasClickCountInLastWeekNormalizedAcrossItems = a3;
}

- (BOOL)hasClickCountInLastWeekNormalizedAcrossItems
{
  return self->_hasClickCountInLastWeekNormalizedAcrossItems;
}

- (double)clickCountInLastWeekNormalizedAcrossItems
{
  return self->_clickCountInLastWeekNormalizedAcrossItems;
}

- (void)setHasHasEverShareInLastMonth:(BOOL)a3
{
  self->_hasHasEverShareInLastMonth = a3;
}

- (BOOL)hasHasEverShareInLastMonth
{
  return self->_hasHasEverShareInLastMonth;
}

- (double)hasEverShareInLastMonth
{
  return self->_hasEverShareInLastMonth;
}

- (void)setHasHasEverShareInLastWeek:(BOOL)a3
{
  self->_hasHasEverShareInLastWeek = a3;
}

- (BOOL)hasHasEverShareInLastWeek
{
  return self->_hasHasEverShareInLastWeek;
}

- (double)hasEverShareInLastWeek
{
  return self->_hasEverShareInLastWeek;
}

- (void)setHasHasEverClickInLastMonth:(BOOL)a3
{
  self->_hasHasEverClickInLastMonth = a3;
}

- (BOOL)hasHasEverClickInLastMonth
{
  return self->_hasHasEverClickInLastMonth;
}

- (double)hasEverClickInLastMonth
{
  return self->_hasEverClickInLastMonth;
}

- (void)setHasHasEverClickInLastWeek:(BOOL)a3
{
  self->_hasHasEverClickInLastWeek = a3;
}

- (BOOL)hasHasEverClickInLastWeek
{
  return self->_hasHasEverClickInLastWeek;
}

- (double)hasEverClickInLastWeek
{
  return self->_hasEverClickInLastWeek;
}

- (void)setHasCurationScore:(BOOL)a3
{
  self->_hasCurationScore = a3;
}

- (BOOL)hasCurationScore
{
  return self->_hasCurationScore;
}

- (double)curationScore
{
  return self->_curationScore;
}

- (void)setHasAestheticScore:(BOOL)a3
{
  self->_hasAestheticScore = a3;
}

- (BOOL)hasAestheticScore
{
  return self->_hasAestheticScore;
}

- (double)aestheticScore
{
  return self->_aestheticScore;
}

- (void)setHasFavorited:(BOOL)a3
{
  self->_hasFavorited = a3;
}

- (BOOL)hasFavorited
{
  return self->_hasFavorited;
}

- (BOOL)favorited
{
  return self->_favorited;
}

- (void)setHasFreshness:(BOOL)a3
{
  self->_hasFreshness = a3;
}

- (BOOL)hasFreshness
{
  return self->_hasFreshness;
}

- (double)freshness
{
  return self->_freshness;
}

- (void)setHasL1Score:(BOOL)a3
{
  self->_hasL1Score = a3;
}

- (BOOL)hasL1Score
{
  return self->_hasL1Score;
}

- (double)L1Score
{
  return self->_L1Score;
}

- (void)setHasMatchedFieldsCount:(BOOL)a3
{
  self->_hasMatchedFieldsCount = a3;
}

- (BOOL)hasMatchedFieldsCount
{
  return self->_hasMatchedFieldsCount;
}

- (unsigned)matchedFieldsCount
{
  return self->_matchedFieldsCount;
}

- (void)setHasMatchedOCRImportance:(BOOL)a3
{
  self->_hasMatchedOCRImportance = a3;
}

- (BOOL)hasMatchedOCRImportance
{
  return self->_hasMatchedOCRImportance;
}

- (double)matchedOCRImportance
{
  return self->_matchedOCRImportance;
}

- (void)setHasMatchedOCRCharacterRatio:(BOOL)a3
{
  self->_hasMatchedOCRCharacterRatio = a3;
}

- (BOOL)hasMatchedOCRCharacterRatio
{
  return self->_hasMatchedOCRCharacterRatio;
}

- (double)matchedOCRCharacterRatio
{
  return self->_matchedOCRCharacterRatio;
}

- (void)setHasMatchedSceneBoundingBox:(BOOL)a3
{
  self->_hasMatchedSceneBoundingBox = a3;
}

- (BOOL)hasMatchedSceneBoundingBox
{
  return self->_hasMatchedSceneBoundingBox;
}

- (double)matchedSceneBoundingBox
{
  return self->_matchedSceneBoundingBox;
}

- (void)setHasMatchedSceneConfidence:(BOOL)a3
{
  self->_hasMatchedSceneConfidence = a3;
}

- (BOOL)hasMatchedSceneConfidence
{
  return self->_hasMatchedSceneConfidence;
}

- (double)matchedSceneConfidence
{
  return self->_matchedSceneConfidence;
}

- (void)setHasMatchedSceneRatio:(BOOL)a3
{
  self->_hasMatchedSceneRatio = a3;
}

- (BOOL)hasMatchedSceneRatio
{
  return self->_hasMatchedSceneRatio;
}

- (double)matchedSceneRatio
{
  return self->_matchedSceneRatio;
}

- (void)setHasMatchedLocationRatio:(BOOL)a3
{
  self->_hasMatchedLocationRatio = a3;
}

- (BOOL)hasMatchedLocationRatio
{
  return self->_hasMatchedLocationRatio;
}

- (double)matchedLocationRatio
{
  return self->_matchedLocationRatio;
}

- (void)setHasMatchedPeopleRatio:(BOOL)a3
{
  self->_hasMatchedPeopleRatio = a3;
}

- (BOOL)hasMatchedPeopleRatio
{
  return self->_hasMatchedPeopleRatio;
}

- (double)matchedPeopleRatio
{
  return self->_matchedPeopleRatio;
}

- (int)uiSurface
{
  return self->_uiSurface;
}

- (NSString)searchSessionUUID
{
  return self->_searchSessionUUID;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMAeroMLPhotosSearchDataCorrelations *)self searchSessionUUID];
    uint64_t v7 = [v5 searchSessionUUID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAeroMLPhotosSearchDataCorrelations *)self searchSessionUUID];
      v10 = [v5 searchSessionUUID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_248;
      }
    }
    int v13 = [(BMAeroMLPhotosSearchDataCorrelations *)self uiSurface];
    if (v13 == [v5 uiSurface])
    {
      if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedPeopleRatio]
        && ![v5 hasMatchedPeopleRatio]
        || [(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedPeopleRatio]
        && [v5 hasMatchedPeopleRatio]
        && ([(BMAeroMLPhotosSearchDataCorrelations *)self matchedPeopleRatio],
            double v15 = v14,
            [v5 matchedPeopleRatio],
            v15 == v16))
      {
        if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedLocationRatio]
          && ![v5 hasMatchedLocationRatio]
          || [(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedLocationRatio]
          && [v5 hasMatchedLocationRatio]
          && ([(BMAeroMLPhotosSearchDataCorrelations *)self matchedLocationRatio],
              double v18 = v17,
              [v5 matchedLocationRatio],
              v18 == v19))
        {
          if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedSceneRatio]
            && ![v5 hasMatchedSceneRatio]
            || [(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedSceneRatio]
            && [v5 hasMatchedSceneRatio]
            && ([(BMAeroMLPhotosSearchDataCorrelations *)self matchedSceneRatio],
                double v21 = v20,
                [v5 matchedSceneRatio],
                v21 == v22))
          {
            if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedSceneConfidence]
              && ![v5 hasMatchedSceneConfidence]
              || [(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedSceneConfidence]
              && [v5 hasMatchedSceneConfidence]
              && ([(BMAeroMLPhotosSearchDataCorrelations *)self matchedSceneConfidence],
                  double v24 = v23,
                  [v5 matchedSceneConfidence],
                  v24 == v25))
            {
              if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedSceneBoundingBox](self, "hasMatchedSceneBoundingBox")&& ![v5 hasMatchedSceneBoundingBox]|| -[BMAeroMLPhotosSearchDataCorrelations hasMatchedSceneBoundingBox](self, "hasMatchedSceneBoundingBox")&& objc_msgSend(v5, "hasMatchedSceneBoundingBox")&& (-[BMAeroMLPhotosSearchDataCorrelations matchedSceneBoundingBox](self, "matchedSceneBoundingBox"), double v27 = v26, objc_msgSend(v5, "matchedSceneBoundingBox"), v27 == v28))
              {
                if (!-[BMAeroMLPhotosSearchDataCorrelations hasMatchedOCRCharacterRatio](self, "hasMatchedOCRCharacterRatio")&& ![v5 hasMatchedOCRCharacterRatio]|| -[BMAeroMLPhotosSearchDataCorrelations hasMatchedOCRCharacterRatio](self, "hasMatchedOCRCharacterRatio")&& objc_msgSend(v5, "hasMatchedOCRCharacterRatio")&& (-[BMAeroMLPhotosSearchDataCorrelations matchedOCRCharacterRatio](self, "matchedOCRCharacterRatio"), double v30 = v29, objc_msgSend(v5, "matchedOCRCharacterRatio"), v30 == v31))
                {
                  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedOCRImportance]
                    && ![v5 hasMatchedOCRImportance]
                    || [(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedOCRImportance]
                    && [v5 hasMatchedOCRImportance]
                    && ([(BMAeroMLPhotosSearchDataCorrelations *)self matchedOCRImportance],
                        double v33 = v32,
                        [v5 matchedOCRImportance],
                        v33 == v34))
                  {
                    if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedFieldsCount]
                      && ![v5 hasMatchedFieldsCount]
                      || [(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedFieldsCount]
                      && [v5 hasMatchedFieldsCount]
                      && (unsigned int v35 = [(BMAeroMLPhotosSearchDataCorrelations *)self matchedFieldsCount],
                          v35 == [v5 matchedFieldsCount]))
                    {
                      if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasL1Score]
                        && ![v5 hasL1Score]
                        || [(BMAeroMLPhotosSearchDataCorrelations *)self hasL1Score]
                        && [v5 hasL1Score]
                        && ([(BMAeroMLPhotosSearchDataCorrelations *)self L1Score],
                            double v37 = v36,
                            [v5 L1Score],
                            v37 == v38))
                      {
                        if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasFreshness]
                          && ![v5 hasFreshness]
                          || [(BMAeroMLPhotosSearchDataCorrelations *)self hasFreshness]
                          && [v5 hasFreshness]
                          && ([(BMAeroMLPhotosSearchDataCorrelations *)self freshness],
                              double v40 = v39,
                              [v5 freshness],
                              v40 == v41))
                        {
                          if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasFavorited]
                            && ![v5 hasFavorited]
                            || [(BMAeroMLPhotosSearchDataCorrelations *)self hasFavorited]
                            && [v5 hasFavorited]
                            && (int v42 = [(BMAeroMLPhotosSearchDataCorrelations *)self favorited],
                                v42 == [v5 favorited]))
                          {
                            if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasAestheticScore]
                              && ![v5 hasAestheticScore]
                              || [(BMAeroMLPhotosSearchDataCorrelations *)self hasAestheticScore]
                              && [v5 hasAestheticScore]
                              && ([(BMAeroMLPhotosSearchDataCorrelations *)self aestheticScore],
                                  double v44 = v43,
                                  [v5 aestheticScore],
                                  v44 == v45))
                            {
                              if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasCurationScore]
                                && ![v5 hasCurationScore]
                                || [(BMAeroMLPhotosSearchDataCorrelations *)self hasCurationScore]
                                && [v5 hasCurationScore]
                                && ([(BMAeroMLPhotosSearchDataCorrelations *)self curationScore],
                                    double v47 = v46,
                                    [v5 curationScore],
                                    v47 == v48))
                              {
                                if (!-[BMAeroMLPhotosSearchDataCorrelations hasHasEverClickInLastWeek](self, "hasHasEverClickInLastWeek")&& ![v5 hasHasEverClickInLastWeek]|| -[BMAeroMLPhotosSearchDataCorrelations hasHasEverClickInLastWeek](self, "hasHasEverClickInLastWeek")&& objc_msgSend(v5, "hasHasEverClickInLastWeek")&& (-[BMAeroMLPhotosSearchDataCorrelations hasEverClickInLastWeek](self, "hasEverClickInLastWeek"), double v50 = v49, objc_msgSend(v5, "hasEverClickInLastWeek"), v50 == v51))
                                {
                                  if (!-[BMAeroMLPhotosSearchDataCorrelations hasHasEverClickInLastMonth](self, "hasHasEverClickInLastMonth")&& ![v5 hasHasEverClickInLastMonth]|| -[BMAeroMLPhotosSearchDataCorrelations hasHasEverClickInLastMonth](self, "hasHasEverClickInLastMonth")&& objc_msgSend(v5, "hasHasEverClickInLastMonth")&& (-[BMAeroMLPhotosSearchDataCorrelations hasEverClickInLastMonth](self, "hasEverClickInLastMonth"), double v53 = v52, objc_msgSend(v5, "hasEverClickInLastMonth"), v53 == v54))
                                  {
                                    if (!-[BMAeroMLPhotosSearchDataCorrelations hasHasEverShareInLastWeek](self, "hasHasEverShareInLastWeek")&& ![v5 hasHasEverShareInLastWeek]|| -[BMAeroMLPhotosSearchDataCorrelations hasHasEverShareInLastWeek](self, "hasHasEverShareInLastWeek")&& objc_msgSend(v5, "hasHasEverShareInLastWeek")&& (-[BMAeroMLPhotosSearchDataCorrelations hasEverShareInLastWeek](self, "hasEverShareInLastWeek"), double v56 = v55, objc_msgSend(v5, "hasEverShareInLastWeek"), v56 == v57))
                                    {
                                      if (!-[BMAeroMLPhotosSearchDataCorrelations hasHasEverShareInLastMonth](self, "hasHasEverShareInLastMonth")&& ![v5 hasHasEverShareInLastMonth]|| -[BMAeroMLPhotosSearchDataCorrelations hasHasEverShareInLastMonth](self, "hasHasEverShareInLastMonth")&& objc_msgSend(v5, "hasHasEverShareInLastMonth")&& (-[BMAeroMLPhotosSearchDataCorrelations hasEverShareInLastMonth](self, "hasEverShareInLastMonth"), double v59 = v58, objc_msgSend(v5, "hasEverShareInLastMonth"), v59 == v60))
                                      {
                                        if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountInLastWeekNormalizedAcrossItems](self, "hasClickCountInLastWeekNormalizedAcrossItems")&& ![v5 hasClickCountInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountInLastWeekNormalizedAcrossItems](self, "hasClickCountInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountInLastWeekNormalizedAcrossItems](self, "clickCountInLastWeekNormalizedAcrossItems"), double v62 = v61, objc_msgSend(v5, "clickCountInLastWeekNormalizedAcrossItems"), v62 == v63))
                                        {
                                          if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountInLastMonthNormalizedAcrossItems](self, "hasClickCountInLastMonthNormalizedAcrossItems")&& ![v5 hasClickCountInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountInLastMonthNormalizedAcrossItems](self, "hasClickCountInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountInLastMonthNormalizedAcrossItems](self, "clickCountInLastMonthNormalizedAcrossItems"), double v65 = v64, objc_msgSend(v5, "clickCountInLastMonthNormalizedAcrossItems"), v65 == v66))
                                          {
                                            if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountInLastWeekNormalizedAcrossItems](self, "hasShareCountInLastWeekNormalizedAcrossItems")&& ![v5 hasShareCountInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountInLastWeekNormalizedAcrossItems](self, "hasShareCountInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountInLastWeekNormalizedAcrossItems](self, "shareCountInLastWeekNormalizedAcrossItems"), double v68 = v67, objc_msgSend(v5, "shareCountInLastWeekNormalizedAcrossItems"), v68 == v69))
                                            {
                                              if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountInLastMonthNormalizedAcrossItems](self, "hasShareCountInLastMonthNormalizedAcrossItems")&& ![v5 hasShareCountInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountInLastMonthNormalizedAcrossItems](self, "hasShareCountInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountInLastMonthNormalizedAcrossItems](self, "shareCountInLastMonthNormalizedAcrossItems"), double v71 = v70, objc_msgSend(v5, "shareCountInLastMonthNormalizedAcrossItems"), v71 == v72))
                                              {
                                                if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& ![v5 hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), double v74 = v73, objc_msgSend(v5, "clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), v74 == v75))
                                                {
                                                  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& ![v5 hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), double v77 = v76, objc_msgSend(v5, "clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), v77 == v78))
                                                  {
                                                    if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastWeekNormalizedAcrossItems")&& ![v5 hasClickCountGivenLocationInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenLocationInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "clickCountGivenLocationInLastWeekNormalizedAcrossItems"), double v80 = v79, objc_msgSend(v5, "clickCountGivenLocationInLastWeekNormalizedAcrossItems"), v80 == v81))
                                                    {
                                                      if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastMonthNormalizedAcrossItems")&& ![v5 hasClickCountGivenLocationInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenLocationInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "clickCountGivenLocationInLastMonthNormalizedAcrossItems"), double v83 = v82, objc_msgSend(v5, "clickCountGivenLocationInLastMonthNormalizedAcrossItems"), v83 == v84))
                                                      {
                                                        if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& ![v5 hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), double v86 = v85, objc_msgSend(v5,
                                                                "clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"),
                                                              v86 == v87))
                                                        {
                                                          if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& ![v5 hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), double v89 = v88, objc_msgSend(v5,
                                                                  "clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"),
                                                                v89 == v90))
                                                          {
                                                            if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& ![v5 hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), double v92 = v91, objc_msgSend(v5,
                                                                    "clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"),
                                                                  v92 == v93))
                                                            {
                                                              if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& ![v5 hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), double v95 = v94, objc_msgSend(v5,
                                                                      "clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"),
                                                                    v95 == v96))
                                                              {
                                                                if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& ![v5 hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), double v98 = v97, objc_msgSend(v5,
                                                                        "clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"),
                                                                      v98 == v99))
                                                                {
                                                                  if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& ![v5 hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), double v101 = v100,
                                                                        [v5 clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems], v101 == v102))
                                                                  {
                                                                    if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& ![v5 hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"),
                                                                          double v104 = v103,
                                                                          [v5 clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems], v104 == v105))
                                                                    {
                                                                      if (!-[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& ![v5 hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"),
                                                                            double v107 = v106,
                                                                            [v5 clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems], v107 == v108))
                                                                      {
                                                                        if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& ![v5 hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), double v110 = v109,
                                                                              [v5 shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems], v110 == v111))
                                                                        {
                                                                          if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& ![v5 hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"),
                                                                                double v113 = v112,
                                                                                [v5 shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems], v113 == v114))
                                                                          {
                                                                            if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastWeekNormalizedAcrossItems")&& ![v5 hasShareCountGivenLocationInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenLocationInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "shareCountGivenLocationInLastWeekNormalizedAcrossItems"),
                                                                                  double v116 = v115,
                                                                                  [v5 shareCountGivenLocationInLastWeekNormalizedAcrossItems], v116 == v117))
                                                                            {
                                                                              if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastMonthNormalizedAcrossItems")&& ![v5 hasShareCountGivenLocationInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenLocationInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "shareCountGivenLocationInLastMonthNormalizedAcrossItems"),
                                                                                    double v119 = v118,
                                                                                    [v5 shareCountGivenLocationInLastMonthNormalizedAcrossItems], v119 == v120))
                                                                              {
                                                                                if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& ![v5 hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), double v122 = v121, objc_msgSend(v5, "shareCountGivenDayCategoryInLast"
                                                                                        "WeekNormalizedAcrossItems"),
                                                                                      v122 == v123))
                                                                                {
                                                                                  if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& ![v5 hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), double v125 = v124, objc_msgSend(v5, "shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), v125 == v126))
                                                                                  {
                                                                                    if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& ![v5 hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), double v128 = v127, objc_msgSend(v5, "shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), v128 == v129))
                                                                                    {
                                                                                      if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& ![v5 hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), double v131 = v130, objc_msgSend(v5, "shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), v131 == v132))
                                                                                      {
                                                                                        if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& ![v5 hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), double v134 = v133, objc_msgSend(v5, "shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), v134 == v135))
                                                                                        {
                                                                                          if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& ![v5 hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), double v137 = v136, objc_msgSend(v5,
                                                                                                  "shareCountGivenSceneCa"
                                                                                                  "tegoryInLastMonthNorma"
                                                                                                  "lizedAcrossItems"),
                                                                                                v137 == v138))
                                                                                          {
                                                                                            if (!-[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& ![v5 hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), double v140 = v139, objc_msgSend(v5, "shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), v140 == v141))
                                                                                            {
                                                                                              if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems]
                                                                                                && ![v5 hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems]
                                                                                                || -[BMAeroMLPhotosSearchDataCorrelations hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& [v5 hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems]&& (-[BMAeroMLPhotosSearchDataCorrelations shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), double v143 = v142, objc_msgSend(v5, "shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), v143 == v144))
                                                                                              {
                                                                                                if (!-[BMAeroMLPhotosSearchDataCorrelations hasClipScore](self, "hasClipScore") && ![v5 hasClipScore] || -[BMAeroMLPhotosSearchDataCorrelations hasClipScore](self, "hasClipScore") && objc_msgSend(v5, "hasClipScore") && (-[BMAeroMLPhotosSearchDataCorrelations clipScore](self, "clipScore"), double v146 = v145, objc_msgSend(v5, "clipScore"), v146 == v147))
                                                                                                {
                                                                                                  if (!-[BMAeroMLPhotosSearchDataCorrelations hasCorrelationMetricVersion](self, "hasCorrelationMetricVersion") && ![v5 hasCorrelationMetricVersion] || -[BMAeroMLPhotosSearchDataCorrelations hasCorrelationMetricVersion](self, "hasCorrelationMetricVersion") && objc_msgSend(v5, "hasCorrelationMetricVersion") && (unsigned int v148 = -[BMAeroMLPhotosSearchDataCorrelations correlationMetricVersion](self, "correlationMetricVersion"), v148 == objc_msgSend(v5, "correlationMetricVersion")))
                                                                                                  {
                                                                                                    if (!-[BMAeroMLPhotosSearchDataCorrelations hasCorrelationMetricWindowInDays](self, "hasCorrelationMetricWindowInDays") && ![v5 hasCorrelationMetricWindowInDays])
                                                                                                    {
                                                                                                      BOOL v12 = 1;
                                                                                                      goto LABEL_249;
                                                                                                    }
                                                                                                    if (-[BMAeroMLPhotosSearchDataCorrelations hasCorrelationMetricWindowInDays](self, "hasCorrelationMetricWindowInDays") && [v5 hasCorrelationMetricWindowInDays])
                                                                                                    {
                                                                                                      unsigned int v149 = [(BMAeroMLPhotosSearchDataCorrelations *)self correlationMetricWindowInDays];
                                                                                                      BOOL v12 = v149 == [v5 correlationMetricWindowInDays];
LABEL_249:

                                                                                                      goto LABEL_250;
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_248:
    BOOL v12 = 0;
    goto LABEL_249;
  }
  BOOL v12 = 0;
LABEL_250:

  return v12;
}

- (id)jsonDictionary
{
  v244[50] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMAeroMLPhotosSearchDataCorrelations *)self searchSessionUUID];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAeroMLPhotosSearchDataCorrelations uiSurface](self, "uiSurface"));
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedPeopleRatio]
    || ([(BMAeroMLPhotosSearchDataCorrelations *)self matchedPeopleRatio], fabs(v5) == INFINITY))
  {
    id v7 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self matchedPeopleRatio];
    v6 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self matchedPeopleRatio];
    objc_msgSend(v6, "numberWithDouble:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedLocationRatio]
    || ([(BMAeroMLPhotosSearchDataCorrelations *)self matchedLocationRatio], fabs(v8) == INFINITY))
  {
    id v10 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self matchedLocationRatio];
    v9 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self matchedLocationRatio];
    objc_msgSend(v9, "numberWithDouble:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedSceneRatio]
    || ([(BMAeroMLPhotosSearchDataCorrelations *)self matchedSceneRatio], fabs(v11) == INFINITY))
  {
    id v13 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self matchedSceneRatio];
    BOOL v12 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self matchedSceneRatio];
    objc_msgSend(v12, "numberWithDouble:");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedSceneConfidence]
    || ([(BMAeroMLPhotosSearchDataCorrelations *)self matchedSceneConfidence],
        fabs(v14) == INFINITY))
  {
    id v16 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self matchedSceneConfidence];
    double v15 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self matchedSceneConfidence];
    objc_msgSend(v15, "numberWithDouble:");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedSceneBoundingBox]
    || ([(BMAeroMLPhotosSearchDataCorrelations *)self matchedSceneBoundingBox],
        fabs(v17) == INFINITY))
  {
    id v19 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self matchedSceneBoundingBox];
    double v18 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self matchedSceneBoundingBox];
    objc_msgSend(v18, "numberWithDouble:");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedOCRCharacterRatio]
    || ([(BMAeroMLPhotosSearchDataCorrelations *)self matchedOCRCharacterRatio],
        fabs(v20) == INFINITY))
  {
    id v242 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self matchedOCRCharacterRatio];
    double v21 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self matchedOCRCharacterRatio];
    objc_msgSend(v21, "numberWithDouble:");
    id v242 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedOCRImportance]
    || ([(BMAeroMLPhotosSearchDataCorrelations *)self matchedOCRImportance], fabs(v22) == INFINITY))
  {
    id v241 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self matchedOCRImportance];
    double v23 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self matchedOCRImportance];
    objc_msgSend(v23, "numberWithDouble:");
    id v241 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMAeroMLPhotosSearchDataCorrelations *)self hasMatchedFieldsCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchDataCorrelations matchedFieldsCount](self, "matchedFieldsCount"));
    id v240 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v240 = 0;
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasL1Score]
    || ([(BMAeroMLPhotosSearchDataCorrelations *)self L1Score], fabs(v24) == INFINITY))
  {
    id v239 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self L1Score];
    double v25 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self L1Score];
    objc_msgSend(v25, "numberWithDouble:");
    id v239 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasFreshness]
    || ([(BMAeroMLPhotosSearchDataCorrelations *)self freshness], fabs(v26) == INFINITY))
  {
    id v238 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self freshness];
    double v27 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self freshness];
    objc_msgSend(v27, "numberWithDouble:");
    id v238 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMAeroMLPhotosSearchDataCorrelations *)self hasFavorited])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchDataCorrelations favorited](self, "favorited"));
    id v237 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v237 = 0;
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasAestheticScore]
    || ([(BMAeroMLPhotosSearchDataCorrelations *)self aestheticScore], fabs(v28) == INFINITY))
  {
    id v236 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self aestheticScore];
    double v29 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self aestheticScore];
    objc_msgSend(v29, "numberWithDouble:");
    id v236 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasCurationScore]
    || ([(BMAeroMLPhotosSearchDataCorrelations *)self curationScore], fabs(v30) == INFINITY))
  {
    id v235 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self curationScore];
    double v31 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self curationScore];
    objc_msgSend(v31, "numberWithDouble:");
    id v235 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasHasEverClickInLastWeek]
    || ([(BMAeroMLPhotosSearchDataCorrelations *)self hasEverClickInLastWeek],
        fabs(v32) == INFINITY))
  {
    id v234 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self hasEverClickInLastWeek];
    double v33 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self hasEverClickInLastWeek];
    objc_msgSend(v33, "numberWithDouble:");
    id v234 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasHasEverClickInLastMonth]
    || ([(BMAeroMLPhotosSearchDataCorrelations *)self hasEverClickInLastMonth],
        fabs(v34) == INFINITY))
  {
    id v233 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self hasEverClickInLastMonth];
    unsigned int v35 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self hasEverClickInLastMonth];
    objc_msgSend(v35, "numberWithDouble:");
    id v233 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasHasEverShareInLastWeek]
    || ([(BMAeroMLPhotosSearchDataCorrelations *)self hasEverShareInLastWeek],
        fabs(v36) == INFINITY))
  {
    id v232 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self hasEverShareInLastWeek];
    double v37 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self hasEverShareInLastWeek];
    objc_msgSend(v37, "numberWithDouble:");
    id v232 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasHasEverShareInLastMonth]
    || ([(BMAeroMLPhotosSearchDataCorrelations *)self hasEverShareInLastMonth],
        fabs(v38) == INFINITY))
  {
    id v231 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self hasEverShareInLastMonth];
    double v39 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self hasEverShareInLastMonth];
    objc_msgSend(v39, "numberWithDouble:");
    id v231 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasClickCountInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self clickCountInLastWeekNormalizedAcrossItems], fabs(v40) == INFINITY))
  {
    id v230 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountInLastWeekNormalizedAcrossItems];
    double v41 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountInLastWeekNormalizedAcrossItems];
    objc_msgSend(v41, "numberWithDouble:");
    id v230 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasClickCountInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self clickCountInLastMonthNormalizedAcrossItems], fabs(v42) == INFINITY))
  {
    id v229 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountInLastMonthNormalizedAcrossItems];
    double v43 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountInLastMonthNormalizedAcrossItems];
    objc_msgSend(v43, "numberWithDouble:");
    id v229 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasShareCountInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self shareCountInLastWeekNormalizedAcrossItems], fabs(v44) == INFINITY))
  {
    id v228 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountInLastWeekNormalizedAcrossItems];
    double v45 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountInLastWeekNormalizedAcrossItems];
    objc_msgSend(v45, "numberWithDouble:");
    id v228 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasShareCountInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self shareCountInLastMonthNormalizedAcrossItems], fabs(v46) == INFINITY))
  {
    id v227 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountInLastMonthNormalizedAcrossItems];
    double v47 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountInLastMonthNormalizedAcrossItems];
    objc_msgSend(v47, "numberWithDouble:");
    id v227 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems], fabs(v48) == INFINITY))
  {
    id v226 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems];
    double v49 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems];
    objc_msgSend(v49, "numberWithDouble:");
    id v226 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems], fabs(v50) == INFINITY))
  {
    id v225 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems];
    double v51 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems];
    objc_msgSend(v51, "numberWithDouble:");
    id v225 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasClickCountGivenLocationInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenLocationInLastWeekNormalizedAcrossItems], fabs(v52) == INFINITY))
  {
    id v224 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenLocationInLastWeekNormalizedAcrossItems];
    double v53 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenLocationInLastWeekNormalizedAcrossItems];
    objc_msgSend(v53, "numberWithDouble:");
    id v224 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasClickCountGivenLocationInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenLocationInLastMonthNormalizedAcrossItems], fabs(v54) == INFINITY))
  {
    id v223 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenLocationInLastMonthNormalizedAcrossItems];
    double v55 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenLocationInLastMonthNormalizedAcrossItems];
    objc_msgSend(v55, "numberWithDouble:");
    id v223 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems], fabs(v56) == INFINITY))
  {
    id v222 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems];
    double v57 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems];
    objc_msgSend(v57, "numberWithDouble:");
    id v222 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems], fabs(v58) == INFINITY))
  {
    id v221 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems];
    double v59 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems];
    objc_msgSend(v59, "numberWithDouble:");
    id v221 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems], fabs(v60) == INFINITY))
  {
    id v220 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems];
    double v61 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems];
    objc_msgSend(v61, "numberWithDouble:");
    id v220 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems], fabs(v62) == INFINITY))
  {
    id v219 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems];
    double v63 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems];
    objc_msgSend(v63, "numberWithDouble:");
    id v219 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems], fabs(v64) == INFINITY))
  {
    id v218 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems];
    double v65 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems];
    objc_msgSend(v65, "numberWithDouble:");
    id v218 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems], fabs(v66) == INFINITY))
  {
    id v217 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems];
    double v67 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems];
    objc_msgSend(v67, "numberWithDouble:");
    id v217 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems], fabs(v68) == INFINITY))
  {
    id v216 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems];
    double v69 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems];
    objc_msgSend(v69, "numberWithDouble:");
    id v216 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems], fabs(v70) == INFINITY))
  {
    id v215 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems];
    double v71 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems];
    objc_msgSend(v71, "numberWithDouble:");
    id v215 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems], fabs(v72) == INFINITY))
  {
    id v214 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems];
    double v73 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems];
    objc_msgSend(v73, "numberWithDouble:");
    id v214 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems], fabs(v74) == INFINITY))
  {
    id v213 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems];
    double v75 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems];
    objc_msgSend(v75, "numberWithDouble:");
    id v213 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasShareCountGivenLocationInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenLocationInLastWeekNormalizedAcrossItems], fabs(v76) == INFINITY))
  {
    id v212 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenLocationInLastWeekNormalizedAcrossItems];
    double v77 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenLocationInLastWeekNormalizedAcrossItems];
    objc_msgSend(v77, "numberWithDouble:");
    id v212 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasShareCountGivenLocationInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenLocationInLastMonthNormalizedAcrossItems], fabs(v78) == INFINITY))
  {
    id v211 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenLocationInLastMonthNormalizedAcrossItems];
    double v79 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenLocationInLastMonthNormalizedAcrossItems];
    objc_msgSend(v79, "numberWithDouble:");
    id v211 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems], fabs(v80) == INFINITY))
  {
    id v210 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems];
    double v81 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems];
    objc_msgSend(v81, "numberWithDouble:");
    id v210 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems], fabs(v82) == INFINITY))
  {
    id v209 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems];
    double v83 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems];
    objc_msgSend(v83, "numberWithDouble:");
    id v209 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems], fabs(v84) == INFINITY))
  {
    id v208 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems];
    double v85 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems];
    objc_msgSend(v85, "numberWithDouble:");
    id v208 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems], fabs(v86) == INFINITY))
  {
    id v207 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems];
    double v87 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems];
    objc_msgSend(v87, "numberWithDouble:");
    id v207 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems], fabs(v88) == INFINITY))
  {
    id v206 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems];
    double v89 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems];
    objc_msgSend(v89, "numberWithDouble:");
    id v206 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems], fabs(v90) == INFINITY))
  {
    id v205 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems];
    double v91 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems];
    objc_msgSend(v91, "numberWithDouble:");
    id v205 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems], fabs(v92) == INFINITY))
  {
    id v204 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems];
    double v93 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems];
    objc_msgSend(v93, "numberWithDouble:");
    id v204 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems], fabs(v94) == INFINITY))
  {
    id v203 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems];
    double v95 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems];
    objc_msgSend(v95, "numberWithDouble:");
    id v203 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchDataCorrelations *)self hasClipScore]
    || ([(BMAeroMLPhotosSearchDataCorrelations *)self clipScore], fabs(v96) == INFINITY))
  {
    id v202 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchDataCorrelations *)self clipScore];
    double v97 = NSNumber;
    [(BMAeroMLPhotosSearchDataCorrelations *)self clipScore];
    objc_msgSend(v97, "numberWithDouble:");
    id v202 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMAeroMLPhotosSearchDataCorrelations *)self hasCorrelationMetricVersion])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchDataCorrelations correlationMetricVersion](self, "correlationMetricVersion"));
    id v201 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v201 = 0;
  }
  if ([(BMAeroMLPhotosSearchDataCorrelations *)self hasCorrelationMetricWindowInDays])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchDataCorrelations correlationMetricWindowInDays](self, "correlationMetricWindowInDays"));
    id v200 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v200 = 0;
  }
  v243[0] = @"searchSessionUUID";
  uint64_t v98 = v3;
  if (!v3)
  {
    uint64_t v98 = [MEMORY[0x1E4F1CA98] null];
  }
  v192 = (void *)v98;
  v244[0] = v98;
  v243[1] = @"uiSurface";
  uint64_t v99 = v4;
  if (!v4)
  {
    uint64_t v99 = [MEMORY[0x1E4F1CA98] null];
  }
  v191 = (void *)v99;
  v244[1] = v99;
  v243[2] = @"matchedPeopleRatio";
  uint64_t v100 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v100 = [MEMORY[0x1E4F1CA98] null];
  }
  v190 = (void *)v100;
  v244[2] = v100;
  v243[3] = @"matchedLocationRatio";
  uint64_t v101 = (uint64_t)v10;
  if (!v10)
  {
    uint64_t v101 = [MEMORY[0x1E4F1CA98] null];
  }
  v189 = (void *)v101;
  v244[3] = v101;
  v243[4] = @"matchedSceneRatio";
  uint64_t v102 = (uint64_t)v13;
  if (!v13)
  {
    uint64_t v102 = [MEMORY[0x1E4F1CA98] null];
  }
  v188 = (void *)v102;
  v244[4] = v102;
  v243[5] = @"matchedSceneConfidence";
  uint64_t v103 = (uint64_t)v16;
  if (!v16)
  {
    uint64_t v103 = [MEMORY[0x1E4F1CA98] null];
  }
  v187 = (void *)v103;
  v244[5] = v103;
  v243[6] = @"matchedSceneBoundingBox";
  uint64_t v104 = (uint64_t)v19;
  if (!v19)
  {
    uint64_t v104 = [MEMORY[0x1E4F1CA98] null];
  }
  v186 = (void *)v104;
  v244[6] = v104;
  v243[7] = @"matchedOCRCharacterRatio";
  uint64_t v105 = (uint64_t)v242;
  if (!v242)
  {
    uint64_t v105 = [MEMORY[0x1E4F1CA98] null];
  }
  v244[7] = v105;
  v243[8] = @"matchedOCRImportance";
  double v106 = v241;
  if (!v241)
  {
    double v106 = [MEMORY[0x1E4F1CA98] null];
  }
  v244[8] = v106;
  v243[9] = @"matchedFieldsCount";
  uint64_t v107 = (uint64_t)v240;
  if (!v240)
  {
    uint64_t v107 = [MEMORY[0x1E4F1CA98] null];
  }
  v244[9] = v107;
  v243[10] = @"L1Score";
  uint64_t v108 = (uint64_t)v239;
  if (!v239)
  {
    uint64_t v108 = [MEMORY[0x1E4F1CA98] null];
  }
  v183 = (void *)v108;
  v244[10] = v108;
  v243[11] = @"freshness";
  uint64_t v109 = (uint64_t)v238;
  if (!v238)
  {
    uint64_t v109 = [MEMORY[0x1E4F1CA98] null];
  }
  v194 = (void *)v4;
  v195 = (void *)v109;
  v244[11] = v109;
  v243[12] = @"favorited";
  uint64_t v110 = (uint64_t)v237;
  if (!v237)
  {
    uint64_t v110 = [MEMORY[0x1E4F1CA98] null];
  }
  double v111 = (void *)v110;
  v244[12] = v110;
  v243[13] = @"aestheticScore";
  uint64_t v112 = (uint64_t)v236;
  if (!v236)
  {
    uint64_t v112 = [MEMORY[0x1E4F1CA98] null];
  }
  v182 = (void *)v112;
  v244[13] = v112;
  v243[14] = @"curationScore";
  uint64_t v113 = (uint64_t)v235;
  if (!v235)
  {
    uint64_t v113 = [MEMORY[0x1E4F1CA98] null];
  }
  v181 = (void *)v113;
  v244[14] = v113;
  v243[15] = @"hasEverClickInLastWeek";
  uint64_t v114 = (uint64_t)v234;
  if (!v234)
  {
    uint64_t v114 = [MEMORY[0x1E4F1CA98] null];
  }
  v180 = (void *)v114;
  v244[15] = v114;
  v243[16] = @"hasEverClickInLastMonth";
  uint64_t v115 = (uint64_t)v233;
  if (!v233)
  {
    uint64_t v115 = [MEMORY[0x1E4F1CA98] null];
  }
  v179 = (void *)v115;
  v244[16] = v115;
  v243[17] = @"hasEverShareInLastWeek";
  uint64_t v116 = (uint64_t)v232;
  if (!v232)
  {
    uint64_t v116 = [MEMORY[0x1E4F1CA98] null];
  }
  v178 = (void *)v116;
  v244[17] = v116;
  v243[18] = @"hasEverShareInLastMonth";
  uint64_t v117 = (uint64_t)v231;
  if (!v231)
  {
    uint64_t v117 = [MEMORY[0x1E4F1CA98] null];
  }
  v177 = (void *)v117;
  v244[18] = v117;
  v243[19] = @"clickCountInLastWeekNormalizedAcrossItems";
  uint64_t v118 = (uint64_t)v230;
  if (!v230)
  {
    uint64_t v118 = [MEMORY[0x1E4F1CA98] null];
  }
  v176 = (void *)v118;
  v244[19] = v118;
  v243[20] = @"clickCountInLastMonthNormalizedAcrossItems";
  uint64_t v119 = (uint64_t)v229;
  if (!v229)
  {
    uint64_t v119 = [MEMORY[0x1E4F1CA98] null];
  }
  v175 = (void *)v119;
  v244[20] = v119;
  v243[21] = @"shareCountInLastWeekNormalizedAcrossItems";
  uint64_t v120 = (uint64_t)v228;
  if (!v228)
  {
    uint64_t v120 = [MEMORY[0x1E4F1CA98] null];
  }
  v174 = (void *)v120;
  v244[21] = v120;
  v243[22] = @"shareCountInLastMonthNormalizedAcrossItems";
  uint64_t v121 = (uint64_t)v227;
  if (!v227)
  {
    uint64_t v121 = [MEMORY[0x1E4F1CA98] null];
  }
  v173 = (void *)v121;
  v244[22] = v121;
  v243[23] = @"clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems";
  uint64_t v122 = (uint64_t)v226;
  if (!v226)
  {
    uint64_t v122 = [MEMORY[0x1E4F1CA98] null];
  }
  v172 = (void *)v122;
  v244[23] = v122;
  v243[24] = @"clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems";
  uint64_t v123 = (uint64_t)v225;
  if (!v225)
  {
    uint64_t v123 = [MEMORY[0x1E4F1CA98] null];
  }
  v171 = (void *)v123;
  v244[24] = v123;
  v243[25] = @"clickCountGivenLocationInLastWeekNormalizedAcrossItems";
  uint64_t v124 = (uint64_t)v224;
  if (!v224)
  {
    uint64_t v124 = [MEMORY[0x1E4F1CA98] null];
  }
  v170 = (void *)v124;
  v244[25] = v124;
  v243[26] = @"clickCountGivenLocationInLastMonthNormalizedAcrossItems";
  uint64_t v125 = (uint64_t)v223;
  if (!v223)
  {
    uint64_t v125 = [MEMORY[0x1E4F1CA98] null];
  }
  v169 = (void *)v125;
  v244[26] = v125;
  v243[27] = @"clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems";
  uint64_t v126 = (uint64_t)v222;
  if (!v222)
  {
    uint64_t v126 = [MEMORY[0x1E4F1CA98] null];
  }
  v168 = (void *)v126;
  v244[27] = v126;
  v243[28] = @"clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems";
  uint64_t v127 = (uint64_t)v221;
  if (!v221)
  {
    uint64_t v127 = [MEMORY[0x1E4F1CA98] null];
  }
  v167 = (void *)v127;
  v244[28] = v127;
  v243[29] = @"clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems";
  uint64_t v128 = (uint64_t)v220;
  if (!v220)
  {
    uint64_t v128 = [MEMORY[0x1E4F1CA98] null];
  }
  v166 = (void *)v128;
  v244[29] = v128;
  v243[30] = @"clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems";
  uint64_t v129 = (uint64_t)v219;
  if (!v219)
  {
    uint64_t v129 = [MEMORY[0x1E4F1CA98] null];
  }
  v165 = (void *)v129;
  v244[30] = v129;
  v243[31] = @"clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems";
  uint64_t v130 = (uint64_t)v218;
  if (!v218)
  {
    uint64_t v130 = [MEMORY[0x1E4F1CA98] null];
  }
  v164 = (void *)v130;
  v244[31] = v130;
  v243[32] = @"clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems";
  uint64_t v131 = (uint64_t)v217;
  if (!v217)
  {
    uint64_t v131 = [MEMORY[0x1E4F1CA98] null];
  }
  v163 = (void *)v131;
  v244[32] = v131;
  v243[33] = @"clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems";
  uint64_t v132 = (uint64_t)v216;
  if (!v216)
  {
    uint64_t v132 = [MEMORY[0x1E4F1CA98] null];
  }
  v162 = (void *)v132;
  v244[33] = v132;
  v243[34] = @"clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems";
  uint64_t v133 = (uint64_t)v215;
  if (!v215)
  {
    uint64_t v133 = [MEMORY[0x1E4F1CA98] null];
  }
  v161 = (void *)v133;
  v244[34] = v133;
  v243[35] = @"shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems";
  uint64_t v134 = (uint64_t)v214;
  if (!v214)
  {
    uint64_t v134 = [MEMORY[0x1E4F1CA98] null];
  }
  v160 = (void *)v134;
  v244[35] = v134;
  v243[36] = @"shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems";
  uint64_t v135 = (uint64_t)v213;
  if (!v213)
  {
    uint64_t v135 = [MEMORY[0x1E4F1CA98] null];
  }
  v159 = (void *)v135;
  v244[36] = v135;
  v243[37] = @"shareCountGivenLocationInLastWeekNormalizedAcrossItems";
  uint64_t v136 = (uint64_t)v212;
  if (!v212)
  {
    uint64_t v136 = [MEMORY[0x1E4F1CA98] null];
  }
  v158 = (void *)v136;
  v244[37] = v136;
  v243[38] = @"shareCountGivenLocationInLastMonthNormalizedAcrossItems";
  uint64_t v137 = (uint64_t)v211;
  if (!v211)
  {
    uint64_t v137 = [MEMORY[0x1E4F1CA98] null];
  }
  v157 = (void *)v137;
  v244[38] = v137;
  v243[39] = @"shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems";
  uint64_t v138 = (uint64_t)v210;
  if (!v210)
  {
    uint64_t v138 = [MEMORY[0x1E4F1CA98] null];
  }
  v156 = (void *)v138;
  v244[39] = v138;
  v243[40] = @"shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems";
  uint64_t v139 = (uint64_t)v209;
  if (!v209)
  {
    uint64_t v139 = [MEMORY[0x1E4F1CA98] null];
  }
  v199 = (void *)v3;
  v155 = (void *)v139;
  v244[40] = v139;
  v243[41] = @"shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems";
  uint64_t v140 = (uint64_t)v208;
  if (!v208)
  {
    uint64_t v140 = [MEMORY[0x1E4F1CA98] null];
  }
  v197 = v19;
  v154 = (void *)v140;
  v244[41] = v140;
  v243[42] = @"shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems";
  uint64_t v141 = (uint64_t)v207;
  if (!v207)
  {
    uint64_t v141 = [MEMORY[0x1E4F1CA98] null];
  }
  v184 = (void *)v107;
  v153 = (void *)v141;
  v244[42] = v141;
  v243[43] = @"shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems";
  uint64_t v142 = (uint64_t)v206;
  if (!v206)
  {
    uint64_t v142 = [MEMORY[0x1E4F1CA98] null];
  }
  v152 = (void *)v142;
  v244[43] = v142;
  v243[44] = @"shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems";
  double v143 = v205;
  if (!v205)
  {
    double v143 = [MEMORY[0x1E4F1CA98] null];
  }
  v198 = v16;
  v196 = v13;
  v244[44] = v143;
  v243[45] = @"shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems";
  double v144 = v204;
  if (!v204)
  {
    double v144 = [MEMORY[0x1E4F1CA98] null];
  }
  double v145 = v10;
  v244[45] = v144;
  v243[46] = @"shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems";
  double v146 = v203;
  if (!v203)
  {
    double v146 = [MEMORY[0x1E4F1CA98] null];
  }
  v185 = (void *)v105;
  v244[46] = v146;
  v243[47] = @"clipScore";
  double v147 = v202;
  if (!v202)
  {
    double v147 = [MEMORY[0x1E4F1CA98] null];
  }
  v244[47] = v147;
  v243[48] = @"correlationMetricVersion";
  unsigned int v148 = v201;
  if (!v201)
  {
    unsigned int v148 = [MEMORY[0x1E4F1CA98] null];
  }
  v244[48] = v148;
  v243[49] = @"correlationMetricWindowInDays";
  unsigned int v149 = v200;
  if (!v200)
  {
    unsigned int v149 = [MEMORY[0x1E4F1CA98] null];
  }
  v244[49] = v149;
  id v193 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v244 forKeys:v243 count:50];
  if (!v200) {

  }
  v150 = v111;
  if (!v201)
  {

    v150 = v111;
  }
  if (!v202)
  {

    v150 = v111;
  }
  if (!v203)
  {

    v150 = v111;
  }
  if (!v204)
  {

    v150 = v111;
  }
  if (!v205)
  {

    v150 = v111;
  }
  if (!v206)
  {

    v150 = v111;
  }
  if (!v207)
  {

    v150 = v111;
  }
  if (!v208)
  {

    v150 = v111;
  }
  if (!v209)
  {

    v150 = v111;
  }
  if (!v210)
  {

    v150 = v111;
  }
  if (!v211)
  {

    v150 = v111;
  }
  if (!v212)
  {

    v150 = v111;
  }
  if (!v213)
  {

    v150 = v111;
  }
  if (!v214)
  {

    v150 = v111;
  }
  if (!v215)
  {

    v150 = v111;
  }
  if (!v216)
  {

    v150 = v111;
  }
  if (!v217)
  {

    v150 = v111;
  }
  if (!v218)
  {

    v150 = v111;
  }
  if (!v219)
  {

    v150 = v111;
  }
  if (!v220)
  {

    v150 = v111;
  }
  if (!v221)
  {

    v150 = v111;
  }
  if (!v222)
  {

    v150 = v111;
  }
  if (!v223)
  {

    v150 = v111;
  }
  if (!v224)
  {

    v150 = v111;
  }
  if (!v225)
  {

    v150 = v111;
  }
  if (!v226)
  {

    v150 = v111;
  }
  if (!v227)
  {

    v150 = v111;
  }
  if (!v228)
  {

    v150 = v111;
  }
  if (!v229)
  {

    v150 = v111;
  }
  if (!v230)
  {

    v150 = v111;
  }
  if (!v231)
  {

    v150 = v111;
  }
  if (!v232)
  {

    v150 = v111;
  }
  if (!v233)
  {

    v150 = v111;
  }
  if (!v234)
  {

    v150 = v111;
  }
  if (!v235)
  {

    v150 = v111;
  }
  if (!v236)
  {

    v150 = v111;
  }
  if (!v237) {

  }
  if (!v238) {
  if (!v239)
  }

  if (!v240) {
  if (!v241)
  }

  if (v242)
  {
    if (v197) {
      goto LABEL_375;
    }
  }
  else
  {

    if (v197)
    {
LABEL_375:
      if (v198) {
        goto LABEL_376;
      }
      goto LABEL_386;
    }
  }

  if (v198)
  {
LABEL_376:
    if (v196) {
      goto LABEL_377;
    }
    goto LABEL_387;
  }
LABEL_386:

  if (v196)
  {
LABEL_377:
    if (v145) {
      goto LABEL_378;
    }
    goto LABEL_388;
  }
LABEL_387:

  if (v145)
  {
LABEL_378:
    if (v7) {
      goto LABEL_379;
    }
    goto LABEL_389;
  }
LABEL_388:

  if (v7)
  {
LABEL_379:
    if (v194) {
      goto LABEL_380;
    }
LABEL_390:

    if (v199) {
      goto LABEL_381;
    }
    goto LABEL_391;
  }
LABEL_389:

  if (!v194) {
    goto LABEL_390;
  }
LABEL_380:
  if (v199) {
    goto LABEL_381;
  }
LABEL_391:

LABEL_381:

  return v193;
}

- (BMAeroMLPhotosSearchDataCorrelations)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v612[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v511 = [v5 objectForKeyedSubscript:@"searchSessionUUID"];
  if (!v511 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v509 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v509 = v511;
LABEL_4:
    v512 = [v5 objectForKeyedSubscript:@"uiSurface"];
    if (!v512 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v507 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v507 = v512;
LABEL_15:

LABEL_16:
      id v10 = [v5 objectForKeyedSubscript:@"matchedPeopleRatio"];
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v505 = a4;
        id v11 = 0;
        goto LABEL_19;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v505 = a4;
        id v11 = v10;
LABEL_19:
        BOOL v12 = [v5 objectForKeyedSubscript:@"matchedLocationRatio"];
        if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v502 = v12;
          id v503 = 0;
          goto LABEL_22;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v502 = v12;
          id v503 = v12;
LABEL_22:
          v508 = [v5 objectForKeyedSubscript:@"matchedSceneRatio"];
          if (!v508 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v504 = 0;
            goto LABEL_25;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v504 = v508;
LABEL_25:
            uint64_t v13 = [v5 objectForKeyedSubscript:@"matchedSceneConfidence"];
            v501 = (void *)v13;
            if (!v13 || (double v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v15 = 0;
              goto LABEL_28;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v14;
LABEL_28:
              uint64_t v16 = [v5 objectForKeyedSubscript:@"matchedSceneBoundingBox"];
              v476 = (void *)v16;
              if (!v16 || (double v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v473 = 0;
                goto LABEL_31;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v473 = v17;
LABEL_31:
                uint64_t v18 = [v5 objectForKeyedSubscript:@"matchedOCRCharacterRatio"];
                v475 = (void *)v18;
                if (!v18 || (id v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v20 = 0;
                  goto LABEL_34;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v20 = v19;
LABEL_34:
                  uint64_t v21 = [v5 objectForKeyedSubscript:@"matchedOCRImportance"];
                  v458 = (void *)v21;
                  if (!v21 || (double v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    double v23 = 0;
                    goto LABEL_37;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    double v23 = v22;
LABEL_37:
                    uint64_t v24 = [v5 objectForKeyedSubscript:@"matchedFieldsCount"];
                    id v453 = v20;
                    v456 = (void *)v24;
                    if (!v24 || (double v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v450 = 0;
                      goto LABEL_40;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v450 = v25;
LABEL_40:
                      uint64_t v26 = [v5 objectForKeyedSubscript:@"L1Score"];
                      v449 = v23;
                      v454 = (void *)v26;
                      if (!v26 || (double v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v451 = 0;
                        goto LABEL_43;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v451 = v27;
LABEL_43:
                        double v28 = [v5 objectForKeyedSubscript:@"freshness"];
                        double v29 = v11;
                        if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v30 = 0;
                          goto LABEL_46;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v30 = v28;
LABEL_46:
                          uint64_t v31 = [v5 objectForKeyedSubscript:@"favorited"];
                          id v444 = v15;
                          v441 = v28;
                          id v445 = v30;
                          v447 = (void *)v31;
                          if (!v31 || (double v32 = (void *)v31, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v33 = 0;
LABEL_49:
                            uint64_t v34 = [v5 objectForKeyedSubscript:@"aestheticScore"];
                            unsigned int v35 = (void *)v34;
                            v446 = v33;
                            if (v34 && (double v36 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                if (!v505)
                                {
                                  id v442 = 0;
                                  double v8 = 0;
                                  double v59 = v502;
                                  id v40 = v473;
LABEL_456:
                                  uint64_t v101 = v450;
                                  goto LABEL_457;
                                }
                                id v443 = objc_alloc(MEMORY[0x1E4F28C58]);
                                id v482 = v5;
                                uint64_t v131 = *MEMORY[0x1E4F502C8];
                                uint64_t v585 = *MEMORY[0x1E4F28568];
                                unsigned int v35 = v36;
                                id v132 = [NSString alloc];
                                uint64_t v333 = objc_opt_class();
                                uint64_t v133 = v132;
                                id v40 = v473;
                                id v438 = (id)[v133 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v333, @"aestheticScore"];
                                id v586 = v438;
                                uint64_t v134 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v586 forKeys:&v585 count:1];
                                uint64_t v135 = v131;
                                id v5 = v482;
                                v440 = (void *)v134;
                                id v136 = (id)objc_msgSend(v443, "initWithDomain:code:userInfo:", v135, 2);
                                double v8 = 0;
                                id v442 = 0;
                                id *v505 = v136;
                                double v59 = v502;
                                goto LABEL_455;
                              }
                              id v442 = v36;
                            }
                            else
                            {
                              id v442 = 0;
                            }
                            uint64_t v37 = [v5 objectForKeyedSubscript:@"curationScore"];
                            v440 = (void *)v37;
                            if (!v37 || (double v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v438 = 0;
                              goto LABEL_55;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v438 = v38;
LABEL_55:
                              uint64_t v39 = [v5 objectForKeyedSubscript:@"hasEverClickInLastWeek"];
                              id v40 = v473;
                              v437 = (void *)v39;
                              if (!v39 || (double v41 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v42 = 0;
                                goto LABEL_58;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v42 = v41;
LABEL_58:
                                double v43 = [v5 objectForKeyedSubscript:@"hasEverClickInLastMonth"];
                                if (!v43 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v430 = v43;
                                  id v44 = v473;
                                  id v435 = 0;
                                  goto LABEL_61;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  uint64_t v123 = v43;
                                  id v44 = v473;
                                  v430 = v123;
                                  id v435 = v123;
LABEL_61:
                                  uint64_t v45 = [v5 objectForKeyedSubscript:@"hasEverShareInLastWeek"];
                                  v433 = (void *)v45;
                                  if (!v45
                                    || (double v46 = (void *)v45, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v431 = 0;
                                    goto LABEL_64;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v431 = v46;
LABEL_64:
                                    double v47 = [v5 objectForKeyedSubscript:@"hasEverShareInLastMonth"];
                                    id v474 = v44;
                                    if (!v47 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v425 = v47;
                                      id v48 = v42;
                                      id v428 = 0;
                                      goto LABEL_67;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      uint64_t v137 = v47;
                                      id v48 = v42;
                                      v425 = v137;
                                      id v428 = v137;
LABEL_67:
                                      uint64_t v49 = [v5 objectForKeyedSubscript:@"clickCountInLastWeekNormalizedAcrossItems"];
                                      v426 = (void *)v49;
                                      if (!v49
                                        || (double v50 = (void *)v49, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v420 = 0;
                                        goto LABEL_70;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v420 = v50;
LABEL_70:
                                        uint64_t v51 = [v5 objectForKeyedSubscript:@"clickCountInLastMonthNormalizedAcrossItems"];
                                        v423 = (void *)v51;
                                        if (!v51
                                          || (double v52 = (void *)v51, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          id v421 = 0;
LABEL_73:
                                          uint64_t v53 = [v5 objectForKeyedSubscript:@"shareCountInLastWeekNormalizedAcrossItems"];
                                          v419 = (void *)v53;
                                          if (!v53)
                                          {
                                            id v417 = 0;
                                            v415 = v35;
                                            goto LABEL_161;
                                          }
                                          double v54 = (void *)v53;
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            v415 = v35;
                                            id v417 = 0;
LABEL_161:
                                            uint64_t v154 = [v5 objectForKeyedSubscript:@"shareCountInLastMonthNormalizedAcrossItems"];
                                            id v42 = v48;
                                            v416 = (void *)v154;
                                            if (v154
                                              && (v155 = (void *)v154,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                            {
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                              {
                                                if (!v505)
                                                {
                                                  id v156 = 0;
                                                  double v8 = 0;
                                                  double v59 = v502;
                                                  unsigned int v35 = v415;
LABEL_446:
                                                  v178 = v420;
                                                  double v43 = v430;
                                                  goto LABEL_447;
                                                }
                                                id v413 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                v469 = v10;
                                                uint64_t v199 = *MEMORY[0x1E4F502C8];
                                                uint64_t v567 = *MEMORY[0x1E4F28568];
                                                unsigned int v35 = v415;
                                                id v200 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountInLastMonthNormalizedAcrossItems"];
                                                v568 = v200;
                                                v157 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v568 forKeys:&v567 count:1];
                                                uint64_t v201 = v199;
                                                id v10 = v469;
                                                double v8 = 0;
                                                id v156 = 0;
                                                id *v505 = (id)[v413 initWithDomain:v201 code:2 userInfo:v157];
                                                goto LABEL_307;
                                              }
                                              id v156 = v155;
                                            }
                                            else
                                            {
                                              id v156 = 0;
                                            }
                                            v157 = [v5 objectForKeyedSubscript:@"clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"];
                                            unsigned int v35 = v415;
                                            if (!v157 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              v407 = v157;
                                              id v158 = v156;
                                              id v406 = 0;
                                              goto LABEL_167;
                                            }
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              v182 = v157;
                                              id v158 = v156;
                                              v407 = v182;
                                              id v406 = v182;
LABEL_167:
                                              uint64_t v159 = [v5 objectForKeyedSubscript:@"clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"];
                                              id v409 = v42;
                                              v412 = (void *)v159;
                                              if (!v159
                                                || (v160 = (void *)v159,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                id v161 = 0;
                                                goto LABEL_170;
                                              }
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                id v161 = v160;
LABEL_170:
                                                uint64_t v162 = [v5 objectForKeyedSubscript:@"clickCountGivenLocationInLastWeekNormalizedAcrossItems"];
                                                v410 = v161;
                                                v404 = (void *)v162;
                                                if (!v162
                                                  || (v163 = (void *)v162,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  id v164 = 0;
LABEL_173:
                                                  uint64_t v165 = [v5 objectForKeyedSubscript:@"clickCountGivenLocationInLastMonthNormalizedAcrossItems"];
                                                  v402 = v164;
                                                  v389 = (void *)v165;
                                                  if (v165
                                                    && (v166 = (void *)v165,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) == 0))
                                                  {
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                                    {
                                                      if (!v505)
                                                      {
                                                        id v388 = 0;
                                                        double v8 = 0;
                                                        double v59 = v502;
                                                        id v200 = v406;
                                                        id v156 = v158;
                                                        id v42 = v409;
LABEL_441:
                                                        v157 = v407;
                                                        goto LABEL_442;
                                                      }
                                                      id v392 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      id v486 = v5;
                                                      uint64_t v215 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v559 = *MEMORY[0x1E4F28568];
                                                      id v156 = v158;
                                                      id v42 = v409;
                                                      id v387 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clickCountGivenLocationInLastMonthNormalizedAcrossItems"];
                                                      id v560 = v387;
                                                      v167 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v560 forKeys:&v559 count:1];
                                                      uint64_t v216 = v215;
                                                      id v5 = v486;
                                                      double v8 = 0;
                                                      id v388 = 0;
                                                      id *v505 = (id)[v392 initWithDomain:v216 code:2 userInfo:v167];
                                                      double v59 = v502;
                                                      id v200 = v406;
                                                      goto LABEL_440;
                                                    }
                                                    id v388 = v166;
                                                  }
                                                  else
                                                  {
                                                    id v388 = 0;
                                                  }
                                                  [v5 objectForKeyedSubscript:@"clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"];
                                                  v167 = id v156 = v158;
                                                  if (!v167 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    id v391 = v156;
                                                    v168 = v167;
                                                    id v387 = 0;
                                                    goto LABEL_179;
                                                  }
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v391 = v156;
                                                    v168 = v167;
                                                    id v387 = v167;
LABEL_179:
                                                    uint64_t v169 = [v5 objectForKeyedSubscript:@"clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"];
                                                    v386 = (void *)v169;
                                                    if (!v169
                                                      || (v170 = (void *)v169,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      id v384 = 0;
LABEL_182:
                                                      uint64_t v171 = [v5 objectForKeyedSubscript:@"clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"];
                                                      v383 = (void *)v171;
                                                      if (!v171)
                                                      {
                                                        id v381 = 0;
                                                        id v42 = v409;
                                                        goto LABEL_227;
                                                      }
                                                      v172 = (void *)v171;
                                                      objc_opt_class();
                                                      id v42 = v409;
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        id v381 = 0;
                                                        goto LABEL_227;
                                                      }
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        id v381 = v172;
LABEL_227:
                                                        uint64_t v207 = [v5 objectForKeyedSubscript:@"clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"];
                                                        v376 = v168;
                                                        v380 = (void *)v207;
                                                        if (!v207
                                                          || (id v208 = (void *)v207,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          id v378 = 0;
LABEL_230:
                                                          uint64_t v209 = [v5 objectForKeyedSubscript:@"clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"];
                                                          v377 = (void *)v209;
                                                          if (!v209)
                                                          {
                                                            id v373 = 0;
                                                            id v156 = v391;
                                                            goto LABEL_244;
                                                          }
                                                          id v210 = (void *)v209;
                                                          objc_opt_class();
                                                          id v156 = v391;
                                                          if (objc_opt_isKindOfClass())
                                                          {
                                                            id v373 = 0;
LABEL_244:
                                                            uint64_t v217 = [v5 objectForKeyedSubscript:@"clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"];
                                                            v375 = (void *)v217;
                                                            if (v217
                                                              && (id v218 = (void *)v217,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                                            {
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                              {
                                                                if (!v505)
                                                                {
                                                                  id v374 = 0;
                                                                  double v8 = 0;
                                                                  double v59 = v502;
                                                                  id v200 = v406;
LABEL_434:
                                                                  v257 = v373;
                                                                  goto LABEL_435;
                                                                }
                                                                id v394 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                id v490 = v5;
                                                                uint64_t v266 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v547 = *MEMORY[0x1E4F28568];
                                                                id v42 = v409;
                                                                v267 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"];
                                                                v548 = v267;
                                                                uint64_t v268 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v548 forKeys:&v547 count:1];
                                                                uint64_t v269 = v266;
                                                                id v5 = v490;
                                                                v372 = (void *)v268;
                                                                double v8 = 0;
                                                                id v374 = 0;
                                                                id *v505 = (id)objc_msgSend(v394, "initWithDomain:code:userInfo:", v269, 2);
                                                                goto LABEL_359;
                                                              }
                                                              id v374 = v218;
                                                            }
                                                            else
                                                            {
                                                              id v374 = 0;
                                                            }
                                                            uint64_t v219 = [v5 objectForKeyedSubscript:@"clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"];
                                                            v372 = (void *)v219;
                                                            if (!v219
                                                              || (id v220 = (void *)v219,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              id v369 = 0;
LABEL_250:
                                                              uint64_t v221 = [v5 objectForKeyedSubscript:@"clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"];
                                                              v371 = (void *)v221;
                                                              if (v221
                                                                && (id v222 = (void *)v221,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                              {
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                {
                                                                  if (!v505)
                                                                  {
                                                                    id v370 = 0;
                                                                    double v8 = 0;
                                                                    double v59 = v502;
                                                                    id v200 = v406;
LABEL_431:
                                                                    v267 = v369;
                                                                    goto LABEL_432;
                                                                  }
                                                                  id v395 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                  id v492 = v5;
                                                                  uint64_t v275 = *MEMORY[0x1E4F502C8];
                                                                  uint64_t v543 = *MEMORY[0x1E4F28568];
                                                                  id v42 = v409;
                                                                  id v368 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"];
                                                                  id v544 = v368;
                                                                  v276 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v544 forKeys:&v543 count:1];
                                                                  uint64_t v277 = v275;
                                                                  id v5 = v492;
                                                                  double v8 = 0;
                                                                  id v370 = 0;
                                                                  id *v505 = (id)[v395 initWithDomain:v277 code:2 userInfo:v276];
                                                                  double v59 = v502;
                                                                  id v200 = v406;
LABEL_430:

                                                                  goto LABEL_431;
                                                                }
                                                                id v370 = v222;
                                                              }
                                                              else
                                                              {
                                                                id v370 = 0;
                                                              }
                                                              uint64_t v223 = [v5 objectForKeyedSubscript:@"shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"];
                                                              v367 = (void *)v223;
                                                              if (v223
                                                                && (id v224 = (void *)v223,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                              {
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                {
                                                                  if (!v505)
                                                                  {
                                                                    id v368 = 0;
                                                                    double v8 = 0;
                                                                    double v59 = v502;
                                                                    id v200 = v406;
LABEL_429:
                                                                    v276 = v367;
                                                                    goto LABEL_430;
                                                                  }
                                                                  id v396 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                  id v493 = v5;
                                                                  uint64_t v278 = *MEMORY[0x1E4F502C8];
                                                                  uint64_t v541 = *MEMORY[0x1E4F28568];
                                                                  id v42 = v409;
                                                                  id v366 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"];
                                                                  id v542 = v366;
                                                                  id v225 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v542 forKeys:&v541 count:1];
                                                                  uint64_t v279 = v278;
                                                                  id v5 = v493;
                                                                  double v8 = 0;
                                                                  id v368 = 0;
                                                                  id *v505 = (id)[v396 initWithDomain:v279 code:2 userInfo:v225];
                                                                  goto LABEL_375;
                                                                }
                                                                id v368 = v224;
                                                              }
                                                              else
                                                              {
                                                                id v368 = 0;
                                                              }
                                                              id v225 = [v5 objectForKeyedSubscript:@"shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"];
                                                              if (!v225
                                                                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                v363 = v225;
                                                                id v366 = 0;
LABEL_259:
                                                                uint64_t v226 = [v5 objectForKeyedSubscript:@"shareCountGivenLocationInLastWeekNormalizedAcrossItems"];
                                                                v364 = (void *)v226;
                                                                if (v226
                                                                  && (id v227 = (void *)v226,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                  {
                                                                    if (!v505)
                                                                    {
                                                                      id v365 = 0;
                                                                      double v8 = 0;
                                                                      double v59 = v502;
                                                                      id v200 = v406;
LABEL_426:
                                                                      id v225 = v363;
                                                                      goto LABEL_427;
                                                                    }
                                                                    id v398 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                    id v495 = v5;
                                                                    uint64_t v283 = *MEMORY[0x1E4F502C8];
                                                                    uint64_t v537 = *MEMORY[0x1E4F28568];
                                                                    id v42 = v409;
                                                                    v284 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenLocationInLastWeekNormalizedAcrossItems"];
                                                                    v538 = v284;
                                                                    uint64_t v285 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v538 forKeys:&v537 count:1];
                                                                    uint64_t v286 = v283;
                                                                    id v5 = v495;
                                                                    v362 = (void *)v285;
                                                                    double v8 = 0;
                                                                    id v365 = 0;
                                                                    id *v505 = (id)objc_msgSend(v398, "initWithDomain:code:userInfo:", v286, 2);
                                                                    goto LABEL_386;
                                                                  }
                                                                  id v365 = v227;
                                                                }
                                                                else
                                                                {
                                                                  id v365 = 0;
                                                                }
                                                                uint64_t v228 = [v5 objectForKeyedSubscript:@"shareCountGivenLocationInLastMonthNormalizedAcrossItems"];
                                                                v362 = (void *)v228;
                                                                if (!v228
                                                                  || (id v229 = (void *)v228,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  id v361 = 0;
                                                                  goto LABEL_265;
                                                                }
                                                                objc_opt_class();
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  id v361 = v229;
LABEL_265:
                                                                  uint64_t v230 = [v5 objectForKeyedSubscript:@"shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"];
                                                                  v360 = (void *)v230;
                                                                  if (!v230
                                                                    || (id v231 = (void *)v230,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    id v357 = 0;
                                                                    goto LABEL_268;
                                                                  }
                                                                  objc_opt_class();
                                                                  if (objc_opt_isKindOfClass())
                                                                  {
                                                                    id v357 = v231;
LABEL_268:
                                                                    uint64_t v232 = [v5 objectForKeyedSubscript:@"shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"];
                                                                    v358 = (void *)v232;
                                                                    if (!v232
                                                                      || (id v233 = (void *)v232,
                                                                          objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      id v359 = 0;
                                                                      goto LABEL_271;
                                                                    }
                                                                    objc_opt_class();
                                                                    if (objc_opt_isKindOfClass())
                                                                    {
                                                                      id v359 = v233;
LABEL_271:
                                                                      uint64_t v234 = [v5 objectForKeyedSubscript:@"shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"];
                                                                      v355 = (void *)v234;
                                                                      if (!v234
                                                                        || (id v235 = (void *)v234,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        id v356 = 0;
                                                                        goto LABEL_274;
                                                                      }
                                                                      objc_opt_class();
                                                                      if (objc_opt_isKindOfClass())
                                                                      {
                                                                        id v356 = v235;
LABEL_274:
                                                                        uint64_t v236 = [v5 objectForKeyedSubscript:@"shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"];
                                                                        v353 = (void *)v236;
                                                                        if (!v236
                                                                          || (id v237 = (void *)v236,
                                                                              objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                        {
                                                                          id v354 = 0;
                                                                          goto LABEL_277;
                                                                        }
                                                                        objc_opt_class();
                                                                        if (objc_opt_isKindOfClass())
                                                                        {
                                                                          id v354 = v237;
LABEL_277:
                                                                          uint64_t v238 = [v5 objectForKeyedSubscript:@"shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"];
                                                                          v351 = (void *)v238;
                                                                          if (!v238
                                                                            || (id v239 = (void *)v238,
                                                                                objc_opt_class(),
                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                          {
                                                                            id v352 = 0;
                                                                            goto LABEL_280;
                                                                          }
                                                                          objc_opt_class();
                                                                          if (objc_opt_isKindOfClass())
                                                                          {
                                                                            id v352 = v239;
LABEL_280:
                                                                            v349 = [v5 objectForKeyedSubscript:@"shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"];
                                                                            if (!v349
                                                                              || (objc_opt_class(),
                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                            {
                                                                              id v350 = 0;
                                                                              goto LABEL_283;
                                                                            }
                                                                            objc_opt_class();
                                                                            if (objc_opt_isKindOfClass())
                                                                            {
                                                                              id v350 = v349;
LABEL_283:
                                                                              v347 = [v5 objectForKeyedSubscript:@"shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"];
                                                                              if (!v347
                                                                                || (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                              {
                                                                                id v348 = 0;
                                                                                goto LABEL_286;
                                                                              }
                                                                              objc_opt_class();
                                                                              if (objc_opt_isKindOfClass())
                                                                              {
                                                                                id v348 = v347;
LABEL_286:
                                                                                v345 = [v5 objectForKeyedSubscript:@"shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"];
                                                                                if (!v345
                                                                                  || (objc_opt_class(),
                                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                                {
                                                                                  id v346 = 0;
                                                                                  goto LABEL_289;
                                                                                }
                                                                                objc_opt_class();
                                                                                if (objc_opt_isKindOfClass())
                                                                                {
                                                                                  id v346 = v345;
LABEL_289:
                                                                                  v343 = [v5 objectForKeyedSubscript:@"clipScore"];
                                                                                  if (!v343
                                                                                    || (objc_opt_class(),
                                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                                  {
                                                                                    id v344 = 0;
                                                                                    goto LABEL_292;
                                                                                  }
                                                                                  id v401 = v156;
                                                                                  objc_opt_class();
                                                                                  if (objc_opt_isKindOfClass())
                                                                                  {
                                                                                    id v344 = v343;
                                                                                    unsigned int v35 = v415;
LABEL_292:
                                                                                    uint64_t v240 = [v5 objectForKeyedSubscript:@"correlationMetricVersion"];
                                                                                    v340 = (void *)v240;
                                                                                    if (!v240
                                                                                      || (id v241 = (void *)v240,
                                                                                          objc_opt_class(),
                                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                                    {
                                                                                      id v342 = 0;
                                                                                      goto LABEL_295;
                                                                                    }
                                                                                    id v401 = v156;
                                                                                    objc_opt_class();
                                                                                    if (objc_opt_isKindOfClass())
                                                                                    {
                                                                                      id v342 = v241;
                                                                                      unsigned int v35 = v415;
LABEL_295:
                                                                                      id v242 = [v5 objectForKeyedSubscript:@"correlationMetricWindowInDays"];
                                                                                      if (!v242
                                                                                        || (objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                                      {
                                                                                        v506 = v242;
                                                                                        id v341 = 0;
                                                                                        double v59 = v502;
                                                                                        id v243 = v503;
                                                                                        id v244 = v474;
LABEL_298:
                                                                                        id v200 = v406;
                                                                                        id v503 = v243;
                                                                                        double v8 = objc_retain(-[BMAeroMLPhotosSearchDataCorrelations initWithSearchSessionUUID:uiSurface:matchedPeopleRatio:matchedLocationRatio:matchedSceneRatio:matchedSceneConfidence:matchedSceneBoundingBox:matchedOCRCharacterRatio:matchedOCRImportance:matchedFieldsCount:L1Score:freshness:favorited:aestheticScore:curationScore:hasEverClickInLastWeek:hasEverClickInLastMonth:hasEverShareInLastWeek:hasEverShareInLastMonth:clickCountInLastWeekNormalizedAcrossItems:clickCountInLastMonthNormalizedAcrossItems:shareCountInLastWeekNormalizedAcrossItems:shareCountInLastMonthNormalizedAcrossItems:clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:clickCountGivenLocationInLastWeekNormalizedAcrossItems:clickCountGivenLocationInLastMonthNormalizedAcrossItems:clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:shareCountGivenLocationInLastWeekNormalizedAcrossItems:shareCountGivenLocationInLastMonthNormalizedAcrossItems:shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:clipScore:correlationMetricVersion:correlationMetricWindowInDays:](self, "initWithSearchSessionUUID:uiSurface:matchedPeopleRatio:matchedLocationRatio:matchedSceneRatio:matchedSceneConfidence:matchedSceneBoundingBox:matchedOCRCharacterRatio:matchedOCRImportance:matchedFieldsCount:L1Score:freshness:favorited:aestheticScore:curationScore:hasEverClickInLastWeek:hasEverClickInLastMonth:hasEverShareInLastWeek:hasEverShareInLastMonth:clickCountInLastWeekNormalizedAcro"
                                                                                                 "ssItems:clickCountInLas"
                                                                                                 "tMonthNormalizedAcrossI"
                                                                                                 "tems:shareCountInLastWe"
                                                                                                 "ekNormalizedAcrossItems"
                                                                                                 ":shareCountInLastMonthN"
                                                                                                 "ormalizedAcrossItems:cl"
                                                                                                 "ickCountGivenTimeOfDayI"
                                                                                                 "nLastWeekNormalizedAcro"
                                                                                                 "ssItems:clickCountGiven"
                                                                                                 "TimeOfDayInLastMonthNor"
                                                                                                 "malizedAcrossItems:clic"
                                                                                                 "kCountGivenLocationInLa"
                                                                                                 "stWeekNormalizedAcrossI"
                                                                                                 "tems:clickCountGivenLoc"
                                                                                                 "ationInLastMonthNormali"
                                                                                                 "zedAcrossItems:clickCou"
                                                                                                 "ntGivenDayCategoryInLas"
                                                                                                 "tWeekNormalizedAcrossIt"
                                                                                                 "ems:clickCountGivenDayC"
                                                                                                 "ategoryInLastMonthNorma"
                                                                                                 "lizedAcrossItems:clickC"
                                                                                                 "ountGivenRecencyCategor"
                                                                                                 "yInLastWeekNormalizedAc"
                                                                                                 "rossItems:clickCountGiv"
                                                                                                 "enRecencyCategoryInLast"
                                                                                                 "MonthNormalizedAcrossIt"
                                                                                                 "ems:clickCountGivenScen"
                                                                                                 "eCategoryInLastWeekNorm"
                                                                                                 "alizedAcrossItems:click"
                                                                                                 "CountGivenSceneCategory"
                                                                                                 "InLastMonthNormalizedAc"
                                                                                                 "rossItems:clickCountGiv"
                                                                                                 "enFaceCountCategoryInLa"
                                                                                                 "stWeekNormalizedAcrossI"
                                                                                                 "tems:clickCountGivenFac"
                                                                                                 "eCountCategoryInLastMon"
                                                                                                 "thNormalizedAcrossItems"
                                                                                                 ":shareCountGivenTimeOfD"
                                                                                                 "ayInLastWeekNormalizedA"
                                                                                                 "crossItems:shareCountGi"
                                                                                                 "venTimeOfDayInLastMonth"
                                                                                                 "NormalizedAcrossItems:s"
                                                                                                 "hareCountGivenLocationI"
                                                                                                 "nLastWeekNormalizedAcro"
                                                                                                 "ssItems:shareCountGiven"
                                                                                                 "LocationInLastMonthNorm"
                                                                                                 "alizedAcrossItems:share"
                                                                                                 "CountGivenDayCategoryIn"
                                                                                                 "LastWeekNormalizedAcros"
                                                                                                 "sItems:shareCountGivenD"
                                                                                                 "ayCategoryInLastMonthNo"
                                                                                                 "rmalizedAcrossItems:sha"
                                                                                                 "reCountGivenRecencyCate"
                                                                                                 "goryInLastWeekNormalize"
                                                                                                 "dAcrossItems:shareCount"
                                                                                                 "GivenRecencyCategoryInL"
                                                                                                 "astMonthNormalizedAcros"
                                                                                                 "sItems:shareCountGivenS"
                                                                                                 "ceneCategoryInLastWeekN"
                                                                                                 "ormalizedAcrossItems:sh"
                                                                                                 "areCountGivenSceneCateg"
                                                                                                 "oryInLastMonthNormalize"
                                                                                                 "dAcrossItems:shareCount"
                                                                                                 "GivenFaceCountCategoryI"
                                                                                                 "nLastWeekNormalizedAcro"
                                                                                                 "ssItems:shareCountGiven"
                                                                                                 "FaceCountCategoryInLast"
                                                                                                 "MonthNormalizedAcrossIt"
                                                                                                 "ems:clipScore:correlati"
                                                                                                 "onMetricVersion:correla"
                                                                                                 "tionMetricWindowInDays:",
                                                                                                 v509,
                                                                                                 [v507 intValue], v29, v243, v504, v444, v244, v453, v449, v450, v451, v445, v446, v442, v438, v42, v435, v431, v428,
                                                                                                 v420,
                                                                                                 v421,
                                                                                                 v417,
                                                                                                 v156,
                                                                                                 v406,
                                                                                                 v410,
                                                                                                 v402,
                                                                                                 v388,
                                                                                                 v387,
                                                                                                 v384,
                                                                                                 v381,
                                                                                                 v378,
                                                                                                 v373,
                                                                                                 v374,
                                                                                                 v369,
                                                                                                 v370,
                                                                                                 v368,
                                                                                                 v366,
                                                                                                 v365,
                                                                                                 v361,
                                                                                                 v357,
                                                                                                 v359,
                                                                                                 v356,
                                                                                                 v354,
                                                                                                 v352,
                                                                                                 v350,
                                                                                                 v348,
                                                                                                 v346,
                                                                                                 v344,
                                                                                                 v342,
                                                                                                 v341));
                                                                                        self = v8;
                                                                                        id v242 = v506;
LABEL_414:

LABEL_415:
                                                                                        v288 = v357;

LABEL_416:
LABEL_417:

LABEL_418:
LABEL_419:

                                                                                        goto LABEL_420;
                                                                                      }
                                                                                      id v401 = v156;
                                                                                      objc_opt_class();
                                                                                      if (objc_opt_isKindOfClass())
                                                                                      {
                                                                                        v506 = v242;
                                                                                        id v341 = v242;
                                                                                        double v59 = v502;
                                                                                        id v243 = v503;
                                                                                        id v244 = v474;
                                                                                        goto LABEL_298;
                                                                                      }
                                                                                      id v500 = v5;
                                                                                      v472 = v10;
                                                                                      if (v505)
                                                                                      {
                                                                                        id v319 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                        uint64_t v320 = *MEMORY[0x1E4F502C8];
                                                                                        uint64_t v513 = *MEMORY[0x1E4F28568];
                                                                                        v321 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"correlationMetricWindowInDays"];
                                                                                        v514 = v321;
                                                                                        v322 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v514 forKeys:&v513 count:1];
                                                                                        id *v505 = (id)[v319 initWithDomain:v320 code:2 userInfo:v322];
                                                                                      }
                                                                                      id v341 = 0;
                                                                                      double v8 = 0;
                                                                                      id v10 = v472;
                                                                                      id v5 = v500;
                                                                                      double v59 = v502;
                                                                                      id v42 = v409;
LABEL_413:
                                                                                      id v156 = v401;
                                                                                      id v200 = v406;
                                                                                      goto LABEL_414;
                                                                                    }
                                                                                    if (v505)
                                                                                    {
                                                                                      id v317 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                      uint64_t v318 = *MEMORY[0x1E4F502C8];
                                                                                      uint64_t v515 = *MEMORY[0x1E4F28568];
                                                                                      id v341 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"correlationMetricVersion"];
                                                                                      id v516 = v341;
                                                                                      id v242 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v516 forKeys:&v515 count:1];
                                                                                      double v8 = 0;
                                                                                      id v342 = 0;
                                                                                      id *v505 = (id)[v317 initWithDomain:v318 code:2 userInfo:v242];
                                                                                      double v59 = v502;
                                                                                      unsigned int v35 = v415;
                                                                                      goto LABEL_413;
                                                                                    }
                                                                                    id v342 = 0;
                                                                                    double v8 = 0;
LABEL_480:
                                                                                    double v59 = v502;
                                                                                    unsigned int v35 = v415;
                                                                                    id v156 = v401;
                                                                                    id v200 = v406;
                                                                                    goto LABEL_415;
                                                                                  }
                                                                                  if (v505)
                                                                                  {
                                                                                    id v314 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                    uint64_t v315 = *MEMORY[0x1E4F502C8];
                                                                                    uint64_t v517 = *MEMORY[0x1E4F28568];
                                                                                    id v342 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clipScore"];
                                                                                    id v518 = v342;
                                                                                    v340 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v518 forKeys:&v517 count:1];
                                                                                    id v316 = (id)objc_msgSend(v314, "initWithDomain:code:userInfo:", v315, 2);
                                                                                    double v8 = 0;
                                                                                    id v344 = 0;
                                                                                    id *v505 = v316;
                                                                                    goto LABEL_480;
                                                                                  }
                                                                                  id v344 = 0;
                                                                                  double v8 = 0;
                                                                                  double v59 = v502;
                                                                                  unsigned int v35 = v415;
LABEL_478:
                                                                                  id v200 = v406;
                                                                                  v288 = v357;
                                                                                  goto LABEL_416;
                                                                                }
                                                                                v400 = v29;
                                                                                if (v505)
                                                                                {
                                                                                  id v311 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                  uint64_t v312 = *MEMORY[0x1E4F502C8];
                                                                                  uint64_t v519 = *MEMORY[0x1E4F28568];
                                                                                  id v344 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"];
                                                                                  id v520 = v344;
                                                                                  v343 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v520 forKeys:&v519 count:1];
                                                                                  id v313 = (id)objc_msgSend(v311, "initWithDomain:code:userInfo:", v312, 2);
                                                                                  double v8 = 0;
                                                                                  id v346 = 0;
                                                                                  id *v505 = v313;
                                                                                  double v29 = v400;
                                                                                  double v59 = v502;
                                                                                  goto LABEL_478;
                                                                                }
                                                                                id v346 = 0;
                                                                                double v8 = 0;
LABEL_476:
                                                                                double v29 = v400;
                                                                                double v59 = v502;
                                                                                id v200 = v406;
                                                                                v288 = v357;
                                                                                goto LABEL_417;
                                                                              }
                                                                              v400 = v29;
                                                                              if (v505)
                                                                              {
                                                                                id v308 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                uint64_t v309 = *MEMORY[0x1E4F502C8];
                                                                                uint64_t v521 = *MEMORY[0x1E4F28568];
                                                                                id v346 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"];
                                                                                id v522 = v346;
                                                                                v345 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v522 forKeys:&v521 count:1];
                                                                                id v310 = (id)objc_msgSend(v308, "initWithDomain:code:userInfo:", v309, 2);
                                                                                double v8 = 0;
                                                                                id v348 = 0;
                                                                                id *v505 = v310;
                                                                                goto LABEL_476;
                                                                              }
                                                                              id v348 = 0;
                                                                              double v8 = 0;
LABEL_474:
                                                                              double v29 = v400;
                                                                              double v59 = v502;
                                                                              id v200 = v406;
                                                                              v288 = v357;
                                                                              goto LABEL_418;
                                                                            }
                                                                            v400 = v29;
                                                                            if (v505)
                                                                            {
                                                                              id v305 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                              uint64_t v306 = *MEMORY[0x1E4F502C8];
                                                                              uint64_t v523 = *MEMORY[0x1E4F28568];
                                                                              id v348 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"];
                                                                              id v524 = v348;
                                                                              v347 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v524 forKeys:&v523 count:1];
                                                                              id v307 = (id)objc_msgSend(v305, "initWithDomain:code:userInfo:", v306, 2);
                                                                              double v8 = 0;
                                                                              id v350 = 0;
                                                                              id *v505 = v307;
                                                                              goto LABEL_474;
                                                                            }
                                                                            id v350 = 0;
                                                                            double v8 = 0;
LABEL_472:
                                                                            double v29 = v400;
                                                                            double v59 = v502;
                                                                            id v200 = v406;
                                                                            v288 = v357;
                                                                            goto LABEL_419;
                                                                          }
                                                                          v400 = v29;
                                                                          if (v505)
                                                                          {
                                                                            id v499 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                            uint64_t v304 = *MEMORY[0x1E4F502C8];
                                                                            uint64_t v525 = *MEMORY[0x1E4F28568];
                                                                            id v350 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"];
                                                                            id v526 = v350;
                                                                            v349 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v526 forKeys:&v525 count:1];
                                                                            double v8 = 0;
                                                                            id v352 = 0;
                                                                            id *v505 = (id)objc_msgSend(v499, "initWithDomain:code:userInfo:", v304, 2);
                                                                            goto LABEL_472;
                                                                          }
                                                                          id v352 = 0;
                                                                          double v8 = 0;
LABEL_409:
                                                                          double v29 = v400;
                                                                          double v59 = v502;
                                                                          id v200 = v406;
                                                                          v288 = v357;
LABEL_420:

                                                                          goto LABEL_421;
                                                                        }
                                                                        v400 = v29;
                                                                        if (v505)
                                                                        {
                                                                          id v302 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                          uint64_t v303 = *MEMORY[0x1E4F502C8];
                                                                          uint64_t v527 = *MEMORY[0x1E4F28568];
                                                                          id v352 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"];
                                                                          id v528 = v352;
                                                                          v351 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v528 forKeys:&v527 count:1];
                                                                          double v8 = 0;
                                                                          id v354 = 0;
                                                                          id *v505 = (id)objc_msgSend(v302, "initWithDomain:code:userInfo:", v303, 2);
                                                                          goto LABEL_409;
                                                                        }
                                                                        id v354 = 0;
                                                                        double v8 = 0;
LABEL_405:
                                                                        double v29 = v400;
                                                                        double v59 = v502;
                                                                        id v200 = v406;
                                                                        v288 = v357;
LABEL_421:

                                                                        goto LABEL_422;
                                                                      }
                                                                      v400 = v29;
                                                                      if (v505)
                                                                      {
                                                                        id v300 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                        uint64_t v301 = *MEMORY[0x1E4F502C8];
                                                                        uint64_t v529 = *MEMORY[0x1E4F28568];
                                                                        id v354 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"];
                                                                        id v530 = v354;
                                                                        v353 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v530 forKeys:&v529 count:1];
                                                                        double v8 = 0;
                                                                        id v356 = 0;
                                                                        id *v505 = (id)objc_msgSend(v300, "initWithDomain:code:userInfo:", v301, 2);
                                                                        goto LABEL_405;
                                                                      }
                                                                      id v356 = 0;
                                                                      double v8 = 0;
LABEL_401:
                                                                      double v59 = v502;
                                                                      id v200 = v406;
                                                                      v288 = v357;
LABEL_422:

                                                                      goto LABEL_423;
                                                                    }
                                                                    if (v505)
                                                                    {
                                                                      id v296 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                      id v498 = v5;
                                                                      uint64_t v297 = *MEMORY[0x1E4F502C8];
                                                                      uint64_t v531 = *MEMORY[0x1E4F28568];
                                                                      id v42 = v409;
                                                                      id v356 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"];
                                                                      id v532 = v356;
                                                                      uint64_t v298 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v532 forKeys:&v531 count:1];
                                                                      uint64_t v299 = v297;
                                                                      id v5 = v498;
                                                                      v355 = (void *)v298;
                                                                      double v8 = 0;
                                                                      id v359 = 0;
                                                                      id *v505 = (id)objc_msgSend(v296, "initWithDomain:code:userInfo:", v299, 2);
                                                                      goto LABEL_401;
                                                                    }
                                                                    id v359 = 0;
                                                                    double v8 = 0;
                                                                    double v59 = v502;
                                                                    id v200 = v406;
                                                                    v288 = v357;
LABEL_423:

                                                                    goto LABEL_424;
                                                                  }
                                                                  if (v505)
                                                                  {
                                                                    id v291 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                    id v497 = v5;
                                                                    uint64_t v292 = *MEMORY[0x1E4F502C8];
                                                                    uint64_t v533 = *MEMORY[0x1E4F28568];
                                                                    id v42 = v409;
                                                                    id v359 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"];
                                                                    id v534 = v359;
                                                                    uint64_t v293 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v534 forKeys:&v533 count:1];
                                                                    uint64_t v294 = v292;
                                                                    id v5 = v497;
                                                                    v358 = (void *)v293;
                                                                    id v295 = (id)objc_msgSend(v291, "initWithDomain:code:userInfo:", v294, 2);
                                                                    double v8 = 0;
                                                                    v288 = 0;
                                                                    id *v505 = v295;
                                                                    double v59 = v502;
                                                                    id v200 = v406;
                                                                    goto LABEL_423;
                                                                  }
                                                                  v288 = 0;
                                                                  double v8 = 0;
LABEL_392:
                                                                  double v59 = v502;
                                                                  id v200 = v406;
LABEL_424:

                                                                  v284 = v361;
                                                                  goto LABEL_425;
                                                                }
                                                                if (v505)
                                                                {
                                                                  id v399 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                  id v496 = v5;
                                                                  uint64_t v287 = *MEMORY[0x1E4F502C8];
                                                                  uint64_t v535 = *MEMORY[0x1E4F28568];
                                                                  id v42 = v409;
                                                                  v288 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenLocationInLastMonthNormalizedAcrossItems"];
                                                                  v536 = v288;
                                                                  uint64_t v289 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v536 forKeys:&v535 count:1];
                                                                  uint64_t v290 = v287;
                                                                  id v5 = v496;
                                                                  v360 = (void *)v289;
                                                                  double v8 = 0;
                                                                  id v361 = 0;
                                                                  id *v505 = (id)objc_msgSend(v399, "initWithDomain:code:userInfo:", v290, 2);
                                                                  goto LABEL_392;
                                                                }
                                                                v284 = 0;
                                                                double v8 = 0;
LABEL_386:
                                                                double v59 = v502;
                                                                id v200 = v406;
LABEL_425:

                                                                goto LABEL_426;
                                                              }
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass())
                                                              {
                                                                v363 = v225;
                                                                id v366 = v225;
                                                                goto LABEL_259;
                                                              }
                                                              if (v505)
                                                              {
                                                                id v397 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                id v494 = v5;
                                                                uint64_t v280 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v539 = *MEMORY[0x1E4F28568];
                                                                id v42 = v409;
                                                                id v365 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"];
                                                                id v540 = v365;
                                                                uint64_t v281 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v540 forKeys:&v539 count:1];
                                                                uint64_t v282 = v280;
                                                                id v5 = v494;
                                                                v364 = (void *)v281;
                                                                double v8 = 0;
                                                                id v366 = 0;
                                                                id *v505 = (id)objc_msgSend(v397, "initWithDomain:code:userInfo:", v282, 2);
                                                                double v59 = v502;
                                                                id v200 = v406;
LABEL_427:

                                                                goto LABEL_428;
                                                              }
                                                              id v366 = 0;
                                                              double v8 = 0;
LABEL_375:
                                                              double v59 = v502;
                                                              id v200 = v406;
LABEL_428:

                                                              goto LABEL_429;
                                                            }
                                                            objc_opt_class();
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              id v369 = v220;
                                                              goto LABEL_250;
                                                            }
                                                            if (v505)
                                                            {
                                                              id v270 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                              id v491 = v5;
                                                              uint64_t v271 = *MEMORY[0x1E4F502C8];
                                                              uint64_t v545 = *MEMORY[0x1E4F28568];
                                                              id v42 = v409;
                                                              id v370 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"];
                                                              id v546 = v370;
                                                              uint64_t v272 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v546 forKeys:&v545 count:1];
                                                              uint64_t v273 = v271;
                                                              id v5 = v491;
                                                              v371 = (void *)v272;
                                                              id v274 = (id)objc_msgSend(v270, "initWithDomain:code:userInfo:", v273, 2);
                                                              double v8 = 0;
                                                              v267 = 0;
                                                              id *v505 = v274;
                                                              double v59 = v502;
                                                              id v200 = v406;
LABEL_432:

                                                              goto LABEL_433;
                                                            }
                                                            v267 = 0;
                                                            double v8 = 0;
LABEL_359:
                                                            double v59 = v502;
                                                            id v200 = v406;
LABEL_433:

                                                            goto LABEL_434;
                                                          }
                                                          objc_opt_class();
                                                          if (objc_opt_isKindOfClass())
                                                          {
                                                            id v373 = v210;
                                                            goto LABEL_244;
                                                          }
                                                          if (v505)
                                                          {
                                                            id v261 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            id v489 = v5;
                                                            uint64_t v262 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v549 = *MEMORY[0x1E4F28568];
                                                            id v42 = v409;
                                                            id v374 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"];
                                                            id v550 = v374;
                                                            uint64_t v263 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v550 forKeys:&v549 count:1];
                                                            uint64_t v264 = v262;
                                                            id v5 = v489;
                                                            v375 = (void *)v263;
                                                            id v265 = (id)objc_msgSend(v261, "initWithDomain:code:userInfo:", v264, 2);
                                                            double v8 = 0;
                                                            v257 = 0;
                                                            id *v505 = v265;
                                                            double v59 = v502;
                                                            id v200 = v406;
LABEL_435:

                                                            goto LABEL_436;
                                                          }
                                                          v257 = 0;
                                                          double v8 = 0;
LABEL_348:
                                                          double v59 = v502;
                                                          id v200 = v406;
LABEL_436:

                                                          v167 = v376;
                                                          goto LABEL_437;
                                                        }
                                                        objc_opt_class();
                                                        if (objc_opt_isKindOfClass())
                                                        {
                                                          id v378 = v208;
                                                          goto LABEL_230;
                                                        }
                                                        if (v505)
                                                        {
                                                          id v379 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                          id v488 = v5;
                                                          uint64_t v256 = *MEMORY[0x1E4F502C8];
                                                          uint64_t v551 = *MEMORY[0x1E4F28568];
                                                          id v156 = v391;
                                                          id v42 = v409;
                                                          v257 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"];
                                                          v552 = v257;
                                                          uint64_t v258 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v552 forKeys:&v551 count:1];
                                                          uint64_t v259 = v256;
                                                          id v5 = v488;
                                                          v377 = (void *)v258;
                                                          id v260 = (id)objc_msgSend(v379, "initWithDomain:code:userInfo:", v259, 2);
                                                          double v8 = 0;
                                                          id v378 = 0;
                                                          id *v505 = v260;
                                                          goto LABEL_348;
                                                        }
                                                        id v378 = 0;
                                                        double v8 = 0;
                                                        double v59 = v502;
                                                        id v200 = v406;
                                                        v167 = v168;
                                                        id v156 = v391;
LABEL_437:

                                                        goto LABEL_438;
                                                      }
                                                      v167 = v168;
                                                      if (v505)
                                                      {
                                                        id v382 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                        v471 = v10;
                                                        uint64_t v252 = *MEMORY[0x1E4F502C8];
                                                        uint64_t v553 = *MEMORY[0x1E4F28568];
                                                        id v156 = v391;
                                                        id v42 = v409;
                                                        id v378 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"];
                                                        id v554 = v378;
                                                        uint64_t v253 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v554 forKeys:&v553 count:1];
                                                        uint64_t v254 = v252;
                                                        id v10 = v471;
                                                        v380 = (void *)v253;
                                                        id v255 = (id)objc_msgSend(v382, "initWithDomain:code:userInfo:", v254, 2);
                                                        double v8 = 0;
                                                        id v381 = 0;
                                                        id *v505 = v255;
                                                        double v59 = v502;
                                                        id v200 = v406;
                                                        goto LABEL_437;
                                                      }
                                                      id v381 = 0;
                                                      double v8 = 0;
                                                      double v59 = v502;
                                                      id v200 = v406;
                                                      id v156 = v391;
LABEL_438:

                                                      goto LABEL_439;
                                                    }
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      id v384 = v170;
                                                      goto LABEL_182;
                                                    }
                                                    if (v505)
                                                    {
                                                      id v385 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      v470 = v10;
                                                      uint64_t v248 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v555 = *MEMORY[0x1E4F28568];
                                                      v167 = v168;
                                                      id v156 = v391;
                                                      id v42 = v409;
                                                      id v381 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"];
                                                      id v556 = v381;
                                                      uint64_t v249 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v556 forKeys:&v555 count:1];
                                                      uint64_t v250 = v248;
                                                      id v10 = v470;
                                                      v383 = (void *)v249;
                                                      id v251 = (id)objc_msgSend(v385, "initWithDomain:code:userInfo:", v250, 2);
                                                      double v8 = 0;
                                                      id v384 = 0;
                                                      id *v505 = v251;
                                                      double v59 = v502;
                                                      id v200 = v406;
                                                      goto LABEL_438;
                                                    }
                                                    id v384 = 0;
                                                    double v8 = 0;
                                                    double v59 = v502;
                                                    id v200 = v406;
                                                    id v42 = v409;
                                                    v167 = v168;
                                                    id v156 = v391;
LABEL_439:

                                                    goto LABEL_440;
                                                  }
                                                  if (v505)
                                                  {
                                                    id v393 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    id v487 = v5;
                                                    uint64_t v245 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v557 = *MEMORY[0x1E4F28568];
                                                    id v42 = v409;
                                                    id v384 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"];
                                                    id v558 = v384;
                                                    uint64_t v246 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v558 forKeys:&v557 count:1];
                                                    uint64_t v247 = v245;
                                                    id v5 = v487;
                                                    v386 = (void *)v246;
                                                    double v8 = 0;
                                                    id v387 = 0;
                                                    id *v505 = (id)objc_msgSend(v393, "initWithDomain:code:userInfo:", v247, 2);
                                                    double v59 = v502;
                                                    id v200 = v406;
                                                    goto LABEL_439;
                                                  }
                                                  id v387 = 0;
                                                  double v8 = 0;
                                                  double v59 = v502;
                                                  id v200 = v406;
                                                  id v42 = v409;
LABEL_440:

                                                  goto LABEL_441;
                                                }
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  id v164 = v163;
                                                  goto LABEL_173;
                                                }
                                                if (v505)
                                                {
                                                  id v403 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  id v485 = v5;
                                                  uint64_t v211 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v561 = *MEMORY[0x1E4F28568];
                                                  id v156 = v158;
                                                  v157 = v407;
                                                  id v42 = v409;
                                                  id v388 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clickCountGivenLocationInLastWeekNormalizedAcrossItems"];
                                                  id v562 = v388;
                                                  uint64_t v212 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v562 forKeys:&v561 count:1];
                                                  uint64_t v213 = v211;
                                                  id v5 = v485;
                                                  v389 = (void *)v212;
                                                  id v214 = (id)objc_msgSend(v403, "initWithDomain:code:userInfo:", v213, 2);
                                                  double v8 = 0;
                                                  v402 = 0;
                                                  id *v505 = v214;
                                                  double v59 = v502;
                                                  id v200 = v406;
LABEL_442:

                                                  goto LABEL_443;
                                                }
                                                v402 = 0;
                                                double v8 = 0;
                                                double v59 = v502;
                                                id v200 = v406;
                                                id v156 = v158;
                                                id v42 = v409;
                                                v157 = v407;
LABEL_443:

                                                goto LABEL_444;
                                              }
                                              if (v505)
                                              {
                                                id v411 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                uint64_t v405 = *MEMORY[0x1E4F502C8];
                                                uint64_t v563 = *MEMORY[0x1E4F28568];
                                                id v156 = v158;
                                                v157 = v407;
                                                v402 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"];
                                                v564 = v402;
                                                uint64_t v204 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v564 forKeys:&v563 count:1];
                                                uint64_t v205 = v405;
                                                v404 = (void *)v204;
                                                id v206 = (id)objc_msgSend(v411, "initWithDomain:code:userInfo:", v205, 2);
                                                double v8 = 0;
                                                v410 = 0;
                                                id *v505 = v206;
                                                double v59 = v502;
                                                id v200 = v406;
                                                goto LABEL_443;
                                              }
                                              v410 = 0;
                                              double v8 = 0;
                                              double v59 = v502;
                                              id v200 = v406;
                                              id v156 = v158;
                                              v157 = v407;
LABEL_444:

                                              goto LABEL_445;
                                            }
                                            if (v505)
                                            {
                                              id v414 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v408 = *MEMORY[0x1E4F502C8];
                                              uint64_t v565 = *MEMORY[0x1E4F28568];
                                              v410 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"];
                                              v566 = v410;
                                              uint64_t v202 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v566 forKeys:&v565 count:1];
                                              id v203 = v414;
                                              v412 = (void *)v202;
                                              double v8 = 0;
                                              id v200 = 0;
                                              id *v505 = (id)objc_msgSend(v203, "initWithDomain:code:userInfo:", v408, 2);
                                              double v59 = v502;
                                              goto LABEL_444;
                                            }
                                            id v200 = 0;
                                            double v8 = 0;
LABEL_307:
                                            double v59 = v502;
LABEL_445:

                                            goto LABEL_446;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            v415 = v35;
                                            id v417 = v54;
                                            goto LABEL_161;
                                          }
                                          if (v505)
                                          {
                                            id v418 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            v468 = v10;
                                            uint64_t v193 = *MEMORY[0x1E4F502C8];
                                            uint64_t v569 = *MEMORY[0x1E4F28568];
                                            id v194 = [NSString alloc];
                                            uint64_t v339 = objc_opt_class();
                                            v195 = v194;
                                            v178 = v420;
                                            id v42 = v48;
                                            double v43 = v430;
                                            id v156 = (id)[v195 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v339, @"shareCountInLastWeekNormalizedAcrossItems"];
                                            id v570 = v156;
                                            uint64_t v196 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v570 forKeys:&v569 count:1];
                                            uint64_t v197 = v193;
                                            id v10 = v468;
                                            v416 = (void *)v196;
                                            id v198 = (id)objc_msgSend(v418, "initWithDomain:code:userInfo:", v197, 2);
                                            double v8 = 0;
                                            id v417 = 0;
                                            id *v505 = v198;
                                            double v59 = v502;
LABEL_447:

                                            double v47 = v425;
                                            goto LABEL_448;
                                          }
                                          id v417 = 0;
                                          double v8 = 0;
                                          double v59 = v502;
                                          id v42 = v48;
                                          double v47 = v425;
                                          v178 = v420;
                                          double v43 = v430;
LABEL_448:

                                          goto LABEL_449;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v421 = v52;
                                          goto LABEL_73;
                                        }
                                        if (v505)
                                        {
                                          id v422 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          v467 = v10;
                                          uint64_t v187 = *MEMORY[0x1E4F502C8];
                                          uint64_t v571 = *MEMORY[0x1E4F28568];
                                          id v188 = [NSString alloc];
                                          uint64_t v338 = objc_opt_class();
                                          v189 = v188;
                                          v178 = v420;
                                          id v42 = v48;
                                          double v43 = v430;
                                          double v47 = v425;
                                          id v417 = (id)[v189 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v338, @"clickCountInLastMonthNormalizedAcrossItems"];
                                          id v572 = v417;
                                          uint64_t v190 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v572 forKeys:&v571 count:1];
                                          uint64_t v191 = v187;
                                          id v10 = v467;
                                          v419 = (void *)v190;
                                          id v192 = (id)objc_msgSend(v422, "initWithDomain:code:userInfo:", v191, 2);
                                          double v8 = 0;
                                          id v421 = 0;
                                          id *v505 = v192;
                                          double v59 = v502;
                                          goto LABEL_448;
                                        }
                                        id v421 = 0;
                                        double v8 = 0;
                                        double v59 = v502;
                                        id v42 = v48;
                                        double v47 = v425;
                                        v178 = v420;
                                        double v43 = v430;
LABEL_449:

                                        goto LABEL_450;
                                      }
                                      if (v505)
                                      {
                                        id v424 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        v466 = v10;
                                        uint64_t v183 = *MEMORY[0x1E4F502C8];
                                        uint64_t v573 = *MEMORY[0x1E4F28568];
                                        id v42 = v48;
                                        double v43 = v430;
                                        double v47 = v425;
                                        id v421 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clickCountInLastWeekNormalizedAcrossItems"];
                                        id v574 = v421;
                                        uint64_t v184 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v574 forKeys:&v573 count:1];
                                        v185 = v424;
                                        uint64_t v186 = v183;
                                        id v10 = v466;
                                        v423 = (void *)v184;
                                        double v8 = 0;
                                        v178 = 0;
                                        id *v505 = (id)objc_msgSend(v185, "initWithDomain:code:userInfo:", v186, 2);
                                        double v59 = v502;
                                        goto LABEL_449;
                                      }
                                      v178 = 0;
                                      double v8 = 0;
                                      double v59 = v502;
                                      id v42 = v48;
                                      double v47 = v425;
                                      double v43 = v430;
LABEL_450:

                                      id v40 = v474;
                                      goto LABEL_451;
                                    }
                                    if (v505)
                                    {
                                      id v429 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v427 = *MEMORY[0x1E4F502C8];
                                      uint64_t v575 = *MEMORY[0x1E4F28568];
                                      double v43 = v430;
                                      v178 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"hasEverShareInLastMonth"];
                                      v576 = v178;
                                      uint64_t v179 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v576 forKeys:&v575 count:1];
                                      uint64_t v180 = v427;
                                      v426 = (void *)v179;
                                      id v181 = (id)objc_msgSend(v429, "initWithDomain:code:userInfo:", v180, 2);
                                      double v8 = 0;
                                      id v428 = 0;
                                      id *v505 = v181;
                                      double v59 = v502;
                                      goto LABEL_450;
                                    }
                                    id v40 = v44;
                                    id v428 = 0;
                                    double v8 = 0;
                                    double v59 = v502;
                                    double v43 = v430;
LABEL_451:

                                    goto LABEL_452;
                                  }
                                  if (v505)
                                  {
                                    id v432 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    v465 = v10;
                                    uint64_t v173 = *MEMORY[0x1E4F502C8];
                                    uint64_t v577 = *MEMORY[0x1E4F28568];
                                    id v174 = [NSString alloc];
                                    uint64_t v337 = objc_opt_class();
                                    v175 = v174;
                                    id v40 = v44;
                                    double v43 = v430;
                                    id v428 = (id)[v175 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v337, @"hasEverShareInLastWeek"];
                                    id v578 = v428;
                                    double v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v578 forKeys:&v577 count:1];
                                    uint64_t v176 = v173;
                                    id v10 = v465;
                                    id v177 = (id)[v432 initWithDomain:v176 code:2 userInfo:v47];
                                    double v8 = 0;
                                    id v431 = 0;
                                    id *v505 = v177;
                                    double v59 = v502;
                                    goto LABEL_451;
                                  }
                                  id v431 = 0;
                                  double v8 = 0;
                                  double v59 = v502;
                                  id v40 = v44;
                                  double v43 = v430;
LABEL_452:

                                  goto LABEL_453;
                                }
                                if (v505)
                                {
                                  id v436 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  v464 = v10;
                                  uint64_t v148 = *MEMORY[0x1E4F502C8];
                                  uint64_t v579 = *MEMORY[0x1E4F28568];
                                  id v149 = [NSString alloc];
                                  uint64_t v336 = objc_opt_class();
                                  v150 = v149;
                                  id v40 = v473;
                                  id v431 = (id)[v150 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v336, @"hasEverClickInLastMonth"];
                                  id v580 = v431;
                                  uint64_t v151 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v580 forKeys:&v579 count:1];
                                  uint64_t v152 = v148;
                                  id v10 = v464;
                                  v433 = (void *)v151;
                                  id v153 = (id)objc_msgSend(v436, "initWithDomain:code:userInfo:", v152, 2);
                                  double v8 = 0;
                                  id v435 = 0;
                                  id *v505 = v153;
                                  double v59 = v502;
                                  goto LABEL_452;
                                }
                                id v435 = 0;
                                double v8 = 0;
                                double v59 = v502;
LABEL_453:

                                goto LABEL_454;
                              }
                              if (v505)
                              {
                                id v434 = objc_alloc(MEMORY[0x1E4F28C58]);
                                id v484 = v5;
                                uint64_t v144 = *MEMORY[0x1E4F502C8];
                                uint64_t v581 = *MEMORY[0x1E4F28568];
                                id v145 = [NSString alloc];
                                uint64_t v335 = objc_opt_class();
                                double v146 = v145;
                                id v40 = v473;
                                id v435 = (id)[v146 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v335, @"hasEverClickInLastWeek"];
                                id v582 = v435;
                                double v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v582 forKeys:&v581 count:1];
                                uint64_t v147 = v144;
                                id v5 = v484;
                                double v8 = 0;
                                id v42 = 0;
                                id *v505 = (id)[v434 initWithDomain:v147 code:2 userInfo:v43];
                                double v59 = v502;
                                goto LABEL_453;
                              }
                              id v42 = 0;
                              double v8 = 0;
LABEL_203:
                              double v59 = v502;
LABEL_454:

                              double v28 = v441;
                              goto LABEL_455;
                            }
                            if (v505)
                            {
                              id v439 = objc_alloc(MEMORY[0x1E4F28C58]);
                              id v483 = v5;
                              uint64_t v138 = *MEMORY[0x1E4F502C8];
                              uint64_t v583 = *MEMORY[0x1E4F28568];
                              id v139 = [NSString alloc];
                              uint64_t v334 = objc_opt_class();
                              uint64_t v140 = v139;
                              id v40 = v473;
                              id v42 = (id)[v140 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v334, @"curationScore"];
                              id v584 = v42;
                              uint64_t v141 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v584 forKeys:&v583 count:1];
                              uint64_t v142 = v138;
                              id v5 = v483;
                              v437 = (void *)v141;
                              id v143 = (id)objc_msgSend(v439, "initWithDomain:code:userInfo:", v142, 2);
                              double v8 = 0;
                              id v438 = 0;
                              id *v505 = v143;
                              goto LABEL_203;
                            }
                            id v438 = 0;
                            double v8 = 0;
                            double v59 = v502;
                            id v40 = v473;
LABEL_455:

                            goto LABEL_456;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v33 = v32;
                            goto LABEL_49;
                          }
                          if (v505)
                          {
                            id v124 = objc_alloc(MEMORY[0x1E4F28C58]);
                            id v481 = v5;
                            uint64_t v125 = *MEMORY[0x1E4F502C8];
                            uint64_t v587 = *MEMORY[0x1E4F28568];
                            id v126 = [NSString alloc];
                            uint64_t v332 = objc_opt_class();
                            uint64_t v127 = v126;
                            uint64_t v101 = v450;
                            id v40 = v473;
                            id v442 = (id)[v127 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v332, @"favorited"];
                            id v588 = v442;
                            uint64_t v128 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v588 forKeys:&v587 count:1];
                            uint64_t v129 = v124;
                            uint64_t v130 = v125;
                            id v5 = v481;
                            unsigned int v35 = (void *)v128;
                            double v8 = 0;
                            v446 = 0;
                            id *v505 = (id)objc_msgSend(v129, "initWithDomain:code:userInfo:", v130, 2);
                            double v59 = v502;
LABEL_457:

                            id v15 = v444;
                            id v30 = v445;
                            goto LABEL_458;
                          }
                          v446 = 0;
                          double v8 = 0;
                          double v59 = v502;
                          id v40 = v473;
                          uint64_t v101 = v450;
LABEL_458:

                          goto LABEL_459;
                        }
                        id v30 = v505;
                        if (v505)
                        {
                          id v448 = objc_alloc(MEMORY[0x1E4F28C58]);
                          id v480 = v5;
                          uint64_t v117 = *MEMORY[0x1E4F502C8];
                          uint64_t v589 = *MEMORY[0x1E4F28568];
                          id v390 = v11;
                          id v118 = [NSString alloc];
                          uint64_t v331 = objc_opt_class();
                          uint64_t v119 = v118;
                          uint64_t v101 = v450;
                          id v40 = v473;
                          double v29 = v390;
                          v446 = (void *)[v119 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v331, @"freshness"];
                          v590 = v446;
                          uint64_t v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v590 forKeys:&v589 count:1];
                          uint64_t v121 = v448;
                          uint64_t v122 = v117;
                          id v5 = v480;
                          v447 = (void *)v120;
                          double v8 = 0;
                          id *v505 = (id)objc_msgSend(v121, "initWithDomain:code:userInfo:", v122, 2);
                          id v30 = 0;
                          double v59 = v502;
                          goto LABEL_458;
                        }
                        double v8 = 0;
                        double v59 = v502;
                        id v40 = v473;
                        uint64_t v101 = v450;
LABEL_459:

                        double v23 = v449;
                        goto LABEL_460;
                      }
                      if (v505)
                      {
                        id v452 = objc_alloc(MEMORY[0x1E4F28C58]);
                        id v479 = v5;
                        uint64_t v111 = *MEMORY[0x1E4F502C8];
                        uint64_t v591 = *MEMORY[0x1E4F28568];
                        id v112 = [NSString alloc];
                        uint64_t v330 = objc_opt_class();
                        uint64_t v113 = v112;
                        id v40 = v473;
                        double v29 = v11;
                        uint64_t v101 = v450;
                        uint64_t v114 = [v113 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v330, @"L1Score"];
                        uint64_t v592 = v114;
                        double v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v592 forKeys:&v591 count:1];
                        uint64_t v115 = v111;
                        id v5 = v479;
                        id v116 = (id)[v452 initWithDomain:v115 code:2 userInfo:v28];
                        double v8 = 0;
                        id v451 = 0;
                        id *v505 = v116;
                        id v30 = (id)v114;
                        double v59 = v502;
                        goto LABEL_459;
                      }
                      id v451 = 0;
                      double v8 = 0;
                      double v59 = v502;
                      double v29 = v11;
                      id v40 = v473;
                      uint64_t v101 = v450;
LABEL_460:

                      id v20 = v453;
                      goto LABEL_461;
                    }
                    if (v505)
                    {
                      id v455 = objc_alloc(MEMORY[0x1E4F28C58]);
                      id v478 = v5;
                      uint64_t v105 = *MEMORY[0x1E4F502C8];
                      uint64_t v593 = *MEMORY[0x1E4F28568];
                      id v106 = [NSString alloc];
                      uint64_t v329 = objc_opt_class();
                      uint64_t v107 = v106;
                      id v40 = v473;
                      id v451 = (id)[v107 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v329, @"matchedFieldsCount"];
                      id v594 = v451;
                      uint64_t v108 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v594 forKeys:&v593 count:1];
                      uint64_t v109 = v455;
                      uint64_t v110 = v105;
                      id v5 = v478;
                      v454 = (void *)v108;
                      double v8 = 0;
                      id *v505 = (id)objc_msgSend(v109, "initWithDomain:code:userInfo:", v110, 2);
                      double v29 = v11;
                      uint64_t v101 = 0;
                      double v59 = v502;
                      goto LABEL_460;
                    }
                    double v8 = 0;
                    double v59 = v502;
                    double v29 = v11;
                    uint64_t v101 = 0;
                    id v40 = v473;
LABEL_461:

                    double v78 = v40;
                    double v62 = v503;
                    goto LABEL_462;
                  }
                  double v23 = v505;
                  if (v505)
                  {
                    id v457 = objc_alloc(MEMORY[0x1E4F28C58]);
                    v463 = v10;
                    uint64_t v98 = *MEMORY[0x1E4F502C8];
                    uint64_t v595 = *MEMORY[0x1E4F28568];
                    id v99 = [NSString alloc];
                    uint64_t v328 = objc_opt_class();
                    uint64_t v100 = v99;
                    id v40 = v473;
                    double v29 = v11;
                    uint64_t v101 = (void *)[v100 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v328, @"matchedOCRImportance"];
                    v596 = v101;
                    uint64_t v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v596 forKeys:&v595 count:1];
                    uint64_t v103 = v457;
                    uint64_t v104 = v98;
                    id v10 = v463;
                    v456 = (void *)v102;
                    double v8 = 0;
                    id *v505 = (id)objc_msgSend(v103, "initWithDomain:code:userInfo:", v104, 2);
                    double v23 = 0;
                    double v59 = v502;
                    goto LABEL_461;
                  }
                  double v8 = 0;
                  double v59 = v502;
                  double v29 = v11;
                  double v62 = v503;
                  double v78 = v473;
LABEL_462:

                  goto LABEL_463;
                }
                id v20 = v505;
                if (v505)
                {
                  id v92 = objc_alloc(MEMORY[0x1E4F28C58]);
                  v462 = v10;
                  uint64_t v93 = *MEMORY[0x1E4F502C8];
                  uint64_t v597 = *MEMORY[0x1E4F28568];
                  id v94 = [NSString alloc];
                  uint64_t v327 = objc_opt_class();
                  double v95 = v94;
                  double v62 = v503;
                  double v29 = v11;
                  double v78 = v473;
                  double v23 = (id *)[v95 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v327, @"matchedOCRCharacterRatio"];
                  v598 = v23;
                  uint64_t v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v598 forKeys:&v597 count:1];
                  uint64_t v97 = v93;
                  id v10 = v462;
                  v458 = (void *)v96;
                  double v8 = 0;
                  id *v505 = (id)objc_msgSend(v92, "initWithDomain:code:userInfo:", v97, 2);
                  id v20 = 0;
                  double v59 = v502;
                  goto LABEL_462;
                }
                double v8 = 0;
                double v59 = v502;
                double v29 = v11;
                double v62 = v503;
                double v78 = v473;
LABEL_463:

                goto LABEL_464;
              }
              if (v505)
              {
                id v85 = objc_alloc(MEMORY[0x1E4F28C58]);
                v461 = v10;
                uint64_t v86 = *MEMORY[0x1E4F502C8];
                uint64_t v599 = *MEMORY[0x1E4F28568];
                id v87 = [NSString alloc];
                uint64_t v326 = objc_opt_class();
                double v88 = v87;
                double v62 = v503;
                double v29 = v11;
                uint64_t v89 = [v88 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v326, @"matchedSceneBoundingBox"];
                uint64_t v600 = v89;
                uint64_t v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v600 forKeys:&v599 count:1];
                uint64_t v91 = v86;
                id v10 = v461;
                v475 = (void *)v90;
                double v8 = 0;
                id *v505 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v91, 2);
                id v20 = (id)v89;
                double v78 = 0;
                double v59 = v502;
                goto LABEL_463;
              }
              double v8 = 0;
              double v59 = v502;
              double v29 = v11;
              double v78 = 0;
              double v62 = v503;
LABEL_464:

              goto LABEL_465;
            }
            if (v505)
            {
              id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
              v460 = v10;
              uint64_t v75 = *MEMORY[0x1E4F502C8];
              uint64_t v601 = *MEMORY[0x1E4F28568];
              id v76 = [NSString alloc];
              uint64_t v325 = objc_opt_class();
              double v77 = v76;
              double v62 = v503;
              double v29 = v11;
              double v78 = (void *)[v77 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v325, @"matchedSceneConfidence"];
              v602 = v78;
              uint64_t v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v602 forKeys:&v601 count:1];
              uint64_t v80 = v75;
              id v10 = v460;
              v476 = (void *)v79;
              double v8 = 0;
              id v15 = 0;
              id *v505 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v80, 2);
              double v59 = v502;
              goto LABEL_464;
            }
            id v15 = 0;
            double v8 = 0;
            double v59 = v502;
            double v29 = v11;
            double v62 = v503;
LABEL_465:

            goto LABEL_466;
          }
          double v29 = v11;
          if (v505)
          {
            id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
            v459 = v10;
            uint64_t v69 = *MEMORY[0x1E4F502C8];
            uint64_t v603 = *MEMORY[0x1E4F28568];
            id v70 = [NSString alloc];
            uint64_t v324 = objc_opt_class();
            double v71 = v70;
            double v62 = v503;
            id v15 = (id)[v71 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v324, @"matchedSceneRatio"];
            id v604 = v15;
            uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v604 forKeys:&v603 count:1];
            uint64_t v73 = v69;
            id v10 = v459;
            v501 = (void *)v72;
            double v8 = 0;
            id v504 = 0;
            id *v505 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v73, 2);
            double v59 = v502;
            goto LABEL_465;
          }
          id v504 = 0;
          double v8 = 0;
          double v59 = v502;
          double v62 = v503;
LABEL_466:

          goto LABEL_467;
        }
        double v59 = v12;
        if (v505)
        {
          id v477 = v5;
          double v63 = v10;
          id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v65 = *MEMORY[0x1E4F502C8];
          uint64_t v605 = *MEMORY[0x1E4F28568];
          double v29 = v11;
          id v504 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"matchedLocationRatio"];
          id v606 = v504;
          uint64_t v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v606 forKeys:&v605 count:1];
          double v67 = v64;
          id v10 = v63;
          id v5 = v477;
          v508 = (void *)v66;
          double v8 = 0;
          double v62 = 0;
          id *v505 = (id)[v67 initWithDomain:v65 code:2 userInfo:v66];
          goto LABEL_466;
        }
        double v62 = 0;
        double v8 = 0;
        double v29 = v11;
LABEL_467:

        goto LABEL_468;
      }
      if (a4)
      {
        double v55 = v10;
        id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v57 = *MEMORY[0x1E4F502C8];
        uint64_t v607 = *MEMORY[0x1E4F28568];
        uint64_t v58 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"matchedPeopleRatio"];
        uint64_t v608 = v58;
        double v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v608 forKeys:&v607 count:1];
        double v60 = v56;
        id v10 = v55;
        uint64_t v61 = v57;
        double v62 = (void *)v58;
        double v8 = 0;
        double v29 = 0;
        *a4 = (id)[v60 initWithDomain:v61 code:2 userInfo:v59];
        goto LABEL_467;
      }
      double v29 = 0;
      double v8 = 0;
LABEL_468:

      goto LABEL_469;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v512;
      id v507 = [NSNumber numberWithInt:BMAeroMLPhotosSearchDataCorrelationsUISurfaceTypeFromString(v9)];

      goto LABEL_15;
    }
    if (a4)
    {
      id v81 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v82 = *MEMORY[0x1E4F502C8];
      uint64_t v609 = *MEMORY[0x1E4F28568];
      double v29 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"uiSurface"];
      v610 = v29;
      uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v610 forKeys:&v609 count:1];
      uint64_t v84 = v82;
      id v10 = (void *)v83;
      id v507 = 0;
      double v8 = 0;
      *a4 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v84, 2);
      goto LABEL_468;
    }
    id v507 = 0;
    double v8 = 0;
LABEL_469:

    goto LABEL_470;
  }
  if (a4)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v7 = *MEMORY[0x1E4F502C8];
    uint64_t v611 = *MEMORY[0x1E4F28568];
    id v507 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"searchSessionUUID"];
    v612[0] = v507;
    v512 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v612 forKeys:&v611 count:1];
    id v509 = 0;
    double v8 = 0;
    *a4 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, 2);
    goto LABEL_469;
  }
  id v509 = 0;
  double v8 = 0;
LABEL_470:

  return v8;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMAeroMLPhotosSearchDataCorrelations *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_searchSessionUUID) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasMatchedPeopleRatio) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasMatchedLocationRatio) {
    PBDataWriterWriteDoubleField();
  }
  uint64_t v4 = v5;
  if (self->_hasMatchedSceneRatio)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasMatchedSceneConfidence)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasMatchedSceneBoundingBox)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasMatchedOCRCharacterRatio)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasMatchedOCRImportance)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasMatchedFieldsCount)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v4 = v5;
  }
  if (self->_hasL1Score)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasFreshness)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasFavorited)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v4 = v5;
  }
  if (self->_hasAestheticScore)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasCurationScore)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasHasEverClickInLastWeek)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasHasEverClickInLastMonth)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasHasEverShareInLastWeek)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasHasEverShareInLastMonth)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasClickCountInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasClickCountInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasShareCountInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasShareCountInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasClipScore)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasCorrelationMetricVersion)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v4 = v5;
  }
  if (self->_hasCorrelationMetricWindowInDays)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  uint64_t v4 = a3;
  v148.receiver = self;
  v148.super_class = (Class)BMAeroMLPhotosSearchDataCorrelations;
  id v5 = [(BMEventBase *)&v148 init];
  if (!v5) {
    goto LABEL_305;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  double v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v20 = PBReaderReadString();
          searchSessionUUID = v5->_searchSessionUUID;
          v5->_searchSessionUUID = (NSString *)v20;

          continue;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          while (2)
          {
            uint64_t v25 = *v6;
            uint64_t v26 = *(void *)&v4[v25];
            unint64_t v27 = v26 + 1;
            if (v26 == -1 || v27 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
              *(void *)&v4[v25] = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                BOOL v17 = v23++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_193;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_193:
          if (v24 >= 4) {
            LODWORD(v24) = 0;
          }
          v5->_uiSurface = v24;
          continue;
        case 3u:
          v5->_hasMatchedPeopleRatio = 1;
          uint64_t v29 = *v6;
          unint64_t v30 = *(void *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v30);
            *(void *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 96;
          goto LABEL_301;
        case 4u:
          v5->_hasMatchedLocationRatio = 1;
          uint64_t v32 = *v6;
          unint64_t v33 = *(void *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v33);
            *(void *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 104;
          goto LABEL_301;
        case 5u:
          v5->_hasMatchedSceneRatio = 1;
          uint64_t v34 = *v6;
          unint64_t v35 = *(void *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v35);
            *(void *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 112;
          goto LABEL_301;
        case 6u:
          v5->_hasMatchedSceneConfidence = 1;
          uint64_t v36 = *v6;
          unint64_t v37 = *(void *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v37);
            *(void *)&v4[v36] = v37 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 120;
          goto LABEL_301;
        case 7u:
          v5->_hasMatchedSceneBoundingBox = 1;
          uint64_t v38 = *v6;
          unint64_t v39 = *(void *)&v4[v38];
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v39);
            *(void *)&v4[v38] = v39 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 128;
          goto LABEL_301;
        case 8u:
          v5->_hasMatchedOCRCharacterRatio = 1;
          uint64_t v40 = *v6;
          unint64_t v41 = *(void *)&v4[v40];
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v41);
            *(void *)&v4[v40] = v41 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 136;
          goto LABEL_301;
        case 9u:
          v5->_hasMatchedOCRImportance = 1;
          uint64_t v42 = *v6;
          unint64_t v43 = *(void *)&v4[v42];
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v43);
            *(void *)&v4[v42] = v43 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 144;
          goto LABEL_301;
        case 0xAu:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          v5->_hasMatchedFieldsCount = 1;
          while (2)
          {
            uint64_t v47 = *v6;
            uint64_t v48 = *(void *)&v4[v47];
            unint64_t v49 = v48 + 1;
            if (v48 == -1 || v49 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v50 = *(unsigned char *)(*(void *)&v4[*v9] + v48);
              *(void *)&v4[v47] = v49;
              v46 |= (unint64_t)(v50 & 0x7F) << v44;
              if (v50 < 0)
              {
                v44 += 7;
                BOOL v17 = v45++ >= 9;
                if (v17)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_199;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v46) = 0;
          }
LABEL_199:
          uint64_t v144 = 76;
          goto LABEL_212;
        case 0xBu:
          v5->_hasL1Score = 1;
          uint64_t v51 = *v6;
          unint64_t v52 = *(void *)&v4[v51];
          if (v52 <= 0xFFFFFFFFFFFFFFF7 && v52 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v52);
            *(void *)&v4[v51] = v52 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 152;
          goto LABEL_301;
        case 0xCu:
          v5->_hasFreshness = 1;
          uint64_t v53 = *v6;
          unint64_t v54 = *(void *)&v4[v53];
          if (v54 <= 0xFFFFFFFFFFFFFFF7 && v54 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v54);
            *(void *)&v4[v53] = v54 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 160;
          goto LABEL_301;
        case 0xDu:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v57 = 0;
          v5->_hasFavorited = 1;
          while (2)
          {
            uint64_t v58 = *v6;
            uint64_t v59 = *(void *)&v4[v58];
            unint64_t v60 = v59 + 1;
            if (v59 == -1 || v60 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v61 = *(unsigned char *)(*(void *)&v4[*v9] + v59);
              *(void *)&v4[v58] = v60;
              v57 |= (unint64_t)(v61 & 0x7F) << v55;
              if (v61 < 0)
              {
                v55 += 7;
                BOOL v17 = v56++ >= 9;
                if (v17)
                {
                  uint64_t v57 = 0;
                  goto LABEL_203;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v57 = 0;
          }
LABEL_203:
          v5->_favorited = v57 != 0;
          continue;
        case 0xEu:
          v5->_hasAestheticScore = 1;
          uint64_t v62 = *v6;
          unint64_t v63 = *(void *)&v4[v62];
          if (v63 <= 0xFFFFFFFFFFFFFFF7 && v63 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v63);
            *(void *)&v4[v62] = v63 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 168;
          goto LABEL_301;
        case 0xFu:
          v5->_hasCurationScore = 1;
          uint64_t v64 = *v6;
          unint64_t v65 = *(void *)&v4[v64];
          if (v65 <= 0xFFFFFFFFFFFFFFF7 && v65 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v65);
            *(void *)&v4[v64] = v65 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 176;
          goto LABEL_301;
        case 0x10u:
          v5->_hasHasEverClickInLastWeek = 1;
          uint64_t v66 = *v6;
          unint64_t v67 = *(void *)&v4[v66];
          if (v67 <= 0xFFFFFFFFFFFFFFF7 && v67 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v67);
            *(void *)&v4[v66] = v67 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 184;
          goto LABEL_301;
        case 0x11u:
          v5->_hasHasEverClickInLastMonth = 1;
          uint64_t v68 = *v6;
          unint64_t v69 = *(void *)&v4[v68];
          if (v69 <= 0xFFFFFFFFFFFFFFF7 && v69 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v69);
            *(void *)&v4[v68] = v69 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 192;
          goto LABEL_301;
        case 0x12u:
          v5->_hasHasEverShareInLastWeek = 1;
          uint64_t v70 = *v6;
          unint64_t v71 = *(void *)&v4[v70];
          if (v71 <= 0xFFFFFFFFFFFFFFF7 && v71 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v71);
            *(void *)&v4[v70] = v71 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 200;
          goto LABEL_301;
        case 0x13u:
          v5->_hasHasEverShareInLastMonth = 1;
          uint64_t v72 = *v6;
          unint64_t v73 = *(void *)&v4[v72];
          if (v73 <= 0xFFFFFFFFFFFFFFF7 && v73 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v73);
            *(void *)&v4[v72] = v73 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 208;
          goto LABEL_301;
        case 0x14u:
          v5->_hasClickCountInLastWeekNormalizedAcrossItems = 1;
          uint64_t v74 = *v6;
          unint64_t v75 = *(void *)&v4[v74];
          if (v75 <= 0xFFFFFFFFFFFFFFF7 && v75 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v75);
            *(void *)&v4[v74] = v75 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 216;
          goto LABEL_301;
        case 0x15u:
          v5->_hasClickCountInLastMonthNormalizedAcrossItems = 1;
          uint64_t v76 = *v6;
          unint64_t v77 = *(void *)&v4[v76];
          if (v77 <= 0xFFFFFFFFFFFFFFF7 && v77 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v77);
            *(void *)&v4[v76] = v77 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 224;
          goto LABEL_301;
        case 0x16u:
          v5->_hasShareCountInLastWeekNormalizedAcrossItems = 1;
          uint64_t v78 = *v6;
          unint64_t v79 = *(void *)&v4[v78];
          if (v79 <= 0xFFFFFFFFFFFFFFF7 && v79 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v79);
            *(void *)&v4[v78] = v79 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 232;
          goto LABEL_301;
        case 0x17u:
          v5->_hasShareCountInLastMonthNormalizedAcrossItems = 1;
          uint64_t v80 = *v6;
          unint64_t v81 = *(void *)&v4[v80];
          if (v81 <= 0xFFFFFFFFFFFFFFF7 && v81 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v81);
            *(void *)&v4[v80] = v81 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 240;
          goto LABEL_301;
        case 0x18u:
          v5->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 1;
          uint64_t v82 = *v6;
          unint64_t v83 = *(void *)&v4[v82];
          if (v83 <= 0xFFFFFFFFFFFFFFF7 && v83 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v83);
            *(void *)&v4[v82] = v83 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 248;
          goto LABEL_301;
        case 0x19u:
          v5->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 1;
          uint64_t v84 = *v6;
          unint64_t v85 = *(void *)&v4[v84];
          if (v85 <= 0xFFFFFFFFFFFFFFF7 && v85 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v85);
            *(void *)&v4[v84] = v85 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 256;
          goto LABEL_301;
        case 0x1Au:
          v5->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems = 1;
          uint64_t v86 = *v6;
          unint64_t v87 = *(void *)&v4[v86];
          if (v87 <= 0xFFFFFFFFFFFFFFF7 && v87 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v87);
            *(void *)&v4[v86] = v87 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 264;
          goto LABEL_301;
        case 0x1Bu:
          v5->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems = 1;
          uint64_t v88 = *v6;
          unint64_t v89 = *(void *)&v4[v88];
          if (v89 <= 0xFFFFFFFFFFFFFFF7 && v89 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v89);
            *(void *)&v4[v88] = v89 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 272;
          goto LABEL_301;
        case 0x1Cu:
          v5->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 1;
          uint64_t v90 = *v6;
          unint64_t v91 = *(void *)&v4[v90];
          if (v91 <= 0xFFFFFFFFFFFFFFF7 && v91 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v91);
            *(void *)&v4[v90] = v91 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 280;
          goto LABEL_301;
        case 0x1Du:
          v5->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 1;
          uint64_t v92 = *v6;
          unint64_t v93 = *(void *)&v4[v92];
          if (v93 <= 0xFFFFFFFFFFFFFFF7 && v93 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v93);
            *(void *)&v4[v92] = v93 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 288;
          goto LABEL_301;
        case 0x1Eu:
          v5->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 1;
          uint64_t v94 = *v6;
          unint64_t v95 = *(void *)&v4[v94];
          if (v95 <= 0xFFFFFFFFFFFFFFF7 && v95 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v95);
            *(void *)&v4[v94] = v95 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 296;
          goto LABEL_301;
        case 0x1Fu:
          v5->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 1;
          uint64_t v96 = *v6;
          unint64_t v97 = *(void *)&v4[v96];
          if (v97 <= 0xFFFFFFFFFFFFFFF7 && v97 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v97);
            *(void *)&v4[v96] = v97 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 304;
          goto LABEL_301;
        case 0x20u:
          v5->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 1;
          uint64_t v98 = *v6;
          unint64_t v99 = *(void *)&v4[v98];
          if (v99 <= 0xFFFFFFFFFFFFFFF7 && v99 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v99);
            *(void *)&v4[v98] = v99 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 312;
          goto LABEL_301;
        case 0x21u:
          v5->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 1;
          uint64_t v100 = *v6;
          unint64_t v101 = *(void *)&v4[v100];
          if (v101 <= 0xFFFFFFFFFFFFFFF7 && v101 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v101);
            *(void *)&v4[v100] = v101 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 320;
          goto LABEL_301;
        case 0x22u:
          v5->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 1;
          uint64_t v102 = *v6;
          unint64_t v103 = *(void *)&v4[v102];
          if (v103 <= 0xFFFFFFFFFFFFFFF7 && v103 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v103);
            *(void *)&v4[v102] = v103 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 328;
          goto LABEL_301;
        case 0x23u:
          v5->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 1;
          uint64_t v104 = *v6;
          unint64_t v105 = *(void *)&v4[v104];
          if (v105 <= 0xFFFFFFFFFFFFFFF7 && v105 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v105);
            *(void *)&v4[v104] = v105 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 336;
          goto LABEL_301;
        case 0x24u:
          v5->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 1;
          uint64_t v106 = *v6;
          unint64_t v107 = *(void *)&v4[v106];
          if (v107 <= 0xFFFFFFFFFFFFFFF7 && v107 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v107);
            *(void *)&v4[v106] = v107 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 344;
          goto LABEL_301;
        case 0x25u:
          v5->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 1;
          uint64_t v108 = *v6;
          unint64_t v109 = *(void *)&v4[v108];
          if (v109 <= 0xFFFFFFFFFFFFFFF7 && v109 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v109);
            *(void *)&v4[v108] = v109 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 352;
          goto LABEL_301;
        case 0x26u:
          v5->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems = 1;
          uint64_t v110 = *v6;
          unint64_t v111 = *(void *)&v4[v110];
          if (v111 <= 0xFFFFFFFFFFFFFFF7 && v111 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v111);
            *(void *)&v4[v110] = v111 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 360;
          goto LABEL_301;
        case 0x27u:
          v5->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems = 1;
          uint64_t v112 = *v6;
          unint64_t v113 = *(void *)&v4[v112];
          if (v113 <= 0xFFFFFFFFFFFFFFF7 && v113 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v113);
            *(void *)&v4[v112] = v113 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 368;
          goto LABEL_301;
        case 0x28u:
          v5->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 1;
          uint64_t v114 = *v6;
          unint64_t v115 = *(void *)&v4[v114];
          if (v115 <= 0xFFFFFFFFFFFFFFF7 && v115 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v115);
            *(void *)&v4[v114] = v115 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 376;
          goto LABEL_301;
        case 0x29u:
          v5->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 1;
          uint64_t v116 = *v6;
          unint64_t v117 = *(void *)&v4[v116];
          if (v117 <= 0xFFFFFFFFFFFFFFF7 && v117 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v117);
            *(void *)&v4[v116] = v117 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 384;
          goto LABEL_301;
        case 0x2Au:
          v5->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 1;
          uint64_t v118 = *v6;
          unint64_t v119 = *(void *)&v4[v118];
          if (v119 <= 0xFFFFFFFFFFFFFFF7 && v119 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v119);
            *(void *)&v4[v118] = v119 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 392;
          goto LABEL_301;
        case 0x2Bu:
          v5->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 1;
          uint64_t v120 = *v6;
          unint64_t v121 = *(void *)&v4[v120];
          if (v121 <= 0xFFFFFFFFFFFFFFF7 && v121 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v121);
            *(void *)&v4[v120] = v121 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 400;
          goto LABEL_301;
        case 0x2Cu:
          v5->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 1;
          uint64_t v122 = *v6;
          unint64_t v123 = *(void *)&v4[v122];
          if (v123 <= 0xFFFFFFFFFFFFFFF7 && v123 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v123);
            *(void *)&v4[v122] = v123 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 408;
          goto LABEL_301;
        case 0x2Du:
          v5->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 1;
          uint64_t v124 = *v6;
          unint64_t v125 = *(void *)&v4[v124];
          if (v125 <= 0xFFFFFFFFFFFFFFF7 && v125 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v125);
            *(void *)&v4[v124] = v125 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 416;
          goto LABEL_301;
        case 0x2Eu:
          v5->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 1;
          uint64_t v126 = *v6;
          unint64_t v127 = *(void *)&v4[v126];
          if (v127 <= 0xFFFFFFFFFFFFFFF7 && v127 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v127);
            *(void *)&v4[v126] = v127 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 424;
          goto LABEL_301;
        case 0x2Fu:
          v5->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 1;
          uint64_t v128 = *v6;
          unint64_t v129 = *(void *)&v4[v128];
          if (v129 <= 0xFFFFFFFFFFFFFFF7 && v129 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v129);
            *(void *)&v4[v128] = v129 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 432;
          goto LABEL_301;
        case 0x30u:
          v5->_hasClipScore = 1;
          uint64_t v130 = *v6;
          unint64_t v131 = *(void *)&v4[v130];
          if (v131 <= 0xFFFFFFFFFFFFFFF7 && v131 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v31 = *(objc_class **)(*(void *)&v4[*v9] + v131);
            *(void *)&v4[v130] = v131 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v31 = 0;
          }
          uint64_t v145 = 440;
LABEL_301:
          *(Class *)((char *)&v5->super.super.isa + v145) = v31;
          continue;
        case 0x31u:
          char v132 = 0;
          unsigned int v133 = 0;
          uint64_t v46 = 0;
          v5->_hasCorrelationMetricVersion = 1;
          while (2)
          {
            uint64_t v134 = *v6;
            uint64_t v135 = *(void *)&v4[v134];
            unint64_t v136 = v135 + 1;
            if (v135 == -1 || v136 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v137 = *(unsigned char *)(*(void *)&v4[*v9] + v135);
              *(void *)&v4[v134] = v136;
              v46 |= (unint64_t)(v137 & 0x7F) << v132;
              if (v137 < 0)
              {
                v132 += 7;
                BOOL v17 = v133++ >= 9;
                if (v17)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_207;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v46) = 0;
          }
LABEL_207:
          uint64_t v144 = 80;
          goto LABEL_212;
        case 0x32u:
          char v138 = 0;
          unsigned int v139 = 0;
          uint64_t v46 = 0;
          v5->_hasCorrelationMetricWindowInDays = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_304;
          }
          continue;
      }
      while (1)
      {
        uint64_t v140 = *v6;
        uint64_t v141 = *(void *)&v4[v140];
        unint64_t v142 = v141 + 1;
        if (v141 == -1 || v142 > *(void *)&v4[*v7]) {
          break;
        }
        char v143 = *(unsigned char *)(*(void *)&v4[*v9] + v141);
        *(void *)&v4[v140] = v142;
        v46 |= (unint64_t)(v143 & 0x7F) << v138;
        if ((v143 & 0x80) == 0) {
          goto LABEL_209;
        }
        v138 += 7;
        BOOL v17 = v139++ >= 9;
        if (v17)
        {
          LODWORD(v46) = 0;
          goto LABEL_211;
        }
      }
      v4[*v8] = 1;
LABEL_209:
      if (v4[*v8]) {
        LODWORD(v46) = 0;
      }
LABEL_211:
      uint64_t v144 = 84;
LABEL_212:
      *(_DWORD *)((char *)&v5->super.super.isa + v144) = v46;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_304:
  }
    double v146 = 0;
  else {
LABEL_305:
  }
    double v146 = v5;

  return v146;
}

- (NSString)description
{
  id v62 = [NSString alloc];
  uint64_t v96 = [(BMAeroMLPhotosSearchDataCorrelations *)self searchSessionUUID];
  unint64_t v99 = BMAeroMLPhotosSearchDataCorrelationsUISurfaceTypeAsString([(BMAeroMLPhotosSearchDataCorrelations *)self uiSurface]);
  uint64_t v3 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self matchedPeopleRatio];
  uint64_t v98 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v4 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self matchedLocationRatio];
  unint64_t v97 = objc_msgSend(v4, "numberWithDouble:");
  id v5 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self matchedSceneRatio];
  unint64_t v93 = objc_msgSend(v5, "numberWithDouble:");
  id v6 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self matchedSceneConfidence];
  unint64_t v95 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self matchedSceneBoundingBox];
  uint64_t v94 = objc_msgSend(v7, "numberWithDouble:");
  double v8 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self matchedOCRCharacterRatio];
  uint64_t v92 = objc_msgSend(v8, "numberWithDouble:");
  id v9 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self matchedOCRImportance];
  unint64_t v89 = objc_msgSend(v9, "numberWithDouble:");
  unint64_t v91 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchDataCorrelations matchedFieldsCount](self, "matchedFieldsCount"));
  char v10 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self L1Score];
  uint64_t v88 = objc_msgSend(v10, "numberWithDouble:");
  unsigned int v11 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self freshness];
  uint64_t v90 = objc_msgSend(v11, "numberWithDouble:");
  unint64_t v85 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchDataCorrelations favorited](self, "favorited"));
  unint64_t v12 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self aestheticScore];
  unint64_t v87 = objc_msgSend(v12, "numberWithDouble:");
  uint64_t v13 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self curationScore];
  uint64_t v84 = objc_msgSend(v13, "numberWithDouble:");
  uint64_t v14 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self hasEverClickInLastWeek];
  uint64_t v82 = objc_msgSend(v14, "numberWithDouble:");
  unint64_t v15 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self hasEverClickInLastMonth];
  uint64_t v86 = objc_msgSend(v15, "numberWithDouble:");
  char v16 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self hasEverShareInLastWeek];
  unint64_t v83 = objc_msgSend(v16, "numberWithDouble:");
  BOOL v17 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self hasEverShareInLastMonth];
  unint64_t v79 = objc_msgSend(v17, "numberWithDouble:");
  int v18 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountInLastWeekNormalizedAcrossItems];
  unint64_t v81 = objc_msgSend(v18, "numberWithDouble:");
  id v19 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountInLastMonthNormalizedAcrossItems];
  uint64_t v78 = objc_msgSend(v19, "numberWithDouble:");
  uint64_t v20 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountInLastWeekNormalizedAcrossItems];
  uint64_t v76 = objc_msgSend(v20, "numberWithDouble:");
  uint64_t v21 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountInLastMonthNormalizedAcrossItems];
  uint64_t v80 = objc_msgSend(v21, "numberWithDouble:");
  char v22 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems];
  unint64_t v75 = objc_msgSend(v22, "numberWithDouble:");
  unsigned int v23 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems];
  unint64_t v77 = objc_msgSend(v23, "numberWithDouble:");
  uint64_t v24 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenLocationInLastWeekNormalizedAcrossItems];
  uint64_t v74 = objc_msgSend(v24, "numberWithDouble:");
  uint64_t v25 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenLocationInLastMonthNormalizedAcrossItems];
  unint64_t v73 = objc_msgSend(v25, "numberWithDouble:");
  uint64_t v26 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems];
  uint64_t v72 = objc_msgSend(v26, "numberWithDouble:");
  unint64_t v27 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems];
  uint64_t v70 = objc_msgSend(v27, "numberWithDouble:");
  char v28 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems];
  char v61 = objc_msgSend(v28, "numberWithDouble:");
  uint64_t v29 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems];
  unint64_t v71 = objc_msgSend(v29, "numberWithDouble:");
  unint64_t v30 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems];
  unint64_t v60 = objc_msgSend(v30, "numberWithDouble:");
  uint64_t v31 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems];
  unint64_t v69 = objc_msgSend(v31, "numberWithDouble:");
  uint64_t v32 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems];
  uint64_t v68 = objc_msgSend(v32, "numberWithDouble:");
  unint64_t v33 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems];
  unint64_t v67 = objc_msgSend(v33, "numberWithDouble:");
  uint64_t v34 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems];
  uint64_t v59 = objc_msgSend(v34, "numberWithDouble:");
  unint64_t v35 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems];
  uint64_t v66 = objc_msgSend(v35, "numberWithDouble:");
  uint64_t v36 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenLocationInLastWeekNormalizedAcrossItems];
  uint64_t v58 = objc_msgSend(v36, "numberWithDouble:");
  unint64_t v37 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenLocationInLastMonthNormalizedAcrossItems];
  unint64_t v65 = objc_msgSend(v37, "numberWithDouble:");
  uint64_t v38 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems];
  uint64_t v57 = objc_msgSend(v38, "numberWithDouble:");
  unint64_t v39 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems];
  uint64_t v64 = objc_msgSend(v39, "numberWithDouble:");
  uint64_t v40 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems];
  unsigned int v56 = objc_msgSend(v40, "numberWithDouble:");
  unint64_t v41 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems];
  char v55 = objc_msgSend(v41, "numberWithDouble:");
  uint64_t v42 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems];
  unint64_t v54 = objc_msgSend(v42, "numberWithDouble:");
  unint64_t v43 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems];
  uint64_t v53 = objc_msgSend(v43, "numberWithDouble:");
  char v44 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems];
  unsigned int v45 = objc_msgSend(v44, "numberWithDouble:");
  uint64_t v46 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems];
  uint64_t v47 = objc_msgSend(v46, "numberWithDouble:");
  uint64_t v48 = NSNumber;
  [(BMAeroMLPhotosSearchDataCorrelations *)self clipScore];
  unint64_t v49 = objc_msgSend(v48, "numberWithDouble:");
  char v50 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchDataCorrelations correlationMetricVersion](self, "correlationMetricVersion"));
  uint64_t v51 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchDataCorrelations correlationMetricWindowInDays](self, "correlationMetricWindowInDays"));
  id v63 = (id)objc_msgSend(v62, "initWithFormat:", @"BMAeroMLPhotosSearchDataCorrelations with searchSessionUUID: %@, uiSurface: %@, matchedPeopleRatio: %@, matchedLocationRatio: %@, matchedSceneRatio: %@, matchedSceneConfidence: %@, matchedSceneBoundingBox: %@, matchedOCRCharacterRatio: %@, matchedOCRImportance: %@, matchedFieldsCount: %@, L1Score: %@, freshness: %@, favorited: %@, aestheticScore: %@, curationScore: %@, hasEverClickInLastWeek: %@, hasEverClickInLastMonth: %@, hasEverShareInLastWeek: %@, hasEverShareInLastMonth: %@, clickCountInLastWeekNormalizedAcrossItems: %@, clickCountInLastMonthNormalizedAcrossItems: %@, shareCountInLastWeekNormalizedAcrossItems: %@, shareCountInLastMonthNormalizedAcrossItems: %@, clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems: %@, clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems: %@, clickCountGivenLocationInLastWeekNormalizedAcrossItems: %@, clickCountGivenLocationInLastMonthNormalizedAcrossItems: %@, clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems: %@, clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems: %@, clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems: %@, clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems: %@, clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems: %@, clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems: %@, clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems: %@, clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems: %@, shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems: %@, shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems: %@, shareCountGivenLocationInLastWeekNormalizedAcrossItems: %@, shareCountGivenLocationInLastMonthNormalizedAcrossItems: %@, shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems: %@, shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems: %@, shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems: %@, shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems: %@, shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems: %@, shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems: %@, shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems: %@, shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems: %@, clipScore: %@, correlationMetricVersion: %@, correlationMetricWindowInDays: %@", v96, v99, v98, v97, v93, v95, v94, v92, v89, v91, v88, v90, v85, v87, v84, v82,
              v86,
              v83,
              v79,
              v81,
              v78,
              v76,
              v80,
              v75,
              v77,
              v74,
              v73,
              v72,
              v70,
              v61,
              v71,
              v60,
              v69,
              v68,
              v67,
              v59,
              v66,
              v58,
              v65,
              v57,
              v64,
              v56,
              v55,
              v54,
              v53,
              v45,
              v47,
              v49,
              v50,
              v51);

  return (NSString *)v63;
}

- (BMAeroMLPhotosSearchDataCorrelations)initWithSearchSessionUUID:(id)a3 uiSurface:(int)a4 matchedPeopleRatio:(id)a5 matchedLocationRatio:(id)a6 matchedSceneRatio:(id)a7 matchedSceneConfidence:(id)a8 matchedSceneBoundingBox:(id)a9 matchedOCRCharacterRatio:(id)a10 matchedOCRImportance:(id)a11 matchedFieldsCount:(id)a12 L1Score:(id)a13 freshness:(id)a14 favorited:(id)a15 aestheticScore:(id)a16 curationScore:(id)a17 hasEverClickInLastWeek:(id)a18 hasEverClickInLastMonth:(id)a19 hasEverShareInLastWeek:(id)a20 hasEverShareInLastMonth:(id)a21 clickCountInLastWeekNormalizedAcrossItems:(id)a22 clickCountInLastMonthNormalizedAcrossItems:(id)a23 shareCountInLastWeekNormalizedAcrossItems:(id)a24 shareCountInLastMonthNormalizedAcrossItems:(id)a25 clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(id)a26 clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(id)a27 clickCountGivenLocationInLastWeekNormalizedAcrossItems:(id)a28 clickCountGivenLocationInLastMonthNormalizedAcrossItems:(id)a29 clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(id)a30 clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(id)a31 clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(id)a32 clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(id)a33 clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(id)a34 clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(id)a35 clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(id)a36 clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(id)a37 shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(id)a38 shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(id)a39 shareCountGivenLocationInLastWeekNormalizedAcrossItems:(id)a40 shareCountGivenLocationInLastMonthNormalizedAcrossItems:(id)a41 shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(id)a42 shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(id)a43 shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(id)a44 shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(id)a45 shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(id)a46 shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(id)a47 shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(id)a48 shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(id)a49 clipScore:(id)a50 correlationMetricVersion:(id)a51 correlationMetricWindowInDays:(id)a52
{
  id v116 = a3;
  id v157 = a5;
  id v156 = a6;
  id v155 = a7;
  id v154 = a8;
  id v152 = a9;
  id v151 = a10;
  id v150 = a11;
  id v149 = a12;
  id v148 = a13;
  id v147 = a14;
  id v146 = a15;
  id v145 = a16;
  id v144 = a17;
  id v143 = a18;
  id v142 = a19;
  id v141 = a20;
  id v140 = a21;
  id v139 = a22;
  id v138 = a23;
  id v137 = a24;
  id v136 = a25;
  id v135 = a26;
  id v134 = a27;
  id v133 = a28;
  id v132 = a29;
  id v131 = a30;
  id v130 = a31;
  id v129 = a32;
  id v128 = a33;
  id v127 = a34;
  id v126 = a35;
  id v125 = a36;
  id v124 = a37;
  id v123 = a38;
  id v122 = a39;
  id v121 = a40;
  id v120 = a41;
  id v119 = a42;
  id v118 = a43;
  id v117 = a44;
  id v55 = a45;
  id v56 = a46;
  id v57 = a47;
  id v58 = a48;
  id v59 = a49;
  id v60 = a50;
  id v61 = a51;
  id v62 = a52;
  v158.receiver = self;
  v158.super_class = (Class)BMAeroMLPhotosSearchDataCorrelations;
  id v63 = [(BMEventBase *)&v158 init];

  if (v63)
  {
    v63->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v63->_searchSessionUUID, a3);
    v63->_uiSurface = a4;
    if (v157)
    {
      v63->_hasMatchedPeopleRatio = 1;
      [v157 doubleValue];
    }
    else
    {
      v63->_hasMatchedPeopleRatio = 0;
      double v64 = -1.0;
    }
    v63->_matchedPeopleRatio = v64;
    if (v156)
    {
      v63->_hasMatchedLocationRatio = 1;
      [v156 doubleValue];
    }
    else
    {
      v63->_hasMatchedLocationRatio = 0;
      double v65 = -1.0;
    }
    v63->_matchedLocationRatio = v65;
    if (v155)
    {
      v63->_hasMatchedSceneRatio = 1;
      [v155 doubleValue];
    }
    else
    {
      v63->_hasMatchedSceneRatio = 0;
      double v66 = -1.0;
    }
    v63->_matchedSceneRatio = v66;
    if (v154)
    {
      v63->_hasMatchedSceneConfidence = 1;
      [v154 doubleValue];
    }
    else
    {
      v63->_hasMatchedSceneConfidence = 0;
      double v67 = -1.0;
    }
    v63->_matchedSceneConfidence = v67;
    if (v152)
    {
      v63->_hasMatchedSceneBoundingBox = 1;
      [v152 doubleValue];
    }
    else
    {
      v63->_hasMatchedSceneBoundingBox = 0;
      double v68 = -1.0;
    }
    v63->_matchedSceneBoundingBox = v68;
    if (v151)
    {
      v63->_hasMatchedOCRCharacterRatio = 1;
      [v151 doubleValue];
    }
    else
    {
      v63->_hasMatchedOCRCharacterRatio = 0;
      double v69 = -1.0;
    }
    v63->_matchedOCRCharacterRatio = v69;
    if (v150)
    {
      v63->_hasMatchedOCRImportance = 1;
      [v150 doubleValue];
    }
    else
    {
      v63->_hasMatchedOCRImportance = 0;
      double v70 = -1.0;
    }
    v63->_matchedOCRImportance = v70;
    unsigned int v71 = v149;
    if (v149)
    {
      v63->_hasMatchedFieldsCount = 1;
      unsigned int v71 = [v149 unsignedIntValue];
    }
    else
    {
      v63->_hasMatchedFieldsCount = 0;
    }
    v63->_matchedFieldsCount = v71;
    if (v148)
    {
      v63->_hasL1Score = 1;
      [v148 doubleValue];
    }
    else
    {
      v63->_hasL1Score = 0;
      double v72 = -1.0;
    }
    v63->_L1Score = v72;
    if (v147)
    {
      v63->_hasFreshness = 1;
      [v147 doubleValue];
    }
    else
    {
      v63->_hasFreshness = 0;
      double v73 = -1.0;
    }
    v63->_freshness = v73;
    if (v146)
    {
      v63->_hasFavorited = 1;
      v63->_favorited = [v146 BOOLValue];
    }
    else
    {
      v63->_hasFavorited = 0;
      v63->_favorited = 0;
    }
    if (v145)
    {
      v63->_hasAestheticScore = 1;
      [v145 doubleValue];
    }
    else
    {
      v63->_hasAestheticScore = 0;
      double v74 = -1.0;
    }
    v63->_aestheticScore = v74;
    if (v144)
    {
      v63->_hasCurationScore = 1;
      [v144 doubleValue];
    }
    else
    {
      v63->_hasCurationScore = 0;
      double v75 = -1.0;
    }
    v63->_curationScore = v75;
    if (v143)
    {
      v63->_hasHasEverClickInLastWeek = 1;
      [v143 doubleValue];
    }
    else
    {
      v63->_hasHasEverClickInLastWeek = 0;
      double v76 = -1.0;
    }
    v63->_hasEverClickInLastWeek = v76;
    if (v142)
    {
      v63->_hasHasEverClickInLastMonth = 1;
      [v142 doubleValue];
    }
    else
    {
      v63->_hasHasEverClickInLastMonth = 0;
      double v77 = -1.0;
    }
    v63->_hasEverClickInLastMonth = v77;
    if (v141)
    {
      v63->_hasHasEverShareInLastWeek = 1;
      [v141 doubleValue];
    }
    else
    {
      v63->_hasHasEverShareInLastWeek = 0;
      double v78 = -1.0;
    }
    v63->_hasEverShareInLastWeek = v78;
    if (v140)
    {
      v63->_hasHasEverShareInLastMonth = 1;
      [v140 doubleValue];
    }
    else
    {
      v63->_hasHasEverShareInLastMonth = 0;
      double v79 = -1.0;
    }
    v63->_hasEverShareInLastMonth = v79;
    if (v139)
    {
      v63->_hasClickCountInLastWeekNormalizedAcrossItems = 1;
      [v139 doubleValue];
    }
    else
    {
      v63->_hasClickCountInLastWeekNormalizedAcrossItems = 0;
      double v80 = -1.0;
    }
    v63->_clickCountInLastWeekNormalizedAcrossItems = v80;
    if (v138)
    {
      v63->_hasClickCountInLastMonthNormalizedAcrossItems = 1;
      [v138 doubleValue];
    }
    else
    {
      v63->_hasClickCountInLastMonthNormalizedAcrossItems = 0;
      double v81 = -1.0;
    }
    v63->_clickCountInLastMonthNormalizedAcrossItems = v81;
    if (v137)
    {
      v63->_hasShareCountInLastWeekNormalizedAcrossItems = 1;
      [v137 doubleValue];
    }
    else
    {
      v63->_hasShareCountInLastWeekNormalizedAcrossItems = 0;
      double v82 = -1.0;
    }
    v63->_shareCountInLastWeekNormalizedAcrossItems = v82;
    if (v136)
    {
      v63->_hasShareCountInLastMonthNormalizedAcrossItems = 1;
      [v136 doubleValue];
    }
    else
    {
      v63->_hasShareCountInLastMonthNormalizedAcrossItems = 0;
      double v83 = -1.0;
    }
    v63->_shareCountInLastMonthNormalizedAcrossItems = v83;
    if (v135)
    {
      v63->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 1;
      [v135 doubleValue];
    }
    else
    {
      v63->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 0;
      double v84 = -1.0;
    }
    v63->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = v84;
    if (v134)
    {
      v63->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 1;
      [v134 doubleValue];
    }
    else
    {
      v63->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 0;
      double v85 = -1.0;
    }
    v63->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = v85;
    if (v133)
    {
      v63->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems = 1;
      [v133 doubleValue];
    }
    else
    {
      v63->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems = 0;
      double v86 = -1.0;
    }
    v63->_clickCountGivenLocationInLastWeekNormalizedAcrossItems = v86;
    if (v132)
    {
      v63->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems = 1;
      [v132 doubleValue];
    }
    else
    {
      v63->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems = 0;
      double v87 = -1.0;
    }
    v63->_clickCountGivenLocationInLastMonthNormalizedAcrossItems = v87;
    if (v131)
    {
      v63->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 1;
      [v131 doubleValue];
    }
    else
    {
      v63->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 0;
      double v88 = -1.0;
    }
    v63->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = v88;
    if (v130)
    {
      v63->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 1;
      [v130 doubleValue];
    }
    else
    {
      v63->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 0;
      double v89 = -1.0;
    }
    v63->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = v89;
    if (v129)
    {
      v63->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 1;
      [v129 doubleValue];
    }
    else
    {
      v63->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 0;
      double v90 = -1.0;
    }
    v63->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = v90;
    if (v128)
    {
      v63->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 1;
      [v128 doubleValue];
    }
    else
    {
      v63->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 0;
      double v91 = -1.0;
    }
    v63->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = v91;
    if (v127)
    {
      v63->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 1;
      [v127 doubleValue];
    }
    else
    {
      v63->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 0;
      double v92 = -1.0;
    }
    v63->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = v92;
    if (v126)
    {
      v63->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 1;
      [v126 doubleValue];
    }
    else
    {
      v63->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 0;
      double v93 = -1.0;
    }
    v63->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = v93;
    if (v125)
    {
      v63->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 1;
      [v125 doubleValue];
    }
    else
    {
      v63->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 0;
      double v94 = -1.0;
    }
    v63->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = v94;
    if (v124)
    {
      v63->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 1;
      [v124 doubleValue];
    }
    else
    {
      v63->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 0;
      double v95 = -1.0;
    }
    v63->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = v95;
    if (v123)
    {
      v63->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 1;
      [v123 doubleValue];
    }
    else
    {
      v63->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 0;
      double v96 = -1.0;
    }
    v63->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = v96;
    if (v122)
    {
      v63->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 1;
      [v122 doubleValue];
    }
    else
    {
      v63->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 0;
      double v97 = -1.0;
    }
    v63->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = v97;
    if (v121)
    {
      v63->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems = 1;
      [v121 doubleValue];
    }
    else
    {
      v63->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems = 0;
      double v98 = -1.0;
    }
    v63->_shareCountGivenLocationInLastWeekNormalizedAcrossItems = v98;
    if (v120)
    {
      v63->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems = 1;
      [v120 doubleValue];
    }
    else
    {
      v63->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems = 0;
      double v99 = -1.0;
    }
    v63->_shareCountGivenLocationInLastMonthNormalizedAcrossItems = v99;
    if (v119)
    {
      v63->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 1;
      [v119 doubleValue];
    }
    else
    {
      v63->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 0;
      double v100 = -1.0;
    }
    v63->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = v100;
    if (v118)
    {
      v63->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 1;
      [v118 doubleValue];
    }
    else
    {
      v63->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 0;
      double v101 = -1.0;
    }
    v63->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = v101;
    if (v117)
    {
      v63->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 1;
      [v117 doubleValue];
    }
    else
    {
      v63->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 0;
      double v102 = -1.0;
    }
    v63->_shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = v102;
    if (v55)
    {
      v63->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 1;
      [v55 doubleValue];
    }
    else
    {
      v63->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 0;
      double v103 = -1.0;
    }
    v63->_shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = v103;
    if (v56)
    {
      v63->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 1;
      [v56 doubleValue];
    }
    else
    {
      v63->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 0;
      double v104 = -1.0;
    }
    v63->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = v104;
    if (v57)
    {
      v63->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 1;
      [v57 doubleValue];
    }
    else
    {
      v63->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 0;
      double v105 = -1.0;
    }
    v63->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = v105;
    if (v58)
    {
      v63->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 1;
      [v58 doubleValue];
    }
    else
    {
      v63->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 0;
      double v106 = -1.0;
    }
    v63->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = v106;
    if (v59)
    {
      v63->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 1;
      [v59 doubleValue];
    }
    else
    {
      v63->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 0;
      double v107 = -1.0;
    }
    v63->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = v107;
    if (v60)
    {
      v63->_hasClipScore = 1;
      [v60 doubleValue];
    }
    else
    {
      v63->_hasClipScore = 0;
      double v108 = -1.0;
    }
    v63->_clipScore = v108;
    if (v61)
    {
      v63->_hasCorrelationMetricVersion = 1;
      unsigned int v109 = [v61 unsignedIntValue];
    }
    else
    {
      unsigned int v109 = 0;
      v63->_hasCorrelationMetricVersion = 0;
    }
    v63->_correlationMetricVersion = v109;
    if (v62)
    {
      v63->_hasCorrelationMetricWindowInDays = 1;
      unsigned int v110 = [v62 unsignedIntValue];
    }
    else
    {
      unsigned int v110 = 0;
      v63->_hasCorrelationMetricWindowInDays = 0;
    }
    v63->_correlationMetricWindowInDays = v110;
  }
  unint64_t v111 = v63;

  return v111;
}

+ (id)protoFields
{
  v54[50] = *MEMORY[0x1E4F143B8];
  uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"searchSessionUUID" number:1 type:13 subMessageClass:0];
  v54[0] = v53;
  unint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uiSurface" number:2 type:4 subMessageClass:0];
  v54[1] = v52;
  uint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedPeopleRatio" number:3 type:0 subMessageClass:0];
  v54[2] = v51;
  char v50 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedLocationRatio" number:4 type:0 subMessageClass:0];
  v54[3] = v50;
  unint64_t v49 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedSceneRatio" number:5 type:0 subMessageClass:0];
  v54[4] = v49;
  uint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedSceneConfidence" number:6 type:0 subMessageClass:0];
  v54[5] = v48;
  uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedSceneBoundingBox" number:7 type:0 subMessageClass:0];
  v54[6] = v47;
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedOCRCharacterRatio" number:8 type:0 subMessageClass:0];
  v54[7] = v46;
  unsigned int v45 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedOCRImportance" number:9 type:0 subMessageClass:0];
  v54[8] = v45;
  char v44 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedFieldsCount" number:10 type:4 subMessageClass:0];
  v54[9] = v44;
  unint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"L1Score" number:11 type:0 subMessageClass:0];
  v54[10] = v43;
  uint64_t v42 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"freshness" number:12 type:0 subMessageClass:0];
  v54[11] = v42;
  unint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"favorited" number:13 type:12 subMessageClass:0];
  v54[12] = v41;
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"aestheticScore" number:14 type:0 subMessageClass:0];
  v54[13] = v40;
  unint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"curationScore" number:15 type:0 subMessageClass:0];
  v54[14] = v39;
  uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasEverClickInLastWeek" number:16 type:0 subMessageClass:0];
  v54[15] = v38;
  unint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasEverClickInLastMonth" number:17 type:0 subMessageClass:0];
  v54[16] = v37;
  uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasEverShareInLastWeek" number:18 type:0 subMessageClass:0];
  v54[17] = v36;
  unint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasEverShareInLastMonth" number:19 type:0 subMessageClass:0];
  v54[18] = v35;
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountInLastWeekNormalizedAcrossItems" number:20 type:0 subMessageClass:0];
  v54[19] = v34;
  unint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountInLastMonthNormalizedAcrossItems" number:21 type:0 subMessageClass:0];
  v54[20] = v33;
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountInLastWeekNormalizedAcrossItems" number:22 type:0 subMessageClass:0];
  v54[21] = v32;
  uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountInLastMonthNormalizedAcrossItems" number:23 type:0 subMessageClass:0];
  v54[22] = v31;
  unint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems" number:24 type:0 subMessageClass:0];
  v54[23] = v30;
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems" number:25 type:0 subMessageClass:0];
  v54[24] = v29;
  char v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenLocationInLastWeekNormalizedAcrossItems" number:26 type:0 subMessageClass:0];
  v54[25] = v28;
  unint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenLocationInLastMonthNormalizedAcrossItems" number:27 type:0 subMessageClass:0];
  v54[26] = v27;
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems" number:28 type:0 subMessageClass:0];
  v54[27] = v26;
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems" number:29 type:0 subMessageClass:0];
  v54[28] = v25;
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems" number:30 type:0 subMessageClass:0];
  v54[29] = v24;
  unsigned int v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems" number:31 type:0 subMessageClass:0];
  v54[30] = v23;
  char v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems" number:32 type:0 subMessageClass:0];
  v54[31] = v22;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems" number:33 type:0 subMessageClass:0];
  v54[32] = v21;
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems" number:34 type:0 subMessageClass:0];
  v54[33] = v20;
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems" number:35 type:0 subMessageClass:0];
  v54[34] = v19;
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems" number:36 type:0 subMessageClass:0];
  v54[35] = v18;
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems" number:37 type:0 subMessageClass:0];
  v54[36] = v17;
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenLocationInLastWeekNormalizedAcrossItems" number:38 type:0 subMessageClass:0];
  v54[37] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenLocationInLastMonthNormalizedAcrossItems" number:39 type:0 subMessageClass:0];
  v54[38] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems" number:40 type:0 subMessageClass:0];
  v54[39] = v14;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems" number:41 type:0 subMessageClass:0];
  v54[40] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems" number:42 type:0 subMessageClass:0];
  v54[41] = v3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems" number:43 type:0 subMessageClass:0];
  v54[42] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems" number:44 type:0 subMessageClass:0];
  v54[43] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems" number:45 type:0 subMessageClass:0];
  v54[44] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems" number:46 type:0 subMessageClass:0];
  v54[45] = v7;
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems" number:47 type:0 subMessageClass:0];
  v54[46] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clipScore" number:48 type:0 subMessageClass:0];
  v54[47] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"correlationMetricVersion" number:49 type:4 subMessageClass:0];
  v54[48] = v10;
  unsigned int v11 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"correlationMetricWindowInDays" number:50 type:4 subMessageClass:0];
  v54[49] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:50];

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF40E0;
}

+ (id)columns
{
  v54[50] = *MEMORY[0x1E4F143B8];
  unint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"searchSessionUUID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uiSurface" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  uint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedPeopleRatio" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  char v50 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedLocationRatio" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:0];
  unint64_t v49 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedSceneRatio" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:0];
  uint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedSceneConfidence" dataType:1 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:0];
  uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedSceneBoundingBox" dataType:1 requestOnly:0 fieldNumber:7 protoDataType:0 convertedType:0];
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedOCRCharacterRatio" dataType:1 requestOnly:0 fieldNumber:8 protoDataType:0 convertedType:0];
  unsigned int v45 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedOCRImportance" dataType:1 requestOnly:0 fieldNumber:9 protoDataType:0 convertedType:0];
  char v44 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedFieldsCount" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:4 convertedType:0];
  unint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"L1Score" dataType:1 requestOnly:0 fieldNumber:11 protoDataType:0 convertedType:0];
  uint64_t v42 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"freshness" dataType:1 requestOnly:0 fieldNumber:12 protoDataType:0 convertedType:0];
  unint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"favorited" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:12 convertedType:0];
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"aestheticScore" dataType:1 requestOnly:0 fieldNumber:14 protoDataType:0 convertedType:0];
  unint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"curationScore" dataType:1 requestOnly:0 fieldNumber:15 protoDataType:0 convertedType:0];
  uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasEverClickInLastWeek" dataType:1 requestOnly:0 fieldNumber:16 protoDataType:0 convertedType:0];
  unint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasEverClickInLastMonth" dataType:1 requestOnly:0 fieldNumber:17 protoDataType:0 convertedType:0];
  uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasEverShareInLastWeek" dataType:1 requestOnly:0 fieldNumber:18 protoDataType:0 convertedType:0];
  unint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasEverShareInLastMonth" dataType:1 requestOnly:0 fieldNumber:19 protoDataType:0 convertedType:0];
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:20 protoDataType:0 convertedType:0];
  unint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:21 protoDataType:0 convertedType:0];
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:22 protoDataType:0 convertedType:0];
  uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:23 protoDataType:0 convertedType:0];
  unint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:24 protoDataType:0 convertedType:0];
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:25 protoDataType:0 convertedType:0];
  char v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenLocationInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:26 protoDataType:0 convertedType:0];
  unint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenLocationInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:27 protoDataType:0 convertedType:0];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:28 protoDataType:0 convertedType:0];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:29 protoDataType:0 convertedType:0];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:30 protoDataType:0 convertedType:0];
  unsigned int v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:31 protoDataType:0 convertedType:0];
  char v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:32 protoDataType:0 convertedType:0];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:33 protoDataType:0 convertedType:0];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:34 protoDataType:0 convertedType:0];
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:35 protoDataType:0 convertedType:0];
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:36 protoDataType:0 convertedType:0];
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:37 protoDataType:0 convertedType:0];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenLocationInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:38 protoDataType:0 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenLocationInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:39 protoDataType:0 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:40 protoDataType:0 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:41 protoDataType:0 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:42 protoDataType:0 convertedType:0];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:43 protoDataType:0 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:44 protoDataType:0 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:45 protoDataType:0 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:46 protoDataType:0 convertedType:0];
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:47 protoDataType:0 convertedType:0];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clipScore" dataType:1 requestOnly:0 fieldNumber:48 protoDataType:0 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"correlationMetricVersion" dataType:0 requestOnly:0 fieldNumber:49 protoDataType:4 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"correlationMetricWindowInDays" dataType:0 requestOnly:0 fieldNumber:50 protoDataType:4 convertedType:0];
  v54[0] = v52;
  v54[1] = v53;
  v54[2] = v51;
  v54[3] = v50;
  v54[4] = v49;
  v54[5] = v48;
  v54[6] = v47;
  v54[7] = v46;
  v54[8] = v45;
  v54[9] = v44;
  v54[10] = v43;
  v54[11] = v42;
  v54[12] = v41;
  v54[13] = v40;
  v54[14] = v39;
  v54[15] = v38;
  v54[16] = v37;
  v54[17] = v36;
  v54[18] = v35;
  v54[19] = v34;
  v54[20] = v33;
  v54[21] = v32;
  v54[22] = v31;
  v54[23] = v30;
  v54[24] = v29;
  v54[25] = v28;
  v54[26] = v27;
  v54[27] = v26;
  v54[28] = v25;
  v54[29] = v24;
  v54[30] = v23;
  v54[31] = v22;
  v54[32] = v21;
  v54[33] = v20;
  v54[34] = v19;
  v54[35] = v18;
  v54[36] = v17;
  v54[37] = v16;
  v54[38] = v15;
  v54[39] = v14;
  v54[40] = v2;
  v54[41] = v3;
  v54[42] = v4;
  v54[43] = v5;
  v54[44] = v6;
  v54[45] = v7;
  v54[46] = v8;
  v54[47] = v13;
  v54[48] = v9;
  v54[49] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:50];

  return v12;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    double v8 = [[BMAeroMLPhotosSearchDataCorrelations alloc] initByReadFrom:v7];
    uint64_t v4 = v8;
    if (v8) {
      v8[17] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end