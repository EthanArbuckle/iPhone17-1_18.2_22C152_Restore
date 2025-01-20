@interface CLSTestInvestigationItem
+ (id)itemWithPeopleNames:(id)a3 universalDate:(id)a4 coordinate:(CLLocationCoordinate2D)a5;
+ (id)itemWithUniversalDate:(id)a3 sceneClassifications:(id)a4;
- (BOOL)clsAvoidIfPossibleAsKeyItemForMemories:(BOOL)a3 allowGuestAsset:(BOOL)a4;
- (BOOL)clsAvoidIfPossibleAsKeyItemForMemories:(BOOL)a3 allowGuestAsset:(BOOL)a4 reason:(id *)a5;
- (BOOL)clsAvoidIfPossibleForKeyItem;
- (BOOL)clsHasCustomPlaybackVariation;
- (BOOL)clsHasInterestingAudioClassification;
- (BOOL)clsHasInterestingScenes;
- (BOOL)clsHasPoorResolution;
- (BOOL)clsIsAestheticallyPrettyGood;
- (BOOL)clsIsBlurry;
- (BOOL)clsIsInSharedLibrary;
- (BOOL)clsIsInhabited;
- (BOOL)clsIsInterestingHDR;
- (BOOL)clsIsInterestingLivePhoto;
- (BOOL)clsIsInterestingPanorama;
- (BOOL)clsIsInterestingSDOF;
- (BOOL)clsIsInterestingVideo;
- (BOOL)clsIsLongExposure;
- (BOOL)clsIsLoopOrBounce;
- (BOOL)clsIsNonMemorable;
- (BOOL)clsIsScreenshotOrScreenRecording;
- (BOOL)clsIsUtility;
- (BOOL)isFavorite;
- (BOOL)isVideo;
- (CLLocation)clsLocation;
- (CLLocationCoordinate2D)pl_coordinate;
- (CLSCurationModel)curationModel;
- (CLSTestInvestigationItem)init;
- (NSArray)clsConsolidatedPersonLocalIdentifiers;
- (NSArray)clsPersonAndPetLocalIdentifiers;
- (NSArray)clsPersonLocalIdentifiers;
- (NSArray)clsPetLocalIdentifiers;
- (NSArray)clsUnprefetchedPersonLocalIdentifiers;
- (NSDate)cls_localDate;
- (NSDate)cls_universalDate;
- (NSDateComponents)cls_localDateComponents;
- (NSSet)clsSceneClassifications;
- (NSString)clsIdentifier;
- (VNSceneprint)clsSceneprint;
- (double)clsAestheticScore;
- (double)clsAutoplaySuggestionScore;
- (double)clsContentScore;
- (double)clsDuration;
- (double)clsExposureScore;
- (double)clsFaceScore;
- (double)clsHighlightVisibilityScore;
- (double)clsIconicScore;
- (double)clsSharpnessScore;
- (double)clsSquareCropScore;
- (double)pl_gpsHorizontalAccuracy;
- (double)scoreInContext:(id)a3;
- (int64_t)clsPlayCount;
- (int64_t)clsShareCount;
- (int64_t)clsViewCount;
- (unint64_t)clsPeopleCount;
- (unint64_t)clsSimilarityModelVersion;
- (void)setClsAvoidIfPossibleForKeyItem:(BOOL)a3;
- (void)setClsContentScore:(double)a3;
- (void)setClsLocation:(id)a3;
- (void)setClsPersonLocalIdentifiers:(id)a3;
- (void)setClsSceneClassifications:(id)a3;
- (void)setCls_universalDate:(id)a3;
@end

@implementation CLSTestInvestigationItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clsPetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_cls_universalDate, 0);
  objc_storeStrong((id *)&self->_clsUnprefetchedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_clsSceneprint, 0);
  objc_storeStrong((id *)&self->_clsSceneClassifications, 0);
  objc_storeStrong((id *)&self->_clsConsolidatedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_clsPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_clsLocation, 0);
  objc_storeStrong((id *)&self->_clsIdentifier, 0);
}

- (double)clsIconicScore
{
  return self->_clsIconicScore;
}

- (BOOL)clsIsInSharedLibrary
{
  return self->_clsIsInSharedLibrary;
}

- (NSArray)clsPetLocalIdentifiers
{
  return self->_clsPetLocalIdentifiers;
}

- (double)clsSquareCropScore
{
  return self->_clsSquareCropScore;
}

- (BOOL)clsIsLongExposure
{
  return self->_clsIsLongExposure;
}

- (BOOL)clsIsLoopOrBounce
{
  return self->_clsIsLoopOrBounce;
}

- (BOOL)clsIsNonMemorable
{
  return self->_clsIsNonMemorable;
}

- (double)clsDuration
{
  return self->_clsDuration;
}

- (double)clsAutoplaySuggestionScore
{
  return self->_clsAutoplaySuggestionScore;
}

- (double)clsHighlightVisibilityScore
{
  return self->_clsHighlightVisibilityScore;
}

- (void)setCls_universalDate:(id)a3
{
}

- (NSDate)cls_universalDate
{
  return self->_cls_universalDate;
}

- (BOOL)clsHasInterestingScenes
{
  return self->_clsHasInterestingScenes;
}

- (BOOL)clsHasPoorResolution
{
  return self->_clsHasPoorResolution;
}

- (void)setClsAvoidIfPossibleForKeyItem:(BOOL)a3
{
  self->_clsAvoidIfPossibleForKeyItem = a3;
}

- (BOOL)clsAvoidIfPossibleForKeyItem
{
  return self->_clsAvoidIfPossibleForKeyItem;
}

- (BOOL)clsIsInhabited
{
  return self->_clsIsInhabited;
}

- (double)clsFaceScore
{
  return self->_clsFaceScore;
}

- (BOOL)clsIsAestheticallyPrettyGood
{
  return self->_clsIsAestheticallyPrettyGood;
}

- (double)clsAestheticScore
{
  return self->_clsAestheticScore;
}

- (double)clsExposureScore
{
  return self->_clsExposureScore;
}

- (double)clsSharpnessScore
{
  return self->_clsSharpnessScore;
}

- (BOOL)clsHasCustomPlaybackVariation
{
  return self->_clsHasCustomPlaybackVariation;
}

- (BOOL)clsHasInterestingAudioClassification
{
  return self->_clsHasInterestingAudioClassification;
}

- (BOOL)clsIsInterestingHDR
{
  return self->_clsIsAnInterestingHDR;
}

- (BOOL)clsIsInterestingSDOF
{
  return self->_clsIsAnInterestingSDOF;
}

- (BOOL)clsIsInterestingPanorama
{
  return self->_clsIsAnInterestingPanorama;
}

- (BOOL)clsIsInterestingLivePhoto
{
  return self->_clsIsAnInterestingPhoto;
}

- (BOOL)clsIsInterestingVideo
{
  return self->_clsIsAnInterestingVideo;
}

- (NSArray)clsUnprefetchedPersonLocalIdentifiers
{
  return self->_clsUnprefetchedPersonLocalIdentifiers;
}

- (VNSceneprint)clsSceneprint
{
  return self->_clsSceneprint;
}

- (void)setClsSceneClassifications:(id)a3
{
}

- (NSSet)clsSceneClassifications
{
  return self->_clsSceneClassifications;
}

- (void)setClsContentScore:(double)a3
{
  self->_clsContentScore = a3;
}

- (double)clsContentScore
{
  return self->_clsContentScore;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (BOOL)clsIsScreenshotOrScreenRecording
{
  return self->_clsIsScreenshotOrScreenRecording;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (BOOL)clsIsBlurry
{
  return self->_clsIsBlurry;
}

- (BOOL)clsIsUtility
{
  return self->_clsIsUtility;
}

- (int64_t)clsShareCount
{
  return self->_clsShareCount;
}

- (int64_t)clsPlayCount
{
  return self->_clsPlayCount;
}

- (int64_t)clsViewCount
{
  return self->_clsViewCount;
}

- (NSArray)clsConsolidatedPersonLocalIdentifiers
{
  return self->_clsConsolidatedPersonLocalIdentifiers;
}

- (void)setClsPersonLocalIdentifiers:(id)a3
{
}

- (NSArray)clsPersonLocalIdentifiers
{
  return self->_clsPersonLocalIdentifiers;
}

- (void)setClsLocation:(id)a3
{
}

- (CLLocation)clsLocation
{
  return self->_clsLocation;
}

- (NSString)clsIdentifier
{
  return self->_clsIdentifier;
}

- (double)pl_gpsHorizontalAccuracy
{
  return *MEMORY[0x1E4F8B7F0];
}

- (CLLocationCoordinate2D)pl_coordinate
{
  v3 = [(CLSTestInvestigationItem *)self location];

  if (v3)
  {
    v4 = [(CLSTestInvestigationItem *)self location];
    [v4 coordinate];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1E750];
    double v8 = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }
  double v9 = v6;
  double v10 = v8;
  result.longitude = v10;
  result.latitude = v9;
  return result;
}

- (unint64_t)clsSimilarityModelVersion
{
  return 33;
}

- (CLSCurationModel)curationModel
{
  return 0;
}

- (BOOL)clsAvoidIfPossibleAsKeyItemForMemories:(BOOL)a3 allowGuestAsset:(BOOL)a4
{
  return [(CLSTestInvestigationItem *)self clsAvoidIfPossibleAsKeyItemForMemories:a3 allowGuestAsset:a4 reason:0];
}

- (BOOL)clsAvoidIfPossibleAsKeyItemForMemories:(BOOL)a3 allowGuestAsset:(BOOL)a4 reason:(id *)a5
{
  return self->_clsAvoidIfPossibleForKeyItem;
}

- (double)scoreInContext:(id)a3
{
  [(id)sCurationModel scoreWithAsset:self inContext:a3];
  return result;
}

- (NSDateComponents)cls_localDateComponents
{
  v3 = [(CLSTestInvestigationItem *)self cls_universalDate];
  v4 = [(CLSTestInvestigationItem *)self cls_localDate];
  double v5 = +[CLSCalendar dateComponentsWithUTCDate:v3 localDate:v4];

  return (NSDateComponents *)v5;
}

- (NSDate)cls_localDate
{
  v3 = [(CLSTestInvestigationItem *)self cls_universalDate];
  v4 = [(CLSTestInvestigationItem *)self clsLocation];
  double v5 = +[CLSCalendar localDateFromUniversalDate:v3 atLocation:v4];

  return (NSDate *)v5;
}

- (NSArray)clsPersonAndPetLocalIdentifiers
{
  uint64_t v3 = [(CLSTestInvestigationItem *)self clsPersonLocalIdentifiers];
  v4 = (void *)v3;
  double v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    double v6 = (void *)v3;
  }
  else {
    double v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v6;

  uint64_t v8 = [(CLSTestInvestigationItem *)self clsPetLocalIdentifiers];
  double v9 = (void *)v8;
  if (v8) {
    double v10 = (void *)v8;
  }
  else {
    double v10 = v5;
  }
  id v11 = v10;

  v12 = [v7 arrayByAddingObjectsFromArray:v11];

  return (NSArray *)v12;
}

- (unint64_t)clsPeopleCount
{
  v2 = [(CLSTestInvestigationItem *)self clsPersonLocalIdentifiers];
  unint64_t v3 = [v2 count];

  return v3;
}

- (CLSTestInvestigationItem)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLSTestInvestigationItem;
  v2 = [(CLSTestInvestigationItem *)&v7 init];
  if (v2)
  {
    unint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    clsIdentifier = v2->_clsIdentifier;
    v2->_clsIdentifier = (NSString *)v4;

    v2->_clsAestheticScore = 0.5;
  }
  return v2;
}

+ (id)itemWithUniversalDate:(id)a3 sceneClassifications:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = objc_opt_new();
  objc_msgSend(v7, "setCls_universalDate:", v6);

  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];

  [v7 setClsSceneClassifications:v8];
  return v7;
}

+ (id)itemWithPeopleNames:(id)a3 universalDate:(id)a4 coordinate:(CLLocationCoordinate2D)a5
{
  double longitude = a5.longitude;
  double latitude = a5.latitude;
  id v8 = a3;
  id v9 = a4;
  double v10 = objc_opt_new();
  v14.double latitude = latitude;
  v14.double longitude = longitude;
  if (CLLocationCoordinate2DIsValid(v14))
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:latitude longitude:longitude];
    [v10 setClsLocation:v11];
  }
  [v10 setClsPersonLocalIdentifiers:v8];
  objc_msgSend(v10, "setCls_universalDate:", v9);

  return v10;
}

@end