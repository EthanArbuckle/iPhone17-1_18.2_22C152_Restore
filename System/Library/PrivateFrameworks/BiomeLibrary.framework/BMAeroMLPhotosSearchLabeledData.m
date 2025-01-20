@interface BMAeroMLPhotosSearchLabeledData
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAeroMLPhotosSearchLabeledData)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAeroMLPhotosSearchLabeledData)initWithSearchSessionUUID:(id)a3 uiSurface:(int)a4 matchedPeopleRatio:(id)a5 matchedLocationRatio:(id)a6 matchedSceneRatio:(id)a7 matchedSceneConfidence:(id)a8 matchedSceneBoundingBox:(id)a9 matchedOCRCharacterRatio:(id)a10 matchedOCRImportance:(id)a11 matchedFieldsCount:(id)a12 L1Score:(id)a13 freshness:(id)a14 favorited:(id)a15 aestheticScore:(id)a16 curationScore:(id)a17 hasEverClickInLastWeek:(id)a18 hasEverClickInLastMonth:(id)a19 hasEverShareInLastWeek:(id)a20 hasEverShareInLastMonth:(id)a21 clickCountInLastWeekNormalizedAcrossItems:(id)a22 clickCountInLastMonthNormalizedAcrossItems:(id)a23 shareCountInLastWeekNormalizedAcrossItems:(id)a24 shareCountInLastMonthNormalizedAcrossItems:(id)a25 clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(id)a26 clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(id)a27 clickCountGivenLocationInLastWeekNormalizedAcrossItems:(id)a28 clickCountGivenLocationInLastMonthNormalizedAcrossItems:(id)a29 clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(id)a30 clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(id)a31 clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(id)a32 clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(id)a33 clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(id)a34 clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(id)a35 clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(id)a36 clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(id)a37 shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(id)a38 shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(id)a39 shareCountGivenLocationInLastWeekNormalizedAcrossItems:(id)a40 shareCountGivenLocationInLastMonthNormalizedAcrossItems:(id)a41 shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(id)a42 shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(id)a43 shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(id)a44 shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(id)a45 shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(id)a46 shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(id)a47 shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(id)a48 shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(id)a49 clipScore:(id)a50 clicked:(id)a51 clickOrder:(id)a52 itemPosition:(id)a53 L2ModelScore:(id)a54 isDuplicate:(id)a55 isCompleteMatch:(id)a56;
- (BOOL)clicked;
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
- (BOOL)hasClickOrder;
- (BOOL)hasClicked;
- (BOOL)hasClipScore;
- (BOOL)hasCurationScore;
- (BOOL)hasFavorited;
- (BOOL)hasFreshness;
- (BOOL)hasHasEverClickInLastMonth;
- (BOOL)hasHasEverClickInLastWeek;
- (BOOL)hasHasEverShareInLastMonth;
- (BOOL)hasHasEverShareInLastWeek;
- (BOOL)hasIsCompleteMatch;
- (BOOL)hasIsDuplicate;
- (BOOL)hasItemPosition;
- (BOOL)hasL1Score;
- (BOOL)hasL2ModelScore;
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
- (double)L2ModelScore;
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
- (double)isCompleteMatch;
- (double)isDuplicate;
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
- (unsigned)clickOrder;
- (unsigned)dataVersion;
- (unsigned)itemPosition;
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
- (void)setHasClickOrder:(BOOL)a3;
- (void)setHasClicked:(BOOL)a3;
- (void)setHasClipScore:(BOOL)a3;
- (void)setHasCurationScore:(BOOL)a3;
- (void)setHasFavorited:(BOOL)a3;
- (void)setHasFreshness:(BOOL)a3;
- (void)setHasHasEverClickInLastMonth:(BOOL)a3;
- (void)setHasHasEverClickInLastWeek:(BOOL)a3;
- (void)setHasHasEverShareInLastMonth:(BOOL)a3;
- (void)setHasHasEverShareInLastWeek:(BOOL)a3;
- (void)setHasIsCompleteMatch:(BOOL)a3;
- (void)setHasIsDuplicate:(BOOL)a3;
- (void)setHasItemPosition:(BOOL)a3;
- (void)setHasL1Score:(BOOL)a3;
- (void)setHasL2ModelScore:(BOOL)a3;
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

@implementation BMAeroMLPhotosSearchLabeledData

- (void).cxx_destruct
{
}

- (void)setHasIsCompleteMatch:(BOOL)a3
{
  self->_hasIsCompleteMatch = a3;
}

- (BOOL)hasIsCompleteMatch
{
  return self->_hasIsCompleteMatch;
}

- (double)isCompleteMatch
{
  return self->_isCompleteMatch;
}

- (void)setHasIsDuplicate:(BOOL)a3
{
  self->_hasIsDuplicate = a3;
}

- (BOOL)hasIsDuplicate
{
  return self->_hasIsDuplicate;
}

- (double)isDuplicate
{
  return self->_isDuplicate;
}

- (void)setHasL2ModelScore:(BOOL)a3
{
  self->_hasL2ModelScore = a3;
}

- (BOOL)hasL2ModelScore
{
  return self->_hasL2ModelScore;
}

- (double)L2ModelScore
{
  return self->_L2ModelScore;
}

- (void)setHasItemPosition:(BOOL)a3
{
  self->_hasItemPosition = a3;
}

- (BOOL)hasItemPosition
{
  return self->_hasItemPosition;
}

- (unsigned)itemPosition
{
  return self->_itemPosition;
}

- (void)setHasClickOrder:(BOOL)a3
{
  self->_hasClickOrder = a3;
}

- (BOOL)hasClickOrder
{
  return self->_hasClickOrder;
}

- (unsigned)clickOrder
{
  return self->_clickOrder;
}

- (void)setHasClicked:(BOOL)a3
{
  self->_hasClicked = a3;
}

- (BOOL)hasClicked
{
  return self->_hasClicked;
}

- (BOOL)clicked
{
  return self->_clicked;
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
    v6 = [(BMAeroMLPhotosSearchLabeledData *)self searchSessionUUID];
    uint64_t v7 = [v5 searchSessionUUID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAeroMLPhotosSearchLabeledData *)self searchSessionUUID];
      v10 = [v5 searchSessionUUID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_268;
      }
    }
    int v13 = [(BMAeroMLPhotosSearchLabeledData *)self uiSurface];
    if (v13 == [v5 uiSurface])
    {
      if (![(BMAeroMLPhotosSearchLabeledData *)self hasMatchedPeopleRatio]
        && ![v5 hasMatchedPeopleRatio]
        || [(BMAeroMLPhotosSearchLabeledData *)self hasMatchedPeopleRatio]
        && [v5 hasMatchedPeopleRatio]
        && ([(BMAeroMLPhotosSearchLabeledData *)self matchedPeopleRatio],
            double v15 = v14,
            [v5 matchedPeopleRatio],
            v15 == v16))
      {
        if (![(BMAeroMLPhotosSearchLabeledData *)self hasMatchedLocationRatio]
          && ![v5 hasMatchedLocationRatio]
          || [(BMAeroMLPhotosSearchLabeledData *)self hasMatchedLocationRatio]
          && [v5 hasMatchedLocationRatio]
          && ([(BMAeroMLPhotosSearchLabeledData *)self matchedLocationRatio],
              double v18 = v17,
              [v5 matchedLocationRatio],
              v18 == v19))
        {
          if (![(BMAeroMLPhotosSearchLabeledData *)self hasMatchedSceneRatio]
            && ![v5 hasMatchedSceneRatio]
            || [(BMAeroMLPhotosSearchLabeledData *)self hasMatchedSceneRatio]
            && [v5 hasMatchedSceneRatio]
            && ([(BMAeroMLPhotosSearchLabeledData *)self matchedSceneRatio],
                double v21 = v20,
                [v5 matchedSceneRatio],
                v21 == v22))
          {
            if (![(BMAeroMLPhotosSearchLabeledData *)self hasMatchedSceneConfidence]
              && ![v5 hasMatchedSceneConfidence]
              || [(BMAeroMLPhotosSearchLabeledData *)self hasMatchedSceneConfidence]
              && [v5 hasMatchedSceneConfidence]
              && ([(BMAeroMLPhotosSearchLabeledData *)self matchedSceneConfidence],
                  double v24 = v23,
                  [v5 matchedSceneConfidence],
                  v24 == v25))
            {
              if (![(BMAeroMLPhotosSearchLabeledData *)self hasMatchedSceneBoundingBox]
                && ![v5 hasMatchedSceneBoundingBox]
                || [(BMAeroMLPhotosSearchLabeledData *)self hasMatchedSceneBoundingBox]
                && [v5 hasMatchedSceneBoundingBox]
                && ([(BMAeroMLPhotosSearchLabeledData *)self matchedSceneBoundingBox],
                    double v27 = v26,
                    [v5 matchedSceneBoundingBox],
                    v27 == v28))
              {
                if (!-[BMAeroMLPhotosSearchLabeledData hasMatchedOCRCharacterRatio](self, "hasMatchedOCRCharacterRatio")&& ![v5 hasMatchedOCRCharacterRatio]|| -[BMAeroMLPhotosSearchLabeledData hasMatchedOCRCharacterRatio](self, "hasMatchedOCRCharacterRatio")&& objc_msgSend(v5, "hasMatchedOCRCharacterRatio")&& (-[BMAeroMLPhotosSearchLabeledData matchedOCRCharacterRatio](self, "matchedOCRCharacterRatio"), double v30 = v29, objc_msgSend(v5, "matchedOCRCharacterRatio"), v30 == v31))
                {
                  if (![(BMAeroMLPhotosSearchLabeledData *)self hasMatchedOCRImportance]
                    && ![v5 hasMatchedOCRImportance]
                    || [(BMAeroMLPhotosSearchLabeledData *)self hasMatchedOCRImportance]
                    && [v5 hasMatchedOCRImportance]
                    && ([(BMAeroMLPhotosSearchLabeledData *)self matchedOCRImportance],
                        double v33 = v32,
                        [v5 matchedOCRImportance],
                        v33 == v34))
                  {
                    if (![(BMAeroMLPhotosSearchLabeledData *)self hasMatchedFieldsCount]
                      && ![v5 hasMatchedFieldsCount]
                      || [(BMAeroMLPhotosSearchLabeledData *)self hasMatchedFieldsCount]
                      && [v5 hasMatchedFieldsCount]
                      && (unsigned int v35 = [(BMAeroMLPhotosSearchLabeledData *)self matchedFieldsCount],
                          v35 == [v5 matchedFieldsCount]))
                    {
                      if (![(BMAeroMLPhotosSearchLabeledData *)self hasL1Score]
                        && ![v5 hasL1Score]
                        || [(BMAeroMLPhotosSearchLabeledData *)self hasL1Score]
                        && [v5 hasL1Score]
                        && ([(BMAeroMLPhotosSearchLabeledData *)self L1Score],
                            double v37 = v36,
                            [v5 L1Score],
                            v37 == v38))
                      {
                        if (![(BMAeroMLPhotosSearchLabeledData *)self hasFreshness]
                          && ![v5 hasFreshness]
                          || [(BMAeroMLPhotosSearchLabeledData *)self hasFreshness]
                          && [v5 hasFreshness]
                          && ([(BMAeroMLPhotosSearchLabeledData *)self freshness],
                              double v40 = v39,
                              [v5 freshness],
                              v40 == v41))
                        {
                          if (![(BMAeroMLPhotosSearchLabeledData *)self hasFavorited]
                            && ![v5 hasFavorited]
                            || [(BMAeroMLPhotosSearchLabeledData *)self hasFavorited]
                            && [v5 hasFavorited]
                            && (int v42 = [(BMAeroMLPhotosSearchLabeledData *)self favorited],
                                v42 == [v5 favorited]))
                          {
                            if (![(BMAeroMLPhotosSearchLabeledData *)self hasAestheticScore]
                              && ![v5 hasAestheticScore]
                              || [(BMAeroMLPhotosSearchLabeledData *)self hasAestheticScore]
                              && [v5 hasAestheticScore]
                              && ([(BMAeroMLPhotosSearchLabeledData *)self aestheticScore],
                                  double v44 = v43,
                                  [v5 aestheticScore],
                                  v44 == v45))
                            {
                              if (![(BMAeroMLPhotosSearchLabeledData *)self hasCurationScore]
                                && ![v5 hasCurationScore]
                                || [(BMAeroMLPhotosSearchLabeledData *)self hasCurationScore]
                                && [v5 hasCurationScore]
                                && ([(BMAeroMLPhotosSearchLabeledData *)self curationScore],
                                    double v47 = v46,
                                    [v5 curationScore],
                                    v47 == v48))
                              {
                                if (!-[BMAeroMLPhotosSearchLabeledData hasHasEverClickInLastWeek](self, "hasHasEverClickInLastWeek")&& ![v5 hasHasEverClickInLastWeek]|| -[BMAeroMLPhotosSearchLabeledData hasHasEverClickInLastWeek](self, "hasHasEverClickInLastWeek")&& objc_msgSend(v5, "hasHasEverClickInLastWeek")&& (-[BMAeroMLPhotosSearchLabeledData hasEverClickInLastWeek](self, "hasEverClickInLastWeek"), double v50 = v49, objc_msgSend(v5, "hasEverClickInLastWeek"), v50 == v51))
                                {
                                  if (!-[BMAeroMLPhotosSearchLabeledData hasHasEverClickInLastMonth](self, "hasHasEverClickInLastMonth")&& ![v5 hasHasEverClickInLastMonth]|| -[BMAeroMLPhotosSearchLabeledData hasHasEverClickInLastMonth](self, "hasHasEverClickInLastMonth")&& objc_msgSend(v5, "hasHasEverClickInLastMonth")&& (-[BMAeroMLPhotosSearchLabeledData hasEverClickInLastMonth](self, "hasEverClickInLastMonth"), double v53 = v52, objc_msgSend(v5, "hasEverClickInLastMonth"), v53 == v54))
                                  {
                                    if (!-[BMAeroMLPhotosSearchLabeledData hasHasEverShareInLastWeek](self, "hasHasEverShareInLastWeek")&& ![v5 hasHasEverShareInLastWeek]|| -[BMAeroMLPhotosSearchLabeledData hasHasEverShareInLastWeek](self, "hasHasEverShareInLastWeek")&& objc_msgSend(v5, "hasHasEverShareInLastWeek")&& (-[BMAeroMLPhotosSearchLabeledData hasEverShareInLastWeek](self, "hasEverShareInLastWeek"), double v56 = v55, objc_msgSend(v5, "hasEverShareInLastWeek"), v56 == v57))
                                    {
                                      if (!-[BMAeroMLPhotosSearchLabeledData hasHasEverShareInLastMonth](self, "hasHasEverShareInLastMonth")&& ![v5 hasHasEverShareInLastMonth]|| -[BMAeroMLPhotosSearchLabeledData hasHasEverShareInLastMonth](self, "hasHasEverShareInLastMonth")&& objc_msgSend(v5, "hasHasEverShareInLastMonth")&& (-[BMAeroMLPhotosSearchLabeledData hasEverShareInLastMonth](self, "hasEverShareInLastMonth"), double v59 = v58, objc_msgSend(v5, "hasEverShareInLastMonth"), v59 == v60))
                                      {
                                        if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountInLastWeekNormalizedAcrossItems](self, "hasClickCountInLastWeekNormalizedAcrossItems")&& ![v5 hasClickCountInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasClickCountInLastWeekNormalizedAcrossItems](self, "hasClickCountInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountInLastWeekNormalizedAcrossItems](self, "clickCountInLastWeekNormalizedAcrossItems"), double v62 = v61, objc_msgSend(v5, "clickCountInLastWeekNormalizedAcrossItems"), v62 == v63))
                                        {
                                          if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountInLastMonthNormalizedAcrossItems](self, "hasClickCountInLastMonthNormalizedAcrossItems")&& ![v5 hasClickCountInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasClickCountInLastMonthNormalizedAcrossItems](self, "hasClickCountInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountInLastMonthNormalizedAcrossItems](self, "clickCountInLastMonthNormalizedAcrossItems"), double v65 = v64, objc_msgSend(v5, "clickCountInLastMonthNormalizedAcrossItems"), v65 == v66))
                                          {
                                            if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountInLastWeekNormalizedAcrossItems](self, "hasShareCountInLastWeekNormalizedAcrossItems")&& ![v5 hasShareCountInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasShareCountInLastWeekNormalizedAcrossItems](self, "hasShareCountInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountInLastWeekNormalizedAcrossItems](self, "shareCountInLastWeekNormalizedAcrossItems"), double v68 = v67, objc_msgSend(v5, "shareCountInLastWeekNormalizedAcrossItems"), v68 == v69))
                                            {
                                              if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountInLastMonthNormalizedAcrossItems](self, "hasShareCountInLastMonthNormalizedAcrossItems")&& ![v5 hasShareCountInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasShareCountInLastMonthNormalizedAcrossItems](self, "hasShareCountInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountInLastMonthNormalizedAcrossItems](self, "shareCountInLastMonthNormalizedAcrossItems"), double v71 = v70, objc_msgSend(v5, "shareCountInLastMonthNormalizedAcrossItems"), v71 == v72))
                                              {
                                                if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& ![v5 hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), double v74 = v73, objc_msgSend(v5, "clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), v74 == v75))
                                                {
                                                  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& ![v5 hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), double v77 = v76, objc_msgSend(v5, "clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"), v77 == v78))
                                                  {
                                                    if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastWeekNormalizedAcrossItems")&& ![v5 hasClickCountGivenLocationInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenLocationInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenLocationInLastWeekNormalizedAcrossItems](self, "clickCountGivenLocationInLastWeekNormalizedAcrossItems"), double v80 = v79, objc_msgSend(v5, "clickCountGivenLocationInLastWeekNormalizedAcrossItems"), v80 == v81))
                                                    {
                                                      if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastMonthNormalizedAcrossItems")&& ![v5 hasClickCountGivenLocationInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenLocationInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenLocationInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenLocationInLastMonthNormalizedAcrossItems](self, "clickCountGivenLocationInLastMonthNormalizedAcrossItems"), double v83 = v82, objc_msgSend(v5, "clickCountGivenLocationInLastMonthNormalizedAcrossItems"), v83 == v84))
                                                      {
                                                        if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& ![v5 hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), double v86 = v85, objc_msgSend(v5,
                                                                "clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"),
                                                              v86 == v87))
                                                        {
                                                          if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& ![v5 hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), double v89 = v88, objc_msgSend(v5,
                                                                  "clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"),
                                                                v89 == v90))
                                                          {
                                                            if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& ![v5 hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), double v92 = v91, objc_msgSend(v5,
                                                                    "clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"),
                                                                  v92 == v93))
                                                            {
                                                              if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& ![v5 hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), double v95 = v94, objc_msgSend(v5,
                                                                      "clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"),
                                                                    v95 == v96))
                                                              {
                                                                if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& ![v5 hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), double v98 = v97, objc_msgSend(v5,
                                                                        "clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"),
                                                                      v98 == v99))
                                                                {
                                                                  if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& ![v5 hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), double v101 = v100,
                                                                        [v5 clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems], v101 == v102))
                                                                  {
                                                                    if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& ![v5 hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"),
                                                                          double v104 = v103,
                                                                          [v5 clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems], v104 == v105))
                                                                    {
                                                                      if (!-[BMAeroMLPhotosSearchLabeledData hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& ![v5 hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"),
                                                                            double v107 = v106,
                                                                            [v5 clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems], v107 == v108))
                                                                      {
                                                                        if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& ![v5 hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"), double v110 = v109,
                                                                              [v5 shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems], v110 == v111))
                                                                        {
                                                                          if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& ![v5 hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems](self, "shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"),
                                                                                double v113 = v112,
                                                                                [v5 shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems], v113 == v114))
                                                                          {
                                                                            if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastWeekNormalizedAcrossItems")&& ![v5 hasShareCountGivenLocationInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenLocationInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenLocationInLastWeekNormalizedAcrossItems](self, "shareCountGivenLocationInLastWeekNormalizedAcrossItems"),
                                                                                  double v116 = v115,
                                                                                  [v5 shareCountGivenLocationInLastWeekNormalizedAcrossItems], v116 == v117))
                                                                            {
                                                                              if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastMonthNormalizedAcrossItems")&& ![v5 hasShareCountGivenLocationInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenLocationInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenLocationInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenLocationInLastMonthNormalizedAcrossItems](self, "shareCountGivenLocationInLastMonthNormalizedAcrossItems"),
                                                                                    double v119 = v118,
                                                                                    [v5 shareCountGivenLocationInLastMonthNormalizedAcrossItems], v119 == v120))
                                                                              {
                                                                                if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& ![v5 hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"), double v122 = v121, objc_msgSend(v5, "shareCountGivenDayCategoryInLast"
                                                                                        "WeekNormalizedAcrossItems"),
                                                                                      v122 == v123))
                                                                                {
                                                                                  if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& ![v5 hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), double v125 = v124, objc_msgSend(v5, "shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"), v125 == v126))
                                                                                  {
                                                                                    if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& ![v5 hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), double v128 = v127, objc_msgSend(v5, "shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"), v128 == v129))
                                                                                    {
                                                                                      if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& ![v5 hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), double v131 = v130, objc_msgSend(v5, "shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"), v131 == v132))
                                                                                      {
                                                                                        if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& ![v5 hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), double v134 = v133, objc_msgSend(v5, "shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"), v134 == v135))
                                                                                        {
                                                                                          if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& ![v5 hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"), double v137 = v136, objc_msgSend(v5,
                                                                                                  "shareCountGivenSceneCa"
                                                                                                  "tegoryInLastMonthNorma"
                                                                                                  "lizedAcrossItems"),
                                                                                                v137 == v138))
                                                                                          {
                                                                                            if (!-[BMAeroMLPhotosSearchLabeledData hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& ![v5 hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems]|| -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& objc_msgSend(v5, "hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems")&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), double v140 = v139, objc_msgSend(v5, "shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"), v140 == v141))
                                                                                            {
                                                                                              if (![(BMAeroMLPhotosSearchLabeledData *)self hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems]
                                                                                                && ![v5 hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems]
                                                                                                || -[BMAeroMLPhotosSearchLabeledData hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems")&& [v5 hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems]&& (-[BMAeroMLPhotosSearchLabeledData shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems](self, "shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), double v143 = v142, objc_msgSend(v5, "shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"), v143 == v144))
                                                                                              {
                                                                                                if (!-[BMAeroMLPhotosSearchLabeledData hasClipScore](self, "hasClipScore") && ![v5 hasClipScore] || -[BMAeroMLPhotosSearchLabeledData hasClipScore](self, "hasClipScore") && objc_msgSend(v5, "hasClipScore") && (-[BMAeroMLPhotosSearchLabeledData clipScore](self, "clipScore"), double v146 = v145, objc_msgSend(v5, "clipScore"), v146 == v147))
                                                                                                {
                                                                                                  if (!-[BMAeroMLPhotosSearchLabeledData hasClicked](self, "hasClicked") && ![v5 hasClicked] || -[BMAeroMLPhotosSearchLabeledData hasClicked](self, "hasClicked") && objc_msgSend(v5, "hasClicked") && (int v148 = -[BMAeroMLPhotosSearchLabeledData clicked](self, "clicked"), v148 == objc_msgSend(v5, "clicked")))
                                                                                                  {
                                                                                                    if (!-[BMAeroMLPhotosSearchLabeledData hasClickOrder](self, "hasClickOrder") && ![v5 hasClickOrder] || -[BMAeroMLPhotosSearchLabeledData hasClickOrder](self, "hasClickOrder") && objc_msgSend(v5, "hasClickOrder") && (unsigned int v149 = -[BMAeroMLPhotosSearchLabeledData clickOrder](self, "clickOrder"), v149 == objc_msgSend(v5, "clickOrder")))
                                                                                                    {
                                                                                                      if (!-[BMAeroMLPhotosSearchLabeledData hasItemPosition](self, "hasItemPosition") && ![v5 hasItemPosition] || -[BMAeroMLPhotosSearchLabeledData hasItemPosition](self, "hasItemPosition") && objc_msgSend(v5, "hasItemPosition") && (unsigned int v150 = -[BMAeroMLPhotosSearchLabeledData itemPosition](self, "itemPosition"), v150 == objc_msgSend(v5, "itemPosition")))
                                                                                                      {
                                                                                                        if (!-[BMAeroMLPhotosSearchLabeledData hasL2ModelScore](self, "hasL2ModelScore") && ![v5 hasL2ModelScore] || -[BMAeroMLPhotosSearchLabeledData hasL2ModelScore](self, "hasL2ModelScore") && objc_msgSend(v5, "hasL2ModelScore") && (-[BMAeroMLPhotosSearchLabeledData L2ModelScore](self, "L2ModelScore"), double v152 = v151, objc_msgSend(v5, "L2ModelScore"), v152 == v153))
                                                                                                        {
                                                                                                          if (!-[BMAeroMLPhotosSearchLabeledData hasIsDuplicate](self, "hasIsDuplicate") && ![v5 hasIsDuplicate] || -[BMAeroMLPhotosSearchLabeledData hasIsDuplicate](self, "hasIsDuplicate") && objc_msgSend(v5, "hasIsDuplicate") && (-[BMAeroMLPhotosSearchLabeledData isDuplicate](self, "isDuplicate"), double v155 = v154, objc_msgSend(v5, "isDuplicate"), v155 == v156))
                                                                                                          {
                                                                                                            if (!-[BMAeroMLPhotosSearchLabeledData hasIsCompleteMatch](self, "hasIsCompleteMatch") && ![v5 hasIsCompleteMatch])
                                                                                                            {
                                                                                                              BOOL v12 = 1;
                                                                                                              goto LABEL_269;
                                                                                                            }
                                                                                                            if (-[BMAeroMLPhotosSearchLabeledData hasIsCompleteMatch](self, "hasIsCompleteMatch") && [v5 hasIsCompleteMatch])
                                                                                                            {
                                                                                                              [(BMAeroMLPhotosSearchLabeledData *)self isCompleteMatch];
                                                                                                              double v158 = v157;
                                                                                                              [v5 isCompleteMatch];
                                                                                                              BOOL v12 = v158 == v159;
LABEL_269:

                                                                                                              goto LABEL_270;
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
          }
        }
      }
    }
LABEL_268:
    BOOL v12 = 0;
    goto LABEL_269;
  }
  BOOL v12 = 0;
LABEL_270:

  return v12;
}

- (id)jsonDictionary
{
  v265[54] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMAeroMLPhotosSearchLabeledData *)self searchSessionUUID];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAeroMLPhotosSearchLabeledData uiSurface](self, "uiSurface"));
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasMatchedPeopleRatio]
    || ([(BMAeroMLPhotosSearchLabeledData *)self matchedPeopleRatio], fabs(v5) == INFINITY))
  {
    id v7 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self matchedPeopleRatio];
    v6 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self matchedPeopleRatio];
    objc_msgSend(v6, "numberWithDouble:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasMatchedLocationRatio]
    || ([(BMAeroMLPhotosSearchLabeledData *)self matchedLocationRatio], fabs(v8) == INFINITY))
  {
    id v10 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self matchedLocationRatio];
    v9 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self matchedLocationRatio];
    objc_msgSend(v9, "numberWithDouble:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasMatchedSceneRatio]
    || ([(BMAeroMLPhotosSearchLabeledData *)self matchedSceneRatio], fabs(v11) == INFINITY))
  {
    id v13 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self matchedSceneRatio];
    BOOL v12 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self matchedSceneRatio];
    objc_msgSend(v12, "numberWithDouble:");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasMatchedSceneConfidence]
    || ([(BMAeroMLPhotosSearchLabeledData *)self matchedSceneConfidence], fabs(v14) == INFINITY))
  {
    id v16 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self matchedSceneConfidence];
    double v15 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self matchedSceneConfidence];
    objc_msgSend(v15, "numberWithDouble:");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasMatchedSceneBoundingBox]
    || ([(BMAeroMLPhotosSearchLabeledData *)self matchedSceneBoundingBox],
        fabs(v17) == INFINITY))
  {
    id v19 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self matchedSceneBoundingBox];
    double v18 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self matchedSceneBoundingBox];
    objc_msgSend(v18, "numberWithDouble:");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasMatchedOCRCharacterRatio]
    || ([(BMAeroMLPhotosSearchLabeledData *)self matchedOCRCharacterRatio],
        fabs(v20) == INFINITY))
  {
    id v263 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self matchedOCRCharacterRatio];
    double v21 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self matchedOCRCharacterRatio];
    objc_msgSend(v21, "numberWithDouble:");
    id v263 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasMatchedOCRImportance]
    || ([(BMAeroMLPhotosSearchLabeledData *)self matchedOCRImportance], fabs(v22) == INFINITY))
  {
    id v262 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self matchedOCRImportance];
    double v23 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self matchedOCRImportance];
    objc_msgSend(v23, "numberWithDouble:");
    id v262 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMAeroMLPhotosSearchLabeledData *)self hasMatchedFieldsCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchLabeledData matchedFieldsCount](self, "matchedFieldsCount"));
    id v261 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v261 = 0;
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasL1Score]
    || ([(BMAeroMLPhotosSearchLabeledData *)self L1Score], fabs(v24) == INFINITY))
  {
    id v260 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self L1Score];
    double v25 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self L1Score];
    objc_msgSend(v25, "numberWithDouble:");
    id v260 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasFreshness]
    || ([(BMAeroMLPhotosSearchLabeledData *)self freshness], fabs(v26) == INFINITY))
  {
    id v259 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self freshness];
    double v27 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self freshness];
    objc_msgSend(v27, "numberWithDouble:");
    id v259 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMAeroMLPhotosSearchLabeledData *)self hasFavorited])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchLabeledData favorited](self, "favorited"));
    id v258 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v258 = 0;
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasAestheticScore]
    || ([(BMAeroMLPhotosSearchLabeledData *)self aestheticScore], fabs(v28) == INFINITY))
  {
    id v257 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self aestheticScore];
    double v29 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self aestheticScore];
    objc_msgSend(v29, "numberWithDouble:");
    id v257 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasCurationScore]
    || ([(BMAeroMLPhotosSearchLabeledData *)self curationScore], fabs(v30) == INFINITY))
  {
    id v256 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self curationScore];
    double v31 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self curationScore];
    objc_msgSend(v31, "numberWithDouble:");
    id v256 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasHasEverClickInLastWeek]
    || ([(BMAeroMLPhotosSearchLabeledData *)self hasEverClickInLastWeek], fabs(v32) == INFINITY))
  {
    id v255 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self hasEverClickInLastWeek];
    double v33 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self hasEverClickInLastWeek];
    objc_msgSend(v33, "numberWithDouble:");
    id v255 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasHasEverClickInLastMonth]
    || ([(BMAeroMLPhotosSearchLabeledData *)self hasEverClickInLastMonth],
        fabs(v34) == INFINITY))
  {
    id v254 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self hasEverClickInLastMonth];
    unsigned int v35 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self hasEverClickInLastMonth];
    objc_msgSend(v35, "numberWithDouble:");
    id v254 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasHasEverShareInLastWeek]
    || ([(BMAeroMLPhotosSearchLabeledData *)self hasEverShareInLastWeek], fabs(v36) == INFINITY))
  {
    id v253 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self hasEverShareInLastWeek];
    double v37 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self hasEverShareInLastWeek];
    objc_msgSend(v37, "numberWithDouble:");
    id v253 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasHasEverShareInLastMonth]
    || ([(BMAeroMLPhotosSearchLabeledData *)self hasEverShareInLastMonth],
        fabs(v38) == INFINITY))
  {
    id v252 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self hasEverShareInLastMonth];
    double v39 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self hasEverShareInLastMonth];
    objc_msgSend(v39, "numberWithDouble:");
    id v252 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasClickCountInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self clickCountInLastWeekNormalizedAcrossItems], fabs(v40) == INFINITY))
  {
    id v251 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountInLastWeekNormalizedAcrossItems];
    double v41 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountInLastWeekNormalizedAcrossItems];
    objc_msgSend(v41, "numberWithDouble:");
    id v251 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasClickCountInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self clickCountInLastMonthNormalizedAcrossItems], fabs(v42) == INFINITY))
  {
    id v250 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountInLastMonthNormalizedAcrossItems];
    double v43 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountInLastMonthNormalizedAcrossItems];
    objc_msgSend(v43, "numberWithDouble:");
    id v250 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasShareCountInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self shareCountInLastWeekNormalizedAcrossItems], fabs(v44) == INFINITY))
  {
    id v249 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountInLastWeekNormalizedAcrossItems];
    double v45 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountInLastWeekNormalizedAcrossItems];
    objc_msgSend(v45, "numberWithDouble:");
    id v249 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasShareCountInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self shareCountInLastMonthNormalizedAcrossItems], fabs(v46) == INFINITY))
  {
    id v248 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountInLastMonthNormalizedAcrossItems];
    double v47 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountInLastMonthNormalizedAcrossItems];
    objc_msgSend(v47, "numberWithDouble:");
    id v248 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems], fabs(v48) == INFINITY))
  {
    id v247 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems];
    double v49 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems];
    objc_msgSend(v49, "numberWithDouble:");
    id v247 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems], fabs(v50) == INFINITY))
  {
    id v246 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems];
    double v51 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems];
    objc_msgSend(v51, "numberWithDouble:");
    id v246 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasClickCountGivenLocationInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenLocationInLastWeekNormalizedAcrossItems], fabs(v52) == INFINITY))
  {
    id v245 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenLocationInLastWeekNormalizedAcrossItems];
    double v53 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenLocationInLastWeekNormalizedAcrossItems];
    objc_msgSend(v53, "numberWithDouble:");
    id v245 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasClickCountGivenLocationInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenLocationInLastMonthNormalizedAcrossItems], fabs(v54) == INFINITY))
  {
    id v244 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenLocationInLastMonthNormalizedAcrossItems];
    double v55 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenLocationInLastMonthNormalizedAcrossItems];
    objc_msgSend(v55, "numberWithDouble:");
    id v244 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems], fabs(v56) == INFINITY))
  {
    id v243 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems];
    double v57 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems];
    objc_msgSend(v57, "numberWithDouble:");
    id v243 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems], fabs(v58) == INFINITY))
  {
    id v242 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems];
    double v59 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems];
    objc_msgSend(v59, "numberWithDouble:");
    id v242 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems], fabs(v60) == INFINITY))
  {
    id v241 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems];
    double v61 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems];
    objc_msgSend(v61, "numberWithDouble:");
    id v241 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems], fabs(v62) == INFINITY))
  {
    id v240 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems];
    double v63 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems];
    objc_msgSend(v63, "numberWithDouble:");
    id v240 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems], fabs(v64) == INFINITY))
  {
    id v239 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems];
    double v65 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems];
    objc_msgSend(v65, "numberWithDouble:");
    id v239 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems], fabs(v66) == INFINITY))
  {
    id v238 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems];
    double v67 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems];
    objc_msgSend(v67, "numberWithDouble:");
    id v238 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems], fabs(v68) == INFINITY))
  {
    id v237 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems];
    double v69 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems];
    objc_msgSend(v69, "numberWithDouble:");
    id v237 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems], fabs(v70) == INFINITY))
  {
    id v236 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems];
    double v71 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems];
    objc_msgSend(v71, "numberWithDouble:");
    id v236 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems], fabs(v72) == INFINITY))
  {
    id v235 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems];
    double v73 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems];
    objc_msgSend(v73, "numberWithDouble:");
    id v235 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems], fabs(v74) == INFINITY))
  {
    id v234 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems];
    double v75 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems];
    objc_msgSend(v75, "numberWithDouble:");
    id v234 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasShareCountGivenLocationInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenLocationInLastWeekNormalizedAcrossItems], fabs(v76) == INFINITY))
  {
    id v233 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenLocationInLastWeekNormalizedAcrossItems];
    double v77 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenLocationInLastWeekNormalizedAcrossItems];
    objc_msgSend(v77, "numberWithDouble:");
    id v233 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasShareCountGivenLocationInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenLocationInLastMonthNormalizedAcrossItems], fabs(v78) == INFINITY))
  {
    id v232 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenLocationInLastMonthNormalizedAcrossItems];
    double v79 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenLocationInLastMonthNormalizedAcrossItems];
    objc_msgSend(v79, "numberWithDouble:");
    id v232 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems], fabs(v80) == INFINITY))
  {
    id v231 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems];
    double v81 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems];
    objc_msgSend(v81, "numberWithDouble:");
    id v231 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems], fabs(v82) == INFINITY))
  {
    id v230 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems];
    double v83 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems];
    objc_msgSend(v83, "numberWithDouble:");
    id v230 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems], fabs(v84) == INFINITY))
  {
    id v229 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems];
    double v85 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems];
    objc_msgSend(v85, "numberWithDouble:");
    id v229 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems], fabs(v86) == INFINITY))
  {
    id v228 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems];
    double v87 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems];
    objc_msgSend(v87, "numberWithDouble:");
    id v228 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems], fabs(v88) == INFINITY))
  {
    id v227 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems];
    double v89 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems];
    objc_msgSend(v89, "numberWithDouble:");
    id v227 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems], fabs(v90) == INFINITY))
  {
    id v226 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems];
    double v91 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems];
    objc_msgSend(v91, "numberWithDouble:");
    id v226 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems], fabs(v92) == INFINITY))
  {
    id v225 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems];
    double v93 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems];
    objc_msgSend(v93, "numberWithDouble:");
    id v225 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems]|| ([(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems], fabs(v94) == INFINITY))
  {
    id v224 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems];
    double v95 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems];
    objc_msgSend(v95, "numberWithDouble:");
    id v224 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasClipScore]
    || ([(BMAeroMLPhotosSearchLabeledData *)self clipScore], fabs(v96) == INFINITY))
  {
    id v223 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self clipScore];
    double v97 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self clipScore];
    objc_msgSend(v97, "numberWithDouble:");
    id v223 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMAeroMLPhotosSearchLabeledData *)self hasClicked])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchLabeledData clicked](self, "clicked"));
    id v222 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v222 = 0;
  }
  if ([(BMAeroMLPhotosSearchLabeledData *)self hasClickOrder])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchLabeledData clickOrder](self, "clickOrder"));
    id v221 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v221 = 0;
  }
  if ([(BMAeroMLPhotosSearchLabeledData *)self hasItemPosition])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchLabeledData itemPosition](self, "itemPosition"));
    id v220 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v220 = 0;
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasL2ModelScore]
    || ([(BMAeroMLPhotosSearchLabeledData *)self L2ModelScore], fabs(v98) == INFINITY))
  {
    id v219 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self L2ModelScore];
    double v99 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self L2ModelScore];
    objc_msgSend(v99, "numberWithDouble:");
    id v219 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasIsDuplicate]
    || ([(BMAeroMLPhotosSearchLabeledData *)self isDuplicate], fabs(v100) == INFINITY))
  {
    id v218 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self isDuplicate];
    double v101 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self isDuplicate];
    objc_msgSend(v101, "numberWithDouble:");
    id v218 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMAeroMLPhotosSearchLabeledData *)self hasIsCompleteMatch]
    || ([(BMAeroMLPhotosSearchLabeledData *)self isCompleteMatch], fabs(v102) == INFINITY))
  {
    id v217 = 0;
  }
  else
  {
    [(BMAeroMLPhotosSearchLabeledData *)self isCompleteMatch];
    double v103 = NSNumber;
    [(BMAeroMLPhotosSearchLabeledData *)self isCompleteMatch];
    objc_msgSend(v103, "numberWithDouble:");
    id v217 = (id)objc_claimAutoreleasedReturnValue();
  }
  v264[0] = @"searchSessionUUID";
  uint64_t v104 = v3;
  if (!v3)
  {
    uint64_t v104 = [MEMORY[0x1E4F1CA98] null];
  }
  v211 = (void *)v104;
  v265[0] = v104;
  v264[1] = @"uiSurface";
  uint64_t v105 = v4;
  if (!v4)
  {
    uint64_t v105 = [MEMORY[0x1E4F1CA98] null];
  }
  v210 = (void *)v105;
  v265[1] = v105;
  v264[2] = @"matchedPeopleRatio";
  uint64_t v106 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v106 = [MEMORY[0x1E4F1CA98] null];
  }
  v209 = (void *)v106;
  v265[2] = v106;
  v264[3] = @"matchedLocationRatio";
  uint64_t v107 = (uint64_t)v10;
  if (!v10)
  {
    uint64_t v107 = [MEMORY[0x1E4F1CA98] null];
  }
  v208 = (void *)v107;
  v265[3] = v107;
  v264[4] = @"matchedSceneRatio";
  uint64_t v108 = (uint64_t)v13;
  if (!v13)
  {
    uint64_t v108 = [MEMORY[0x1E4F1CA98] null];
  }
  v207 = (void *)v108;
  v265[4] = v108;
  v264[5] = @"matchedSceneConfidence";
  uint64_t v109 = (uint64_t)v16;
  if (!v16)
  {
    uint64_t v109 = [MEMORY[0x1E4F1CA98] null];
  }
  v206 = (void *)v109;
  v265[5] = v109;
  v264[6] = @"matchedSceneBoundingBox";
  uint64_t v110 = (uint64_t)v19;
  if (!v19)
  {
    uint64_t v110 = [MEMORY[0x1E4F1CA98] null];
  }
  v205 = (void *)v110;
  v265[6] = v110;
  v264[7] = @"matchedOCRCharacterRatio";
  uint64_t v111 = (uint64_t)v263;
  if (!v263)
  {
    uint64_t v111 = [MEMORY[0x1E4F1CA98] null];
  }
  v265[7] = v111;
  v264[8] = @"matchedOCRImportance";
  uint64_t v112 = (uint64_t)v262;
  if (!v262)
  {
    uint64_t v112 = [MEMORY[0x1E4F1CA98] null];
  }
  v213 = v19;
  v265[8] = v112;
  v264[9] = @"matchedFieldsCount";
  uint64_t v113 = (uint64_t)v261;
  if (!v261)
  {
    uint64_t v113 = [MEMORY[0x1E4F1CA98] null];
  }
  id v114 = v13;
  v265[9] = v113;
  v264[10] = @"L1Score";
  uint64_t v115 = (uint64_t)v260;
  if (!v260)
  {
    uint64_t v115 = [MEMORY[0x1E4F1CA98] null];
  }
  double v116 = v10;
  v201 = (void *)v115;
  v265[10] = v115;
  v264[11] = @"freshness";
  uint64_t v117 = (uint64_t)v259;
  if (!v259)
  {
    uint64_t v117 = [MEMORY[0x1E4F1CA98] null];
  }
  double v118 = (void *)v3;
  v214 = (void *)v117;
  v265[11] = v117;
  v264[12] = @"favorited";
  uint64_t v119 = (uint64_t)v258;
  if (!v258)
  {
    uint64_t v119 = [MEMORY[0x1E4F1CA98] null];
  }
  double v120 = (void *)v119;
  v265[12] = v119;
  v264[13] = @"aestheticScore";
  uint64_t v121 = (uint64_t)v257;
  if (!v257)
  {
    uint64_t v121 = [MEMORY[0x1E4F1CA98] null];
  }
  v200 = (void *)v121;
  v265[13] = v121;
  v264[14] = @"curationScore";
  uint64_t v122 = (uint64_t)v256;
  if (!v256)
  {
    uint64_t v122 = [MEMORY[0x1E4F1CA98] null];
  }
  v199 = (void *)v122;
  v265[14] = v122;
  v264[15] = @"hasEverClickInLastWeek";
  uint64_t v123 = (uint64_t)v255;
  if (!v255)
  {
    uint64_t v123 = [MEMORY[0x1E4F1CA98] null];
  }
  v198 = (void *)v123;
  v265[15] = v123;
  v264[16] = @"hasEverClickInLastMonth";
  uint64_t v124 = (uint64_t)v254;
  if (!v254)
  {
    uint64_t v124 = [MEMORY[0x1E4F1CA98] null];
  }
  v197 = (void *)v124;
  v265[16] = v124;
  v264[17] = @"hasEverShareInLastWeek";
  uint64_t v125 = (uint64_t)v253;
  if (!v253)
  {
    uint64_t v125 = [MEMORY[0x1E4F1CA98] null];
  }
  v196 = (void *)v125;
  v265[17] = v125;
  v264[18] = @"hasEverShareInLastMonth";
  uint64_t v126 = (uint64_t)v252;
  if (!v252)
  {
    uint64_t v126 = [MEMORY[0x1E4F1CA98] null];
  }
  v195 = (void *)v126;
  v265[18] = v126;
  v264[19] = @"clickCountInLastWeekNormalizedAcrossItems";
  uint64_t v127 = (uint64_t)v251;
  if (!v251)
  {
    uint64_t v127 = [MEMORY[0x1E4F1CA98] null];
  }
  v194 = (void *)v127;
  v265[19] = v127;
  v264[20] = @"clickCountInLastMonthNormalizedAcrossItems";
  uint64_t v128 = (uint64_t)v250;
  if (!v250)
  {
    uint64_t v128 = [MEMORY[0x1E4F1CA98] null];
  }
  v193 = (void *)v128;
  v265[20] = v128;
  v264[21] = @"shareCountInLastWeekNormalizedAcrossItems";
  uint64_t v129 = (uint64_t)v249;
  if (!v249)
  {
    uint64_t v129 = [MEMORY[0x1E4F1CA98] null];
  }
  v192 = (void *)v129;
  v265[21] = v129;
  v264[22] = @"shareCountInLastMonthNormalizedAcrossItems";
  uint64_t v130 = (uint64_t)v248;
  if (!v248)
  {
    uint64_t v130 = [MEMORY[0x1E4F1CA98] null];
  }
  v191 = (void *)v130;
  v265[22] = v130;
  v264[23] = @"clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems";
  uint64_t v131 = (uint64_t)v247;
  if (!v247)
  {
    uint64_t v131 = [MEMORY[0x1E4F1CA98] null];
  }
  v190 = (void *)v131;
  v265[23] = v131;
  v264[24] = @"clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems";
  uint64_t v132 = (uint64_t)v246;
  if (!v246)
  {
    uint64_t v132 = [MEMORY[0x1E4F1CA98] null];
  }
  v189 = (void *)v132;
  v265[24] = v132;
  v264[25] = @"clickCountGivenLocationInLastWeekNormalizedAcrossItems";
  uint64_t v133 = (uint64_t)v245;
  if (!v245)
  {
    uint64_t v133 = [MEMORY[0x1E4F1CA98] null];
  }
  v188 = (void *)v133;
  v265[25] = v133;
  v264[26] = @"clickCountGivenLocationInLastMonthNormalizedAcrossItems";
  uint64_t v134 = (uint64_t)v244;
  if (!v244)
  {
    uint64_t v134 = [MEMORY[0x1E4F1CA98] null];
  }
  v187 = (void *)v134;
  v265[26] = v134;
  v264[27] = @"clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems";
  uint64_t v135 = (uint64_t)v243;
  if (!v243)
  {
    uint64_t v135 = [MEMORY[0x1E4F1CA98] null];
  }
  v186 = (void *)v135;
  v265[27] = v135;
  v264[28] = @"clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems";
  uint64_t v136 = (uint64_t)v242;
  if (!v242)
  {
    uint64_t v136 = [MEMORY[0x1E4F1CA98] null];
  }
  v185 = (void *)v136;
  v265[28] = v136;
  v264[29] = @"clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems";
  uint64_t v137 = (uint64_t)v241;
  if (!v241)
  {
    uint64_t v137 = [MEMORY[0x1E4F1CA98] null];
  }
  v184 = (void *)v137;
  v265[29] = v137;
  v264[30] = @"clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems";
  uint64_t v138 = (uint64_t)v240;
  if (!v240)
  {
    uint64_t v138 = [MEMORY[0x1E4F1CA98] null];
  }
  v183 = (void *)v138;
  v265[30] = v138;
  v264[31] = @"clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems";
  uint64_t v139 = (uint64_t)v239;
  if (!v239)
  {
    uint64_t v139 = [MEMORY[0x1E4F1CA98] null];
  }
  v182 = (void *)v139;
  v265[31] = v139;
  v264[32] = @"clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems";
  uint64_t v140 = (uint64_t)v238;
  if (!v238)
  {
    uint64_t v140 = [MEMORY[0x1E4F1CA98] null];
  }
  v181 = (void *)v140;
  v265[32] = v140;
  v264[33] = @"clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems";
  uint64_t v141 = (uint64_t)v237;
  if (!v237)
  {
    uint64_t v141 = [MEMORY[0x1E4F1CA98] null];
  }
  v180 = (void *)v141;
  v265[33] = v141;
  v264[34] = @"clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems";
  uint64_t v142 = (uint64_t)v236;
  if (!v236)
  {
    uint64_t v142 = [MEMORY[0x1E4F1CA98] null];
  }
  v179 = (void *)v142;
  v265[34] = v142;
  v264[35] = @"shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems";
  uint64_t v143 = (uint64_t)v235;
  if (!v235)
  {
    uint64_t v143 = [MEMORY[0x1E4F1CA98] null];
  }
  v178 = (void *)v143;
  v265[35] = v143;
  v264[36] = @"shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems";
  uint64_t v144 = (uint64_t)v234;
  if (!v234)
  {
    uint64_t v144 = [MEMORY[0x1E4F1CA98] null];
  }
  v177 = (void *)v144;
  v265[36] = v144;
  v264[37] = @"shareCountGivenLocationInLastWeekNormalizedAcrossItems";
  uint64_t v145 = (uint64_t)v233;
  if (!v233)
  {
    uint64_t v145 = [MEMORY[0x1E4F1CA98] null];
  }
  v176 = (void *)v145;
  v265[37] = v145;
  v264[38] = @"shareCountGivenLocationInLastMonthNormalizedAcrossItems";
  uint64_t v146 = (uint64_t)v232;
  if (!v232)
  {
    uint64_t v146 = [MEMORY[0x1E4F1CA98] null];
  }
  v175 = (void *)v146;
  v265[38] = v146;
  v264[39] = @"shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems";
  uint64_t v147 = (uint64_t)v231;
  if (!v231)
  {
    uint64_t v147 = [MEMORY[0x1E4F1CA98] null];
  }
  v174 = (void *)v147;
  v265[39] = v147;
  v264[40] = @"shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems";
  uint64_t v148 = (uint64_t)v230;
  if (!v230)
  {
    uint64_t v148 = [MEMORY[0x1E4F1CA98] null];
  }
  v173 = (void *)v148;
  v265[40] = v148;
  v264[41] = @"shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems";
  uint64_t v149 = (uint64_t)v229;
  if (!v229)
  {
    uint64_t v149 = [MEMORY[0x1E4F1CA98] null];
  }
  v172 = (void *)v149;
  v265[41] = v149;
  v264[42] = @"shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems";
  uint64_t v150 = (uint64_t)v228;
  if (!v228)
  {
    uint64_t v150 = [MEMORY[0x1E4F1CA98] null];
  }
  v171 = (void *)v150;
  v265[42] = v150;
  v264[43] = @"shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems";
  uint64_t v151 = (uint64_t)v227;
  if (!v227)
  {
    uint64_t v151 = [MEMORY[0x1E4F1CA98] null];
  }
  v170 = (void *)v151;
  v265[43] = v151;
  v264[44] = @"shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems";
  uint64_t v152 = (uint64_t)v226;
  if (!v226)
  {
    uint64_t v152 = [MEMORY[0x1E4F1CA98] null];
  }
  v169 = (void *)v152;
  v265[44] = v152;
  v264[45] = @"shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems";
  uint64_t v153 = (uint64_t)v225;
  if (!v225)
  {
    uint64_t v153 = [MEMORY[0x1E4F1CA98] null];
  }
  v168 = (void *)v153;
  v265[45] = v153;
  v264[46] = @"shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems";
  uint64_t v154 = (uint64_t)v224;
  if (!v224)
  {
    uint64_t v154 = [MEMORY[0x1E4F1CA98] null];
  }
  v216 = (void *)v4;
  v167 = (void *)v154;
  v265[46] = v154;
  v264[47] = @"clipScore";
  uint64_t v155 = (uint64_t)v223;
  if (!v223)
  {
    uint64_t v155 = [MEMORY[0x1E4F1CA98] null];
  }
  v203 = (void *)v112;
  v166 = (void *)v155;
  v265[47] = v155;
  v264[48] = @"clicked";
  uint64_t v156 = (uint64_t)v222;
  if (!v222)
  {
    uint64_t v156 = [MEMORY[0x1E4F1CA98] null];
  }
  v215 = v7;
  v165 = (void *)v156;
  v265[48] = v156;
  v264[49] = @"clickOrder";
  double v157 = v221;
  if (!v221)
  {
    double v157 = [MEMORY[0x1E4F1CA98] null];
  }
  v202 = (void *)v113;
  v265[49] = v157;
  v264[50] = @"itemPosition";
  double v158 = v220;
  if (!v220)
  {
    double v158 = [MEMORY[0x1E4F1CA98] null];
  }
  double v159 = v114;
  v265[50] = v158;
  v264[51] = @"L2ModelScore";
  v160 = v219;
  if (!v219)
  {
    v160 = [MEMORY[0x1E4F1CA98] null];
  }
  v204 = (void *)v111;
  v265[51] = v160;
  v264[52] = @"isDuplicate";
  v161 = v218;
  if (!v218)
  {
    v161 = [MEMORY[0x1E4F1CA98] null];
  }
  v265[52] = v161;
  v264[53] = @"isCompleteMatch";
  v162 = v217;
  if (!v217)
  {
    v162 = [MEMORY[0x1E4F1CA98] null];
  }
  v265[53] = v162;
  id v212 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v265 forKeys:v264 count:54];
  if (!v217) {

  }
  v163 = v120;
  if (!v218)
  {

    v163 = v120;
  }
  if (!v219)
  {

    v163 = v120;
  }
  if (!v220)
  {

    v163 = v120;
  }
  if (!v221)
  {

    v163 = v120;
  }
  if (!v222)
  {

    v163 = v120;
  }
  if (!v223)
  {

    v163 = v120;
  }
  if (!v224)
  {

    v163 = v120;
  }
  if (!v225)
  {

    v163 = v120;
  }
  if (!v226)
  {

    v163 = v120;
  }
  if (!v227)
  {

    v163 = v120;
  }
  if (!v228)
  {

    v163 = v120;
  }
  if (!v229)
  {

    v163 = v120;
  }
  if (!v230)
  {

    v163 = v120;
  }
  if (!v231)
  {

    v163 = v120;
  }
  if (!v232)
  {

    v163 = v120;
  }
  if (!v233)
  {

    v163 = v120;
  }
  if (!v234)
  {

    v163 = v120;
  }
  if (!v235)
  {

    v163 = v120;
  }
  if (!v236)
  {

    v163 = v120;
  }
  if (!v237)
  {

    v163 = v120;
  }
  if (!v238)
  {

    v163 = v120;
  }
  if (!v239)
  {

    v163 = v120;
  }
  if (!v240)
  {

    v163 = v120;
  }
  if (!v241)
  {

    v163 = v120;
  }
  if (!v242)
  {

    v163 = v120;
  }
  if (!v243)
  {

    v163 = v120;
  }
  if (!v244)
  {

    v163 = v120;
  }
  if (!v245)
  {

    v163 = v120;
  }
  if (!v246)
  {

    v163 = v120;
  }
  if (!v247)
  {

    v163 = v120;
  }
  if (!v248)
  {

    v163 = v120;
  }
  if (!v249)
  {

    v163 = v120;
  }
  if (!v250)
  {

    v163 = v120;
  }
  if (!v251)
  {

    v163 = v120;
  }
  if (!v252)
  {

    v163 = v120;
  }
  if (!v253)
  {

    v163 = v120;
  }
  if (!v254)
  {

    v163 = v120;
  }
  if (!v255)
  {

    v163 = v120;
  }
  if (!v256)
  {

    v163 = v120;
  }
  if (!v257)
  {

    v163 = v120;
  }
  if (!v258) {

  }
  if (!v259) {
  if (!v260)
  }

  if (!v261) {
  if (!v262)
  }

  if (v263)
  {
    if (v213) {
      goto LABEL_406;
    }
  }
  else
  {

    if (v213)
    {
LABEL_406:
      if (v16) {
        goto LABEL_407;
      }
      goto LABEL_417;
    }
  }

  if (v16)
  {
LABEL_407:
    if (v159) {
      goto LABEL_408;
    }
    goto LABEL_418;
  }
LABEL_417:

  if (v159)
  {
LABEL_408:
    if (v116) {
      goto LABEL_409;
    }
    goto LABEL_419;
  }
LABEL_418:

  if (v116)
  {
LABEL_409:
    if (v215) {
      goto LABEL_410;
    }
    goto LABEL_420;
  }
LABEL_419:

  if (v215)
  {
LABEL_410:
    if (v216) {
      goto LABEL_411;
    }
LABEL_421:

    if (v118) {
      goto LABEL_412;
    }
    goto LABEL_422;
  }
LABEL_420:

  if (!v216) {
    goto LABEL_421;
  }
LABEL_411:
  if (v118) {
    goto LABEL_412;
  }
LABEL_422:

LABEL_412:

  return v212;
}

- (BMAeroMLPhotosSearchLabeledData)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v742[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"searchSessionUUID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v634 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v634 = v7;
LABEL_4:
    double v8 = [v6 objectForKeyedSubscript:@"uiSurface"];
    v633 = self;
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v9 = 0;
      goto LABEL_16;
    }
    id v10 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
LABEL_15:

LABEL_16:
      double v21 = [v6 objectForKeyedSubscript:@"matchedPeopleRatio"];
      if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        double v22 = a4;
        double v23 = 0;
        goto LABEL_19;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v22 = a4;
        double v23 = v21;
LABEL_19:
        double v24 = [v6 objectForKeyedSubscript:@"matchedLocationRatio"];
        v632 = v23;
        v631 = v21;
        if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          double v25 = v8;
          v629 = v24;
          id v26 = 0;
          goto LABEL_22;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v25 = v8;
          v629 = v24;
          id v26 = v24;
LABEL_22:
          uint64_t v27 = [v6 objectForKeyedSubscript:@"matchedSceneRatio"];
          v627 = (void *)v27;
          id v613 = v9;
          if (!v27 || (double v28 = (void *)v27, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v630 = 0;
            goto LABEL_25;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v630 = v28;
LABEL_25:
            uint64_t v29 = [v6 objectForKeyedSubscript:@"matchedSceneConfidence"];
            v628 = (void *)v29;
            if (!v29 || (double v30 = (void *)v29, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              double v31 = v6;
              id v32 = 0;
              goto LABEL_28;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              double v31 = v6;
              id v32 = v30;
LABEL_28:
              uint64_t v33 = [v31 objectForKeyedSubscript:@"matchedSceneBoundingBox"];
              v612 = (void *)v33;
              if (!v33 || (double v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v610 = 0;
                goto LABEL_31;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v610 = v34;
LABEL_31:
                uint64_t v35 = [v31 objectForKeyedSubscript:@"matchedOCRCharacterRatio"];
                v579 = (void *)v35;
                if (!v35 || (double v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v574 = 0;
                  goto LABEL_34;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v574 = v36;
LABEL_34:
                  uint64_t v37 = [v31 objectForKeyedSubscript:@"matchedOCRImportance"];
                  v577 = (void *)v37;
                  if (!v37 || (double v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v575 = 0;
                    goto LABEL_37;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v575 = v38;
LABEL_37:
                    uint64_t v39 = [v31 objectForKeyedSubscript:@"matchedFieldsCount"];
                    v573 = (void *)v39;
                    if (!v39 || (double v40 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v571 = 0;
                      goto LABEL_40;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v571 = v40;
LABEL_40:
                      uint64_t v41 = [v31 objectForKeyedSubscript:@"L1Score"];
                      v570 = (void *)v41;
                      if (!v41 || (double v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v568 = 0;
                        goto LABEL_43;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v568 = v42;
LABEL_43:
                        uint64_t v43 = [v31 objectForKeyedSubscript:@"freshness"];
                        v567 = (void *)v43;
                        if (!v43 || (double v44 = (void *)v43, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v565 = 0;
LABEL_46:
                          uint64_t v45 = [v31 objectForKeyedSubscript:@"favorited"];
                          id v561 = v26;
                          v564 = (void *)v45;
                          if (v45 && (double v46 = (void *)v45, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              if (!v22)
                              {
                                id v562 = 0;
                                double v18 = 0;
                                double v65 = v629;
                                self = v633;
LABEL_500:
                                double v103 = v574;
                                goto LABEL_501;
                              }
                              id v563 = objc_alloc(MEMORY[0x1E4F28C58]);
                              v586 = v7;
                              uint64_t v202 = *MEMORY[0x1E4F502C8];
                              uint64_t v717 = *MEMORY[0x1E4F28568];
                              v556 = v22;
                              id v203 = [NSString alloc];
                              uint64_t v446 = objc_opt_class();
                              v204 = v203;
                              self = v633;
                              v205 = (void *)[v204 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v446, @"favorited"];
                              v718 = v205;
                              double v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v718 forKeys:&v717 count:1];
                              uint64_t v206 = v202;
                              id v7 = v586;
                              id v207 = (id)[v563 initWithDomain:v206 code:2 userInfo:v50];
                              double v18 = 0;
                              id v562 = 0;
                              id *v556 = v207;
                              double v65 = v629;
                              goto LABEL_499;
                            }
                            id v562 = v46;
                          }
                          else
                          {
                            id v562 = 0;
                          }
                          uint64_t v47 = [v31 objectForKeyedSubscript:@"aestheticScore"];
                          double v48 = v22;
                          double v49 = v25;
                          v560 = (void *)v47;
                          if (!v47)
                          {
                            id v549 = v32;
                            double v51 = v7;
                            id v558 = 0;
                            self = v633;
                            goto LABEL_96;
                          }
                          double v50 = (void *)v47;
                          objc_opt_class();
                          self = v633;
                          if (objc_opt_isKindOfClass())
                          {
                            id v549 = v32;
                            double v51 = v7;
                            id v558 = 0;
                            goto LABEL_96;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v549 = v32;
                            double v51 = v7;
                            id v558 = v50;
LABEL_96:
                            double v120 = [v31 objectForKeyedSubscript:@"curationScore"];
                            if (!v120 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v546 = v120;
                              id v559 = 0;
                              goto LABEL_99;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v546 = v120;
                              id v559 = v120;
LABEL_99:
                              uint64_t v121 = [v31 objectForKeyedSubscript:@"hasEverClickInLastWeek"];
                              v548 = (void *)v121;
                              if (!v121 || (uint64_t v122 = (void *)v121, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v547 = 0;
LABEL_102:
                                uint64_t v123 = [v31 objectForKeyedSubscript:@"hasEverClickInLastMonth"];
                                v545 = (void *)v123;
                                if (v123
                                  && (uint64_t v124 = (void *)v123, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (!v48)
                                    {
                                      double v18 = 0;
                                      double v65 = v629;
                                      id v212 = v546;
                                      id v7 = v51;
LABEL_495:
                                      id v32 = v549;
                                      goto LABEL_496;
                                    }
                                    id v229 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    v619 = v31;
                                    v590 = v51;
                                    uint64_t v230 = *MEMORY[0x1E4F502C8];
                                    uint64_t v709 = *MEMORY[0x1E4F28568];
                                    id v231 = v48;
                                    id v232 = [NSString alloc];
                                    uint64_t v450 = objc_opt_class();
                                    id v233 = v232;
                                    self = v633;
                                    id v234 = (void *)[v233 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v450, @"hasEverClickInLastMonth"];
                                    v710 = v234;
                                    uint64_t v235 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v710 forKeys:&v709 count:1];
                                    id v236 = v229;
                                    uint64_t v237 = v230;
                                    id v7 = v590;
                                    double v49 = v25;
                                    double v31 = v619;
                                    v550 = (void *)v235;
                                    double v18 = 0;
                                    double v48 = 0;
                                    *id v231 = (id)objc_msgSend(v236, "initWithDomain:code:userInfo:", v237, 2);
                                    double v65 = v629;
                                    id v212 = v546;
                                    goto LABEL_494;
                                  }
                                  v544 = v124;
                                }
                                else
                                {
                                  v544 = 0;
                                }
                                [v31 objectForKeyedSubscript:@"hasEverShareInLastWeek"];
                                v550 = id v7 = v51;
                                if (!v550 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v542 = 0;
                                  goto LABEL_108;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v542 = v550;
LABEL_108:
                                  uint64_t v125 = [v31 objectForKeyedSubscript:@"hasEverShareInLastMonth"];
                                  v543 = (void *)v125;
                                  if (!v125
                                    || (uint64_t v126 = (void *)v125, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v539 = 0;
                                    goto LABEL_111;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v539 = v126;
LABEL_111:
                                    uint64_t v127 = [v31 objectForKeyedSubscript:@"clickCountInLastWeekNormalizedAcrossItems"];
                                    v541 = (void *)v127;
                                    if (!v127
                                      || (uint64_t v128 = (void *)v127, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v540 = 0;
                                      goto LABEL_114;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v540 = v128;
LABEL_114:
                                      uint64_t v129 = [v31 objectForKeyedSubscript:@"clickCountInLastMonthNormalizedAcrossItems"];
                                      v538 = (void *)v129;
                                      if (!v129
                                        || (uint64_t v130 = (void *)v129, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v537 = 0;
                                        goto LABEL_117;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v537 = v130;
LABEL_117:
                                        uint64_t v131 = [v31 objectForKeyedSubscript:@"shareCountInLastWeekNormalizedAcrossItems"];
                                        v536 = (void *)v131;
                                        if (!v131
                                          || (uint64_t v132 = (void *)v131, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          id v535 = 0;
                                          goto LABEL_120;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v535 = v132;
LABEL_120:
                                          uint64_t v133 = [v31 objectForKeyedSubscript:@"shareCountInLastMonthNormalizedAcrossItems"];
                                          v534 = (void *)v133;
                                          if (!v133
                                            || (uint64_t v134 = (void *)v133,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v135 = 0;
                                            goto LABEL_123;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v135 = v134;
LABEL_123:
                                            uint64_t v136 = [v31 objectForKeyedSubscript:@"clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"];
                                            v533 = v135;
                                            v532 = (void *)v136;
                                            if (!v136
                                              || (uint64_t v137 = (void *)v136,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              id v531 = 0;
                                              goto LABEL_126;
                                            }
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v531 = v137;
LABEL_126:
                                              uint64_t v138 = [v31 objectForKeyedSubscript:@"clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"];
                                              v530 = (void *)v138;
                                              if (!v138
                                                || (uint64_t v139 = (void *)v138,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                id v529 = 0;
                                                goto LABEL_129;
                                              }
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                id v529 = v139;
LABEL_129:
                                                uint64_t v140 = [v31 objectForKeyedSubscript:@"clickCountGivenLocationInLastWeekNormalizedAcrossItems"];
                                                v528 = (void *)v140;
                                                if (!v140
                                                  || (uint64_t v141 = (void *)v140,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  id v527 = 0;
                                                  goto LABEL_132;
                                                }
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  id v527 = v141;
LABEL_132:
                                                  uint64_t v142 = [v31 objectForKeyedSubscript:@"clickCountGivenLocationInLastMonthNormalizedAcrossItems"];
                                                  v526 = (void *)v142;
                                                  if (!v142
                                                    || (uint64_t v143 = (void *)v142,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    id v525 = 0;
                                                    goto LABEL_135;
                                                  }
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v525 = v143;
LABEL_135:
                                                    uint64_t v144 = [v31 objectForKeyedSubscript:@"clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"];
                                                    v524 = (void *)v144;
                                                    if (!v144
                                                      || (uint64_t v145 = (void *)v144,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      id v523 = 0;
LABEL_138:
                                                      uint64_t v146 = [v31 objectForKeyedSubscript:@"clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"];
                                                      v522 = (void *)v146;
                                                      if (v146
                                                        && (uint64_t v147 = (void *)v146,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                      {
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                        {
                                                          if (!v48)
                                                          {
                                                            id v521 = 0;
                                                            double v18 = 0;
                                                            double v65 = v629;
                                                            id v212 = v546;
                                                            double v48 = (id *)v544;
LABEL_482:
                                                            id v242 = v539;
                                                            goto LABEL_483;
                                                          }
                                                          id v306 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                          v596 = v7;
                                                          uint64_t v307 = *MEMORY[0x1E4F502C8];
                                                          uint64_t v685 = *MEMORY[0x1E4F28568];
                                                          id v308 = [NSString alloc];
                                                          uint64_t v462 = objc_opt_class();
                                                          v309 = v308;
                                                          self = v633;
                                                          v310 = (void *)[v309 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v462, @"clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"];
                                                          v686 = v310;
                                                          uint64_t v311 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v686 forKeys:&v685 count:1];
                                                          uint64_t v312 = v307;
                                                          id v7 = v596;
                                                          v519 = (void *)v311;
                                                          double v18 = 0;
                                                          id v521 = 0;
                                                          *double v48 = (id)objc_msgSend(v306, "initWithDomain:code:userInfo:", v312, 2);
                                                          goto LABEL_341;
                                                        }
                                                        id v521 = v147;
                                                      }
                                                      else
                                                      {
                                                        id v521 = 0;
                                                      }
                                                      uint64_t v148 = [v31 objectForKeyedSubscript:@"clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"];
                                                      v519 = (void *)v148;
                                                      if (!v148
                                                        || (uint64_t v149 = (void *)v148,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        id v520 = 0;
                                                        goto LABEL_144;
                                                      }
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        id v520 = v149;
LABEL_144:
                                                        uint64_t v150 = [v31 objectForKeyedSubscript:@"clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"];
                                                        v518 = (void *)v150;
                                                        if (!v150
                                                          || (uint64_t v151 = (void *)v150,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          id v517 = 0;
                                                          goto LABEL_147;
                                                        }
                                                        objc_opt_class();
                                                        if (objc_opt_isKindOfClass())
                                                        {
                                                          id v517 = v151;
LABEL_147:
                                                          uint64_t v152 = [v31 objectForKeyedSubscript:@"clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"];
                                                          v516 = (void *)v152;
                                                          if (!v152
                                                            || (uint64_t v153 = (void *)v152,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            id v515 = 0;
                                                            goto LABEL_150;
                                                          }
                                                          objc_opt_class();
                                                          if (objc_opt_isKindOfClass())
                                                          {
                                                            id v515 = v153;
LABEL_150:
                                                            uint64_t v154 = [v31 objectForKeyedSubscript:@"clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"];
                                                            v514 = (void *)v154;
                                                            if (!v154
                                                              || (uint64_t v155 = (void *)v154,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              id v513 = 0;
                                                              goto LABEL_153;
                                                            }
                                                            objc_opt_class();
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              id v513 = v155;
LABEL_153:
                                                              uint64_t v156 = [v31 objectForKeyedSubscript:@"clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"];
                                                              v512 = (void *)v156;
                                                              if (!v156
                                                                || (double v157 = (void *)v156,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                id v511 = 0;
LABEL_156:
                                                                uint64_t v158 = [v31 objectForKeyedSubscript:@"clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"];
                                                                v510 = (void *)v158;
                                                                if (v158
                                                                  && (double v159 = (void *)v158,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                  {
                                                                    if (!v48)
                                                                    {
                                                                      id v509 = 0;
                                                                      double v18 = 0;
                                                                      double v65 = v629;
                                                                      id v212 = v546;
                                                                      double v48 = (id *)v544;
LABEL_475:
                                                                      v310 = v520;
                                                                      goto LABEL_476;
                                                                    }
                                                                    id v344 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                    v602 = v7;
                                                                    uint64_t v345 = *MEMORY[0x1E4F502C8];
                                                                    uint64_t v673 = *MEMORY[0x1E4F28568];
                                                                    id v346 = [NSString alloc];
                                                                    uint64_t v468 = objc_opt_class();
                                                                    v347 = v346;
                                                                    self = v633;
                                                                    id v508 = (id)[v347 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v468, @"clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"];
                                                                    id v674 = v508;
                                                                    v348 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v674 forKeys:&v673 count:1];
                                                                    uint64_t v349 = v345;
                                                                    id v7 = v602;
                                                                    double v18 = 0;
                                                                    id v509 = 0;
                                                                    *double v48 = (id)[v344 initWithDomain:v349 code:2 userInfo:v348];
                                                                    double v65 = v629;
                                                                    id v212 = v546;
                                                                    double v48 = (id *)v544;
LABEL_474:

                                                                    goto LABEL_475;
                                                                  }
                                                                  id v509 = v159;
                                                                }
                                                                else
                                                                {
                                                                  id v509 = 0;
                                                                }
                                                                uint64_t v160 = [v31 objectForKeyedSubscript:@"shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"];
                                                                v507 = (void *)v160;
                                                                if (v160
                                                                  && (v161 = (void *)v160,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                  {
                                                                    if (!v48)
                                                                    {
                                                                      id v508 = 0;
                                                                      double v18 = 0;
                                                                      double v65 = v629;
                                                                      id v212 = v546;
                                                                      double v48 = (id *)v544;
LABEL_473:
                                                                      v348 = v507;
                                                                      goto LABEL_474;
                                                                    }
                                                                    id v350 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                    v603 = v7;
                                                                    uint64_t v351 = *MEMORY[0x1E4F502C8];
                                                                    uint64_t v671 = *MEMORY[0x1E4F28568];
                                                                    id v352 = [NSString alloc];
                                                                    uint64_t v469 = objc_opt_class();
                                                                    v353 = v352;
                                                                    self = v633;
                                                                    id v506 = (id)[v353 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v469, @"shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"];
                                                                    id v672 = v506;
                                                                    v163 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v672 forKeys:&v671 count:1];
                                                                    uint64_t v354 = v351;
                                                                    id v7 = v603;
                                                                    double v18 = 0;
                                                                    id v508 = 0;
                                                                    *double v48 = (id)[v350 initWithDomain:v354 code:2 userInfo:v163];
                                                                    goto LABEL_377;
                                                                  }
                                                                  id v508 = v161;
                                                                }
                                                                else
                                                                {
                                                                  id v508 = 0;
                                                                }
                                                                uint64_t v162 = [v31 objectForKeyedSubscript:@"shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"];
                                                                v504 = (void *)v162;
                                                                if (!v162
                                                                  || (v163 = (void *)v162,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  id v506 = 0;
                                                                  goto LABEL_165;
                                                                }
                                                                objc_opt_class();
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  id v506 = v163;
LABEL_165:
                                                                  uint64_t v164 = [v31 objectForKeyedSubscript:@"shareCountGivenLocationInLastWeekNormalizedAcrossItems"];
                                                                  v505 = (void *)v164;
                                                                  if (!v164
                                                                    || (v165 = (void *)v164,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    id v503 = 0;
                                                                    goto LABEL_168;
                                                                  }
                                                                  objc_opt_class();
                                                                  if (objc_opt_isKindOfClass())
                                                                  {
                                                                    id v503 = v165;
LABEL_168:
                                                                    uint64_t v166 = [v31 objectForKeyedSubscript:@"shareCountGivenLocationInLastMonthNormalizedAcrossItems"];
                                                                    v502 = (void *)v166;
                                                                    if (!v166
                                                                      || (v167 = (void *)v166,
                                                                          objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      id v501 = 0;
                                                                      goto LABEL_171;
                                                                    }
                                                                    objc_opt_class();
                                                                    if (objc_opt_isKindOfClass())
                                                                    {
                                                                      id v501 = v167;
LABEL_171:
                                                                      uint64_t v168 = [v31 objectForKeyedSubscript:@"shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"];
                                                                      v500 = (void *)v168;
                                                                      if (!v168
                                                                        || (v169 = (void *)v168,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        id v499 = 0;
                                                                        goto LABEL_174;
                                                                      }
                                                                      objc_opt_class();
                                                                      if (objc_opt_isKindOfClass())
                                                                      {
                                                                        id v499 = v169;
LABEL_174:
                                                                        uint64_t v170 = [v31 objectForKeyedSubscript:@"shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"];
                                                                        v498 = (void *)v170;
                                                                        if (!v170
                                                                          || (v171 = (void *)v170,
                                                                              objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                        {
                                                                          id v497 = 0;
                                                                          goto LABEL_177;
                                                                        }
                                                                        objc_opt_class();
                                                                        if (objc_opt_isKindOfClass())
                                                                        {
                                                                          id v497 = v171;
LABEL_177:
                                                                          uint64_t v172 = [v31 objectForKeyedSubscript:@"shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"];
                                                                          v495 = (void *)v172;
                                                                          if (!v172
                                                                            || (v173 = (void *)v172,
                                                                                objc_opt_class(),
                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                          {
                                                                            id v496 = 0;
                                                                            goto LABEL_180;
                                                                          }
                                                                          objc_opt_class();
                                                                          if (objc_opt_isKindOfClass())
                                                                          {
                                                                            id v496 = v173;
LABEL_180:
                                                                            uint64_t v174 = [v31 objectForKeyedSubscript:@"shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"];
                                                                            v493 = (void *)v174;
                                                                            if (!v174
                                                                              || (v175 = (void *)v174,
                                                                                  objc_opt_class(),
                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                            {
                                                                              id v494 = 0;
                                                                              goto LABEL_183;
                                                                            }
                                                                            objc_opt_class();
                                                                            if (objc_opt_isKindOfClass())
                                                                            {
                                                                              id v494 = v175;
LABEL_183:
                                                                              v492 = [v31 objectForKeyedSubscript:@"shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"];
                                                                              if (!v492
                                                                                || (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                              {
                                                                                id v491 = 0;
                                                                                goto LABEL_186;
                                                                              }
                                                                              objc_opt_class();
                                                                              if (objc_opt_isKindOfClass())
                                                                              {
                                                                                id v491 = v492;
LABEL_186:
                                                                                v490 = [v31 objectForKeyedSubscript:@"shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"];
                                                                                if (!v490
                                                                                  || (objc_opt_class(),
                                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                                {
                                                                                  id v489 = 0;
                                                                                  goto LABEL_189;
                                                                                }
                                                                                objc_opt_class();
                                                                                if (objc_opt_isKindOfClass())
                                                                                {
                                                                                  id v489 = v490;
LABEL_189:
                                                                                  v488 = [v31 objectForKeyedSubscript:@"shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"];
                                                                                  if (!v488
                                                                                    || (objc_opt_class(),
                                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                                  {
                                                                                    id v487 = 0;
                                                                                    goto LABEL_192;
                                                                                  }
                                                                                  objc_opt_class();
                                                                                  if (objc_opt_isKindOfClass())
                                                                                  {
                                                                                    id v487 = v488;
LABEL_192:
                                                                                    v485 = [v31 objectForKeyedSubscript:@"shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"];
                                                                                    if (!v485
                                                                                      || (objc_opt_class(),
                                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                                    {
                                                                                      id v486 = 0;
                                                                                      goto LABEL_195;
                                                                                    }
                                                                                    objc_opt_class();
                                                                                    if (objc_opt_isKindOfClass())
                                                                                    {
                                                                                      id v486 = v485;
LABEL_195:
                                                                                      [v31 objectForKeyedSubscript:@"clipScore"];
                                                                                      v484 = v625 = v49;
                                                                                      if (!v484
                                                                                        || (objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                                      {
                                                                                        id v483 = 0;
                                                                                        goto LABEL_198;
                                                                                      }
                                                                                      v395 = self;
                                                                                      objc_opt_class();
                                                                                      if (objc_opt_isKindOfClass())
                                                                                      {
                                                                                        id v483 = v484;
LABEL_198:
                                                                                        v482 = [v31 objectForKeyedSubscript:@"clicked"];
                                                                                        if (!v482
                                                                                          || (objc_opt_class(),
                                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                                        {
                                                                                          id v481 = 0;
                                                                                          goto LABEL_201;
                                                                                        }
                                                                                        v395 = self;
                                                                                        objc_opt_class();
                                                                                        if (objc_opt_isKindOfClass())
                                                                                        {
                                                                                          id v481 = v482;
LABEL_201:
                                                                                          uint64_t v176 = [v31 objectForKeyedSubscript:@"clickOrder"];
                                                                                          v552 = v48;
                                                                                          v479 = (void *)v176;
                                                                                          if (!v176
                                                                                            || (v177 = (void *)v176,
                                                                                                objc_opt_class(),
                                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                                          {
                                                                                            id v480 = 0;
                                                                                            id v178 = v610;
                                                                                            id v179 = v562;
                                                                                            goto LABEL_204;
                                                                                          }
                                                                                          id v179 = v562;
                                                                                          objc_opt_class();
                                                                                          if (objc_opt_isKindOfClass())
                                                                                          {
                                                                                            id v480 = v177;
                                                                                            id v178 = v610;
LABEL_204:
                                                                                            id v610 = v178;
                                                                                            [v31 objectForKeyedSubscript:@"itemPosition"];
                                                                                            v477 = id v562 = v179;
                                                                                            if (!v477
                                                                                              || (objc_opt_class(),
                                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                                            {
                                                                                              id v478 = 0;
                                                                                              v180 = v613;
                                                                                              v181 = v31;
                                                                                              goto LABEL_207;
                                                                                            }
                                                                                            objc_opt_class();
                                                                                            if (objc_opt_isKindOfClass())
                                                                                            {
                                                                                              id v478 = v477;
                                                                                              v181 = v31;
                                                                                              v180 = v613;
LABEL_207:
                                                                                              double v31 = v181;
                                                                                              v582 = [v181 objectForKeyedSubscript:@"L2ModelScore"];
                                                                                              if (v582)
                                                                                              {
                                                                                                v182 = v7;
                                                                                                v183 = self;
                                                                                                objc_opt_class();
                                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                {
                                                                                                  objc_opt_class();
                                                                                                  if (objc_opt_isKindOfClass())
                                                                                                  {
                                                                                                    id v617 = v582;
                                                                                                    goto LABEL_400;
                                                                                                  }
                                                                                                  if (v552)
                                                                                                  {
                                                                                                    id v424 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                    uint64_t v425 = *MEMORY[0x1E4F502C8];
                                                                                                    uint64_t v639 = *MEMORY[0x1E4F28568];
                                                                                                    v475 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"L2ModelScore"];
                                                                                                    v640 = v475;
                                                                                                    v476 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v640 forKeys:&v639 count:1];
                                                                                                    double v18 = 0;
                                                                                                    id v617 = 0;
                                                                                                    id *v552 = (id)objc_msgSend(v424, "initWithDomain:code:userInfo:", v425, 2);
                                                                                                    goto LABEL_453;
                                                                                                  }
                                                                                                  id v617 = 0;
                                                                                                  double v18 = 0;
                                                                                                  double v49 = v625;
LABEL_451:
                                                                                                  double v65 = v629;
                                                                                                  id v212 = v546;
                                                                                                  double v48 = (id *)v544;
                                                                                                  id v359 = v520;
LABEL_457:

                                                                                                  goto LABEL_458;
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                v182 = v7;
                                                                                                v183 = self;
                                                                                              }
                                                                                              id v617 = 0;
LABEL_400:
                                                                                              v476 = [v31 objectForKeyedSubscript:@"isDuplicate"];
                                                                                              if (!v476
                                                                                                || (objc_opt_class(),
                                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                                              {
                                                                                                id v408 = 0;
LABEL_403:
                                                                                                id v409 = [v31 objectForKeyedSubscript:@"isCompleteMatch"];
                                                                                                v475 = v408;
                                                                                                if (!v409)
                                                                                                {
                                                                                                  v410 = 0;
                                                                                                  goto LABEL_424;
                                                                                                }
                                                                                                objc_opt_class();
                                                                                                v410 = v409;
                                                                                                if (objc_opt_isKindOfClass())
                                                                                                {
                                                                                                  id v409 = 0;
LABEL_424:
                                                                                                  uint64_t v419 = [v180 intValue];
                                                                                                  double v48 = (id *)v544;
                                                                                                  self = [(BMAeroMLPhotosSearchLabeledData *)v183 initWithSearchSessionUUID:v634 uiSurface:v419 matchedPeopleRatio:v632 matchedLocationRatio:v561 matchedSceneRatio:v630 matchedSceneConfidence:v549 matchedSceneBoundingBox:v610 matchedOCRCharacterRatio:v574 matchedOCRImportance:v575 matchedFieldsCount:v571 L1Score:v568 freshness:v565 favorited:v562 aestheticScore:v558 curationScore:v559 hasEverClickInLastWeek:v547 hasEverClickInLastMonth:v544 hasEverShareInLastWeek:v542 hasEverShareInLastMonth:v539 clickCountInLastWeekNormalizedAcrossItems:v540 clickCountInLastMonthNormalizedAcrossItems:v537 shareCountInLastWeekNormalizedAcrossItems:v535 shareCountInLastMonthNormalizedAcrossItems:v533 clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:v531 clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:v529 clickCountGivenLocationInLastWeekNormalizedAcrossItems:v527 clickCountGivenLocationInLastMonthNormalizedAcrossItems:v525 clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:v523 clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:v521 clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:v520 clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:v517 clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:v515 clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:v513 clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:v511 clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:v509 shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:v508 shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:v506 shareCountGivenLocationInLastWeekNormalizedAcrossItems:v503 shareCountGivenLocationInLastMonthNormalizedAcrossItems:v501 shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:v499 shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:v497 shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:v496 shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:v494 shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:v491 shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:v489 shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:v487 shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:v486 clipScore:v483 clicked:v481 clickOrder:v480 itemPosition:v478 L2ModelScore:v617 isDuplicate:v408 isCompleteMatch:v409];
                                                                                                  double v18 = self;
                                                                                                  id v7 = v182;
                                                                                                  double v49 = v625;
                                                                                                  id v212 = v546;
LABEL_455:

                                                                                                  double v65 = v629;
                                                                                                  goto LABEL_456;
                                                                                                }
                                                                                                objc_opt_class();
                                                                                                if (objc_opt_isKindOfClass())
                                                                                                {
                                                                                                  v410 = v409;
                                                                                                  id v409 = v409;
                                                                                                  goto LABEL_424;
                                                                                                }
                                                                                                if (!v552)
                                                                                                {
                                                                                                  double v18 = 0;
                                                                                                  self = v183;
                                                                                                  double v49 = v625;
                                                                                                  id v7 = v182;
                                                                                                  id v212 = v546;
                                                                                                  double v48 = (id *)v544;
                                                                                                  v410 = v409;
                                                                                                  id v409 = 0;
                                                                                                  goto LABEL_455;
                                                                                                }
                                                                                                id v431 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                uint64_t v432 = *MEMORY[0x1E4F502C8];
                                                                                                uint64_t v635 = *MEMORY[0x1E4F28568];
                                                                                                v433 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isCompleteMatch"];
                                                                                                v636 = v433;
                                                                                                v434 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v636 forKeys:&v635 count:1];
                                                                                                uint64_t v435 = v432;
                                                                                                v410 = v409;
                                                                                                id *v552 = (id)[v431 initWithDomain:v435 code:2 userInfo:v434];

                                                                                                id v409 = 0;
                                                                                                double v18 = 0;
                                                                                                self = v183;
                                                                                                double v49 = v625;
                                                                                                id v7 = v182;
LABEL_443:
                                                                                                id v212 = v546;
                                                                                                double v48 = (id *)v544;
                                                                                                goto LABEL_455;
                                                                                              }
                                                                                              objc_opt_class();
                                                                                              if (objc_opt_isKindOfClass())
                                                                                              {
                                                                                                id v408 = v476;
                                                                                                goto LABEL_403;
                                                                                              }
                                                                                              if (v552)
                                                                                              {
                                                                                                id v426 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                uint64_t v427 = *MEMORY[0x1E4F502C8];
                                                                                                uint64_t v637 = *MEMORY[0x1E4F28568];
                                                                                                uint64_t v428 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isDuplicate"];
                                                                                                uint64_t v638 = v428;
                                                                                                uint64_t v429 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v638 forKeys:&v637 count:1];
                                                                                                uint64_t v430 = v427;
                                                                                                v410 = (void *)v429;
                                                                                                double v18 = 0;
                                                                                                v475 = 0;
                                                                                                id *v552 = (id)[v426 initWithDomain:v430 code:2 userInfo:v429];
                                                                                                self = v183;
                                                                                                double v49 = v625;
                                                                                                id v7 = v182;
                                                                                                id v409 = (id)v428;
                                                                                                goto LABEL_443;
                                                                                              }
                                                                                              v475 = 0;
                                                                                              double v18 = 0;
LABEL_453:
                                                                                              self = v183;
                                                                                              double v49 = v625;
                                                                                              id v7 = v182;
                                                                                              double v65 = v629;
                                                                                              id v212 = v546;
                                                                                              double v48 = (id *)v544;
LABEL_456:
                                                                                              id v359 = v520;

                                                                                              goto LABEL_457;
                                                                                            }
                                                                                            if (v552)
                                                                                            {
                                                                                              id v422 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                              uint64_t v423 = *MEMORY[0x1E4F502C8];
                                                                                              uint64_t v641 = *MEMORY[0x1E4F28568];
                                                                                              id v617 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"itemPosition"];
                                                                                              id v642 = v617;
                                                                                              v582 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v642 forKeys:&v641 count:1];
                                                                                              double v18 = 0;
                                                                                              id v478 = 0;
                                                                                              id *v552 = (id)objc_msgSend(v422, "initWithDomain:code:userInfo:", v423, 2);
                                                                                              goto LABEL_451;
                                                                                            }
                                                                                            id v478 = 0;
                                                                                            double v18 = 0;
LABEL_449:
                                                                                            double v65 = v629;
                                                                                            id v212 = v546;
                                                                                            double v48 = (id *)v544;
                                                                                            id v359 = v520;
LABEL_458:

                                                                                            goto LABEL_459;
                                                                                          }
                                                                                          v620 = v31;
                                                                                          v609 = v7;
                                                                                          if (v552)
                                                                                          {
                                                                                            id v420 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                            uint64_t v421 = *MEMORY[0x1E4F502C8];
                                                                                            uint64_t v643 = *MEMORY[0x1E4F28568];
                                                                                            id v478 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clickOrder"];
                                                                                            id v644 = v478;
                                                                                            v477 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v644 forKeys:&v643 count:1];
                                                                                            double v18 = 0;
                                                                                            id v480 = 0;
                                                                                            id *v552 = (id)objc_msgSend(v420, "initWithDomain:code:userInfo:", v421, 2);
                                                                                            id v7 = v609;
                                                                                            goto LABEL_449;
                                                                                          }
                                                                                          id v480 = 0;
                                                                                          double v18 = 0;
LABEL_447:
                                                                                          id v7 = v609;
                                                                                          double v31 = v620;
                                                                                          double v65 = v629;
                                                                                          id v212 = v546;
                                                                                          double v48 = (id *)v544;
                                                                                          id v359 = v520;
LABEL_459:

                                                                                          goto LABEL_460;
                                                                                        }
                                                                                        v620 = v31;
                                                                                        v609 = v7;
                                                                                        if (v48)
                                                                                        {
                                                                                          id v417 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                          uint64_t v418 = *MEMORY[0x1E4F502C8];
                                                                                          uint64_t v645 = *MEMORY[0x1E4F28568];
                                                                                          id v480 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clicked"];
                                                                                          id v646 = v480;
                                                                                          v479 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v646 forKeys:&v645 count:1];
                                                                                          double v18 = 0;
                                                                                          id v481 = 0;
                                                                                          *double v48 = (id)objc_msgSend(v417, "initWithDomain:code:userInfo:", v418, 2);
                                                                                          goto LABEL_447;
                                                                                        }
                                                                                        id v481 = 0;
                                                                                        double v18 = 0;
LABEL_445:
                                                                                        self = v395;
                                                                                        id v7 = v609;
                                                                                        double v31 = v620;
                                                                                        double v65 = v629;
                                                                                        id v212 = v546;
                                                                                        double v48 = (id *)v544;
                                                                                        id v359 = v520;
LABEL_460:

                                                                                        goto LABEL_461;
                                                                                      }
                                                                                      v620 = v31;
                                                                                      v609 = v7;
                                                                                      if (v48)
                                                                                      {
                                                                                        id v415 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                        uint64_t v416 = *MEMORY[0x1E4F502C8];
                                                                                        uint64_t v647 = *MEMORY[0x1E4F28568];
                                                                                        id v481 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"clipScore"];
                                                                                        id v648 = v481;
                                                                                        v482 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v648 forKeys:&v647 count:1];
                                                                                        double v18 = 0;
                                                                                        id v483 = 0;
                                                                                        *double v48 = (id)objc_msgSend(v415, "initWithDomain:code:userInfo:", v416, 2);
                                                                                        goto LABEL_445;
                                                                                      }
                                                                                      id v483 = 0;
                                                                                      double v18 = 0;
                                                                                      double v65 = v629;
                                                                                      id v212 = v546;
                                                                                      double v48 = (id *)v544;
LABEL_440:
                                                                                      id v359 = v520;
LABEL_461:

                                                                                      goto LABEL_462;
                                                                                    }
                                                                                    v386 = v49;
                                                                                    v387 = self;
                                                                                    if (v48)
                                                                                    {
                                                                                      v411 = v48;
                                                                                      id v412 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                      uint64_t v413 = *MEMORY[0x1E4F502C8];
                                                                                      uint64_t v649 = *MEMORY[0x1E4F28568];
                                                                                      id v483 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"];
                                                                                      id v650 = v483;
                                                                                      v484 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v650 forKeys:&v649 count:1];
                                                                                      id v414 = (id)objc_msgSend(v412, "initWithDomain:code:userInfo:", v413, 2);
                                                                                      double v18 = 0;
                                                                                      id v486 = 0;
                                                                                      id *v411 = v414;
                                                                                      double v65 = v629;
                                                                                      id v212 = v546;
                                                                                      double v48 = (id *)v544;
                                                                                      double v49 = v386;
                                                                                      goto LABEL_440;
                                                                                    }
                                                                                    id v486 = 0;
                                                                                    double v18 = 0;
LABEL_436:
                                                                                    self = v387;
                                                                                    double v65 = v629;
                                                                                    id v212 = v546;
                                                                                    double v48 = (id *)v544;
                                                                                    double v49 = v386;
                                                                                    id v359 = v520;
LABEL_462:

                                                                                    goto LABEL_463;
                                                                                  }
                                                                                  v386 = v49;
                                                                                  v387 = self;
                                                                                  if (v48)
                                                                                  {
                                                                                    v404 = v48;
                                                                                    id v405 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                    uint64_t v406 = *MEMORY[0x1E4F502C8];
                                                                                    uint64_t v651 = *MEMORY[0x1E4F28568];
                                                                                    id v486 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"];
                                                                                    id v652 = v486;
                                                                                    v485 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v652 forKeys:&v651 count:1];
                                                                                    id v407 = (id)objc_msgSend(v405, "initWithDomain:code:userInfo:", v406, 2);
                                                                                    double v18 = 0;
                                                                                    id v487 = 0;
                                                                                    id *v404 = v407;
                                                                                    goto LABEL_436;
                                                                                  }
                                                                                  id v487 = 0;
                                                                                  double v18 = 0;
LABEL_432:
                                                                                  self = v387;
                                                                                  double v65 = v629;
                                                                                  id v212 = v546;
                                                                                  double v48 = (id *)v544;
                                                                                  double v49 = v386;
                                                                                  id v359 = v520;
LABEL_463:

                                                                                  goto LABEL_464;
                                                                                }
                                                                                v386 = v49;
                                                                                v387 = self;
                                                                                if (v48)
                                                                                {
                                                                                  v400 = v48;
                                                                                  id v401 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                  uint64_t v402 = *MEMORY[0x1E4F502C8];
                                                                                  uint64_t v653 = *MEMORY[0x1E4F28568];
                                                                                  id v487 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"];
                                                                                  id v654 = v487;
                                                                                  v488 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v654 forKeys:&v653 count:1];
                                                                                  id v403 = (id)objc_msgSend(v401, "initWithDomain:code:userInfo:", v402, 2);
                                                                                  double v18 = 0;
                                                                                  id v489 = 0;
                                                                                  id *v400 = v403;
                                                                                  goto LABEL_432;
                                                                                }
                                                                                id v489 = 0;
                                                                                double v18 = 0;
LABEL_428:
                                                                                self = v387;
                                                                                double v65 = v629;
                                                                                id v212 = v546;
                                                                                double v48 = (id *)v544;
                                                                                double v49 = v386;
                                                                                id v359 = v520;
LABEL_464:

                                                                                goto LABEL_465;
                                                                              }
                                                                              v386 = v49;
                                                                              v387 = self;
                                                                              if (v48)
                                                                              {
                                                                                v396 = v48;
                                                                                id v397 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                uint64_t v398 = *MEMORY[0x1E4F502C8];
                                                                                uint64_t v655 = *MEMORY[0x1E4F28568];
                                                                                id v489 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"];
                                                                                id v656 = v489;
                                                                                v490 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v656 forKeys:&v655 count:1];
                                                                                id v399 = (id)objc_msgSend(v397, "initWithDomain:code:userInfo:", v398, 2);
                                                                                double v18 = 0;
                                                                                id v491 = 0;
                                                                                id *v396 = v399;
                                                                                goto LABEL_428;
                                                                              }
                                                                              id v491 = 0;
                                                                              double v18 = 0;
LABEL_421:
                                                                              self = v387;
                                                                              double v65 = v629;
                                                                              id v212 = v546;
                                                                              double v48 = (id *)v544;
                                                                              double v49 = v386;
                                                                              id v359 = v520;
LABEL_465:

                                                                              goto LABEL_466;
                                                                            }
                                                                            v386 = v49;
                                                                            v387 = self;
                                                                            if (v48)
                                                                            {
                                                                              v391 = v48;
                                                                              id v392 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                              uint64_t v393 = *MEMORY[0x1E4F502C8];
                                                                              uint64_t v657 = *MEMORY[0x1E4F28568];
                                                                              id v491 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"];
                                                                              id v658 = v491;
                                                                              v492 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v658 forKeys:&v657 count:1];
                                                                              id v394 = (id)objc_msgSend(v392, "initWithDomain:code:userInfo:", v393, 2);
                                                                              double v18 = 0;
                                                                              id v494 = 0;
                                                                              id *v391 = v394;
                                                                              goto LABEL_421;
                                                                            }
                                                                            id v494 = 0;
                                                                            double v18 = 0;
LABEL_414:
                                                                            self = v387;
                                                                            double v65 = v629;
                                                                            id v212 = v546;
                                                                            double v48 = (id *)v544;
                                                                            double v49 = v386;
                                                                            id v359 = v520;
LABEL_466:

                                                                            goto LABEL_467;
                                                                          }
                                                                          v386 = v49;
                                                                          v387 = self;
                                                                          if (v48)
                                                                          {
                                                                            v388 = v48;
                                                                            id v389 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                            uint64_t v390 = *MEMORY[0x1E4F502C8];
                                                                            uint64_t v659 = *MEMORY[0x1E4F28568];
                                                                            id v494 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"];
                                                                            id v660 = v494;
                                                                            v493 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v660 forKeys:&v659 count:1];
                                                                            double v18 = 0;
                                                                            id v496 = 0;
                                                                            id *v388 = (id)objc_msgSend(v389, "initWithDomain:code:userInfo:", v390, 2);
                                                                            goto LABEL_414;
                                                                          }
                                                                          id v496 = 0;
                                                                          double v18 = 0;
                                                                          double v65 = v629;
                                                                          id v212 = v546;
                                                                          double v48 = (id *)v544;
                                                                          id v359 = v520;
LABEL_467:

                                                                          goto LABEL_468;
                                                                        }
                                                                        if (v48)
                                                                        {
                                                                          id v380 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                          v608 = v7;
                                                                          uint64_t v381 = *MEMORY[0x1E4F502C8];
                                                                          uint64_t v661 = *MEMORY[0x1E4F28568];
                                                                          id v382 = [NSString alloc];
                                                                          uint64_t v474 = objc_opt_class();
                                                                          v383 = v382;
                                                                          self = v633;
                                                                          id v359 = v520;
                                                                          id v496 = (id)[v383 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v474, @"shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"];
                                                                          id v662 = v496;
                                                                          uint64_t v384 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v662 forKeys:&v661 count:1];
                                                                          uint64_t v385 = v381;
                                                                          id v7 = v608;
                                                                          v495 = (void *)v384;
                                                                          double v18 = 0;
                                                                          id v497 = 0;
                                                                          *double v48 = (id)objc_msgSend(v380, "initWithDomain:code:userInfo:", v385, 2);
                                                                          double v65 = v629;
                                                                          id v212 = v546;
                                                                          double v48 = (id *)v544;
                                                                          goto LABEL_467;
                                                                        }
                                                                        id v497 = 0;
                                                                        double v18 = 0;
                                                                        double v65 = v629;
                                                                        id v212 = v546;
                                                                        double v48 = (id *)v544;
                                                                        id v359 = v520;
LABEL_468:

                                                                        goto LABEL_469;
                                                                      }
                                                                      if (v48)
                                                                      {
                                                                        id v374 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                        v607 = v7;
                                                                        uint64_t v375 = *MEMORY[0x1E4F502C8];
                                                                        uint64_t v663 = *MEMORY[0x1E4F28568];
                                                                        id v376 = [NSString alloc];
                                                                        uint64_t v473 = objc_opt_class();
                                                                        v377 = v376;
                                                                        self = v633;
                                                                        id v359 = v520;
                                                                        id v497 = (id)[v377 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v473, @"shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"];
                                                                        id v664 = v497;
                                                                        uint64_t v378 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v664 forKeys:&v663 count:1];
                                                                        uint64_t v379 = v375;
                                                                        id v7 = v607;
                                                                        v498 = (void *)v378;
                                                                        double v18 = 0;
                                                                        id v499 = 0;
                                                                        *double v48 = (id)objc_msgSend(v374, "initWithDomain:code:userInfo:", v379, 2);
                                                                        double v65 = v629;
                                                                        id v212 = v546;
                                                                        double v48 = (id *)v544;
                                                                        goto LABEL_468;
                                                                      }
                                                                      id v499 = 0;
                                                                      double v18 = 0;
                                                                      double v65 = v629;
                                                                      id v212 = v546;
                                                                      double v48 = (id *)v544;
                                                                      id v359 = v520;
LABEL_469:

                                                                      goto LABEL_470;
                                                                    }
                                                                    if (v48)
                                                                    {
                                                                      id v368 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                      v606 = v7;
                                                                      uint64_t v369 = *MEMORY[0x1E4F502C8];
                                                                      uint64_t v665 = *MEMORY[0x1E4F28568];
                                                                      id v370 = [NSString alloc];
                                                                      uint64_t v472 = objc_opt_class();
                                                                      v371 = v370;
                                                                      self = v633;
                                                                      id v359 = v520;
                                                                      id v499 = (id)[v371 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v472, @"shareCountGivenLocationInLastMonthNormalizedAcrossItems"];
                                                                      id v666 = v499;
                                                                      uint64_t v372 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v666 forKeys:&v665 count:1];
                                                                      uint64_t v373 = v369;
                                                                      id v7 = v606;
                                                                      v500 = (void *)v372;
                                                                      double v18 = 0;
                                                                      id v501 = 0;
                                                                      *double v48 = (id)objc_msgSend(v368, "initWithDomain:code:userInfo:", v373, 2);
                                                                      double v65 = v629;
                                                                      id v212 = v546;
                                                                      double v48 = (id *)v544;
                                                                      goto LABEL_469;
                                                                    }
                                                                    id v501 = 0;
                                                                    double v18 = 0;
                                                                    double v65 = v629;
                                                                    id v212 = v546;
                                                                    double v48 = (id *)v544;
                                                                    id v359 = v520;
LABEL_470:

                                                                    goto LABEL_471;
                                                                  }
                                                                  if (v48)
                                                                  {
                                                                    id v362 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                    v605 = v7;
                                                                    uint64_t v363 = *MEMORY[0x1E4F502C8];
                                                                    uint64_t v667 = *MEMORY[0x1E4F28568];
                                                                    id v364 = [NSString alloc];
                                                                    uint64_t v471 = objc_opt_class();
                                                                    v365 = v364;
                                                                    self = v633;
                                                                    id v359 = v520;
                                                                    id v501 = (id)[v365 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v471, @"shareCountGivenLocationInLastWeekNormalizedAcrossItems"];
                                                                    id v668 = v501;
                                                                    uint64_t v366 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v668 forKeys:&v667 count:1];
                                                                    uint64_t v367 = v363;
                                                                    id v7 = v605;
                                                                    v502 = (void *)v366;
                                                                    double v18 = 0;
                                                                    id v503 = 0;
                                                                    *double v48 = (id)objc_msgSend(v362, "initWithDomain:code:userInfo:", v367, 2);
                                                                    double v65 = v629;
                                                                    id v212 = v546;
                                                                    double v48 = (id *)v544;
                                                                    goto LABEL_470;
                                                                  }
                                                                  id v503 = 0;
                                                                  double v18 = 0;
                                                                  double v65 = v629;
                                                                  id v212 = v546;
                                                                  double v48 = (id *)v544;
                                                                  id v359 = v520;
LABEL_471:
                                                                  id v520 = v359;

                                                                  v163 = v504;
                                                                  goto LABEL_472;
                                                                }
                                                                if (v48)
                                                                {
                                                                  id v355 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                  v604 = v7;
                                                                  uint64_t v356 = *MEMORY[0x1E4F502C8];
                                                                  uint64_t v669 = *MEMORY[0x1E4F28568];
                                                                  id v357 = [NSString alloc];
                                                                  uint64_t v470 = objc_opt_class();
                                                                  v358 = v357;
                                                                  self = v633;
                                                                  id v359 = v520;
                                                                  id v503 = (id)[v358 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v470, @"shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"];
                                                                  id v670 = v503;
                                                                  uint64_t v360 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v670 forKeys:&v669 count:1];
                                                                  uint64_t v361 = v356;
                                                                  id v7 = v604;
                                                                  v505 = (void *)v360;
                                                                  double v18 = 0;
                                                                  id v506 = 0;
                                                                  *double v48 = (id)objc_msgSend(v355, "initWithDomain:code:userInfo:", v361, 2);
                                                                  double v65 = v629;
                                                                  id v212 = v546;
                                                                  double v48 = (id *)v544;
                                                                  goto LABEL_471;
                                                                }
                                                                id v506 = 0;
                                                                double v18 = 0;
LABEL_377:
                                                                double v65 = v629;
                                                                id v212 = v546;
                                                                double v48 = (id *)v544;
LABEL_472:

                                                                goto LABEL_473;
                                                              }
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass())
                                                              {
                                                                id v511 = v157;
                                                                goto LABEL_156;
                                                              }
                                                              if (v48)
                                                              {
                                                                id v338 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                v601 = v7;
                                                                uint64_t v339 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v675 = *MEMORY[0x1E4F28568];
                                                                id v340 = [NSString alloc];
                                                                uint64_t v467 = objc_opt_class();
                                                                v341 = v340;
                                                                self = v633;
                                                                v310 = v520;
                                                                id v509 = (id)[v341 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v467, @"clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"];
                                                                id v676 = v509;
                                                                uint64_t v342 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v676 forKeys:&v675 count:1];
                                                                uint64_t v343 = v339;
                                                                id v7 = v601;
                                                                v510 = (void *)v342;
                                                                double v18 = 0;
                                                                id v511 = 0;
                                                                *double v48 = (id)objc_msgSend(v338, "initWithDomain:code:userInfo:", v343, 2);
                                                                double v65 = v629;
                                                                id v212 = v546;
                                                                double v48 = (id *)v544;
LABEL_476:

                                                                goto LABEL_477;
                                                              }
                                                              id v511 = 0;
                                                              double v18 = 0;
                                                              double v65 = v629;
                                                              id v212 = v546;
                                                              double v48 = (id *)v544;
                                                              v310 = v520;
LABEL_477:

                                                              goto LABEL_478;
                                                            }
                                                            if (v48)
                                                            {
                                                              id v332 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                              v600 = v7;
                                                              uint64_t v333 = *MEMORY[0x1E4F502C8];
                                                              uint64_t v677 = *MEMORY[0x1E4F28568];
                                                              id v334 = [NSString alloc];
                                                              uint64_t v466 = objc_opt_class();
                                                              v335 = v334;
                                                              self = v633;
                                                              v310 = v520;
                                                              id v511 = (id)[v335 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v466, @"clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"];
                                                              id v678 = v511;
                                                              uint64_t v336 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v678 forKeys:&v677 count:1];
                                                              uint64_t v337 = v333;
                                                              id v7 = v600;
                                                              v512 = (void *)v336;
                                                              double v18 = 0;
                                                              id v513 = 0;
                                                              *double v48 = (id)objc_msgSend(v332, "initWithDomain:code:userInfo:", v337, 2);
                                                              double v65 = v629;
                                                              id v212 = v546;
                                                              double v48 = (id *)v544;
                                                              goto LABEL_477;
                                                            }
                                                            id v513 = 0;
                                                            double v18 = 0;
                                                            double v65 = v629;
                                                            id v212 = v546;
                                                            double v48 = (id *)v544;
                                                            v310 = v520;
LABEL_478:

                                                            goto LABEL_479;
                                                          }
                                                          if (v48)
                                                          {
                                                            id v326 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            v599 = v7;
                                                            uint64_t v327 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v679 = *MEMORY[0x1E4F28568];
                                                            id v328 = [NSString alloc];
                                                            uint64_t v465 = objc_opt_class();
                                                            v329 = v328;
                                                            self = v633;
                                                            v310 = v520;
                                                            id v513 = (id)[v329 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v465, @"clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"];
                                                            id v680 = v513;
                                                            uint64_t v330 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v680 forKeys:&v679 count:1];
                                                            uint64_t v331 = v327;
                                                            id v7 = v599;
                                                            v514 = (void *)v330;
                                                            double v18 = 0;
                                                            id v515 = 0;
                                                            *double v48 = (id)objc_msgSend(v326, "initWithDomain:code:userInfo:", v331, 2);
                                                            double v65 = v629;
                                                            id v212 = v546;
                                                            double v48 = (id *)v544;
                                                            goto LABEL_478;
                                                          }
                                                          id v515 = 0;
                                                          double v18 = 0;
                                                          double v65 = v629;
                                                          id v212 = v546;
                                                          double v48 = (id *)v544;
                                                          v310 = v520;
LABEL_479:

                                                          goto LABEL_480;
                                                        }
                                                        if (v48)
                                                        {
                                                          id v320 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                          v598 = v7;
                                                          uint64_t v321 = *MEMORY[0x1E4F502C8];
                                                          uint64_t v681 = *MEMORY[0x1E4F28568];
                                                          id v322 = [NSString alloc];
                                                          uint64_t v464 = objc_opt_class();
                                                          v323 = v322;
                                                          self = v633;
                                                          v310 = v520;
                                                          id v515 = (id)[v323 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v464, @"clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"];
                                                          id v682 = v515;
                                                          uint64_t v324 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v682 forKeys:&v681 count:1];
                                                          uint64_t v325 = v321;
                                                          id v7 = v598;
                                                          v516 = (void *)v324;
                                                          double v18 = 0;
                                                          id v517 = 0;
                                                          *double v48 = (id)objc_msgSend(v320, "initWithDomain:code:userInfo:", v325, 2);
                                                          double v65 = v629;
                                                          id v212 = v546;
                                                          double v48 = (id *)v544;
                                                          goto LABEL_479;
                                                        }
                                                        id v517 = 0;
                                                        double v18 = 0;
                                                        double v65 = v629;
                                                        id v212 = v546;
                                                        double v48 = (id *)v544;
                                                        v310 = v520;
LABEL_480:

                                                        goto LABEL_481;
                                                      }
                                                      if (v48)
                                                      {
                                                        id v313 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                        v597 = v7;
                                                        uint64_t v314 = *MEMORY[0x1E4F502C8];
                                                        uint64_t v683 = *MEMORY[0x1E4F28568];
                                                        id v315 = [NSString alloc];
                                                        uint64_t v463 = objc_opt_class();
                                                        v316 = v315;
                                                        self = v633;
                                                        id v517 = (id)[v316 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v463, @"clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"];
                                                        id v684 = v517;
                                                        uint64_t v317 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v684 forKeys:&v683 count:1];
                                                        uint64_t v318 = v314;
                                                        id v7 = v597;
                                                        v518 = (void *)v317;
                                                        id v319 = (id)objc_msgSend(v313, "initWithDomain:code:userInfo:", v318, 2);
                                                        double v18 = 0;
                                                        v310 = 0;
                                                        *double v48 = v319;
                                                        double v65 = v629;
                                                        id v212 = v546;
                                                        double v48 = (id *)v544;
                                                        goto LABEL_480;
                                                      }
                                                      v310 = 0;
                                                      double v18 = 0;
LABEL_341:
                                                      double v65 = v629;
                                                      id v212 = v546;
                                                      double v48 = (id *)v544;
LABEL_481:

                                                      goto LABEL_482;
                                                    }
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      id v523 = v145;
                                                      goto LABEL_138;
                                                    }
                                                    if (v48)
                                                    {
                                                      id v300 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      v595 = v7;
                                                      uint64_t v301 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v687 = *MEMORY[0x1E4F28568];
                                                      id v302 = [NSString alloc];
                                                      uint64_t v461 = objc_opt_class();
                                                      v303 = v302;
                                                      self = v633;
                                                      id v242 = v539;
                                                      id v521 = (id)[v303 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v461, @"clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"];
                                                      id v688 = v521;
                                                      uint64_t v304 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v688 forKeys:&v687 count:1];
                                                      uint64_t v305 = v301;
                                                      id v7 = v595;
                                                      v522 = (void *)v304;
                                                      double v18 = 0;
                                                      id v523 = 0;
                                                      *double v48 = (id)objc_msgSend(v300, "initWithDomain:code:userInfo:", v305, 2);
                                                      double v65 = v629;
                                                      id v212 = v546;
                                                      double v48 = (id *)v544;
LABEL_483:

                                                      goto LABEL_484;
                                                    }
                                                    id v523 = 0;
                                                    double v18 = 0;
                                                    double v65 = v629;
                                                    id v212 = v546;
                                                    double v48 = (id *)v544;
                                                    id v242 = v539;
LABEL_484:

                                                    goto LABEL_485;
                                                  }
                                                  if (v48)
                                                  {
                                                    id v294 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    v594 = v7;
                                                    uint64_t v295 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v689 = *MEMORY[0x1E4F28568];
                                                    id v296 = [NSString alloc];
                                                    uint64_t v460 = objc_opt_class();
                                                    v297 = v296;
                                                    self = v633;
                                                    id v242 = v539;
                                                    id v523 = (id)[v297 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v460, @"clickCountGivenLocationInLastMonthNormalizedAcrossItems"];
                                                    id v690 = v523;
                                                    uint64_t v298 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v690 forKeys:&v689 count:1];
                                                    uint64_t v299 = v295;
                                                    id v7 = v594;
                                                    v524 = (void *)v298;
                                                    double v18 = 0;
                                                    id v525 = 0;
                                                    *double v48 = (id)objc_msgSend(v294, "initWithDomain:code:userInfo:", v299, 2);
                                                    double v65 = v629;
                                                    id v212 = v546;
                                                    double v48 = (id *)v544;
                                                    goto LABEL_484;
                                                  }
                                                  id v525 = 0;
                                                  double v18 = 0;
                                                  double v65 = v629;
                                                  id v212 = v546;
                                                  double v48 = (id *)v544;
                                                  id v242 = v539;
LABEL_485:

                                                  goto LABEL_486;
                                                }
                                                if (v48)
                                                {
                                                  id v288 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  v593 = v7;
                                                  uint64_t v289 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v691 = *MEMORY[0x1E4F28568];
                                                  id v290 = [NSString alloc];
                                                  uint64_t v459 = objc_opt_class();
                                                  v291 = v290;
                                                  self = v633;
                                                  id v242 = v539;
                                                  id v525 = (id)[v291 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v459, @"clickCountGivenLocationInLastWeekNormalizedAcrossItems"];
                                                  id v692 = v525;
                                                  uint64_t v292 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v692 forKeys:&v691 count:1];
                                                  uint64_t v293 = v289;
                                                  id v7 = v593;
                                                  v526 = (void *)v292;
                                                  double v18 = 0;
                                                  id v527 = 0;
                                                  *double v48 = (id)objc_msgSend(v288, "initWithDomain:code:userInfo:", v293, 2);
                                                  double v65 = v629;
                                                  id v212 = v546;
                                                  double v48 = (id *)v544;
                                                  goto LABEL_485;
                                                }
                                                id v527 = 0;
                                                double v18 = 0;
                                                double v65 = v629;
                                                id v212 = v546;
                                                double v48 = (id *)v544;
                                                id v242 = v539;
LABEL_486:

                                                goto LABEL_487;
                                              }
                                              if (v48)
                                              {
                                                id v282 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                v592 = v7;
                                                uint64_t v283 = *MEMORY[0x1E4F502C8];
                                                uint64_t v693 = *MEMORY[0x1E4F28568];
                                                id v284 = [NSString alloc];
                                                uint64_t v458 = objc_opt_class();
                                                v285 = v284;
                                                self = v633;
                                                id v242 = v539;
                                                id v527 = (id)[v285 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v458, @"clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"];
                                                id v694 = v527;
                                                uint64_t v286 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v694 forKeys:&v693 count:1];
                                                uint64_t v287 = v283;
                                                id v7 = v592;
                                                v528 = (void *)v286;
                                                double v18 = 0;
                                                id v529 = 0;
                                                *double v48 = (id)objc_msgSend(v282, "initWithDomain:code:userInfo:", v287, 2);
                                                double v65 = v629;
                                                id v212 = v546;
                                                double v48 = (id *)v544;
                                                goto LABEL_486;
                                              }
                                              id v529 = 0;
                                              double v18 = 0;
                                              double v65 = v629;
                                              id v212 = v546;
                                              double v48 = (id *)v544;
                                              id v242 = v539;
LABEL_487:

                                              goto LABEL_488;
                                            }
                                            if (v48)
                                            {
                                              id v276 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              v591 = v7;
                                              uint64_t v277 = *MEMORY[0x1E4F502C8];
                                              uint64_t v695 = *MEMORY[0x1E4F28568];
                                              id v278 = [NSString alloc];
                                              uint64_t v457 = objc_opt_class();
                                              v279 = v278;
                                              self = v633;
                                              id v242 = v539;
                                              id v529 = (id)[v279 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v457, @"clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"];
                                              id v696 = v529;
                                              uint64_t v280 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v696 forKeys:&v695 count:1];
                                              uint64_t v281 = v277;
                                              id v7 = v591;
                                              v530 = (void *)v280;
                                              double v18 = 0;
                                              id v531 = 0;
                                              *double v48 = (id)objc_msgSend(v276, "initWithDomain:code:userInfo:", v281, 2);
                                              double v65 = v629;
                                              id v212 = v546;
                                              double v48 = (id *)v544;
                                              goto LABEL_487;
                                            }
                                            id v531 = 0;
                                            double v18 = 0;
                                            double v65 = v629;
                                            id v212 = v546;
                                            double v48 = (id *)v544;
                                            id v242 = v539;
LABEL_488:

                                            goto LABEL_489;
                                          }
                                          if (v48)
                                          {
                                            id v270 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v271 = *MEMORY[0x1E4F502C8];
                                            uint64_t v697 = *MEMORY[0x1E4F28568];
                                            id v272 = [NSString alloc];
                                            uint64_t v456 = objc_opt_class();
                                            v273 = v272;
                                            self = v633;
                                            id v242 = v539;
                                            id v531 = (id)[v273 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v456, @"shareCountInLastMonthNormalizedAcrossItems"];
                                            id v698 = v531;
                                            uint64_t v274 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v698 forKeys:&v697 count:1];
                                            uint64_t v275 = v271;
                                            id v7 = v51;
                                            v532 = (void *)v274;
                                            double v18 = 0;
                                            v533 = 0;
                                            *double v48 = (id)objc_msgSend(v270, "initWithDomain:code:userInfo:", v275, 2);
                                            double v65 = v629;
                                            id v212 = v546;
                                            double v48 = (id *)v544;
                                            goto LABEL_488;
                                          }
                                          v533 = 0;
                                          double v18 = 0;
                                          double v65 = v629;
                                          id v212 = v546;
                                          double v48 = (id *)v544;
                                          id v242 = v539;
LABEL_489:

                                          goto LABEL_490;
                                        }
                                        if (v48)
                                        {
                                          id v264 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v265 = *MEMORY[0x1E4F502C8];
                                          uint64_t v699 = *MEMORY[0x1E4F28568];
                                          id v266 = [NSString alloc];
                                          uint64_t v455 = objc_opt_class();
                                          v267 = v266;
                                          self = v633;
                                          id v242 = v539;
                                          v533 = (void *)[v267 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v455, @"shareCountInLastWeekNormalizedAcrossItems"];
                                          v700 = v533;
                                          uint64_t v268 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v700 forKeys:&v699 count:1];
                                          uint64_t v269 = v265;
                                          id v7 = v51;
                                          v534 = (void *)v268;
                                          double v18 = 0;
                                          id v535 = 0;
                                          *double v48 = (id)objc_msgSend(v264, "initWithDomain:code:userInfo:", v269, 2);
                                          double v65 = v629;
                                          id v212 = v546;
                                          double v48 = (id *)v544;
                                          goto LABEL_489;
                                        }
                                        id v535 = 0;
                                        double v18 = 0;
                                        double v65 = v629;
                                        id v212 = v546;
                                        double v48 = (id *)v544;
                                        id v242 = v539;
LABEL_490:

                                        goto LABEL_491;
                                      }
                                      if (v48)
                                      {
                                        id v258 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v259 = *MEMORY[0x1E4F502C8];
                                        uint64_t v701 = *MEMORY[0x1E4F28568];
                                        id v260 = [NSString alloc];
                                        uint64_t v454 = objc_opt_class();
                                        id v261 = v260;
                                        self = v633;
                                        id v242 = v539;
                                        id v535 = (id)[v261 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v454, @"clickCountInLastMonthNormalizedAcrossItems"];
                                        id v702 = v535;
                                        uint64_t v262 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v702 forKeys:&v701 count:1];
                                        uint64_t v263 = v259;
                                        id v7 = v51;
                                        v536 = (void *)v262;
                                        double v18 = 0;
                                        id v537 = 0;
                                        *double v48 = (id)objc_msgSend(v258, "initWithDomain:code:userInfo:", v263, 2);
                                        double v65 = v629;
                                        id v212 = v546;
                                        double v48 = (id *)v544;
                                        goto LABEL_490;
                                      }
                                      id v537 = 0;
                                      double v18 = 0;
                                      double v65 = v629;
                                      id v212 = v546;
                                      double v48 = (id *)v544;
                                      id v242 = v539;
LABEL_491:

                                      goto LABEL_492;
                                    }
                                    if (v48)
                                    {
                                      id v252 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v253 = *MEMORY[0x1E4F502C8];
                                      uint64_t v703 = *MEMORY[0x1E4F28568];
                                      id v254 = [NSString alloc];
                                      uint64_t v453 = objc_opt_class();
                                      id v255 = v254;
                                      self = v633;
                                      id v242 = v539;
                                      id v537 = (id)[v255 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v453, @"clickCountInLastWeekNormalizedAcrossItems"];
                                      id v704 = v537;
                                      uint64_t v256 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v704 forKeys:&v703 count:1];
                                      uint64_t v257 = v253;
                                      id v7 = v51;
                                      v538 = (void *)v256;
                                      double v18 = 0;
                                      id v540 = 0;
                                      *double v48 = (id)objc_msgSend(v252, "initWithDomain:code:userInfo:", v257, 2);
                                      double v65 = v629;
                                      id v212 = v546;
                                      double v48 = (id *)v544;
                                      goto LABEL_491;
                                    }
                                    id v540 = 0;
                                    double v18 = 0;
                                    double v65 = v629;
                                    id v212 = v546;
                                    double v48 = (id *)v544;
                                    id v242 = v539;
LABEL_492:

                                    goto LABEL_493;
                                  }
                                  if (v48)
                                  {
                                    id v245 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v246 = *MEMORY[0x1E4F502C8];
                                    uint64_t v705 = *MEMORY[0x1E4F28568];
                                    id v247 = [NSString alloc];
                                    uint64_t v452 = objc_opt_class();
                                    id v248 = v247;
                                    self = v633;
                                    id v540 = (id)[v248 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v452, @"hasEverShareInLastMonth"];
                                    id v706 = v540;
                                    uint64_t v249 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v706 forKeys:&v705 count:1];
                                    uint64_t v250 = v246;
                                    id v7 = v51;
                                    v541 = (void *)v249;
                                    id v251 = (id)objc_msgSend(v245, "initWithDomain:code:userInfo:", v250, 2);
                                    double v18 = 0;
                                    id v242 = 0;
                                    *double v48 = v251;
                                    double v65 = v629;
                                    id v212 = v546;
                                    double v48 = (id *)v544;
                                    goto LABEL_492;
                                  }
                                  id v242 = 0;
                                  double v18 = 0;
LABEL_285:
                                  double v65 = v629;
                                  id v212 = v546;
                                  double v48 = (id *)v544;
LABEL_493:

                                  id v234 = v542;
                                  goto LABEL_494;
                                }
                                if (v48)
                                {
                                  id v238 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  v626 = v25;
                                  uint64_t v239 = *MEMORY[0x1E4F502C8];
                                  uint64_t v707 = *MEMORY[0x1E4F28568];
                                  id v240 = [NSString alloc];
                                  uint64_t v451 = objc_opt_class();
                                  id v241 = v240;
                                  self = v633;
                                  id v242 = (void *)[v241 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v451, @"hasEverShareInLastWeek"];
                                  v708 = v242;
                                  uint64_t v243 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v708 forKeys:&v707 count:1];
                                  uint64_t v244 = v239;
                                  id v7 = v51;
                                  double v49 = v626;
                                  v543 = (void *)v243;
                                  double v18 = 0;
                                  id v542 = 0;
                                  *double v48 = (id)objc_msgSend(v238, "initWithDomain:code:userInfo:", v244, 2);
                                  goto LABEL_285;
                                }
                                id v234 = 0;
                                double v18 = 0;
                                double v65 = v629;
                                id v212 = v546;
                                double v48 = (id *)v544;
LABEL_494:

                                goto LABEL_495;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v547 = v122;
                                goto LABEL_102;
                              }
                              id v7 = v51;
                              if (v48)
                              {
                                id v222 = objc_alloc(MEMORY[0x1E4F28C58]);
                                v589 = v51;
                                uint64_t v223 = *MEMORY[0x1E4F502C8];
                                uint64_t v711 = *MEMORY[0x1E4F28568];
                                id v224 = v48;
                                id v225 = [NSString alloc];
                                uint64_t v449 = objc_opt_class();
                                id v226 = v225;
                                self = v633;
                                id v32 = v549;
                                double v48 = (id *)[v226 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v449, @"hasEverClickInLastWeek"];
                                v712 = v48;
                                uint64_t v227 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v712 forKeys:&v711 count:1];
                                uint64_t v228 = v223;
                                id v7 = v589;
                                double v49 = v25;
                                v545 = (void *)v227;
                                double v18 = 0;
                                id v547 = 0;
                                *id v224 = (id)objc_msgSend(v222, "initWithDomain:code:userInfo:", v228, 2);
                                double v65 = v629;
                                id v212 = v546;
LABEL_496:

                                id v9 = v613;
                                goto LABEL_497;
                              }
                              id v547 = 0;
                              double v18 = 0;
                              double v65 = v629;
                              id v212 = v546;
                              id v9 = v613;
                              id v32 = v549;
LABEL_497:

                              goto LABEL_498;
                            }
                            id v212 = v120;
                            if (v48)
                            {
                              id v214 = objc_alloc(MEMORY[0x1E4F28C58]);
                              v618 = v31;
                              v588 = v51;
                              uint64_t v215 = *MEMORY[0x1E4F502C8];
                              uint64_t v713 = *MEMORY[0x1E4F28568];
                              v216 = v48;
                              id v217 = [NSString alloc];
                              uint64_t v448 = objc_opt_class();
                              id v218 = v217;
                              self = v633;
                              id v32 = v549;
                              id v547 = (id)[v218 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v448, @"curationScore"];
                              id v714 = v547;
                              uint64_t v219 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v714 forKeys:&v713 count:1];
                              id v220 = v214;
                              uint64_t v221 = v215;
                              id v9 = v613;
                              id v7 = v588;
                              double v49 = v25;
                              double v31 = v618;
                              v548 = (void *)v219;
                              double v18 = 0;
                              id v559 = 0;
                              id *v216 = (id)objc_msgSend(v220, "initWithDomain:code:userInfo:", v221, 2);
                              double v65 = v629;
                              goto LABEL_497;
                            }
                            id v559 = 0;
                            double v18 = 0;
                            double v65 = v629;
                            id v7 = v51;
                            id v9 = v613;
                            id v32 = v549;
LABEL_498:
                            double v25 = v49;

                            double v50 = v560;
                            v205 = v558;
                            goto LABEL_499;
                          }
                          if (v48)
                          {
                            id v208 = objc_alloc(MEMORY[0x1E4F28C58]);
                            v587 = v7;
                            uint64_t v209 = *MEMORY[0x1E4F502C8];
                            uint64_t v715 = *MEMORY[0x1E4F28568];
                            v557 = v48;
                            id v210 = [NSString alloc];
                            uint64_t v447 = objc_opt_class();
                            v211 = v210;
                            self = v633;
                            id v559 = (id)[v211 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v447, @"aestheticScore"];
                            id v716 = v559;
                            id v212 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v716 forKeys:&v715 count:1];
                            uint64_t v213 = v209;
                            id v9 = v613;
                            id v7 = v587;
                            double v18 = 0;
                            id v558 = 0;
                            id *v557 = (id)[v208 initWithDomain:v213 code:2 userInfo:v212];
                            double v65 = v629;
                            goto LABEL_498;
                          }
                          v205 = 0;
                          double v18 = 0;
                          double v65 = v629;
                          id v9 = v613;
LABEL_499:

                          id v26 = v561;
                          goto LABEL_500;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v565 = v44;
                          goto LABEL_46;
                        }
                        if (v22)
                        {
                          id v566 = objc_alloc(MEMORY[0x1E4F28C58]);
                          v585 = v7;
                          uint64_t v196 = *MEMORY[0x1E4F502C8];
                          uint64_t v719 = *MEMORY[0x1E4F28568];
                          v555 = v22;
                          id v197 = [NSString alloc];
                          uint64_t v445 = objc_opt_class();
                          v198 = v197;
                          self = v633;
                          double v103 = v574;
                          id v562 = (id)[v198 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v445, @"freshness"];
                          id v720 = v562;
                          uint64_t v199 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v720 forKeys:&v719 count:1];
                          uint64_t v200 = v196;
                          id v7 = v585;
                          v564 = (void *)v199;
                          id v201 = (id)objc_msgSend(v566, "initWithDomain:code:userInfo:", v200, 2);
                          double v18 = 0;
                          id v565 = 0;
                          id *v555 = v201;
                          double v65 = v629;
LABEL_501:

                          goto LABEL_502;
                        }
                        id v565 = 0;
                        double v18 = 0;
                        double v65 = v629;
                        self = v633;
                        double v103 = v574;
LABEL_502:

                        goto LABEL_503;
                      }
                      if (v22)
                      {
                        id v569 = objc_alloc(MEMORY[0x1E4F28C58]);
                        v584 = v7;
                        uint64_t v190 = *MEMORY[0x1E4F502C8];
                        uint64_t v721 = *MEMORY[0x1E4F28568];
                        v554 = v22;
                        id v191 = [NSString alloc];
                        uint64_t v444 = objc_opt_class();
                        v192 = v191;
                        self = v633;
                        double v103 = v574;
                        id v565 = (id)[v192 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v444, @"L1Score"];
                        id v722 = v565;
                        uint64_t v193 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v722 forKeys:&v721 count:1];
                        uint64_t v194 = v190;
                        id v7 = v584;
                        v567 = (void *)v193;
                        id v195 = (id)objc_msgSend(v569, "initWithDomain:code:userInfo:", v194, 2);
                        double v18 = 0;
                        id v568 = 0;
                        id *v554 = v195;
                        double v65 = v629;
                        goto LABEL_502;
                      }
                      id v568 = 0;
                      double v18 = 0;
                      double v65 = v629;
                      self = v633;
                      double v103 = v574;
LABEL_503:

                      goto LABEL_504;
                    }
                    if (v22)
                    {
                      id v572 = objc_alloc(MEMORY[0x1E4F28C58]);
                      v583 = v7;
                      uint64_t v184 = *MEMORY[0x1E4F502C8];
                      uint64_t v723 = *MEMORY[0x1E4F28568];
                      v553 = v22;
                      id v185 = [NSString alloc];
                      uint64_t v443 = objc_opt_class();
                      v186 = v185;
                      self = v633;
                      double v103 = v574;
                      id v568 = (id)[v186 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v443, @"matchedFieldsCount"];
                      id v724 = v568;
                      uint64_t v187 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v724 forKeys:&v723 count:1];
                      uint64_t v188 = v184;
                      id v7 = v583;
                      v570 = (void *)v187;
                      id v189 = (id)objc_msgSend(v572, "initWithDomain:code:userInfo:", v188, 2);
                      double v18 = 0;
                      id v571 = 0;
                      id *v553 = v189;
                      double v65 = v629;
                      goto LABEL_503;
                    }
                    id v571 = 0;
                    double v18 = 0;
                    double v65 = v629;
                    self = v633;
                    double v103 = v574;
LABEL_504:

                    goto LABEL_505;
                  }
                  if (v22)
                  {
                    id v576 = objc_alloc(MEMORY[0x1E4F28C58]);
                    id v113 = v32;
                    uint64_t v114 = *MEMORY[0x1E4F502C8];
                    uint64_t v725 = *MEMORY[0x1E4F28568];
                    v551 = v22;
                    id v115 = [NSString alloc];
                    uint64_t v442 = objc_opt_class();
                    double v116 = v115;
                    self = v633;
                    double v103 = v574;
                    id v571 = (id)[v116 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v442, @"matchedOCRImportance"];
                    id v726 = v571;
                    uint64_t v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v726 forKeys:&v725 count:1];
                    uint64_t v118 = v114;
                    id v32 = v113;
                    v573 = (void *)v117;
                    id v119 = (id)objc_msgSend(v576, "initWithDomain:code:userInfo:", v118, 2);
                    double v18 = 0;
                    id v575 = 0;
                    id *v551 = v119;
                    double v65 = v629;
                    goto LABEL_504;
                  }
                  id v575 = 0;
                  double v18 = 0;
                  double v65 = v629;
                  self = v633;
                  double v103 = v574;
LABEL_505:

                  goto LABEL_506;
                }
                if (v22)
                {
                  id v578 = objc_alloc(MEMORY[0x1E4F28C58]);
                  id v105 = v32;
                  uint64_t v106 = *MEMORY[0x1E4F502C8];
                  uint64_t v727 = *MEMORY[0x1E4F28568];
                  uint64_t v107 = v22;
                  id v108 = [NSString alloc];
                  uint64_t v441 = objc_opt_class();
                  uint64_t v109 = v108;
                  self = v633;
                  id v575 = (id)[v109 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v441, @"matchedOCRCharacterRatio"];
                  id v728 = v575;
                  uint64_t v110 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v728 forKeys:&v727 count:1];
                  uint64_t v111 = v578;
                  uint64_t v112 = v106;
                  id v32 = v105;
                  v577 = (void *)v110;
                  double v18 = 0;
                  double v103 = 0;
                  *uint64_t v107 = (id)objc_msgSend(v111, "initWithDomain:code:userInfo:", v112, 2);
                  double v65 = v629;
                  goto LABEL_505;
                }
                double v103 = 0;
                double v18 = 0;
                double v65 = v629;
                self = v633;
LABEL_506:

                goto LABEL_507;
              }
              if (v22)
              {
                id v611 = objc_alloc(MEMORY[0x1E4F28C58]);
                v581 = v7;
                id v95 = v32;
                uint64_t v96 = *MEMORY[0x1E4F502C8];
                uint64_t v729 = *MEMORY[0x1E4F28568];
                double v97 = v22;
                id v98 = [NSString alloc];
                uint64_t v440 = objc_opt_class();
                double v99 = v98;
                self = v633;
                uint64_t v100 = [v99 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v440, @"matchedSceneBoundingBox"];
                uint64_t v730 = v100;
                uint64_t v101 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v730 forKeys:&v729 count:1];
                uint64_t v102 = v96;
                id v32 = v95;
                double v103 = (void *)v100;
                id v7 = v581;
                v579 = (void *)v101;
                id v104 = (id)objc_msgSend(v611, "initWithDomain:code:userInfo:", v102, 2);
                double v18 = 0;
                id v610 = 0;
                *double v97 = v104;
                double v65 = v629;
                goto LABEL_506;
              }
              id v610 = 0;
              double v18 = 0;
              double v65 = v629;
              self = v633;
LABEL_507:

              goto LABEL_508;
            }
            if (v22)
            {
              id v83 = objc_alloc(MEMORY[0x1E4F28C58]);
              id v616 = v6;
              v624 = v25;
              uint64_t v84 = *MEMORY[0x1E4F502C8];
              uint64_t v731 = *MEMORY[0x1E4F28568];
              double v85 = v22;
              id v86 = [NSString alloc];
              uint64_t v439 = objc_opt_class();
              double v87 = v86;
              self = v633;
              id v610 = (id)[v87 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v439, @"matchedSceneConfidence"];
              id v732 = v610;
              uint64_t v88 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v732 forKeys:&v731 count:1];
              uint64_t v89 = v84;
              double v25 = v624;
              double v31 = v616;
              v612 = (void *)v88;
              double v18 = 0;
              *double v85 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v89, 2);
              id v32 = 0;
              double v65 = v629;
              goto LABEL_507;
            }
            double v31 = v6;
            id v32 = 0;
            double v18 = 0;
            double v65 = v629;
            self = v633;
LABEL_508:

            id v6 = v31;
            double v28 = v627;
            goto LABEL_509;
          }
          if (v22)
          {
            id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v615 = v6;
            v623 = v25;
            uint64_t v75 = *MEMORY[0x1E4F502C8];
            uint64_t v733 = *MEMORY[0x1E4F28568];
            double v76 = v22;
            id v77 = [NSString alloc];
            uint64_t v438 = objc_opt_class();
            double v78 = v77;
            self = v633;
            id v79 = v26;
            uint64_t v80 = [v78 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v438, @"matchedSceneRatio"];
            uint64_t v734 = v80;
            uint64_t v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v734 forKeys:&v733 count:1];
            uint64_t v82 = v75;
            double v25 = v623;
            double v31 = v615;
            v628 = (void *)v81;
            double v18 = 0;
            id v630 = 0;
            *double v76 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v82, 2);
            id v32 = (id)v80;
            id v26 = v79;
            double v65 = v629;
            goto LABEL_508;
          }
          id v630 = 0;
          double v18 = 0;
          double v65 = v629;
          self = v633;
LABEL_509:

          double v21 = v631;
          goto LABEL_510;
        }
        if (v22)
        {
          v622 = v8;
          v580 = v7;
          id v66 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v67 = *MEMORY[0x1E4F502C8];
          uint64_t v735 = *MEMORY[0x1E4F28568];
          double v68 = v22;
          id v69 = [NSString alloc];
          double v65 = v24;
          uint64_t v437 = objc_opt_class();
          double v70 = v69;
          self = v633;
          id v630 = (id)[v70 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v437, @"matchedLocationRatio"];
          id v736 = v630;
          uint64_t v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v736 forKeys:&v735 count:1];
          double v25 = v622;
          uint64_t v72 = v67;
          double v28 = (void *)v71;
          id v73 = (id)[v66 initWithDomain:v72 code:2 userInfo:v71];
          double v18 = 0;
          id v26 = 0;
          *double v68 = v73;
          id v7 = v580;
          goto LABEL_509;
        }
        double v25 = v8;
        id v26 = 0;
        double v18 = 0;
        double v65 = v24;
        self = v633;
LABEL_510:

        double v8 = v25;
        double v17 = v634;
        a4 = v632;
        goto LABEL_511;
      }
      if (a4)
      {
        id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v53 = v6;
        double v54 = v21;
        v614 = v53;
        v621 = v8;
        double v55 = v7;
        id v56 = v52;
        double v57 = self;
        uint64_t v58 = *MEMORY[0x1E4F502C8];
        uint64_t v737 = *MEMORY[0x1E4F28568];
        double v59 = a4;
        uint64_t v60 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"matchedPeopleRatio"];
        uint64_t v738 = v60;
        uint64_t v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v738 forKeys:&v737 count:1];
        double v62 = v56;
        double v25 = v621;
        double v63 = v54;
        id v6 = v614;
        id v26 = (id)v60;
        uint64_t v64 = v58;
        self = v57;
        double v65 = (void *)v61;
        double v18 = 0;
        v632 = 0;
        *double v59 = (id)[v62 initWithDomain:v64 code:2 userInfo:v61];
        id v7 = v55;
        double v21 = v63;
        goto LABEL_510;
      }
      double v18 = 0;
      double v17 = v634;
LABEL_511:

      goto LABEL_512;
    }
    id v19 = a4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = v8;
      id v9 = [NSNumber numberWithInt:BMAeroMLPhotosSearchLabeledDataUISurfaceTypeFromString(v20)];

      goto LABEL_15;
    }
    if (a4)
    {
      id v90 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v91 = *MEMORY[0x1E4F502C8];
      uint64_t v739 = *MEMORY[0x1E4F28568];
      a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"uiSurface"];
      v740 = a4;
      uint64_t v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v740 forKeys:&v739 count:1];
      double v93 = v90;
      double v17 = v634;
      id v94 = (id)[v93 initWithDomain:v91 code:2 userInfo:v92];
      id v9 = 0;
      double v18 = 0;
      *id v19 = v94;
      double v21 = (void *)v92;
      id v6 = v10;
      goto LABEL_511;
    }
    id v9 = 0;
    double v18 = 0;
    double v17 = v634;
LABEL_512:

    goto LABEL_513;
  }
  if (a4)
  {
    id v11 = v6;
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v13 = *MEMORY[0x1E4F502C8];
    uint64_t v741 = *MEMORY[0x1E4F28568];
    id v9 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"searchSessionUUID"];
    v742[0] = v9;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v742 forKeys:&v741 count:1];
    double v15 = v12;
    id v6 = v11;
    uint64_t v16 = v13;
    double v8 = (void *)v14;
    double v17 = 0;
    double v18 = 0;
    *a4 = (id)[v15 initWithDomain:v16 code:2 userInfo:v14];
    goto LABEL_512;
  }
  double v17 = 0;
  double v18 = 0;
LABEL_513:

  return v18;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMAeroMLPhotosSearchLabeledData *)self writeTo:v3];
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
  if (self->_hasClicked)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v4 = v5;
  }
  if (self->_hasClickOrder)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v4 = v5;
  }
  if (self->_hasItemPosition)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v4 = v5;
  }
  if (self->_hasL2ModelScore)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasIsDuplicate)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasIsCompleteMatch)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  uint64_t v4 = a3;
  v163.receiver = self;
  v163.super_class = (Class)BMAeroMLPhotosSearchLabeledData;
  id v5 = [(BMEventBase *)&v163 init];
  if (!v5) {
    goto LABEL_332;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
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
                  goto LABEL_209;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_209:
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
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v30);
            *(void *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 104;
          goto LABEL_328;
        case 4u:
          v5->_hasMatchedLocationRatio = 1;
          uint64_t v32 = *v6;
          unint64_t v33 = *(void *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v33);
            *(void *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 112;
          goto LABEL_328;
        case 5u:
          v5->_hasMatchedSceneRatio = 1;
          uint64_t v34 = *v6;
          unint64_t v35 = *(void *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v35);
            *(void *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 120;
          goto LABEL_328;
        case 6u:
          v5->_hasMatchedSceneConfidence = 1;
          uint64_t v36 = *v6;
          unint64_t v37 = *(void *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v37);
            *(void *)&v4[v36] = v37 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 128;
          goto LABEL_328;
        case 7u:
          v5->_hasMatchedSceneBoundingBox = 1;
          uint64_t v38 = *v6;
          unint64_t v39 = *(void *)&v4[v38];
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v39);
            *(void *)&v4[v38] = v39 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 136;
          goto LABEL_328;
        case 8u:
          v5->_hasMatchedOCRCharacterRatio = 1;
          uint64_t v40 = *v6;
          unint64_t v41 = *(void *)&v4[v40];
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v41);
            *(void *)&v4[v40] = v41 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 144;
          goto LABEL_328;
        case 9u:
          v5->_hasMatchedOCRImportance = 1;
          uint64_t v42 = *v6;
          unint64_t v43 = *(void *)&v4[v42];
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v43);
            *(void *)&v4[v42] = v43 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 152;
          goto LABEL_328;
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
                  goto LABEL_215;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v46) = 0;
          }
LABEL_215:
          uint64_t v157 = 80;
          goto LABEL_233;
        case 0xBu:
          v5->_hasL1Score = 1;
          uint64_t v51 = *v6;
          unint64_t v52 = *(void *)&v4[v51];
          if (v52 <= 0xFFFFFFFFFFFFFFF7 && v52 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v52);
            *(void *)&v4[v51] = v52 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 160;
          goto LABEL_328;
        case 0xCu:
          v5->_hasFreshness = 1;
          uint64_t v53 = *v6;
          unint64_t v54 = *(void *)&v4[v53];
          if (v54 <= 0xFFFFFFFFFFFFFFF7 && v54 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v54);
            *(void *)&v4[v53] = v54 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 168;
          goto LABEL_328;
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
                  goto LABEL_219;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v57 = 0;
          }
LABEL_219:
          BOOL v158 = v57 != 0;
          uint64_t v159 = 26;
          goto LABEL_224;
        case 0xEu:
          v5->_hasAestheticScore = 1;
          uint64_t v62 = *v6;
          unint64_t v63 = *(void *)&v4[v62];
          if (v63 <= 0xFFFFFFFFFFFFFFF7 && v63 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v63);
            *(void *)&v4[v62] = v63 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 176;
          goto LABEL_328;
        case 0xFu:
          v5->_hasCurationScore = 1;
          uint64_t v64 = *v6;
          unint64_t v65 = *(void *)&v4[v64];
          if (v65 <= 0xFFFFFFFFFFFFFFF7 && v65 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v65);
            *(void *)&v4[v64] = v65 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 184;
          goto LABEL_328;
        case 0x10u:
          v5->_hasHasEverClickInLastWeek = 1;
          uint64_t v66 = *v6;
          unint64_t v67 = *(void *)&v4[v66];
          if (v67 <= 0xFFFFFFFFFFFFFFF7 && v67 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v67);
            *(void *)&v4[v66] = v67 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 192;
          goto LABEL_328;
        case 0x11u:
          v5->_hasHasEverClickInLastMonth = 1;
          uint64_t v68 = *v6;
          unint64_t v69 = *(void *)&v4[v68];
          if (v69 <= 0xFFFFFFFFFFFFFFF7 && v69 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v69);
            *(void *)&v4[v68] = v69 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 200;
          goto LABEL_328;
        case 0x12u:
          v5->_hasHasEverShareInLastWeek = 1;
          uint64_t v70 = *v6;
          unint64_t v71 = *(void *)&v4[v70];
          if (v71 <= 0xFFFFFFFFFFFFFFF7 && v71 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v71);
            *(void *)&v4[v70] = v71 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 208;
          goto LABEL_328;
        case 0x13u:
          v5->_hasHasEverShareInLastMonth = 1;
          uint64_t v72 = *v6;
          unint64_t v73 = *(void *)&v4[v72];
          if (v73 <= 0xFFFFFFFFFFFFFFF7 && v73 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v73);
            *(void *)&v4[v72] = v73 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 216;
          goto LABEL_328;
        case 0x14u:
          v5->_hasClickCountInLastWeekNormalizedAcrossItems = 1;
          uint64_t v74 = *v6;
          unint64_t v75 = *(void *)&v4[v74];
          if (v75 <= 0xFFFFFFFFFFFFFFF7 && v75 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v75);
            *(void *)&v4[v74] = v75 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 224;
          goto LABEL_328;
        case 0x15u:
          v5->_hasClickCountInLastMonthNormalizedAcrossItems = 1;
          uint64_t v76 = *v6;
          unint64_t v77 = *(void *)&v4[v76];
          if (v77 <= 0xFFFFFFFFFFFFFFF7 && v77 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v77);
            *(void *)&v4[v76] = v77 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 232;
          goto LABEL_328;
        case 0x16u:
          v5->_hasShareCountInLastWeekNormalizedAcrossItems = 1;
          uint64_t v78 = *v6;
          unint64_t v79 = *(void *)&v4[v78];
          if (v79 <= 0xFFFFFFFFFFFFFFF7 && v79 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v79);
            *(void *)&v4[v78] = v79 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 240;
          goto LABEL_328;
        case 0x17u:
          v5->_hasShareCountInLastMonthNormalizedAcrossItems = 1;
          uint64_t v80 = *v6;
          unint64_t v81 = *(void *)&v4[v80];
          if (v81 <= 0xFFFFFFFFFFFFFFF7 && v81 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v81);
            *(void *)&v4[v80] = v81 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 248;
          goto LABEL_328;
        case 0x18u:
          v5->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 1;
          uint64_t v82 = *v6;
          unint64_t v83 = *(void *)&v4[v82];
          if (v83 <= 0xFFFFFFFFFFFFFFF7 && v83 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v83);
            *(void *)&v4[v82] = v83 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 256;
          goto LABEL_328;
        case 0x19u:
          v5->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 1;
          uint64_t v84 = *v6;
          unint64_t v85 = *(void *)&v4[v84];
          if (v85 <= 0xFFFFFFFFFFFFFFF7 && v85 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v85);
            *(void *)&v4[v84] = v85 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 264;
          goto LABEL_328;
        case 0x1Au:
          v5->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems = 1;
          uint64_t v86 = *v6;
          unint64_t v87 = *(void *)&v4[v86];
          if (v87 <= 0xFFFFFFFFFFFFFFF7 && v87 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v87);
            *(void *)&v4[v86] = v87 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 272;
          goto LABEL_328;
        case 0x1Bu:
          v5->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems = 1;
          uint64_t v88 = *v6;
          unint64_t v89 = *(void *)&v4[v88];
          if (v89 <= 0xFFFFFFFFFFFFFFF7 && v89 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v89);
            *(void *)&v4[v88] = v89 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 280;
          goto LABEL_328;
        case 0x1Cu:
          v5->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 1;
          uint64_t v90 = *v6;
          unint64_t v91 = *(void *)&v4[v90];
          if (v91 <= 0xFFFFFFFFFFFFFFF7 && v91 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v91);
            *(void *)&v4[v90] = v91 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 288;
          goto LABEL_328;
        case 0x1Du:
          v5->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 1;
          uint64_t v92 = *v6;
          unint64_t v93 = *(void *)&v4[v92];
          if (v93 <= 0xFFFFFFFFFFFFFFF7 && v93 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v93);
            *(void *)&v4[v92] = v93 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 296;
          goto LABEL_328;
        case 0x1Eu:
          v5->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 1;
          uint64_t v94 = *v6;
          unint64_t v95 = *(void *)&v4[v94];
          if (v95 <= 0xFFFFFFFFFFFFFFF7 && v95 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v95);
            *(void *)&v4[v94] = v95 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 304;
          goto LABEL_328;
        case 0x1Fu:
          v5->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 1;
          uint64_t v96 = *v6;
          unint64_t v97 = *(void *)&v4[v96];
          if (v97 <= 0xFFFFFFFFFFFFFFF7 && v97 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v97);
            *(void *)&v4[v96] = v97 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 312;
          goto LABEL_328;
        case 0x20u:
          v5->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 1;
          uint64_t v98 = *v6;
          unint64_t v99 = *(void *)&v4[v98];
          if (v99 <= 0xFFFFFFFFFFFFFFF7 && v99 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v99);
            *(void *)&v4[v98] = v99 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 320;
          goto LABEL_328;
        case 0x21u:
          v5->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 1;
          uint64_t v100 = *v6;
          unint64_t v101 = *(void *)&v4[v100];
          if (v101 <= 0xFFFFFFFFFFFFFFF7 && v101 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v101);
            *(void *)&v4[v100] = v101 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 328;
          goto LABEL_328;
        case 0x22u:
          v5->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 1;
          uint64_t v102 = *v6;
          unint64_t v103 = *(void *)&v4[v102];
          if (v103 <= 0xFFFFFFFFFFFFFFF7 && v103 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v103);
            *(void *)&v4[v102] = v103 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 336;
          goto LABEL_328;
        case 0x23u:
          v5->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 1;
          uint64_t v104 = *v6;
          unint64_t v105 = *(void *)&v4[v104];
          if (v105 <= 0xFFFFFFFFFFFFFFF7 && v105 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v105);
            *(void *)&v4[v104] = v105 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 344;
          goto LABEL_328;
        case 0x24u:
          v5->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 1;
          uint64_t v106 = *v6;
          unint64_t v107 = *(void *)&v4[v106];
          if (v107 <= 0xFFFFFFFFFFFFFFF7 && v107 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v107);
            *(void *)&v4[v106] = v107 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 352;
          goto LABEL_328;
        case 0x25u:
          v5->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 1;
          uint64_t v108 = *v6;
          unint64_t v109 = *(void *)&v4[v108];
          if (v109 <= 0xFFFFFFFFFFFFFFF7 && v109 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v109);
            *(void *)&v4[v108] = v109 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 360;
          goto LABEL_328;
        case 0x26u:
          v5->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems = 1;
          uint64_t v110 = *v6;
          unint64_t v111 = *(void *)&v4[v110];
          if (v111 <= 0xFFFFFFFFFFFFFFF7 && v111 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v111);
            *(void *)&v4[v110] = v111 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 368;
          goto LABEL_328;
        case 0x27u:
          v5->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems = 1;
          uint64_t v112 = *v6;
          unint64_t v113 = *(void *)&v4[v112];
          if (v113 <= 0xFFFFFFFFFFFFFFF7 && v113 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v113);
            *(void *)&v4[v112] = v113 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 376;
          goto LABEL_328;
        case 0x28u:
          v5->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 1;
          uint64_t v114 = *v6;
          unint64_t v115 = *(void *)&v4[v114];
          if (v115 <= 0xFFFFFFFFFFFFFFF7 && v115 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v115);
            *(void *)&v4[v114] = v115 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 384;
          goto LABEL_328;
        case 0x29u:
          v5->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 1;
          uint64_t v116 = *v6;
          unint64_t v117 = *(void *)&v4[v116];
          if (v117 <= 0xFFFFFFFFFFFFFFF7 && v117 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v117);
            *(void *)&v4[v116] = v117 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 392;
          goto LABEL_328;
        case 0x2Au:
          v5->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 1;
          uint64_t v118 = *v6;
          unint64_t v119 = *(void *)&v4[v118];
          if (v119 <= 0xFFFFFFFFFFFFFFF7 && v119 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v119);
            *(void *)&v4[v118] = v119 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 400;
          goto LABEL_328;
        case 0x2Bu:
          v5->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 1;
          uint64_t v120 = *v6;
          unint64_t v121 = *(void *)&v4[v120];
          if (v121 <= 0xFFFFFFFFFFFFFFF7 && v121 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v121);
            *(void *)&v4[v120] = v121 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 408;
          goto LABEL_328;
        case 0x2Cu:
          v5->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 1;
          uint64_t v122 = *v6;
          unint64_t v123 = *(void *)&v4[v122];
          if (v123 <= 0xFFFFFFFFFFFFFFF7 && v123 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v123);
            *(void *)&v4[v122] = v123 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 416;
          goto LABEL_328;
        case 0x2Du:
          v5->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 1;
          uint64_t v124 = *v6;
          unint64_t v125 = *(void *)&v4[v124];
          if (v125 <= 0xFFFFFFFFFFFFFFF7 && v125 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v125);
            *(void *)&v4[v124] = v125 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 424;
          goto LABEL_328;
        case 0x2Eu:
          v5->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 1;
          uint64_t v126 = *v6;
          unint64_t v127 = *(void *)&v4[v126];
          if (v127 <= 0xFFFFFFFFFFFFFFF7 && v127 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v127);
            *(void *)&v4[v126] = v127 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 432;
          goto LABEL_328;
        case 0x2Fu:
          v5->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 1;
          uint64_t v128 = *v6;
          unint64_t v129 = *(void *)&v4[v128];
          if (v129 <= 0xFFFFFFFFFFFFFFF7 && v129 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v129);
            *(void *)&v4[v128] = v129 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 440;
          goto LABEL_328;
        case 0x30u:
          v5->_hasClipScore = 1;
          uint64_t v130 = *v6;
          unint64_t v131 = *(void *)&v4[v130];
          if (v131 <= 0xFFFFFFFFFFFFFFF7 && v131 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v131);
            *(void *)&v4[v130] = v131 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 448;
          goto LABEL_328;
        case 0x31u:
          char v132 = 0;
          unsigned int v133 = 0;
          uint64_t v134 = 0;
          v5->_hasClicked = 1;
          while (2)
          {
            uint64_t v135 = *v6;
            uint64_t v136 = *(void *)&v4[v135];
            unint64_t v137 = v136 + 1;
            if (v136 == -1 || v137 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v138 = *(unsigned char *)(*(void *)&v4[*v9] + v136);
              *(void *)&v4[v135] = v137;
              v134 |= (unint64_t)(v138 & 0x7F) << v132;
              if (v138 < 0)
              {
                v132 += 7;
                BOOL v17 = v133++ >= 9;
                if (v17)
                {
                  uint64_t v134 = 0;
                  goto LABEL_223;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v134 = 0;
          }
LABEL_223:
          BOOL v158 = v134 != 0;
          uint64_t v159 = 63;
LABEL_224:
          *((unsigned char *)&v5->super.super.isa + v159) = v158;
          continue;
        case 0x32u:
          char v139 = 0;
          unsigned int v140 = 0;
          uint64_t v46 = 0;
          v5->_hasClickOrder = 1;
          while (2)
          {
            uint64_t v141 = *v6;
            uint64_t v142 = *(void *)&v4[v141];
            unint64_t v143 = v142 + 1;
            if (v142 == -1 || v143 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v144 = *(unsigned char *)(*(void *)&v4[*v9] + v142);
              *(void *)&v4[v141] = v143;
              v46 |= (unint64_t)(v144 & 0x7F) << v139;
              if (v144 < 0)
              {
                v139 += 7;
                BOOL v17 = v140++ >= 9;
                if (v17)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_228;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v46) = 0;
          }
LABEL_228:
          uint64_t v157 = 84;
          goto LABEL_233;
        case 0x33u:
          char v145 = 0;
          unsigned int v146 = 0;
          uint64_t v46 = 0;
          v5->_hasItemPosition = 1;
          break;
        case 0x34u:
          v5->_hasL2ModelScore = 1;
          uint64_t v151 = *v6;
          unint64_t v152 = *(void *)&v4[v151];
          if (v152 <= 0xFFFFFFFFFFFFFFF7 && v152 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v152);
            *(void *)&v4[v151] = v152 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 456;
          goto LABEL_328;
        case 0x35u:
          v5->_hasIsDuplicate = 1;
          uint64_t v153 = *v6;
          unint64_t v154 = *(void *)&v4[v153];
          if (v154 <= 0xFFFFFFFFFFFFFFF7 && v154 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v154);
            *(void *)&v4[v153] = v154 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 464;
          goto LABEL_328;
        case 0x36u:
          v5->_hasIsCompleteMatch = 1;
          uint64_t v155 = *v6;
          unint64_t v156 = *(void *)&v4[v155];
          if (v156 <= 0xFFFFFFFFFFFFFFF7 && v156 + 8 <= *(void *)&v4[*v7])
          {
            double v31 = *(objc_class **)(*(void *)&v4[*v9] + v156);
            *(void *)&v4[v155] = v156 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v31 = 0;
          }
          uint64_t v160 = 472;
LABEL_328:
          *(Class *)((char *)&v5->super.super.isa + v160) = v31;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_331;
          }
          continue;
      }
      while (1)
      {
        uint64_t v147 = *v6;
        uint64_t v148 = *(void *)&v4[v147];
        unint64_t v149 = v148 + 1;
        if (v148 == -1 || v149 > *(void *)&v4[*v7]) {
          break;
        }
        char v150 = *(unsigned char *)(*(void *)&v4[*v9] + v148);
        *(void *)&v4[v147] = v149;
        v46 |= (unint64_t)(v150 & 0x7F) << v145;
        if ((v150 & 0x80) == 0) {
          goto LABEL_230;
        }
        v145 += 7;
        BOOL v17 = v146++ >= 9;
        if (v17)
        {
          LODWORD(v46) = 0;
          goto LABEL_232;
        }
      }
      v4[*v8] = 1;
LABEL_230:
      if (v4[*v8]) {
        LODWORD(v46) = 0;
      }
LABEL_232:
      uint64_t v157 = 88;
LABEL_233:
      *(_DWORD *)((char *)&v5->super.super.isa + v157) = v46;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_331:
  }
    v161 = 0;
  else {
LABEL_332:
  }
    v161 = v5;

  return v161;
}

- (NSString)description
{
  id v67 = [NSString alloc];
  unint64_t v103 = [(BMAeroMLPhotosSearchLabeledData *)self searchSessionUUID];
  uint64_t v106 = BMAeroMLPhotosSearchLabeledDataUISurfaceTypeAsString([(BMAeroMLPhotosSearchLabeledData *)self uiSurface]);
  uint64_t v3 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self matchedPeopleRatio];
  unint64_t v105 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v4 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self matchedLocationRatio];
  uint64_t v104 = objc_msgSend(v4, "numberWithDouble:");
  id v5 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self matchedSceneRatio];
  uint64_t v100 = objc_msgSend(v5, "numberWithDouble:");
  id v6 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self matchedSceneConfidence];
  uint64_t v102 = objc_msgSend(v6, "numberWithDouble:");
  id v7 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self matchedSceneBoundingBox];
  unint64_t v101 = objc_msgSend(v7, "numberWithDouble:");
  double v8 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self matchedOCRCharacterRatio];
  unint64_t v97 = objc_msgSend(v8, "numberWithDouble:");
  id v9 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self matchedOCRImportance];
  unint64_t v99 = objc_msgSend(v9, "numberWithDouble:");
  uint64_t v98 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchLabeledData matchedFieldsCount](self, "matchedFieldsCount"));
  char v10 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self L1Score];
  unint64_t v95 = objc_msgSend(v10, "numberWithDouble:");
  unsigned int v11 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self freshness];
  uint64_t v96 = objc_msgSend(v11, "numberWithDouble:");
  uint64_t v92 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchLabeledData favorited](self, "favorited"));
  unint64_t v12 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self aestheticScore];
  uint64_t v94 = objc_msgSend(v12, "numberWithDouble:");
  uint64_t v13 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self curationScore];
  unint64_t v91 = objc_msgSend(v13, "numberWithDouble:");
  uint64_t v14 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self hasEverClickInLastWeek];
  unint64_t v93 = objc_msgSend(v14, "numberWithDouble:");
  unint64_t v15 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self hasEverClickInLastMonth];
  uint64_t v88 = objc_msgSend(v15, "numberWithDouble:");
  char v16 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self hasEverShareInLastWeek];
  uint64_t v90 = objc_msgSend(v16, "numberWithDouble:");
  BOOL v17 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self hasEverShareInLastMonth];
  unint64_t v87 = objc_msgSend(v17, "numberWithDouble:");
  int v18 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self clickCountInLastWeekNormalizedAcrossItems];
  uint64_t v86 = objc_msgSend(v18, "numberWithDouble:");
  id v19 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self clickCountInLastMonthNormalizedAcrossItems];
  unint64_t v89 = objc_msgSend(v19, "numberWithDouble:");
  uint64_t v20 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self shareCountInLastWeekNormalizedAcrossItems];
  unint64_t v83 = objc_msgSend(v20, "numberWithDouble:");
  double v21 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self shareCountInLastMonthNormalizedAcrossItems];
  unint64_t v85 = objc_msgSend(v21, "numberWithDouble:");
  char v22 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems];
  uint64_t v82 = objc_msgSend(v22, "numberWithDouble:");
  unsigned int v23 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems];
  unint64_t v81 = objc_msgSend(v23, "numberWithDouble:");
  uint64_t v24 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenLocationInLastWeekNormalizedAcrossItems];
  uint64_t v80 = objc_msgSend(v24, "numberWithDouble:");
  uint64_t v25 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenLocationInLastMonthNormalizedAcrossItems];
  uint64_t v84 = objc_msgSend(v25, "numberWithDouble:");
  uint64_t v26 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems];
  unint64_t v77 = objc_msgSend(v26, "numberWithDouble:");
  unint64_t v27 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems];
  unint64_t v79 = objc_msgSend(v27, "numberWithDouble:");
  char v28 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems];
  uint64_t v76 = objc_msgSend(v28, "numberWithDouble:");
  uint64_t v29 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems];
  unint64_t v75 = objc_msgSend(v29, "numberWithDouble:");
  unint64_t v30 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems];
  uint64_t v74 = objc_msgSend(v30, "numberWithDouble:");
  double v31 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems];
  unint64_t v73 = objc_msgSend(v31, "numberWithDouble:");
  uint64_t v32 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems];
  uint64_t v78 = objc_msgSend(v32, "numberWithDouble:");
  unint64_t v33 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems];
  unint64_t v71 = objc_msgSend(v33, "numberWithDouble:");
  uint64_t v34 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems];
  uint64_t v72 = objc_msgSend(v34, "numberWithDouble:");
  unint64_t v35 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems];
  unint64_t v69 = objc_msgSend(v35, "numberWithDouble:");
  uint64_t v36 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenLocationInLastWeekNormalizedAcrossItems];
  uint64_t v66 = objc_msgSend(v36, "numberWithDouble:");
  unint64_t v37 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenLocationInLastMonthNormalizedAcrossItems];
  unint64_t v65 = objc_msgSend(v37, "numberWithDouble:");
  uint64_t v38 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems];
  uint64_t v64 = objc_msgSend(v38, "numberWithDouble:");
  unint64_t v39 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems];
  uint64_t v70 = objc_msgSend(v39, "numberWithDouble:");
  uint64_t v40 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems];
  unint64_t v63 = objc_msgSend(v40, "numberWithDouble:");
  unint64_t v41 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems];
  uint64_t v62 = objc_msgSend(v41, "numberWithDouble:");
  uint64_t v42 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems];
  uint64_t v59 = objc_msgSend(v42, "numberWithDouble:");
  unint64_t v43 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems];
  char v61 = objc_msgSend(v43, "numberWithDouble:");
  char v44 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems];
  unint64_t v60 = objc_msgSend(v44, "numberWithDouble:");
  unsigned int v45 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems];
  uint64_t v58 = objc_msgSend(v45, "numberWithDouble:");
  uint64_t v46 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self clipScore];
  uint64_t v57 = objc_msgSend(v46, "numberWithDouble:");
  unsigned int v56 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAeroMLPhotosSearchLabeledData clicked](self, "clicked"));
  char v55 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchLabeledData clickOrder](self, "clickOrder"));
  unint64_t v54 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchLabeledData itemPosition](self, "itemPosition"));
  uint64_t v47 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self L2ModelScore];
  uint64_t v48 = objc_msgSend(v47, "numberWithDouble:");
  unint64_t v49 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self isDuplicate];
  char v50 = objc_msgSend(v49, "numberWithDouble:");
  uint64_t v51 = NSNumber;
  [(BMAeroMLPhotosSearchLabeledData *)self isCompleteMatch];
  unint64_t v52 = objc_msgSend(v51, "numberWithDouble:");
  id v68 = (id)objc_msgSend(v67, "initWithFormat:", @"BMAeroMLPhotosSearchLabeledData with searchSessionUUID: %@, uiSurface: %@, matchedPeopleRatio: %@, matchedLocationRatio: %@, matchedSceneRatio: %@, matchedSceneConfidence: %@, matchedSceneBoundingBox: %@, matchedOCRCharacterRatio: %@, matchedOCRImportance: %@, matchedFieldsCount: %@, L1Score: %@, freshness: %@, favorited: %@, aestheticScore: %@, curationScore: %@, hasEverClickInLastWeek: %@, hasEverClickInLastMonth: %@, hasEverShareInLastWeek: %@, hasEverShareInLastMonth: %@, clickCountInLastWeekNormalizedAcrossItems: %@, clickCountInLastMonthNormalizedAcrossItems: %@, shareCountInLastWeekNormalizedAcrossItems: %@, shareCountInLastMonthNormalizedAcrossItems: %@, clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems: %@, clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems: %@, clickCountGivenLocationInLastWeekNormalizedAcrossItems: %@, clickCountGivenLocationInLastMonthNormalizedAcrossItems: %@, clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems: %@, clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems: %@, clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems: %@, clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems: %@, clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems: %@, clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems: %@, clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems: %@, clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems: %@, shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems: %@, shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems: %@, shareCountGivenLocationInLastWeekNormalizedAcrossItems: %@, shareCountGivenLocationInLastMonthNormalizedAcrossItems: %@, shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems: %@, shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems: %@, shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems: %@, shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems: %@, shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems: %@, shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems: %@, shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems: %@, shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems: %@, clipScore: %@, clicked: %@, clickOrder: %@, itemPosition: %@, L2ModelScore: %@, isDuplicate: %@, isCompleteMatch: %@", v103, v106, v105, v104, v100, v102, v101, v97, v99, v98, v95, v96, v92, v94, v91, v93,
              v88,
              v90,
              v87,
              v86,
              v89,
              v83,
              v85,
              v82,
              v81,
              v80,
              v84,
              v77,
              v79,
              v76,
              v75,
              v74,
              v73,
              v78,
              v71,
              v72,
              v69,
              v66,
              v65,
              v64,
              v70,
              v63,
              v62,
              v59,
              v61,
              v60,
              v58,
              v57,
              v56,
              v55,
              v54,
              v48,
              v50,
              v52);

  return (NSString *)v68;
}

- (BMAeroMLPhotosSearchLabeledData)initWithSearchSessionUUID:(id)a3 uiSurface:(int)a4 matchedPeopleRatio:(id)a5 matchedLocationRatio:(id)a6 matchedSceneRatio:(id)a7 matchedSceneConfidence:(id)a8 matchedSceneBoundingBox:(id)a9 matchedOCRCharacterRatio:(id)a10 matchedOCRImportance:(id)a11 matchedFieldsCount:(id)a12 L1Score:(id)a13 freshness:(id)a14 favorited:(id)a15 aestheticScore:(id)a16 curationScore:(id)a17 hasEverClickInLastWeek:(id)a18 hasEverClickInLastMonth:(id)a19 hasEverShareInLastWeek:(id)a20 hasEverShareInLastMonth:(id)a21 clickCountInLastWeekNormalizedAcrossItems:(id)a22 clickCountInLastMonthNormalizedAcrossItems:(id)a23 shareCountInLastWeekNormalizedAcrossItems:(id)a24 shareCountInLastMonthNormalizedAcrossItems:(id)a25 clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(id)a26 clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(id)a27 clickCountGivenLocationInLastWeekNormalizedAcrossItems:(id)a28 clickCountGivenLocationInLastMonthNormalizedAcrossItems:(id)a29 clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(id)a30 clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(id)a31 clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(id)a32 clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(id)a33 clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(id)a34 clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(id)a35 clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(id)a36 clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(id)a37 shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(id)a38 shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(id)a39 shareCountGivenLocationInLastWeekNormalizedAcrossItems:(id)a40 shareCountGivenLocationInLastMonthNormalizedAcrossItems:(id)a41 shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(id)a42 shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(id)a43 shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(id)a44 shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(id)a45 shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(id)a46 shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(id)a47 shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(id)a48 shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(id)a49 clipScore:(id)a50 clicked:(id)a51 clickOrder:(id)a52 itemPosition:(id)a53 L2ModelScore:(id)a54 isDuplicate:(id)a55 isCompleteMatch:(id)a56
{
  id v125 = a3;
  id v169 = a5;
  id v170 = a6;
  id v166 = a7;
  id v168 = a8;
  id v165 = a9;
  id v164 = a10;
  id v163 = a11;
  id v162 = a12;
  id v126 = a13;
  id v60 = a14;
  id v161 = a15;
  id v61 = a16;
  id v62 = a17;
  id v63 = a18;
  id v64 = a19;
  id v65 = a20;
  id v66 = a21;
  id v67 = a22;
  id v160 = a23;
  id v159 = a24;
  id v158 = a25;
  id v157 = a26;
  id v156 = a27;
  id v155 = a28;
  id v154 = a29;
  id v153 = a30;
  id v152 = a31;
  id v151 = a32;
  id v150 = a33;
  id v149 = a34;
  id v148 = a35;
  id v147 = a36;
  id v146 = a37;
  id v145 = a38;
  id v144 = a39;
  id v143 = a40;
  id v142 = a41;
  id v141 = a42;
  id v140 = a43;
  id v139 = a44;
  id v138 = a45;
  id v137 = a46;
  id v136 = a47;
  id v135 = a48;
  id v134 = a49;
  id v133 = a50;
  id v132 = a51;
  id v131 = a52;
  id v130 = a53;
  id v129 = a54;
  id v128 = a55;
  id v127 = a56;
  v171.receiver = self;
  v171.super_class = (Class)BMAeroMLPhotosSearchLabeledData;
  id v68 = [(BMEventBase *)&v171 init];

  if (v68)
  {
    v68->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v68->_searchSessionUUID, a3);
    v68->_uiSurface = a4;
    if (v169)
    {
      v68->_hasMatchedPeopleRatio = 1;
      [v169 doubleValue];
    }
    else
    {
      v68->_hasMatchedPeopleRatio = 0;
      double v69 = -1.0;
    }
    v68->_matchedPeopleRatio = v69;
    if (v170)
    {
      v68->_hasMatchedLocationRatio = 1;
      [v170 doubleValue];
    }
    else
    {
      v68->_hasMatchedLocationRatio = 0;
      double v70 = -1.0;
    }
    v68->_matchedLocationRatio = v70;
    if (v166)
    {
      v68->_hasMatchedSceneRatio = 1;
      [v166 doubleValue];
    }
    else
    {
      v68->_hasMatchedSceneRatio = 0;
      double v71 = -1.0;
    }
    v68->_matchedSceneRatio = v71;
    if (v168)
    {
      v68->_hasMatchedSceneConfidence = 1;
      [v168 doubleValue];
    }
    else
    {
      v68->_hasMatchedSceneConfidence = 0;
      double v72 = -1.0;
    }
    v68->_matchedSceneConfidence = v72;
    if (v165)
    {
      v68->_hasMatchedSceneBoundingBox = 1;
      [v165 doubleValue];
    }
    else
    {
      v68->_hasMatchedSceneBoundingBox = 0;
      double v73 = -1.0;
    }
    v68->_matchedSceneBoundingBox = v73;
    if (v164)
    {
      v68->_hasMatchedOCRCharacterRatio = 1;
      [v164 doubleValue];
    }
    else
    {
      v68->_hasMatchedOCRCharacterRatio = 0;
      double v74 = -1.0;
    }
    v68->_matchedOCRCharacterRatio = v74;
    if (v163)
    {
      v68->_hasMatchedOCRImportance = 1;
      [v163 doubleValue];
    }
    else
    {
      v68->_hasMatchedOCRImportance = 0;
      double v75 = -1.0;
    }
    v68->_matchedOCRImportance = v75;
    unsigned int v76 = v162;
    if (v162)
    {
      v68->_hasMatchedFieldsCount = 1;
      unsigned int v76 = [v162 unsignedIntValue];
    }
    else
    {
      v68->_hasMatchedFieldsCount = 0;
    }
    v68->_matchedFieldsCount = v76;
    if (v126)
    {
      v68->_hasL1Score = 1;
      [v126 doubleValue];
    }
    else
    {
      v68->_hasL1Score = 0;
      double v77 = -1.0;
    }
    uint64_t v78 = v61;
    v68->_L1Score = v77;
    if (v60)
    {
      v68->_hasFreshness = 1;
      id v79 = v60;
      [v60 doubleValue];
    }
    else
    {
      id v79 = 0;
      v68->_hasFreshness = 0;
      double v80 = -1.0;
    }
    v68->_freshness = v80;
    if (v161)
    {
      v68->_hasFavorited = 1;
      v68->_favorited = [v161 BOOLValue];
    }
    else
    {
      v68->_hasFavorited = 0;
      v68->_favorited = 0;
    }
    id v60 = v79;
    id v61 = v78;
    if (v78)
    {
      v68->_hasAestheticScore = 1;
      [v78 doubleValue];
    }
    else
    {
      v68->_hasAestheticScore = 0;
      double v81 = -1.0;
    }
    v68->_aestheticScore = v81;
    if (v62)
    {
      v68->_hasCurationScore = 1;
      [v62 doubleValue];
    }
    else
    {
      v68->_hasCurationScore = 0;
      double v82 = -1.0;
    }
    v68->_curationScore = v82;
    if (v63)
    {
      v68->_hasHasEverClickInLastWeek = 1;
      [v63 doubleValue];
    }
    else
    {
      v68->_hasHasEverClickInLastWeek = 0;
      double v83 = -1.0;
    }
    v68->_hasEverClickInLastWeek = v83;
    if (v64)
    {
      v68->_hasHasEverClickInLastMonth = 1;
      [v64 doubleValue];
    }
    else
    {
      v68->_hasHasEverClickInLastMonth = 0;
      double v84 = -1.0;
    }
    v68->_hasEverClickInLastMonth = v84;
    if (v65)
    {
      v68->_hasHasEverShareInLastWeek = 1;
      [v65 doubleValue];
    }
    else
    {
      v68->_hasHasEverShareInLastWeek = 0;
      double v85 = -1.0;
    }
    v68->_hasEverShareInLastWeek = v85;
    if (v66)
    {
      v68->_hasHasEverShareInLastMonth = 1;
      [v66 doubleValue];
    }
    else
    {
      v68->_hasHasEverShareInLastMonth = 0;
      double v86 = -1.0;
    }
    v68->_hasEverShareInLastMonth = v86;
    if (v67)
    {
      v68->_hasClickCountInLastWeekNormalizedAcrossItems = 1;
      [v67 doubleValue];
    }
    else
    {
      v68->_hasClickCountInLastWeekNormalizedAcrossItems = 0;
      double v87 = -1.0;
    }
    v68->_clickCountInLastWeekNormalizedAcrossItems = v87;
    if (v160)
    {
      v68->_hasClickCountInLastMonthNormalizedAcrossItems = 1;
      [v160 doubleValue];
    }
    else
    {
      v68->_hasClickCountInLastMonthNormalizedAcrossItems = 0;
      double v88 = -1.0;
    }
    v68->_clickCountInLastMonthNormalizedAcrossItems = v88;
    if (v159)
    {
      v68->_hasShareCountInLastWeekNormalizedAcrossItems = 1;
      [v159 doubleValue];
    }
    else
    {
      v68->_hasShareCountInLastWeekNormalizedAcrossItems = 0;
      double v89 = -1.0;
    }
    v68->_shareCountInLastWeekNormalizedAcrossItems = v89;
    if (v158)
    {
      v68->_hasShareCountInLastMonthNormalizedAcrossItems = 1;
      [v158 doubleValue];
    }
    else
    {
      v68->_hasShareCountInLastMonthNormalizedAcrossItems = 0;
      double v90 = -1.0;
    }
    v68->_shareCountInLastMonthNormalizedAcrossItems = v90;
    if (v157)
    {
      v68->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 1;
      [v157 doubleValue];
    }
    else
    {
      v68->_hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 0;
      double v91 = -1.0;
    }
    v68->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = v91;
    if (v156)
    {
      v68->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 1;
      [v156 doubleValue];
    }
    else
    {
      v68->_hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 0;
      double v92 = -1.0;
    }
    v68->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = v92;
    if (v155)
    {
      v68->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems = 1;
      [v155 doubleValue];
    }
    else
    {
      v68->_hasClickCountGivenLocationInLastWeekNormalizedAcrossItems = 0;
      double v93 = -1.0;
    }
    v68->_clickCountGivenLocationInLastWeekNormalizedAcrossItems = v93;
    if (v154)
    {
      v68->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems = 1;
      [v154 doubleValue];
    }
    else
    {
      v68->_hasClickCountGivenLocationInLastMonthNormalizedAcrossItems = 0;
      double v94 = -1.0;
    }
    v68->_clickCountGivenLocationInLastMonthNormalizedAcrossItems = v94;
    if (v153)
    {
      v68->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 1;
      [v153 doubleValue];
    }
    else
    {
      v68->_hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 0;
      double v95 = -1.0;
    }
    v68->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = v95;
    if (v152)
    {
      v68->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 1;
      [v152 doubleValue];
    }
    else
    {
      v68->_hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 0;
      double v96 = -1.0;
    }
    v68->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = v96;
    if (v151)
    {
      v68->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 1;
      [v151 doubleValue];
    }
    else
    {
      v68->_hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 0;
      double v97 = -1.0;
    }
    v68->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = v97;
    if (v150)
    {
      v68->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 1;
      [v150 doubleValue];
    }
    else
    {
      v68->_hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 0;
      double v98 = -1.0;
    }
    v68->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = v98;
    if (v149)
    {
      v68->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 1;
      [v149 doubleValue];
    }
    else
    {
      v68->_hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 0;
      double v99 = -1.0;
    }
    v68->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = v99;
    if (v148)
    {
      v68->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 1;
      [v148 doubleValue];
    }
    else
    {
      v68->_hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 0;
      double v100 = -1.0;
    }
    v68->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = v100;
    if (v147)
    {
      v68->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 1;
      [v147 doubleValue];
    }
    else
    {
      v68->_hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 0;
      double v101 = -1.0;
    }
    v68->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = v101;
    if (v146)
    {
      v68->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 1;
      [v146 doubleValue];
    }
    else
    {
      v68->_hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 0;
      double v102 = -1.0;
    }
    v68->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = v102;
    if (v145)
    {
      v68->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 1;
      [v145 doubleValue];
    }
    else
    {
      v68->_hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = 0;
      double v103 = -1.0;
    }
    v68->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = v103;
    if (v144)
    {
      v68->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 1;
      [v144 doubleValue];
    }
    else
    {
      v68->_hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = 0;
      double v104 = -1.0;
    }
    v68->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = v104;
    if (v143)
    {
      v68->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems = 1;
      [v143 doubleValue];
    }
    else
    {
      v68->_hasShareCountGivenLocationInLastWeekNormalizedAcrossItems = 0;
      double v105 = -1.0;
    }
    v68->_shareCountGivenLocationInLastWeekNormalizedAcrossItems = v105;
    if (v142)
    {
      v68->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems = 1;
      [v142 doubleValue];
    }
    else
    {
      v68->_hasShareCountGivenLocationInLastMonthNormalizedAcrossItems = 0;
      double v106 = -1.0;
    }
    v68->_shareCountGivenLocationInLastMonthNormalizedAcrossItems = v106;
    if (v141)
    {
      v68->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 1;
      [v141 doubleValue];
    }
    else
    {
      v68->_hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = 0;
      double v107 = -1.0;
    }
    v68->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = v107;
    if (v140)
    {
      v68->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 1;
      [v140 doubleValue];
    }
    else
    {
      v68->_hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = 0;
      double v108 = -1.0;
    }
    v68->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = v108;
    if (v139)
    {
      v68->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 1;
      [v139 doubleValue];
    }
    else
    {
      v68->_hasShareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = 0;
      double v109 = -1.0;
    }
    v68->_shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = v109;
    if (v138)
    {
      v68->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 1;
      [v138 doubleValue];
    }
    else
    {
      v68->_hasShareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = 0;
      double v110 = -1.0;
    }
    v68->_shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = v110;
    if (v137)
    {
      v68->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 1;
      [v137 doubleValue];
    }
    else
    {
      v68->_hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = 0;
      double v111 = -1.0;
    }
    v68->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = v111;
    if (v136)
    {
      v68->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 1;
      [v136 doubleValue];
    }
    else
    {
      v68->_hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = 0;
      double v112 = -1.0;
    }
    v68->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = v112;
    if (v135)
    {
      v68->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 1;
      [v135 doubleValue];
    }
    else
    {
      v68->_hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = 0;
      double v113 = -1.0;
    }
    v68->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = v113;
    if (v134)
    {
      v68->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 1;
      [v134 doubleValue];
    }
    else
    {
      v68->_hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = 0;
      double v114 = -1.0;
    }
    v68->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = v114;
    if (v133)
    {
      v68->_hasClipScore = 1;
      [v133 doubleValue];
    }
    else
    {
      v68->_hasClipScore = 0;
      double v115 = -1.0;
    }
    v68->_clipScore = v115;
    if (v132)
    {
      v68->_hasClicked = 1;
      v68->_clicked = [v132 BOOLValue];
    }
    else
    {
      v68->_hasClicked = 0;
      v68->_clicked = 0;
    }
    unsigned int v116 = v131;
    if (v131)
    {
      v68->_hasClickOrder = 1;
      unsigned int v116 = [v131 unsignedIntValue];
    }
    else
    {
      v68->_hasClickOrder = 0;
    }
    v68->_clickOrder = v116;
    unsigned int v117 = v130;
    if (v130)
    {
      v68->_hasItemPosition = 1;
      unsigned int v117 = [v130 unsignedIntValue];
    }
    else
    {
      v68->_hasItemPosition = 0;
    }
    v68->_itemPosition = v117;
    if (v129)
    {
      v68->_hasL2ModelScore = 1;
      [v129 doubleValue];
    }
    else
    {
      v68->_hasL2ModelScore = 0;
      double v118 = -1.0;
    }
    v68->_L2ModelScore = v118;
    if (v128)
    {
      v68->_hasIsDuplicate = 1;
      [v128 doubleValue];
    }
    else
    {
      v68->_hasIsDuplicate = 0;
      double v119 = -1.0;
    }
    v68->_isDuplicate = v119;
    if (v127)
    {
      v68->_hasIsCompleteMatch = 1;
      [v127 doubleValue];
    }
    else
    {
      v68->_hasIsCompleteMatch = 0;
      double v120 = -1.0;
    }
    v68->_isCompleteMatch = v120;
  }
  unint64_t v121 = v68;

  return v121;
}

+ (id)protoFields
{
  v58[54] = *MEMORY[0x1E4F143B8];
  uint64_t v57 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"searchSessionUUID" number:1 type:13 subMessageClass:0];
  v58[0] = v57;
  unsigned int v56 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uiSurface" number:2 type:4 subMessageClass:0];
  v58[1] = v56;
  char v55 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedPeopleRatio" number:3 type:0 subMessageClass:0];
  v58[2] = v55;
  unint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedLocationRatio" number:4 type:0 subMessageClass:0];
  v58[3] = v54;
  uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedSceneRatio" number:5 type:0 subMessageClass:0];
  v58[4] = v53;
  unint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedSceneConfidence" number:6 type:0 subMessageClass:0];
  v58[5] = v52;
  uint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedSceneBoundingBox" number:7 type:0 subMessageClass:0];
  v58[6] = v51;
  char v50 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedOCRCharacterRatio" number:8 type:0 subMessageClass:0];
  v58[7] = v50;
  unint64_t v49 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedOCRImportance" number:9 type:0 subMessageClass:0];
  v58[8] = v49;
  uint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedFieldsCount" number:10 type:4 subMessageClass:0];
  v58[9] = v48;
  uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"L1Score" number:11 type:0 subMessageClass:0];
  v58[10] = v47;
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"freshness" number:12 type:0 subMessageClass:0];
  v58[11] = v46;
  unsigned int v45 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"favorited" number:13 type:12 subMessageClass:0];
  v58[12] = v45;
  char v44 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"aestheticScore" number:14 type:0 subMessageClass:0];
  v58[13] = v44;
  unint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"curationScore" number:15 type:0 subMessageClass:0];
  v58[14] = v43;
  uint64_t v42 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasEverClickInLastWeek" number:16 type:0 subMessageClass:0];
  v58[15] = v42;
  unint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasEverClickInLastMonth" number:17 type:0 subMessageClass:0];
  v58[16] = v41;
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasEverShareInLastWeek" number:18 type:0 subMessageClass:0];
  v58[17] = v40;
  unint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasEverShareInLastMonth" number:19 type:0 subMessageClass:0];
  v58[18] = v39;
  uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountInLastWeekNormalizedAcrossItems" number:20 type:0 subMessageClass:0];
  v58[19] = v38;
  unint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountInLastMonthNormalizedAcrossItems" number:21 type:0 subMessageClass:0];
  v58[20] = v37;
  uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountInLastWeekNormalizedAcrossItems" number:22 type:0 subMessageClass:0];
  v58[21] = v36;
  unint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountInLastMonthNormalizedAcrossItems" number:23 type:0 subMessageClass:0];
  v58[22] = v35;
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems" number:24 type:0 subMessageClass:0];
  v58[23] = v34;
  unint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems" number:25 type:0 subMessageClass:0];
  v58[24] = v33;
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenLocationInLastWeekNormalizedAcrossItems" number:26 type:0 subMessageClass:0];
  v58[25] = v32;
  double v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenLocationInLastMonthNormalizedAcrossItems" number:27 type:0 subMessageClass:0];
  v58[26] = v31;
  unint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems" number:28 type:0 subMessageClass:0];
  v58[27] = v30;
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems" number:29 type:0 subMessageClass:0];
  v58[28] = v29;
  char v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems" number:30 type:0 subMessageClass:0];
  v58[29] = v28;
  unint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems" number:31 type:0 subMessageClass:0];
  v58[30] = v27;
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems" number:32 type:0 subMessageClass:0];
  v58[31] = v26;
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems" number:33 type:0 subMessageClass:0];
  v58[32] = v25;
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems" number:34 type:0 subMessageClass:0];
  v58[33] = v24;
  unsigned int v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems" number:35 type:0 subMessageClass:0];
  v58[34] = v23;
  char v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems" number:36 type:0 subMessageClass:0];
  v58[35] = v22;
  double v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems" number:37 type:0 subMessageClass:0];
  v58[36] = v21;
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenLocationInLastWeekNormalizedAcrossItems" number:38 type:0 subMessageClass:0];
  v58[37] = v20;
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenLocationInLastMonthNormalizedAcrossItems" number:39 type:0 subMessageClass:0];
  v58[38] = v19;
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems" number:40 type:0 subMessageClass:0];
  v58[39] = v18;
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems" number:41 type:0 subMessageClass:0];
  v58[40] = v17;
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems" number:42 type:0 subMessageClass:0];
  v58[41] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems" number:43 type:0 subMessageClass:0];
  v58[42] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems" number:44 type:0 subMessageClass:0];
  v58[43] = v14;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems" number:45 type:0 subMessageClass:0];
  v58[44] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems" number:46 type:0 subMessageClass:0];
  v58[45] = v3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems" number:47 type:0 subMessageClass:0];
  v58[46] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clipScore" number:48 type:0 subMessageClass:0];
  v58[47] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clicked" number:49 type:12 subMessageClass:0];
  v58[48] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clickOrder" number:50 type:4 subMessageClass:0];
  v58[49] = v7;
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"itemPosition" number:51 type:4 subMessageClass:0];
  v58[50] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"L2ModelScore" number:52 type:0 subMessageClass:0];
  v58[51] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isDuplicate" number:53 type:0 subMessageClass:0];
  v58[52] = v10;
  unsigned int v11 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isCompleteMatch" number:54 type:0 subMessageClass:0];
  v58[53] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:54];

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7008;
}

+ (id)columns
{
  v58[54] = *MEMORY[0x1E4F143B8];
  uint64_t v57 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"searchSessionUUID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  unsigned int v56 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uiSurface" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  unint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedPeopleRatio" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  char v55 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedLocationRatio" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:0];
  unint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedSceneRatio" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:0];
  uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedSceneConfidence" dataType:1 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:0];
  uint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedSceneBoundingBox" dataType:1 requestOnly:0 fieldNumber:7 protoDataType:0 convertedType:0];
  char v50 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedOCRCharacterRatio" dataType:1 requestOnly:0 fieldNumber:8 protoDataType:0 convertedType:0];
  unint64_t v49 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedOCRImportance" dataType:1 requestOnly:0 fieldNumber:9 protoDataType:0 convertedType:0];
  uint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedFieldsCount" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:4 convertedType:0];
  uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"L1Score" dataType:1 requestOnly:0 fieldNumber:11 protoDataType:0 convertedType:0];
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"freshness" dataType:1 requestOnly:0 fieldNumber:12 protoDataType:0 convertedType:0];
  unsigned int v45 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"favorited" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:12 convertedType:0];
  char v44 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"aestheticScore" dataType:1 requestOnly:0 fieldNumber:14 protoDataType:0 convertedType:0];
  unint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"curationScore" dataType:1 requestOnly:0 fieldNumber:15 protoDataType:0 convertedType:0];
  uint64_t v42 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasEverClickInLastWeek" dataType:1 requestOnly:0 fieldNumber:16 protoDataType:0 convertedType:0];
  unint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasEverClickInLastMonth" dataType:1 requestOnly:0 fieldNumber:17 protoDataType:0 convertedType:0];
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasEverShareInLastWeek" dataType:1 requestOnly:0 fieldNumber:18 protoDataType:0 convertedType:0];
  unint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasEverShareInLastMonth" dataType:1 requestOnly:0 fieldNumber:19 protoDataType:0 convertedType:0];
  uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:20 protoDataType:0 convertedType:0];
  unint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:21 protoDataType:0 convertedType:0];
  uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:22 protoDataType:0 convertedType:0];
  unint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:23 protoDataType:0 convertedType:0];
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:24 protoDataType:0 convertedType:0];
  unint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:25 protoDataType:0 convertedType:0];
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenLocationInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:26 protoDataType:0 convertedType:0];
  double v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenLocationInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:27 protoDataType:0 convertedType:0];
  unint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:28 protoDataType:0 convertedType:0];
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:29 protoDataType:0 convertedType:0];
  char v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:30 protoDataType:0 convertedType:0];
  unint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:31 protoDataType:0 convertedType:0];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:32 protoDataType:0 convertedType:0];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:33 protoDataType:0 convertedType:0];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:34 protoDataType:0 convertedType:0];
  unsigned int v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:35 protoDataType:0 convertedType:0];
  char v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:36 protoDataType:0 convertedType:0];
  double v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:37 protoDataType:0 convertedType:0];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenLocationInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:38 protoDataType:0 convertedType:0];
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenLocationInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:39 protoDataType:0 convertedType:0];
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:40 protoDataType:0 convertedType:0];
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:41 protoDataType:0 convertedType:0];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:42 protoDataType:0 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:43 protoDataType:0 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:44 protoDataType:0 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:45 protoDataType:0 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:46 protoDataType:0 convertedType:0];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems" dataType:1 requestOnly:0 fieldNumber:47 protoDataType:0 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clipScore" dataType:1 requestOnly:0 fieldNumber:48 protoDataType:0 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clicked" dataType:0 requestOnly:0 fieldNumber:49 protoDataType:12 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clickOrder" dataType:0 requestOnly:0 fieldNumber:50 protoDataType:4 convertedType:0];
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemPosition" dataType:0 requestOnly:0 fieldNumber:51 protoDataType:4 convertedType:0];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"L2ModelScore" dataType:1 requestOnly:0 fieldNumber:52 protoDataType:0 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isDuplicate" dataType:1 requestOnly:0 fieldNumber:53 protoDataType:0 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isCompleteMatch" dataType:1 requestOnly:0 fieldNumber:54 protoDataType:0 convertedType:0];
  v58[0] = v57;
  v58[1] = v56;
  v58[2] = v54;
  v58[3] = v55;
  v58[4] = v52;
  v58[5] = v53;
  v58[6] = v51;
  v58[7] = v50;
  v58[8] = v49;
  v58[9] = v48;
  v58[10] = v47;
  v58[11] = v46;
  v58[12] = v45;
  v58[13] = v44;
  v58[14] = v43;
  v58[15] = v42;
  v58[16] = v41;
  v58[17] = v40;
  v58[18] = v39;
  v58[19] = v38;
  v58[20] = v37;
  v58[21] = v36;
  v58[22] = v35;
  v58[23] = v34;
  v58[24] = v33;
  v58[25] = v32;
  v58[26] = v31;
  v58[27] = v30;
  v58[28] = v29;
  v58[29] = v28;
  v58[30] = v27;
  v58[31] = v26;
  v58[32] = v25;
  v58[33] = v24;
  v58[34] = v23;
  v58[35] = v22;
  v58[36] = v21;
  v58[37] = v20;
  v58[38] = v19;
  v58[39] = v18;
  v58[40] = v17;
  v58[41] = v16;
  v58[42] = v15;
  v58[43] = v14;
  v58[44] = v2;
  v58[45] = v3;
  v58[46] = v4;
  v58[47] = v5;
  v58[48] = v6;
  v58[49] = v7;
  v58[50] = v8;
  v58[51] = v13;
  v58[52] = v9;
  v58[53] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:54];

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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    double v8 = [[BMAeroMLPhotosSearchLabeledData alloc] initByReadFrom:v7];
    uint64_t v4 = v8;
    if (v8) {
      v8[18] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end