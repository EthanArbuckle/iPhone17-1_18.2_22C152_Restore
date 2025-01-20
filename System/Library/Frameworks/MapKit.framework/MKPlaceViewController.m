@interface MKPlaceViewController
@end

@implementation MKPlaceViewController

void __48___MKPlaceViewController__updateViewControllers__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v15 = v5;
    uint64_t v7 = [v5 count];
    v6 = v15;
    if (v7)
    {
      v8 = [v15 firstObject];
      uint64_t v9 = *(void *)(a1 + 32);
      if ((*(unsigned char *)(v9 + 1336) & 1) != 0
        || ([v8 _displayMapRegion],
            v10 = objc_claimAutoreleasedReturnValue(),
            v10,
            uint64_t v9 = *(void *)(a1 + 32),
            !v10))
      {
        v11 = [(id)v9 viewControllers];
        int v12 = [v11 containsObject:*(void *)(*(void *)(a1 + 32) + 1184)];

        if (v12) {
          [*(id *)(a1 + 32) removeAdditionalViewController:*(void *)(*(void *)(a1 + 32) + 1184)];
        }
      }
      else
      {
        [*(id *)(v9 + 1184) setMapItem:v8];
      }
      [*(id *)(*(void *)(a1 + 32) + 1176) setMapItem:v8];
      v13 = *(void **)(a1 + 32);
      v14 = [v13 contact];
      [v13 setMapItem:v8 contact:v14 updateOriginalContact:0];

      v6 = v15;
    }
  }
}

void __48___MKPlaceViewController__updateViewControllers__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v14 = v5;
    uint64_t v7 = [v5 count];
    v6 = v14;
    if (v7)
    {
      v8 = [v14 firstObject];
      uint64_t v9 = *(void *)(a1 + 32);
      if ((*(unsigned char *)(v9 + 1336) & 1) != 0
        || ([v8 _displayMapRegion],
            v10 = objc_claimAutoreleasedReturnValue(),
            v10,
            uint64_t v9 = *(void *)(a1 + 32),
            !v10))
      {
        v11 = [(id)v9 viewControllers];
        int v12 = [v11 containsObject:*(void *)(*(void *)(a1 + 32) + 1184)];

        if (v12) {
          [*(id *)(a1 + 32) removeAdditionalViewController:*(void *)(*(void *)(a1 + 32) + 1184)];
        }
      }
      else
      {
        [*(id *)(v9 + 1184) setMapItem:v8];
      }
      [*(id *)(*(void *)(a1 + 32) + 1176) setMapItem:v8];
      if (v8) {
        [v8 _placeCardContact];
      }
      else {
      v13 = [*(id *)(a1 + 32) contact];
      }
      [*(id *)(a1 + 32) setMapItem:v8 contact:v13 updateOriginalContact:0];

      v6 = v14;
    }
  }
}

void __89___MKPlaceViewController_placeHeaderButtonsViewController_didSelectPrimaryType_withView___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = MKGetPlaceCardLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v5)
    {
      v6 = [*(id *)(a1 + 32) mapItem];
      uint64_t v7 = [v6 name];
      int v9 = 138412290;
      v10 = v7;
      v8 = "Successfully launched Maps in SAR mode for mapItem: %@";
LABEL_6:
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v5)
  {
    v6 = [*(id *)(a1 + 32) mapItem];
    uint64_t v7 = [v6 name];
    int v9 = 138412290;
    v10 = v7;
    v8 = "Failed to launched Maps in SAR mode for mapItem: %@";
    goto LABEL_6;
  }
}

uint64_t __89___MKPlaceViewController_placeHeaderButtonsViewController_didSelectPrimaryType_withView___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _showShareSheet:*(void *)(result + 40)];
  }
  return result;
}

void __190___MKPlaceViewController_infoCardTransitAnalyticsDidSelectionAction_resultIndex_targetID_transitSystem_transitDepartureSequence_transitCardCategory_transitIncident_feedbackDelegateSelector___block_invoke(uint64_t a1)
{
  id v9 = +[MKMapService sharedService];
  uint64_t v2 = *(unsigned int *)(a1 + 88);
  v3 = *(void **)(a1 + 32);
  double v4 = *(double *)(a1 + 64);
  uint64_t v5 = *(unsigned int *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v7 = [v3 _vendorID];
  LODWORD(v8) = *(_DWORD *)(a1 + 92);
  [v9 captureTransitPlaceCardUserAction:v2 onTarget:201 eventValue:0 mapItem:v3 timestamp:v5 resultIndex:v6 targetID:v4 providerID:v7 animationID:-1 transitCardCategory:v8 transitSystem:*(void *)(a1 + 40) transitDepartureSequence:*(void *)(a1 + 48) transitIncident:*(void *)(a1 + 56)];
}

void __156___MKPlaceViewController_infoCardAnalyticsDidSelectAction_target_eventValue_actionURL_photoID_moduleMetadata_feedbackDelegateSelector_actionRichProviderId___block_invoke(uint64_t a1)
{
  id v14 = +[MKMapService sharedService];
  uint64_t v2 = *(unsigned int *)(a1 + 100);
  unsigned int v13 = *(_DWORD *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(a1 + 40);
  double v5 = *(double *)(a1 + 88);
  uint64_t v6 = [v4 _muid];
  uint64_t v7 = [*(id *)(a1 + 40) _vendorID];
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  int v10 = *(_DWORD *)(a1 + 104);
  uint64_t v11 = [*(id *)(a1 + 40) _firstLocalizedCategoryName];
  LODWORD(v12) = v10;
  objc_msgSend(v14, "capturePlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:modules:commingledPhotoProviderIDs:actionRichProviderId:", v13, v2, v3, v4, 0xFFFFFFFFLL, v6, v5, v7, 0, v8, v9, v12, v11, *(void *)(a1 + 64), *(void *)(a1 + 72),
    0,
    0,
    *(void *)(a1 + 80));
}

@end