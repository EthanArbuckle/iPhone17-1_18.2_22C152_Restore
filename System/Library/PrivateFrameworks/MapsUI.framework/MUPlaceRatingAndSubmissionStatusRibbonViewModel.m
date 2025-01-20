@interface MUPlaceRatingAndSubmissionStatusRibbonViewModel
- (BOOL)_canBeRated;
- (BOOL)isEqual:(id)a3;
- (MKMapItem)mapItem;
- (MUPlaceCallToActionAppearance)submissionStatus;
- (MUPlaceRatingAndSubmissionStatusRibbonViewModel)initWithMapItem:(id)a3 submissionStatus:(id)a4;
- (id)typeStringForAX;
- (int64_t)_ratingState;
- (void)_updateStringProviders;
- (void)setSubmissionStatus:(id)a3;
@end

@implementation MUPlaceRatingAndSubmissionStatusRibbonViewModel

- (MUPlaceRatingAndSubmissionStatusRibbonViewModel)initWithMapItem:(id)a3 submissionStatus:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && ![v7 _hasUserRatingScore])
  {
    v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MUPlaceRatingAndSubmissionStatusRibbonViewModel;
    v9 = [(MUPlaceRatingAndSubmissionStatusRibbonViewModel *)&v13 init];
    p_isa = (id *)&v9->super.super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_mapItem, a3);
      objc_storeStrong(p_isa + 9, a4);
      [p_isa setType:1];
      [p_isa _updateStringProviders];
    }
    self = p_isa;
    v11 = self;
  }

  return v11;
}

- (void)setSubmissionStatus:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  uint64_t v6 = v5;
  if (self->_submissionStatus != (MUPlaceCallToActionAppearance *)v5)
  {
    uint64_t v7 = v5;
    uint64_t v5 = objc_msgSend((id)v5, "isEqual:");
    uint64_t v6 = v7;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_submissionStatus, a3);
      uint64_t v5 = [(MUPlaceRatingAndSubmissionStatusRibbonViewModel *)self _updateStringProviders];
      uint64_t v6 = v7;
    }
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (void)_updateStringProviders
{
  v3 = self->_mapItem;
  v4 = [(MKMapItem *)v3 _geoMapItem];
  unsigned int v5 = [v4 _sampleSizeForUserRatingScore];

  if (v3)
  {
    uint64_t v6 = [(MKMapItem *)v3 _geoMapItem];
    int v7 = [v6 _hasAppleRatings];

    if (v7)
    {
      id v8 = [MEMORY[0x1E4F30E98] stringFromCount:v5];
      v9 = _MULocalizedStringFromThisBundle(@"<num> ratings");
      v10 = [NSString localizedStringWithValidatedFormat:v9, @"%d %@", 0, v5, v8 validFormatSpecifiers error];
    }
    else
    {
      v11 = [(MKMapItem *)v3 _reviewsAttribution];
      v9 = [v11 providerName];

      v12 = NSString;
      objc_super v13 = [MEMORY[0x1E4F30E98] stringFromCount:v5];
      v10 = [v12 stringWithFormat:@"%@ (%@)", v9, v13];
    }
  }
  else
  {
    v10 = _MULocalizedStringFromThisBundle(@"Ratings [Placecard]");
  }
  objc_initWeak(&location, self);
  id v14 = v10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
  aBlock[3] = &unk_1E57505C8;
  id v24 = v14;
  id v15 = v14;
  v16 = _Block_copy(aBlock);

  [(MUPlaceRibbonItemViewModel *)self setTitleStringProvider:v16];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73__MUPlaceRatingAndSubmissionStatusRibbonViewModel__updateStringProviders__block_invoke;
  v19[3] = &unk_1E5750638;
  objc_copyWeak(&v21, &location);
  v17 = v3;
  v20 = v17;
  [(MUPlaceRibbonItemViewModel *)self setValueStringProvider:v19];
  v18 = [(MUPlaceRibbonItemViewModel *)self updateDelegate];
  [v18 ribbonItemViewModelDidUpdate:self];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

id __73__MUPlaceRatingAndSubmissionStatusRibbonViewModel__updateStringProviders__block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    unsigned int v5 = 0;
    goto LABEL_23;
  }
  if ([WeakRetained isTappable])
  {
    v4 = [MEMORY[0x1E4FB1618] tintColor];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) _geoMapItem];
    int v7 = [v6 _hasAppleRatings];

    if (v7)
    {
      id v8 = [MEMORY[0x1E4FB1618] systemGrayColor];
      v9 = [MEMORY[0x1E4FB1618] labelColor];
      id v10 = +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:v9];

      goto LABEL_9;
    }
    v4 = [MEMORY[0x1E4F31008] ratingColorForMapItem:*(void *)(a1 + 32)];
  }
  id v10 = v4;
  id v8 = v10;
LABEL_9:
  v11 = +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:v8];

  uint64_t v12 = +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:v10];

  uint64_t v13 = [v3 _ratingState];
  uint64_t v14 = v13;
  v69 = (void *)v12;
  v67 = v3;
  if (v13 == 2)
  {
    id v15 = @"hand.thumbsup.fill";
  }
  else if (v13 == 1)
  {
    id v15 = @"hand.thumbsdown.fill";
  }
  else if (v13)
  {
    id v15 = 0;
  }
  else if (*(void *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E4F31008], "ratingSymbolNameForMapItem:");
    id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = @"hand.thumbsup";
  }
  v16 = (void *)MEMORY[0x1E4FB1818];
  v17 = (void *)MEMORY[0x1E4FB1830];
  v18 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v19 = *MEMORY[0x1E4FB2908];
  v20 = v15;
  uint64_t v68 = v19;
  id v21 = [v18 preferredFontForTextStyle:v19];
  v22 = [v17 configurationWithFont:v21 scale:1];
  v23 = [v16 systemImageNamed:v20 withConfiguration:v22];
  v71 = v20;

  id v24 = [v23 imageWithRenderingMode:2];

  id v25 = v11;
  v26 = (objc_class *)MEMORY[0x1E4FB0870];
  id v27 = v24;
  id v28 = objc_alloc_init(v26);
  v29 = [v27 imageWithRenderingMode:2];
  v70 = v27;

  [v28 setImage:v29];
  v30 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v28];
  v31 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v30];
  uint64_t v65 = *MEMORY[0x1E4FB0700];
  uint64_t v72 = *MEMORY[0x1E4FB0700];
  id v74 = v25;
  v32 = (void *)MEMORY[0x1E4F1C9E8];
  id v33 = v25;
  v34 = [v32 dictionaryWithObjects:&v74 forKeys:&v72 count:1];

  objc_msgSend(v31, "addAttributes:range:", v34, 0, objc_msgSend(v31, "length"));
  v66 = (void *)[v31 copy];

  if (v14)
  {
    v35 = @"You Rated [Placecard]";
LABEL_20:
    uint64_t v36 = _MULocalizedStringFromThisBundle(v35);
    goto LABEL_21;
  }
  v53 = *(void **)(a1 + 32);
  if (!v53)
  {
    v35 = @"Rate [Placecard]";
    goto LABEL_20;
  }
  v54 = [v53 _geoMapItem];
  int v55 = [v54 _hasAppleRatings];

  v56 = *(void **)(a1 + 32);
  if (v55)
  {
    v57 = [v56 _geoMapItem];
    v58 = [v57 _overallAppleRating];
    [v58 percentage];
    double v60 = v59;

    id v61 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v61 setNumberStyle:3];
    v62 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [v61 setLocale:v62];

    v63 = [NSNumber numberWithDouble:v60];
    v37 = [v61 stringFromNumber:v63];

    goto LABEL_22;
  }
  [v56 _normalizedUserRatingScore];
  uint64_t v36 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%.1f", v64);
LABEL_21:
  v37 = (void *)v36;
LABEL_22:
  id v38 = objc_alloc(MEMORY[0x1E4F28B18]);
  v39 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v68];
  uint64_t v72 = *MEMORY[0x1E4FB06F8];
  uint64_t v40 = v72;
  uint64_t v73 = v65;
  id v74 = v39;
  id v75 = v69;
  v41 = (void *)MEMORY[0x1E4F1C9E8];
  id v42 = v69;
  v43 = [v41 dictionaryWithObjects:&v74 forKeys:&v72 count:2];

  v44 = (void *)[v38 initWithString:v37 attributes:v43];
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v45 addObject:v66];
  id v46 = objc_alloc(MEMORY[0x1E4F28B18]);
  v47 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v68];
  uint64_t v72 = v40;
  uint64_t v73 = v65;
  id v74 = v47;
  id v75 = v42;
  v48 = (void *)MEMORY[0x1E4F1C9E8];
  id v49 = v42;
  v50 = [v48 dictionaryWithObjects:&v74 forKeys:&v72 count:2];

  v51 = (void *)[v46 initWithString:@" " attributes:v50];
  [v45 addObject:v51];

  [v45 addObject:v44];
  unsigned int v5 = +[MapsUILayout buildAttributedDisplayStringForComponents:v45 reverseIfRTLLayout:1];

  v3 = v67;
LABEL_23:

  return v5;
}

- (BOOL)_canBeRated
{
  int64_t v3 = [(MUPlaceCallToActionAppearance *)self->_submissionStatus type];
  if (v3 != 1) {
    LOBYTE(v3) = [(MUPlaceCallToActionAppearance *)self->_submissionStatus type] == 4
  }
              && [(MKUGCCallToActionViewAppearance *)self->_submissionStatus ratingState];
  return v3;
}

- (int64_t)_ratingState
{
  if ([(MUPlaceCallToActionAppearance *)self->_submissionStatus type] != 4) {
    return 0;
  }
  submissionStatus = self->_submissionStatus;
  return [(MKUGCCallToActionViewAppearance *)submissionStatus ratingState];
}

- (id)typeStringForAX
{
  return @"Ratings";
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MUPlaceRatingAndSubmissionStatusRibbonViewModel *)a3;
  unsigned int v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)MUPlaceRatingAndSubmissionStatusRibbonViewModel;
    if ([(MUPlaceRibbonItemViewModel *)&v13 isEqual:v6])
    {
      mapItem = self->_mapItem;
      id v8 = [(MUPlaceRatingAndSubmissionStatusRibbonViewModel *)v6 mapItem];
      if (mapItem == v8 || [(MKMapItem *)mapItem isEqual:v8])
      {
        submissionStatus = self->_submissionStatus;
        id v10 = [(MUPlaceRatingAndSubmissionStatusRibbonViewModel *)v6 submissionStatus];
        if (submissionStatus == v10) {
          char v11 = 1;
        }
        else {
          char v11 = [(MUPlaceCallToActionAppearance *)submissionStatus isEqual:v10];
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (MUPlaceCallToActionAppearance)submissionStatus
{
  return self->_submissionStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end