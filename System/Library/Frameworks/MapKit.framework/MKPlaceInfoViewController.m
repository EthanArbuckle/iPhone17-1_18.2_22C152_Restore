@interface MKPlaceInfoViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)bottomHairlineHidden;
- (BOOL)hasContent;
- (BOOL)shouldShowDetails;
- (MKMapItem)mapItem;
- (MKPlaceActionManagerProtocol)actionDelegate;
- (MKPlaceInfoViewController)initWithPlaceItem:(id)a3;
- (_MKPlaceItem)placeItem;
- (id)_addRowForType:(unint64_t)a3 withValue:(id)a4 toViews:(id)a5;
- (id)_createViewForInfoRow:(unint64_t)a3;
- (id)contact;
- (id)infoCardChildPossibleActions;
- (id)infoCardChildUnactionableUIElements;
- (unint64_t)actionTypeFromRowType:(unint64_t)a3;
- (unint64_t)placecardOptions;
- (void)_addContactRow:(id)a3 ofType:(unint64_t)a4 toViews:(id)a5 defaultTitle:(id)a6;
- (void)_configureRow:(id)a3 ofType:(unint64_t)a4 withValue:(id)a5;
- (void)_launchMapsDirectionsWithSource:(id)a3 destination:(id)a4 directionsMode:(id)a5;
- (void)_shareAddress:(id)a3 fromView:(id)a4;
- (void)_updateViewsAnimated:(BOOL)a3;
- (void)sectionView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5;
- (void)setActionDelegate:(id)a3;
- (void)setBottomHairlineHidden:(BOOL)a3;
- (void)setMapItem:(id)a3;
- (void)setPlaceItem:(id)a3;
- (void)setPlacecardOptions:(unint64_t)a3;
- (void)viewDidLoad;
@end

@implementation MKPlaceInfoViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MKPlaceInfoViewController)initWithPlaceItem:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MKPlaceInfoViewController;
  v6 = [(MKPlaceInfoViewController *)&v13 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_placeItem, a3);
    uint64_t v8 = [v5 mapItem];
    mapItem = v7->_mapItem;
    v7->_mapItem = (MKMapItem *)v8;

    v10 = _MKLocalizedStringFromThisBundle(@"Info");
    [(MKPlaceInfoViewController *)v7 setTitle:v10];

    v11 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  v3 = MKGetPlaceCardLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PlaceInfoViewDidLoad", (const char *)&unk_18BD3917F, buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)MKPlaceInfoViewController;
  [(MKPlaceInfoViewController *)&v7 viewDidLoad];
  v4 = [(MKPlaceSectionViewController *)self sectionView];
  [v4 setPreservesSuperviewLayoutMargins:1];

  id v5 = [(MKPlaceSectionViewController *)self sectionView];
  [v5 setShowsBottomHairline:0];

  [(MKPlaceInfoViewController *)self _updateViewsAnimated:0];
  v6 = MKGetPlaceCardLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PlaceInfoViewDidLoad", (const char *)&unk_18BD3917F, buf, 2u);
  }
}

- (BOOL)hasContent
{
  v3 = [(MKPlaceInfoViewController *)self view];

  if (!v3) {
    return 0;
  }
  v4 = [(MKPlaceSectionViewController *)self sectionView];
  id v5 = [v4 rowViews];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (id)contact
{
  v3 = [(_MKPlaceItem *)self->_placeItem contact];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    BOOL v6 = [(_MKPlaceItem *)self->_placeItem mapItem];
    id v5 = [v6 _placeCardContact];
  }

  return v5;
}

- (BOOL)shouldShowDetails
{
  if (![(_MKPlaceItem *)self->_placeItem isContactPersisted]) {
    return 1;
  }
  v3 = [(MKPlaceInfoViewController *)self contact];
  v4 = [v3 mapsData];
  BOOL v5 = v4 != 0;

  return v5;
}

- (unint64_t)actionTypeFromRowType:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return qword_18BD1B9F0[a3 - 1];
  }
}

- (void)sectionView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", a5, a4);
  objc_super v7 = [v6 rowView];
  unint64_t v8 = -[MKPlaceInfoViewController actionTypeFromRowType:](self, "actionTypeFromRowType:", [v6 type]);
  uint64_t v9 = [v6 type];
  if ((unint64_t)(v9 - 1) >= 4)
  {
    v10 = 0;
    if (!v9) {
      goto LABEL_7;
    }
  }
  else
  {
    v10 = [v7 labeledValue];

    if (v10)
    {
      v14 = @"CNLabeledValue";
      v11 = [v7 labeledValue];
      v15[0] = v11;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    }
  }
  if (v8)
  {
    v12 = [[MKPlaceCardActionItem alloc] initWithType:v8 displayString:0 glyph:0 enabled:0];
    objc_super v13 = [(MKPlaceInfoViewController *)self actionDelegate];
    [v13 performAction:v12 options:v10 completion:0];
  }
LABEL_7:
}

- (void)setBottomHairlineHidden:(BOOL)a3
{
  self->_bottomHairlineHidden = a3;
  if ([(MKPlaceInfoViewController *)self isViewLoaded])
  {
    BOOL v4 = !self->_bottomHairlineHidden;
    id v5 = [(MKPlaceSectionViewController *)self sectionView];
    [v5 setShowsBottomHairline:v4];
  }
}

- (void)_updateViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v29[1] = *MEMORY[0x1E4F143B8];
  if ([(MKPlaceInfoViewController *)self isViewLoaded])
  {
    id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
    rows = self->_rows;
    self->_rows = v5;

    objc_super v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
    unint64_t v8 = [(MKPlaceInfoViewController *)self mapItem];
    uint64_t v9 = [v8 _addressFormattedAsMultilineAddress];

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E4F1BA20];
      v11 = _MKLocalizedStringFromThisBundle(@"PlaceView_Address_Title");
      v12 = [v10 labeledValueWithLabel:v11 value:v9];

      v29[0] = v12;
      objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      [(MKPlaceInfoViewController *)self _addContactRow:v13 ofType:3 toViews:v7 defaultTitle:0];
    }
    uint64_t v14 = [(MKPlaceInfoViewController *)self contact];
    if (v14)
    {
      v15 = (void *)v14;
      BOOL v16 = [(MKPlaceInfoViewController *)self shouldShowDetails];

      if (v16)
      {
        v17 = [(MKPlaceInfoViewController *)self contact];
        v18 = [v17 phoneNumbers];
        v19 = _MKLocalizedStringFromThisBundle(@"PlaceView_Phone_Title");
        [(MKPlaceInfoViewController *)self _addContactRow:v18 ofType:1 toViews:v7 defaultTitle:v19];

        v20 = [(MKPlaceInfoViewController *)self contact];
        v21 = [v20 urlAddresses];
        v22 = _MKLocalizedStringFromThisBundle(@"PlaceView_Website_Title");
        [(MKPlaceInfoViewController *)self _addContactRow:v21 ofType:2 toViews:v7 defaultTitle:v22];

        v23 = [(MKPlaceInfoViewController *)self contact];
        v24 = [v23 emailAddresses];
        v25 = _MKLocalizedStringFromThisBundle(@"PlaceView_Email_Title");
        [(MKPlaceInfoViewController *)self _addContactRow:v24 ofType:4 toViews:v7 defaultTitle:v25];
      }
    }
    [v7 enumerateObjectsUsingBlock:&__block_literal_global_85];
    v26 = [v7 firstObject];
    [v26 setTopHairlineHidden:1];

    v27 = [v7 lastObject];
    [v27 setBottomHairlineHidden:1];

    v28 = [(MKPlaceSectionViewController *)self sectionView];
    [v28 setRowViews:v7 animated:v3];
  }
}

void __50__MKPlaceInfoViewController__updateViewsAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTopHairlineHidden:1];
  [v2 setBottomHairlineHidden:0];
}

- (void)_addContactRow:(id)a3 ofType:(unint64_t)a4 toViews:(id)a5 defaultTitle:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v13 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    id v26 = v10;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v10);
        }
        id v17 = *(id *)(*((void *)&v27 + 1) + 8 * v16);
        if (v12 && [v10 count] == 1)
        {
          id v18 = v11;
          v19 = self;
          unint64_t v20 = a4;
          id v21 = objc_alloc(MEMORY[0x1E4F1BA20]);
          [v17 value];
          v23 = uint64_t v22 = v15;
          uint64_t v24 = [v21 initWithLabel:v12 value:v23];

          uint64_t v15 = v22;
          id v17 = (id)v24;
          a4 = v20;
          self = v19;
          id v11 = v18;
          id v10 = v26;
        }
        id v25 = [(MKPlaceInfoViewController *)self _addRowForType:a4 withValue:v17 toViews:v11];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }
}

- (id)_addRowForType:(unint64_t)a3 withValue:(id)a4 toViews:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [0 rowView];
  if (v10
    || ([(MKPlaceInfoViewController *)self _createViewForInfoRow:a3],
        id v10 = objc_claimAutoreleasedReturnValue(),
        +[MKPlaceInfoRow infoRow:v10 ofType:a3],
        (id v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v11 = +[MKPlaceInfoRow infoRow:v10 ofType:a3];
  }
  [(MKPlaceInfoViewController *)self _configureRow:v10 ofType:a3 withValue:v8];
  [v9 addObject:v10];

  [(NSMutableArray *)self->_rows addObject:v11];

  return v10;
}

- (id)_createViewForInfoRow:(unint64_t)a3
{
  id v4 = 0;
  id v5 = off_1E54B7398;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_14;
    case 1uLL:
      goto LABEL_5;
    case 2uLL:
      id v5 = off_1E54B73A8;
      goto LABEL_5;
    case 3uLL:
      id v5 = off_1E54B73A0;
      goto LABEL_5;
    case 4uLL:
      id v5 = off_1E54B7390;
LABEL_5:
      id v6 = objc_alloc(*v5);
      id v4 = (id)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      break;
    default:
      break;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v4;
    id v8 = [(MKPlaceInfoViewController *)self mapItem];
    if ([v8 _isMapItemTypeBrand])
    {
      id v9 = [(UIViewController *)self mk_theme];
      id v10 = [v9 tintColor];
      [v7 setLabelColor:v10];
    }
    else
    {
      [v7 setLabelColor:0];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v4 = v4;
    id v11 = [(UIViewController *)self mk_theme];
    id v12 = [v11 tintColor];
    [v4 setLabelColor:v12];
  }
LABEL_14:

  return v4;
}

- (void)_configureRow:(id)a3 ofType:(unint64_t)a4 withValue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  switch(a4)
  {
    case 1uLL:
      [v8 setLabeledValue:v9];
      id v10 = [(MKPlaceInfoViewController *)self mapItem];
      objc_msgSend(v8, "setOptsOutOfAds:", objc_msgSend(v10, "_phoneNumberOptsOutOfAds"));

      goto LABEL_3;
    case 2uLL:
    case 4uLL:
LABEL_3:
      [v8 setLabeledValue:v9];
      break;
    case 3uLL:
      id v11 = v8;
      [v11 setLabeledValue:v9];
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __60__MKPlaceInfoViewController__configureRow_ofType_withValue___block_invoke;
      v12[3] = &unk_1E54BD070;
      objc_copyWeak(&v14, &location);
      id v13 = v9;
      [v11 setIconSelectedBlock:v12];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);

      break;
    default:
      break;
  }
}

void __60__MKPlaceInfoViewController__configureRow_ofType_withValue___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [*(id *)(a1 + 32) value];
  [WeakRetained _shareAddress:v5 fromView:v4];
}

- (void)_shareAddress:(id)a3 fromView:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [[MKPlaceCardActionItem alloc] initWithType:16 displayString:0 glyph:0 enabled:1];
  if (v5)
  {
    id v9 = @"view";
    v10[0] = v5;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [(MKPlaceInfoViewController *)self actionDelegate];
  [v8 performAction:v6 options:v7 completion:0];
}

- (void)_launchMapsDirectionsWithSource:(id)a3 destination:(id)a4 directionsMode:(id)a5
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  v15[0] = a3;
  v15[1] = a4;
  id v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 arrayWithObjects:v15 count:2];
  id v13 = @"MKLaunchOptionsDirectionsMode";
  id v14 = v8;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  +[MKMapItem openMapsWithItems:v11 launchOptions:v12 completionHandler:&__block_literal_global_104_0];
}

- (id)infoCardChildPossibleActions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_rows;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "type", (void)v15);
        uint64_t v10 = 6009;
        switch(v9)
        {
          case 0:

            id v13 = 0;
            goto LABEL_14;
          case 1:
            goto LABEL_9;
          case 2:
            uint64_t v10 = 6010;
            goto LABEL_9;
          case 3:
            id v11 = [NSNumber numberWithInteger:6008];
            [v3 addObject:v11];

            uint64_t v10 = 6013;
LABEL_9:
            id v12 = [NSNumber numberWithInteger:v10];
            [v3 addObject:v12];

            break;
          default:
            continue;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  id v13 = (void *)[v3 copy];
LABEL_14:

  return v13;
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)bottomHairlineHidden
{
  return self->_bottomHairlineHidden;
}

- (unint64_t)placecardOptions
{
  return self->_placecardOptions;
}

- (void)setPlacecardOptions:(unint64_t)a3
{
  self->_placecardOptions = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (MKPlaceActionManagerProtocol)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (MKPlaceActionManagerProtocol *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (void)setPlaceItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_selectedRow);

  objc_storeStrong((id *)&self->_rows, 0);
}

@end