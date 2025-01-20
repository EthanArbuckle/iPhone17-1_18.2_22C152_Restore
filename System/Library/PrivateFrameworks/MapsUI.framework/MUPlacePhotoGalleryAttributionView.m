@interface MUPlacePhotoGalleryAttributionView
- (MULinkView)primaryLabel;
- (MUPlacePhotoGalleryAttributionView)init;
- (MUPlacePhotoGalleryAttributionViewDelegate)delegate;
- (MUPlacePhotoGalleryAttributionViewModel)viewModel;
- (NSLayoutConstraint)captionToPrimaryLabelConstraint;
- (UIButton)accessoryButton;
- (UILabel)captionLabel;
- (UILabel)secondaryLabel;
- (UIMenu)menu;
- (UIVisualEffectView)effectView;
- (void)_accessoryViewTapped;
- (void)_attributionTapped;
- (void)_buildAndUpdateDescription;
- (void)_updateAppearance;
- (void)beginAnimatingActivityIndicator;
- (void)endAnimatingActivityIndicatorWithError:(id)a3;
- (void)setAccessoryButton:(id)a3;
- (void)setCaptionLabel:(id)a3;
- (void)setCaptionToPrimaryLabelConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setMenu:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setViewModel:(id)a3;
- (void)setupSubviews;
@end

@implementation MUPlacePhotoGalleryAttributionView

- (MUPlacePhotoGalleryAttributionView)init
{
  v5.receiver = self;
  v5.super_class = (Class)MUPlacePhotoGalleryAttributionView;
  v2 = -[MUPlacePhotoGalleryAttributionView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB1618] clearColor];
    [(MUPlacePhotoGalleryAttributionView *)v2 setBackgroundColor:v3];

    [(MUPlacePhotoGalleryAttributionView *)v2 setAccessibilityIdentifier:@"PlacePhotoGalleryAttributionView"];
    [(MUPlacePhotoGalleryAttributionView *)v2 setupSubviews];
  }
  return v2;
}

- (void)setupSubviews
{
  v92[17] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1F00]);
  v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
  objc_super v5 = (UIVisualEffectView *)[v3 initWithEffect:v4];
  effectView = self->_effectView;
  self->_effectView = v5;

  [(UIVisualEffectView *)self->_effectView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUPlacePhotoGalleryAttributionView *)self addSubview:self->_effectView];
  v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  captionLabel = self->_captionLabel;
  self->_captionLabel = v7;

  [(UILabel *)self->_captionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_captionLabel setNumberOfLines:0];
  v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  v10 = objc_msgSend(v9, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  [(UILabel *)self->_captionLabel setFont:v10];

  [(UILabel *)self->_captionLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_captionLabel setHidden:1];
  [(UILabel *)self->_captionLabel setAccessibilityIdentifier:@"CaptionLabel"];
  v11 = [(UIVisualEffectView *)self->_effectView contentView];
  [v11 addSubview:self->_captionLabel];

  v12 = [MULinkView alloc];
  v13 = -[MULinkView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v13;

  [(MULinkView *)self->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_initWeak(&location, self);
  v15 = self->_primaryLabel;
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __51__MUPlacePhotoGalleryAttributionView_setupSubviews__block_invoke;
  v88[3] = &unk_1E574FC68;
  objc_copyWeak(&v89, &location);
  [(MULinkView *)v15 setSelectionBlock:v88];
  v16 = [(UIVisualEffectView *)self->_effectView contentView];
  [v16 addSubview:self->_primaryLabel];

  v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v17;

  [(UILabel *)self->_secondaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)self->_secondaryLabel setBackgroundColor:v19];

  [(UILabel *)self->_secondaryLabel setNumberOfLines:0];
  [(UILabel *)self->_secondaryLabel setHidden:1];
  v20 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_secondaryLabel setTextColor:v20];

  [(UILabel *)self->_secondaryLabel setAccessibilityIdentifier:@"SecondaryLabel"];
  v21 = [(UIVisualEffectView *)self->_effectView contentView];
  [v21 addSubview:self->_secondaryLabel];

  v22 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  accessoryButton = self->_accessoryButton;
  self->_accessoryButton = v22;

  [(UIButton *)self->_accessoryButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_accessoryButton setContentMode:4];
  [(UIButton *)self->_accessoryButton setAccessibilityIdentifier:@"AccessoryButton"];
  LODWORD(v24) = 1144750080;
  [(UIButton *)self->_accessoryButton setContentHuggingPriority:0 forAxis:v24];
  LODWORD(v25) = 1148846080;
  [(UIButton *)self->_accessoryButton setContentCompressionResistancePriority:0 forAxis:v25];
  LODWORD(v26) = 1144750080;
  [(UIButton *)self->_accessoryButton setContentHuggingPriority:1 forAxis:v26];
  [(UIButton *)self->_accessoryButton _mapkit_setTarget:self action:sel__accessoryViewTapped];
  v27 = [(UIVisualEffectView *)self->_effectView contentView];
  [v27 addSubview:self->_accessoryButton];

  v87 = [(UIVisualEffectView *)self->_effectView safeAreaLayoutGuide];
  v28 = [(MULinkView *)self->_primaryLabel topAnchor];
  v29 = [(UILabel *)self->_captionLabel bottomAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:0.0];
  captionToPrimaryLabelConstraint = self->_captionToPrimaryLabelConstraint;
  self->_captionToPrimaryLabelConstraint = v30;

  v46 = (void *)MEMORY[0x1E4F28DC8];
  v86 = [(UILabel *)self->_captionLabel leadingAnchor];
  v85 = [v87 leadingAnchor];
  v84 = [v86 constraintEqualToAnchor:v85 constant:16.0];
  v92[0] = v84;
  v83 = [(UILabel *)self->_captionLabel topAnchor];
  v82 = [(UIVisualEffectView *)self->_effectView topAnchor];
  v81 = [v83 constraintEqualToAnchor:v82 constant:14.0];
  v92[1] = v81;
  v80 = [(UILabel *)self->_captionLabel trailingAnchor];
  v79 = [(UIButton *)self->_accessoryButton leadingAnchor];
  v78 = [v80 constraintLessThanOrEqualToAnchor:v79];
  v32 = self->_captionToPrimaryLabelConstraint;
  v92[2] = v78;
  v92[3] = v32;
  v77 = [(MULinkView *)self->_primaryLabel leadingAnchor];
  v76 = [v87 leadingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76 constant:16.0];
  v92[4] = v75;
  v74 = [(MULinkView *)self->_primaryLabel trailingAnchor];
  v73 = [(UIButton *)self->_accessoryButton leadingAnchor];
  v72 = [v74 constraintLessThanOrEqualToAnchor:v73];
  v92[5] = v72;
  v71 = [(UILabel *)self->_secondaryLabel leadingAnchor];
  v70 = [(MULinkView *)self->_primaryLabel leadingAnchor];
  v69 = [v71 constraintEqualToAnchor:v70];
  v92[6] = v69;
  v68 = [(UILabel *)self->_secondaryLabel topAnchor];
  v67 = [(MULinkView *)self->_primaryLabel bottomAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v92[7] = v66;
  v65 = [(UILabel *)self->_secondaryLabel bottomAnchor];
  v64 = [(MUPlacePhotoGalleryAttributionView *)self bottomAnchor];
  v63 = [v65 constraintEqualToAnchor:v64 constant:-39.0];
  v92[8] = v63;
  v62 = [(UIButton *)self->_accessoryButton trailingAnchor];
  v61 = [v87 trailingAnchor];
  v60 = [v62 constraintEqualToAnchor:v61 constant:-16.0];
  v92[9] = v60;
  v59 = [(UIButton *)self->_accessoryButton topAnchor];
  v58 = [v87 topAnchor];
  v57 = [v59 constraintEqualToAnchor:v58 constant:8.0];
  v92[10] = v57;
  v56 = [(UIButton *)self->_accessoryButton bottomAnchor];
  v55 = [(MUPlacePhotoGalleryAttributionView *)self bottomAnchor];
  v54 = [v56 constraintLessThanOrEqualToAnchor:v55];
  v92[11] = v54;
  v53 = [(UIButton *)self->_accessoryButton leadingAnchor];
  v52 = [(UILabel *)self->_secondaryLabel trailingAnchor];
  v51 = [v53 constraintGreaterThanOrEqualToAnchor:v52];
  v92[12] = v51;
  v50 = [(UIVisualEffectView *)self->_effectView leadingAnchor];
  v49 = [(MUPlacePhotoGalleryAttributionView *)self leadingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v92[13] = v48;
  v47 = [(UIVisualEffectView *)self->_effectView trailingAnchor];
  v33 = [(MUPlacePhotoGalleryAttributionView *)self trailingAnchor];
  v34 = [v47 constraintEqualToAnchor:v33];
  v92[14] = v34;
  v35 = [(UIVisualEffectView *)self->_effectView topAnchor];
  v36 = [(MUPlacePhotoGalleryAttributionView *)self topAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  v92[15] = v37;
  v38 = [(UIVisualEffectView *)self->_effectView bottomAnchor];
  v39 = [(MUPlacePhotoGalleryAttributionView *)self bottomAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  v92[16] = v40;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:17];
  [v46 activateConstraints:v41];

  id v42 = [(UIView *)self _mapsui_addHairlineAtTopWithMargin:0.0];
  v43 = self;
  v91 = v43;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
  id v45 = (id)[(MUPlacePhotoGalleryAttributionView *)self registerForTraitChanges:v44 withAction:sel__buildAndUpdateDescription];

  objc_destroyWeak(&v89);
  objc_destroyWeak(&location);
}

void __51__MUPlacePhotoGalleryAttributionView_setupSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _attributionTapped];
    id WeakRetained = v2;
  }
}

- (void)_buildAndUpdateDescription
{
  v93[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel caption];
  uint64_t v4 = [v3 length];
  objc_super v5 = [(MUPlacePhotoGalleryAttributionView *)self captionLabel];
  v6 = v5;
  if (v4)
  {
    [v5 setText:v3];

    v7 = [(MUPlacePhotoGalleryAttributionView *)self captionLabel];
    [v7 setHidden:0];

    v8 = [(MUPlacePhotoGalleryAttributionView *)self captionToPrimaryLabelConstraint];
    v9 = v8;
    double v10 = 8.0;
  }
  else
  {
    [v5 setText:0];

    v11 = [(MUPlacePhotoGalleryAttributionView *)self captionLabel];
    [v11 setHidden:1];

    v8 = [(MUPlacePhotoGalleryAttributionView *)self captionToPrimaryLabelConstraint];
    v9 = v8;
    double v10 = 0.0;
  }
  [v8 setConstant:v10];

  uint64_t v91 = *MEMORY[0x1E4FB06F8];
  uint64_t v12 = v91;
  v13 = [MEMORY[0x1E4F30EA8] sharedManager];
  v14 = [v13 subtitleFont];
  v93[0] = v14;
  uint64_t v92 = *MEMORY[0x1E4FB0700];
  uint64_t v15 = v92;
  v16 = [MEMORY[0x1E4FB1618] labelColor];
  v93[1] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:&v91 count:2];

  uint64_t v89 = v12;
  v18 = [MEMORY[0x1E4F30EA8] sharedManager];
  v19 = [v18 subtitleFont];
  double v20 = *MEMORY[0x1E4FB09E0];
  v21 = objc_msgSend(v19, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);
  v90 = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];

  v87[0] = v12;
  v23 = [MEMORY[0x1E4F30EA8] sharedManager];
  double v24 = [v23 subtitleFont];
  double v25 = objc_msgSend(v24, "_mapkit_fontWithWeight:", v20);
  uint64_t v26 = *MEMORY[0x1E4FB0720];
  v88[0] = v25;
  v88[1] = &stru_1EE3BF360;
  v87[1] = v26;
  v87[2] = v15;
  v27 = [MEMORY[0x1E4FB1618] linkColor];
  v88[2] = v27;
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:3];

  v29 = [(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel titleText];
  uint64_t v30 = [v29 length];

  v84 = (void *)v28;
  v85 = v22;
  v86 = v17;
  if (v30)
  {
    id v31 = objc_alloc(MEMORY[0x1E4F28B18]);
    v32 = [(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel titleText];
    uint64_t v33 = [v31 initWithString:v32 attributes:v17];
  }
  else
  {
    switch([(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel attributionType])
    {
      case 1:
        id v42 = [(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel vendorName];
        uint64_t v43 = [v42 length];

        if (!v43)
        {
          v34 = 0;
          int v35 = 1;
          goto LABEL_9;
        }
        v32 = _MULocalizedStringFromThisBundle(@"From Vendor [Vendor Photo Attribution]");
        v83 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v32 attributes:v17];
        if ([(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel supportsPunchOut]) {
          v44 = (void *)v28;
        }
        else {
          v44 = v22;
        }
        id v45 = v44;
        id v46 = objc_alloc(MEMORY[0x1E4F28B18]);
        v47 = [(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel vendorName];
        v82 = (void *)[v46 initWithString:v47 attributes:v45];

        v48 = (void *)MEMORY[0x1E4FB1830];
        v49 = [MEMORY[0x1E4F30EA8] sharedManager];
        v50 = [v49 subtitleFont];
        v51 = objc_msgSend(v50, "_mapkit_fontWithWeight:", v20);
        uint64_t v52 = [v48 configurationWithFont:v51 scale:1];

        id v53 = objc_alloc_init(MEMORY[0x1E4FB0870]);
        v81 = (void *)v52;
        v54 = objc_msgSend(MEMORY[0x1E4FB1818], "_mapsui_systemImageNamed:withConfiguration:", @"arrow.up.right.square.fill", v52);
        v55 = [v54 imageWithRenderingMode:2];
        [v53 setImage:v55];

        if ([(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel supportsPunchOut])
        {
          v56 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v53];
          v57 = (void *)[v56 mutableCopy];

          objc_msgSend(v57, "addAttributes:range:", v45, 0, objc_msgSend(v57, "length"));
        }
        else
        {
          v57 = objc_opt_new();
        }
        v79 = (void *)MEMORY[0x1E4F28B18];
        v80 = (void *)[v57 copy];
        v34 = objc_msgSend(v79, "localizedAttributedStringWithFormat:options:", v83, 2, v82, v80);

        int v35 = 1;
        goto LABEL_8;
      case 2:
        v71 = [(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel authorName];
        uint64_t v72 = [v71 length];

        if (v72)
        {
          v73 = @"From %@ [Public Attribution]";
          goto LABEL_39;
        }
        v78 = @"From a Visitor [Public Attribution]";
        goto LABEL_43;
      case 3:
        v32 = _MULocalizedStringFromThisBundle(@"From %@ (Owner) [Business Owner Photo Attribution");
        v74 = [(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel placeName];
        v34 = MUHighlightedAttributionString(v32, v17, v74, v22);

        int v35 = 0;
        goto LABEL_8;
      case 4:
        v75 = [(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel authorName];
        uint64_t v76 = [v75 length];

        if (v76)
        {
          v73 = @"[Photo Credit On - Full Screen Gallery] From [photo credit name] (You)";
LABEL_39:
          v32 = _MULocalizedStringFromThisBundle(v73);
          v77 = [(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel authorName];
          v34 = MUHighlightedAttributionString(v32, v17, v77, v22);

          goto LABEL_7;
        }
        v78 = @"[No Photo Credit - Full Screen Gallery] From a Visitor (You)";
LABEL_43:
        v32 = _MULocalizedStringFromThisBundle(v78);
        uint64_t v33 = MUHighlightedAttributionString(v32, v17, 0, 0);
        break;
      default:
        v34 = 0;
        int v35 = 1;
        goto LABEL_9;
    }
  }
  v34 = (void *)v33;
LABEL_7:
  int v35 = 1;
LABEL_8:

LABEL_9:
  v36 = [(MUPlacePhotoGalleryAttributionView *)self primaryLabel];
  [v36 setAttributedText:v34];

  v37 = [(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel subtitleText];
  uint64_t v38 = [v37 length];

  if (v38)
  {
    id v39 = objc_alloc(MEMORY[0x1E4F28B18]);
    v40 = [(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel subtitleText];
    v41 = (void *)[v39 initWithString:v40];
  }
  else
  {
    v40 = [(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel placeName];
    if (qword_1E9315278 != -1) {
      dispatch_once(&qword_1E9315278, &__block_literal_global_26);
    }
    v58 = (void *)_MergedGlobals_1_0;
    v59 = [(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel photoDate];
    v60 = [v58 stringFromDate:v59];

    v61 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    if (v35 && [v40 length]) {
      [v61 addObject:v40];
    }
    if ([v61 count] && objc_msgSend(v60, "length"))
    {
      v62 = _MULocalizedStringFromThisBundle(@" · ");
      [v61 addObject:v62];
    }
    if ([v60 length]) {
      [v61 addObject:v60];
    }
    v63 = MUMap(v61, &__block_literal_global_181);
    v64 = (void *)[v63 copy];
    v41 = +[MapsUILayout buildAttributedDisplayStringForComponents:v64];
  }
  uint64_t v65 = [v41 length];
  v66 = [(MUPlacePhotoGalleryAttributionView *)self secondaryLabel];
  v67 = v66;
  if (v65)
  {
    [v66 setAttributedText:v41];

    v68 = [(MUPlacePhotoGalleryAttributionView *)self secondaryLabel];
    v69 = v68;
    uint64_t v70 = 0;
  }
  else
  {
    [v66 setAttributedText:0];

    v68 = [(MUPlacePhotoGalleryAttributionView *)self secondaryLabel];
    v69 = v68;
    uint64_t v70 = 1;
  }
  [v68 setHidden:v70];
}

void __64__MUPlacePhotoGalleryAttributionView__buildAndUpdateDescription__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_1_0;
  _MergedGlobals_1_0 = (uint64_t)v0;

  [(id)_MergedGlobals_1_0 setLocalizedDateFormatFromTemplate:@"MMMM yyyy"];
  id v2 = (void *)_MergedGlobals_1_0;
  id v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];

  uint64_t v4 = (void *)_MergedGlobals_1_0;
  id v5 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [v4 setTimeZone:v5];
}

id __64__MUPlacePhotoGalleryAttributionView__buildAndUpdateDescription__block_invoke_2(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = (objc_class *)MEMORY[0x1E4F28B18];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v10 = *MEMORY[0x1E4FB06F8];
  id v5 = [MEMORY[0x1E4F30EA8] sharedManager];
  v6 = [v5 attributionFont];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = (void *)[v4 initWithString:v3 attributes:v7];

  return v8;
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  if ((-[MUPlacePhotoGalleryAttributionViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(MUPlacePhotoGalleryAttributionView *)self _updateAppearance];
  }
}

- (void)_updateAppearance
{
  v38[2] = *MEMORY[0x1E4F143B8];
  [(MUPlacePhotoGalleryAttributionView *)self _buildAndUpdateDescription];
  id v3 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  int64_t v4 = [(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel accessoryStyle];
  if (v4 == 3)
  {
    v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis.circle"];
    v8 = (void *)MEMORY[0x1E4FB1830];
    v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    uint64_t v10 = [v8 configurationWithFont:v9 scale:3];
    v11 = [v7 imageWithConfiguration:v10];
    [v3 setImage:v11];

    objc_initWeak(&location, self);
    uint64_t v12 = (void *)MEMORY[0x1E4FB13F0];
    v13 = _MULocalizedStringFromThisBundle(@"Delete Your Photo");
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __55__MUPlacePhotoGalleryAttributionView__updateAppearance__block_invoke;
    v35[3] = &unk_1E574FCE0;
    objc_copyWeak(&v36, &location);
    v14 = [v12 actionWithTitle:v13 image:0 identifier:0 handler:v35];

    uint64_t v15 = (void *)MEMORY[0x1E4FB13F0];
    v16 = _MULocalizedStringFromThisBundle(@"Change Photo Credit");
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __55__MUPlacePhotoGalleryAttributionView__updateAppearance__block_invoke_2;
    uint64_t v33 = &unk_1E574FCE0;
    objc_copyWeak(&v34, &location);
    v17 = [v15 actionWithTitle:v16 image:0 identifier:0 handler:&v30];

    v18 = (void *)MEMORY[0x1E4FB1970];
    v38[0] = v14;
    v38[1] = v17;
    v19 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v38, 2, v30, v31, v32, v33);
    double v20 = [v18 menuWithChildren:v19];

    v21 = [(MUPlacePhotoGalleryAttributionView *)self accessoryButton];
    [v21 setMenu:v20];

    v22 = [(MUPlacePhotoGalleryAttributionView *)self accessoryButton];
    [v22 setShowsMenuAsPrimaryAction:1];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
    goto LABEL_7;
  }
  if (v4 == 2)
  {
    v23 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.bubble"];
    double v24 = (void *)MEMORY[0x1E4FB1830];
    double v25 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    uint64_t v26 = [v24 configurationWithFont:v25 scale:3];
    v27 = [v23 imageWithConfiguration:v26];
    [v3 setImage:v27];

    goto LABEL_7;
  }
  if (v4)
  {
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  id v5 = [(MUPlacePhotoGalleryAttributionView *)self accessoryButton];
  [v5 setImage:0 forState:0];

  uint64_t v6 = 1;
LABEL_8:
  uint64_t v28 = [(MUPlacePhotoGalleryAttributionView *)self accessoryButton];
  [v28 setConfiguration:v3];

  v29 = [(MUPlacePhotoGalleryAttributionView *)self accessoryButton];
  [v29 setHidden:v6];
}

void __55__MUPlacePhotoGalleryAttributionView__updateAppearance__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained delegate];
    [v2 attributionViewDidSelectDeletePhoto:v3];

    id WeakRetained = v3;
  }
}

void __55__MUPlacePhotoGalleryAttributionView__updateAppearance__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained delegate];
    [v2 attributionViewDidSelectEditPhotoCredit:v3];

    id WeakRetained = v3;
  }
}

- (void)_accessoryViewTapped
{
  int64_t v3 = [(MUPlacePhotoGalleryAttributionViewModel *)self->_viewModel accessoryStyle];
  if (v3 == 2)
  {
    id v4 = [(MUPlacePhotoGalleryAttributionView *)self delegate];
    [v4 attributionViewDidTapReportAnIssue:self];
  }
  else
  {
    if (v3 != 1) {
      return;
    }
    id v4 = [(MUPlacePhotoGalleryAttributionView *)self delegate];
    [v4 attributionViewDidTapAttributionPunchout:self];
  }
}

- (void)beginAnimatingActivityIndicator
{
  int64_t v3 = [(MUPlacePhotoGalleryAttributionView *)self accessoryButton];
  id v5 = [v3 configuration];

  [v5 setShowsActivityIndicator:1];
  id v4 = [(MUPlacePhotoGalleryAttributionView *)self accessoryButton];
  [v4 setConfiguration:v5];
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  id v4 = [(MUPlacePhotoGalleryAttributionView *)self accessoryButton];
  id v6 = [v4 configuration];

  [v6 setShowsActivityIndicator:0];
  id v5 = [(MUPlacePhotoGalleryAttributionView *)self accessoryButton];
  [v5 setConfiguration:v6];
}

- (void)_attributionTapped
{
  id v3 = [(MUPlacePhotoGalleryAttributionView *)self delegate];
  [v3 attributionViewDidTapAttributionPunchout:self];
}

- (MUPlacePhotoGalleryAttributionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUPlacePhotoGalleryAttributionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MUPlacePhotoGalleryAttributionViewModel)viewModel
{
  return self->_viewModel;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (MULinkView)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void)setAccessoryButton:(id)a3
{
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
}

- (UILabel)captionLabel
{
  return self->_captionLabel;
}

- (void)setCaptionLabel:(id)a3
{
}

- (NSLayoutConstraint)captionToPrimaryLabelConstraint
{
  return self->_captionToPrimaryLabelConstraint;
}

- (void)setCaptionToPrimaryLabelConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captionToPrimaryLabelConstraint, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end