@interface MUPlaceHeaderViewModel
- (BOOL)hasEnclosingPlace;
- (BOOL)hasHeroImage;
- (BOOL)hasInitialData;
- (BOOL)isClaimed;
- (BOOL)isVerified;
- (BOOL)supportsContactAddressDescription;
- (BOOL)supportsEnhancedBusinessHeader;
- (BOOL)supportsLogo;
- (MKAppImageManager)imageManager;
- (MKMapItemIdentifier)enclosingMapItemIdentifier;
- (MULabeledTokenViewModel)enclosingPlaceViewModel;
- (MUPlaceHeaderViewModel)initWithMapItem:(id)a3;
- (MUPlaceHeaderViewModel)initWithMapItem:(id)a3 imageManager:(id)a4;
- (MUPlaceHeaderViewModel)initWithMapItem:(id)a3 imageManager:(id)a4 isDeveloperPlaceCard:(BOOL)a5 developerPlaceCardAuditToken:(id)a6;
- (MUPlaceHeaderViewModel)initWithMapItem:(id)a3 isDeveloperPlaceCard:(BOOL)a4 developerPlaceCardAuditToken:(id)a5;
- (NSArray)transitLabelItems;
- (NSAttributedString)addressDescriptionForContact;
- (NSString)placeName;
- (NSString)placeSecondaryName;
- (UIColor)coverPhotoBackgroundColor;
- (UIColor)logoBackgroundColor;
- (id)_categoryAndAppleRatingsAttributedStringWithFont:(id)a3 labelColor:(id)a4;
- (id)enclosingPlaceAttributedStringWithFont:(id)a3 labelColor:(id)a4 tokenColor:(id)a5;
- (id)getReplacementResultFromEnclosingPlace;
- (void)_buildEnclosingPlace;
- (void)loadCoverPhotoWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5;
- (void)loadHeroImageWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5;
- (void)loadVerifiedLogoImageWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5;
- (void)refineEnclosingMapItemWithCompletion:(id)a3;
@end

@implementation MUPlaceHeaderViewModel

- (MUPlaceHeaderViewModel)initWithMapItem:(id)a3 imageManager:(id)a4 isDeveloperPlaceCard:(BOOL)a5 developerPlaceCardAuditToken:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MUPlaceHeaderViewModel;
  v14 = [(MUPlaceHeaderViewModel *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_mapItem, a3);
    objc_storeStrong((id *)&v15->_imageManager, a4);
    v15->_isDeveloperPlaceCard = a5;
    objc_storeStrong((id *)&v15->_developerPlaceCardAuditToken, a6);
    [(MUPlaceHeaderViewModel *)v15 _buildEnclosingPlace];
  }

  return v15;
}

- (MUPlaceHeaderViewModel)initWithMapItem:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F30E38];
  id v5 = a3;
  v6 = [v4 sharedImageManager];
  v7 = [(MUPlaceHeaderViewModel *)self initWithMapItem:v5 imageManager:v6];

  return v7;
}

- (MUPlaceHeaderViewModel)initWithMapItem:(id)a3 imageManager:(id)a4
{
  return [(MUPlaceHeaderViewModel *)self initWithMapItem:a3 imageManager:a4 isDeveloperPlaceCard:0 developerPlaceCardAuditToken:0];
}

- (MUPlaceHeaderViewModel)initWithMapItem:(id)a3 isDeveloperPlaceCard:(BOOL)a4 developerPlaceCardAuditToken:(id)a5
{
  BOOL v5 = a4;
  v8 = (void *)MEMORY[0x1E4F30E38];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 sharedImageManagerWithAuditToken:v9];
  id v12 = [(MUPlaceHeaderViewModel *)self initWithMapItem:v10 imageManager:v11 isDeveloperPlaceCard:v5 developerPlaceCardAuditToken:v9];

  return v12;
}

- (void)_buildEnclosingPlace
{
  v3 = [(MUPlaceHeaderViewModel *)self getReplacementResultFromEnclosingPlace];
  if (v3)
  {
    id v12 = v3;
    v4 = [v3 string];
    BOOL v5 = [v12 styleReplacementResults];
    v6 = [v5 firstObject];

    v7 = [v6 string];
    objc_storeStrong((id *)&self->_enclosingPlaceString, v7);
    if (v6)
    {
      uint64_t v8 = [v6 range];
      objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v8, v9, &stru_1EE3BF360);
      id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = v4;
    }
    labelString = self->_labelString;
    self->_labelString = v10;

    v3 = v12;
  }
}

- (void)refineEnclosingMapItemWithCompletion:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, MKMapItem *, void))a3;
  BOOL v5 = [(MUPlaceHeaderViewModel *)self enclosingMapItemIdentifier];
  if (v5)
  {
    enclosingMapItem = self->_enclosingMapItem;
    if (enclosingMapItem)
    {
      v4[2](v4, enclosingMapItem, 0);
    }
    else
    {
      objc_initWeak(&location, self);
      v7 = [MEMORY[0x1E4F30F28] sharedService];
      v14[0] = v5;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      uint64_t v9 = [v7 ticketForIdentifiers:v8 traits:0];

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __63__MUPlaceHeaderViewModel_refineEnclosingMapItemWithCompletion___block_invoke;
      v10[3] = &unk_1E574F5D8;
      objc_copyWeak(&v12, &location);
      id v11 = v4;
      [v9 submitWithHandler:v10 networkActivity:0];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v4[2](v4, 0, 0);
  }
}

void __63__MUPlaceHeaderViewModel_refineEnclosingMapItemWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v7 = [v13 firstObject];
    uint64_t v8 = (void *)*((void *)WeakRetained + 2);
    *((void *)WeakRetained + 2) = v7;

    uint64_t v9 = [*((id *)WeakRetained + 2) name];
    id v10 = (void *)*((void *)WeakRetained + 4);
    *((void *)WeakRetained + 4) = v9;

    uint64_t v11 = _MULocalizedStringFromThisBundle(@"Location [Placecard]");
    id v12 = (void *)*((void *)WeakRetained + 3);
    *((void *)WeakRetained + 3) = v11;

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (MULabeledTokenViewModel)enclosingPlaceViewModel
{
  if (self->_isDeveloperPlaceCard)
  {
    v2 = 0;
  }
  else if ([(NSString *)self->_labelString length] {
         || (v2 = [(NSString *)self->_enclosingPlaceString length]) != 0)
  }
  {
    enclosingPlaceViewModel = self->_enclosingPlaceViewModel;
    if (!enclosingPlaceViewModel)
    {
      id v5 = [[MULabeledTokenViewModel alloc] initWithLabelValue:self->_labelString tokenValue:self->_enclosingPlaceString];
      v6 = self->_enclosingPlaceViewModel;
      self->_enclosingPlaceViewModel = v5;

      enclosingPlaceViewModel = self->_enclosingPlaceViewModel;
    }
    v2 = enclosingPlaceViewModel;
  }
  return v2;
}

- (MKMapItemIdentifier)enclosingMapItemIdentifier
{
  v3 = [(MKMapItem *)self->_mapItem _geoMapItem];
  v4 = [v3 _enclosingPlace];

  id v5 = [v4 parentIdentifier];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F30F10]);
    uint64_t v7 = [v4 parentIdentifier];
    id v8 = v6;
LABEL_5:
    id v12 = (void *)[v8 initWithGEOMapItemIdentifier:v7];
    goto LABEL_6;
  }
  uint64_t v9 = [(MKMapItem *)self->_mapItem _geoMapItem];
  id v10 = [v9 _containedPlace];
  uint64_t v11 = [v10 parent];
  uint64_t v7 = [v11 _identifier];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F30F10]);
    goto LABEL_5;
  }
  v14 = [(MKMapItem *)self->_mapItem _venueInfo];
  v15 = [v14 parent];

  if (v15)
  {
    v16 = [(MKMapItem *)self->_mapItem _venueInfo];
    objc_super v17 = [v16 parent];
    uint64_t v18 = [v17 businessID];

    [(MKMapItem *)self->_mapItem _coordinate];
    id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F30F10]), "initWithMUID:resultProviderID:coordinate:", v18, 0, v19, v20);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    id v12 = 0;
  }
LABEL_6:

  return (MKMapItemIdentifier *)v12;
}

- (id)_categoryAndAppleRatingsAttributedStringWithFont:(id)a3 labelColor:(id)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  uint64_t v9 = *MEMORY[0x1E4FB06F8];
  v32[0] = *MEMORY[0x1E4FB0700];
  v32[1] = v9;
  v33[0] = v7;
  v33[1] = v6;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __86__MUPlaceHeaderViewModel__categoryAndAppleRatingsAttributedStringWithFont_labelColor___block_invoke;
  v28 = &unk_1E574F600;
  v29 = self;
  id v11 = v8;
  id v30 = v11;
  id v12 = v10;
  id v31 = v12;
  id v13 = (void (**)(void))_Block_copy(&v25);
  v14 = [(MUPlaceHeaderViewModel *)self getReplacementResultFromEnclosingPlace];
  v15 = v14;
  if (v14)
  {
    v16 = [v14 styleReplacementResults];
    objc_super v17 = [v16 firstObject];
    if (v17)
    {
    }
    else
    {
      double v20 = [v15 string];

      if (v20)
      {
        id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v18 = [v15 string];
        id v19 = v21;
        goto LABEL_8;
      }
    }
  }
  uint64_t v18 = [(MKMapItem *)self->_mapItem _firstLocalizedCategoryName];
  if (![v18 length]) {
    goto LABEL_9;
  }
  id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
LABEL_8:
  v22 = (void *)[v19 initWithString:v18 attributes:v12];
  [v11 appendAttributedString:v22];

LABEL_9:
  v13[2](v13);
  v23 = (void *)[v11 copy];

  return v23;
}

void __86__MUPlaceHeaderViewModel__categoryAndAppleRatingsAttributedStringWithFont_labelColor___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) _geoMapItem];
  int v3 = [v2 _hasAppleRatings];

  if (v3)
  {
    if ([*(id *)(a1 + 40) length])
    {
      v4 = _MULocalizedStringFromThisBundle(@"Delimiter");
      id v5 = *(void **)(a1 + 40);
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:*(void *)(a1 + 48)];
      [v5 appendAttributedString:v6];
    }
    id v13 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    id v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", *MEMORY[0x1E4FB2950], *MEMORY[0x1E4FB09D8]);
    id v8 = +[MUAppleRatingRowView ratingSymbolStringWithFont:v7 symbolScale:1 attributes:*(void *)(a1 + 48)];
    [v13 addObject:v8];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:*(void *)(a1 + 48)];
    [v13 addObject:v9];

    id v10 = [MEMORY[0x1E4F30EA0] compactUserRecommendedRatingSummaryStringForMapItem:*(void *)(*(void *)(a1 + 32) + 8)];
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10 attributes:*(void *)(a1 + 48)];
    [v13 addObject:v11];

    id v12 = +[MapsUILayout buildAttributedDisplayStringForComponents:v13];
    [*(id *)(a1 + 40) appendAttributedString:v12];
  }
}

- (id)getReplacementResultFromEnclosingPlace
{
  v2 = [(MKMapItem *)self->_mapItem _geoMapItem];
  int v3 = [v2 _enclosingPlace];

  if (v3)
  {
    v4 = [v3 containmentTextTemplate];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F644D0]) initWithGeoFormattedString:v4];
    id v6 = [v5 stringResultWithOptions:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)enclosingPlaceAttributedStringWithFont:(id)a3 labelColor:(id)a4 tokenColor:(id)a5
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_isDeveloperPlaceCard)
  {
    id v11 = [(MUPlaceHeaderViewModel *)self _categoryAndAppleRatingsAttributedStringWithFont:v8 labelColor:v9];
  }
  else
  {
    if (self->_composedString)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F644D8]);
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      id v30 = __87__MUPlaceHeaderViewModel_enclosingPlaceAttributedStringWithFont_labelColor_tokenColor___block_invoke;
      id v31 = &unk_1E574F628;
      id v32 = v10;
      id v33 = v8;
      id v34 = v9;
      [v12 setFormatStyleHandler:&v28];
      id v13 = -[GEOComposedString stringResultWithOptions:](self->_composedString, "stringResultWithOptions:", v12, v28, v29, v30, v31);
      id v11 = [v13 attributedString];
    }
    else
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F28E48]);
      NSUInteger v14 = [(NSString *)self->_labelString length];
      v15 = (void *)MEMORY[0x1E4FB0700];
      v16 = (uint64_t *)MEMORY[0x1E4FB06F8];
      if (v14)
      {
        id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
        labelString = self->_labelString;
        uint64_t v19 = *v16;
        v37[0] = *v15;
        v37[1] = v19;
        v38[0] = v9;
        v38[1] = v8;
        double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
        id v21 = (void *)[v17 initWithString:labelString attributes:v20];

        v15 = (void *)MEMORY[0x1E4FB0700];
        [v12 appendAttributedString:v21];
      }
      if ([(NSString *)self->_enclosingPlaceString length])
      {
        id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
        enclosingPlaceString = self->_enclosingPlaceString;
        uint64_t v24 = *v16;
        v35[0] = *v15;
        v35[1] = v24;
        v36[0] = v10;
        v36[1] = v8;
        v35[2] = *MEMORY[0x1E4FB0720];
        v36[2] = &stru_1EE3BF360;
        uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
        uint64_t v26 = (void *)[v22 initWithString:enclosingPlaceString attributes:v25];

        [v12 appendAttributedString:v26];
      }
      id v11 = (void *)[v12 copy];
    }
  }
  return v11;
}

id __87__MUPlaceHeaderViewModel_enclosingPlaceAttributedStringWithFont_labelColor_tokenColor___block_invoke(void *a1, id a2)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  if (a2 >= 3)
  {
    if (a2 != 3) {
      goto LABEL_6;
    }
    uint64_t v8 = *MEMORY[0x1E4FB06F8];
    v13[0] = *MEMORY[0x1E4FB0700];
    v13[1] = v8;
    uint64_t v9 = a1[5];
    v14[0] = a1[4];
    v14[1] = v9;
    v13[2] = *MEMORY[0x1E4FB0720];
    void v14[2] = &stru_1EE3BF360;
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = v14;
    id v6 = v13;
    uint64_t v7 = 3;
  }
  else
  {
    uint64_t v2 = *MEMORY[0x1E4FB06F8];
    v11[0] = *MEMORY[0x1E4FB0700];
    v11[1] = v2;
    uint64_t v3 = a1[5];
    v12[0] = a1[6];
    v12[1] = v3;
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = v12;
    id v6 = v11;
    uint64_t v7 = 2;
  }
  a2 = [v4 dictionaryWithObjects:v5 forKeys:v6 count:v7];
LABEL_6:
  return a2;
}

- (BOOL)hasInitialData
{
  uint64_t v2 = [(MKMapItem *)self->_mapItem _geoMapItem];
  uint64_t v3 = [v2 _enclosingPlace];

  v4 = [v3 containmentTextTemplate];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (NSString)placeName
{
  return [(MKMapItem *)self->_mapItem name];
}

- (NSString)placeSecondaryName
{
  return (NSString *)[(MKMapItem *)self->_mapItem _secondaryName];
}

- (NSAttributedString)addressDescriptionForContact
{
  return 0;
}

- (BOOL)hasEnclosingPlace
{
  uint64_t v2 = [(MUPlaceHeaderViewModel *)self enclosingMapItemIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSArray)transitLabelItems
{
  if (self->_isDeveloperPlaceCard)
  {
    uint64_t v2 = 0;
  }
  else
  {
    BOOL v3 = [(MKMapItem *)self->_mapItem _transitInfo];
    uint64_t v2 = [v3 labelItems];
  }
  return (NSArray *)v2;
}

- (BOOL)hasHeroImage
{
  return [(MKMapItem *)self->_mapItem _isMapItemTypeBrand];
}

- (void)loadHeroImageWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  if (v9)
  {
    id v10 = -[MKMapItem _bestBrandIconURLForSize:allowSmaller:](self->_mapItem, "_bestBrandIconURLForSize:allowSmaller:", 1, width * a4, height * a4);
    if (v10)
    {
      id v11 = [(MUPlaceHeaderViewModel *)self imageManager];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __77__MUPlaceHeaderViewModel_loadHeroImageWithFrameSize_displayScale_completion___block_invoke;
      v12[3] = &unk_1E574F678;
      id v13 = v9;
      double v14 = width;
      double v15 = height;
      double v16 = a4;
      [v11 loadAppImageAtURL:v10 completionHandler:v12];
    }
    else
    {
      (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
    }
  }
}

void __77__MUPlaceHeaderViewModel_loadHeroImageWithFrameSize_displayScale_completion___block_invoke(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t a5)
{
  id v8 = a2;
  if (a5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    double v9 = *(double *)(a1 + 56);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__MUPlaceHeaderViewModel_loadHeroImageWithFrameSize_displayScale_completion___block_invoke_2;
    v10[3] = &unk_1E574F650;
    id v13 = *(id *)(a1 + 32);
    id v11 = v8;
    id v12 = 0;
    char v14 = a3;
    +[MapsUIUtilities resizeImageIfNeeded:toFrameSize:displayScale:completion:](MapsUIUtilities, "resizeImageIfNeeded:toFrameSize:displayScale:completion:", v11, v10, *(double *)(a1 + 40), *(double *)(a1 + 48), v9);
  }
}

uint64_t __77__MUPlaceHeaderViewModel_loadHeroImageWithFrameSize_displayScale_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (!a2) {
    a2 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void, void))(v3 + 16))(v3, a2, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

- (BOOL)isVerified
{
  if (!GEOConfigGetBOOL()
    || (int v3 = [(MKMapItem *)self->_mapItem _isMapItemTypeBrand]) != 0)
  {
    mapItem = self->_mapItem;
    LOBYTE(v3) = [(MKMapItem *)mapItem _isMessageIDVerified];
  }
  return v3;
}

- (BOOL)isClaimed
{
  return [(MKMapItem *)self->_mapItem _isClaimed];
}

- (BOOL)supportsEnhancedBusinessHeader
{
  uint64_t v2 = [(MKMapItem *)self->_mapItem _businessAssets];
  int v3 = [v2 coverPhoto];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)loadVerifiedLogoImageWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  if (v9)
  {
    id v10 = [(MKMapItem *)self->_mapItem _geoMapItem];
    id v11 = objc_msgSend(v10, "_bestAvatarBrandIconURLForSize:allowSmaller:", 1, width * a4, height * a4);

    if (v11)
    {
      id v12 = [(MUPlaceHeaderViewModel *)self imageManager];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __85__MUPlaceHeaderViewModel_loadVerifiedLogoImageWithFrameSize_displayScale_completion___block_invoke;
      void v13[3] = &unk_1E574F678;
      id v14 = v9;
      double v15 = width;
      double v16 = height;
      double v17 = a4;
      [v12 loadAppImageAtURL:v11 completionHandler:v13];
    }
    else
    {
      (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
    }
  }
}

void __85__MUPlaceHeaderViewModel_loadVerifiedLogoImageWithFrameSize_displayScale_completion___block_invoke(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t a5)
{
  id v8 = a2;
  if (a5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    double v9 = *(double *)(a1 + 56);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __85__MUPlaceHeaderViewModel_loadVerifiedLogoImageWithFrameSize_displayScale_completion___block_invoke_2;
    v10[3] = &unk_1E574F650;
    id v13 = *(id *)(a1 + 32);
    id v11 = v8;
    id v12 = 0;
    char v14 = a3;
    +[MapsUIUtilities resizeImageIfNeeded:toFrameSize:displayScale:completion:](MapsUIUtilities, "resizeImageIfNeeded:toFrameSize:displayScale:completion:", v11, v10, *(double *)(a1 + 40), *(double *)(a1 + 48), v9);
  }
}

uint64_t __85__MUPlaceHeaderViewModel_loadVerifiedLogoImageWithFrameSize_displayScale_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (!a2) {
    a2 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void, void))(v3 + 16))(v3, a2, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

- (void)loadCoverPhotoWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  if (v9)
  {
    id v10 = [(MKMapItem *)self->_mapItem _businessAssets];
    id v11 = [v10 coverPhoto];
    if (qword_1E9315268 != -1) {
      dispatch_once(&qword_1E9315268, &__block_literal_global_8);
    }
    id v12 = objc_msgSend(v11, "bestPhotoForFrameSize:displayScale:options:", _MergedGlobals_1, width, height, a4);
    if (v12)
    {
      id v13 = [(MUPlaceHeaderViewModel *)self imageManager];
      char v14 = [v12 url];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __78__MUPlaceHeaderViewModel_loadCoverPhotoWithFrameSize_displayScale_completion___block_invoke;
      v15[3] = &unk_1E574F6A0;
      id v16 = v9;
      [v13 loadAppImageAtURL:v14 completionHandler:v15];
    }
    else
    {
      (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
    }
  }
}

uint64_t __78__MUPlaceHeaderViewModel_loadCoverPhotoWithFrameSize_displayScale_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)supportsLogo
{
  uint64_t v2 = [(MKMapItem *)self->_mapItem _geoMapItem];
  uint64_t v3 = objc_msgSend(v2, "_bestAvatarBrandIconURLForSize:allowSmaller:", 1, 1.79769313e308, 1.79769313e308);
  BOOL v4 = v3 != 0;

  return v4;
}

- (UIColor)coverPhotoBackgroundColor
{
  uint64_t v2 = [(MKMapItem *)self->_mapItem _businessAssets];
  uint64_t v3 = [v2 coverPhoto];
  BOOL v4 = [v3 backgroundJoeColor];

  if ([v4 length])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4FB1618], "_maps_colorFromHexString:", v4);
  }
  else
  {
    id v5 = 0;
  }

  return (UIColor *)v5;
}

- (UIColor)logoBackgroundColor
{
  return 0;
}

- (BOOL)supportsContactAddressDescription
{
  return 0;
}

- (MKAppImageManager)imageManager
{
  return self->_imageManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageManager, 0);
  objc_storeStrong((id *)&self->_enclosingPlaceViewModel, 0);
  objc_storeStrong((id *)&self->_composedString, 0);
  objc_storeStrong((id *)&self->_developerPlaceCardAuditToken, 0);
  objc_storeStrong((id *)&self->_enclosingPlaceString, 0);
  objc_storeStrong((id *)&self->_labelString, 0);
  objc_storeStrong((id *)&self->_enclosingMapItem, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end