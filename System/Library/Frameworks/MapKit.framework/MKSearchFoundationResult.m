@interface MKSearchFoundationResult
+ (id)styledStringFromStringArray:(id)a3;
- (BOOL)_isSmallerScreen;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)optionSmallerScreen;
- (MKLocationManager)locationManager;
- (MKMapItem)mapItem;
- (MKSearchFoundationBusinessHoursAndDistanceRichText)thirdLineDisplayedText;
- (MKSearchFoundationResult)initWithMapsData:(id)a3 iconSize:(unint64_t)a4 bundleID:(id)a5;
- (MKSearchFoundationRichText)fourthLineDisplayedText;
- (MKSearchFoundationRichText)secondLineDisplayedText;
- (NSBundle)bundle;
- (NSData)mapsData;
- (NSMutableArray)thirdLineText;
- (NSString)bundleID;
- (id)_appleRatingsDescription;
- (id)_brandURL;
- (id)_businessAddress;
- (id)_businessCategory;
- (id)_businessHoursAndDistance;
- (id)_businessReviewText;
- (id)_defaultRichTextItems;
- (id)_populateAppClipData:(id)a3;
- (id)_populateButtonItem:(id)a3 imageName:(id)a4 command:(id)a5;
- (id)_populateButtonItemsAndCommands;
- (id)action;
- (id)attributionObserver;
- (id)descriptions;
- (id)thumbnail;
- (id)title;
- (unint64_t)iconSize;
- (unint64_t)mksfResultType;
- (void)_commonInit;
- (void)_locationApprovalDidChange;
- (void)dealloc;
- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)setAction:(id)a3;
- (void)setAttributionObserver:(id)a3;
- (void)setBundle:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setDescriptions:(id)a3;
- (void)setFourthLineDisplayedText:(id)a3;
- (void)setIconSize:(unint64_t)a3;
- (void)setLocationManager:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setMapsData:(id)a3;
- (void)setMksfResultType:(unint64_t)a3;
- (void)setOptionSmallerScreen:(BOOL)a3;
- (void)setSecondLineDisplayedText:(id)a3;
- (void)setThirdLineDisplayedText:(id)a3;
- (void)setThirdLineText:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MKSearchFoundationResult

- (MKSearchFoundationResult)initWithMapsData:(id)a3 iconSize:(unint64_t)a4 bundleID:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MKSearchFoundationResult;
  v11 = [(MKSearchFoundationResult *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mapsData, a3);
    uint64_t v13 = +[MKMapItem mapItemWithSerializedPlaceData:v9];
    mapItem = v12->_mapItem;
    v12->_mapItem = (MKMapItem *)v13;

    v12->_iconSize = a4;
    objc_storeStrong((id *)&v12->_bundleID, a5);
    [(MKSearchFoundationResult *)v12 _commonInit];
  }

  return v12;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:MKLocationManagerApprovalDidChangeNotification object:0];

  [(MKLocationManager *)self->_locationManager stopLocationUpdateWithObserver:self];
  if (self->_attributionObserver)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self->_attributionObserver];
  }
  v5.receiver = self;
  v5.super_class = (Class)MKSearchFoundationResult;
  [(MKSearchFoundationResult *)&v5 dealloc];
}

- (void)_commonInit
{
  v15[1] = *MEMORY[0x1E4F143B8];
  self->_optionSmallerScreen = [(MKSearchFoundationResult *)self _isSmallerScreen];
  BOOL v3 = [(MKMapItem *)self->_mapItem _hasMUID];
  unint64_t v4 = 1;
  if (!v3) {
    unint64_t v4 = 2;
  }
  self->_mksfResultType = v4;
  objc_super v5 = objc_opt_new();
  id v6 = [[MKSearchFoundationRichText alloc] initRichTextTitleWithMapItem:self->_mapItem resultsType:self->_mksfResultType];
  [v5 setTitle:v6];

  v7 = [(MKSearchFoundationResult *)self _defaultRichTextItems];
  [v5 setDescriptions:v7];

  if ([(MKMapItem *)self->_mapItem _isMapItemTypeBrand]) {
    [(MKSearchFoundationResult *)self _businessCategory];
  }
  else {
  v8 = [(MKSearchFoundationResult *)self _businessReviewText];
  }
  objc_storeStrong((id *)&self->_fourthLineDisplayedText, v8);

  [v5 setFootnote:self->_fourthLineDisplayedText];
  id v9 = [[MKSearchFoundationImage alloc] initIconWithSize:self->_iconSize mapItem:self->_mapItem];
  [v5 setThumbnail:v9];

  id v10 = +[MKSearchFoundationActionItem defaultActionItemDestinationMapItemData:self->_mapsData mapItem:self->_mapItem];
  [v5 setAction:v10];

  v11 = [(MKSearchFoundationResult *)self _populateButtonItemsAndCommands];
  [v5 setButtonItems:v11];

  v12 = objc_opt_new();
  [(MKSearchFoundationResult *)self setInlineCard:v12];

  v15[0] = v5;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v14 = [(MKSearchFoundationResult *)self inlineCard];
  [v14 setCardSections:v13];
}

- (id)_populateButtonItemsAndCommands
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v4 = [(MKMapItem *)self->_mapItem phoneNumber];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F99F18]);
    id v6 = [(MKMapItem *)self->_mapItem phoneNumber];
    [v5 setPhoneNumber:v6];

    v7 = [(MKSearchFoundationResult *)self _populateButtonItem:0 imageName:0 command:v5];
    [v3 addObject:v7];
  }
  if (self->_mapsData && [(MKMapItem *)self->_mapItem _canGetDirections])
  {
    v8 = _MKLocalizedStringFromThisBundle(@"Go");
    id v9 = objc_alloc_init(MEMORY[0x1E4F99ED8]);
    [v9 setMapsData:self->_mapsData];
    id v10 = [(MKSearchFoundationResult *)self _populateButtonItem:v8 imageName:@"arrow.triangle.turn.up.right.circle.fill" command:v9];
    [v3 addObject:v10];
  }
  v11 = [(MKMapItem *)self->_mapItem _messageURLString];

  if (v11)
  {
    v12 = _MKLocalizedStringFromThisBundle(@"Message");
    id v13 = objc_alloc_init(MEMORY[0x1E4F9A290]);
    v14 = (void *)MEMORY[0x1E4F9A2F8];
    v15 = (void *)MEMORY[0x1E4F1CB10];
    objc_super v16 = [(MKMapItem *)self->_mapItem _messageURLString];
    v17 = [v15 URLWithString:v16];
    v18 = [v14 punchoutWithURL:v17];
    [v13 setPunchout:v18];

    v19 = [(MKSearchFoundationResult *)self _populateButtonItem:v12 imageName:@"message.fill" command:v13];
    [v3 addObject:v19];
  }
  v20 = [(MKMapItem *)self->_mapItem _quickLinks];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    v22 = [(MKMapItem *)self->_mapItem _quickLinks];
    v23 = [(MKSearchFoundationResult *)self _populateAppClipData:v22];

    if (v23) {
      [v3 addObject:v23];
    }
  }
  v24 = MKGetMKSearchFoundationResultLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    int v26 = 134283521;
    uint64_t v27 = [v3 count];
    _os_log_impl(&dword_18BAEC000, v24, OS_LOG_TYPE_INFO, "Buttom items count: %{private}lu", (uint8_t *)&v26, 0xCu);
  }

  return v3;
}

- (id)_populateAppClipData:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MKGetMKSearchFoundationResultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134283521;
    uint64_t v36 = [v4 count];
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "Link count : %{private}ld", buf, 0xCu);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v29 = self;
    uint64_t v9 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v11 type] == 2)
        {
          v12 = [v11 bundleID];

          if (v12)
          {
            id v18 = objc_alloc_init(MEMORY[0x1E4F9A328]);
            v19 = (void *)MEMORY[0x1E4F1CB10];
            v20 = [v11 URLString];
            uint64_t v21 = [v19 URLWithString:v20];
            [v18 setUrl:v21];

            v22 = [v11 bundleID];
            [v18 setApplicationBundleIdentifier:v22];

            v23 = [v11 imageName];
            v24 = MKGetMKSearchFoundationResultLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              uint64_t v25 = [v11 type];
              *(_DWORD *)buf = 134283521;
              uint64_t v36 = v25;
              _os_log_impl(&dword_18BAEC000, v24, OS_LOG_TYPE_INFO, "Returning Link type : %{private}ld", buf, 0xCu);
            }

            int v26 = [v11 title];
            if (v23) {
              uint64_t v27 = v23;
            }
            else {
              uint64_t v27 = @"appclip";
            }
            v17 = [(MKSearchFoundationResult *)v29 _populateButtonItem:v26 imageName:v27 command:v18];

            goto LABEL_23;
          }
        }
        id v13 = MKGetMKSearchFoundationResultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = [v11 type];
          *(_DWORD *)buf = 134283521;
          uint64_t v36 = v14;
          _os_log_impl(&dword_18BAEC000, v13, OS_LOG_TYPE_INFO, "Link type : %{private}ld", buf, 0xCu);
        }

        v15 = MKGetMKSearchFoundationResultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_super v16 = [v11 URLString];
          *(_DWORD *)buf = 138477827;
          uint64_t v36 = (uint64_t)v16;
          _os_log_impl(&dword_18BAEC000, v15, OS_LOG_TYPE_INFO, "Link : %{private}@", buf, 0xCu);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  v17 = 0;
LABEL_23:

  return v17;
}

- (id)_populateButtonItem:(id)a3 imageName:(id)a4 command:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F99FB0]);
  v11 = v10;
  if (v7) {
    [v10 setTitle:v7];
  }
  if (v8)
  {
    v12 = objc_opt_new();
    [v12 setSymbolName:v8];
    [v12 setIsTemplate:1];
    [v11 setImage:v12];
  }
  [v11 setCommand:v9];
  id v13 = MKGetMKSearchFoundationResultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v20 = 138477827;
    id v21 = v7;
    _os_log_impl(&dword_18BAEC000, v13, OS_LOG_TYPE_INFO, "Title: %{private}@", (uint8_t *)&v20, 0xCu);
  }

  uint64_t v14 = MKGetMKSearchFoundationResultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v20 = 138477827;
    id v21 = v8;
    _os_log_impl(&dword_18BAEC000, v14, OS_LOG_TYPE_INFO, "Image name: %{private}@", (uint8_t *)&v20, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = MKGetMKSearchFoundationResultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_super v16 = [v9 url];
      int v20 = 138477827;
      id v21 = v16;
      _os_log_impl(&dword_18BAEC000, v15, OS_LOG_TYPE_INFO, "Url: %{private}@", (uint8_t *)&v20, 0xCu);
    }
    v17 = MKGetMKSearchFoundationResultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = [v9 applicationBundleIdentifier];
      int v20 = 138477827;
      id v21 = v18;
      _os_log_impl(&dword_18BAEC000, v17, OS_LOG_TYPE_INFO, "Application bundle identifier: %{private}@", (uint8_t *)&v20, 0xCu);
    }
  }

  return v11;
}

- (id)_defaultRichTextItems
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(MKMapItem *)self->_mapItem _isMapItemTypeBrand];
  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(MKSearchFoundationResult *)self _businessAddress];
  }
  objc_storeStrong((id *)&self->_secondLineDisplayedText, v5);
  if (!v4) {

  }
  if (self->_secondLineDisplayedText) {
    objc_msgSend(v3, "addObject:");
  }
  if ([(MKMapItem *)self->_mapItem _isMapItemTypeBrand])
  {
    id v6 = [(MKMapItem *)self->_mapItem url];

    if (v6)
    {
      id v7 = [(MKSearchFoundationResult *)self _brandURL];
      thirdLineDisplayedText = self->_thirdLineDisplayedText;
      self->_thirdLineDisplayedText = v7;

      [v3 addObject:self->_thirdLineDisplayedText];
    }
  }
  else
  {
    id v9 = [(MKSearchFoundationResult *)self _businessHoursAndDistance];
    id v10 = self->_thirdLineDisplayedText;
    self->_thirdLineDisplayedText = v9;

    if (self->_thirdLineDisplayedText) {
      objc_msgSend(v3, "addObject:");
    }
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:self selector:sel__locationApprovalDidChange name:MKLocationManagerApprovalDidChangeNotification object:0];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__MKSearchFoundationResult__defaultRichTextItems__block_invoke;
    block[3] = &unk_1E54B8188;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }

  return v3;
}

uint64_t __49__MKSearchFoundationResult__defaultRichTextItems__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[MKLocationManager sharedLocationManager];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 848);
  *(void *)(v3 + 848) = v2;

  [*(id *)(*(void *)(a1 + 32) + 848) setDesiredAccuracy:*MEMORY[0x1E4F1E6D8]];
  id v5 = *(void **)(*(void *)(a1 + 32) + 848);
  id v6 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/LocationBundles/CoreParsec.framework"];
  [v5 setEffectiveBundle:v6];

  id v7 = *(void **)(*(void *)(a1 + 32) + 848);

  return objc_msgSend(v7, "startLocationUpdateWithObserver:");
}

- (id)_appleRatingsDescription
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self->_mapItem;
  uint64_t v3 = _MKLocalizedStringFromThisBundle(@"%lu Recommend [UGC]");
  BOOL v4 = _MKLocalizedStringFromThisBundle(@"(number of people)");
  id v5 = NSString;
  id v6 = [(MKMapItem *)v2 _geoMapItem];
  id v7 = [v6 _overallAppleRating];
  [v7 percentage];
  id v9 = objc_msgSend(v5, "localizedStringWithFormat:", v3, (unint64_t)(v8 * 100.0));

  id v10 = NSString;
  v11 = [(MKMapItem *)v2 _geoMapItem];
  v12 = [v11 _overallAppleRating];
  id v13 = +[MKFirstPartyRatingFormatter stringFromCount:](MKFirstPartyRatingFormatter, "stringFromCount:", (int)[v12 numberOfRatingsUsedForScore]);
  uint64_t v14 = objc_msgSend(v10, "localizedStringWithFormat:", v4, v13);

  v18[0] = v9;
  v18[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  objc_super v16 = [v15 componentsJoinedByString:@" "];

  return v16;
}

- (id)_businessReviewText
{
  v34[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MKSearchFoundationRichText *)[MKSearchFoundationBusinessReviewRichText alloc] initWithString:&stru_1ED919588];
  if ([(MKMapItem *)self->_mapItem _hasUserRatingScore]
    && ([(MKMapItem *)self->_mapItem _geoMapItem],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 _hasAppleRatings],
        v4,
        v5))
  {
    id v6 = [(MKSearchFoundationResult *)self _appleRatingsDescription];
    [(MKSearchFoundationRichText *)v3 setText:v6];

    id v7 = objc_alloc_init(MEMORY[0x1E4F9A498]);
    [v7 setSymbolName:@"hand.thumbsup.fill"];
    [v7 setIsTemplate:1];
    v34[0] = v7;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    [(SFRichText *)v3 setIcons:v8];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    if ([(MKMapItem *)self->_mapItem _hasUserRatingScore])
    {
      [(MKMapItem *)self->_mapItem _normalizedUserRatingScore];
      [(SFRichText *)v3 setStarRating:v9];
      id v10 = [(MKMapItem *)self->_mapItem _reviewsAttribution];
      v11 = [v10 providerName];
      uint64_t v12 = [v11 length];

      id v13 = NSString;
      if (v12)
      {
        uint64_t v14 = _MKLocalizedStringFromThisBundle(@"Place_Reviews_On_Provider");
        uint64_t v15 = [(MKMapItem *)self->_mapItem _sampleSizeForUserRatingScore];
        objc_super v16 = [(MKMapItem *)self->_mapItem _reviewsDisplayName];
        v17 = objc_msgSend(v13, "localizedStringWithFormat:", v14, v15, v16);

        if ([v7 count]) {
          [v7 insertObject:v17 atIndex:0];
        }
        else {
          [v7 addObject:v17];
        }
        [(MKSearchFoundationBusinessReviewRichText *)v3 setReviewResolved:1];
      }
      else
      {
        id v18 = _MKLocalizedStringFromThisBundle(@"Place_Reviews_Number_Parsec");
        v19 = objc_msgSend(v13, "localizedStringWithFormat:", v18, -[MKMapItem _sampleSizeForUserRatingScore](self->_mapItem, "_sampleSizeForUserRatingScore"));

        [v7 addObject:v19];
        objc_initWeak(&location, self);
        int v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
        mapItem = self->_mapItem;
        uint64_t v22 = [MEMORY[0x1E4F28F08] mainQueue];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __47__MKSearchFoundationResult__businessReviewText__block_invoke;
        v28[3] = &unk_1E54BCB60;
        objc_copyWeak(&v32, &location);
        v29 = v3;
        id v30 = v7;
        id v23 = v19;
        id v31 = v23;
        v24 = [v20 addObserverForName:@"MKMapItemDidResolveAttribution" object:mapItem queue:v22 usingBlock:v28];
        id attributionObserver = self->_attributionObserver;
        self->_id attributionObserver = v24;

        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);
      }
    }
    if ([v7 count])
    {
      double v8 = +[MKSearchFoundationResult styledStringFromStringArray:v7];
      [(MKSearchFoundationRichText *)v3 setText:v8];
    }
    else
    {
      double v8 = v3;
      uint64_t v3 = 0;
    }
  }

  int v26 = v3;
  return v26;
}

void __47__MKSearchFoundationResult__businessReviewText__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:WeakRetained[109]];

    int v5 = (void *)WeakRetained[109];
    WeakRetained[109] = 0;

    id v6 = [v11 object];
    id v7 = [v6 _reviewsAttribution];
    double v8 = [v7 providerName];
    uint64_t v9 = [v8 length];

    id v10 = *(void **)(a1 + 32);
    if (v9)
    {
      [v10 resolveReviewStringWithProviderNameByMapItem:v6 lines:*(void *)(a1 + 40) temporaryReviewString:*(void *)(a1 + 48)];
    }
    else
    {
      [v10 setStarRating:0.0];
      [*(id *)(a1 + 32) resolveReviewStringWithProviderNameNotFoundByMapItem:v6 lines:*(void *)(a1 + 40) temporaryReviewString:*(void *)(a1 + 48)];
    }
  }
}

- (id)_businessAddress
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MKMapItem *)self->_mapItem _shortAddress];
  BOOL v4 = [(MKMapItem *)self->_mapItem _geoAddress];
  int v5 = [v4 singleLineAddress];

  id v6 = MKGetMKSearchFoundationResultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    uint64_t v14 = v5;
    _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_INFO, "MapItem single line address: %{private}@", buf, 0xCu);
  }

  if ([v3 length] && (objc_msgSend(v3, "isEqualToString:", v5) & 1) == 0)
  {
    uint64_t v12 = v3;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if ([v7 count])
  {
    double v8 = [MKSearchFoundationRichText alloc];
    uint64_t v9 = +[MKSearchFoundationResult styledStringFromStringArray:v7];
    id v10 = [(MKSearchFoundationRichText *)v8 initWithString:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_businessCategory
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MKMapItem *)self->_mapItem _firstLocalizedCategoryName];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    int v5 = [MKSearchFoundationRichText alloc];
    id v6 = [(MKMapItem *)self->_mapItem _firstLocalizedCategoryName];
    v11[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    double v8 = +[MKSearchFoundationResult styledStringFromStringArray:v7];
    uint64_t v9 = [(MKSearchFoundationRichText *)v5 initWithString:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_brandURL
{
  uint64_t v2 = [(MKMapItem *)self->_mapItem url];
  uint64_t v3 = [v2 host];

  if ([v3 length]) {
    uint64_t v4 = [(MKSearchFoundationRichText *)[MKSearchFoundationBusinessHoursAndDistanceRichText alloc] initWithString:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_businessHoursAndDistance
{
  uint64_t v3 = [(MKSearchFoundationRichText *)[MKSearchFoundationBusinessHoursAndDistanceRichText alloc] initWithString:&stru_1ED919588];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  thirdLineText = self->_thirdLineText;
  self->_thirdLineText = v4;

  [(MKSearchFoundationBusinessHoursAndDistanceRichText *)v3 resolveBusinessHoursByMapItem:self->_mapItem lines:self->_thirdLineText];

  return v3;
}

+ (id)styledStringFromStringArray:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    if (v4 == 1)
    {
      int v5 = [v3 objectEnumerator];
    }
    else
    {
      id v7 = [MEMORY[0x1E4F42738] sharedApplication];
      if ([v7 userInterfaceLayoutDirection] == 1) {
        [v3 reverseObjectEnumerator];
      }
      else {
      int v5 = [v3 objectEnumerator];
      }
    }
    double v8 = _MKLocalizedStringFromThisBundle(@"BULLET_STRING_COMPONENT_KEY");
    id v6 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    uint64_t v9 = [v5 nextObject];
    [(__CFString *)v6 appendString:v9];
    id v10 = [v5 nextObject];

    if (v10)
    {
      do
      {
        [(__CFString *)v6 appendString:v8];
        uint64_t v11 = [(__CFString *)v6 rangeOfString:@"%@"];
        if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
          -[__CFString replaceCharactersInRange:withString:](v6, "replaceCharactersInRange:withString:", v11, v12, v10);
        }
        uint64_t v13 = [v5 nextObject];

        id v10 = (void *)v13;
      }
      while (v13);
    }
  }
  else
  {
    id v6 = &stru_1ED919588;
  }

  return v6;
}

- (BOOL)_isSmallerScreen
{
  uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  BOOL v4 = v3 <= 375.0;

  return v4;
}

- (void)_locationApprovalDidChange
{
  BOOL v3 = [(MKLocationManager *)self->_locationManager isLocationServicesAvailable];
  locationManager = self->_locationManager;
  if (v3)
  {
    [(MKLocationManager *)locationManager startLocationUpdateWithObserver:self];
  }
  else
  {
    [(MKLocationManager *)locationManager stopLocationUpdateWithObserver:self];
  }
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v11 = a3;
  BOOL v4 = [v11 lastLocation];

  if (v4)
  {
    int v5 = [v11 lastLocation];
    id v6 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    [(MKMapItem *)self->_mapItem _coordinate];
    double v8 = v7;
    [(MKMapItem *)self->_mapItem _coordinate];
    uint64_t v9 = objc_msgSend(v6, "initWithLatitude:longitude:", v8);
    [v5 distanceFromLocation:v9];
    id v10 = objc_msgSend(NSString, "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", 0, self->_optionSmallerScreen, 0, 0, 0);
    [(MKSearchFoundationBusinessHoursAndDistanceRichText *)self->_thirdLineDisplayedText resolveDistanceString:v10 lines:self->_thirdLineText];
    [v11 stopLocationUpdateWithObserver:self];
  }
}

- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4
{
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (NSData)mapsData
{
  return self->_mapsData;
}

- (void)setMapsData:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (MKSearchFoundationRichText)secondLineDisplayedText
{
  return self->_secondLineDisplayedText;
}

- (void)setSecondLineDisplayedText:(id)a3
{
}

- (id)descriptions
{
  return self->_descriptions;
}

- (void)setDescriptions:(id)a3
{
}

- (MKSearchFoundationBusinessHoursAndDistanceRichText)thirdLineDisplayedText
{
  return self->_thirdLineDisplayedText;
}

- (void)setThirdLineDisplayedText:(id)a3
{
}

- (unint64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(unint64_t)a3
{
  self->_iconSize = a3;
}

- (unint64_t)mksfResultType
{
  return self->_mksfResultType;
}

- (void)setMksfResultType:(unint64_t)a3
{
  self->_mksfResultType = a3;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (MKSearchFoundationRichText)fourthLineDisplayedText
{
  return self->_fourthLineDisplayedText;
}

- (void)setFourthLineDisplayedText:(id)a3
{
}

- (NSMutableArray)thirdLineText
{
  return self->_thirdLineText;
}

- (void)setThirdLineText:(id)a3
{
}

- (BOOL)optionSmallerScreen
{
  return self->_optionSmallerScreen;
}

- (void)setOptionSmallerScreen:(BOOL)a3
{
  self->_optionSmallerScreen = a3;
}

- (id)attributionObserver
{
  return self->_attributionObserver;
}

- (void)setAttributionObserver:(id)a3
{
}

- (id)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (id)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_attributionObserver, 0);
  objc_storeStrong((id *)&self->_thirdLineText, 0);
  objc_storeStrong((id *)&self->_fourthLineDisplayedText, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_thirdLineDisplayedText, 0);
  objc_storeStrong((id *)&self->_descriptions, 0);
  objc_storeStrong((id *)&self->_secondLineDisplayedText, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_mapsData, 0);
}

@end