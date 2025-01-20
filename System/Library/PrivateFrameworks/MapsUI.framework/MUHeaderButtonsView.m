@interface MUHeaderButtonsView
- (BOOL)shouldStackForButtons;
- (MUHeaderButtonsView)initWithConfiguration:(id)a3;
- (MUHeaderButtonsViewDelegate)delegate;
- (_MKPlaceActionButtonController)alternatePrimaryButtonController;
- (_MKPlaceActionButtonController)secondaryButtonController;
- (unint64_t)primaryButtonType;
- (void)ETAProviderUpdated:(id)a3;
- (void)_activateNewConstraints:(id)a3;
- (void)_createLayout;
- (void)_didTapAlternatePrimaryAction;
- (void)_didTapMoreButton;
- (void)_didTapPrimaryAction;
- (void)_didTapSecondaryAction;
- (void)_loadPrimaryButtonWithPrimaryType:(unint64_t)a3;
- (void)_loadSecondaryButtonWithSecondaryActionController:(id)a3;
- (void)_setupSubviews;
- (void)_updateConstraintsIfNeeded;
- (void)layoutSubviews;
- (void)setAlternatePrimaryButtonController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPrimaryButtonType:(unint64_t)a3;
- (void)setSecondaryButtonController:(id)a3;
@end

@implementation MUHeaderButtonsView

- (MUHeaderButtonsView)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUHeaderButtonsView;
  v6 = -[MUHeaderButtonsView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    [(MUHeaderButtonsView *)v7 setAccessibilityIdentifier:@"HeaderButtons"];
    [(MUHeaderButtonsView *)v7 _setupSubviews];
  }

  return v7;
}

- (void)_didTapPrimaryAction
{
  v4 = objc_alloc_init(MUPresentationOptions);
  [(MUPresentationOptions *)v4 setSourceView:self->_primaryButton];
  [(MUPlaceHeaderButton *)self->_primaryButton frame];
  -[MUPresentationOptions setSourceRect:](v4, "setSourceRect:");
  v3 = [(MUHeaderButtonsView *)self delegate];
  [v3 headerButtonsView:self didSelectPrimaryType:self->_primaryButtonType withPresentationOptions:v4];
}

- (void)_didTapAlternatePrimaryAction
{
  v3 = [(_MKPlaceActionButtonController *)self->_alternatePrimaryButtonController buttonSelectedBlock];

  if (v3)
  {
    v4 = [(_MKPlaceActionButtonController *)self->_alternatePrimaryButtonController buttonSelectedBlock];
    v4[2](v4, self->_secondaryButton);
  }
}

- (void)_didTapSecondaryAction
{
  v3 = [(_MKPlaceActionButtonController *)self->_secondaryButtonController buttonSelectedBlock];

  if (v3)
  {
    v4 = [(_MKPlaceActionButtonController *)self->_secondaryButtonController buttonSelectedBlock];
    v4[2](v4, self->_secondaryButton);
  }
}

- (void)_didTapMoreButton
{
  v3 = [(MUHeaderButtonsView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MUHeaderButtonsView *)self delegate];
    [v5 headerButtonsViewWillPresentMenu:self];
  }
}

- (void)_setupSubviews
{
  v23[3] = *MEMORY[0x1E4F143B8];
  if ([(MUHeaderButtonsViewConfiguration *)self->_configuration showMoreButton])
  {
    v3 = +[MUPlaceHeaderButton buttonWithType:0];
    moreButton = self->_moreButton;
    self->_moreButton = v3;

    [(MUPlaceHeaderButton *)self->_moreButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v5) = 1148846080;
    [(MUPlaceHeaderButton *)self->_moreButton setContentHuggingPriority:0 forAxis:v5];
    LODWORD(v6) = 1148846080;
    [(MUPlaceHeaderButton *)self->_moreButton setContentHuggingPriority:1 forAxis:v6];
    LODWORD(v7) = 1148846080;
    [(MUPlaceHeaderButton *)self->_moreButton setContentCompressionResistancePriority:0 forAxis:v7];
    LODWORD(v8) = 1148846080;
    [(MUPlaceHeaderButton *)self->_moreButton setContentCompressionResistancePriority:1 forAxis:v8];
    [(MUPlaceHeaderButton *)self->_moreButton setAccessibilityIdentifier:@"PlaceHeaderMoreButton"];
    [(MUPlaceHeaderButton *)self->_moreButton setShowsMenuAsPrimaryAction:1];
    objc_initWeak(&location, self);
    objc_super v9 = self->_moreButton;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __37__MUHeaderButtonsView__setupSubviews__block_invoke;
    v20 = &unk_1E574F928;
    objc_copyWeak(&v21, &location);
    [(MUPlaceHeaderButton *)v9 _setMenuProvider:&v17];
    v10 = objc_msgSend(MEMORY[0x1E4FB14D8], "_mapsui_secondaryHeaderActionConfiguration", v17, v18, v19, v20);
    v11 = objc_msgSend(MEMORY[0x1E4FB1818], "_mapsui_systemImageNamed:", @"ellipsis");
    [v10 setImage:v11];

    objc_msgSend(v10, "setContentInsets:", 0.0, 11.0, 0.0, 11.0);
    [(MUPlaceHeaderButton *)self->_moreButton setConfiguration:v10];
    [(MUPlaceHeaderButton *)self->_moreButton addTarget:self action:sel__didTapMoreButton forControlEvents:0x4000];
    [(MUHeaderButtonsView *)self addSubview:self->_moreButton];
    v12 = self;
    v23[0] = v12;
    v13 = self;
    v23[1] = v13;
    v14 = self;
    v23[2] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
    id v16 = (id)[(MUHeaderButtonsView *)self registerForTraitChanges:v15 withAction:sel__updateContent];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

id __37__MUHeaderButtonsView__setupSubviews__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MUPresentationOptions);
    [(MUPresentationOptions *)v2 setSourceView:WeakRetained[54]];
    [WeakRetained[54] frame];
    -[MUPresentationOptions setSourceRect:](v2, "setSourceRect:");
    v3 = [WeakRetained[57] menuProvider];
    char v4 = [v3 createHeaderButtonsMenuWithPresentationOptions:v2];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)_loadSecondaryButtonWithSecondaryActionController:(id)a3
{
  double v5 = (_MKPlaceActionButtonController *)a3;
  p_secondaryButtonController = (id *)&self->_secondaryButtonController;
  if (self->_secondaryButtonController != v5)
  {
    uint64_t v17 = v5;
    objc_storeStrong((id *)&self->_secondaryButtonController, a3);
    if (!*p_secondaryButtonController)
    {
      [(MUPlaceHeaderButton *)self->_secondaryButton removeFromSuperview];
      secondaryButton = self->_secondaryButton;
      self->_secondaryButton = 0;
    }
    if (!self->_secondaryButton)
    {
      double v8 = +[MUPlaceHeaderButton buttonWithType:1];
      objc_super v9 = self->_secondaryButton;
      self->_secondaryButton = v8;

      [(MUPlaceHeaderButton *)self->_secondaryButton setTranslatesAutoresizingMaskIntoConstraints:0];
      [(MUPlaceHeaderButton *)self->_secondaryButton addTarget:self action:sel__didTapSecondaryAction forControlEvents:0x2000];
    }
    v10 = objc_msgSend(MEMORY[0x1E4FB14D8], "_mapsui_secondaryHeaderActionConfiguration");
    v11 = [*p_secondaryButtonController buttonTitle];
    [v10 setTitle:v11];

    v12 = (void *)MEMORY[0x1E4FB1818];
    v13 = [*p_secondaryButtonController symbolName];
    v14 = objc_msgSend(v12, "_mapsui_systemImageNamed:", v13);
    [v10 setImage:v14];

    [(MUPlaceHeaderButton *)self->_secondaryButton setConfiguration:v10];
    v15 = [(MUPlaceHeaderButton *)self->_secondaryButton superview];

    if (v15 != self)
    {
      [(MUPlaceHeaderButton *)self->_secondaryButton setAccessibilityIdentifier:@"SecondaryButton"];
      [(MUHeaderButtonsView *)self addSubview:self->_secondaryButton];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_etaProvider);
    [(MUHeaderButtonsView *)self ETAProviderUpdated:WeakRetained];

    double v5 = v17;
  }
}

- (void)_loadPrimaryButtonWithPrimaryType:(unint64_t)a3
{
  if (self->_primaryButtonType == a3) {
    return;
  }
  self->_primaryButtonType = a3;
  primaryButton = self->_primaryButton;
  if (a3)
  {
    if (primaryButton) {
      goto LABEL_18;
    }
    double v5 = +[MUPlaceHeaderButton buttonWithType:1];
    double v6 = self->_primaryButton;
    self->_primaryButton = v5;

    [(MUPlaceHeaderButton *)self->_primaryButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MUPlaceHeaderButton *)self->_primaryButton addTarget:self action:sel__didTapPrimaryAction forControlEvents:0x2000];
    double v7 = objc_msgSend(MEMORY[0x1E4FB14D8], "_mapsui_configurationForPrimaryType:", self->_primaryButtonType);
    switch(self->_primaryButtonType)
    {
      case 1uLL:
        [(MUPlaceHeaderButton *)self->_primaryButton setAccessibilityIdentifier:@"PrimaryButtonTypeDirections"];
        double v8 = +[_MUETAConfiguration configurationForEtaStringFor:0xFFFFFFFLL travelTime:self->_secondaryButtonController != 0 hasSecondaryController:self->_isStackingButtons isStackingButtons:0.0];
        objc_super v9 = (void *)MEMORY[0x1E4FB1818];
        v10 = [v8 symbolName];
        v11 = objc_msgSend(v9, "_mapsui_systemImageNamed:", v10);
        [v7 setImage:v11];

        goto LABEL_13;
      case 2uLL:
        [(MUPlaceHeaderButton *)self->_primaryButton setAccessibilityIdentifier:@"PrimaryButtonTypeReroute"];
        [(MUHeaderButtonsViewConfiguration *)self->_configuration detourTime];
        v13 = +[_MUETAConfiguration rerouteConfigurationETAStringForTravelTime:"rerouteConfigurationETAStringForTravelTime:"];
        double v8 = v13;
        goto LABEL_14;
      case 3uLL:
        [(MUPlaceHeaderButton *)self->_primaryButton setAccessibilityIdentifier:@"PrimaryButtonTypeShareCurrentLocation"];
        v14 = objc_msgSend(MEMORY[0x1E4FB14D8], "_mapsui_secondaryHeaderActionConfiguration");

        v15 = objc_msgSend(MEMORY[0x1E4FB1818], "_mapsui_systemImageNamed:", @"square.and.arrow.up");
        [v14 setImage:v15];

        double v8 = _MULocalizedStringFromThisBundle(@"Share [Placecard]");
        [v14 setTitle:v8];
        double v7 = v14;
        goto LABEL_15;
      case 4uLL:
        [(MUPlaceHeaderButton *)self->_primaryButton setAccessibilityIdentifier:@"PrimaryButtonTypeAddStop"];
        [(MUHeaderButtonsViewConfiguration *)self->_configuration detourTime];
        double v8 = +[_MUETAConfiguration addStopConfigurationETAStringForTravelTime:](_MUETAConfiguration, "addStopConfigurationETAStringForTravelTime:");
        id v16 = objc_msgSend(MEMORY[0x1E4FB1818], "_mapsui_systemImageNamed:", @"plus.circle.fill");
        [v7 setImage:v16];

LABEL_13:
        v13 = v8;
LABEL_14:
        uint64_t v17 = [v13 etaString];
        [v7 setTitle:v17];

LABEL_15:
        break;
      default:
        break;
    }
    [(MUPlaceHeaderButton *)self->_primaryButton setConfiguration:v7];

    if (self->_primaryButtonType)
    {
      primaryButton = self->_primaryButton;
LABEL_18:
      uint64_t v18 = [(MUPlaceHeaderButton *)primaryButton superview];

      if (v18 != self)
      {
        v19 = self->_primaryButton;
        [(MUHeaderButtonsView *)self addSubview:v19];
      }
    }
  }
  else
  {
    [(MUPlaceHeaderButton *)primaryButton removeFromSuperview];
    v12 = self->_primaryButton;
    self->_primaryButton = 0;
  }
}

- (void)setPrimaryButtonType:(unint64_t)a3
{
  if (self->_primaryButtonType != a3)
  {
    -[MUHeaderButtonsView _loadPrimaryButtonWithPrimaryType:](self, "_loadPrimaryButtonWithPrimaryType:");
    [(MUHeaderButtonsView *)self _updateContent];
  }
}

- (void)setSecondaryButtonController:(id)a3
{
  if (self->_secondaryButtonController != a3)
  {
    -[MUHeaderButtonsView _loadSecondaryButtonWithSecondaryActionController:](self, "_loadSecondaryButtonWithSecondaryActionController:");
    [(MUHeaderButtonsView *)self _updateContent];
  }
}

- (void)_createLayout
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  self->_isStackingButtons = [(MUHeaderButtonsView *)self shouldStackForButtons];
  v3 = self;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  alternatePrimaryButton = v3->_alternatePrimaryButton;
  if (v3->_primaryButton)
  {
    if (alternatePrimaryButton)
    {
      double v6 = [(MUPlaceHeaderButton *)v3->_primaryButton widthAnchor];
      double v7 = [(MUPlaceHeaderButton *)v3->_alternatePrimaryButton widthAnchor];
      double v8 = [v6 constraintEqualToAnchor:v7];
      [v4 addObject:v8];

      objc_super v9 = [(MUPlaceHeaderButton *)v3->_primaryButton heightAnchor];
      v10 = [(MUPlaceHeaderButton *)v3->_alternatePrimaryButton heightAnchor];
      v11 = [v9 constraintEqualToAnchor:v10];
      [v4 addObject:v11];

      v12 = [(MUPlaceHeaderButton *)v3->_primaryButton leadingAnchor];
      v13 = [(MUHeaderButtonsView *)v3 leadingAnchor];
      v14 = [v12 constraintEqualToAnchor:v13];
      [v4 addObject:v14];

      v15 = [(MUPlaceHeaderButton *)v3->_primaryButton topAnchor];
      id v16 = [(MUHeaderButtonsView *)v3 topAnchor];
      uint64_t v17 = [v15 constraintEqualToAnchor:v16];
      [v4 addObject:v17];

      uint64_t v18 = [(MUPlaceHeaderButton *)v3->_primaryButton trailingAnchor];
      v19 = [(MUPlaceHeaderButton *)v3->_alternatePrimaryButton leadingAnchor];
      v20 = [v18 constraintEqualToAnchor:v19 constant:-8.0];
      [v4 addObject:v20];

      id v21 = [(MUPlaceHeaderButton *)v3->_alternatePrimaryButton topAnchor];
      v22 = [(MUPlaceHeaderButton *)v3->_primaryButton topAnchor];
      v23 = [v21 constraintEqualToAnchor:v22];
      [v4 addObject:v23];

      v24 = [(MUPlaceHeaderButton *)v3->_alternatePrimaryButton trailingAnchor];
      v25 = [(MUHeaderButtonsView *)v3 trailingAnchor];
      v26 = [v24 constraintEqualToAnchor:v25];
      [v4 addObject:v26];

      secondaryButton = v3->_secondaryButton;
      if (secondaryButton)
      {
        v28 = [(MUPlaceHeaderButton *)secondaryButton leadingAnchor];
        v29 = [(MUHeaderButtonsView *)v3 leadingAnchor];
        v30 = [v28 constraintEqualToAnchor:v29];
        [v4 addObject:v30];

        v31 = [(MUPlaceHeaderButton *)v3->_secondaryButton trailingAnchor];
        v32 = [(MUHeaderButtonsView *)v3 trailingAnchor];
        v33 = [v31 constraintEqualToAnchor:v32];
        [v4 addObject:v33];

        primaryButton = v3->_secondaryButton;
      }
      else
      {
        v132 = [(MUPlaceHeaderButton *)v3->_alternatePrimaryButton bottomAnchor];
        v133 = [(MUPlaceHeaderButton *)v3->_primaryButton bottomAnchor];
        v134 = [v132 constraintEqualToAnchor:v133];
        [v4 addObject:v134];

        primaryButton = v3->_primaryButton;
      }
      v135 = [(MUPlaceHeaderButton *)primaryButton bottomAnchor];
      v136 = [(MUHeaderButtonsView *)v3 bottomAnchor];
      v137 = [v135 constraintEqualToAnchor:v136];
      [v4 addObject:v137];

      v138 = (void *)[v4 copy];
      [(MUHeaderButtonsView *)v3 _activateNewConstraints:v138];

      v53 = v4;
      goto LABEL_43;
    }
  }
  else if (alternatePrimaryButton && v3->_secondaryButton)
  {
    v35 = [(MUPlaceHeaderButton *)alternatePrimaryButton widthAnchor];
    v36 = [(MUPlaceHeaderButton *)v3->_secondaryButton widthAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    [v4 addObject:v37];

    v38 = [(MUPlaceHeaderButton *)v3->_alternatePrimaryButton leadingAnchor];
    v39 = [(MUHeaderButtonsView *)v3 leadingAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    [v4 addObject:v40];

    v41 = [(MUPlaceHeaderButton *)v3->_alternatePrimaryButton trailingAnchor];
    v42 = [(MUPlaceHeaderButton *)v3->_secondaryButton leadingAnchor];
    v43 = [v41 constraintEqualToAnchor:v42 constant:-8.0];
    [v4 addObject:v43];

    v44 = [(MUPlaceHeaderButton *)v3->_secondaryButton trailingAnchor];
    v45 = [(MUHeaderButtonsView *)v3 trailingAnchor];
    v46 = [v44 constraintEqualToAnchor:v45];
    [v4 addObject:v46];

    v47 = [(MUPlaceHeaderButton *)v3->_alternatePrimaryButton bottomAnchor];
    v48 = [(MUHeaderButtonsView *)v3 bottomAnchor];
    v49 = [v47 constraintEqualToAnchor:v48];
    [v4 addObject:v49];

    v50 = [(MUPlaceHeaderButton *)v3->_secondaryButton bottomAnchor];
    v51 = [(MUHeaderButtonsView *)v3 bottomAnchor];
    v52 = [v50 constraintEqualToAnchor:v51];
    [v4 addObject:v52];

    v53 = v4;
    v54 = (void *)[v4 copy];
    [(MUHeaderButtonsView *)v3 _activateNewConstraints:v54];

    goto LABEL_43;
  }
  v55 = objc_opt_new();
  v56 = v55;
  if (v3->_primaryButton) {
    objc_msgSend(v55, "addObject:");
  }
  if (v3->_secondaryButton) {
    objc_msgSend(v56, "addObject:");
  }
  if (v3->_moreButton) {
    objc_msgSend(v56, "addObject:");
  }
  if (self->_isStackingButtons && v3->_secondaryButton && (v57 = v3->_primaryButton) != 0)
  {
    v58 = [(MUPlaceHeaderButton *)v57 leadingAnchor];
    v59 = [(MUHeaderButtonsView *)v3 leadingAnchor];
    v60 = [v58 constraintEqualToAnchor:v59];
    v61 = v4;
    [v4 addObject:v60];

    v62 = [(MUPlaceHeaderButton *)v3->_primaryButton topAnchor];
    v63 = [(MUHeaderButtonsView *)v3 topAnchor];
    v64 = [v62 constraintEqualToAnchor:v63];
    [v61 addObject:v64];

    v65 = [(MUPlaceHeaderButton *)v3->_primaryButton trailingAnchor];
    v66 = [(MUHeaderButtonsView *)v3 trailingAnchor];
    v67 = [v65 constraintEqualToAnchor:v66];
    [v61 addObject:v67];

    v68 = [(MUPlaceHeaderButton *)v3->_primaryButton heightAnchor];
    v69 = [(MUPlaceHeaderButton *)v3->_secondaryButton heightAnchor];
    v70 = [v68 constraintEqualToAnchor:v69];
    [v61 addObject:v70];

    v71 = [(MUPlaceHeaderButton *)v3->_secondaryButton leadingAnchor];
    v72 = [(MUHeaderButtonsView *)v3 leadingAnchor];
    v73 = [v71 constraintEqualToAnchor:v72];
    [v61 addObject:v73];

    v74 = [(MUPlaceHeaderButton *)v3->_secondaryButton topAnchor];
    v75 = [(MUPlaceHeaderButton *)v3->_primaryButton bottomAnchor];
    v76 = [v74 constraintEqualToAnchor:v75 constant:8.0];
    [v61 addObject:v76];

    v77 = [(MUPlaceHeaderButton *)v3->_secondaryButton bottomAnchor];
    v78 = [(MUHeaderButtonsView *)v3 bottomAnchor];
    v79 = [v77 constraintEqualToAnchor:v78];
    [v61 addObject:v79];

    moreButton = v3->_moreButton;
    v81 = [(MUPlaceHeaderButton *)v3->_secondaryButton trailingAnchor];
    if (moreButton)
    {
      v82 = [(MUPlaceHeaderButton *)v3->_moreButton leadingAnchor];
      v83 = [v81 constraintEqualToAnchor:v82 constant:-8.0];
      [v61 addObject:v83];

      v84 = [(MUPlaceHeaderButton *)v3->_secondaryButton heightAnchor];
      v85 = [(MUPlaceHeaderButton *)v3->_moreButton heightAnchor];
      v86 = [v84 constraintEqualToAnchor:v85];
      [v61 addObject:v86];

      v87 = [(MUPlaceHeaderButton *)v3->_moreButton topAnchor];
      v88 = [(MUPlaceHeaderButton *)v3->_secondaryButton topAnchor];
      v89 = [v87 constraintEqualToAnchor:v88];
      [v61 addObject:v89];

      v90 = [(MUPlaceHeaderButton *)v3->_moreButton trailingAnchor];
      v91 = [(MUHeaderButtonsView *)v3 trailingAnchor];
      v92 = [v90 constraintEqualToAnchor:v91];
      [v61 addObject:v92];

      v93 = [(MUPlaceHeaderButton *)v3->_moreButton bottomAnchor];
      v94 = [(MUPlaceHeaderButton *)v3->_secondaryButton bottomAnchor];
      v95 = [v93 constraintEqualToAnchor:v94];
      [v61 addObject:v95];

      v96 = v3->_moreButton;
    }
    else
    {
      v139 = [(MUHeaderButtonsView *)v3 trailingAnchor];
      v140 = [v81 constraintEqualToAnchor:v139 constant:-8.0];
      [v61 addObject:v140];

      v96 = v3->_secondaryButton;
    }
    v141 = [(MUPlaceHeaderButton *)v96 heightAnchor];
    v142 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    [v142 _scaledValueForValue:48.0];
    v143 = objc_msgSend(v141, "constraintEqualToConstant:");
    [v61 addObject:v143];

    v144 = (void *)[v61 copy];
    [(MUHeaderButtonsView *)v3 _activateNewConstraints:v144];

    v53 = v61;
  }
  else
  {
    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    id v97 = v56;
    v53 = v4;
    uint64_t v148 = [v97 countByEnumeratingWithState:&v149 objects:v153 count:16];
    if (v148)
    {
      v145 = v56;
      v98 = v3;
      v99 = 0;
      uint64_t v147 = *(void *)v150;
      uint64_t v146 = *MEMORY[0x1E4FB2908];
      do
      {
        uint64_t v100 = 0;
        v101 = v99;
        do
        {
          if (*(void *)v150 != v147) {
            objc_enumerationMutation(v97);
          }
          v102 = *(MUPlaceHeaderButton **)(*((void *)&v149 + 1) + 8 * v100);
          v103 = [v97 firstObject];

          if (v102 == v103)
          {
            v104 = [(MUPlaceHeaderButton *)v102 leadingAnchor];
            v105 = [(MUHeaderButtonsView *)v98 leadingAnchor];
            v106 = [v104 constraintEqualToAnchor:v105];
            [v53 addObject:v106];
          }
          if (v102 != v98->_moreButton)
          {
            v107 = [v97 firstObject];

            if (v102 != v107)
            {
              v108 = [(MUPlaceHeaderButton *)v102 widthAnchor];
              v109 = [(MUPlaceHeaderButton *)v101 widthAnchor];
              v110 = [v108 constraintEqualToAnchor:v109];
              [v53 addObject:v110];
            }
          }
          v111 = [v97 firstObject];

          if (v101 && v102 != v111)
          {
            v112 = [(MUPlaceHeaderButton *)v101 trailingAnchor];
            v113 = [(MUPlaceHeaderButton *)v102 leadingAnchor];
            v114 = [v112 constraintEqualToAnchor:v113 constant:-8.0];
            [v53 addObject:v114];

            v115 = [(MUPlaceHeaderButton *)v101 heightAnchor];
            v116 = [(MUPlaceHeaderButton *)v102 heightAnchor];
            v117 = [v115 constraintEqualToAnchor:v116];
            [v53 addObject:v117];
          }
          v118 = [v97 lastObject];

          if (v102 == v118)
          {
            v119 = [(MUPlaceHeaderButton *)v102 trailingAnchor];
            v120 = [(MUHeaderButtonsView *)v98 trailingAnchor];
            v121 = [v119 constraintEqualToAnchor:v120];
            [v53 addObject:v121];

            v122 = [(MUPlaceHeaderButton *)v102 heightAnchor];
            v123 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v146];
            [v123 _scaledValueForValue:48.0];
            v124 = objc_msgSend(v122, "constraintEqualToConstant:");
            [v53 addObject:v124];
          }
          v125 = [(MUPlaceHeaderButton *)v102 topAnchor];
          v126 = [(MUHeaderButtonsView *)v98 topAnchor];
          v127 = [v125 constraintEqualToAnchor:v126];
          [v4 addObject:v127];

          v128 = [(MUPlaceHeaderButton *)v102 bottomAnchor];
          v53 = v4;
          v129 = [(MUHeaderButtonsView *)v98 bottomAnchor];
          v130 = [v128 constraintEqualToAnchor:v129];
          [v4 addObject:v130];

          v99 = v102;
          ++v100;
          v101 = v99;
        }
        while (v148 != v100);
        uint64_t v148 = [v97 countByEnumeratingWithState:&v149 objects:v153 count:16];
      }
      while (v148);

      v3 = v98;
      v56 = v145;
    }

    v131 = (void *)[v53 copy];
    [(MUHeaderButtonsView *)v3 _activateNewConstraints:v131];
  }
LABEL_43:
}

- (void)_activateNewConstraints:(id)a3
{
  id v6 = a3;
  if ([(NSArray *)self->_constraints count]) {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
  }
  id v4 = (NSArray *)[v6 copy];
  constraints = self->_constraints;
  self->_constraints = v4;

  if ([(NSArray *)self->_constraints count]) {
    [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
  }
}

- (void)ETAProviderUpdated:(id)a3
{
  id v4 = a3;
  double v5 = [(MUPlaceHeaderButton *)self->_primaryButton configuration];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_etaProvider);

  if (WeakRetained != v4) {
    objc_storeWeak((id *)&self->_etaProvider, v4);
  }
  unint64_t primaryButtonType = self->_primaryButtonType;
  if (primaryButtonType == 2)
  {
    [(MUHeaderButtonsViewConfiguration *)self->_configuration detourTime];
    uint64_t v9 = +[_MUETAConfiguration rerouteConfigurationETAStringForTravelTime:"rerouteConfigurationETAStringForTravelTime:"];
    goto LABEL_7;
  }
  if (primaryButtonType == 1)
  {
    uint64_t v8 = [v4 etaTransportType];
    [v4 etaTravelTime];
    uint64_t v9 = +[_MUETAConfiguration configurationForEtaStringFor:travelTime:hasSecondaryController:isStackingButtons:](_MUETAConfiguration, "configurationForEtaStringFor:travelTime:hasSecondaryController:isStackingButtons:", v8, self->_secondaryButtonController != 0, self->_isStackingButtons);
LABEL_7:
    v10 = (void *)v9;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:
  v11 = [v10 symbolName];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4FB1818];
    v14 = [v10 symbolName];
    v15 = objc_msgSend(v13, "_mapsui_systemImageNamed:", v14);
    [v5 setImage:v15];
  }
  id v16 = [v10 etaString];
  [v5 setTitle:v16];

  uint64_t v17 = [v5 title];
  uint64_t v18 = [v17 length];

  if (v18)
  {
    objc_initWeak(&location, self);
    v19 = (void *)MEMORY[0x1E4FB1EB0];
    primaryButton = self->_primaryButton;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __42__MUHeaderButtonsView_ETAProviderUpdated___block_invoke;
    v21[3] = &unk_1E574F110;
    objc_copyWeak(&v23, &location);
    id v22 = v5;
    [v19 transitionWithView:primaryButton duration:5242880 options:v21 animations:0 completion:0.300000012];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

void __42__MUHeaderButtonsView_ETAProviderUpdated___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[51] setConfiguration:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MUHeaderButtonsView;
  [(MUHeaderButtonsView *)&v4 layoutSubviews];
  [(MUHeaderButtonsView *)self _updateConstraintsIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)MUHeaderButtonsView;
  [(MUHeaderButtonsView *)&v3 layoutSubviews];
}

- (void)_updateConstraintsIfNeeded
{
  if (self->_isStackingButtons != [(MUHeaderButtonsView *)self shouldStackForButtons])
  {
    [(MUHeaderButtonsView *)self _createLayout];
  }
}

- (BOOL)shouldStackForButtons
{
  if (MapKitIdiomIsMacCatalyst()) {
    goto LABEL_2;
  }
  objc_super v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [v4 _scaledValueForValue:48.0];
  double v6 = v5;

  double v7 = 0.0;
  double v8 = 0.0;
  if ([(MUHeaderButtonsViewConfiguration *)self->_configuration showMoreButton])
  {
    -[MUPlaceHeaderButton sizeThatFits:](self->_moreButton, "sizeThatFits:", *MEMORY[0x1E4FB2C68], v6);
    double v8 = v9;
  }
  if (self->_primaryButton) {
    double v10 = 8.0;
  }
  else {
    double v10 = 0.0;
  }
  if (self->_secondaryButton) {
    double v11 = 8.0;
  }
  else {
    double v11 = -0.0;
  }
  if (!self->_moreButton) {
    double v7 = 8.0;
  }
  [(MUHeaderButtonsView *)self bounds];
  double Width = CGRectGetWidth(v19);
  primaryButton = self->_primaryButton;
  if (primaryButton)
  {
    if (!self->_secondaryButton)
    {
LABEL_2:
      LOBYTE(primaryButton) = 0;
      return (char)primaryButton;
    }
    double v13 = (Width - v8 - (v10 + v11 - v7)) * 0.5;
    double v14 = *MEMORY[0x1E4FB2C70];
    -[MUPlaceHeaderButton sizeThatFits:](primaryButton, "sizeThatFits:", *MEMORY[0x1E4FB2C70], v6);
    double v16 = v15;
    -[MUPlaceHeaderButton sizeThatFits:](self->_secondaryButton, "sizeThatFits:", v14, v6);
    LOBYTE(primaryButton) = v17 > v13 || v16 > v13;
  }
  return (char)primaryButton;
}

- (MUHeaderButtonsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUHeaderButtonsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)primaryButtonType
{
  return self->_primaryButtonType;
}

- (_MKPlaceActionButtonController)alternatePrimaryButtonController
{
  return self->_alternatePrimaryButtonController;
}

- (void)setAlternatePrimaryButtonController:(id)a3
{
}

- (_MKPlaceActionButtonController)secondaryButtonController
{
  return self->_secondaryButtonController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButtonController, 0);
  objc_storeStrong((id *)&self->_alternatePrimaryButtonController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_etaProvider);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_alternatePrimaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
}

@end