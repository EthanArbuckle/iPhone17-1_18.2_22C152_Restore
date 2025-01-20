@interface AMLPhotosSearchLabeledData
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
- (BOOL)hasSearchSessionUUID;
- (BOOL)hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
- (BOOL)hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
- (BOOL)hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
- (BOOL)hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
- (BOOL)hasShareCountGivenLocationInLastMonthNormalizedAcrossItems;
- (BOOL)hasShareCountGivenLocationInLastWeekNormalizedAcrossItems;
- (BOOL)hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
- (BOOL)hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
- (BOOL)hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
- (BOOL)hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
- (BOOL)hasShareCountInLastMonthNormalizedAcrossItems;
- (BOOL)hasShareCountInLastWeekNormalizedAcrossItems;
- (BOOL)hasUiSurface;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)searchSessionUUID;
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
- (double)l1Score;
- (double)l2ModelScore;
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
- (double)shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
- (double)shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
- (double)shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
- (double)shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
- (double)shareCountInLastMonthNormalizedAcrossItems;
- (double)shareCountInLastWeekNormalizedAcrossItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)uiSurfaceAsString:(int)a3;
- (int)StringAsUiSurface:(id)a3;
- (int)uiSurface;
- (unint64_t)hash;
- (unsigned)clickOrder;
- (unsigned)itemPosition;
- (unsigned)matchedFieldsCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAestheticScore:(double)a3;
- (void)setClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(double)a3;
- (void)setClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(double)a3;
- (void)setClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(double)a3;
- (void)setClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(double)a3;
- (void)setClickCountGivenLocationInLastMonthNormalizedAcrossItems:(double)a3;
- (void)setClickCountGivenLocationInLastWeekNormalizedAcrossItems:(double)a3;
- (void)setClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(double)a3;
- (void)setClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(double)a3;
- (void)setClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(double)a3;
- (void)setClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(double)a3;
- (void)setClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(double)a3;
- (void)setClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(double)a3;
- (void)setClickCountInLastMonthNormalizedAcrossItems:(double)a3;
- (void)setClickCountInLastWeekNormalizedAcrossItems:(double)a3;
- (void)setClickOrder:(unsigned int)a3;
- (void)setClicked:(BOOL)a3;
- (void)setClipScore:(double)a3;
- (void)setCurationScore:(double)a3;
- (void)setFavorited:(BOOL)a3;
- (void)setFreshness:(double)a3;
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
- (void)setHasEverClickInLastMonth:(double)a3;
- (void)setHasEverClickInLastWeek:(double)a3;
- (void)setHasEverShareInLastMonth:(double)a3;
- (void)setHasEverShareInLastWeek:(double)a3;
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
- (void)setHasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountInLastMonthNormalizedAcrossItems:(BOOL)a3;
- (void)setHasShareCountInLastWeekNormalizedAcrossItems:(BOOL)a3;
- (void)setHasUiSurface:(BOOL)a3;
- (void)setIsCompleteMatch:(double)a3;
- (void)setIsDuplicate:(double)a3;
- (void)setItemPosition:(unsigned int)a3;
- (void)setL1Score:(double)a3;
- (void)setL2ModelScore:(double)a3;
- (void)setMatchedFieldsCount:(unsigned int)a3;
- (void)setMatchedLocationRatio:(double)a3;
- (void)setMatchedOCRCharacterRatio:(double)a3;
- (void)setMatchedOCRImportance:(double)a3;
- (void)setMatchedPeopleRatio:(double)a3;
- (void)setMatchedSceneBoundingBox:(double)a3;
- (void)setMatchedSceneConfidence:(double)a3;
- (void)setMatchedSceneRatio:(double)a3;
- (void)setSearchSessionUUID:(id)a3;
- (void)setShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(double)a3;
- (void)setShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(double)a3;
- (void)setShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(double)a3;
- (void)setShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(double)a3;
- (void)setShareCountGivenLocationInLastMonthNormalizedAcrossItems:(double)a3;
- (void)setShareCountGivenLocationInLastWeekNormalizedAcrossItems:(double)a3;
- (void)setShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(double)a3;
- (void)setShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(double)a3;
- (void)setShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(double)a3;
- (void)setShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(double)a3;
- (void)setShareCountInLastMonthNormalizedAcrossItems:(double)a3;
- (void)setShareCountInLastWeekNormalizedAcrossItems:(double)a3;
- (void)setUiSurface:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AMLPhotosSearchLabeledData

- (BOOL)hasSearchSessionUUID
{
  return self->_searchSessionUUID != 0;
}

- (int)uiSurface
{
  if (*((unsigned char *)&self->_has + 6)) {
    return self->_uiSurface;
  }
  else {
    return 0;
  }
}

- (void)setUiSurface:(int)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_uiSurface = a3;
}

- (void)setHasUiSurface:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasUiSurface
{
  return *((unsigned char *)&self->_has + 6) & 1;
}

- (id)uiSurfaceAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_265220160[a3];
  }

  return v3;
}

- (int)StringAsUiSurface:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AMLUISurfaceTypeUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AMLUISurfaceTypeSpotlight"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AMLUISurfaceTypePhotosApp"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AMLUISurfaceTypeStoryTellingBackground"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setMatchedPeopleRatio:(double)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_matchedPeopleRatio = a3;
}

- (void)setHasMatchedPeopleRatio:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasMatchedPeopleRatio
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setMatchedLocationRatio:(double)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_matchedLocationRatio = a3;
}

- (void)setHasMatchedLocationRatio:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasMatchedLocationRatio
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setMatchedSceneRatio:(double)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_matchedSceneRatio = a3;
}

- (void)setHasMatchedSceneRatio:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasMatchedSceneRatio
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setMatchedSceneConfidence:(double)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_matchedSceneConfidence = a3;
}

- (void)setHasMatchedSceneConfidence:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasMatchedSceneConfidence
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setMatchedSceneBoundingBox:(double)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_matchedSceneBoundingBox = a3;
}

- (void)setHasMatchedSceneBoundingBox:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasMatchedSceneBoundingBox
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setMatchedOCRCharacterRatio:(double)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_matchedOCRCharacterRatio = a3;
}

- (void)setHasMatchedOCRCharacterRatio:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasMatchedOCRCharacterRatio
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setMatchedOCRImportance:(double)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_matchedOCRImportance = a3;
}

- (void)setHasMatchedOCRImportance:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasMatchedOCRImportance
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setMatchedFieldsCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_matchedFieldsCount = a3;
}

- (void)setHasMatchedFieldsCount:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasMatchedFieldsCount
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setL1Score:(double)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_l1Score = a3;
}

- (void)setHasL1Score:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasL1Score
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setFreshness:(double)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_freshness = a3;
}

- (void)setHasFreshness:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasFreshness
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setFavorited:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_favorited = a3;
}

- (void)setHasFavorited:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasFavorited
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setAestheticScore:(double)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_aestheticScore = a3;
}

- (void)setHasAestheticScore:(BOOL)a3
{
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAestheticScore
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCurationScore:(double)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_curationScore = a3;
}

- (void)setHasCurationScore:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasCurationScore
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHasEverClickInLastWeek:(double)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_hasEverClickInLastWeek = a3;
}

- (void)setHasHasEverClickInLastWeek:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasHasEverClickInLastWeek
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasEverClickInLastMonth:(double)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_hasEverClickInLastMonth = a3;
}

- (void)setHasHasEverClickInLastMonth:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasHasEverClickInLastMonth
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasEverShareInLastWeek:(double)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_hasEverShareInLastWeek = a3;
}

- (void)setHasHasEverShareInLastWeek:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasHasEverShareInLastWeek
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasEverShareInLastMonth:(double)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_hasEverShareInLastMonth = a3;
}

- (void)setHasHasEverShareInLastMonth:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasHasEverShareInLastMonth
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setClickCountInLastWeekNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_clickCountInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasClickCountInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasClickCountInLastWeekNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setClickCountInLastMonthNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_clickCountInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasClickCountInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasClickCountInLastMonthNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setShareCountInLastWeekNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_shareCountInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasShareCountInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountInLastWeekNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setShareCountInLastMonthNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_shareCountInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasShareCountInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountInLastMonthNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasClickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasClickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setClickCountGivenLocationInLastWeekNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenLocationInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasClickCountGivenLocationInLastWeekNormalizedAcrossItems
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setClickCountGivenLocationInLastMonthNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenLocationInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasClickCountGivenLocationInLastMonthNormalizedAcrossItems
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasClickCountGivenDayCategoryInLastWeekNormalizedAcrossItems
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasClickCountGivenDayCategoryInLastMonthNormalizedAcrossItems
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasClickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasClickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasClickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasClickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasClickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasClickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setShareCountGivenLocationInLastWeekNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenLocationInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenLocationInLastWeekNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setShareCountGivenLocationInLastMonthNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenLocationInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenLocationInLastMonthNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenDayCategoryInLastWeekNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenDayCategoryInLastMonthNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(double)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = a3;
}

- (void)setHasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasShareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setClipScore:(double)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_clipScore = a3;
}

- (void)setHasClipScore:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasClipScore
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setClicked:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_clicked = a3;
}

- (void)setHasClicked:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasClicked
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setClickOrder:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_clickOrder = a3;
}

- (void)setHasClickOrder:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasClickOrder
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setItemPosition:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_itemPosition = a3;
}

- (void)setHasItemPosition:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasItemPosition
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setL2ModelScore:(double)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_l2ModelScore = a3;
}

- (void)setHasL2ModelScore:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasL2ModelScore
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setIsDuplicate:(double)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_isDuplicate = a3;
}

- (void)setHasIsDuplicate:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasIsDuplicate
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setIsCompleteMatch:(double)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_isCompleteMatch = a3;
}

- (void)setHasIsCompleteMatch:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($4C4BBB02FAA7C3350847BB4120A7B85D)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasIsCompleteMatch
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AMLPhotosSearchLabeledData;
  int v4 = [(AMLPhotosSearchLabeledData *)&v8 description];
  v5 = [(AMLPhotosSearchLabeledData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  searchSessionUUID = self->_searchSessionUUID;
  if (searchSessionUUID) {
    [v3 setObject:searchSessionUUID forKey:@"searchSessionUUID"];
  }
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    uint64_t uiSurface = self->_uiSurface;
    if (uiSurface >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_uiSurface);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_265220160[uiSurface];
    }
    [v4 setObject:v8 forKey:@"uiSurface"];

    $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    v12 = [NSNumber numberWithDouble:self->_matchedPeopleRatio];
    [v4 setObject:v12 forKey:@"matchedPeopleRatio"];

    $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
    if ((*(_DWORD *)&has & 0x4000000) == 0)
    {
LABEL_10:
      if ((*(void *)&has & 0x100000000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_62;
    }
  }
  else if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
    goto LABEL_10;
  }
  v13 = [NSNumber numberWithDouble:self->_matchedLocationRatio];
  [v4 setObject:v13 forKey:@"matchedLocationRatio"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_63;
  }
LABEL_62:
  v14 = [NSNumber numberWithDouble:self->_matchedSceneRatio];
  [v4 setObject:v14 forKey:@"matchedSceneRatio"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_64;
  }
LABEL_63:
  v15 = [NSNumber numberWithDouble:self->_matchedSceneConfidence];
  [v4 setObject:v15 forKey:@"matchedSceneConfidence"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_65;
  }
LABEL_64:
  v16 = [NSNumber numberWithDouble:self->_matchedSceneBoundingBox];
  [v4 setObject:v16 forKey:@"matchedSceneBoundingBox"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_66;
  }
LABEL_65:
  v17 = [NSNumber numberWithDouble:self->_matchedOCRCharacterRatio];
  [v4 setObject:v17 forKey:@"matchedOCRCharacterRatio"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_15:
    if ((*(void *)&has & 0x800000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_67;
  }
LABEL_66:
  v18 = [NSNumber numberWithDouble:self->_matchedOCRImportance];
  [v4 setObject:v18 forKey:@"matchedOCRImportance"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x800000000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_68;
  }
LABEL_67:
  v19 = [NSNumber numberWithUnsignedInt:self->_matchedFieldsCount];
  [v4 setObject:v19 forKey:@"matchedFieldsCount"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_69;
  }
LABEL_68:
  v20 = [NSNumber numberWithDouble:self->_l1Score];
  [v4 setObject:v20 forKey:@"L1Score"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(void *)&has & 0x4000000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_70;
  }
LABEL_69:
  v21 = [NSNumber numberWithDouble:self->_freshness];
  [v4 setObject:v21 forKey:@"freshness"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_71;
  }
LABEL_70:
  v22 = [NSNumber numberWithBool:self->_favorited];
  [v4 setObject:v22 forKey:@"favorited"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_72;
  }
LABEL_71:
  v23 = [NSNumber numberWithDouble:self->_aestheticScore];
  [v4 setObject:v23 forKey:@"aestheticScore"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_73;
  }
LABEL_72:
  v24 = [NSNumber numberWithDouble:self->_curationScore];
  [v4 setObject:v24 forKey:@"curationScore"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_74;
  }
LABEL_73:
  v25 = [NSNumber numberWithDouble:self->_hasEverClickInLastWeek];
  [v4 setObject:v25 forKey:@"hasEverClickInLastWeek"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_75;
  }
LABEL_74:
  v26 = [NSNumber numberWithDouble:self->_hasEverClickInLastMonth];
  [v4 setObject:v26 forKey:@"hasEverClickInLastMonth"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_76;
  }
LABEL_75:
  v27 = [NSNumber numberWithDouble:self->_hasEverShareInLastWeek];
  [v4 setObject:v27 forKey:@"hasEverShareInLastWeek"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_77;
  }
LABEL_76:
  v28 = [NSNumber numberWithDouble:self->_hasEverShareInLastMonth];
  [v4 setObject:v28 forKey:@"hasEverShareInLastMonth"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_78;
  }
LABEL_77:
  v29 = [NSNumber numberWithDouble:self->_clickCountInLastWeekNormalizedAcrossItems];
  [v4 setObject:v29 forKey:@"clickCountInLastWeekNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_27:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_79;
  }
LABEL_78:
  v30 = [NSNumber numberWithDouble:self->_clickCountInLastMonthNormalizedAcrossItems];
  [v4 setObject:v30 forKey:@"clickCountInLastMonthNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_80;
  }
LABEL_79:
  v31 = [NSNumber numberWithDouble:self->_shareCountInLastWeekNormalizedAcrossItems];
  [v4 setObject:v31 forKey:@"shareCountInLastWeekNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_81;
  }
LABEL_80:
  v32 = [NSNumber numberWithDouble:self->_shareCountInLastMonthNormalizedAcrossItems];
  [v4 setObject:v32 forKey:@"shareCountInLastMonthNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_31;
    }
    goto LABEL_82;
  }
LABEL_81:
  v33 = [NSNumber numberWithDouble:self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems];
  [v4 setObject:v33 forKey:@"clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_32;
    }
    goto LABEL_83;
  }
LABEL_82:
  v34 = [NSNumber numberWithDouble:self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems];
  [v4 setObject:v34 forKey:@"clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_33;
    }
    goto LABEL_84;
  }
LABEL_83:
  v35 = [NSNumber numberWithDouble:self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems];
  [v4 setObject:v35 forKey:@"clickCountGivenLocationInLastWeekNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_34;
    }
    goto LABEL_85;
  }
LABEL_84:
  v36 = [NSNumber numberWithDouble:self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems];
  [v4 setObject:v36 forKey:@"clickCountGivenLocationInLastMonthNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_35;
    }
    goto LABEL_86;
  }
LABEL_85:
  v37 = [NSNumber numberWithDouble:self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems];
  [v4 setObject:v37 forKey:@"clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_36;
    }
    goto LABEL_87;
  }
LABEL_86:
  v38 = [NSNumber numberWithDouble:self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems];
  [v4 setObject:v38 forKey:@"clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_37;
    }
    goto LABEL_88;
  }
LABEL_87:
  v39 = [NSNumber numberWithDouble:self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems];
  [v4 setObject:v39 forKey:@"clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_38;
    }
    goto LABEL_89;
  }
LABEL_88:
  v40 = [NSNumber numberWithDouble:self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems];
  [v4 setObject:v40 forKey:@"clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_39;
    }
    goto LABEL_90;
  }
LABEL_89:
  v41 = [NSNumber numberWithDouble:self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems];
  [v4 setObject:v41 forKey:@"clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_39:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_40;
    }
    goto LABEL_91;
  }
LABEL_90:
  v42 = [NSNumber numberWithDouble:self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems];
  [v4 setObject:v42 forKey:@"clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_40:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_41;
    }
    goto LABEL_92;
  }
LABEL_91:
  v43 = [NSNumber numberWithDouble:self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems];
  [v4 setObject:v43 forKey:@"clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_93;
  }
LABEL_92:
  v44 = [NSNumber numberWithDouble:self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems];
  [v4 setObject:v44 forKey:@"clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_42:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_94;
  }
LABEL_93:
  v45 = [NSNumber numberWithDouble:self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems];
  [v4 setObject:v45 forKey:@"shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_43:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_95;
  }
LABEL_94:
  v46 = [NSNumber numberWithDouble:self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems];
  [v4 setObject:v46 forKey:@"shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_44:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_96;
  }
LABEL_95:
  v47 = [NSNumber numberWithDouble:self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems];
  [v4 setObject:v47 forKey:@"shareCountGivenLocationInLastWeekNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_45:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_97;
  }
LABEL_96:
  v48 = [NSNumber numberWithDouble:self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems];
  [v4 setObject:v48 forKey:@"shareCountGivenLocationInLastMonthNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_46:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_98;
  }
LABEL_97:
  v49 = [NSNumber numberWithDouble:self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems];
  [v4 setObject:v49 forKey:@"shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_47:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_99;
  }
LABEL_98:
  v50 = [NSNumber numberWithDouble:self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems];
  [v4 setObject:v50 forKey:@"shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_48:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_100;
  }
LABEL_99:
  v51 = [NSNumber numberWithDouble:self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems];
  [v4 setObject:v51 forKey:@"shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_49:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_101;
  }
LABEL_100:
  v52 = [NSNumber numberWithDouble:self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems];
  [v4 setObject:v52 forKey:@"shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_50:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_102;
  }
LABEL_101:
  v53 = [NSNumber numberWithDouble:self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems];
  [v4 setObject:v53 forKey:@"shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_51:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_103;
  }
LABEL_102:
  v54 = [NSNumber numberWithDouble:self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems];
  [v4 setObject:v54 forKey:@"shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_52:
    if ((*(void *)&has & 0x2000000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_104;
  }
LABEL_103:
  v55 = [NSNumber numberWithDouble:self->_clipScore];
  [v4 setObject:v55 forKey:@"clipScore"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x2000000000000) == 0)
  {
LABEL_53:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_105;
  }
LABEL_104:
  v56 = [NSNumber numberWithBool:self->_clicked];
  [v4 setObject:v56 forKey:@"clicked"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_54:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_106;
  }
LABEL_105:
  v57 = [NSNumber numberWithUnsignedInt:self->_clickOrder];
  [v4 setObject:v57 forKey:@"clickOrder"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_107;
  }
LABEL_106:
  v58 = [NSNumber numberWithUnsignedInt:self->_itemPosition];
  [v4 setObject:v58 forKey:@"itemPosition"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_57;
    }
LABEL_108:
    v60 = [NSNumber numberWithDouble:self->_isDuplicate];
    [v4 setObject:v60 forKey:@"isDuplicate"];

    if ((*(void *)&self->_has & 0x400000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
LABEL_107:
  v59 = [NSNumber numberWithDouble:self->_l2ModelScore];
  [v4 setObject:v59 forKey:@"L2ModelScore"];

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0) {
    goto LABEL_108;
  }
LABEL_57:
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_58:
    v9 = [NSNumber numberWithDouble:self->_isCompleteMatch];
    [v4 setObject:v9 forKey:@"isCompleteMatch"];
  }
LABEL_59:
  id v10 = v4;

  return v10;
}

- (BOOL)readFrom:(id)a3
{
  return AMLPhotosSearchLabeledDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_searchSessionUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_60;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_11:
    if ((*(void *)&has & 0x800000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x800000000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(void *)&has & 0x4000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_24:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_27;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_30;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_31;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_32;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_33;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_34;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_35;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_36;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_37;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_37:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_38:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_39:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_40:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_42:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_43:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_44:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_45:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_46:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_48:
    if ((*(void *)&has & 0x2000000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x2000000000000) == 0)
  {
LABEL_49:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_50:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_107:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(void *)&self->_has & 0x400000) != 0)
  {
LABEL_54:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_55:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_searchSessionUUID)
  {
    id v6 = v4;
    objc_msgSend(v4, "setSearchSessionUUID:");
    id v4 = v6;
  }
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    *((_DWORD *)v4 + 98) = self->_uiSurface;
    *((void *)v4 + 50) |= 0x1000000000000uLL;
    $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_60;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 30) = *(void *)&self->_matchedPeopleRatio;
  *((void *)v4 + 50) |= 0x20000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)v4 + 27) = *(void *)&self->_matchedLocationRatio;
  *((void *)v4 + 50) |= 0x4000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((void *)v4 + 33) = *(void *)&self->_matchedSceneRatio;
  *((void *)v4 + 50) |= 0x100000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((void *)v4 + 32) = *(void *)&self->_matchedSceneConfidence;
  *((void *)v4 + 50) |= 0x80000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((void *)v4 + 31) = *(void *)&self->_matchedSceneBoundingBox;
  *((void *)v4 + 50) |= 0x40000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((void *)v4 + 28) = *(void *)&self->_matchedOCRCharacterRatio;
  *((void *)v4 + 50) |= 0x8000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_11:
    if ((*(void *)&has & 0x800000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((void *)v4 + 29) = *(void *)&self->_matchedOCRImportance;
  *((void *)v4 + 50) |= 0x10000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x800000000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)v4 + 94) = self->_matchedFieldsCount;
  *((void *)v4 + 50) |= 0x800000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((void *)v4 + 25) = *(void *)&self->_l1Score;
  *((void *)v4 + 50) |= 0x1000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(void *)&has & 0x4000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((void *)v4 + 18) = *(void *)&self->_freshness;
  *((void *)v4 + 50) |= 0x20000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((unsigned char *)v4 + 397) = self->_favorited;
  *((void *)v4 + 50) |= 0x4000000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((void *)v4 + 1) = *(void *)&self->_aestheticScore;
  *((void *)v4 + 50) |= 1uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((void *)v4 + 17) = *(void *)&self->_curationScore;
  *((void *)v4 + 50) |= 0x10000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((void *)v4 + 20) = *(void *)&self->_hasEverClickInLastWeek;
  *((void *)v4 + 50) |= 0x80000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((void *)v4 + 19) = *(void *)&self->_hasEverClickInLastMonth;
  *((void *)v4 + 50) |= 0x40000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((void *)v4 + 22) = *(void *)&self->_hasEverShareInLastWeek;
  *((void *)v4 + 50) |= 0x200000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((void *)v4 + 21) = *(void *)&self->_hasEverShareInLastMonth;
  *((void *)v4 + 50) |= 0x100000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((void *)v4 + 15) = *(void *)&self->_clickCountInLastWeekNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x4000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((void *)v4 + 14) = *(void *)&self->_clickCountInLastMonthNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x2000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_24:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((void *)v4 + 45) = *(void *)&self->_shareCountInLastWeekNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x100000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((void *)v4 + 44) = *(void *)&self->_shareCountInLastMonthNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x80000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_27;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((void *)v4 + 13) = *(void *)&self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x1000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((void *)v4 + 12) = *(void *)&self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x800uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((void *)v4 + 7) = *(void *)&self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x40uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_30;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((void *)v4 + 6) = *(void *)&self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x20uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_31;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((void *)v4 + 3) = *(void *)&self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
  *((void *)v4 + 50) |= 4uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_32;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((void *)v4 + 2) = *(void *)&self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
  *((void *)v4 + 50) |= 2uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_33;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((void *)v4 + 9) = *(void *)&self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x100uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_34;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((void *)v4 + 8) = *(void *)&self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x80uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_35;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((void *)v4 + 11) = *(void *)&self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x400uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_36;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((void *)v4 + 10) = *(void *)&self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x200uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_37;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((void *)v4 + 5) = *(void *)&self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x10uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_37:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((void *)v4 + 4) = *(void *)&self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
  *((void *)v4 + 50) |= 8uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_38:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((void *)v4 + 43) = *(void *)&self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x40000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_39:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((void *)v4 + 42) = *(void *)&self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x20000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_40:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((void *)v4 + 39) = *(void *)&self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x4000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_96;
  }
LABEL_95:
  *((void *)v4 + 38) = *(void *)&self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x2000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_42:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_97;
  }
LABEL_96:
  *((void *)v4 + 35) = *(void *)&self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x400000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_43:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((void *)v4 + 34) = *(void *)&self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x200000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_44:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_99;
  }
LABEL_98:
  *((void *)v4 + 41) = *(void *)&self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x10000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_45:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_100;
  }
LABEL_99:
  *((void *)v4 + 40) = *(void *)&self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x8000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_46:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_101;
  }
LABEL_100:
  *((void *)v4 + 37) = *(void *)&self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x1000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((void *)v4 + 36) = *(void *)&self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
  *((void *)v4 + 50) |= 0x800000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_48:
    if ((*(void *)&has & 0x2000000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_103;
  }
LABEL_102:
  *((void *)v4 + 16) = *(void *)&self->_clipScore;
  *((void *)v4 + 50) |= 0x8000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x2000000000000) == 0)
  {
LABEL_49:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_104;
  }
LABEL_103:
  *((unsigned char *)v4 + 396) = self->_clicked;
  *((void *)v4 + 50) |= 0x2000000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_50:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_105;
  }
LABEL_104:
  *((_DWORD *)v4 + 92) = self->_clickOrder;
  *((void *)v4 + 50) |= 0x200000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_106;
  }
LABEL_105:
  *((_DWORD *)v4 + 93) = self->_itemPosition;
  *((void *)v4 + 50) |= 0x400000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_107;
  }
LABEL_106:
  *((void *)v4 + 26) = *(void *)&self->_l2ModelScore;
  *((void *)v4 + 50) |= 0x2000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_107:
  *((void *)v4 + 24) = *(void *)&self->_isDuplicate;
  *((void *)v4 + 50) |= 0x800000uLL;
  if ((*(void *)&self->_has & 0x400000) != 0)
  {
LABEL_54:
    *((void *)v4 + 23) = *(void *)&self->_isCompleteMatch;
    *((void *)v4 + 50) |= 0x400000uLL;
  }
LABEL_55:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_searchSessionUUID copyWithZone:a3];
  v7 = *(void **)(v5 + 384);
  *(void *)(v5 + 384) = v6;

  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    *(_DWORD *)(v5 + 392) = self->_uiSurface;
    *(void *)(v5 + 400) |= 0x1000000000000uLL;
    $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_56;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 240) = self->_matchedPeopleRatio;
  *(void *)(v5 + 400) |= 0x20000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(double *)(v5 + 216) = self->_matchedLocationRatio;
  *(void *)(v5 + 400) |= 0x4000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(double *)(v5 + 264) = self->_matchedSceneRatio;
  *(void *)(v5 + 400) |= 0x100000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(double *)(v5 + 256) = self->_matchedSceneConfidence;
  *(void *)(v5 + 400) |= 0x80000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(double *)(v5 + 248) = self->_matchedSceneBoundingBox;
  *(void *)(v5 + 400) |= 0x40000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(double *)(v5 + 224) = self->_matchedOCRCharacterRatio;
  *(void *)(v5 + 400) |= 0x8000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x800000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(double *)(v5 + 232) = self->_matchedOCRImportance;
  *(void *)(v5 + 400) |= 0x10000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x800000000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v5 + 376) = self->_matchedFieldsCount;
  *(void *)(v5 + 400) |= 0x800000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(double *)(v5 + 200) = self->_l1Score;
  *(void *)(v5 + 400) |= 0x1000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(void *)&has & 0x4000000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_65;
  }
LABEL_64:
  *(double *)(v5 + 144) = self->_freshness;
  *(void *)(v5 + 400) |= 0x20000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_66;
  }
LABEL_65:
  *(unsigned char *)(v5 + 397) = self->_favorited;
  *(void *)(v5 + 400) |= 0x4000000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_67;
  }
LABEL_66:
  *(double *)(v5 + 8) = self->_aestheticScore;
  *(void *)(v5 + 400) |= 1uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(double *)(v5 + 136) = self->_curationScore;
  *(void *)(v5 + 400) |= 0x10000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_69;
  }
LABEL_68:
  *(double *)(v5 + 160) = self->_hasEverClickInLastWeek;
  *(void *)(v5 + 400) |= 0x80000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_70;
  }
LABEL_69:
  *(double *)(v5 + 152) = self->_hasEverClickInLastMonth;
  *(void *)(v5 + 400) |= 0x40000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_71;
  }
LABEL_70:
  *(double *)(v5 + 176) = self->_hasEverShareInLastWeek;
  *(void *)(v5 + 400) |= 0x200000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_72;
  }
LABEL_71:
  *(double *)(v5 + 168) = self->_hasEverShareInLastMonth;
  *(void *)(v5 + 400) |= 0x100000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(double *)(v5 + 120) = self->_clickCountInLastWeekNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x4000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(double *)(v5 + 112) = self->_clickCountInLastMonthNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x2000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(double *)(v5 + 360) = self->_shareCountInLastWeekNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x100000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(double *)(v5 + 352) = self->_shareCountInLastMonthNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x80000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_25;
    }
    goto LABEL_77;
  }
LABEL_76:
  *(double *)(v5 + 104) = self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x1000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_26;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(double *)(v5 + 96) = self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x800uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_79;
  }
LABEL_78:
  *(double *)(v5 + 56) = self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x40uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_80;
  }
LABEL_79:
  *(double *)(v5 + 48) = self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x20uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_29;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(double *)(v5 + 24) = self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 4uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_30;
    }
    goto LABEL_82;
  }
LABEL_81:
  *(double *)(v5 + 16) = self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 2uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_31;
    }
    goto LABEL_83;
  }
LABEL_82:
  *(double *)(v5 + 72) = self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x100uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_32;
    }
    goto LABEL_84;
  }
LABEL_83:
  *(double *)(v5 + 64) = self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x80uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_33;
    }
    goto LABEL_85;
  }
LABEL_84:
  *(double *)(v5 + 88) = self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x400uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_34;
    }
    goto LABEL_86;
  }
LABEL_85:
  *(double *)(v5 + 80) = self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x200uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_35;
    }
    goto LABEL_87;
  }
LABEL_86:
  *(double *)(v5 + 40) = self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x10uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_88;
  }
LABEL_87:
  *(double *)(v5 + 32) = self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 8uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_36:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_89;
  }
LABEL_88:
  *(double *)(v5 + 344) = self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x40000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_37:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_90;
  }
LABEL_89:
  *(double *)(v5 + 336) = self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x20000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_38:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_91;
  }
LABEL_90:
  *(double *)(v5 + 312) = self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x4000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_39:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_92;
  }
LABEL_91:
  *(double *)(v5 + 304) = self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x2000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_40:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_93;
  }
LABEL_92:
  *(double *)(v5 + 280) = self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x400000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_94;
  }
LABEL_93:
  *(double *)(v5 + 272) = self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x200000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_42:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_95;
  }
LABEL_94:
  *(double *)(v5 + 328) = self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x10000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_43:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_96;
  }
LABEL_95:
  *(double *)(v5 + 320) = self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x8000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_44:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_97;
  }
LABEL_96:
  *(double *)(v5 + 296) = self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x1000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_98;
  }
LABEL_97:
  *(double *)(v5 + 288) = self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
  *(void *)(v5 + 400) |= 0x800000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_46:
    if ((*(void *)&has & 0x2000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_99;
  }
LABEL_98:
  *(double *)(v5 + 128) = self->_clipScore;
  *(void *)(v5 + 400) |= 0x8000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x2000000000000) == 0)
  {
LABEL_47:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_100;
  }
LABEL_99:
  *(unsigned char *)(v5 + 396) = self->_clicked;
  *(void *)(v5 + 400) |= 0x2000000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_48:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_101;
  }
LABEL_100:
  *(_DWORD *)(v5 + 368) = self->_clickOrder;
  *(void *)(v5 + 400) |= 0x200000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_102;
  }
LABEL_101:
  *(_DWORD *)(v5 + 372) = self->_itemPosition;
  *(void *)(v5 + 400) |= 0x400000000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_51;
    }
LABEL_103:
    *(double *)(v5 + 192) = self->_isDuplicate;
    *(void *)(v5 + 400) |= 0x800000uLL;
    if ((*(void *)&self->_has & 0x400000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
LABEL_102:
  *(double *)(v5 + 208) = self->_l2ModelScore;
  *(void *)(v5 + 400) |= 0x2000000uLL;
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0) {
    goto LABEL_103;
  }
LABEL_51:
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_52:
    *(double *)(v5 + 184) = self->_isCompleteMatch;
    *(void *)(v5 + 400) |= 0x400000uLL;
  }
LABEL_53:
  id v9 = (id)v5;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_265;
  }
  searchSessionUUID = self->_searchSessionUUID;
  if ((unint64_t)searchSessionUUID | *((void *)v4 + 48))
  {
    if (!-[NSString isEqual:](searchSessionUUID, "isEqual:")) {
      goto LABEL_265;
    }
  }
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  uint64_t v7 = *((void *)v4 + 50);
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    if ((v7 & 0x1000000000000) == 0 || self->_uiSurface != *((_DWORD *)v4 + 98)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x1000000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0 || self->_matchedPeopleRatio != *((double *)v4 + 30)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0 || self->_matchedLocationRatio != *((double *)v4 + 27)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0 || self->_matchedSceneRatio != *((double *)v4 + 33)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0 || self->_matchedSceneConfidence != *((double *)v4 + 32)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x80000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0 || self->_matchedSceneBoundingBox != *((double *)v4 + 31)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0 || self->_matchedOCRCharacterRatio != *((double *)v4 + 28)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0 || self->_matchedOCRImportance != *((double *)v4 + 29)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x800000000000) != 0)
  {
    if ((v7 & 0x800000000000) == 0 || self->_matchedFieldsCount != *((_DWORD *)v4 + 94)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x800000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_l1Score != *((double *)v4 + 25)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_freshness != *((double *)v4 + 18)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x4000000000000) != 0)
  {
    if ((v7 & 0x4000000000000) == 0) {
      goto LABEL_265;
    }
    if (self->_favorited)
    {
      if (!*((unsigned char *)v4 + 397)) {
        goto LABEL_265;
      }
    }
    else if (*((unsigned char *)v4 + 397))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x4000000000000) != 0)
  {
    goto LABEL_265;
  }
  if (*(unsigned char *)&has)
  {
    if ((v7 & 1) == 0 || self->_aestheticScore != *((double *)v4 + 1)) {
      goto LABEL_265;
    }
  }
  else if (v7)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_curationScore != *((double *)v4 + 17)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_hasEverClickInLastWeek != *((double *)v4 + 20)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_hasEverClickInLastMonth != *((double *)v4 + 19)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_hasEverShareInLastWeek != *((double *)v4 + 22)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_hasEverShareInLastMonth != *((double *)v4 + 21)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_clickCountInLastWeekNormalizedAcrossItems != *((double *)v4 + 15)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_clickCountInLastMonthNormalizedAcrossItems != *((double *)v4 + 14)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x100000000000) != 0)
  {
    if ((v7 & 0x100000000000) == 0 || self->_shareCountInLastWeekNormalizedAcrossItems != *((double *)v4 + 45)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x100000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x80000000000) != 0)
  {
    if ((v7 & 0x80000000000) == 0 || self->_shareCountInLastMonthNormalizedAcrossItems != *((double *)v4 + 44)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x80000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems != *((double *)v4 + 13)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems != *((double *)v4 + 12)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_265;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems != *((double *)v4 + 7)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_265;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems != *((double *)v4 + 6)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_265;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems != *((double *)v4 + 3)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_265;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems != *((double *)v4 + 2)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0
      || self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems != *((double *)v4 + 9))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_265;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0
      || self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems != *((double *)v4 + 8))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems != *((double *)v4 + 11)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0
      || self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems != *((double *)v4 + 10))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_265;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0
      || self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems != *((double *)v4 + 5))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_265;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems != *((double *)v4 + 4)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0
      || self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems != *((double *)v4 + 43))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    if ((v7 & 0x20000000000) == 0
      || self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems != *((double *)v4 + 42))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x20000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    if ((v7 & 0x4000000000) == 0
      || self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems != *((double *)v4 + 39))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x4000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x2000000000) != 0)
  {
    if ((v7 & 0x2000000000) == 0
      || self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems != *((double *)v4 + 38))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x2000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0
      || self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems != *((double *)v4 + 35))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0
      || self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems != *((double *)v4 + 34))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    if ((v7 & 0x10000000000) == 0
      || self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems != *((double *)v4 + 41))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x10000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0
      || self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems != *((double *)v4 + 40))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x8000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x1000000000) != 0)
  {
    if ((v7 & 0x1000000000) == 0
      || self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems != *((double *)v4 + 37))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x1000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0
      || self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems != *((double *)v4 + 36))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_clipScore != *((double *)v4 + 16)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x2000000000000) != 0)
  {
    if ((v7 & 0x2000000000000) == 0) {
      goto LABEL_265;
    }
    if (self->_clicked)
    {
      if (!*((unsigned char *)v4 + 396)) {
        goto LABEL_265;
      }
    }
    else if (*((unsigned char *)v4 + 396))
    {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x2000000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x200000000000) != 0)
  {
    if ((v7 & 0x200000000000) == 0 || self->_clickOrder != *((_DWORD *)v4 + 92)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x200000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x400000000000) != 0)
  {
    if ((v7 & 0x400000000000) == 0 || self->_itemPosition != *((_DWORD *)v4 + 93)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x400000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_l2ModelScore != *((double *)v4 + 26)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    if ((v7 & 0x800000) == 0) {
      goto LABEL_260;
    }
LABEL_265:
    BOOL v9 = 0;
    goto LABEL_266;
  }
  if ((v7 & 0x800000) == 0 || self->_isDuplicate != *((double *)v4 + 24)) {
    goto LABEL_265;
  }
LABEL_260:
  uint64_t v8 = *((void *)v4 + 50);
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0 || self->_isCompleteMatch != *((double *)v4 + 23)) {
      goto LABEL_265;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = (v8 & 0x400000) == 0;
  }
LABEL_266:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v278 = [(NSString *)self->_searchSessionUUID hash];
  $4C4BBB02FAA7C3350847BB4120A7B85D has = self->_has;
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    uint64_t v277 = 2654435761 * self->_uiSurface;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v277 = 0;
  if ((*(_DWORD *)&has & 0x20000000) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double matchedPeopleRatio = self->_matchedPeopleRatio;
  double v5 = -matchedPeopleRatio;
  if (matchedPeopleRatio >= 0.0) {
    double v5 = self->_matchedPeopleRatio;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    double matchedLocationRatio = self->_matchedLocationRatio;
    double v11 = -matchedLocationRatio;
    if (matchedLocationRatio >= 0.0) {
      double v11 = self->_matchedLocationRatio;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    double matchedSceneRatio = self->_matchedSceneRatio;
    double v16 = -matchedSceneRatio;
    if (matchedSceneRatio >= 0.0) {
      double v16 = self->_matchedSceneRatio;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    double matchedSceneConfidence = self->_matchedSceneConfidence;
    double v21 = -matchedSceneConfidence;
    if (matchedSceneConfidence >= 0.0) {
      double v21 = self->_matchedSceneConfidence;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  unint64_t v276 = v8;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    double matchedSceneBoundingBox = self->_matchedSceneBoundingBox;
    double v26 = -matchedSceneBoundingBox;
    if (matchedSceneBoundingBox >= 0.0) {
      double v26 = self->_matchedSceneBoundingBox;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    double matchedOCRCharacterRatio = self->_matchedOCRCharacterRatio;
    double v31 = -matchedOCRCharacterRatio;
    if (matchedOCRCharacterRatio >= 0.0) {
      double v31 = self->_matchedOCRCharacterRatio;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    double matchedOCRImportance = self->_matchedOCRImportance;
    double v36 = -matchedOCRImportance;
    if (matchedOCRImportance >= 0.0) {
      double v36 = self->_matchedOCRImportance;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  if ((*(void *)&has & 0x800000000000) == 0)
  {
    uint64_t v274 = 0;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_61;
    }
LABEL_66:
    unint64_t v310 = 0;
    goto LABEL_70;
  }
  uint64_t v274 = 2654435761 * self->_matchedFieldsCount;
  if ((*(_DWORD *)&has & 0x1000000) == 0) {
    goto LABEL_66;
  }
LABEL_61:
  double l1Score = self->_l1Score;
  double v40 = -l1Score;
  if (l1Score >= 0.0) {
    double v40 = self->_l1Score;
  }
  long double v41 = floor(v40 + 0.5);
  double v42 = (v40 - v41) * 1.84467441e19;
  unint64_t v43 = 2654435761u * (unint64_t)fmod(v41, 1.84467441e19);
  if (v42 >= 0.0)
  {
    unint64_t v310 = v43;
    if (v42 <= 0.0) {
      goto LABEL_70;
    }
    unint64_t v44 = v43 + (unint64_t)v42;
  }
  else
  {
    unint64_t v44 = v43 - (unint64_t)fabs(v42);
  }
  unint64_t v310 = v44;
LABEL_70:
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    double freshness = self->_freshness;
    double v47 = -freshness;
    if (freshness >= 0.0) {
      double v47 = self->_freshness;
    }
    long double v48 = floor(v47 + 0.5);
    double v49 = (v47 - v48) * 1.84467441e19;
    unint64_t v45 = 2654435761u * (unint64_t)fmod(v48, 1.84467441e19);
    if (v49 >= 0.0)
    {
      if (v49 > 0.0) {
        v45 += (unint64_t)v49;
      }
    }
    else
    {
      v45 -= (unint64_t)fabs(v49);
    }
  }
  else
  {
    unint64_t v45 = 0;
  }
  unint64_t v273 = v45;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
    uint64_t v272 = 0;
    if (*(unsigned char *)&has) {
      goto LABEL_80;
    }
LABEL_85:
    unint64_t v309 = 0;
    goto LABEL_89;
  }
  uint64_t v272 = 2654435761 * self->_favorited;
  if ((*(unsigned char *)&has & 1) == 0) {
    goto LABEL_85;
  }
LABEL_80:
  double aestheticScore = self->_aestheticScore;
  double v51 = -aestheticScore;
  if (aestheticScore >= 0.0) {
    double v51 = self->_aestheticScore;
  }
  long double v52 = floor(v51 + 0.5);
  double v53 = (v51 - v52) * 1.84467441e19;
  unint64_t v54 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
  if (v53 >= 0.0)
  {
    unint64_t v309 = v54;
    if (v53 <= 0.0) {
      goto LABEL_89;
    }
    unint64_t v55 = v54 + (unint64_t)v53;
  }
  else
  {
    unint64_t v55 = v54 - (unint64_t)fabs(v53);
  }
  unint64_t v309 = v55;
LABEL_89:
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    unint64_t v308 = 0;
    goto LABEL_98;
  }
  double curationScore = self->_curationScore;
  double v57 = -curationScore;
  if (curationScore >= 0.0) {
    double v57 = self->_curationScore;
  }
  long double v58 = floor(v57 + 0.5);
  double v59 = (v57 - v58) * 1.84467441e19;
  unint64_t v60 = 2654435761u * (unint64_t)fmod(v58, 1.84467441e19);
  if (v59 >= 0.0)
  {
    unint64_t v308 = v60;
    if (v59 <= 0.0) {
      goto LABEL_98;
    }
    unint64_t v61 = v60 + (unint64_t)v59;
  }
  else
  {
    unint64_t v61 = v60 - (unint64_t)fabs(v59);
  }
  unint64_t v308 = v61;
LABEL_98:
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    unint64_t v307 = 0;
    goto LABEL_107;
  }
  double hasEverClickInLastWeek = self->_hasEverClickInLastWeek;
  double v63 = -hasEverClickInLastWeek;
  if (hasEverClickInLastWeek >= 0.0) {
    double v63 = self->_hasEverClickInLastWeek;
  }
  long double v64 = floor(v63 + 0.5);
  double v65 = (v63 - v64) * 1.84467441e19;
  unint64_t v66 = 2654435761u * (unint64_t)fmod(v64, 1.84467441e19);
  if (v65 >= 0.0)
  {
    unint64_t v307 = v66;
    if (v65 <= 0.0) {
      goto LABEL_107;
    }
    unint64_t v67 = v66 + (unint64_t)v65;
  }
  else
  {
    unint64_t v67 = v66 - (unint64_t)fabs(v65);
  }
  unint64_t v307 = v67;
LABEL_107:
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
    unint64_t v306 = 0;
    goto LABEL_116;
  }
  double hasEverClickInLastMonth = self->_hasEverClickInLastMonth;
  double v69 = -hasEverClickInLastMonth;
  if (hasEverClickInLastMonth >= 0.0) {
    double v69 = self->_hasEverClickInLastMonth;
  }
  long double v70 = floor(v69 + 0.5);
  double v71 = (v69 - v70) * 1.84467441e19;
  unint64_t v72 = 2654435761u * (unint64_t)fmod(v70, 1.84467441e19);
  if (v71 >= 0.0)
  {
    unint64_t v306 = v72;
    if (v71 <= 0.0) {
      goto LABEL_116;
    }
    unint64_t v73 = v72 + (unint64_t)v71;
  }
  else
  {
    unint64_t v73 = v72 - (unint64_t)fabs(v71);
  }
  unint64_t v306 = v73;
LABEL_116:
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
    unint64_t v305 = 0;
    goto LABEL_125;
  }
  double hasEverShareInLastWeek = self->_hasEverShareInLastWeek;
  double v75 = -hasEverShareInLastWeek;
  if (hasEverShareInLastWeek >= 0.0) {
    double v75 = self->_hasEverShareInLastWeek;
  }
  long double v76 = floor(v75 + 0.5);
  double v77 = (v75 - v76) * 1.84467441e19;
  unint64_t v78 = 2654435761u * (unint64_t)fmod(v76, 1.84467441e19);
  if (v77 >= 0.0)
  {
    unint64_t v305 = v78;
    if (v77 <= 0.0) {
      goto LABEL_125;
    }
    unint64_t v79 = v78 + (unint64_t)v77;
  }
  else
  {
    unint64_t v79 = v78 - (unint64_t)fabs(v77);
  }
  unint64_t v305 = v79;
LABEL_125:
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    unint64_t v304 = 0;
    goto LABEL_134;
  }
  double hasEverShareInLastMonth = self->_hasEverShareInLastMonth;
  double v81 = -hasEverShareInLastMonth;
  if (hasEverShareInLastMonth >= 0.0) {
    double v81 = self->_hasEverShareInLastMonth;
  }
  long double v82 = floor(v81 + 0.5);
  double v83 = (v81 - v82) * 1.84467441e19;
  unint64_t v84 = 2654435761u * (unint64_t)fmod(v82, 1.84467441e19);
  if (v83 >= 0.0)
  {
    unint64_t v304 = v84;
    if (v83 <= 0.0) {
      goto LABEL_134;
    }
    unint64_t v85 = v84 + (unint64_t)v83;
  }
  else
  {
    unint64_t v85 = v84 - (unint64_t)fabs(v83);
  }
  unint64_t v304 = v85;
LABEL_134:
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
    unint64_t v303 = 0;
    goto LABEL_143;
  }
  double clickCountInLastWeekNormalizedAcrossItems = self->_clickCountInLastWeekNormalizedAcrossItems;
  double v87 = -clickCountInLastWeekNormalizedAcrossItems;
  if (clickCountInLastWeekNormalizedAcrossItems >= 0.0) {
    double v87 = self->_clickCountInLastWeekNormalizedAcrossItems;
  }
  long double v88 = floor(v87 + 0.5);
  double v89 = (v87 - v88) * 1.84467441e19;
  unint64_t v90 = 2654435761u * (unint64_t)fmod(v88, 1.84467441e19);
  if (v89 >= 0.0)
  {
    unint64_t v303 = v90;
    if (v89 <= 0.0) {
      goto LABEL_143;
    }
    unint64_t v91 = v90 + (unint64_t)v89;
  }
  else
  {
    unint64_t v91 = v90 - (unint64_t)fabs(v89);
  }
  unint64_t v303 = v91;
LABEL_143:
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
    unint64_t v302 = 0;
    goto LABEL_152;
  }
  double clickCountInLastMonthNormalizedAcrossItems = self->_clickCountInLastMonthNormalizedAcrossItems;
  double v93 = -clickCountInLastMonthNormalizedAcrossItems;
  if (clickCountInLastMonthNormalizedAcrossItems >= 0.0) {
    double v93 = self->_clickCountInLastMonthNormalizedAcrossItems;
  }
  long double v94 = floor(v93 + 0.5);
  double v95 = (v93 - v94) * 1.84467441e19;
  unint64_t v96 = 2654435761u * (unint64_t)fmod(v94, 1.84467441e19);
  if (v95 >= 0.0)
  {
    unint64_t v302 = v96;
    if (v95 <= 0.0) {
      goto LABEL_152;
    }
    unint64_t v97 = v96 + (unint64_t)v95;
  }
  else
  {
    unint64_t v97 = v96 - (unint64_t)fabs(v95);
  }
  unint64_t v302 = v97;
LABEL_152:
  if ((*(void *)&has & 0x100000000000) == 0)
  {
    unint64_t v301 = 0;
    goto LABEL_161;
  }
  double shareCountInLastWeekNormalizedAcrossItems = self->_shareCountInLastWeekNormalizedAcrossItems;
  double v99 = -shareCountInLastWeekNormalizedAcrossItems;
  if (shareCountInLastWeekNormalizedAcrossItems >= 0.0) {
    double v99 = self->_shareCountInLastWeekNormalizedAcrossItems;
  }
  long double v100 = floor(v99 + 0.5);
  double v101 = (v99 - v100) * 1.84467441e19;
  unint64_t v102 = 2654435761u * (unint64_t)fmod(v100, 1.84467441e19);
  if (v101 >= 0.0)
  {
    unint64_t v301 = v102;
    if (v101 <= 0.0) {
      goto LABEL_161;
    }
    unint64_t v103 = v102 + (unint64_t)v101;
  }
  else
  {
    unint64_t v103 = v102 - (unint64_t)fabs(v101);
  }
  unint64_t v301 = v103;
LABEL_161:
  if ((*(void *)&has & 0x80000000000) == 0)
  {
    unint64_t v300 = 0;
    goto LABEL_170;
  }
  double shareCountInLastMonthNormalizedAcrossItems = self->_shareCountInLastMonthNormalizedAcrossItems;
  double v105 = -shareCountInLastMonthNormalizedAcrossItems;
  if (shareCountInLastMonthNormalizedAcrossItems >= 0.0) {
    double v105 = self->_shareCountInLastMonthNormalizedAcrossItems;
  }
  long double v106 = floor(v105 + 0.5);
  double v107 = (v105 - v106) * 1.84467441e19;
  unint64_t v108 = 2654435761u * (unint64_t)fmod(v106, 1.84467441e19);
  if (v107 >= 0.0)
  {
    unint64_t v300 = v108;
    if (v107 <= 0.0) {
      goto LABEL_170;
    }
    unint64_t v109 = v108 + (unint64_t)v107;
  }
  else
  {
    unint64_t v109 = v108 - (unint64_t)fabs(v107);
  }
  unint64_t v300 = v109;
LABEL_170:
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
    unint64_t v299 = 0;
    goto LABEL_179;
  }
  double clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
  double v111 = -clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
  if (clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems >= 0.0) {
    double v111 = self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
  }
  long double v112 = floor(v111 + 0.5);
  double v113 = (v111 - v112) * 1.84467441e19;
  unint64_t v114 = 2654435761u * (unint64_t)fmod(v112, 1.84467441e19);
  if (v113 >= 0.0)
  {
    unint64_t v299 = v114;
    if (v113 <= 0.0) {
      goto LABEL_179;
    }
    unint64_t v115 = v114 + (unint64_t)v113;
  }
  else
  {
    unint64_t v115 = v114 - (unint64_t)fabs(v113);
  }
  unint64_t v299 = v115;
LABEL_179:
  if ((*(_WORD *)&has & 0x800) == 0)
  {
    unint64_t v298 = 0;
    goto LABEL_188;
  }
  double clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
  double v117 = -clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
  if (clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems >= 0.0) {
    double v117 = self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
  }
  long double v118 = floor(v117 + 0.5);
  double v119 = (v117 - v118) * 1.84467441e19;
  unint64_t v120 = 2654435761u * (unint64_t)fmod(v118, 1.84467441e19);
  if (v119 >= 0.0)
  {
    unint64_t v298 = v120;
    if (v119 <= 0.0) {
      goto LABEL_188;
    }
    unint64_t v121 = v120 + (unint64_t)v119;
  }
  else
  {
    unint64_t v121 = v120 - (unint64_t)fabs(v119);
  }
  unint64_t v298 = v121;
LABEL_188:
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
    unint64_t v297 = 0;
    goto LABEL_197;
  }
  double clickCountGivenLocationInLastWeekNormalizedAcrossItems = self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems;
  double v123 = -clickCountGivenLocationInLastWeekNormalizedAcrossItems;
  if (clickCountGivenLocationInLastWeekNormalizedAcrossItems >= 0.0) {
    double v123 = self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems;
  }
  long double v124 = floor(v123 + 0.5);
  double v125 = (v123 - v124) * 1.84467441e19;
  unint64_t v126 = 2654435761u * (unint64_t)fmod(v124, 1.84467441e19);
  if (v125 >= 0.0)
  {
    unint64_t v297 = v126;
    if (v125 <= 0.0) {
      goto LABEL_197;
    }
    unint64_t v127 = v126 + (unint64_t)v125;
  }
  else
  {
    unint64_t v127 = v126 - (unint64_t)fabs(v125);
  }
  unint64_t v297 = v127;
LABEL_197:
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
    unint64_t v296 = 0;
    goto LABEL_206;
  }
  double clickCountGivenLocationInLastMonthNormalizedAcrossItems = self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems;
  double v129 = -clickCountGivenLocationInLastMonthNormalizedAcrossItems;
  if (clickCountGivenLocationInLastMonthNormalizedAcrossItems >= 0.0) {
    double v129 = self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems;
  }
  long double v130 = floor(v129 + 0.5);
  double v131 = (v129 - v130) * 1.84467441e19;
  unint64_t v132 = 2654435761u * (unint64_t)fmod(v130, 1.84467441e19);
  if (v131 >= 0.0)
  {
    unint64_t v296 = v132;
    if (v131 <= 0.0) {
      goto LABEL_206;
    }
    unint64_t v133 = v132 + (unint64_t)v131;
  }
  else
  {
    unint64_t v133 = v132 - (unint64_t)fabs(v131);
  }
  unint64_t v296 = v133;
LABEL_206:
  if ((*(unsigned char *)&has & 4) == 0)
  {
    unint64_t v295 = 0;
    goto LABEL_215;
  }
  double clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
  double v135 = -clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
  if (clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems >= 0.0) {
    double v135 = self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
  }
  long double v136 = floor(v135 + 0.5);
  double v137 = (v135 - v136) * 1.84467441e19;
  double v138 = fmod(v136, 1.84467441e19);
  if (v137 >= 0.0)
  {
    unint64_t v295 = 2654435761u * (unint64_t)v138;
    if (v137 <= 0.0) {
      goto LABEL_215;
    }
    unint64_t v139 = v295 + (unint64_t)v137;
  }
  else
  {
    unint64_t v139 = 2654435761u * (unint64_t)v138 - (unint64_t)fabs(v137);
  }
  unint64_t v295 = v139;
LABEL_215:
  if ((*(unsigned char *)&has & 2) == 0)
  {
    unint64_t v294 = 0;
    goto LABEL_224;
  }
  double clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
  double v141 = -clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
  if (clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems >= 0.0) {
    double v141 = self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
  }
  long double v142 = floor(v141 + 0.5);
  double v143 = (v141 - v142) * 1.84467441e19;
  double v144 = fmod(v142, 1.84467441e19);
  if (v143 >= 0.0)
  {
    unint64_t v294 = 2654435761u * (unint64_t)v144;
    if (v143 <= 0.0) {
      goto LABEL_224;
    }
    unint64_t v145 = v294 + (unint64_t)v143;
  }
  else
  {
    unint64_t v145 = 2654435761u * (unint64_t)v144 - (unint64_t)fabs(v143);
  }
  unint64_t v294 = v145;
LABEL_224:
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    double clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
    double v148 = -clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
    if (clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems >= 0.0) {
      double v148 = self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
    }
    long double v149 = floor(v148 + 0.5);
    double v150 = (v148 - v149) * 1.84467441e19;
    unint64_t v146 = 2654435761u * (unint64_t)fmod(v149, 1.84467441e19);
    if (v150 >= 0.0)
    {
      if (v150 > 0.0) {
        v146 += (unint64_t)v150;
      }
    }
    else
    {
      v146 -= (unint64_t)fabs(v150);
    }
  }
  else
  {
    unint64_t v146 = 0;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    double clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
    double v152 = -clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
    if (clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems >= 0.0) {
      double v152 = self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
    }
    long double v153 = floor(v152 + 0.5);
    double v154 = (v152 - v153) * 1.84467441e19;
    double v155 = fmod(v153, 1.84467441e19);
    if (v154 >= 0.0)
    {
      unint64_t v293 = 2654435761u * (unint64_t)v155;
      if (v154 > 0.0) {
        v293 += (unint64_t)v154;
      }
    }
    else
    {
      unint64_t v293 = 2654435761u * (unint64_t)v155 - (unint64_t)fabs(v154);
    }
  }
  else
  {
    unint64_t v293 = 0;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    double clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
    double v157 = -clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
    if (clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems >= 0.0) {
      double v157 = self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
    }
    long double v158 = floor(v157 + 0.5);
    double v159 = (v157 - v158) * 1.84467441e19;
    double v160 = fmod(v158, 1.84467441e19);
    if (v159 >= 0.0)
    {
      unint64_t v292 = 2654435761u * (unint64_t)v160;
      if (v159 > 0.0) {
        v292 += (unint64_t)v159;
      }
    }
    else
    {
      unint64_t v292 = 2654435761u * (unint64_t)v160 - (unint64_t)fabs(v159);
    }
  }
  else
  {
    unint64_t v292 = 0;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    double clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
    double v162 = -clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
    if (clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems >= 0.0) {
      double v162 = self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
    }
    long double v163 = floor(v162 + 0.5);
    double v164 = (v162 - v163) * 1.84467441e19;
    double v165 = fmod(v163, 1.84467441e19);
    if (v164 >= 0.0)
    {
      unint64_t v291 = 2654435761u * (unint64_t)v165;
      if (v164 > 0.0) {
        v291 += (unint64_t)v164;
      }
    }
    else
    {
      unint64_t v291 = 2654435761u * (unint64_t)v165 - (unint64_t)fabs(v164);
    }
  }
  else
  {
    unint64_t v291 = 0;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    double clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
    double v167 = -clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
    if (clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems >= 0.0) {
      double v167 = self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
    }
    long double v168 = floor(v167 + 0.5);
    double v169 = (v167 - v168) * 1.84467441e19;
    double v170 = fmod(v168, 1.84467441e19);
    if (v169 >= 0.0)
    {
      unint64_t v290 = 2654435761u * (unint64_t)v170;
      if (v169 > 0.0) {
        v290 += (unint64_t)v169;
      }
    }
    else
    {
      unint64_t v290 = 2654435761u * (unint64_t)v170 - (unint64_t)fabs(v169);
    }
  }
  else
  {
    unint64_t v290 = 0;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    double clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
    double v172 = -clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
    if (clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems >= 0.0) {
      double v172 = self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
    }
    long double v173 = floor(v172 + 0.5);
    double v174 = (v172 - v173) * 1.84467441e19;
    double v175 = fmod(v173, 1.84467441e19);
    if (v174 >= 0.0)
    {
      unint64_t v289 = 2654435761u * (unint64_t)v175;
      if (v174 > 0.0) {
        v289 += (unint64_t)v174;
      }
    }
    else
    {
      unint64_t v289 = 2654435761u * (unint64_t)v175 - (unint64_t)fabs(v174);
    }
  }
  else
  {
    unint64_t v289 = 0;
  }
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    double shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
    double v177 = -shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
    if (shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems >= 0.0) {
      double v177 = self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
    }
    long double v178 = floor(v177 + 0.5);
    double v179 = (v177 - v178) * 1.84467441e19;
    double v180 = fmod(v178, 1.84467441e19);
    if (v179 >= 0.0)
    {
      unint64_t v288 = 2654435761u * (unint64_t)v180;
      if (v179 > 0.0) {
        v288 += (unint64_t)v179;
      }
    }
    else
    {
      unint64_t v288 = 2654435761u * (unint64_t)v180 - (unint64_t)fabs(v179);
    }
  }
  else
  {
    unint64_t v288 = 0;
  }
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    double shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
    double v182 = -shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
    if (shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems >= 0.0) {
      double v182 = self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
    }
    long double v183 = floor(v182 + 0.5);
    double v184 = (v182 - v183) * 1.84467441e19;
    double v185 = fmod(v183, 1.84467441e19);
    if (v184 >= 0.0)
    {
      unint64_t v287 = 2654435761u * (unint64_t)v185;
      if (v184 > 0.0) {
        v287 += (unint64_t)v184;
      }
    }
    else
    {
      unint64_t v287 = 2654435761u * (unint64_t)v185 - (unint64_t)fabs(v184);
    }
  }
  else
  {
    unint64_t v287 = 0;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    double shareCountGivenLocationInLastWeekNormalizedAcrossItems = self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems;
    double v187 = -shareCountGivenLocationInLastWeekNormalizedAcrossItems;
    if (shareCountGivenLocationInLastWeekNormalizedAcrossItems >= 0.0) {
      double v187 = self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems;
    }
    long double v188 = floor(v187 + 0.5);
    double v189 = (v187 - v188) * 1.84467441e19;
    double v190 = fmod(v188, 1.84467441e19);
    if (v189 >= 0.0)
    {
      unint64_t v286 = 2654435761u * (unint64_t)v190;
      if (v189 > 0.0) {
        v286 += (unint64_t)v189;
      }
    }
    else
    {
      unint64_t v286 = 2654435761u * (unint64_t)v190 - (unint64_t)fabs(v189);
    }
  }
  else
  {
    unint64_t v286 = 0;
  }
  if ((*(void *)&has & 0x2000000000) != 0)
  {
    double shareCountGivenLocationInLastMonthNormalizedAcrossItems = self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems;
    double v192 = -shareCountGivenLocationInLastMonthNormalizedAcrossItems;
    if (shareCountGivenLocationInLastMonthNormalizedAcrossItems >= 0.0) {
      double v192 = self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems;
    }
    long double v193 = floor(v192 + 0.5);
    double v194 = (v192 - v193) * 1.84467441e19;
    double v195 = fmod(v193, 1.84467441e19);
    if (v194 >= 0.0)
    {
      unint64_t v285 = 2654435761u * (unint64_t)v195;
      if (v194 > 0.0) {
        v285 += (unint64_t)v194;
      }
    }
    else
    {
      unint64_t v285 = 2654435761u * (unint64_t)v195 - (unint64_t)fabs(v194);
    }
  }
  else
  {
    unint64_t v285 = 0;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    double shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
    double v197 = -shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
    if (shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems >= 0.0) {
      double v197 = self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
    }
    long double v198 = floor(v197 + 0.5);
    double v199 = (v197 - v198) * 1.84467441e19;
    double v200 = fmod(v198, 1.84467441e19);
    if (v199 >= 0.0)
    {
      unint64_t v284 = 2654435761u * (unint64_t)v200;
      if (v199 > 0.0) {
        v284 += (unint64_t)v199;
      }
    }
    else
    {
      unint64_t v284 = 2654435761u * (unint64_t)v200 - (unint64_t)fabs(v199);
    }
  }
  else
  {
    unint64_t v284 = 0;
  }
  if ((*(void *)&has & 0x200000000) != 0)
  {
    double shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
    double v202 = -shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
    if (shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems >= 0.0) {
      double v202 = self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
    }
    long double v203 = floor(v202 + 0.5);
    double v204 = (v202 - v203) * 1.84467441e19;
    double v205 = fmod(v203, 1.84467441e19);
    if (v204 >= 0.0)
    {
      unint64_t v283 = 2654435761u * (unint64_t)v205;
      if (v204 > 0.0) {
        v283 += (unint64_t)v204;
      }
    }
    else
    {
      unint64_t v283 = 2654435761u * (unint64_t)v205 - (unint64_t)fabs(v204);
    }
  }
  else
  {
    unint64_t v283 = 0;
  }
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    double shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
    double v207 = -shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
    if (shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems >= 0.0) {
      double v207 = self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
    }
    long double v208 = floor(v207 + 0.5);
    double v209 = (v207 - v208) * 1.84467441e19;
    double v210 = fmod(v208, 1.84467441e19);
    if (v209 >= 0.0)
    {
      unint64_t v282 = 2654435761u * (unint64_t)v210;
      if (v209 > 0.0) {
        v282 += (unint64_t)v209;
      }
    }
    else
    {
      unint64_t v282 = 2654435761u * (unint64_t)v210 - (unint64_t)fabs(v209);
    }
  }
  else
  {
    unint64_t v282 = 0;
  }
  if ((*(void *)&has & 0x8000000000) != 0)
  {
    double shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
    double v212 = -shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
    if (shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems >= 0.0) {
      double v212 = self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
    }
    long double v213 = floor(v212 + 0.5);
    double v214 = (v212 - v213) * 1.84467441e19;
    double v215 = fmod(v213, 1.84467441e19);
    if (v214 >= 0.0)
    {
      unint64_t v281 = 2654435761u * (unint64_t)v215;
      if (v214 > 0.0) {
        v281 += (unint64_t)v214;
      }
    }
    else
    {
      unint64_t v281 = 2654435761u * (unint64_t)v215 - (unint64_t)fabs(v214);
    }
  }
  else
  {
    unint64_t v281 = 0;
  }
  if ((*(void *)&has & 0x1000000000) != 0)
  {
    double shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
    double v217 = -shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
    if (shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems >= 0.0) {
      double v217 = self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
    }
    long double v218 = floor(v217 + 0.5);
    double v219 = (v217 - v218) * 1.84467441e19;
    double v220 = fmod(v218, 1.84467441e19);
    if (v219 >= 0.0)
    {
      unint64_t v280 = 2654435761u * (unint64_t)v220;
      if (v219 > 0.0) {
        v280 += (unint64_t)v219;
      }
    }
    else
    {
      unint64_t v280 = 2654435761u * (unint64_t)v220 - (unint64_t)fabs(v219);
    }
  }
  else
  {
    unint64_t v280 = 0;
  }
  unint64_t v275 = v9;
  if ((*(void *)&has & 0x800000000) != 0)
  {
    double shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
    double v223 = -shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
    if (shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems >= 0.0) {
      double v223 = self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
    }
    long double v224 = floor(v223 + 0.5);
    double v225 = (v223 - v224) * 1.84467441e19;
    unint64_t v221 = 2654435761u * (unint64_t)fmod(v224, 1.84467441e19);
    if (v225 >= 0.0)
    {
      if (v225 > 0.0) {
        v221 += (unint64_t)v225;
      }
    }
    else
    {
      v221 -= (unint64_t)fabs(v225);
    }
  }
  else
  {
    unint64_t v221 = 0;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    double clipScore = self->_clipScore;
    double v227 = -clipScore;
    if (clipScore >= 0.0) {
      double v227 = self->_clipScore;
    }
    long double v228 = floor(v227 + 0.5);
    double v229 = (v227 - v228) * 1.84467441e19;
    double v230 = fmod(v228, 1.84467441e19);
    if (v229 >= 0.0)
    {
      unint64_t v279 = 2654435761u * (unint64_t)v230;
      if (v229 > 0.0) {
        v279 += (unint64_t)v229;
      }
    }
    else
    {
      unint64_t v279 = 2654435761u * (unint64_t)v230 - (unint64_t)fabs(v229);
    }
  }
  else
  {
    unint64_t v279 = 0;
  }
  if ((*(void *)&has & 0x2000000000000) != 0) {
    uint64_t v269 = 2654435761 * self->_clicked;
  }
  else {
    uint64_t v269 = 0;
  }
  unint64_t v271 = v24;
  if ((*(void *)&has & 0x200000000000) != 0) {
    uint64_t v268 = 2654435761 * self->_clickOrder;
  }
  else {
    uint64_t v268 = 0;
  }
  unint64_t v270 = v19;
  if ((*(void *)&has & 0x400000000000) != 0)
  {
    uint64_t v267 = 2654435761 * self->_itemPosition;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_368;
    }
LABEL_373:
    unint64_t v236 = v221;
    unint64_t v235 = 0;
    goto LABEL_376;
  }
  uint64_t v267 = 0;
  if ((*(_DWORD *)&has & 0x2000000) == 0) {
    goto LABEL_373;
  }
LABEL_368:
  double l2ModelScore = self->_l2ModelScore;
  double v232 = -l2ModelScore;
  if (l2ModelScore >= 0.0) {
    double v232 = self->_l2ModelScore;
  }
  long double v233 = floor(v232 + 0.5);
  double v234 = (v232 - v233) * 1.84467441e19;
  unint64_t v235 = 2654435761u * (unint64_t)fmod(v233, 1.84467441e19);
  unint64_t v236 = v221;
  if (v234 >= 0.0)
  {
    if (v234 > 0.0) {
      v235 += (unint64_t)v234;
    }
  }
  else
  {
    v235 -= (unint64_t)fabs(v234);
  }
LABEL_376:
  unint64_t v237 = v34;
  unint64_t v238 = v29;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    double isDuplicate = self->_isDuplicate;
    double v241 = -isDuplicate;
    if (isDuplicate >= 0.0) {
      double v241 = self->_isDuplicate;
    }
    long double v242 = floor(v241 + 0.5);
    double v243 = (v241 - v242) * 1.84467441e19;
    unint64_t v239 = 2654435761u * (unint64_t)fmod(v242, 1.84467441e19);
    if (v243 >= 0.0)
    {
      if (v243 > 0.0) {
        v239 += (unint64_t)v243;
      }
    }
    else
    {
      v239 -= (unint64_t)fabs(v243);
    }
  }
  else
  {
    unint64_t v239 = 0;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    double isCompleteMatch = self->_isCompleteMatch;
    double v263 = -isCompleteMatch;
    if (isCompleteMatch >= 0.0) {
      double v263 = self->_isCompleteMatch;
    }
    long double v264 = floor(v263 + 0.5);
    double v265 = (v263 - v264) * 1.84467441e19;
    unint64_t v244 = 2654435761u * (unint64_t)fmod(v264, 1.84467441e19);
    if (v265 >= 0.0)
    {
      unint64_t v246 = v309;
      unint64_t v245 = v310;
      unint64_t v248 = v307;
      unint64_t v247 = v308;
      unint64_t v250 = v305;
      unint64_t v249 = v306;
      unint64_t v252 = v303;
      unint64_t v251 = v304;
      unint64_t v254 = v301;
      unint64_t v253 = v302;
      unint64_t v256 = v299;
      unint64_t v255 = v300;
      unint64_t v258 = v297;
      unint64_t v257 = v298;
      unint64_t v259 = v296;
      unint64_t v261 = v294;
      unint64_t v260 = v295;
      if (v265 > 0.0) {
        v244 += (unint64_t)v265;
      }
    }
    else
    {
      v244 -= (unint64_t)fabs(v265);
      unint64_t v246 = v309;
      unint64_t v245 = v310;
      unint64_t v248 = v307;
      unint64_t v247 = v308;
      unint64_t v250 = v305;
      unint64_t v249 = v306;
      unint64_t v252 = v303;
      unint64_t v251 = v304;
      unint64_t v254 = v301;
      unint64_t v253 = v302;
      unint64_t v256 = v299;
      unint64_t v255 = v300;
      unint64_t v258 = v297;
      unint64_t v257 = v298;
      unint64_t v259 = v296;
      unint64_t v261 = v294;
      unint64_t v260 = v295;
    }
  }
  else
  {
    unint64_t v244 = 0;
    unint64_t v246 = v309;
    unint64_t v245 = v310;
    unint64_t v248 = v307;
    unint64_t v247 = v308;
    unint64_t v250 = v305;
    unint64_t v249 = v306;
    unint64_t v252 = v303;
    unint64_t v251 = v304;
    unint64_t v254 = v301;
    unint64_t v253 = v302;
    unint64_t v256 = v299;
    unint64_t v255 = v300;
    unint64_t v258 = v297;
    unint64_t v257 = v298;
    unint64_t v259 = v296;
    unint64_t v261 = v294;
    unint64_t v260 = v295;
  }
  return v277 ^ v278 ^ v276 ^ v275 ^ v14 ^ v270 ^ v271 ^ v238 ^ v237 ^ v274 ^ v245 ^ v273 ^ v272 ^ v246 ^ v247 ^ v248 ^ v249 ^ v250 ^ v251 ^ v252 ^ v253 ^ v254 ^ v255 ^ v256 ^ v257 ^ v258 ^ v259 ^ v260 ^ v261 ^ v146 ^ v293 ^ v292 ^ v291 ^ v290 ^ v289 ^ v288 ^ v287 ^ v286 ^ v285 ^ v284 ^ v283 ^ v282 ^ v281 ^ v280 ^ v236 ^ v279 ^ v269 ^ v268 ^ v267 ^ v235 ^ v239 ^ v244;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 48))
  {
    id v6 = v4;
    -[AMLPhotosSearchLabeledData setSearchSessionUUID:](self, "setSearchSessionUUID:");
    id v4 = v6;
  }
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x1000000000000) != 0)
  {
    self->_uint64_t uiSurface = *((_DWORD *)v4 + 98);
    *(void *)&self->_has |= 0x1000000000000uLL;
    uint64_t v5 = *((void *)v4 + 50);
    if ((v5 & 0x20000000) == 0)
    {
LABEL_5:
      if ((v5 & 0x4000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_60;
    }
  }
  else if ((v5 & 0x20000000) == 0)
  {
    goto LABEL_5;
  }
  self->_double matchedPeopleRatio = *((double *)v4 + 30);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x100000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_double matchedLocationRatio = *((double *)v4 + 27);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_double matchedSceneRatio = *((double *)v4 + 33);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_double matchedSceneConfidence = *((double *)v4 + 32);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_double matchedSceneBoundingBox = *((double *)v4 + 31);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_double matchedOCRCharacterRatio = *((double *)v4 + 28);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x800000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_double matchedOCRImportance = *((double *)v4 + 29);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x800000000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_matchedFieldsCount = *((_DWORD *)v4 + 94);
  *(void *)&self->_has |= 0x800000000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_double l1Score = *((double *)v4 + 25);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x20000) == 0)
  {
LABEL_14:
    if ((v5 & 0x4000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_double freshness = *((double *)v4 + 18);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x4000000000000) == 0)
  {
LABEL_15:
    if ((v5 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_favorited = *((unsigned char *)v4 + 397);
  *(void *)&self->_has |= 0x4000000000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 1) == 0)
  {
LABEL_16:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_double aestheticScore = *((double *)v4 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x10000) == 0)
  {
LABEL_17:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_double curationScore = *((double *)v4 + 17);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x80000) == 0)
  {
LABEL_18:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_double hasEverClickInLastWeek = *((double *)v4 + 20);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x40000) == 0)
  {
LABEL_19:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_double hasEverClickInLastMonth = *((double *)v4 + 19);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x200000) == 0)
  {
LABEL_20:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_double hasEverShareInLastWeek = *((double *)v4 + 22);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x100000) == 0)
  {
LABEL_21:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_double hasEverShareInLastMonth = *((double *)v4 + 21);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x4000) == 0)
  {
LABEL_22:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_double clickCountInLastWeekNormalizedAcrossItems = *((double *)v4 + 15);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x2000) == 0)
  {
LABEL_23:
    if ((v5 & 0x100000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_double clickCountInLastMonthNormalizedAcrossItems = *((double *)v4 + 14);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x100000000000) == 0)
  {
LABEL_24:
    if ((v5 & 0x80000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_double shareCountInLastWeekNormalizedAcrossItems = *((double *)v4 + 45);
  *(void *)&self->_has |= 0x100000000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x80000000000) == 0)
  {
LABEL_25:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_double shareCountInLastMonthNormalizedAcrossItems = *((double *)v4 + 44);
  *(void *)&self->_has |= 0x80000000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x1000) == 0)
  {
LABEL_26:
    if ((v5 & 0x800) == 0) {
      goto LABEL_27;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_double clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = *((double *)v4 + 13);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x800) == 0)
  {
LABEL_27:
    if ((v5 & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_double clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = *((double *)v4 + 12);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x40) == 0)
  {
LABEL_28:
    if ((v5 & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_double clickCountGivenLocationInLastWeekNormalizedAcrossItems = *((double *)v4 + 7);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x20) == 0)
  {
LABEL_29:
    if ((v5 & 4) == 0) {
      goto LABEL_30;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_double clickCountGivenLocationInLastMonthNormalizedAcrossItems = *((double *)v4 + 6);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 4) == 0)
  {
LABEL_30:
    if ((v5 & 2) == 0) {
      goto LABEL_31;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_double clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems = *((double *)v4 + 3);
  *(void *)&self->_has |= 4uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 2) == 0)
  {
LABEL_31:
    if ((v5 & 0x100) == 0) {
      goto LABEL_32;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_double clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems = *((double *)v4 + 2);
  *(void *)&self->_has |= 2uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x100) == 0)
  {
LABEL_32:
    if ((v5 & 0x80) == 0) {
      goto LABEL_33;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_double clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems = *((double *)v4 + 9);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x80) == 0)
  {
LABEL_33:
    if ((v5 & 0x400) == 0) {
      goto LABEL_34;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_double clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems = *((double *)v4 + 8);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x400) == 0)
  {
LABEL_34:
    if ((v5 & 0x200) == 0) {
      goto LABEL_35;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_double clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = *((double *)v4 + 11);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x200) == 0)
  {
LABEL_35:
    if ((v5 & 0x10) == 0) {
      goto LABEL_36;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_double clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = *((double *)v4 + 10);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x10) == 0)
  {
LABEL_36:
    if ((v5 & 8) == 0) {
      goto LABEL_37;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_double clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = *((double *)v4 + 5);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 8) == 0)
  {
LABEL_37:
    if ((v5 & 0x40000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_double clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = *((double *)v4 + 4);
  *(void *)&self->_has |= 8uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x20000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_double shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems = *((double *)v4 + 43);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x4000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_double shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems = *((double *)v4 + 42);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_40:
    if ((v5 & 0x2000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_double shareCountGivenLocationInLastWeekNormalizedAcrossItems = *((double *)v4 + 39);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_41:
    if ((v5 & 0x400000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_double shareCountGivenLocationInLastMonthNormalizedAcrossItems = *((double *)v4 + 38);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_42:
    if ((v5 & 0x200000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_double shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems = *((double *)v4 + 35);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_43:
    if ((v5 & 0x10000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_double shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems = *((double *)v4 + 34);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_44:
    if ((v5 & 0x8000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_99;
  }
LABEL_98:
  self->_double shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems = *((double *)v4 + 41);
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_45:
    if ((v5 & 0x1000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_double shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems = *((double *)v4 + 40);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_46:
    if ((v5 & 0x800000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_101;
  }
LABEL_100:
  self->_double shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems = *((double *)v4 + 37);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_47:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_102;
  }
LABEL_101:
  self->_double shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems = *((double *)v4 + 36);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x8000) == 0)
  {
LABEL_48:
    if ((v5 & 0x2000000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_double clipScore = *((double *)v4 + 16);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x2000000000000) == 0)
  {
LABEL_49:
    if ((v5 & 0x200000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_clicked = *((unsigned char *)v4 + 396);
  *(void *)&self->_has |= 0x2000000000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x200000000000) == 0)
  {
LABEL_50:
    if ((v5 & 0x400000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_clickOrder = *((_DWORD *)v4 + 92);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x400000000000) == 0)
  {
LABEL_51:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_itemPosition = *((_DWORD *)v4 + 93);
  *(void *)&self->_has |= 0x400000000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_52:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_107;
  }
LABEL_106:
  self->_double l2ModelScore = *((double *)v4 + 26);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v5 = *((void *)v4 + 50);
  if ((v5 & 0x800000) == 0)
  {
LABEL_53:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_107:
  self->_double isDuplicate = *((double *)v4 + 24);
  *(void *)&self->_has |= 0x800000uLL;
  if ((*((void *)v4 + 50) & 0x400000) != 0)
  {
LABEL_54:
    self->_double isCompleteMatch = *((double *)v4 + 23);
    *(void *)&self->_has |= 0x400000uLL;
  }
LABEL_55:
}

- (NSString)searchSessionUUID
{
  return self->_searchSessionUUID;
}

- (void)setSearchSessionUUID:(id)a3
{
}

- (double)matchedPeopleRatio
{
  return self->_matchedPeopleRatio;
}

- (double)matchedLocationRatio
{
  return self->_matchedLocationRatio;
}

- (double)matchedSceneRatio
{
  return self->_matchedSceneRatio;
}

- (double)matchedSceneConfidence
{
  return self->_matchedSceneConfidence;
}

- (double)matchedSceneBoundingBox
{
  return self->_matchedSceneBoundingBox;
}

- (double)matchedOCRCharacterRatio
{
  return self->_matchedOCRCharacterRatio;
}

- (double)matchedOCRImportance
{
  return self->_matchedOCRImportance;
}

- (unsigned)matchedFieldsCount
{
  return self->_matchedFieldsCount;
}

- (double)l1Score
{
  return self->_l1Score;
}

- (double)freshness
{
  return self->_freshness;
}

- (BOOL)favorited
{
  return self->_favorited;
}

- (double)aestheticScore
{
  return self->_aestheticScore;
}

- (double)curationScore
{
  return self->_curationScore;
}

- (double)hasEverClickInLastWeek
{
  return self->_hasEverClickInLastWeek;
}

- (double)hasEverClickInLastMonth
{
  return self->_hasEverClickInLastMonth;
}

- (double)hasEverShareInLastWeek
{
  return self->_hasEverShareInLastWeek;
}

- (double)hasEverShareInLastMonth
{
  return self->_hasEverShareInLastMonth;
}

- (double)clickCountInLastWeekNormalizedAcrossItems
{
  return self->_clickCountInLastWeekNormalizedAcrossItems;
}

- (double)clickCountInLastMonthNormalizedAcrossItems
{
  return self->_clickCountInLastMonthNormalizedAcrossItems;
}

- (double)shareCountInLastWeekNormalizedAcrossItems
{
  return self->_shareCountInLastWeekNormalizedAcrossItems;
}

- (double)shareCountInLastMonthNormalizedAcrossItems
{
  return self->_shareCountInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenLocationInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenLocationInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenLocationInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenLocationInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenRecencyCategoryInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenRecencyCategoryInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
}

- (double)clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems
{
  return self->_clickCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
}

- (double)clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems
{
  return self->_clickCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
}

- (double)shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenTimeOfDayInLastWeekNormalizedAcrossItems;
}

- (double)shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenTimeOfDayInLastMonthNormalizedAcrossItems;
}

- (double)shareCountGivenLocationInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenLocationInLastWeekNormalizedAcrossItems;
}

- (double)shareCountGivenLocationInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenLocationInLastMonthNormalizedAcrossItems;
}

- (double)shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenDayCategoryInLastWeekNormalizedAcrossItems;
}

- (double)shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenDayCategoryInLastMonthNormalizedAcrossItems;
}

- (double)shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenSceneCategoryInLastWeekNormalizedAcrossItems;
}

- (double)shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenSceneCategoryInLastMonthNormalizedAcrossItems;
}

- (double)shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems
{
  return self->_shareCountGivenFaceCountCategoryInLastWeekNormalizedAcrossItems;
}

- (double)shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems
{
  return self->_shareCountGivenFaceCountCategoryInLastMonthNormalizedAcrossItems;
}

- (double)clipScore
{
  return self->_clipScore;
}

- (BOOL)clicked
{
  return self->_clicked;
}

- (unsigned)clickOrder
{
  return self->_clickOrder;
}

- (unsigned)itemPosition
{
  return self->_itemPosition;
}

- (double)l2ModelScore
{
  return self->_l2ModelScore;
}

- (double)isDuplicate
{
  return self->_isDuplicate;
}

- (double)isCompleteMatch
{
  return self->_isCompleteMatch;
}

- (void).cxx_destruct
{
}

@end