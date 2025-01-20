@interface MUPersonalGuidesSectionController
- (BOOL)hasContent;
- (BOOL)isActive;
- (BOOL)isImpressionable;
- (BOOL)verticalCardContainerView:(id)a3 shouldHighlightRowAtIndex:(unint64_t)a4;
- (MUPersonalGuidesSectionController)initWithMapItem:(id)a3 collectionViewProvider:(id)a4;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (UIView)sectionView;
- (int)analyticsModuleType;
- (void)_setupSectionView;
- (void)reloadCollectionsAnimated:(BOOL)a3;
- (void)setActive:(BOOL)a3;
- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5;
@end

@implementation MUPersonalGuidesSectionController

- (MUPersonalGuidesSectionController)initWithMapItem:(id)a3 collectionViewProvider:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUPersonalGuidesSectionController;
  v7 = [(MUPlaceSectionController *)&v12 initWithMapItem:a3];
  if (v7)
  {
    v8 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPersonalGuidesSectionControllerInit", "", v11, 2u);
    }

    objc_storeWeak((id *)&v7->_viewProvider, v6);
    [(MUPersonalGuidesSectionController *)v7 _setupSectionView];
    v9 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPersonalGuidesSectionControllerInit", "", v11, 2u);
    }
  }
  return v7;
}

- (void)_setupSectionView
{
  id v9 = +[MUPlaceVerticalCardConfiguration separatorConfiguration];
  v3 = [[MUPlaceVerticalCardContainerView alloc] initWithConfiguration:v9];
  containerView = self->_containerView;
  self->_containerView = v3;

  [(MUPlaceVerticalCardContainerView *)self->_containerView setDelegate:self];
  [(MUPlaceVerticalCardContainerView *)self->_containerView setAccessibilityIdentifier:@"PersonalGuidesContainer"];
  v5 = self->_containerView;
  id v6 = [(MUPersonalGuidesSectionController *)self sectionHeaderViewModel];
  v7 = +[MUPlaceSectionView cardShadowSectionViewForContentView:v5 sectionHeaderViewModel:v6];
  sectionView = self->_sectionView;
  self->_sectionView = v7;

  [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
}

- (void)setActive:(BOOL)a3
{
  BOOL active = self->_active;
  if (active != a3)
  {
    self->_BOOL active = a3;
    BOOL active = a3;
  }
  if (active)
  {
    v5 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPersonalGuidesSectionControllerActivate", "", buf, 2u);
    }

    [(MUPersonalGuidesSectionController *)self reloadCollectionsAnimated:1];
    id v6 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPersonalGuidesSectionControllerActivate", "", v7, 2u);
    }
  }
}

- (void)reloadCollectionsAnimated:(BOOL)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  v52 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
  id v6 = [WeakRetained collectionViews];

  if ([v6 count])
  {
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    v8 = [v6 allValues];
    uint64_t v9 = [v7 setWithArray:v8];

    id v4 = (id)v9;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  v11 = v52->_collectionViews;
  if ([(NSDictionary *)v52->_collectionViews count])
  {
    objc_super v12 = (void *)MEMORY[0x1E4F1CAD0];
    v13 = [(NSDictionary *)v11 allValues];
    uint64_t v14 = [v12 setWithArray:v13];

    id v10 = (id)v14;
  }
  if ([v4 isEqualToSet:v10])
  {
    v15 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1931EA000, v15, OS_LOG_TYPE_INFO, "MUPersonalGuidesSectionController:  Not updating personal guides as incoming == current", buf, 2u);
    }
  }
  else
  {
    v43 = v11;
    id v44 = v10;
    id v46 = v4;
    uint64_t v16 = [v6 copy];
    collectionViews = v52->_collectionViews;
    v52->_collectionViews = (NSDictionary *)v16;

    int IsMacCatalyst = MapKitIdiomIsMacCatalyst();
    if (IsMacCatalyst) {
      double v19 = 8.0;
    }
    else {
      double v19 = 0.0;
    }
    if (IsMacCatalyst) {
      double v20 = 16.0;
    }
    else {
      double v20 = 0.0;
    }
    v45 = v6;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", 4 * -[NSObject count](v15, "count"));
    id v50 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id obj = [(NSDictionary *)v52->_collectionViews allKeys];
    uint64_t v53 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
    if (v53)
    {
      uint64_t v48 = *(void *)v62;
      double v21 = *MEMORY[0x1E4F1DB28];
      double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      v49 = v15;
      do
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v62 != v48) {
            objc_enumerationMutation(obj);
          }
          uint64_t v60 = *(void *)(*((void *)&v61 + 1) + 8 * i);
          v26 = -[NSDictionary objectForKeyedSubscript:](v52->_collectionViews, "objectForKeyedSubscript:");
          v27 = -[MUPlaceSectionRowView initWithFrame:]([MUPlaceSectionRowView alloc], "initWithFrame:", v21, v22, v23, v24);
          [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
          [(MUPlaceSectionRowView *)v27 setAccessibilityIdentifier:@"PersonalGuide"];
          [(MUPlaceSectionRowView *)v27 addSubview:v26];
          v59 = [v26 topAnchor];
          v58 = [(MUPlaceSectionRowView *)v27 topAnchor];
          v57 = [v59 constraintEqualToAnchor:v58 constant:v19];
          v66[0] = v57;
          v56 = [v26 bottomAnchor];
          v55 = [(MUPlaceSectionRowView *)v27 bottomAnchor];
          v54 = [v56 constraintEqualToAnchor:v55 constant:-v19];
          v66[1] = v54;
          v28 = [v26 leadingAnchor];
          v29 = [(MUPlaceSectionRowView *)v27 leadingAnchor];
          v30 = [v28 constraintEqualToAnchor:v29 constant:v20];
          v66[2] = v30;
          v31 = [v26 trailingAnchor];
          v32 = [(MUPlaceSectionRowView *)v27 trailingAnchor];
          v33 = [v31 constraintEqualToAnchor:v32 constant:-v20];
          v66[3] = v33;
          v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:4];
          [v51 addObjectsFromArray:v34];

          [v50 setObject:v27 forKey:v60];
          v15 = v49;
          [v49 addObject:v27];
        }
        uint64_t v53 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
      }
      while (v53);
    }

    uint64_t v35 = [v50 copy];
    wrappedSectionViewsByIdentifier = v52->_wrappedSectionViewsByIdentifier;
    v52->_wrappedSectionViewsByIdentifier = (NSDictionary *)v35;

    v37 = (void *)MEMORY[0x1E4F28DC8];
    v38 = (void *)[v51 copy];
    [v37 activateConstraints:v38];

    containerView = v52->_containerView;
    id v40 = [v15 copy];
    [(MUPlaceVerticalCardContainerView *)containerView setRowViews:v40];

    v41 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1931EA000, v41, OS_LOG_TYPE_INFO, "MUPersonalGuidesSectionController: Detected change in user collections and telling parent to update content", buf, 2u);
    }

    v42 = [(MUPlaceSectionController *)v52 delegate];
    [v42 placeSectionControllerDidUpdateContent:v52];

    id v6 = v45;
    id v4 = v46;
    v11 = v43;
    id v10 = v44;
  }
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  sectionHeaderViewModel = self->_sectionHeaderViewModel;
  if (!sectionHeaderViewModel)
  {
    id v4 = [MUPlaceSectionHeaderViewModel alloc];
    v5 = _MULocalizedStringFromThisBundle(@"In Your Guides [Placecard]");
    id v6 = [(MUPlaceSectionHeaderViewModel *)v4 initWithTitleString:v5];
    v7 = self->_sectionHeaderViewModel;
    self->_sectionHeaderViewModel = v6;

    sectionHeaderViewModel = self->_sectionHeaderViewModel;
  }
  return sectionHeaderViewModel;
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (BOOL)hasContent
{
  return [(NSDictionary *)self->_collectionViews count] != 0;
}

- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = [(NSDictionary *)self->_collectionViews allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v13 = [(NSDictionary *)self->_wrappedSectionViewsByIdentifier objectForKeyedSubscript:v12];

        if (v13 == v6)
        {
          [(MUPlaceSectionController *)self captureInfoCardAction:0 eventValue:0 feedbackType:0];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
          [WeakRetained collectionIdentifierSelected:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (BOOL)verticalCardContainerView:(id)a3 shouldHighlightRowAtIndex:(unint64_t)a4
{
  return 1;
}

- (int)analyticsModuleType
{
  return 29;
}

- (BOOL)isImpressionable
{
  return 0;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_wrappedSectionViewsByIdentifier, 0);
  objc_storeStrong((id *)&self->_collectionViews, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_viewProvider);
}

@end