@interface MUPlaceRibbonSectionController
- (BOOL)_shouldShowCallToActionRibbonItem;
- (BOOL)_shouldShowRatingsRibbonItem;
- (BOOL)_supportsAddRatingsCallToAction;
- (BOOL)hasContent;
- (BOOL)isActive;
- (BOOL)isAllowedToShowRatingScoreRibbonItem;
- (BOOL)isImpressionable;
- (BOOL)ribbonView:(id)a3 shouldShowRibbonItem:(id)a4;
- (BOOL)shouldShowARPCallToAction;
- (GEOPlaceRibbonConfiguration)ribbonConfig;
- (MUPlaceCallToActionAppearance)submissionStatus;
- (MUPlaceRibbonSectionController)initWithMapItem:(id)a3 configuration:(id)a4;
- (MUPlaceRibbonSectionControllerDelegate)ribbonDelegate;
- (UIView)sectionView;
- (id)_submissionStatusForCallToAction;
- (id)_submissionStatusForRatings;
- (int)analyticsModuleType;
- (void)_setupRibbonView;
- (void)_updateAppearanceForSubmissionStatus;
- (void)_updateWithPreviousState:(BOOL)a3;
- (void)buildContent;
- (void)performInstrumentationForScrollLeft;
- (void)performInstrumentationForScrollRight;
- (void)ribbonView:(id)a3 didTapItemWithViewModel:(id)a4 withPresentationOptions:(id)a5;
- (void)setActive:(BOOL)a3;
- (void)setRibbonDelegate:(id)a3;
- (void)setSubmissionStatus:(id)a3;
@end

@implementation MUPlaceRibbonSectionController

- (MUPlaceRibbonSectionController)initWithMapItem:(id)a3 configuration:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MUPlaceRibbonSectionController;
  v8 = [(MUPlaceSectionController *)&v13 initWithMapItem:a3];
  if (v8)
  {
    v9 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceRibbonSectionControllerInit", "", v12, 2u);
    }

    objc_storeStrong((id *)&v8->_configuration, a4);
    [(MUPlaceRibbonSectionController *)v8 _setupRibbonView];
    v10 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceRibbonSectionControllerInit", "", v12, 2u);
    }
  }
  return v8;
}

- (void)_setupRibbonView
{
  v3 = [MUPlaceRibbonView alloc];
  v4 = -[MUPlaceRibbonView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  ribbonView = self->_ribbonView;
  self->_ribbonView = v4;

  [(MUPlaceRibbonView *)self->_ribbonView setDelegate:self];
  [(MUPlaceRibbonView *)self->_ribbonView setAnalyticsDelegate:self];
  v6 = [[MUPlaceSectionView alloc] initWithStyle:0 alwaysHideSeparators:1];
  sectionView = self->_sectionView;
  self->_sectionView = v6;

  [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
  [(MUPlaceSectionView *)self->_sectionView attachViewToContentView:self->_ribbonView];
  [(MUPlaceRibbonSectionController *)self buildContent];
}

- (void)buildContent
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__MUPlaceRibbonSectionController_buildContent__block_invoke;
  aBlock[3] = &unk_1E574FF88;
  id v4 = v3;
  id v89 = v4;
  v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v6 = [(MUPlaceSectionController *)self mapItem];
  id v7 = [(MUPlaceRibbonSectionController *)self ribbonConfig];

  v79 = (void *)v6;
  if (v7)
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    v8 = [(MUPlaceRibbonSectionController *)self ribbonConfig];
    v9 = [v8 ribbonItems];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v84 objects:v95 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v77 = v4;
      uint64_t v12 = *(void *)v85;
      v78 = self;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v85 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v84 + 1) + 8 * v13);
          char v15 = [v14 isValid];
          v16 = MUGetPlaceCardLog();
          v17 = v16;
          if (v15)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              int v18 = [v14 type];
              *(_DWORD *)buf = 67109120;
              LODWORD(v92) = v18;
              _os_log_impl(&dword_1931EA000, v17, OS_LOG_TYPE_INFO, "Creating a ribbon from ribbon type %d", buf, 8u);
            }

            switch([v14 type])
            {
              case 0u:
                v19 = MUGetPlaceCardLog();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v92 = v14;
                  _os_log_impl(&dword_1931EA000, v19, OS_LOG_TYPE_ERROR, "Encountered a ribbon item %@ with an unknown type", buf, 0xCu);
                }

                break;
              case 1u:
                uint64_t v22 = +[MUPlaceRibbonItemViewModel hoursItemViewModelForMapItem:v79];
                goto LABEL_24;
              case 2u:
                v23 = [MUPlaceRatingAndSubmissionStatusRibbonViewModel alloc];
                v24 = [(MUPlaceRibbonSectionController *)self _submissionStatusForRatings];
                v25 = [(MUPlaceRatingAndSubmissionStatusRibbonViewModel *)v23 initWithMapItem:v79 submissionStatus:v24];
                uint64_t v26 = 112;
                ratingViewModel = self->_ratingViewModel;
                self->_ratingViewModel = v25;

                goto LABEL_37;
              case 3u:
                v28 = [v14 amenityItem];
                v29 = +[MUPlaceRibbonItemViewModel amenityItemViewForMapItem:v79 amenityItemConfiguration:v28];
                v5[2](v5, v29);

                goto LABEL_25;
              case 4u:
                uint64_t v22 = +[MUPlaceRibbonItemViewModel costItemViewForMapItem:v79];
                goto LABEL_24;
              case 5u:
                uint64_t v22 = +[MUPlaceRibbonItemViewModel guidesItemViewModelForMapItem:v79];
LABEL_24:
                v28 = (void *)v22;
                v5[2](v5, (void *)v22);
                goto LABEL_25;
              case 6u:
                v30 = [(MUPlaceSectionController *)self mapItem];
                v31 = [v30 _encyclopedicInfo];
                v32 = [v14 factoidItem];
                v17 = objc_msgSend(v31, "factoidAtIndex:", objc_msgSend(v32, "indexWithinFactoidComponent"));

                if (v17)
                {
                  v33 = +[MUPlaceRibbonItemViewModel factoidItemForFactoid:v17];
                  v5[2](v5, v33);
                }
                else
                {
                  v33 = MUGetPlaceCardLog();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    v45 = [v14 factoidItem];
                    int v46 = [v45 indexWithinFactoidComponent];
                    *(_DWORD *)buf = 67109120;
                    LODWORD(v92) = v46;
                    _os_log_impl(&dword_1931EA000, v33, OS_LOG_TYPE_ERROR, "Failed to find a factoid with index %d", buf, 8u);
                  }
                }
                self = v78;

                goto LABEL_18;
              case 7u:
                if (MapsFeature_IsEnabled_SydneyARP())
                {
                  v34 = [MUPlaceRatingAndSubmissionStatusRibbonViewModel alloc];
                  v35 = [(MUPlaceRibbonSectionController *)self _submissionStatusForCallToAction];
                  v36 = [(MUPlaceRatingAndSubmissionStatusRibbonViewModel *)v34 initWithMapItem:0 submissionStatus:v35];
                  uint64_t v26 = 104;
                }
                else
                {
                  v43 = [MUPlaceCallToActionRibbonViewModel alloc];
                  v35 = [(MUPlaceRibbonSectionController *)self _submissionStatusForCallToAction];
                  v36 = [(MUPlaceCallToActionRibbonViewModel *)v43 initWithSubmissionStatus:v35];
                  uint64_t v26 = 96;
                }
                goto LABEL_35;
              case 8u:
                v37 = [MUPlaceDistanceRibbonViewModel alloc];
                v35 = [(MUPlaceSectionController *)self mapItem];
                v38 = [(MUPlaceRibbonSectionControllerConfiguration *)self->_configuration etaProvider];
                v39 = [(MUPlaceDistanceRibbonViewModel *)v37 initWithMapItem:v35 etaProvider:v38];
                uint64_t v26 = 120;
                distanceViewModel = self->_distanceViewModel;
                self->_distanceViewModel = v39;

                goto LABEL_36;
              case 9u:
                v28 = [(MUPlaceRibbonSectionControllerConfiguration *)self->_configuration availability];
                if ([v28 supportsEVCharging])
                {
                  v41 = [(MUPlaceRibbonSectionControllerConfiguration *)self->_configuration evChargerAvailabilityProvider];

                  if (v41)
                  {
                    v42 = [MUPlaceRibbonEVChargingViewModel alloc];
                    v35 = [(MUPlaceRibbonSectionControllerConfiguration *)self->_configuration evChargerAvailabilityProvider];
                    v36 = [(MUPlaceRibbonEVChargingViewModel *)v42 initWithAvailabilityProvider:v35];
                    uint64_t v26 = 128;
LABEL_35:
                    v44 = *(Class *)((char *)&self->super.super.isa + v26);
                    *(Class *)((char *)&self->super.super.isa + v26) = v36;

LABEL_36:
LABEL_37:
                    v5[2](v5, *(void **)((char *)&self->super.super.isa + v26));
                  }
                }
                else
                {
LABEL_25:
                }
                break;
              default:
                break;
            }
          }
          else
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              unsigned int v20 = [v14 type] - 1;
              v21 = @"RIBBON_ITEM_TYPE_UNKNOWN";
              if (v20 <= 8) {
                v21 = off_1E574FFA8[v20];
              }
              *(_DWORD *)buf = 138412546;
              v92 = v14;
              __int16 v93 = 2112;
              v94 = v21;
              _os_log_impl(&dword_1931EA000, v17, OS_LOG_TYPE_ERROR, "Ribbon item %@ of type %@ is invalid", buf, 0x16u);
            }
LABEL_18:
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v47 = [v9 countByEnumeratingWithState:&v84 objects:v95 count:16];
        uint64_t v11 = v47;
      }
      while (v47);
      id v4 = v77;
    }
  }
  else
  {
    v48 = +[MUPlaceRibbonItemViewModel hoursItemViewModelForMapItem:v6];
    v5[2](v5, v48);

    v49 = [MUPlaceRatingAndSubmissionStatusRibbonViewModel alloc];
    v50 = [(MUPlaceRibbonSectionController *)self _submissionStatusForRatings];
    v51 = [(MUPlaceRatingAndSubmissionStatusRibbonViewModel *)v49 initWithMapItem:v6 submissionStatus:v50];
    v52 = self->_ratingViewModel;
    self->_ratingViewModel = v51;

    v5[2](v5, self->_ratingViewModel);
    if (MapsFeature_IsEnabled_SydneyARP())
    {
      v53 = [MUPlaceRatingAndSubmissionStatusRibbonViewModel alloc];
      v54 = [(MUPlaceRibbonSectionController *)self _submissionStatusForCallToAction];
      uint64_t v55 = [(MUPlaceRatingAndSubmissionStatusRibbonViewModel *)v53 initWithMapItem:0 submissionStatus:v54];
      uint64_t v56 = 104;
    }
    else
    {
      v57 = [MUPlaceCallToActionRibbonViewModel alloc];
      v54 = [(MUPlaceRibbonSectionController *)self _submissionStatusForCallToAction];
      uint64_t v55 = [(MUPlaceCallToActionRibbonViewModel *)v57 initWithSubmissionStatus:v54];
      uint64_t v56 = 96;
    }
    v58 = (uint64_t *)((char *)self + v56);
    v59 = *(Class *)((char *)&self->super.super.isa + v56);
    uint64_t *v58 = v55;

    v5[2](v5, (void *)*v58);
    v60 = +[MUPlaceRibbonItemViewModel guidesItemViewModelForMapItem:v6];
    v5[2](v5, v60);

    v61 = +[MUPlaceRibbonItemViewModel costItemViewForMapItem:v6];
    v5[2](v5, v61);

    v62 = +[MUPlaceRibbonItemViewModel amenityItemViewForMapItem:v6 amenityItemConfiguration:0];
    v5[2](v5, v62);

    v63 = [MUPlaceDistanceRibbonViewModel alloc];
    v64 = [(MUPlaceSectionController *)self mapItem];
    v65 = [(MUPlaceRibbonSectionControllerConfiguration *)self->_configuration etaProvider];
    v66 = [(MUPlaceDistanceRibbonViewModel *)v63 initWithMapItem:v64 etaProvider:v65];
    v67 = self->_distanceViewModel;
    self->_distanceViewModel = v66;

    v5[2](v5, self->_distanceViewModel);
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v68 = [(MUPlaceSectionController *)self mapItem];
    v69 = [v68 _geoMapItem];
    v70 = [v69 _encyclopedicInfo];
    v9 = [v70 factoids];

    uint64_t v71 = [v9 countByEnumeratingWithState:&v80 objects:v90 count:16];
    if (v71)
    {
      uint64_t v72 = v71;
      id v73 = v4;
      uint64_t v74 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v72; ++i)
        {
          if (*(void *)v81 != v74) {
            objc_enumerationMutation(v9);
          }
          v76 = +[MUPlaceRibbonItemViewModel factoidItemForFactoid:*(void *)(*((void *)&v80 + 1) + 8 * i)];
          v5[2](v5, v76);
        }
        uint64_t v72 = [v9 countByEnumeratingWithState:&v80 objects:v90 count:16];
      }
      while (v72);
      id v4 = v73;
    }
  }

  [(MUPlaceRibbonView *)self->_ribbonView setViewModels:v4];
  [(MUPlaceRibbonView *)self->_ribbonView reloadVisibility];
}

uint64_t __46__MUPlaceRibbonSectionController_buildContent__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (GEOPlaceRibbonConfiguration)ribbonConfig
{
  return [(MUPlaceRibbonSectionControllerConfiguration *)self->_configuration ribbonConfiguration];
}

- (BOOL)_supportsAddRatingsCallToAction
{
  id v3 = [(MUPlaceRibbonSectionControllerConfiguration *)self->_configuration availability];
  char v4 = [v3 supportsPhotoOnlyDataCollection];

  if (v4) {
    return 0;
  }
  uint64_t v6 = [(MUPlaceRibbonSectionControllerConfiguration *)self->_configuration availability];
  char v7 = [v6 supportsCallToAction];

  return v7;
}

- (BOOL)_shouldShowCallToActionRibbonItem
{
  if (![(MUPlaceRibbonSectionController *)self _supportsAddRatingsCallToAction]) {
    return 0;
  }
  id v3 = [(MUPlaceRatingAndSubmissionStatusRibbonViewModel *)self->_ratingViewModel submissionStatus];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)_shouldShowRatingsRibbonItem
{
  if (GEOConfigGetBOOL()
    && ([(MUPlaceSectionController *)self mapItem],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 _geoMapItem],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 _hasAppleRatings],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    return ![(MUPlaceRibbonSectionController *)self _supportsAddRatingsCallToAction];
  }
  else
  {
    return 1;
  }
}

- (BOOL)hasContent
{
  return [(MUPlaceRibbonView *)self->_ribbonView hasContent];
}

- (void)setSubmissionStatus:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_submissionStatus;
  uint64_t v7 = (uint64_t)v5;
  uint64_t v8 = v7;
  if (v7 | v6)
  {
    id v10 = (id)v7;
    BOOL v9 = [(id)v6 isEqual:v7];

    uint64_t v8 = (uint64_t)v10;
    if (!v9)
    {
      objc_storeStrong((id *)&self->_submissionStatus, a3);
      uint64_t v7 = [(MUPlaceRibbonSectionController *)self _updateAppearanceForSubmissionStatus];
      uint64_t v8 = (uint64_t)v10;
    }
  }
  MEMORY[0x1F41817F8](v7, v8);
}

- (id)_submissionStatusForRatings
{
  if (!MapsFeature_IsEnabled_SydneyARP()) {
    goto LABEL_8;
  }
  id v3 = [(MUPlaceSectionController *)self mapItem];
  BOOL v4 = [v3 _geoMapItem];
  if (([v4 _hasAppleRatings] & 1) == 0)
  {

    goto LABEL_8;
  }
  BOOL v5 = [(MUPlaceRibbonSectionController *)self _supportsAddRatingsCallToAction];

  if (!v5)
  {
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  unint64_t v6 = [(MUPlaceRibbonSectionController *)self submissionStatus];
  if ([v6 type] == 4)
  {
    uint64_t v7 = [(MUPlaceRibbonSectionController *)self submissionStatus];
    uint64_t v8 = [v7 ratingState];

    if (v8)
    {
      BOOL v9 = [(MUPlaceRibbonSectionController *)self submissionStatus];
      goto LABEL_9;
    }
  }
  else
  {
  }
  BOOL v9 = [[MUPlaceCallToActionAppearance alloc] initWithType:1];
LABEL_9:
  return v9;
}

- (id)_submissionStatusForCallToAction
{
  int IsEnabled_SydneyARP = MapsFeature_IsEnabled_SydneyARP();
  BOOL v4 = [(MUPlaceRibbonSectionController *)self submissionStatus];
  BOOL v5 = v4;
  if (IsEnabled_SydneyARP)
  {
    if ([(MUPlaceCallToActionAppearance *)v4 type] == 4)
    {
      unint64_t v6 = [(MUPlaceRibbonSectionController *)self submissionStatus];
      uint64_t v7 = [v6 ratingState];

      if (v7)
      {
        uint64_t v8 = [(MUPlaceRibbonSectionController *)self submissionStatus];
LABEL_7:
        BOOL v5 = v8;
        goto LABEL_8;
      }
    }
    else
    {
    }
    uint64_t v8 = [[MUPlaceCallToActionAppearance alloc] initWithType:1];
    goto LABEL_7;
  }
LABEL_8:
  return v5;
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (void)_updateAppearanceForSubmissionStatus
{
  BOOL v3 = [(MUPlaceRibbonSectionController *)self hasContent];
  BOOL v4 = [(MUPlaceRibbonSectionController *)self _submissionStatusForRatings];
  [(MUPlaceRatingAndSubmissionStatusRibbonViewModel *)self->_ratingViewModel setSubmissionStatus:v4];

  BOOL v5 = [(MUPlaceRibbonSectionController *)self _submissionStatusForCallToAction];
  [(MUPlaceCallToActionRibbonViewModel *)self->_arpViewModel setSubmissionStatus:v5];

  unint64_t v6 = [(MUPlaceRibbonSectionController *)self _submissionStatusForCallToAction];
  [(MUPlaceRatingAndSubmissionStatusRibbonViewModel *)self->_arpViewModelSydney setSubmissionStatus:v6];

  [(MUPlaceRibbonView *)self->_ribbonView reloadVisibility];
  [(MUPlaceRibbonSectionController *)self _updateWithPreviousState:v3];
}

- (void)_updateWithPreviousState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(MUPlaceRibbonSectionController *)self hasContent] != a3)
  {
    BOOL v5 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109376;
      v7[1] = v3;
      __int16 v8 = 1024;
      BOOL v9 = [(MUPlaceRibbonSectionController *)self hasContent];
      _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_INFO, "MUPlaceHeaderButtonsSectionController: hasContent changed from %d to %d, will tell parent to update.", (uint8_t *)v7, 0xEu);
    }

    unint64_t v6 = [(MUPlaceSectionController *)self delegate];
    [v6 placeSectionControllerDidUpdateContent:self];
  }
}

- (void)ribbonView:(id)a3 didTapItemWithViewModel:(id)a4 withPresentationOptions:(id)a5
{
  id v10 = a5;
  uint64_t v7 = [a4 type];
  if (v7 == 2)
  {
    __int16 v8 = [(MUPlaceRibbonSectionController *)self ribbonDelegate];
    [v8 ribbonSectionControllerDidTapHours:self];
  }
  else
  {
    if (v7 != 1) {
      goto LABEL_6;
    }
    [(MUPlaceSectionController *)self captureInfoCardAction:99 eventValue:@"place context" feedbackType:0];
    __int16 v8 = [(MUPlaceRibbonSectionController *)self ribbonDelegate];
    BOOL v9 = [(MUPlaceRibbonSectionController *)self submissionStatus];
    objc_msgSend(v8, "ribbonSectionControllerDidTapAddRatings:initialRatingState:withPresentationOptions:", self, objc_msgSend(v9, "ratingState"), v10);
  }
LABEL_6:
}

- (BOOL)ribbonView:(id)a3 shouldShowRibbonItem:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (MUPlaceCallToActionRibbonViewModel *)a4;
  __int16 v8 = v7;
  if (self->_arpViewModel == v7 || (MUPlaceCallToActionRibbonViewModel *)self->_arpViewModelSydney == v7)
  {
    BOOL v10 = [(MUPlaceRibbonSectionController *)self _shouldShowCallToActionRibbonItem];
LABEL_7:
    BOOL v9 = v10;
    goto LABEL_8;
  }
  if ((MUPlaceCallToActionRibbonViewModel *)self->_ratingViewModel == v7)
  {
    BOOL v10 = [(MUPlaceRibbonSectionController *)self _shouldShowRatingsRibbonItem];
    goto LABEL_7;
  }
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (int)analyticsModuleType
{
  return 35;
}

- (void)performInstrumentationForScrollLeft
{
}

- (void)performInstrumentationForScrollRight
{
}

- (BOOL)isImpressionable
{
  return 1;
}

- (MUPlaceCallToActionAppearance)submissionStatus
{
  return self->_submissionStatus;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (MUPlaceRibbonSectionControllerDelegate)ribbonDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ribbonDelegate);
  return (MUPlaceRibbonSectionControllerDelegate *)WeakRetained;
}

- (void)setRibbonDelegate:(id)a3
{
}

- (BOOL)shouldShowARPCallToAction
{
  return self->_shouldShowARPCallToAction;
}

- (BOOL)isAllowedToShowRatingScoreRibbonItem
{
  return self->_isAllowedToShowRatingScoreRibbonItem;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ribbonDelegate);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_evChargingViewModel, 0);
  objc_storeStrong((id *)&self->_distanceViewModel, 0);
  objc_storeStrong((id *)&self->_ratingViewModel, 0);
  objc_storeStrong((id *)&self->_arpViewModelSydney, 0);
  objc_storeStrong((id *)&self->_arpViewModel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_ribbonView, 0);
}

@end