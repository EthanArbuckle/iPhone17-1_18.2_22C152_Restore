@interface MUPlaceInfoSectionController
- (BOOL)_shouldShowRapEditButton;
- (BOOL)hasContent;
- (BOOL)isImpressionable;
- (GEOInlineRapEnablement)inlineRapEnablement;
- (MUPlaceHoursSectionViewConfiguration)hoursConfig;
- (MUPlaceInfoSectionController)initWithPlaceItem:(id)a3 configuration:(id)a4;
- (MUPlaceInfoSectionControllerDelegate)placeInfoDelegate;
- (MUPlaceSectionFooterViewModel)sectionFooterViewModel;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (MUUserInformationProvider)userInfoProvider;
- (NSArray)sectionViews;
- (id)_createAddressItem;
- (id)_loadHoursContentViewIfNeeded;
- (id)_loadPlaceInfoAddress:(id)a3 contact:(id)a4;
- (id)_loadPlaceInfoContentIfNeeded;
- (id)_loadRAPStatusViewIfNeeded;
- (id)_loadViewWithContactMetadata:(id)a3;
- (id)_rapEditPlaceDetailsMenu;
- (id)draggableContent;
- (id)labeledValuesForContactValues:(id)a3 type:(int64_t)a4;
- (int)_attributionStyle;
- (int)analyticsModuleType;
- (unint64_t)placeNumberOfReportsInReview;
- (void)_buildSections;
- (void)_handleFactoidTap:(id)a3 withReference:(id)a4;
- (void)_performActionItem:(id)a3 withOptions:(id)a4;
- (void)_populateRevealedAnalyticsModule:(id)a3;
- (void)_rapEditPlaceDetailsButtonTapped;
- (void)_refineMapItemForIdentifier:(id)a3 completion:(id)a4;
- (void)_tappedAddressItem;
- (void)_tappedContactOfType:(int64_t)a3 withLabeledValue:(id)a4;
- (void)_tappedMessageType;
- (void)_tappedViewRAPReport;
- (void)hoursSectionView:(id)a3 didExpand:(BOOL)a4 forConfiguration:(id)a5;
- (void)refreshContents;
- (void)setPlaceInfoDelegate:(id)a3;
- (void)setPlaceNumberOfReportsInReview:(unint64_t)a3;
- (void)setUserInfoProvider:(id)a3;
@end

@implementation MUPlaceInfoSectionController

- (MUPlaceInfoSectionController)initWithPlaceItem:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 mapItem];
  v15.receiver = self;
  v15.super_class = (Class)MUPlaceInfoSectionController;
  v10 = [(MUPlaceSectionController *)&v15 initWithMapItem:v9];

  if (v10)
  {
    v11 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceInfoSectionControllerInit", "", v14, 2u);
    }

    objc_storeStrong((id *)&v10->_configuration, a4);
    objc_storeStrong((id *)&v10->_placeItem, a3);
    [(MUPlaceInfoSectionController *)v10 _buildSections];
    v12 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceInfoSectionControllerInit", "", v14, 2u);
    }
  }
  return v10;
}

- (MUPlaceHoursSectionViewConfiguration)hoursConfig
{
  return [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration hoursConfiguration];
}

- (void)setPlaceNumberOfReportsInReview:(unint64_t)a3
{
  if (self->_placeNumberOfReportsInReview != a3)
  {
    self->_placeNumberOfReportsInReview = a3;
    self->_needsUpdate = 1;
  }
}

- (void)refreshContents
{
  if (self->_needsUpdate)
  {
    self->_needsUpdate = 0;
    [(MUPlaceInfoSectionController *)self _buildSections];
    id v3 = [(MUPlaceSectionController *)self delegate];
    [v3 placeSectionControllerDidUpdateContent:self];
  }
}

- (GEOInlineRapEnablement)inlineRapEnablement
{
  v2 = [(MUPlaceSectionController *)self mapItem];
  id v3 = [v2 _geoMapItem];
  v4 = [v3 _inlineRapEnablement];

  return (GEOInlineRapEnablement *)v4;
}

- (void)_buildSections
{
  id v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
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
    id v8 = [[MUContactsViewModelGenerator alloc] initWithContact:v7];
    contactsViewModelGenerator = self->_contactsViewModelGenerator;
    self->_contactsViewModelGenerator = v8;

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v11 = [v7 postalAddresses];
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __46__MUPlaceInfoSectionController__buildSections__block_invoke;
    v35[3] = &unk_1E57504B8;
    id v36 = v10;
    v37 = self;
    id v13 = v7;
    id v38 = v13;
    id v39 = v12;
    id v14 = v12;
    id v15 = v10;
    [v11 enumerateObjectsUsingBlock:v35];
    v16 = [(MUPlaceInfoSectionController *)self _loadViewWithContactMetadata:v13];
    objc_msgSend(v15, "_mapsui_addObjectIfNotNil:", v16);

    v17 = _MULocalizedStringFromThisBundle(@"Details [Placecard]");
    [v14 addObject:v17];

    v18 = [(MUContactsViewModelGenerator *)self->_contactsViewModelGenerator sectionViewsFromContentViews:v15 headerLabels:v14];
    v19 = (NSMutableArray *)[v15 copy];
    v20 = self->_sectionStackViews;
    self->_sectionStackViews = v19;

    v21 = (NSArray *)[v18 copy];
    v22 = self->_sectionViews;
    self->_sectionViews = v21;
  }
  else
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v24 = [(MUPlaceInfoSectionController *)self _loadRAPStatusViewIfNeeded];
    objc_msgSend(v23, "_mapsui_addObjectIfNotNil:", v24);

    v25 = [(MUPlaceInfoSectionController *)self _loadHoursContentViewIfNeeded];
    objc_msgSend(v23, "_mapsui_addObjectIfNotNil:", v25);

    v11 = [(MUPlaceInfoSectionController *)self _loadPlaceInfoContentIfNeeded];
    [(NSMutableArray *)self->_sectionStackViews _mapsui_addObjectIfNotNil:v11];
    objc_msgSend(v23, "_mapsui_addObjectIfNotNil:", v11);
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __46__MUPlaceInfoSectionController__buildSections__block_invoke_2;
    v32 = &unk_1E5750DE0;
    v33 = self;
    id v34 = v23;
    id v15 = v23;
    v26 = MUMap(v15, &v29);
    v27 = (NSArray *)objc_msgSend(v26, "copy", v29, v30, v31, v32, v33);
    v28 = self->_sectionViews;
    self->_sectionViews = v27;
  }
}

void __46__MUPlaceInfoSectionController__buildSections__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 identifier];
  v4 = objc_msgSend(MEMORY[0x1E4F1B8F8], "_mapkit_sharedLocationContactIdentifer");
  char v5 = [v3 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) _loadPlaceInfoAddress:v10 contact:*(void *)(a1 + 48)];
    objc_msgSend(v6, "_mapsui_addObjectIfNotNil:", v7);

    id v8 = *(void **)(a1 + 56);
    v9 = [*(id *)(*(void *)(a1 + 40) + 88) headerLabelFromAddress:v10];
    [v8 addObject:v9];
  }
}

id __46__MUPlaceInfoSectionController__buildSections__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 80) isDeveloperPlaceCard])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) firstObject];
    BOOL v4 = v5 == v3;
  }
  id v6 = [*(id *)(a1 + 40) lastObject];

  id v7 = *(void **)(a1 + 32);
  id v8 = (id)v7[14];
  if (v4)
  {
    v9 = [v7 sectionHeaderViewModel];
  }
  else
  {
    v9 = 0;
  }
  if (v6 != v3)
  {
    id v10 = +[MUPlaceSectionView cardShadowSectionViewForContentView:v3 sectionHeaderViewModel:v9 sectionFooterViewModel:0 alwaysInsetContentView:v8 == v3];
    if (!v4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  BOOL v14 = v8 == v3;
  id v15 = [*(id *)(a1 + 32) sectionFooterViewModel];
  id v10 = +[MUPlaceSectionView cardShadowSectionViewForContentView:v3 sectionHeaderViewModel:v9 sectionFooterViewModel:v15 alwaysInsetContentView:v14];

  if (v4) {
LABEL_9:
  }

LABEL_10:
  v11 = [v3 accessibilityIdentifier];
  v12 = [v11 stringByAppendingString:@"Section"];

  [v10 setAccessibilityIdentifier:v12];
  if (v4) {
    [v10 setHeaderAXIdentifierWithBaseString:@"PlaceDetailsSection"];
  }

  return v10;
}

- (id)_loadHoursContentViewIfNeeded
{
  hoursContentView = self->_hoursContentView;
  if (hoursContentView)
  {
    id v3 = hoursContentView;
    goto LABEL_11;
  }
  id v5 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration hoursConfiguration];

  if (!v5)
  {
    v9 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration availability];
    if ([v9 supportsInlineReportAnIssue])
    {
      id v10 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration availability];
      if (![v10 supportsHours])
      {
        uint64_t v14 = [(MUPlaceInfoSectionController *)self inlineRapEnablement];
        if (v14)
        {
          id v15 = (void *)v14;
          v16 = [(MUPlaceInfoSectionController *)self inlineRapEnablement];
          int v17 = [v16 isHoursEditable];

          if (!v17) {
            goto LABEL_9;
          }
        }
        else
        {
        }
        v18 = [[MUAddMissingDataLabeledValue alloc] initWithType:4];
        [(MUAddMissingDataLabeledValue *)v18 setActionVariant:1];
        objc_initWeak(&location, self);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __61__MUPlaceInfoSectionController__loadHoursContentViewIfNeeded__block_invoke;
        v21[3] = &unk_1E5750E08;
        objc_copyWeak(v22, &location);
        v22[1] = (id)4;
        [(MUAddMissingDataLabeledValue *)v18 setActionBlock:v21];
        v19 = [MUPlaceInfoSectionView alloc];
        id v8 = -[MUPlaceInfoSectionView initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v20 = [MEMORY[0x1E4F1C978] arrayWithObject:v18];
        [(UIView *)v8 setViewModels:v20];

        [(UIView *)v8 setAccessibilityIdentifier:@"PlaceDetailsAddHours"];
        objc_destroyWeak(v22);
        objc_destroyWeak(&location);

        goto LABEL_10;
      }
    }
LABEL_9:
    id v8 = 0;
    goto LABEL_10;
  }
  id v6 = [MUPlaceHoursSectionView alloc];
  id v7 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration hoursConfiguration];
  id v8 = [(MUPlaceHoursSectionView *)v6 initWithSectionViewConfiguration:v7];

  [(UIView *)v8 setExpandDelegate:self];
  [(UIView *)v8 setAccessibilityIdentifier:@"PlaceDetailsHours"];
LABEL_10:
  v11 = self->_hoursContentView;
  self->_hoursContentView = v8;
  v12 = v8;

  id v3 = self->_hoursContentView;
LABEL_11:
  return v3;
}

void __61__MUPlaceInfoSectionController__loadHoursContentViewIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained placeInfoDelegate];
    [v3 placeInfoSectionController:v4 didSelectAddMissingDataOfType:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

- (id)_loadPlaceInfoContentIfNeeded
{
  location[2] = *(id *)MEMORY[0x1E4F143B8];
  placeInfoSectionView = self->_placeInfoSectionView;
  if (placeInfoSectionView)
  {
    id v3 = placeInfoSectionView;
    goto LABEL_47;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__MUPlaceInfoSectionController__loadPlaceInfoContentIfNeeded__block_invoke;
  aBlock[3] = &unk_1E57504E0;
  id v52 = v5;
  id v68 = v52;
  v54 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  id v6 = [(_MKPlaceItem *)self->_placeItem contact];
  if (!v6)
  {
    id v7 = [(MUPlaceSectionController *)self mapItem];
    uint64_t v8 = [v7 _placeCardContact];

    id v6 = (void *)v8;
  }
  v51 = v6;
  v9 = [v6 emailAddresses];
  id v10 = [(MUPlaceInfoSectionController *)self labeledValuesForContactValues:v9 type:2];
  [v52 addObjectsFromArray:v10];

  v11 = [v51 phoneNumbers];
  v12 = [(MUPlaceInfoSectionController *)self labeledValuesForContactValues:v11 type:1];
  [v52 addObjectsFromArray:v12];

  id v13 = [v51 urlAddresses];
  uint64_t v14 = [(MUPlaceInfoSectionController *)self labeledValuesForContactValues:v13 type:3];
  [v52 addObjectsFromArray:v14];

  if (![(MUPlaceInfoSectionControllerConfiguration *)self->_configuration isDeveloperPlaceCard])
  {
    id v15 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration availability];
    int v16 = [v15 supportsMessagesForBusiness];

    if (v16)
    {
      int v17 = [(MUPlaceSectionController *)self mapItem];
      v18 = +[MULabeledValueActionViewModel messageItemWithMapItem:v17];

      objc_initWeak(location, self);
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __61__MUPlaceInfoSectionController__loadPlaceInfoContentIfNeeded__block_invoke_2;
      v65[3] = &unk_1E574FC68;
      objc_copyWeak(&v66, location);
      v54[2](v54, v18, v65);
      objc_destroyWeak(&v66);
      objc_destroyWeak(location);
    }
  }
  if ([(MUPlaceInfoSectionControllerConfiguration *)self->_configuration isDeveloperPlaceCard])
  {
    v19 = 0;
  }
  else
  {
    v20 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration moduleConfiguration];
    v19 = [v20 factoidReferences];
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v19;
  uint64_t v21 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v62 != v22) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        v25 = [(_MKPlaceItem *)self->_placeItem mapItem];
        v26 = [v25 _geoMapItem];
        v27 = [v26 _encyclopedicInfo];
        v28 = objc_msgSend(v27, "factoidAtIndex:", objc_msgSend(v24, "indexInFactoidComponent"));

        if (v28)
        {
          uint64_t v29 = objc_alloc_init(MULabeledValueActionViewModel);
          uint64_t v30 = [v28 title];
          [(MULabeledValueActionViewModel *)v29 setTitleString:v30];

          v31 = [v28 unstructuredValue];
          [(MULabeledValueActionViewModel *)v29 setValueString:v31];

          int v32 = [v24 linkStyle];
          switch(v32)
          {
            case 2:
              [(MULabeledValueActionViewModel *)v29 setActionVariant:1];
              break;
            case 1:
              [(MULabeledValueActionViewModel *)v29 setActionVariant:0];
              if (MapKitIdiomIsMacCatalyst()) {
                v35 = @"arrow.triangle.turn.up.right.circle";
              }
              else {
                v35 = @"arrow.triangle.turn.up.right.circle.fill";
              }
LABEL_24:
              [(MULabeledValueActionViewModel *)v29 setSymbolName:v35];
              break;
            case 0:
              v33 = [v28 placeIdentifier];
              BOOL v34 = v33 == 0;

              if (!v34)
              {
                [(MULabeledValueActionViewModel *)v29 setActionVariant:0];
                if (MapKitIdiomIsMacCatalyst()) {
                  v35 = @"arrow.triangle.turn.up.right.circle";
                }
                else {
                  v35 = @"arrow.triangle.turn.up.right.circle.fill";
                }
                goto LABEL_24;
              }
              break;
          }
          if ([v28 shouldUseStructuredData])
          {
            v37 = +[MUFactoidViewModel viewModelForFactoid:v28];
            id v38 = [v37 valueString];
            [(MULabeledValueActionViewModel *)v29 setAlternativeTitleString:v38];

            [(MULabeledValueActionViewModel *)v29 setEmphasizeValueString:1];
          }
          objc_initWeak(location, self);
          v57[0] = MEMORY[0x1E4F143A8];
          v57[1] = 3221225472;
          v57[2] = __61__MUPlaceInfoSectionController__loadPlaceInfoContentIfNeeded__block_invoke_81;
          v57[3] = &unk_1E5750508;
          objc_copyWeak(&v60, location);
          id v58 = v28;
          v59 = v24;
          v54[2](v54, v29, v57);

          objc_destroyWeak(&v60);
          objc_destroyWeak(location);
          goto LABEL_34;
        }
        MUGetPlaceCardLog();
        uint64_t v29 = (MULabeledValueActionViewModel *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v29->super, OS_LOG_TYPE_FAULT))
        {
          int v36 = [v24 indexInFactoidComponent];
          LODWORD(location[0]) = 67109120;
          HIDWORD(location[0]) = v36;
          _os_log_impl(&dword_1931EA000, &v29->super, OS_LOG_TYPE_FAULT, "Could not get factoid at index %d", (uint8_t *)location, 8u);
        }
LABEL_34:
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v21);
  }

  objc_initWeak(location, self);
  id v39 = [(MUPlaceInfoSectionController *)self _createAddressItem];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __61__MUPlaceInfoSectionController__loadPlaceInfoContentIfNeeded__block_invoke_2_82;
  v55[3] = &unk_1E574FC68;
  objc_copyWeak(&v56, location);
  v54[2](v54, v39, v55);

  v40 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration availability];
  int v41 = [v40 supportsShowingCoordinates];

  if (v41)
  {
    v42 = [MUCoordinateViewModel alloc];
    v43 = [(MUPlaceSectionController *)self mapItem];
    v44 = [(MUCoordinateViewModel *)v42 initWithMapItem:v43 isUserLocation:[(_MKPlaceItem *)self->_placeItem options] & 1];

    v45 = objc_alloc_init(MULabeledValueActionViewModel);
    v46 = [(MUCoordinateViewModel *)v44 titleString];
    [(MULabeledValueActionViewModel *)v45 setTitleString:v46];

    v47 = [(MUCoordinateViewModel *)v44 valueString];
    [(MULabeledValueActionViewModel *)v45 setValueString:v47];

    v54[2](v54, v45, 0);
  }
  if ([v52 count])
  {
    if ([(MUPlaceInfoSectionControllerConfiguration *)self->_configuration isDeveloperPlaceCard]) {
      +[MUPlaceVerticalCardConfiguration developerPlaceCardConfiguration];
    }
    else {
    v48 = +[MUInfoCardStyle preferredVerticalCardConfiguration];
    }
    id v3 = [(MUPlaceVerticalCardContainerView *)[MUPlaceInfoSectionView alloc] initWithConfiguration:v48];
    [(MUPlaceInfoSectionView *)v3 setAccessibilityIdentifier:@"PlaceDetailsInfo"];
    v49 = (void *)[v52 copy];
    [(MUPlaceInfoSectionView *)v3 setViewModels:v49];

    if ([(MUPlaceInfoSectionControllerConfiguration *)self->_configuration isDeveloperPlaceCard]) {
      -[MUStackView setContentEdgeInsets:](v3, "setContentEdgeInsets:", 8.0, 0.0, 8.0, 0.0);
    }
  }
  else
  {
    id v3 = 0;
  }
  objc_destroyWeak(&v56);
  objc_destroyWeak(location);

LABEL_47:
  return v3;
}

void __61__MUPlaceInfoSectionController__loadPlaceInfoContentIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    id v6 = a2;
    id v5 = (void *)[a3 copy];
    [v6 setActionBlock:v5];

    [*(id *)(a1 + 32) addObject:v6];
  }
}

void __61__MUPlaceInfoSectionController__loadPlaceInfoContentIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _tappedMessageType];
    id WeakRetained = v2;
  }
}

void __61__MUPlaceInfoSectionController__loadPlaceInfoContentIfNeeded__block_invoke_81(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _handleFactoidTap:*(void *)(a1 + 32) withReference:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

void __61__MUPlaceInfoSectionController__loadPlaceInfoContentIfNeeded__block_invoke_2_82(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _tappedAddressItem];
    id WeakRetained = v2;
  }
}

- (id)_loadPlaceInfoAddress:(id)a3 contact:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MUGetPlaceCardLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = [v6 identifier];
    *(_DWORD *)buf = 138412546;
    v31 = v9;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_DEBUG, "Building section view for address: %@, contact: %@", buf, 0x16u);
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__MUPlaceInfoSectionController__loadPlaceInfoAddress_contact___block_invoke;
  aBlock[3] = &unk_1E57504E0;
  id v11 = v10;
  id v29 = v11;
  v12 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  id v13 = [(MUContactsViewModelGenerator *)self->_contactsViewModelGenerator viewModelForAddress:v6];
  objc_initWeak((id *)buf, self);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __62__MUPlaceInfoSectionController__loadPlaceInfoAddress_contact___block_invoke_2;
  v24 = &unk_1E5750508;
  objc_copyWeak(&v27, (id *)buf);
  id v14 = v6;
  id v25 = v14;
  id v15 = v7;
  id v26 = v15;
  v12[2](v12, v13, &v21);
  int v16 = [MUPlaceInfoSectionView alloc];
  int v17 = +[MUInfoCardStyle preferredVerticalCardConfiguration];
  v18 = [(MUPlaceVerticalCardContainerView *)v16 initWithConfiguration:v17];

  [(MUPlaceInfoSectionView *)v18 setAccessibilityIdentifier:@"PlaceDetailsInfo"];
  v19 = (void *)[v11 copy];
  [(MUPlaceInfoSectionView *)v18 setViewModels:v19];

  [(NSMutableArray *)self->_sectionStackViews addObject:v18];
  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);

  return v18;
}

void __62__MUPlaceInfoSectionController__loadPlaceInfoAddress_contact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    id v6 = a2;
    id v5 = (void *)[a3 copy];
    [v6 setActionBlock:v5];

    [*(id *)(a1 + 32) addObject:v6];
  }
}

void __62__MUPlaceInfoSectionController__loadPlaceInfoAddress_contact___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(MUPresentationOptions);
    id v3 = [WeakRetained placeInfoDelegate];
    [v3 placeInfoSectionController:WeakRetained selectedDirectionsWithAddress:*(void *)(a1 + 32) forContact:*(void *)(a1 + 40) options:v2];
  }
}

- (id)_loadViewWithContactMetadata:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [v5 emailAddresses];
  uint64_t v8 = [(MUPlaceInfoSectionController *)self labeledValuesForContactValues:v7 type:2];
  [v6 addObjectsFromArray:v8];

  v9 = [v5 phoneNumbers];
  id v10 = [(MUPlaceInfoSectionController *)self labeledValuesForContactValues:v9 type:1];
  [v6 addObjectsFromArray:v10];

  id v11 = [v5 urlAddresses];

  v12 = [(MUPlaceInfoSectionController *)self labeledValuesForContactValues:v11 type:3];
  [v6 addObjectsFromArray:v12];

  id v13 = [MUPlaceInfoSectionView alloc];
  id v14 = +[MUInfoCardStyle preferredVerticalCardConfiguration];
  id v15 = [(MUPlaceVerticalCardContainerView *)v13 initWithConfiguration:v14];

  [(MUPlaceInfoSectionView *)v15 setAccessibilityIdentifier:@"PlaceDetailsInfo"];
  int v16 = (void *)[v6 copy];
  [(MUPlaceInfoSectionView *)v15 setViewModels:v16];

  return v15;
}

- (id)_loadRAPStatusViewIfNeeded
{
  id v3 = [(MUPlaceInfoSectionController *)self placeNumberOfReportsInReview];
  if (v3)
  {
    id v4 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration availability];
    if ([(MUDisclosureActionViewModel *)v4 supportsReportsInReview])
    {
      unint64_t v5 = [(MUPlaceInfoSectionController *)self placeNumberOfReportsInReview];

      if (!v5)
      {
LABEL_11:
        id v3 = self->_rapStatusContentView;
        goto LABEL_12;
      }
      id v4 = objc_alloc_init(MUDisclosureActionViewModel);
      id v6 = [MEMORY[0x1E4F64500] sharedConfiguration];
      id v7 = [v6 countryCode];
      int v8 = [v7 isEqualToString:@"CN"];

      if (v8) {
        v9 = @"Number of reports [Placecard]";
      }
      else {
        v9 = @"Number of reports in review [Placecard]";
      }
      id v10 = _MULocalizedStringFromThisBundle(v9);
      id v11 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v10, @"%lu", 0, -[MUPlaceInfoSectionController placeNumberOfReportsInReview](self, "placeNumberOfReportsInReview"));
      [(MUDisclosureActionViewModel *)v4 setTitleString:v11];
      v12 = [(MUPlaceInfoSectionController *)self userInfoProvider];
      id v13 = [v12 userIcon];
      [(MUDisclosureActionViewModel *)v4 setImage:v13];

      objc_initWeak(&location, self);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __58__MUPlaceInfoSectionController__loadRAPStatusViewIfNeeded__block_invoke;
      v18[3] = &unk_1E574FC68;
      objc_copyWeak(&v19, &location);
      [(MUDisclosureActionViewModel *)v4 setActionBlock:v18];
      rapStatusContentView = self->_rapStatusContentView;
      if (!rapStatusContentView)
      {
        id v15 = objc_alloc_init(MUDisclosureActionRowView);
        [(MKViewWithHairline *)v15 setBottomHairlineHidden:1];
        [(MUDisclosureActionRowView *)v15 setViewModel:v4];
        [(MUDisclosureActionRowView *)v15 setAccessibilityIdentifier:@"PlaceDetailsReportInReview"];
        int v16 = self->_rapStatusContentView;
        self->_rapStatusContentView = v15;

        rapStatusContentView = self->_rapStatusContentView;
      }
      [(MUDisclosureActionRowView *)rapStatusContentView setViewModel:v4];
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    goto LABEL_11;
  }
LABEL_12:
  return v3;
}

void __58__MUPlaceInfoSectionController__loadRAPStatusViewIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _tappedViewRAPReport];
    id WeakRetained = v2;
  }
}

- (NSArray)sectionViews
{
  id v2 = (void *)[(NSArray *)self->_sectionViews copy];
  return (NSArray *)v2;
}

- (id)_createAddressItem
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(MUPlaceSectionController *)self mapItem];
  id v4 = [v3 _addressFormattedAsLocation];

  uint64_t v5 = [v4 length];
  BOOL v6 = v5 != 0;
  if (v5)
  {
    id v7 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v21 = 138412290;
      uint64_t v22 = (uint64_t)v4;
      _os_log_impl(&dword_1931EA000, v7, OS_LOG_TYPE_DEBUG, "We have a location formatted string %@", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    int v8 = [(MUPlaceSectionController *)self mapItem];
    uint64_t v9 = [v8 _addressFormattedAsMultilineAddress];

    id v7 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v21 = 138412290;
      uint64_t v22 = v9;
      _os_log_impl(&dword_1931EA000, v7, OS_LOG_TYPE_DEBUG, "We have a multiline address string %@", (uint8_t *)&v21, 0xCu);
    }
    id v4 = (void *)v9;
  }

  id v10 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration moduleConfiguration];

  if (v10)
  {
    id v11 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration moduleConfiguration];
    int v12 = [v11 locationStyle];

    if (v12 == 2)
    {
      id v13 = MUGetPlaceCardLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_DEBUG, "Asking to suppress address with GEOLocationInfoStyleSuppress", (uint8_t *)&v21, 2u);
      }

      goto LABEL_19;
    }
    BOOL v6 = v12 == 1;
  }
  if (![v4 length])
  {
LABEL_19:
    id v14 = 0;
    goto LABEL_20;
  }
  id v14 = objc_alloc_init(MULabeledValueActionViewModel);
  if (v6) {
    id v15 = @"Location [Placecard]";
  }
  else {
    id v15 = @"Address [Placecard]";
  }
  int v16 = _MULocalizedStringFromThisBundle(v15);
  [(MULabeledValueActionViewModel *)v14 setTitleString:v16];

  [(MULabeledValueActionViewModel *)v14 setValueString:v4];
  [(MULabeledValueActionViewModel *)v14 setAnalyticsTarget:1502];
  int v17 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration availability];
  int v18 = [v17 showEditAddressForHome];

  if (v18)
  {
    [(MULabeledValueActionViewModel *)v14 setSymbolName:@"pencil"];
  }
  else if (!v6 {
         && ![(MUPlaceInfoSectionControllerConfiguration *)self->_configuration isDeveloperPlaceCard])
  }
  {
    v20 = +[MUContactsViewModelGenerator symbolImageForAddressItem];
    [(MULabeledValueActionViewModel *)v14 setSymbolName:v20];
  }
LABEL_20:

  return v14;
}

- (void)_handleFactoidTap:(id)a3 withReference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F30F10]);
  uint64_t v9 = [v6 placeIdentifier];
  id v10 = (void *)[v8 initWithGEOMapItemIdentifier:v9];

  if (v10)
  {
    id v11 = objc_alloc_init(MUPresentationOptions);
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__MUPlaceInfoSectionController__handleFactoidTap_withReference___block_invoke;
    v13[3] = &unk_1E5750E30;
    objc_copyWeak(&v16, &location);
    id v14 = v7;
    int v12 = v11;
    id v15 = v12;
    [(MUPlaceInfoSectionController *)self _refineMapItemForIdentifier:v10 completion:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __64__MUPlaceInfoSectionController__handleFactoidTap_withReference___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    int v4 = [*(id *)(a1 + 32) linkStyle];
    if (v4 == 2)
    {
      uint64_t v5 = [WeakRetained placeInfoDelegate];
      [v5 placeInfoSectionController:WeakRetained selectedViewPlaceWithMapItem:v6 options:*(void *)(a1 + 40)];
    }
    else
    {
      if (v4 != 1) {
        goto LABEL_7;
      }
      uint64_t v5 = [WeakRetained placeInfoDelegate];
      [v5 placeInfoSectionController:WeakRetained selectedDirectionsWithMapItem:v6 options:*(void *)(a1 + 40)];
    }
  }
LABEL_7:
}

- (void)_refineMapItemForIdentifier:(id)a3 completion:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F30F28];
  id v7 = a3;
  id v8 = [v6 sharedService];
  v14[0] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v10 = [v8 ticketForIdentifiers:v9 traits:0];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__MUPlaceInfoSectionController__refineMapItemForIdentifier_completion___block_invoke;
  v12[3] = &unk_1E574EDC0;
  id v13 = v5;
  id v11 = v5;
  [v10 submitWithHandler:v12 networkActivity:0];
}

void __71__MUPlaceInfoSectionController__refineMapItemForIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = [v8 count];
  if (!a3 && v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v8 firstObject];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  BOOL v3 = [(MUPlaceInfoSectionController *)self _shouldShowRapEditButton];
  int v4 = [MUPlaceSectionHeaderViewModel alloc];
  uint64_t v5 = _MULocalizedStringFromThisBundle(@"Details [Placecard]");
  uint64_t v6 = [(MUPlaceSectionHeaderViewModel *)v4 initWithTitleString:v5 showSeeMore:v3];

  id v7 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration availability];
  int v8 = [v7 supportsInlineReportAnIssue];

  if (v8) {
    BOOL v9 = !v3;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    id v10 = _MULocalizedStringFromThisBundle(@"Edit [Placecard RAP]");
    [(MUPlaceSectionHeaderViewModel *)v6 setSeeMoreButtonText:v10];

    id v11 = [(MUPlaceInfoSectionController *)self _rapEditPlaceDetailsMenu];
    [(MUPlaceSectionHeaderViewModel *)v6 setSeeMoreButtonMenu:v11];

    [(MUPlaceSectionHeaderViewModel *)v6 setTarget:self selector:sel__rapEditPlaceDetailsButtonTapped];
  }
  return v6;
}

- (MUPlaceSectionFooterViewModel)sectionFooterViewModel
{
  v25[1] = *MEMORY[0x1E4F143B8];
  sectionFooterViewModel = self->_sectionFooterViewModel;
  if (sectionFooterViewModel)
  {
    BOOL v3 = sectionFooterViewModel;
  }
  else
  {
    int v5 = [(MUPlaceInfoSectionController *)self _attributionStyle];
    if (v5 == 1)
    {
      id v13 = _MULocalizedStringFromThisBundle(@"Developed in partnership with %@");
      id v14 = [(MUPlaceSectionController *)self mapItem];
      id v15 = [v14 name];

      id v16 = [MUPlaceFooterAtributionViewModel alloc];
      v25[0] = v15;
      int v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      int v18 = [(MUPlaceFooterAtributionViewModel *)v16 initWithFormatString:v13 providerNames:v17 isInteractable:0];
      id v19 = self->_sectionFooterViewModel;
      self->_sectionFooterViewModel = v18;
    }
    else if (!v5)
    {
      if (!-[MUPlaceInfoSectionControllerConfiguration isDeveloperPlaceCard](self->_configuration, "isDeveloperPlaceCard")|| (-[MUPlaceSectionController mapItem](self, "mapItem"), v6 = objc_claimAutoreleasedReturnValue(), [v6 _attribution], id v7 = objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "requiresAttributionInDeveloperPlaceCard"), v7, v6, v8))
      {
        BOOL v9 = [(MUPlaceSectionController *)self mapItem];
        id v10 = [v9 _attribution];
        id v11 = +[MUPlaceFooterAtributionViewModel viewModelForMapItemAttribution:v10];
        int v12 = self->_sectionFooterViewModel;
        self->_sectionFooterViewModel = v11;
      }
    }
    objc_initWeak(&location, self);
    v20 = self->_sectionFooterViewModel;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    id v22[2] = __54__MUPlaceInfoSectionController_sectionFooterViewModel__block_invoke;
    v22[3] = &unk_1E574F3A8;
    objc_copyWeak(&v23, &location);
    [(MUPlaceSectionFooterViewModel *)v20 setActionBlock:v22];
    BOOL v3 = self->_sectionFooterViewModel;
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __54__MUPlaceInfoSectionController_sectionFooterViewModel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v2 = [WeakRetained placeInfoDelegate];
    BOOL v3 = [v5 mapItem];
    int v4 = [v3 _attribution];
    [v2 placeInfoSectionController:v5 didTapAttribution:v4];

    id WeakRetained = v5;
  }
}

- (int)_attributionStyle
{
  BOOL v3 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration moduleConfiguration];

  if (!v3) {
    return 0;
  }
  int v4 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration moduleConfiguration];
  int v5 = [v4 attributionStyle];

  return v5;
}

- (id)labeledValuesForContactValues:(id)a3 type:(int64_t)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  val = self;
  uint64_t v6 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration availability];
  if (![v6 supportsInlineReportAnIssue])
  {

    goto LABEL_12;
  }
  uint64_t v7 = [v21 count];

  if (v7)
  {
LABEL_12:
    int v12 = (MUAddMissingDataLabeledValue *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v21;
    uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          int v17 = [[MUContactLabeledValue alloc] initWithContactLabeledValue:v16 type:a4];
          [(MUContactLabeledValue *)v17 setActionVariant:1];
          objc_initWeak(&location, val);
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __67__MUPlaceInfoSectionController_labeledValuesForContactValues_type___block_invoke_2;
          v24[3] = &unk_1E5750E58;
          objc_copyWeak(v25, &location);
          v25[1] = (id)a4;
          v24[4] = v16;
          [(MUContactLabeledValue *)v17 setActionBlock:v24];
          [(MUAddMissingDataLabeledValue *)v12 addObject:v17];
          objc_destroyWeak(v25);
          objc_destroyWeak(&location);
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
      }
      while (v13);
    }

    int v18 = (void *)[(MUAddMissingDataLabeledValue *)v12 copy];
    goto LABEL_20;
  }
  if (a4 == 3) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 2 * (a4 == 1);
  }
  BOOL v9 = [(MUPlaceInfoSectionController *)val inlineRapEnablement];

  if (!v9)
  {
    if (v8) {
      goto LABEL_28;
    }
    goto LABEL_12;
  }
  if (!v8) {
    goto LABEL_12;
  }
  if (v8 != 3)
  {
    if (v8 == 2)
    {
      id v10 = [(MUPlaceInfoSectionController *)val inlineRapEnablement];
      char v11 = [v10 isPhoneEditable];
      goto LABEL_27;
    }
LABEL_28:
    int v12 = [[MUAddMissingDataLabeledValue alloc] initWithType:v8];
    [(MUAddMissingDataLabeledValue *)v12 setActionVariant:1];
    objc_initWeak(&location, val);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __67__MUPlaceInfoSectionController_labeledValuesForContactValues_type___block_invoke;
    v30[3] = &unk_1E5750E08;
    objc_copyWeak(v31, &location);
    v31[1] = (id)v8;
    [(MUAddMissingDataLabeledValue *)v12 setActionBlock:v30];
    v34[0] = v12;
    int v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    objc_destroyWeak(v31);
    objc_destroyWeak(&location);
LABEL_20:

    goto LABEL_21;
  }
  id v10 = [(MUPlaceInfoSectionController *)val inlineRapEnablement];
  char v11 = [v10 isWebsiteEditable];
LABEL_27:
  char v20 = v11;

  if (v20) {
    goto LABEL_28;
  }
  int v18 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_21:

  return v18;
}

void __67__MUPlaceInfoSectionController_labeledValuesForContactValues_type___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    BOOL v3 = [WeakRetained placeInfoDelegate];
    [v3 placeInfoSectionController:v4 didSelectAddMissingDataOfType:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

void __67__MUPlaceInfoSectionController_labeledValuesForContactValues_type___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _tappedContactOfType:*(void *)(a1 + 48) withLabeledValue:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_tappedContactOfType:(int64_t)a3 withLabeledValue:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ((unint64_t)(a3 - 1) > 2) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = qword_19335B918[a3 - 1];
  }
  uint64_t v8 = [MEMORY[0x1E4F30F98] actionItemWithType:v7];
  if (v6)
  {
    uint64_t v10 = *MEMORY[0x1E4F30DB0];
    v11[0] = v6;
    BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    BOOL v9 = 0;
  }
  [(MUPlaceInfoSectionController *)self _performActionItem:v8 withOptions:v9];
}

- (void)_tappedMessageType
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F30F98] actionItemWithType:11];
  uint64_t v6 = *MEMORY[0x1E4F30DC0];
  id v4 = [(MUPlaceSectionController *)self analyticsModule];
  v7[0] = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  [(MUPlaceInfoSectionController *)self _performActionItem:v3 withOptions:v5];
}

- (void)_tappedAddressItem
{
  id v3 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration availability];
  int v4 = [v3 showEditAddressForHome];

  if (v4) {
    uint64_t v5 = 25;
  }
  else {
    uint64_t v5 = 30;
  }
  id v6 = [MEMORY[0x1E4F30F98] actionItemWithType:v5];
  [(MUPlaceInfoSectionController *)self _performActionItem:v6 withOptions:0];
}

- (void)_tappedViewRAPReport
{
  id v3 = [MEMORY[0x1E4F30F98] actionItemWithType:3];
  [(MUPlaceInfoSectionController *)self _performActionItem:v3 withOptions:0];
}

- (BOOL)_shouldShowRapEditButton
{
  id v3 = [(MUPlaceInfoSectionController *)self inlineRapEnablement];
  if (v3)
  {
    int v4 = [(MUPlaceInfoSectionController *)self inlineRapEnablement];
    if ([v4 isHoursEditable])
    {
      char v5 = 1;
    }
    else
    {
      id v6 = [(MUPlaceInfoSectionController *)self inlineRapEnablement];
      if ([v6 isPhoneEditable])
      {
        char v5 = 1;
      }
      else
      {
        uint64_t v7 = [(MUPlaceInfoSectionController *)self inlineRapEnablement];
        char v5 = [v7 isWebsiteEditable];
      }
    }
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (id)_rapEditPlaceDetailsMenu
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v4 = [MEMORY[0x1E4F1CA48] array];
  char v5 = [(MUPlaceInfoSectionController *)self inlineRapEnablement];
  id v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isHoursEditable", v5)) {
      [v4 addObject:&unk_1EE404DF0];
    }
    if ([v6 isPhoneEditable]) {
      [v4 addObject:&unk_1EE404E08];
    }
    if ([v6 isWebsiteEditable]) {
      [v4 addObject:&unk_1EE404E20];
    }
    if ([v6 isAddressEditable]) {
      [v4 addObject:&unk_1EE404E38];
    }
    [v4 addObject:&unk_1EE404E50];
  }
  else
  {
    objc_msgSend(v4, "addObjectsFromArray:", &unk_1EE4051B0, 0);
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, self);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = [*(id *)(*((void *)&v21 + 1) + 8 * i) integerValue];
        int v12 = (void *)v11;
        uint64_t v13 = (void *)MEMORY[0x1E4FB13F0];
        if (v11 <= 5)
        {
          id v2 = _MULocalizedStringFromThisBundle(off_1E5750EA0[v11]);
        }
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __56__MUPlaceInfoSectionController__rapEditPlaceDetailsMenu__block_invoke;
        v19[3] = &unk_1E5750E80;
        objc_copyWeak(v20, &location);
        v20[1] = v12;
        uint64_t v14 = [v13 actionWithTitle:v2 image:0 identifier:0 handler:v19];

        [v7 addObject:v14];
        objc_destroyWeak(v20);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  id v15 = [MEMORY[0x1E4FB1970] menuWithChildren:v7];
  objc_destroyWeak(&location);

  return v15;
}

void __56__MUPlaceInfoSectionController__rapEditPlaceDetailsMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained placeInfoDelegate];
    [v3 placeInfoSectionController:v4 didSelectEditPlaceDetailsOfType:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

- (void)_rapEditPlaceDetailsButtonTapped
{
}

- (void)_performActionItem:(id)a3 withOptions:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v13 = *MEMORY[0x1E4F30DC0];
  id v7 = a3;
  uint64_t v8 = [(MUPlaceSectionController *)self analyticsModule];
  v14[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v10 = (void *)[v9 mutableCopy];

  if (v6) {
    [v10 addEntriesFromDictionary:v6];
  }
  unint64_t v11 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration actionDelegate];
  int v12 = (void *)[v10 copy];
  [v11 performAction:v7 options:v12 completion:0];
}

- (void)hoursSectionView:(id)a3 didExpand:(BOOL)a4 forConfiguration:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  if (v5)
  {
    id v9 = v7;
    if ([v7 isServiceHours])
    {
      uint64_t v8 = [v9 hoursName];
    }
    else
    {
      uint64_t v8 = 0;
    }
    [(MUPlaceSectionController *)self captureInfoCardAction:6012 eventValue:v8 feedbackType:0];

    id v7 = v9;
  }
}

- (BOOL)hasContent
{
  return [(NSArray *)self->_sectionViews count] != 0;
}

- (id)draggableContent
{
  id v3 = [(NSArray *)self->_sectionViews firstObject];
  uint64_t v4 = MUIdiomInTraitEnvironment(v3);

  if (v4 == 5)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sectionStackViews = self->_sectionStackViews;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__MUPlaceInfoSectionController_draggableContent__block_invoke;
    v10[3] = &unk_1E5750490;
    id v11 = v6;
    id v8 = v6;
    [(NSMutableArray *)sectionStackViews enumerateObjectsUsingBlock:v10];
    BOOL v5 = (void *)[v8 copy];
  }
  return v5;
}

uint64_t __48__MUPlaceInfoSectionController_draggableContent__block_invoke(uint64_t a1, void *a2)
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

- (int)analyticsModuleType
{
  return 5;
}

- (void)_populateRevealedAnalyticsModule:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration availability];
  int v7 = [v6 supportsInlineReportAnIssue];

  if (v7)
  {
    id v29 = v4;
    id v8 = [(MUPlaceInfoSectionControllerConfiguration *)self->_configuration availability];
    char v9 = [v8 supportsHours];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [MEMORY[0x1E4F64950] moduleButtonForType:53];
      objc_msgSend(v5, "_mapsui_addObjectIfNotNil:", v10);
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = self->_sectionStackViews;
    uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v40;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v40 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v39 + 1) + 8 * v14);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          uint64_t v16 = [v15 viewModels];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v36;
            do
            {
              uint64_t v20 = 0;
              do
              {
                if (*(void *)v36 != v19) {
                  objc_enumerationMutation(v16);
                }
                long long v21 = *(void **)(*((void *)&v35 + 1) + 8 * v20);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v22 = [v21 analyticsButtonValue];
                  objc_msgSend(v5, "_mapsui_addObjectIfNotNil:", v22);
                }
                ++v20;
              }
              while (v18 != v20);
              uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
            }
            while (v18);
          }

          ++v14;
        }
        while (v14 != v12);
        uint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v12);
    }

    id v4 = v29;
  }
  if ([v5 count])
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F64958]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v24 = v5;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v32;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v24);
          }
          [v23 addButtons:*(void *)(*((void *)&v31 + 1) + 8 * v28++)];
        }
        while (v26 != v28);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v26);
    }

    [v4 setInfos:v23];
  }
}

- (BOOL)isImpressionable
{
  return 1;
}

- (MUPlaceInfoSectionControllerDelegate)placeInfoDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeInfoDelegate);
  return (MUPlaceInfoSectionControllerDelegate *)WeakRetained;
}

- (void)setPlaceInfoDelegate:(id)a3
{
}

- (MUUserInformationProvider)userInfoProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userInfoProvider);
  return (MUUserInformationProvider *)WeakRetained;
}

- (void)setUserInfoProvider:(id)a3
{
}

- (unint64_t)placeNumberOfReportsInReview
{
  return self->_placeNumberOfReportsInReview;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userInfoProvider);
  objc_destroyWeak((id *)&self->_placeInfoDelegate);
  objc_storeStrong((id *)&self->_sectionFooterViewModel, 0);
  objc_storeStrong((id *)&self->_placeInfoSectionView, 0);
  objc_storeStrong((id *)&self->_rapStatusContentView, 0);
  objc_storeStrong((id *)&self->_hoursContentView, 0);
  objc_storeStrong((id *)&self->_sectionViews, 0);
  objc_storeStrong((id *)&self->_sectionStackViews, 0);
  objc_storeStrong((id *)&self->_contactsViewModelGenerator, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
}

@end