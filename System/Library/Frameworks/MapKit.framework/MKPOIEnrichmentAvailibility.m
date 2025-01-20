@interface MKPOIEnrichmentAvailibility
+ (BOOL)_isMapsApplication;
+ (BOOL)_shouldAllowUserToAddContributionsForMapItem:(id)a3;
+ (BOOL)shouldShowAddPhotoButtonOnEndOfPhotoSliderForMapItem:(id)a3;
+ (BOOL)shouldShowAddPhotoButtonOnMorePhotosGalleryForMapItem:(id)a3 usingAttributionsByProviderIds:(id)a4;
+ (BOOL)shouldShowAddPhotoButtonsOnSingleFullScreenPhotoViewerForMapItem:(id)a3 photoAttribution:(id)a4;
+ (BOOL)shouldShowAppleRatingsForMapItem:(id)a3;
+ (BOOL)shouldShowCallToActionForMapItem:(id)a3;
+ (BOOL)shouldShowCallToActionForMapItem:(id)a3 options:(unint64_t)a4;
+ (BOOL)shouldShowMorePhotosGalleryForMapItem:(id)a3;
+ (BOOL)shouldShowPhotosCallToActionForMapItem:(id)a3;
+ (BOOL)shouldShowRatingInfoCallToActionOnPlaceCardHeaderForMapItem:(id)a3;
+ (BOOL)shouldShowRatingsCallToActionForMapItem:(id)a3;
+ (BOOL)shouldShowReportAnIssueOnPhotoGalleryForMapItem:(id)a3 photoAttribution:(id)a4;
@end

@implementation MKPOIEnrichmentAvailibility

+ (BOOL)shouldShowAppleRatingsForMapItem:(id)a3
{
  v3 = [a3 _geoMapItem];
  char v4 = [v3 _hasAppleRatings];

  return v4;
}

+ (BOOL)shouldShowMorePhotosGalleryForMapItem:(id)a3
{
  return 1;
}

+ (BOOL)shouldShowCallToActionForMapItem:(id)a3
{
  id v4 = a3;
  if (MapsFeature_IsEnabled_LagunaBeach()) {
    char v5 = [a1 _shouldAllowUserToAddContributionsForMapItem:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldShowCallToActionForMapItem:(id)a3 options:(unint64_t)a4
{
  if ((a4 & 0xA0000000) == 0x20000000) {
    return [a1 shouldShowCallToActionForMapItem:a3];
  }
  else {
    return 0;
  }
}

+ (BOOL)shouldShowRatingsCallToActionForMapItem:(id)a3
{
  id v4 = a3;
  char v5 = [v4 _geoMapItem];
  v6 = [v5 _placeQuestionnaire];

  BOOL v7 = [v6 canCollectRatings]
    && ([a1 shouldShowCallToActionForMapItem:v4] & 1) != 0;

  return v7;
}

+ (BOOL)shouldShowPhotosCallToActionForMapItem:(id)a3
{
  id v4 = a3;
  char v5 = [v4 _geoMapItem];
  v6 = [v5 _placeQuestionnaire];

  BOOL v7 = [v6 canCollectPhotos]
    && ([a1 shouldShowCallToActionForMapItem:v4] & 1) != 0;

  return v7;
}

+ (BOOL)shouldShowAddPhotoButtonsOnSingleFullScreenPhotoViewerForMapItem:(id)a3 photoAttribution:(id)a4
{
  id v5 = a3;
  if (MapsFeature_IsEnabled_LagunaBeach() && GEOConfigGetBOOL()) {
    char v6 = [a1 shouldShowPhotosCallToActionForMapItem:v5];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)shouldShowAddPhotoButtonOnEndOfPhotoSliderForMapItem:(id)a3
{
  id v4 = a3;
  if (MapsFeature_IsEnabled_LagunaBeach() && GEOConfigGetBOOL()) {
    char v5 = [a1 shouldShowPhotosCallToActionForMapItem:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldShowRatingInfoCallToActionOnPlaceCardHeaderForMapItem:(id)a3
{
  id v4 = a3;
  if (MapsFeature_IsEnabled_LagunaBeach()
    && [a1 _isMapsApplication]
    && GEOCanUserMakeLagunaBeachContributions()
    && GEODoesUserHaveValidAccountForMakingContributions())
  {
    char v5 = [a1 shouldShowAppleRatingsForMapItem:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldShowAddPhotoButtonOnMorePhotosGalleryForMapItem:(id)a3 usingAttributionsByProviderIds:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (MapsFeature_IsEnabled_LagunaBeach() && GEOConfigGetBOOL())
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = objc_msgSend(v7, "allValues", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (([v13 isUserSubmitted] & 1) == 0 && !objc_msgSend(v13, "isBusinessOwned"))
          {

            goto LABEL_14;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    char v14 = [a1 shouldShowPhotosCallToActionForMapItem:v6];
  }
  else
  {
LABEL_14:
    char v14 = 0;
  }

  return v14;
}

+ (BOOL)shouldShowReportAnIssueOnPhotoGalleryForMapItem:(id)a3 photoAttribution:(id)a4
{
  id v5 = a4;
  if (_MKRAPIsAvailable()) {
    char v6 = [v5 supportsReportingIssue];
  }
  else {
    char v6 = 0;
  }
  char v7 = v6 & [a1 _isMapsApplication];

  return v7;
}

+ (BOOL)_shouldAllowUserToAddContributionsForMapItem:(id)a3
{
  v3 = [a3 _geoMapItem];
  id v4 = [v3 _placeQuestionnaire];
  int v5 = [v4 canShowCallToAction];

  if (!v5 || !GEOCanUserMakeLagunaBeachContributions()) {
    return 0;
  }

  return GEODoesUserHaveValidAccountForMakingContributions();
}

+ (BOOL)_isMapsApplication
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F64320]];

  return v4;
}

@end