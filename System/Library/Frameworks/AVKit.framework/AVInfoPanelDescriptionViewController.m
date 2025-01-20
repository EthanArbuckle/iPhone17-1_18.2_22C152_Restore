@interface AVInfoPanelDescriptionViewController
- (AVInfoPanelDescriptionViewController)initWithCoder:(id)a3;
- (AVInfoPanelDescriptionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AVPlayerController)playerController;
- (BOOL)hasContent;
- (BOOL)isClosedCaptioned;
- (CGSize)preferredContentSize;
- (NSArray)actions;
- (NSArray)metadata;
- (NSDate)creationDate;
- (double)duration;
- (id)_durationString;
- (id)_metadataItemForIdentifiers:(id)a3;
- (id)_releaseDateStringStyle:(int64_t)a3;
- (int64_t)viewingModeBadge;
- (void)_loadPosterFromMetadataItem:(id)a3;
- (void)_updateActionButtons;
- (void)_updatePosterViewWithImage:(id)a3;
- (void)_updateViewsWithNewMetadata;
- (void)loadView;
- (void)setActions:(id)a3;
- (void)setClosedCaptioned:(BOOL)a3;
- (void)setCreationDate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setMetadata:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setViewingModeBadge:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation AVInfoPanelDescriptionViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_playerController);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_monthDayYearFormatter, 0);

  objc_storeStrong((id *)&self->_yearFormatter, 0);
}

- (void)setPlayerController:(id)a3
{
}

- (AVPlayerController)playerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerController);

  return (AVPlayerController *)WeakRetained;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setViewingModeBadge:(int64_t)a3
{
  self->_viewingModeBadge = a3;
}

- (int64_t)viewingModeBadge
{
  return self->_viewingModeBadge;
}

- (BOOL)isClosedCaptioned
{
  return self->_closedCaptioned;
}

- (double)duration
{
  return self->_duration;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSArray)metadata
{
  return self->_metadata;
}

- (id)_durationString
{
  if (self->_duration <= 0.0)
  {
    v7 = 0;
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C00]);
    v4 = v3;
    if (self->_duration >= 600.0) {
      uint64_t v5 = 96;
    }
    else {
      uint64_t v5 = 192;
    }
    [v3 setAllowedUnits:v5];
    [v4 setUnitsStyle:2];
    v6 = [v4 stringFromTimeInterval:self->_duration];
    v7 = [v6 stringByReplacingOccurrencesOfString:@"," withString:&stru_1F09185C8];
  }

  return v7;
}

- (id)_releaseDateStringStyle:(int64_t)a3
{
  v22[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15CA0] keySpace:*MEMORY[0x1E4F15DE0]];
  v22[0] = v5;
  v6 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15E68] keySpace:*MEMORY[0x1E4F15DF8]];
  v22[1] = v6;
  v7 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15EE8] keySpace:*MEMORY[0x1E4F15E08]];
  v22[2] = v7;
  v8 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15D28] keySpace:*MEMORY[0x1E4F15DE8]];
  v22[3] = v8;
  v9 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15C30] keySpace:*MEMORY[0x1E4F15DF0]];
  v22[4] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];

  v11 = [(AVInfoPanelDescriptionViewController *)self _metadataItemForIdentifiers:v10];
  v12 = [v11 dateValue];
  v13 = [v11 stringValue];
  v14 = [(AVInfoPanelDescriptionViewController *)self creationDate];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__AVInfoPanelDescriptionViewController__releaseDateStringStyle___block_invoke;
  v21[3] = &unk_1E5FC26C0;
  v21[4] = self;
  v21[5] = a3;
  uint64_t v15 = MEMORY[0x1B3E963E0](v21);
  v16 = (void *)v15;
  if (v12)
  {
    v17 = *(void (**)(void))(v15 + 16);
LABEL_3:
    v17();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (!v13)
  {
    v17 = *(void (**)(void))(v15 + 16);
    goto LABEL_3;
  }
  id v18 = v13;
LABEL_6:
  v19 = v18;

  return v19;
}

id __64__AVInfoPanelDescriptionViewController__releaseDateStringStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = 984;
    v6 = *(void **)(v4 + 984);
    if (v6) {
      goto LABEL_7;
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 984);
    *(void *)(v8 + 984) = v7;

    [*(id *)(*(void *)(a1 + 32) + 984) setDateStyle:3];
    [*(id *)(*(void *)(a1 + 32) + 984) setTimeStyle:0];
  }
  else
  {
    uint64_t v5 = 976;
    v6 = *(void **)(v4 + 976);
    if (v6) {
      goto LABEL_7;
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 976);
    *(void *)(v11 + 976) = v10;

    [*(id *)(*(void *)(a1 + 32) + 976) setDateFormat:@"yyyy"];
  }
  v6 = *(void **)(*(void *)(a1 + 32) + v5);
LABEL_7:
  v13 = [v6 stringFromDate:v3];

  return v13;
}

- (void)_loadPosterFromMetadataItem:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__AVInfoPanelDescriptionViewController__loadPosterFromMetadataItem___block_invoke;
  v6[3] = &unk_1E5FC3D18;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [v5 loadValuesAsynchronouslyForKeys:&unk_1F094A2B0 completionHandler:v6];
}

void __68__AVInfoPanelDescriptionViewController__loadPosterFromMetadataItem___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dataValue];
  if ([v2 length])
  {
    id v3 = [MEMORY[0x1E4FB1818] imageWithData:v2];
  }
  else
  {
    id v3 = 0;
  }
  objc_initWeak(&location, *(id *)(a1 + 40));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__AVInfoPanelDescriptionViewController__loadPosterFromMetadataItem___block_invoke_2;
  v6[3] = &unk_1E5FC4180;
  objc_copyWeak(&v8, &location);
  id v4 = v3;
  id v7 = v4;
  id v5 = (void (**)(void))MEMORY[0x1B3E963E0](v6);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v5[2](v5);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __68__AVInfoPanelDescriptionViewController__loadPosterFromMetadataItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updatePosterViewWithImage:*(void *)(a1 + 32)];
}

- (void)_updatePosterViewWithImage:(id)a3
{
}

- (void)_updateActionButtons
{
  if ([(AVInfoPanelDescriptionViewController *)self isViewLoaded])
  {
    id v5 = self->_actions;
    if ([(NSArray *)v5 count])
    {
      uint64_t v3 = [(NSArray *)v5 bs_filter:&__block_literal_global_5430];

      id v4 = (void *)v3;
    }
    else
    {
      id v4 = v5;
    }
    id v6 = v4;
    [(AVInfoPanelDescriptionView *)self->_descriptionView setActions:v4];
  }
}

BOOL __60__AVInfoPanelDescriptionViewController__updateActionButtons__block_invoke(uint64_t a1, void *a2)
{
  return ([a2 attributes] & 1) == 0;
}

- (void)_updateViewsWithNewMetadata
{
  v85[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AVInfoPanelDescriptionViewController *)self metadata];

  if (v3)
  {
    v85[0] = *MEMORY[0x1E4F15C58];
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:1];
    v75 = [(AVInfoPanelDescriptionViewController *)self _metadataItemForIdentifiers:v4];

    uint64_t v84 = *MEMORY[0x1E4F15C80];
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
    id v6 = [(AVInfoPanelDescriptionViewController *)self _metadataItemForIdentifiers:v5];

    uint64_t v7 = *MEMORY[0x1E4F15DB0];
    v83[0] = @"avkt/com.apple.avkit.alternateSubTitle";
    v83[1] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];
    v9 = [(AVInfoPanelDescriptionViewController *)self _metadataItemForIdentifiers:v8];

    uint64_t v10 = *MEMORY[0x1E4F15E08];
    uint64_t v11 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15EE0] keySpace:*MEMORY[0x1E4F15E08]];
    v82[0] = v11;
    v12 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15E80] keySpace:*MEMORY[0x1E4F15DF8]];
    v82[1] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
    v14 = [(AVInfoPanelDescriptionViewController *)self _metadataItemForIdentifiers:v13];

    uint64_t v15 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15EC8] keySpace:v10];
    v81[0] = v15;
    v16 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15C28] keySpace:*MEMORY[0x1E4F15DF0]];
    v81[1] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
    uint64_t v71 = [(AVInfoPanelDescriptionViewController *)self _metadataItemForIdentifiers:v17];

    v80 = @"avkt/com.apple.avkit.seasonNumber";
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
    v19 = [(AVInfoPanelDescriptionViewController *)self _metadataItemForIdentifiers:v18];

    v79 = @"avkt/com.apple.avkit.episodeNumber";
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
    v74 = [(AVInfoPanelDescriptionViewController *)self _metadataItemForIdentifiers:v20];

    v78 = @"avkt/com.apple.avkit.rottenTomatoesRating";
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
    v73 = [(AVInfoPanelDescriptionViewController *)self _metadataItemForIdentifiers:v21];

    v77 = @"avkt/com.apple.avkit.rottenTomatoesFreshness";
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
    v72 = [(AVInfoPanelDescriptionViewController *)self _metadataItemForIdentifiers:v22];

    v23 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15C98] keySpace:*MEMORY[0x1E4F15DE0]];
    v76[0] = v23;
    v24 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15ED0] keySpace:v10];
    v76[1] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
    v66 = [(AVInfoPanelDescriptionViewController *)self _metadataItemForIdentifiers:v25];

    uint64_t v26 = [v75 stringValue];
    v69 = v6;
    v27 = [v6 stringValue];
    v67 = v14;
    uint64_t v28 = [v14 stringValue];
    v68 = v9;
    v29 = [v9 stringValue];
    if ([v29 length])
    {

      v30 = 0;
    }
    else
    {
      v30 = v29;
      v29 = v27;
    }
    uint64_t v31 = 0;
    v70 = v30;
    if (v19 && v74)
    {
      uint64_t v32 = v26;
      v33 = [v19 value];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v35 = [v19 stringValue];
      }
      else
      {
        v36 = [v19 value];
        char v37 = objc_opt_respondsToSelector();

        if (v37)
        {
          v38 = [v19 value];
          v35 = [v38 stringValue];
        }
        else
        {
          v35 = 0;
        }
      }
      v39 = [v74 value];
      objc_opt_class();
      char v40 = objc_opt_isKindOfClass();

      if (v40)
      {
        v41 = [v74 stringValue];
      }
      else
      {
        v42 = [v74 value];
        char v43 = objc_opt_respondsToSelector();

        if (v43)
        {
          v44 = [v74 value];
          v41 = [v44 stringValue];
        }
        else
        {
          v41 = 0;
        }
      }
      v45 = NSString;
      v46 = AVLocalizedString(@"Season %@, Episode %@");
      uint64_t v31 = objc_msgSend(v45, "stringWithFormat:", v46, v35, v41);

      uint64_t v26 = v32;
      v30 = v70;
    }
    v47 = self->_descriptionView;
    v62 = (void *)v31;
    [(AVInfoPanelDescriptionView *)v47 setSeasonEpisodeText:v31];
    v63 = v29;
    [(AVInfoPanelDescriptionView *)v47 setTitleText:v29];
    [(AVInfoPanelDescriptionView *)v47 setSecondaryTitleText:v30];
    v65 = (void *)v26;
    [(AVInfoPanelDescriptionView *)v47 setSummaryText:v26];
    v64 = (void *)v28;
    [(AVInfoPanelDescriptionView *)v47 setGenreText:v28];
    v48 = [(AVInfoPanelDescriptionViewController *)self _releaseDateStringStyle:0];
    [(AVInfoPanelDescriptionView *)v47 setDateText:v48];
    v49 = [v72 numberValue];
    uint64_t v50 = [v49 integerValue];
    v51 = [v73 numberValue];
    [v51 floatValue];
    -[AVInfoPanelDescriptionView setTomatoFreshness:rating:hidden:](v47, "setTomatoFreshness:rating:hidden:", v50, v73 == 0);

    v52 = (void *)v71;
    v53 = +[AVMediaContentRatings displayStringForMetadataItem:v71];
    v54 = +[AVMediaContentRatings imageForMetadataItem:v71];
    v55 = +[AVRatingProviders shared];
    v56 = [v55 findRatingString:v53];

    if (v56)
    {
      v57 = [v56 image];
      v58 = [v57 imageWithBaselineOffsetFromBottom:1.0];

      if (![v56 isImageMask])
      {
        v52 = (void *)v71;
        v61 = v64;
        goto LABEL_27;
      }
      uint64_t v59 = [v58 imageWithRenderingMode:2];
      v52 = (void *)v71;
    }
    else
    {
      v58 = [v54 imageWithBaselineOffsetFromBottom:1.0];
      if (+[AVMediaContentRatings isImageMaskForMetadataItem:v71])
      {
        uint64_t v60 = 2;
      }
      else
      {
        uint64_t v60 = 1;
      }
      uint64_t v59 = [v58 imageWithRenderingMode:v60];
    }
    v61 = v64;

    v58 = (void *)v59;
LABEL_27:
    [(AVInfoPanelDescriptionView *)v47 setContentMediaRatingText:v53 image:v58];
    [(AVInfoPanelDescriptionView *)v47 setViewingModeBadge:[(AVInfoPanelDescriptionViewController *)self viewingModeBadge]];
    [(AVInfoPanelDescriptionViewController *)self _loadPosterFromMetadataItem:v66];
    [(AVInfoPanelDescriptionView *)v47 setPosterViewHidden:v66 == 0];
  }
  [(AVInfoPanelDescriptionViewController *)self _updateActionButtons];
}

- (id)_metadataItemForIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
      uint64_t v10 = (void *)MEMORY[0x1E4F16558];
      uint64_t v11 = [(AVInfoPanelDescriptionViewController *)self metadata];
      v12 = [v10 metadataItemsFromArray:v11 filteredByIdentifier:v9];
      v13 = [v12 firstObject];

      if (v13) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v13 = 0;
  }

  return v13;
}

- (CGSize)preferredContentSize
{
  +[AVInfoPanelDescriptionView layoutSize];
  double v3 = v2 + 20.0;
  double v5 = v4 + 0.0 + 10.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)setActions:(id)a3
{
  id v5 = a3;
  uint64_t actions = (uint64_t)self->_actions;
  if ((id)actions != v5)
  {
    id v7 = v5;
    uint64_t actions = [(id)actions isEqual:v5];
    id v5 = v7;
    if ((actions & 1) == 0)
    {
      objc_storeStrong((id *)&self->_actions, a3);
      uint64_t actions = [(AVInfoPanelDescriptionViewController *)self _updateActionButtons];
      id v5 = v7;
    }
  }

  MEMORY[0x1F41817F8](actions, v5);
}

- (BOOL)hasContent
{
  v11[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(AVInfoPanelDescriptionView *)self->_descriptionView posterImage];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v11[0] = *MEMORY[0x1E4F15C80];
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    uint64_t v6 = [(AVInfoPanelDescriptionViewController *)self _metadataItemForIdentifiers:v5];
    if (v6)
    {
      uint64_t v10 = *MEMORY[0x1E4F15C58];
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
      uint64_t v8 = [(AVInfoPanelDescriptionViewController *)self _metadataItemForIdentifiers:v7];
      BOOL v4 = v8 != 0;
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (void)setClosedCaptioned:(BOOL)a3
{
  if (self->_closedCaptioned != a3)
  {
    self->_closedCaptioned = a3;
    [(AVInfoPanelDescriptionView *)self->_descriptionView setClosedCaptionBadgeHidden:!a3];
  }
}

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    BOOL v4 = self->_descriptionView;
    id v5 = [(AVInfoPanelDescriptionViewController *)self _durationString];
    [(AVInfoPanelDescriptionView *)v4 setDurationText:v5];
  }
}

- (void)setMetadata:(id)a3
{
  id v5 = (NSArray *)a3;
  p_metadata = &self->_metadata;
  if (self->_metadata != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_metadata, a3);
    p_metadata = (NSArray **)[(AVInfoPanelDescriptionViewController *)self _updateViewsWithNewMetadata];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](p_metadata, v5);
}

- (void)willMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVInfoPanelDescriptionViewController;
  [(AVInfoPanelDescriptionViewController *)&v4 willMoveToParentViewController:a3];
  [(AVInfoPanelDescriptionViewController *)self _updateViewsWithNewMetadata];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)AVInfoPanelDescriptionViewController;
  [(AVInfoPanelDescriptionViewController *)&v6 viewDidAppear:a3];
  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v7 = @"Kind";
  v8[0] = @"Info";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 postNotificationName:@"AVPlayerViewControllerDidShowInfoViewControllerNotification" object:self userInfo:v5];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AVInfoPanelDescriptionViewController;
  [(AVInfoPanelDescriptionViewController *)&v5 viewDidLoad];
  double v3 = self->_descriptionView;
  objc_super v4 = [(AVInfoPanelDescriptionViewController *)self _durationString];
  [(AVInfoPanelDescriptionView *)v3 setDurationText:v4];

  [(AVInfoPanelDescriptionView *)v3 setClosedCaptionBadgeHidden:[(AVInfoPanelDescriptionViewController *)self isClosedCaptioned] ^ 1];
  [(AVInfoPanelDescriptionViewController *)self _updateActionButtons];
}

- (void)loadView
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(AVInfoPanelDescriptionViewController *)self setView:v3];
  objc_super v4 = objc_alloc_init(AVInfoPanelDescriptionView);
  descriptionView = self->_descriptionView;
  self->_descriptionView = v4;

  [(AVInfoPanelDescriptionView *)self->_descriptionView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v6 = self->_descriptionView;
  id v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.921568627 alpha:1.0];
  [(AVInfoPanelDescriptionView *)v6 setTitleTextColor:v7];

  uint64_t v8 = self->_descriptionView;
  uint64_t v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(AVInfoPanelDescriptionView *)v8 setTextFont:v9];

  uint64_t v10 = self->_descriptionView;
  uint64_t v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.921568627 alpha:0.6];
  [(AVInfoPanelDescriptionView *)v10 setTextColor:v11];

  [v3 addSubview:self->_descriptionView];
  v24 = [(AVInfoPanelDescriptionView *)self->_descriptionView topAnchor];
  v23 = [v3 topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:0.0];
  v25[0] = v22;
  v21 = [(AVInfoPanelDescriptionView *)self->_descriptionView bottomAnchor];
  uint64_t v20 = [v3 bottomAnchor];
  v12 = [v21 constraintEqualToAnchor:v20 constant:-10.0];
  v25[1] = v12;
  v13 = [(AVInfoPanelDescriptionView *)self->_descriptionView leftAnchor];
  v14 = [v3 leftAnchor];
  long long v15 = [v13 constraintEqualToAnchor:v14 constant:10.0];
  v25[2] = v15;
  long long v16 = [(AVInfoPanelDescriptionView *)self->_descriptionView rightAnchor];
  long long v17 = [v3 rightAnchor];
  long long v18 = [v16 constraintEqualToAnchor:v17 constant:-10.0];
  v25[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v19];
  [(AVInfoPanelDescriptionViewController *)self _updateActionButtons];
}

- (AVInfoPanelDescriptionViewController)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVInfoPanelDescriptionViewController;
  id v3 = [(AVInfoPanelDescriptionViewController *)&v7 initWithCoder:a3];
  if (v3)
  {
    objc_super v4 = AVLocalizedString(@"INFO");
    v6.receiver = v3;
    v6.super_class = (Class)AVInfoPanelDescriptionViewController;
    [(AVInfoPanelDescriptionViewController *)&v6 setTitle:v4];
  }
  return v3;
}

- (AVInfoPanelDescriptionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVInfoPanelDescriptionViewController;
  objc_super v4 = [(AVInfoPanelDescriptionViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    objc_super v5 = AVLocalizedString(@"INFO");
    v7.receiver = v4;
    v7.super_class = (Class)AVInfoPanelDescriptionViewController;
    [(AVInfoPanelDescriptionViewController *)&v7 setTitle:v5];
  }
  return v4;
}

@end