@interface MUAmenitiesSectionController
- (BOOL)isImpressionable;
- (MUAmenitiesSectionController)initWithMapItem:(id)a3 moduleConiguration:(id)a4;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (UIView)sectionView;
- (id)infoCardChildUnactionableUIElements;
- (int)analyticsModuleType;
- (void)_setupAmenitiyRows;
@end

@implementation MUAmenitiesSectionController

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  sectionHeaderViewModel = self->_sectionHeaderViewModel;
  if (!sectionHeaderViewModel)
  {
    v4 = [MUPlaceSectionHeaderViewModel alloc];
    v5 = _MULocalizedStringFromThisBundle(@"Good to Know [Placecard]");
    v6 = [(MUPlaceSectionHeaderViewModel *)v4 initWithTitleString:v5];
    v7 = self->_sectionHeaderViewModel;
    self->_sectionHeaderViewModel = v6;

    sectionHeaderViewModel = self->_sectionHeaderViewModel;
  }
  return sectionHeaderViewModel;
}

- (MUAmenitiesSectionController)initWithMapItem:(id)a3 moduleConiguration:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MUAmenitiesSectionController;
  v8 = [(MUPlaceSectionController *)&v13 initWithMapItem:a3];
  if (v8)
  {
    v9 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUAmenitiesSectionControllerInit", "", v12, 2u);
    }

    objc_storeStrong((id *)&v8->_moduleConfig, a4);
    [(MUAmenitiesSectionController *)v8 _setupAmenitiyRows];
    v10 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUAmenitiesSectionControllerInit", "", v12, 2u);
    }
  }
  return v8;
}

- (void)_setupAmenitiyRows
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(MUAmenityListSectionConfiguration);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = [(GEOBusinessInfoModuleConfiguration *)self->_moduleConfig factoidItemIndexes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v11 = [(MUPlaceSectionController *)self mapItem];
        v12 = [v11 _encyclopedicInfo];
        objc_super v13 = objc_msgSend(v12, "factoidAtIndex:", objc_msgSend(v10, "intValue"));

        if (v13) {
          [v4 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v7);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v14 = [(MUPlaceSectionController *)self mapItem];
  v15 = [v14 _amenities];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    v18 = 0;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v15);
        }
        v21 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        if ([v21 isApplePayAmenity])
        {
          id v22 = v21;

          v18 = v22;
        }
        else
        {
          [v4 addObject:v21];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  [(MUAmenityListSectionConfiguration *)v3 setNumberInlineAmenities:GEOConfigGetUInteger()];
  v23 = (void *)[v4 copy];
  [(MUAmenityListSectionConfiguration *)v3 setViewModels:v23];

  if (v18)
  {
    v24 = +[MUAmenityApplePayConfiguration configurationFromAmenityItem:v18];
    [(MUAmenityListSectionConfiguration *)v3 setApplePayConfiguration:v24];
  }
  v25 = [[MUAmenityListSectionView alloc] initWithAmenityListConfiguration:v3];
  [(MUStackView *)v25 setSpacing:8.0];
  int64_t v26 = +[MUInfoCardStyle containerStyle];
  double v27 = 16.0;
  if (v26 == 1) {
    double v27 = 0.0;
  }
  -[MUStackView setContentEdgeInsets:](v25, "setContentEdgeInsets:", v27, 16.0, v27, 16.0);
  v28 = [(MUAmenitiesSectionController *)self sectionHeaderViewModel];
  v29 = +[MUPlaceSectionView cardShadowSectionViewForContentView:v25 sectionHeaderViewModel:v28];
  sectionView = self->_sectionView;
  self->_sectionView = v29;

  [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (id)infoCardChildUnactionableUIElements
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 addObject:&unk_1EE404AA8];
  id v4 = [(MUPlaceSectionController *)self mapItem];
  if ([v4 hasAmenityType:21])
  {
    v5 = [(MUPlaceSectionController *)self mapItem];
    int v6 = [v5 valueForAmenityType:21];

    if (v6) {
      [v3 addObject:&unk_1EE404AC0];
    }
  }
  else
  {
  }
  uint64_t v7 = (void *)[v3 copy];

  return v7;
}

- (int)analyticsModuleType
{
  return 10;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_amenitySectionView, 0);
  objc_storeStrong((id *)&self->_moduleConfig, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end