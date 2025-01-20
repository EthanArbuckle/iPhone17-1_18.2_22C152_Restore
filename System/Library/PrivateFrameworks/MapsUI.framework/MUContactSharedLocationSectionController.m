@interface MUContactSharedLocationSectionController
- (BOOL)hasContent;
- (BOOL)isImpressionable;
- (MUContactSharedLocationSectionController)initWithPlaceItem:(id)a3 availability:(id)a4;
- (MUContactSharedLocationSectionControllerDelegate)contactSharedLocationSectionDelegate;
- (NSArray)sectionViews;
- (id)_loadPlaceInfoAddress:(id)a3 contact:(id)a4;
- (id)draggableContent;
- (id)mapItemCoordinateViewModel;
- (int)analyticsModuleType;
- (void)_buildSections;
- (void)setContactSharedLocationSectionDelegate:(id)a3;
@end

@implementation MUContactSharedLocationSectionController

- (MUContactSharedLocationSectionController)initWithPlaceItem:(id)a3 availability:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 mapItem];
  v20.receiver = self;
  v20.super_class = (Class)MUContactSharedLocationSectionController;
  v10 = [(MUPlaceSectionController *)&v20 initWithMapItem:v9];

  if (v10)
  {
    v11 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUContactSharedLocationSectionController", "", v19, 2u);
    }

    objc_storeStrong((id *)&v10->_placeItem, a3);
    objc_storeStrong((id *)&v10->_availability, a4);
    v12 = [(_MKPlaceItem *)v10->_placeItem contact];

    if (v12)
    {
      v13 = [MUContactsViewModelGenerator alloc];
      v14 = [(_MKPlaceItem *)v10->_placeItem contact];
      uint64_t v15 = [(MUContactsViewModelGenerator *)v13 initWithContact:v14];
      contactViewModelGenerator = v10->_contactViewModelGenerator;
      v10->_contactViewModelGenerator = (MUContactsViewModelGenerator *)v15;
    }
    [(MUContactSharedLocationSectionController *)v10 _buildSections];
    v17 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUContactSharedLocationSectionController", "", v19, 2u);
    }
  }
  return v10;
}

- (NSArray)sectionViews
{
  v2 = (void *)[(NSArray *)self->_sectionViews copy];
  return (NSArray *)v2;
}

- (BOOL)hasContent
{
  return [(NSArray *)self->_sectionViews count] != 0;
}

- (id)draggableContent
{
  v3 = [(NSArray *)self->_sectionViews firstObject];
  uint64_t v4 = MUIdiomInTraitEnvironment(v3);

  if (v4 == 5)
  {
    v5 = 0;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sectionStackViews = self->_sectionStackViews;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__MUContactSharedLocationSectionController_draggableContent__block_invoke;
    v10[3] = &unk_1E5750490;
    id v11 = v6;
    id v8 = v6;
    [(NSMutableArray *)sectionStackViews enumerateObjectsUsingBlock:v10];
    v5 = (void *)[v8 copy];
  }
  return v5;
}

uint64_t __60__MUContactSharedLocationSectionController_draggableContent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 draggableContent];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(a1 + 32) addObjectsFromArray:v3];
    uint64_t v4 = v6;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (BOOL)isImpressionable
{
  return 0;
}

- (int)analyticsModuleType
{
  return 0;
}

- (void)_buildSections
{
  uint64_t v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  sectionViews = self->_sectionViews;
  self->_sectionViews = v3;

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  sectionStackViews = self->_sectionStackViews;
  self->_sectionStackViews = v5;

  id v7 = [(_MKPlaceItem *)self->_placeItem contact];
  if (v7
    && MapsFeature_IsEnabled_MapsWally()
    && [(_MKPlaceItem *)self->_placeItem representsPerson])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9 = [v7 postalAddresses];
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    objc_super v20 = __58__MUContactSharedLocationSectionController__buildSections__block_invoke;
    v21 = &unk_1E57504B8;
    id v22 = v8;
    v23 = self;
    id v24 = v7;
    id v25 = v10;
    id v11 = v10;
    id v12 = v8;
    [v9 enumerateObjectsUsingBlock:&v18];
    v13 = -[MUContactsViewModelGenerator sectionViewsFromContentViews:headerLabels:](self->_contactViewModelGenerator, "sectionViewsFromContentViews:headerLabels:", v12, v11, v18, v19, v20, v21);
    v14 = (NSMutableArray *)[v12 copy];
    uint64_t v15 = self->_sectionStackViews;
    self->_sectionStackViews = v14;

    v16 = (NSArray *)[v13 copy];
    v17 = self->_sectionViews;
    self->_sectionViews = v16;
  }
}

void __58__MUContactSharedLocationSectionController__buildSections__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 identifier];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1B8F8], "_mapkit_sharedLocationContactIdentifer");
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) _loadPlaceInfoAddress:v10 contact:*(void *)(a1 + 48)];
    objc_msgSend(v6, "_mapsui_addObjectIfNotNil:", v7);

    id v8 = *(void **)(a1 + 56);
    v9 = [*(id *)(*(void *)(a1 + 40) + 104) headerLabelFromAddress:v10];
    [v8 addObject:v9];
  }
}

- (id)_loadPlaceInfoAddress:(id)a3 contact:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MUGetPlaceCardLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = [v6 identifier];
    *(_DWORD *)buf = 138412546;
    v32 = v9;
    __int16 v33 = 2112;
    id v34 = v7;
    _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_DEBUG, "Building section view for address: %@, contact: %@", buf, 0x16u);
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__MUContactSharedLocationSectionController__loadPlaceInfoAddress_contact___block_invoke;
  aBlock[3] = &unk_1E57504E0;
  id v11 = v10;
  id v30 = v11;
  id v12 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  v13 = [(MUContactsViewModelGenerator *)self->_contactViewModelGenerator viewModelForAddress:v6];
  objc_initWeak((id *)buf, self);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __74__MUContactSharedLocationSectionController__loadPlaceInfoAddress_contact___block_invoke_2;
  id v25 = &unk_1E5750508;
  objc_copyWeak(&v28, (id *)buf);
  id v14 = v6;
  id v26 = v14;
  id v15 = v7;
  id v27 = v15;
  v12[2](v12, v13, &v22);
  v16 = [(MUContactSharedLocationSectionController *)self mapItemCoordinateViewModel];
  v12[2](v12, v16, 0);

  v17 = [MUPlaceInfoSectionView alloc];
  uint64_t v18 = +[MUInfoCardStyle preferredVerticalCardConfiguration];
  uint64_t v19 = [(MUPlaceVerticalCardContainerView *)v17 initWithConfiguration:v18];

  [(MUPlaceInfoSectionView *)v19 setAccessibilityIdentifier:@"PlaceDetailsInfo"];
  objc_super v20 = (void *)[v11 copy];
  [(MUPlaceInfoSectionView *)v19 setViewModels:v20];

  [(NSMutableArray *)self->_sectionStackViews addObject:v19];
  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);

  return v19;
}

void __74__MUContactSharedLocationSectionController__loadPlaceInfoAddress_contact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    id v6 = a2;
    int v5 = (void *)[a3 copy];
    [v6 setActionBlock:v5];

    [*(id *)(a1 + 32) addObject:v6];
  }
}

void __74__MUContactSharedLocationSectionController__loadPlaceInfoAddress_contact___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MUPresentationOptions);
    uint64_t v3 = [WeakRetained contactSharedLocationSectionDelegate];
    [v3 contactSharedLocationSectionController:WeakRetained selectedDirectionsWithAddress:*(void *)(a1 + 32) forContact:*(void *)(a1 + 40) options:v2];
  }
}

- (id)mapItemCoordinateViewModel
{
  if ([(MUPlaceDataAvailability *)self->_availability supportsShowingCoordinates])
  {
    uint64_t v3 = [MUCoordinateViewModel alloc];
    uint64_t v4 = [(MUPlaceSectionController *)self mapItem];
    int v5 = [(MUCoordinateViewModel *)v3 initWithMapItem:v4 isUserLocation:[(_MKPlaceItem *)self->_placeItem options] & 1];

    id v6 = objc_alloc_init(MULabeledValueActionViewModel);
    id v7 = [(MUCoordinateViewModel *)v5 titleString];
    [(MULabeledValueActionViewModel *)v6 setTitleString:v7];

    id v8 = [(MUCoordinateViewModel *)v5 valueString];
    [(MULabeledValueActionViewModel *)v6 setValueString:v8];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (MUContactSharedLocationSectionControllerDelegate)contactSharedLocationSectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactSharedLocationSectionDelegate);
  return (MUContactSharedLocationSectionControllerDelegate *)WeakRetained;
}

- (void)setContactSharedLocationSectionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contactSharedLocationSectionDelegate);
  objc_storeStrong((id *)&self->_contactViewModelGenerator, 0);
  objc_storeStrong((id *)&self->_sectionViews, 0);
  objc_storeStrong((id *)&self->_sectionStackViews, 0);
  objc_storeStrong((id *)&self->_availability, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
}

@end