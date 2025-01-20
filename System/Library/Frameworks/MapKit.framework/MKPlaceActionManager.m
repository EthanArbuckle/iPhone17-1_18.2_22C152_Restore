@interface MKPlaceActionManager
- (BOOL)_canShowAddOrEditNoteAction;
- (BOOL)_canShowCallAction;
- (BOOL)_canShowClaimThisBusiness;
- (BOOL)_canShowCreateCustomRouteAction;
- (BOOL)_canShowLibraryAction;
- (BOOL)_isCurrentLocationOrDroppedPin;
- (BOOL)_showAddPlaceFooterAction;
- (BOOL)_showCollectionItem;
- (BOOL)_showHomeShortcutItem;
- (BOOL)_showMapItemIdentifier;
- (BOOL)_showReportAProblem;
- (BOOL)_showReportAProblemFooterAction;
- (BOOL)_showWebsite;
- (BOOL)isCurrentLocation;
- (BOOL)placeInBookmarks;
- (BOOL)placeInCollections;
- (BOOL)placeInShortcuts;
- (BOOL)showContactActions;
- (MKPlaceActionDataProvider)dataProvider;
- (MKPlaceActionManager)initWithDataProvider:(id)a3;
- (MKPlaceCardActionItem)callActionItem;
- (MKPlaceCardActionItem)claimBusinessActionItem;
- (MKPlaceCardActionItem)collectionActionItem;
- (MKPlaceCardActionItem)deleteFromLibraryActionItem;
- (MKPlaceCardActionItem)favoriteActionItem;
- (MKPlaceCardActionItem)flyoverActionItem;
- (MKPlaceCardActionItem)homeActionItem;
- (MKPlaceCardActionItem)libraryActionItem;
- (MKPlaceCardActionItem)messageActionItem;
- (MKPlaceCardActionItem)noteActionItem;
- (MKPlaceCardActionItem)removeMarkerItem;
- (MKPlaceCardActionItem)reportAProblemAddPlaceFooterAction;
- (MKPlaceCardActionItem)reportAProblemFooterAction;
- (MKPlaceCardActionItem)shareActionItem;
- (MKPlaceCardActionItem)websiteActionItem;
- (_MKInfoCardAnalyticsDelegate)analyticsDelegate;
- (id)actionItemForButtonItem:(id)a3;
- (id)actionItemForButtonType:(int)a3;
- (id)addToHomeItem;
- (id)contact;
- (id)createContactActions;
- (id)createCustomRouteActionItem;
- (id)createFooterActions;
- (id)createMenuActions;
- (id)createRowActionsWithStyle:(unint64_t)a3;
- (id)createSearchAlongRouteActions;
- (id)delegate;
- (id)developerPlaceCardGetDirectionsFooterAction;
- (id)developerPlaceCardOpenInMapsFooterAction;
- (id)favoriteItemForFooter;
- (id)mapItem;
- (id)placeCardDelegate;
- (id)placeItem;
- (id)shortPlacecardFooterActions;
- (unint64_t)options;
- (unint64_t)placeHasNote;
- (unint64_t)placeInLibrary;
- (unint64_t)placeMUIDForAppearance:(id)a3;
- (void)_addInternalOnlyActions:(id)a3;
- (void)_canMakeCalls:(id)a3;
- (void)_enableStoreAction;
- (void)_launchMaps;
- (void)addLayoutInfoIfNeeded:(id)a3;
- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setIsCurrentLocation:(BOOL)a3;
- (void)setPlaceCardDelegate:(id)a3;
- (void)setPlaceHasNote:(unint64_t)a3;
- (void)setPlaceInBookmarks:(BOOL)a3;
- (void)setPlaceInCollections:(BOOL)a3;
- (void)setPlaceInLibrary:(unint64_t)a3;
- (void)setPlaceInShortcuts:(BOOL)a3;
- (void)setShowContactActions:(BOOL)a3;
@end

@implementation MKPlaceActionManager

- (MKPlaceActionManager)initWithDataProvider:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKPlaceActionManager;
  v6 = [(MKPlaceActionManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataProvider, a3);
    objc_initWeak(&location, v7);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__MKPlaceActionManager_initWithDataProvider___block_invoke;
    v9[3] = &unk_1E54BAEA8;
    objc_copyWeak(&v10, &location);
    [(MKPlaceActionManager *)v7 _canMakeCalls:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __45__MKPlaceActionManager_initWithDataProvider___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 10, a2);
    v6 = [v5 callActionItem];
    [v6 setEnabled:v13 != 0];

    v7 = [v5 delegate];
    v8 = [v7 placeViewControllerDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [v5 delegate];
      v11 = [v10 placeViewControllerDelegate];
      objc_super v12 = [v5 delegate];
      [v11 placeViewControllerDidUpdateCallProvider:v12];
    }
  }
}

- (id)actionItemForButtonType:(int)a3
{
  v4 = 0;
  switch(a3)
  {
    case 1:
      v4 = [(MKPlaceActionManager *)self collectionActionItem];
      break;
    case 2:
      v4 = [(MKPlaceActionManager *)self reportAProblemFooterAction];
      break;
    case 3:
      v4 = [(MKPlaceActionManager *)self shareActionItem];
      break;
    case 4:
      v4 = [(MKPlaceActionManager *)self callActionItem];
      break;
    case 5:
      v4 = [(MKPlaceActionManager *)self messageActionItem];
      break;
    case 6:
      v4 = [(MKPlaceActionManager *)self websiteActionItem];
      break;
    case 9:
      v4 = [(MKPlaceActionManager *)self flyoverActionItem];
      break;
    case 10:
      if (!GEOSupportsOfflineMaps()
        || ([(MKPlaceActionManager *)self options] & 0x1000000000) != 0)
      {
        goto LABEL_16;
      }
      v4 = +[MKPlaceCardActionItem actionItemWithType:34];
      break;
    case 11:
      id v5 = [(MKPlaceActionManager *)self dataProvider];
      int v6 = [v5 supportsAddingPhotos];

      if (v6)
      {
        v4 = +[MKPlaceCardActionItem actionItemWithType:9 actionDataProvider:self enabled:1];
      }
      else
      {
LABEL_16:
        v4 = 0;
      }
      break;
    case 12:
      v4 = [(MKPlaceActionManager *)self homeActionItem];
      break;
    case 13:
      v4 = [(MKPlaceActionManager *)self libraryActionItem];
      break;
    case 14:
      v4 = [(MKPlaceActionManager *)self noteActionItem];
      break;
    default:
      break;
  }

  return v4;
}

- (id)actionItemForButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = [(MKPlaceActionManager *)self createRowActionsWithStyle:0];
  uint64_t v6 = [v4 buttonType];

  return [(MKPlaceActionManager *)self actionItemForButtonType:v6];
}

- (unint64_t)placeMUIDForAppearance:(id)a3
{
  v3 = [(MKPlaceActionManager *)self mapItem];
  unint64_t v4 = [v3 _muid];

  return v4;
}

- (void)setPlaceInBookmarks:(BOOL)a3
{
  self->_placeInBookmarks = a3;
  -[MKPlaceCardActionItem setSelected:](self->_favoriteActionItem, "setSelected:");
  favoriteActionItem = self->_favoriteActionItem;

  [(MKPlaceCardActionItem *)favoriteActionItem setEnabled:1];
}

- (void)setPlaceInCollections:(BOOL)a3
{
  self->_placeInCollections = a3;
  -[MKPlaceCardActionItem setSelected:](self->_collectionActionItem, "setSelected:");
  collectionActionItem = self->_collectionActionItem;

  [(MKPlaceCardActionItem *)collectionActionItem setEnabled:1];
}

- (void)setPlaceInShortcuts:(BOOL)a3
{
  BOOL v3 = a3;
  self->_placeInShortcuts = a3;
  id v5 = [(MKPlaceActionManager *)self homeActionItem];
  [v5 setSelected:v3];

  id v6 = [(MKPlaceActionManager *)self homeActionItem];
  [v6 setEnabled:1];
}

- (void)setPlaceInLibrary:(unint64_t)a3
{
  self->_placeInLibrary = a3;
  id v3 = [(MKPlaceActionManager *)self libraryActionItem];
  [v3 setEnabled:1];
}

- (void)setPlaceHasNote:(unint64_t)a3
{
  self->_placeHasNote = a3;
  id v3 = [(MKPlaceActionManager *)self noteActionItem];
  [v3 setEnabled:1];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_placeCardDelegate);

  return WeakRetained;
}

- (id)contact
{
  v2 = [(MKPlaceActionManager *)self delegate];
  id v3 = [v2 contact];

  return v3;
}

- (id)mapItem
{
  v2 = [(MKPlaceActionManager *)self delegate];
  id v3 = [v2 mapItem];

  return v3;
}

- (id)placeItem
{
  v2 = [(MKPlaceActionManager *)self delegate];
  id v3 = [v2 placeItem];

  return v3;
}

- (unint64_t)options
{
  v2 = [(MKPlaceActionManager *)self delegate];
  unint64_t v3 = [v2 options];

  return v3;
}

- (BOOL)showContactActions
{
  return self->_showContactActions && ([(MKPlaceActionManager *)self options] & 0x800) == 0;
}

- (BOOL)_showMapItemIdentifier
{
  unint64_t v3 = [(MKPlaceActionManager *)self mapItem];
  if ([v3 _muid]) {
    unint64_t v4 = ([(MKPlaceActionManager *)self options] >> 24) & 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)_showReportAProblem
{
  if (_MKRAPIsAvailable())
  {
    unint64_t v3 = [(MKPlaceActionManager *)self placeItem];
    if (([v3 options] & 4) != 0) {
      goto LABEL_8;
    }
    unint64_t v4 = [(MKPlaceActionManager *)self placeItem];
    char v5 = [v4 options];

    if ((v5 & 8) == 0)
    {
      unint64_t v3 = [(MKPlaceActionManager *)self mapItem];
      if (v3)
      {
        if (([(MKPlaceActionManager *)self options] & 0x40) != 0)
        {
          v8 = [(MKPlaceActionManager *)self placeItem];
          char v6 = [v8 hasContactOnly];
        }
        else
        {
          char v6 = 1;
        }
        goto LABEL_9;
      }
LABEL_8:
      char v6 = 0;
LABEL_9:

      return v6;
    }
  }
  return 0;
}

- (BOOL)_showReportAProblemFooterAction
{
  BOOL v3 = [(MKPlaceActionManager *)self _showReportAProblem];
  if (v3) {
    LOBYTE(v3) = ![(MKPlaceActionManager *)self _isCurrentLocationOrDroppedPin];
  }
  return v3;
}

- (BOOL)_showAddPlaceFooterAction
{
  BOOL v3 = [(MKPlaceActionManager *)self _showReportAProblem];
  if (v3)
  {
    unint64_t v4 = [(MKPlaceActionManager *)self placeItem];
    unsigned int v5 = [v4 options];

    char v6 = [(MKPlaceActionManager *)self placeItem];
    if (([v6 options] & 8) != 0)
    {
      BOOL v10 = 0;
    }
    else
    {
      v7 = [(MKPlaceActionManager *)self placeItem];
      if (([v7 options] & 4) != 0)
      {
        BOOL v10 = 0;
      }
      else
      {
        v8 = [(MKPlaceActionManager *)self placeItem];
        char v9 = [v8 contact];
        BOOL v10 = v9 == 0;
      }
    }

    v11 = [(MKPlaceActionManager *)self mapItem];
    int v12 = [v11 _isMapItemTypeAddress];

    return (v12 | (v5 >> 1)) & v10;
  }
  return v3;
}

- (BOOL)_showWebsite
{
  BOOL v3 = +[MKSystemController sharedInstance];
  if ([v3 userInterfaceIdiom] == 2)
  {
    unint64_t v4 = [(MKPlaceActionManager *)self contact];
    unsigned int v5 = [v4 urlAddresses];
    if ([v5 count])
    {
      char v6 = [(MKPlaceActionManager *)self placeItem];
      BOOL v7 = ([v6 options] & 8) == 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_showCollectionItem
{
  BOOL v3 = [(MKPlaceActionManager *)self mapItem];
  char v4 = [v3 _isMapItemTypeBrand];

  return (v4 & 1) == 0 && ([(MKPlaceActionManager *)self options] & 0x8000) != 0 && !self->_isCurrentLocation;
}

- (BOOL)_canShowLibraryAction
{
  BOOL v3 = [(MKPlaceActionManager *)self mapItem];
  char v4 = [v3 _isMapItemTypeBrand];

  return (v4 & 1) == 0
      && ([(MKPlaceActionManager *)self options] & 0x10000000000) != 0
      && !self->_isCurrentLocation;
}

- (BOOL)_canShowAddOrEditNoteAction
{
  BOOL v3 = [(MKPlaceActionManager *)self mapItem];
  char v4 = [v3 _isMapItemTypeBrand];

  return (v4 & 1) == 0
      && ([(MKPlaceActionManager *)self options] & 0x20000000000) != 0
      && !self->_isCurrentLocation;
}

- (BOOL)_canShowCreateCustomRouteAction
{
  BOOL v3 = [(MKPlaceActionManager *)self dataProvider];
  int v4 = [v3 isInSupportedCustomRouteRegion];

  if (!v4) {
    return 0;
  }
  if ([(MKPlaceActionManager *)self _isCurrentLocationOrDroppedPin])
  {
    char v5 = 1;
  }
  else
  {
    BOOL v7 = [(MKPlaceActionManager *)self placeItem];
    v8 = [v7 mapItem];
    char v5 = [v8 _isMapItemTypeAddress];
  }
  char v9 = [(MKPlaceActionManager *)self mapItem];
  BOOL v10 = [v9 _geoMapItem];
  v11 = [v10 _tooltip];
  if (v11) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5;
  }

  return v6;
}

- (BOOL)_showHomeShortcutItem
{
  BOOL v3 = [(MKPlaceActionManager *)self mapItem];
  char v4 = [v3 _isMapItemTypeBrand];

  return (v4 & 1) == 0
      && ([(MKPlaceActionManager *)self options] & 0x10000000) != 0
      && !self->_isCurrentLocation;
}

- (id)favoriteItemForFooter
{
  BOOL v3 = +[MKPlaceCardActionItem actionItemWithType:6 actionDataProvider:self enabled:1];
  char v4 = [MEMORY[0x1E4F428B8] systemRedColor];
  [v3 setGlyphColor:v4];

  char v5 = +[MKPlaceCardActionItem actionItemWithType:5 actionDataProvider:self enabled:1];
  [v5 setSelectedItem:v3];
  BOOL v6 = [(MKPlaceActionManager *)self delegate];
  objc_msgSend(v5, "setSelected:", objc_msgSend(v6, "placeInBookmarks"));

  return v5;
}

- (id)addToHomeItem
{
  if ([(MKPlaceActionManager *)self _showHomeShortcutItem])
  {
    BOOL v3 = +[MKPlaceCardActionItem actionItemWithType:23 actionDataProvider:self enabled:1];
    char v4 = +[MKPlaceCardActionItem actionItemWithType:22 actionDataProvider:self enabled:1];
    [v4 setSelectedItem:v3];
    char v5 = [(MKPlaceActionManager *)self delegate];
    objc_msgSend(v4, "setSelected:", objc_msgSend(v5, "placeInShortcuts"));
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (MKPlaceCardActionItem)callActionItem
{
  if ([(MKPlaceActionManager *)self _canShowCallAction])
  {
    callActionItem = self->_callActionItem;
    if (!callActionItem)
    {
      char v4 = +[MKPlaceCardActionItem actionItemWithType:10 actionDataProvider:self enabled:0];
      char v5 = self->_callActionItem;
      self->_callActionItem = v4;

      callActionItem = self->_callActionItem;
    }
    [(MKPlaceCardActionItem *)callActionItem setEnabled:self->_callProvider != 0];
    BOOL v6 = self->_callActionItem;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (MKPlaceCardActionItem)websiteActionItem
{
  if ([(MKPlaceActionManager *)self _showWebsite])
  {
    websiteActionItem = self->_websiteActionItem;
    if (!websiteActionItem)
    {
      char v4 = +[MKPlaceCardActionItem actionItemWithType:13 actionDataProvider:self enabled:1];
      char v5 = self->_websiteActionItem;
      self->_websiteActionItem = v4;

      websiteActionItem = self->_websiteActionItem;
    }
    BOOL v6 = websiteActionItem;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)createMenuActions
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  char v4 = [(MKPlaceActionManager *)self createRowActionsWithStyle:0];
  [v3 addObjectsFromArray:v4];

  char v5 = [(MKPlaceActionManager *)self createFooterActions];
  [v3 addObjectsFromArray:v5];

  BOOL v6 = (void *)[v3 copy];

  return v6;
}

- (id)createRowActionsWithStyle:(unint64_t)a3
{
  char v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  char v5 = +[MKSystemController sharedInstance];
  int v6 = [v5 userInterfaceIdiom];

  BOOL v7 = [(MKPlaceActionManager *)self mapItem];
  if (([v7 _isMapItemTypeBrand] & 1) == 0)
  {
    v8 = [(MKPlaceActionManager *)self placeItem];
    char v9 = [v8 options];

    if ((v9 & 2) == 0) {
      goto LABEL_5;
    }
    BOOL v7 = [(MKPlaceActionManager *)self removeMarkerItem];
    [v4 addObject:v7];
  }

LABEL_5:
  BOOL v10 = [(MKPlaceActionManager *)self dataProvider];
  int v11 = [v10 supportsMessagesForBusiness];

  if (v11)
  {
    int v12 = [(MKPlaceActionManager *)self messageActionItem];
    [v4 addObject:v12];
  }
  if ([(MKPlaceActionManager *)self _canShowCallAction])
  {
    id v13 = [(MKPlaceActionManager *)self callActionItem];

    if (v13)
    {
      v14 = [(MKPlaceActionManager *)self callActionItem];
      [v4 addObject:v14];
    }
  }
  if ([(MKPlaceActionManager *)self _showWebsite])
  {
    v15 = [(MKPlaceActionManager *)self websiteActionItem];

    if (v15)
    {
      v16 = [(MKPlaceActionManager *)self websiteActionItem];
      [v4 addObject:v16];
    }
  }
  if ([(MKPlaceActionManager *)self _canShowLibraryAction])
  {
    v17 = [(MKPlaceActionManager *)self libraryActionItem];

    if (v17)
    {
      v18 = [(MKPlaceActionManager *)self libraryActionItem];
      [v4 addObject:v18];
    }
  }
  if ([(MKPlaceActionManager *)self _canShowAddOrEditNoteAction])
  {
    v19 = [(MKPlaceActionManager *)self noteActionItem];

    if (v19)
    {
      v20 = [(MKPlaceActionManager *)self noteActionItem];
      [v4 addObject:v20];
    }
  }
  if ([(MKPlaceActionManager *)self _showCollectionItem])
  {
    v21 = [(MKPlaceActionManager *)self collectionActionItem];

    if (v21)
    {
      v22 = [(MKPlaceActionManager *)self collectionActionItem];
      [v4 addObject:v22];
    }
  }
  BOOL v23 = v6 != 2 && self->_isCurrentLocation;
  v24 = [(MKPlaceActionManager *)self mapItem];
  char v25 = [v24 _isMapItemTypeBrand];
  if (v23 || (v25 & 1) != 0) {
    goto LABEL_29;
  }
  int v26 = [(MKPlaceActionManager *)self options];

  if ((v26 & 0x200000) == 0)
  {
    v24 = [(MKPlaceActionManager *)self shareActionItem];
    [v4 addObject:v24];
LABEL_29:
  }
  if (v6 == 2 && self->_isCurrentLocation)
  {
    v27 = +[MKPlaceCardActionItem actionItemWithType:28 actionDataProvider:self enabled:1];
    [v4 addObject:v27];
  }
  v28 = [(MKPlaceActionManager *)self mapItem];
  if ([v28 _isMapItemTypeBrand])
  {
    v29 = [(MKPlaceActionManager *)self mapItem];
    char v30 = [v29 _isStandAloneBrand];

    if ((v30 & 1) == 0)
    {
      brandStoreActionItem = self->_brandStoreActionItem;
      if (!brandStoreActionItem)
      {
        v32 = +[MKPlaceCardActionItem actionItemWithType:20 actionDataProvider:self enabled:0];
        v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v33 addObserver:self selector:sel__enableStoreAction name:@"MKPlaceActionManagerBrandStoresEnableNotification" object:0];

        v34 = self->_brandStoreActionItem;
        self->_brandStoreActionItem = v32;

        brandStoreActionItem = self->_brandStoreActionItem;
      }
      [v4 addObject:brandStoreActionItem];
    }
  }
  else
  {
  }
  if (v6 == 2)
  {
    v35 = +[MKPlaceCardActionItem actionItemWithType:29 actionDataProvider:self enabled:1];
    [v4 addObject:v35];
    v36 = (void *)MEMORY[0x1E4F64670];
    v37 = [(MKPlaceActionManager *)self mapItem];
    v38 = [v37 _geoMapItem];
    [v38 coordinate];
    if (objc_msgSend(v36, "isLocationShiftRequiredForCoordinate:"))
    {
      BOOL v39 = 0;
    }
    else
    {
      v40 = [(MKPlaceActionManager *)self mapItem];
      v41 = [v40 _geoMapItem];
      BOOL v39 = [v41 referenceFrame] != 2;
    }
    v42 = [(MKPlaceActionManager *)self mapItem];
    [v42 _coordinate];
    double v44 = v43;
    double v46 = v45;

    if (v46 >= -180.0 && v46 <= 180.0 && v44 >= -90.0 && v44 <= 90.0 && v39)
    {
      v47 = +[MKPlaceCardActionItem actionItemWithType:27 actionDataProvider:self enabled:1];
      [v4 addObject:v47];
    }
  }
  v48 = (void *)[v4 copy];

  return v48;
}

- (void)_enableStoreAction
{
}

- (id)createSearchAlongRouteActions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([(MKPlaceActionManager *)self _canShowCallAction]
    && ([(MKPlaceActionManager *)self callActionItem],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    char v4 = [(MKPlaceActionManager *)self callActionItem];
    v7[0] = v4;
    char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    char v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (void)addLayoutInfoIfNeeded:(id)a3
{
  id v12 = a3;
  if (GEOConfigGetBOOL())
  {
    if (GEOConfigGetBOOL())
    {
      char v4 = [(MKPlaceActionManager *)self mapItem];
      char v5 = [v4 _placecardLayout];

      if (v5)
      {
        int v6 = [MKPlaceCardActionItem alloc];
        BOOL v7 = [(MKPlaceActionManager *)self mapItem];
        v8 = [v7 _placecardLayout];
        char v9 = [v8 debugName];
        BOOL v10 = [(MKPlaceCardActionItem *)v6 initWithType:0 displayString:v9 glyph:0 enabled:0];

        int v11 = [MEMORY[0x1E4F428B8] lightGrayColor];
        [(MKPlaceCardActionItem *)v10 setGlyphColor:v11];

        [v12 addObject:v10];
      }
    }
  }
}

- (id)createFooterActions
{
  BOOL v3 = [(MKPlaceActionManager *)self mapItem];
  int v4 = [v3 _placeDisplayStyle];

  if (v4 == 2)
  {
    char v5 = [(MKPlaceActionManager *)self shortPlacecardFooterActions];
  }
  else
  {
    int v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:6];
    if (!self->_isCurrentLocation)
    {
      if ([(MKPlaceActionManager *)self _showHomeShortcutItem])
      {
        v14 = [(MKPlaceActionManager *)self homeActionItem];
        [v6 addObject:v14];
      }
      if (([(MKPlaceActionManager *)self options] & 0x80000) != 0)
      {
        v15 = +[MKPlaceCardActionItem actionItemWithType:25 actionDataProvider:self enabled:1];
        [v6 addObject:v15];
      }
      if (([(MKPlaceActionManager *)self options] & 0x40000) != 0)
      {
        v16 = +[MKPlaceCardActionItem actionItemWithType:24 actionDataProvider:self enabled:1];
        [v6 addObject:v16];
      }
      v17 = [MEMORY[0x1E4F64500] sharedConfiguration];
      v18 = [v17 countryCode];
      int v19 = [v18 isEqualToString:@"KR"];

      if ((([(MKPlaceActionManager *)self options] & 0x80000) != 0
         || ([(MKPlaceActionManager *)self options] & 0x40000) != 0)
        && ((_MKRAPIsAvailable() ^ 1 | v19) & 1) == 0)
      {
        v20 = [(MKPlaceActionManager *)self reportAProblemFooterAction];
        [v6 addObject:v20];
      }
    }
    BOOL v7 = [(MKPlaceActionManager *)self createContactActions];
    if ([v7 count]) {
      [v6 addObjectsFromArray:v7];
    }
    if ([(MKPlaceActionManager *)self _showAddPlaceFooterAction])
    {
      v8 = [(MKPlaceActionManager *)self reportAProblemAddPlaceFooterAction];
      [v6 addObject:v8];
    }
    if ([(MKPlaceActionManager *)self _canShowCreateCustomRouteAction])
    {
      char v9 = [(MKPlaceActionManager *)self createCustomRouteActionItem];

      if (v9)
      {
        BOOL v10 = [(MKPlaceActionManager *)self createCustomRouteActionItem];
        [v6 addObject:v10];
      }
    }
    if ([(MKPlaceActionManager *)self _showReportAProblemFooterAction])
    {
      int v11 = [(MKPlaceActionManager *)self reportAProblemFooterAction];
      [v6 addObject:v11];
    }
    if ([(MKPlaceActionManager *)self _canShowClaimThisBusiness])
    {
      id v12 = [(MKPlaceActionManager *)self claimBusinessActionItem];
      [v6 addObject:v12];
    }
    [(MKPlaceActionManager *)self _addInternalOnlyActions:v6];
    char v5 = (void *)[v6 copy];
  }

  return v5;
}

- (id)createContactActions
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  if ([(MKPlaceActionManager *)self showContactActions])
  {
    int v4 = +[MKPlaceCardActionItem actionItemWithType:4 actionDataProvider:self enabled:1];
    [v3 addObject:v4];
    char v5 = +[MKPlaceCardActionItem actionItemWithType:18 actionDataProvider:self enabled:1];
    [v3 addObject:v5];
  }
  int v6 = (void *)[v3 copy];

  return v6;
}

- (MKPlaceCardActionItem)claimBusinessActionItem
{
  return +[MKPlaceCardActionItem actionItemWithType:31 actionDataProvider:self enabled:1];
}

- (MKPlaceCardActionItem)flyoverActionItem
{
  BOOL v3 = [(MKPlaceActionManager *)self placeItem];
  int v4 = [v3 mapItem];
  char v5 = [v4 _flyover];

  if (v5 && ([(MKPlaceActionManager *)self options] & 0x20000000) != 0)
  {
    int v6 = +[MKPlaceCardActionItem actionItemWithType:17 actionDataProvider:self enabled:1];
  }
  else
  {
    int v6 = 0;
  }

  return (MKPlaceCardActionItem *)v6;
}

- (MKPlaceCardActionItem)messageActionItem
{
  if ([(MKPlaceActionDataProvider *)self->_dataProvider supportsMessagesForBusiness])
  {
    BOOL v3 = +[MKPlaceCardActionItem actionItemWithType:11 actionDataProvider:self enabled:1];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (MKPlaceCardActionItem *)v3;
}

- (MKPlaceCardActionItem)shareActionItem
{
  return +[MKPlaceCardActionItem actionItemWithType:16 actionDataProvider:self enabled:1];
}

- (MKPlaceCardActionItem)collectionActionItem
{
  if ([(MKPlaceActionManager *)self _showCollectionItem])
  {
    collectionActionItem = self->_collectionActionItem;
    if (!collectionActionItem)
    {
      int v4 = +[MKPlaceCardActionItem actionItemWithType:21 actionDataProvider:self enabled:1];
      char v5 = self->_collectionActionItem;
      self->_collectionActionItem = v4;

      [(MKPlaceCardActionItem *)self->_collectionActionItem setSelected:self->_placeInCollections];
      collectionActionItem = self->_collectionActionItem;
    }
    int v6 = collectionActionItem;
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (BOOL)_canShowClaimThisBusiness
{
  if (([(MKPlaceActionManager *)self options] & 0x1000000000000) != 0) {
    return 0;
  }
  BOOL v3 = [(MKPlaceActionManager *)self mapItem];
  char v4 = [v3 _canBeClaimed];

  return v4;
}

- (BOOL)_canShowCallAction
{
  return [(MKPlaceActionDataProvider *)self->_dataProvider canShowCallAction];
}

- (void)_addInternalOnlyActions:(id)a3
{
  id v8 = a3;
  if (([(MKPlaceActionManager *)self options] & 0x2000) != 0)
  {
    char v4 = +[MKPlaceCardActionItem actionItemWithType:42 actionDataProvider:self enabled:1];
    [v8 addObject:v4];
  }
  [(MKPlaceActionManager *)self addLayoutInfoIfNeeded:v8];
  if ([(MKPlaceActionManager *)self _showMapItemIdentifier])
  {
    char v5 = +[MKPlaceCardActionItem actionItemWithType:43 actionDataProvider:self enabled:1];
    [v8 addObject:v5];
  }
  if (GEOConfigGetBOOL())
  {
    int v6 = +[MKPlaceCardActionItem actionItemWithType:44 actionDataProvider:self enabled:1];
    [v8 addObject:v6];
    BOOL v7 = +[MKPlaceCardActionItem actionItemWithType:45 actionDataProvider:self enabled:1];
    [v8 addObject:v7];
  }
}

- (MKPlaceCardActionItem)homeActionItem
{
  homeActionItem = self->_homeActionItem;
  if (!homeActionItem)
  {
    char v4 = [(MKPlaceActionManager *)self addToHomeItem];
    char v5 = self->_homeActionItem;
    self->_homeActionItem = v4;

    homeActionItem = self->_homeActionItem;
  }

  return homeActionItem;
}

- (MKPlaceCardActionItem)favoriteActionItem
{
  favoriteActionItem = self->_favoriteActionItem;
  if (!favoriteActionItem)
  {
    char v4 = [(MKPlaceActionManager *)self favoriteItemForFooter];
    char v5 = self->_favoriteActionItem;
    self->_favoriteActionItem = v4;

    favoriteActionItem = self->_favoriteActionItem;
  }

  return favoriteActionItem;
}

- (MKPlaceCardActionItem)libraryActionItem
{
  if ([(MKPlaceActionManager *)self _canShowLibraryAction])
  {
    libraryActionItem = self->_libraryActionItem;
    if (!libraryActionItem)
    {
      char v4 = +[MKPlaceCardActionItem actionItemWithType:37 actionDataProvider:self enabled:1];
      char v5 = self->_libraryActionItem;
      self->_libraryActionItem = v4;

      int v6 = +[MKPlaceCardActionItem actionItemWithType:38 actionDataProvider:self enabled:1];
      BOOL v7 = [MEMORY[0x1E4F428B8] systemRedColor];
      [v6 setGlyphColor:v7];

      [(MKPlaceCardActionItem *)self->_libraryActionItem setSelectedItem:v6];
      libraryActionItem = self->_libraryActionItem;
    }
    [(MKPlaceCardActionItem *)libraryActionItem setSelected:self->_placeInLibrary == 1];
    id v8 = self->_libraryActionItem;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (MKPlaceCardActionItem)noteActionItem
{
  if ([(MKPlaceActionManager *)self _canShowAddOrEditNoteAction])
  {
    noteActionItem = self->_noteActionItem;
    if (!noteActionItem)
    {
      char v4 = +[MKPlaceCardActionItem actionItemWithType:40 actionDataProvider:self enabled:1];
      char v5 = +[MKPlaceCardActionItem actionItemWithType:39 actionDataProvider:self enabled:1];
      [(MKPlaceCardActionItem *)v5 setSelectedItem:v4];
      int v6 = self->_noteActionItem;
      self->_noteActionItem = v5;

      noteActionItem = self->_noteActionItem;
    }
    [(MKPlaceCardActionItem *)noteActionItem setSelected:self->_placeHasNote == 1];
    BOOL v7 = self->_noteActionItem;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)createCustomRouteActionItem
{
  if ([(MKPlaceActionManager *)self _canShowCreateCustomRouteAction])
  {
    createCustomRouteActionItem = self->_createCustomRouteActionItem;
    if (!createCustomRouteActionItem)
    {
      char v4 = +[MKPlaceCardActionItem actionItemWithType:41];
      char v5 = self->_createCustomRouteActionItem;
      self->_createCustomRouteActionItem = v4;

      createCustomRouteActionItem = self->_createCustomRouteActionItem;
    }
    int v6 = createCustomRouteActionItem;
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)shortPlacecardFooterActions
{
  if ([(MKPlaceActionManager *)self _showReportAProblemFooterAction])
  {
    BOOL v3 = [MEMORY[0x1E4F1CA48] array];
    char v4 = [(MKPlaceActionManager *)self reportAProblemFooterAction];
    [v3 addObject:v4];

    [(MKPlaceActionManager *)self addLayoutInfoIfNeeded:v3];
    char v5 = (void *)[v3 copy];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (MKPlaceCardActionItem)reportAProblemFooterAction
{
  uint64_t v3 = _MKRAPIsAvailable();

  return +[MKPlaceCardActionItem actionItemWithType:1 actionDataProvider:self enabled:v3];
}

- (MKPlaceCardActionItem)reportAProblemAddPlaceFooterAction
{
  uint64_t v3 = _MKRAPIsAvailable();

  return +[MKPlaceCardActionItem actionItemWithType:2 actionDataProvider:self enabled:v3];
}

- (id)developerPlaceCardGetDirectionsFooterAction
{
  v2 = _MKLocalizedStringFromThisBundle(@"[Developer Place Card] Get Directions");
  uint64_t v3 = [[MKPlaceCardActionItem alloc] initWithType:30 displayString:v2 glyph:@"arrow.triangle.turn.up.right.circle.fill" enabled:1];

  return v3;
}

- (id)developerPlaceCardOpenInMapsFooterAction
{
  v2 = _MKLocalizedStringFromThisBundle(@"[Developer Place Card] Open in Apple Maps");
  uint64_t v3 = [[MKPlaceCardActionItem alloc] initWithType:15 displayString:v2 glyph:@"map.fill" enabled:1];

  return v3;
}

- (void)_launchMaps
{
  id v2 = [(MKPlaceActionManager *)self mapItem];
  [v2 openInMapsWithLaunchOptions:0 completionHandler:&__block_literal_global_46];
}

void __35__MKPlaceActionManager__launchMaps__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v3 = [v4 bundleIdentifier];
    NSLog(&cfstr_CouldnTLaunchM.isa, v3);
  }
}

- (void)_canMakeCalls:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__MKPlaceActionManager__canMakeCalls___block_invoke;
    block[3] = &unk_1E54B82E8;
    id v6 = v3;
    dispatch_async(v4, block);
  }
}

void __38__MKPlaceActionManager__canMakeCalls___block_invoke(uint64_t a1)
{
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2050000000;
  uint64_t v2 = (void *)_MergedGlobals_148;
  uint64_t v21 = _MergedGlobals_148;
  if (!_MergedGlobals_148)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __getTUCallCapabilitiesClass_block_invoke;
    v16 = &unk_1E54B8448;
    v17 = &v18;
    __getTUCallCapabilitiesClass_block_invoke((uint64_t)&v13);
    uint64_t v2 = (void *)v19[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v18, 8);
  if ([v3 supportsTelephonyCalls])
  {
    uint64_t v18 = 0;
    int v19 = &v18;
    uint64_t v20 = 0x2050000000;
    id v4 = (void *)qword_1EB315E20;
    uint64_t v21 = qword_1EB315E20;
    if (!qword_1EB315E20)
    {
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __getTUCallProviderManagerClass_block_invoke;
      v16 = &unk_1E54B8448;
      v17 = &v18;
      __getTUCallProviderManagerClass_block_invoke((uint64_t)&v13);
      id v4 = (void *)v19[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v18, 8);
    id v6 = objc_alloc_init((Class)v5);
    BOOL v7 = [v6 defaultProvider];
  }
  else
  {
    BOOL v7 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MKPlaceActionManager__canMakeCalls___block_invoke_2;
  block[3] = &unk_1E54B8360;
  id v8 = *(id *)(a1 + 32);
  id v11 = v7;
  id v12 = v8;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __38__MKPlaceActionManager__canMakeCalls___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)_isCurrentLocationOrDroppedPin
{
  id v3 = [(MKPlaceActionManager *)self placeItem];
  if (([v3 options] & 2) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    id v4 = [(MKPlaceActionManager *)self placeItem];
    BOOL v5 = [v4 options] & 1;
  }
  return v5;
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
  v166[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(void))a5;
  id v11 = [[MKPlaceActionEnvironment alloc] initWithOptions:v9];
  id v12 = [(MKPlaceActionEnvironment *)v11 analyticsModuleMetadata];
  uint64_t v13 = [(MKPlaceActionEnvironment *)v11 isQuickAction];
  if (v13) {
    uint64_t v14 = 30;
  }
  else {
    uint64_t v14 = 201;
  }
  switch([v8 type])
  {
    case 1:
      v15 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v15 infoCardAnalyticsDidSelectAction:5013 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:62 actionRichProviderId:0];

      v16 = [v9 objectForKeyedSubscript:@"view"];
      v17 = [(MKPlaceActionManager *)self delegate];
      [v17 placeCardActionControllerDidSelectReportAProblem:0 fromView:v16 isQuickAction:v13];
      goto LABEL_71;
    case 2:
      uint64_t v18 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v18 infoCardAnalyticsDidSelectAction:222 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:62 actionRichProviderId:0];

      int v19 = [(MKPlaceActionManager *)self delegate];
      [v19 placeCardActionControllerDidSelectReportAProblemAddNewPlace:0 isQuickAction:v13];
      goto LABEL_69;
    case 3:
      uint64_t v20 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v20 infoCardAnalyticsDidSelectAction:290 target:v14 eventValue:@"Unresolved" moduleMetadata:v12 feedbackDelegateSelector:62 actionRichProviderId:0];

      int v19 = [(MKPlaceActionManager *)self delegate];
      [v19 placeCardActionControllerDidSelectReportAProblemViewReport:0];
      goto LABEL_69;
    case 4:
      uint64_t v21 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v21 infoCardAnalyticsDidSelectAction:6016 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:5 actionRichProviderId:0];

      v16 = [(MKPlaceActionManager *)self delegate];
      [v16 placeActionManager:self didSelectAddToContactsUsingEnvironment:v11];
      goto LABEL_72;
    case 7:
      v22 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v22 infoCardAnalyticsDidSelectAction:0 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:0 actionRichProviderId:0];

      [(MKPlaceActionManager *)self openURL:v8];
      goto LABEL_73;
    case 8:
      BOOL v23 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v23 infoCardAnalyticsDidSelectAction:6023 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:0 actionRichProviderId:0];

      int v19 = [(MKPlaceActionManager *)self delegate];
      [v19 placeCardActionControllerDidSelectViewAllPhotos:0 presentingViewController:0];
      goto LABEL_69;
    case 9:
      v24 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v24 infoCardAnalyticsDidSelectAction:6025 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:174 actionRichProviderId:0];

      v16 = [v9 objectForKeyedSubscript:@"view"];
      v17 = [(MKPlaceActionManager *)self delegate];
      [v17 placeCardActionControllerDidSelectAddPhoto:0 presentingViewController:0 sourceView:v16];
      goto LABEL_71;
    case 10:
      char v25 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v25 infoCardAnalyticsDidSelectAction:6009 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:2 actionRichProviderId:0];

      if (!self->_callProvider) {
        goto LABEL_73;
      }
      int v26 = [v9 objectForKeyedSubscript:@"CNLabeledValue"];
      v27 = v26;
      if (v26)
      {
        id v28 = v26;
      }
      else
      {
        v131 = [(MKPlaceActionManager *)self contact];
        v132 = [v131 phoneNumbers];
        id v28 = [v132 objectAtIndexedSubscript:0];
      }
      id v164 = v28;

      v160 = [v28 value];
      v133 = (void *)[objc_alloc((Class)getTUDialRequestClass()) initWithProvider:self->_callProvider];
      id v134 = objc_alloc((Class)getTUHandleClass());
      v135 = [v160 stringValue];
      v136 = mk_TUConvertDestinationIDToLatinNumbers(v135);
      v137 = (void *)[v134 initWithType:2 value:v136];

      [v133 setHandle:v137];
      [v133 setShowUIPrompt:1];
      v138 = [(MKPlaceActionManager *)self contact];
      v139 = [v138 identifier];
      [v133 setContactIdentifier:v139];

      v140 = +[MKSystemController sharedInstance];
      [v140 placeDialRequest:v133 completionHandler:0];

LABEL_86:
      goto LABEL_73;
    case 11:
      v29 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v29 infoCardAnalyticsDidSelectAction:6045 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:0 actionRichProviderId:0];

      char v30 = [(MKPlaceActionManager *)self mapItem];
      v31 = [v30 _messageURLString];

      if (!v31) {
        goto LABEL_73;
      }
      int v19 = [(MKPlaceActionManager *)self mapItem];
      v32 = [v19 _messageURLString];
      v166[0] = v32;
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v166 count:1];
      +[MKAppLaunchController launchAttributionURLs:v33 withAttribution:0 completionHandler:0];

      goto LABEL_69;
    case 12:
      [v9 objectForKeyedSubscript:@"CNLabeledValue"];
      v34 = v163 = v12;
      v35 = (void *)MEMORY[0x1E4F1CB10];
      v36 = NSString;
      v37 = [v34 value];
      v38 = [v36 stringWithFormat:@"mailto:%@", v37];
      BOOL v39 = [v35 URLWithString:v38];

      v40 = v34;
      id v12 = v163;
      goto LABEL_89;
    case 13:
      v41 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v41 infoCardAnalyticsDidSelectAction:6010 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:3 actionRichProviderId:0];

      v42 = [v9 objectForKeyedSubscript:@"CNLabeledValue"];
      double v43 = v42;
      if (v42)
      {
        id v164 = v42;
      }
      else
      {
        v121 = [(MKPlaceActionManager *)self contact];
        v122 = [v121 urlAddresses];
        id v164 = [v122 objectAtIndexedSubscript:0];
      }
      v123 = [(MKPlaceActionManager *)self delegate];
      v124 = [v123 placeViewControllerDelegate];
      char v125 = objc_opt_respondsToSelector();

      if (v125)
      {
        v126 = [(MKPlaceActionManager *)self delegate];
        v127 = [v126 placeViewControllerDelegate];
        v128 = [(MKPlaceActionManager *)self delegate];
        char v129 = [v127 placeViewController:v128 shouldOpenHomePage:v164];

        if ((v129 & 1) == 0) {
          goto LABEL_86;
        }
      }
      v130 = (void *)MEMORY[0x1E4F1CB10];
      v40 = v164;
      v37 = [v164 value];
      BOOL v39 = [v130 URLWithString:v37];
      goto LABEL_89;
    case 14:
      double v44 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v44 infoCardAnalyticsDidSelectAction:6008 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:201 actionRichProviderId:0];

      double v45 = [(MKPlaceActionManager *)self delegate];
      double v46 = [v45 placeViewControllerDelegate];
      char v47 = objc_opt_respondsToSelector();

      if (v47)
      {
        v16 = [(MKPlaceActionManager *)self delegate];
        v48 = [v16 placeViewControllerDelegate];
        v49 = [(MKPlaceActionManager *)self delegate];
        [v48 placeViewControllerDidSelectDisplayedAddress:v49];
LABEL_38:

LABEL_72:
      }
      else
      {
        v116 = [(MKPlaceActionManager *)self mapItem];
        char v117 = [v116 _isEmptyContactMapItem];

        if (v117)
        {
          v118 = [v9 objectForKeyedSubscript:@"CNLabeledValue"];
          v119 = v118;
          if (v118)
          {
            id v120 = v118;
          }
          else
          {
            v141 = [(MKPlaceActionManager *)self contact];
            v142 = [v141 urlAddresses];
            id v120 = [v142 objectAtIndexedSubscript:0];
          }
          v165 = v120;

          v37 = [v120 value];
          v161 = (void *)MEMORY[0x1E4F1B970];
          v143 = [(MKPlaceActionManager *)self contact];
          uint64_t v144 = *MEMORY[0x1E4F1B7B8];
          v145 = [v165 identifier];
          v159 = [v161 contactPropertyWithContactNoCopy:v143 propertyKey:v144 identifier:v145];

          v146 = [MEMORY[0x1E4F1BA88] singleLineStringFromPostalAddress:v37 addCountryName:0];
          v147 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
          v162 = [v146 stringByAddingPercentEncodingWithAllowedCharacters:v147];

          v157 = (void *)MEMORY[0x1E4F1CB10];
          v155 = NSString;
          v158 = [(MKPlaceActionManager *)self contact];
          uint64_t v153 = [v158 iOSLegacyIdentifier];
          uint64_t v148 = [v159 multiValueIdentifier];
          v156 = [(MKPlaceActionManager *)self contact];
          v154 = [v156 identifier];
          v149 = [v165 identifier];
          v150 = [v155 stringWithFormat:@"maps:?address=%@&abPersonID=%d&abAddressID=%d&cncontactidentifier=%@&cnaddressidentifier=%@", v162, v153, v148, v154, v149];
          BOOL v39 = [v157 URLWithString:v150];

          v40 = v165;
LABEL_89:

          if (v39)
          {
            v151 = [v9 objectForKeyedSubscript:@"view"];
            v152 = [(MKPlaceActionManager *)self placeCardDelegate];
            [v152 placeCardActionController:0 openURL:v39 fromView:v151];
          }
        }
        else
        {
LABEL_79:
          [(MKPlaceActionManager *)self _launchMaps];
        }
      }
LABEL_73:
      if (v10) {
        v10[2](v10);
      }

      return;
    case 15:
      v50 = [(MKPlaceActionManager *)self mapItem];
      char v51 = [v50 _isEmptyContactMapItem];

      if ((v51 & 1) == 0) {
        goto LABEL_79;
      }
      goto LABEL_73;
    case 16:
      v52 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v52 infoCardAnalyticsDidSelectAction:6013 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:6 actionRichProviderId:0];

      goto LABEL_25;
    case 17:
      v53 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v53 infoCardAnalyticsDidSelectAction:6004 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:127 actionRichProviderId:0];

      v16 = [(MKPlaceActionManager *)self delegate];
      v48 = [v16 placeViewControllerDelegate];
      v49 = [(MKPlaceActionManager *)self delegate];
      [v48 placeViewControllerDidSelectFlyover:v49];
      goto LABEL_38;
    case 18:
      v54 = [(MKPlaceActionManager *)self delegate];
      char v55 = objc_opt_respondsToSelector();

      if ((v55 & 1) == 0) {
        goto LABEL_73;
      }
      v56 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v56 infoCardAnalyticsDidSelectAction:6016 target:v14 eventValue:@"Add to Existing Contact" moduleMetadata:v12 feedbackDelegateSelector:124 actionRichProviderId:0];

      v16 = [(MKPlaceActionManager *)self delegate];
      [v16 placeActionManager:self didSelectAddToExistingContactWithEnvironment:v11];
      goto LABEL_72;
    case 19:
      v57 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v57 infoCardAnalyticsDidSelectAction:6005 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:0 actionRichProviderId:0];

      int v19 = [(MKPlaceActionManager *)self delegate];
      [v19 placeCardActionControllerDidSelectRemoveMarker:0];
      goto LABEL_69;
    case 20:
      v58 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v58 infoCardAnalyticsDidSelectAction:6046 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:0 actionRichProviderId:0];

      int v19 = [(MKPlaceActionManager *)self mapItem];
      [v19 _launchActivityForBrandItem];
      goto LABEL_69;
    case 21:
      v59 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v59 infoCardAnalyticsDidSelectAction:0 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:0 actionRichProviderId:0];

      v16 = [(MKPlaceActionManager *)self delegate];
      [v16 placeActionManager:self didSelectAddToGuidesWithEnvironment:v11];
      goto LABEL_72;
    case 22:
      v60 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v60 infoCardAnalyticsDidSelectAction:2059 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:0 actionRichProviderId:0];

      v61 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v61 infoCardAnalyticsDidSelectAction:17099 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:0 actionRichProviderId:0];

      int v19 = [(MKPlaceActionManager *)self delegate];
      [v19 placeCardActionControllerDidSelectAddToMapsHome:0];
      goto LABEL_69;
    case 23:
      v62 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v62 infoCardAnalyticsDidSelectAction:2060 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:0 actionRichProviderId:0];

      v63 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v63 infoCardAnalyticsDidSelectAction:17099 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:0 actionRichProviderId:0];

      int v19 = [(MKPlaceActionManager *)self delegate];
      [v19 placeCardActionControllerDidSelectRemoveFromMapsHome:0];
      goto LABEL_69;
    case 24:
      v64 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v64 infoCardAnalyticsDidSelectAction:2063 target:253 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:0 actionRichProviderId:0];

      int v19 = [(MKPlaceActionManager *)self delegate];
      [v19 placeCardActionControllerDidSelectRefineLocation:0];
      goto LABEL_69;
    case 25:
      int v19 = [(MKPlaceActionManager *)self delegate];
      [v19 placeCardActionControllerDidSelectChangeAddress:0];
      goto LABEL_69;
    case 27:
      v65 = NSString;
      v66 = [(MKPlaceActionManager *)self mapItem];
      [v66 _coordinate];
      uint64_t v68 = v67;
      v69 = [(MKPlaceActionManager *)self mapItem];
      [v69 _coordinate];
      v16 = [v65 stringWithFormat:@"%.6lf, %.6lf", v68, v70];

      v17 = [MEMORY[0x1E4F42C50] generalPasteboard];
      [v17 setString:v16];
      goto LABEL_71;
    case 28:
      v71 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v71 infoCardAnalyticsDidSelectAction:1030 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:0 actionRichProviderId:0];

      v16 = [(MKPlaceActionManager *)self delegate];
      v48 = [v16 placeViewControllerDelegate];
      v49 = [(MKPlaceActionManager *)self delegate];
      [v48 placeViewControllerDidSelectDropPin:v49];
      goto LABEL_38;
    case 30:
      v16 = [(MKPlaceActionManager *)self delegate];
      [v16 placeActionManager:self didSelectDirectionsWithEnvironment:v11];
      goto LABEL_72;
    case 31:
      v72 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v72 infoCardAnalyticsDidSelectAction:288 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:0 actionRichProviderId:0];

      v73 = [(MKPlaceActionManager *)self mapItem];
      v74 = [v73 _poiClaim];
      int v19 = [v74 claimURL];

      if (!v19) {
        goto LABEL_69;
      }
      v75 = +[MKSystemController sharedInstance];
      [v75 openURL:v19 completionHandler:0];
      goto LABEL_68;
    case 32:
      v76 = [(MKPlaceActionManager *)self analyticsDelegate];
      v77 = NSString;
      v78 = [(MKPlaceActionManager *)self mapItem];
      v79 = objc_msgSend(v77, "stringWithFormat:", @"%llu", objc_msgSend(v78, "_muid"));
      [v76 infoCardAnalyticsDidSelectAction:282 target:v14 eventValue:v79 moduleMetadata:v12 feedbackDelegateSelector:62 actionRichProviderId:0];

      int v19 = [(MKPlaceActionManager *)self delegate];
      [v19 placeCardActionControllerDidSelectPlaceEnrichementReportAProblem];
      goto LABEL_69;
    case 33:
LABEL_25:
      v16 = [(MKPlaceActionManager *)self delegate];
      [v16 placeActionManager:self didSelectShareWithEnvironment:v11];
      goto LABEL_72;
    case 34:
      v80 = [(MKPlaceActionManager *)self placeItem];
      char v81 = [v80 options];

      if ((v81 & 8) != 0) {
        uint64_t v82 = 394;
      }
      else {
        uint64_t v82 = 381;
      }
      v83 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v83 infoCardAnalyticsDidSelectAction:v82 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:0 actionRichProviderId:0];

      int v19 = [(MKPlaceActionManager *)self delegate];
      [v19 placeCardActionControllerDidSelectDownloadOffline:0 isQuickAction:v13];
      goto LABEL_69;
    case 35:
      v84 = [(MKPlaceActionManager *)self placeItem];
      char v85 = [v84 options];

      if ((v85 & 8) != 0) {
        uint64_t v86 = 394;
      }
      else {
        uint64_t v86 = 381;
      }
      v87 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v87 infoCardAnalyticsDidSelectAction:v86 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:0 actionRichProviderId:0];

      int v19 = [(MKPlaceActionManager *)self delegate];
      [v19 placeCardActionControllerDidSelectPauseOfflineDownload:0];
      goto LABEL_69;
    case 36:
      v88 = [(MKPlaceActionManager *)self placeItem];
      char v89 = [v88 options];

      if ((v89 & 8) != 0) {
        uint64_t v90 = 394;
      }
      else {
        uint64_t v90 = 381;
      }
      v91 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v91 infoCardAnalyticsDidSelectAction:v90 target:v14 eventValue:0 moduleMetadata:v12 feedbackDelegateSelector:0 actionRichProviderId:0];

      int v19 = [(MKPlaceActionManager *)self delegate];
      [v19 placeCardActionControllerDidSelectOfflineManagement:0];
      goto LABEL_69;
    case 37:
      v92 = [(MKPlaceActionManager *)self delegate];
      v16 = v92;
      v93 = self;
      v94 = v11;
      uint64_t v95 = 1;
      goto LABEL_57;
    case 38:
      v92 = [(MKPlaceActionManager *)self delegate];
      v16 = v92;
      v93 = self;
      v94 = v11;
      uint64_t v95 = 0;
LABEL_57:
      [v92 placeActionManager:v93 didSelectAddOrRemoveFromLibraryWithEnvironment:v94 selectedAdd:v95];
      goto LABEL_72;
    case 39:
      v96 = [(MKPlaceActionManager *)self delegate];
      v16 = v96;
      v97 = self;
      v98 = v11;
      uint64_t v99 = 1;
      goto LABEL_60;
    case 40:
      v96 = [(MKPlaceActionManager *)self delegate];
      v16 = v96;
      v97 = self;
      v98 = v11;
      uint64_t v99 = 0;
LABEL_60:
      [v96 placeActionManager:v97 didSelectAddOrEditNoteWithEnvironment:v98 selectedAdd:v99];
      goto LABEL_72;
    case 41:
      v100 = [(MKPlaceActionManager *)self delegate];
      char v101 = objc_opt_respondsToSelector();

      if ((v101 & 1) == 0) {
        goto LABEL_73;
      }
      v102 = [(MKPlaceActionManager *)self analyticsDelegate];
      [v102 infoCardAnalyticsDidSelectAction:465 target:v14 eventValue:0 feedbackDelegateSelector:0 actionRichProviderId:0];

      int v19 = [(MKPlaceActionManager *)self delegate];
      [v19 placeCardActionControllerDidSelectCreateCustomRoute:0];
      goto LABEL_69;
    case 42:
      v103 = [(MKPlaceActionManager *)self delegate];
      char v104 = objc_opt_respondsToSelector();

      if ((v104 & 1) == 0) {
        goto LABEL_73;
      }
      int v19 = [(MKPlaceActionManager *)self delegate];
      [v19 placeCardActionControllerDidSelectSimulateLocation:0];
LABEL_69:

      goto LABEL_73;
    case 43:
      v105 = [(MKPlaceActionManager *)self mapItem];
      uint64_t v106 = [v105 _muid];

      if (!v106) {
        goto LABEL_73;
      }
      v16 = [MEMORY[0x1E4F42C50] generalPasteboard];
      v107 = NSString;
      v17 = [(MKPlaceActionManager *)self mapItem];
      v108 = objc_msgSend(v107, "stringWithFormat:", @"%llu", objc_msgSend(v17, "_muid"));
      [v16 setString:v108];

LABEL_71:
      goto LABEL_72;
    case 44:
      v109 = (void *)MEMORY[0x1E4F646E0];
      v110 = [(MKPlaceActionManager *)self mapItem];
      v111 = [v110 _geoMapItem];
      int v19 = [v109 mapItemStorageForGEOMapItem:v111];

      v75 = [v19 jsonRepresentation];
      v112 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v75 options:1 error:0];
      v113 = NSTemporaryDirectory();
      v114 = [v113 stringByAppendingPathComponent:@"SavedMapItem.json"];

      [v112 writeToFile:v114 options:0 error:0];
LABEL_68:

      goto LABEL_69;
    case 45:
      v115 = NSTemporaryDirectory();
      v16 = [v115 stringByAppendingPathComponent:@"SavedMapItem.json"];

      v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v17 removeItemAtPath:v16 error:0];
      goto LABEL_71;
    default:
      goto LABEL_73;
  }
}

- (MKPlaceCardActionItem)removeMarkerItem
{
  id v3 = +[MKSystemController sharedInstance];
  int v4 = [v3 userInterfaceIdiom];

  BOOL v5 = +[MKPlaceCardActionItem actionItemWithType:19 actionDataProvider:self enabled:1];
  if (v4 != 2)
  {
    id v6 = [MEMORY[0x1E4F428B8] systemRedColor];
    [v5 setGlyphColor:v6];
  }

  return (MKPlaceCardActionItem *)v5;
}

- (BOOL)placeInBookmarks
{
  return self->_placeInBookmarks;
}

- (BOOL)placeInCollections
{
  return self->_placeInCollections;
}

- (BOOL)placeInShortcuts
{
  return self->_placeInShortcuts;
}

- (void)setShowContactActions:(BOOL)a3
{
  self->_showContactActions = a3;
}

- (BOOL)isCurrentLocation
{
  return self->_isCurrentLocation;
}

- (void)setIsCurrentLocation:(BOOL)a3
{
  self->_isCurrentLocation = a3;
}

- (unint64_t)placeInLibrary
{
  return self->_placeInLibrary;
}

- (unint64_t)placeHasNote
{
  return self->_placeHasNote;
}

- (id)placeCardDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_placeCardDelegate);

  return WeakRetained;
}

- (void)setPlaceCardDelegate:(id)a3
{
}

- (_MKInfoCardAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  return (_MKInfoCardAnalyticsDelegate *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (MKPlaceActionDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (MKPlaceCardActionItem)deleteFromLibraryActionItem
{
  return self->_deleteFromLibraryActionItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteFromLibraryActionItem, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak(&self->_placeCardDelegate);
  objc_storeStrong((id *)&self->_callProvider, 0);
  objc_storeStrong((id *)&self->_createCustomRouteActionItem, 0);
  objc_storeStrong((id *)&self->_noteActionItem, 0);
  objc_storeStrong((id *)&self->_libraryActionItem, 0);
  objc_storeStrong((id *)&self->_brandStoreActionItem, 0);
  objc_storeStrong((id *)&self->_websiteActionItem, 0);
  objc_storeStrong((id *)&self->_callActionItem, 0);
  objc_storeStrong((id *)&self->_collectionActionItem, 0);
  objc_storeStrong((id *)&self->_homeActionItem, 0);

  objc_storeStrong((id *)&self->_favoriteActionItem, 0);
}

@end