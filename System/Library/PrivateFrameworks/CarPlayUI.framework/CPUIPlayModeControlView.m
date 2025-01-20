@interface CPUIPlayModeControlView
- (BOOL)fuseSubscriberLayout;
- (BOOL)showsArtwork;
- (CGSize)intrinsicContentSize;
- (CPUIModernButton)addToLibraryButton;
- (CPUIModernButton)moreButton;
- (CPUIModernButton)playbackRateButton;
- (CPUIModernButton)shuffleButton;
- (CPUIPlayModeControlView)initWithFrame:(CGRect)a3;
- (CPUIPlayModeControlViewDelegate)delegate;
- (CPUIRepeatButton)repeatButton;
- (NSArray)activeButtonLayoutConstraints;
- (NSArray)mediaButtons;
- (UIStackView)stackView;
- (double)buttonSpacing;
- (double)buttonWidth;
- (id)_visibleControlButtons;
- (id)defaultPlayModeButtons;
- (void)_updateButtonLayouts;
- (void)layoutSubviews;
- (void)playModeButtonTapped:(id)a3;
- (void)setActiveButtonLayoutConstraints:(id)a3;
- (void)setButtonSpacing:(double)a3;
- (void)setButtonWidth:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFuseSubscriberLayout:(BOOL)a3;
- (void)setMediaButtons:(id)a3;
- (void)setShowsArtwork:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPUIPlayModeControlView

- (CPUIPlayModeControlView)initWithFrame:(CGRect)a3
{
  v81[2] = *MEMORY[0x263EF8340];
  v76.receiver = self;
  v76.super_class = (Class)CPUIPlayModeControlView;
  v3 = -[CPUIPlayModeControlView initWithFrame:](&v76, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    moreButton = v3->_moreButton;
    v3->_moreButton = (CPUIModernButton *)v4;

    v6 = [(CPUIPlayModeControlView *)v3 traitCollection];
    v7 = CPUIEllipsisGlyph(v6);

    v75 = v7;
    [(CPUIModernButton *)v3->_moreButton setImage:v7 forState:0];
    v8 = v3->_moreButton;
    v9 = [MEMORY[0x263F825C8] labelColor];
    v10 = [v9 colorWithAlphaComponent:0.2];
    v11 = [v7 imageWithTintColor:v10];
    [(CPUIModernButton *)v8 setImage:v11 forState:1];

    [(CPUIModernButton *)v3->_moreButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUIModernButton *)v3->_moreButton setHidden:1];
    [(CPUIModernButton *)v3->_moreButton setAccessibilityIdentifier:@"CPNowPlayingMoreButton"];
    v12 = CPUILocalizedStringForKey(@"MORE");
    v81[0] = v12;
    v13 = CPUILocalizedStringForKey(@"ELLIPSIS");
    v81[1] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:2];
    [(CPUIModernButton *)v3->_moreButton setAccessibilityUserInputLabels:v14];

    uint64_t v15 = +[CPUIRepeatButton buttonWithType:0];
    repeatButton = v3->_repeatButton;
    v3->_repeatButton = (CPUIRepeatButton *)v15;

    [(CPUIRepeatButton *)v3->_repeatButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUIRepeatButton *)v3->_repeatButton setHidden:1];
    [(CPUIModernButton *)v3->_repeatButton setShouldStaySelected:1];
    [(CPUIRepeatButton *)v3->_repeatButton setAccessibilityIdentifier:@"CPNowPlayingRepeatButton"];
    v17 = CPUILocalizedStringForKey(@"REPEAT");
    [(CPUIRepeatButton *)v3->_repeatButton setAccessibilityLabel:v17];

    v18 = CPUILocalizedStringForKey(@"REPEAT");
    v80 = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v80 count:1];
    [(CPUIRepeatButton *)v3->_repeatButton setAccessibilityUserInputLabels:v19];

    uint64_t v20 = objc_opt_new();
    shuffleButton = v3->_shuffleButton;
    v3->_shuffleButton = (CPUIModernButton *)v20;

    v22 = [(CPUIPlayModeControlView *)v3 traitCollection];
    v23 = CPUIShuffleGlyph(v22);

    v74 = v23;
    [(CPUIModernButton *)v3->_shuffleButton setImage:v23 forState:0];
    v24 = v3->_shuffleButton;
    v25 = [MEMORY[0x263F825C8] labelColor];
    v26 = [v25 colorWithAlphaComponent:0.2];
    v27 = [v23 imageWithTintColor:v26];
    [(CPUIModernButton *)v24 setImage:v27 forState:1];

    [(CPUIModernButton *)v3->_shuffleButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUIModernButton *)v3->_shuffleButton setHidden:1];
    [(CPUIModernButton *)v3->_shuffleButton setShouldStaySelected:1];
    [(CPUIModernButton *)v3->_shuffleButton setAccessibilityIdentifier:@"CPNowPlayingShuffleButton"];
    v28 = CPUILocalizedStringForKey(@"SHUFFLE");
    [(CPUIModernButton *)v3->_shuffleButton setAccessibilityLabel:v28];

    v29 = CPUILocalizedStringForKey(@"SHUFFLE");
    v79 = v29;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v79 count:1];
    [(CPUIModernButton *)v3->_shuffleButton setAccessibilityUserInputLabels:v30];

    uint64_t v31 = objc_opt_new();
    addToLibraryButton = v3->_addToLibraryButton;
    v3->_addToLibraryButton = (CPUIModernButton *)v31;

    v33 = [(CPUIPlayModeControlView *)v3 traitCollection];
    v34 = CPUIAddGlyph(v33);

    v73 = v34;
    [(CPUIModernButton *)v3->_addToLibraryButton setImage:v34 forState:0];
    v35 = v3->_addToLibraryButton;
    v36 = [MEMORY[0x263F825C8] labelColor];
    v37 = [v36 colorWithAlphaComponent:0.2];
    v38 = [v34 imageWithTintColor:v37];
    [(CPUIModernButton *)v35 setImage:v38 forState:1];

    [(CPUIModernButton *)v3->_addToLibraryButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUIModernButton *)v3->_addToLibraryButton setHidden:1];
    [(CPUIModernButton *)v3->_addToLibraryButton setAccessibilityIdentifier:@"CPNowPlayingAddToLibraryButton"];
    v39 = CPUILocalizedStringForKey(@"ADD");
    v78[0] = v39;
    v40 = CPUILocalizedStringForKey(@"PLUS");
    v78[1] = v40;
    v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:2];
    [(CPUIModernButton *)v3->_addToLibraryButton setAccessibilityUserInputLabels:v41];

    uint64_t v42 = objc_opt_new();
    playbackRateButton = v3->_playbackRateButton;
    v3->_playbackRateButton = (CPUIModernButton *)v42;

    v44 = v3->_playbackRateButton;
    v45 = CPUIFormattedPlaybackRateString(&unk_26DC1F0A0);
    [(CPUIModernButton *)v44 setTitle:v45 forState:0];

    [(CPUIModernButton *)v3->_playbackRateButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v46 = [(CPUIModernButton *)v3->_playbackRateButton titleLabel];
    [v46 setAdjustsFontForContentSizeCategory:0];

    v47 = [(CPUIModernButton *)v3->_playbackRateButton titleLabel];
    [v47 setAdjustsFontSizeToFitWidth:1];

    [(CPUIModernButton *)v3->_playbackRateButton setHidden:1];
    [(CPUIModernButton *)v3->_playbackRateButton setAccessibilityIdentifier:@"CPNowPlayingPlaybackRateButton"];
    uint64_t v48 = [(CPUIPlayModeControlView *)v3 defaultPlayModeButtons];
    mediaButtons = v3->_mediaButtons;
    v3->_mediaButtons = (NSArray *)v48;

    id v50 = objc_alloc(MEMORY[0x263F82BF8]);
    v51 = [(CPUIPlayModeControlView *)v3 mediaButtons];
    uint64_t v52 = [v50 initWithArrangedSubviews:v51];
    stackView = v3->_stackView;
    v3->_stackView = (UIStackView *)v52;

    v54 = [(CPUIPlayModeControlView *)v3 stackView];
    [v54 setTranslatesAutoresizingMaskIntoConstraints:0];

    v55 = [(CPUIPlayModeControlView *)v3 stackView];
    [v55 setAxis:0];

    v56 = [(CPUIPlayModeControlView *)v3 stackView];
    [v56 setDistribution:3];

    v57 = [(CPUIPlayModeControlView *)v3 stackView];
    [v57 setAlignment:3];

    v58 = [(CPUIPlayModeControlView *)v3 stackView];
    [v58 setAccessibilityIdentifier:@"CPNowPlayingModeControlView"];

    v59 = [(CPUIPlayModeControlView *)v3 stackView];
    [(CPUIPlayModeControlView *)v3 addSubview:v59];

    v72 = (void *)MEMORY[0x263F08938];
    v60 = [(CPUIPlayModeControlView *)v3 stackView];
    v61 = [v60 bottomAnchor];
    v62 = [(CPUIPlayModeControlView *)v3 bottomAnchor];
    v63 = [v61 constraintEqualToAnchor:v62];
    v77[0] = v63;
    v64 = [(CPUIPlayModeControlView *)v3 stackView];
    v65 = [v64 centerXAnchor];
    v66 = [(CPUIPlayModeControlView *)v3 centerXAnchor];
    v67 = [v65 constraintEqualToAnchor:v66];
    v77[1] = v67;
    v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:2];
    [v72 activateConstraints:v68];

    v69 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
    v70 = [(CPUIPlayModeControlView *)v3 layer];
    [v70 setCompositingFilter:v69];
  }
  return v3;
}

- (id)defaultPlayModeButtons
{
  v10[5] = *MEMORY[0x263EF8340];
  v3 = [(CPUIPlayModeControlView *)self shuffleButton];
  uint64_t v4 = [(CPUIPlayModeControlView *)self addToLibraryButton];
  v10[1] = v4;
  v5 = [(CPUIPlayModeControlView *)self moreButton];
  v10[2] = v5;
  v6 = [(CPUIPlayModeControlView *)self playbackRateButton];
  v10[3] = v6;
  v7 = [(CPUIPlayModeControlView *)self repeatButton];
  v10[4] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:5];

  return v8;
}

- (void)setMediaButtons:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  v5 = [(CPUIPlayModeControlView *)self mediaButtons];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__CPUIPlayModeControlView_setMediaButtons___block_invoke;
  v9[3] = &unk_26482D2A8;
  v9[4] = self;
  [v5 enumerateObjectsUsingBlock:v9];

  mediaButtons = self->_mediaButtons;
  self->_mediaButtons = v4;
  v7 = v4;

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__CPUIPlayModeControlView_setMediaButtons___block_invoke_2;
  v8[3] = &unk_26482D2A8;
  v8[4] = self;
  [(NSArray *)v7 enumerateObjectsUsingBlock:v8];
}

void __43__CPUIPlayModeControlView_setMediaButtons___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 removeTarget:v3 action:sel_playModeButtonTapped_ forControlEvents:64];
  uint64_t v4 = [*(id *)(a1 + 32) stackView];
  [v4 removeArrangedSubview:v5];

  [v5 removeFromSuperview];
}

void __43__CPUIPlayModeControlView_setMediaButtons___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 addTarget:v3 action:sel_playModeButtonTapped_ forControlEvents:64];
  id v5 = [*(id *)(a1 + 32) stackView];
  [v5 addArrangedSubview:v4];
}

- (void)setShowsArtwork:(BOOL)a3
{
  if (self->_showsArtwork != a3)
  {
    self->_showsArtwork = a3;
    [(CPUIPlayModeControlView *)self _updateButtonLayouts];
  }
}

- (id)_visibleControlButtons
{
  v2 = [(CPUIPlayModeControlView *)self stackView];
  uint64_t v3 = [v2 arrangedSubviews];
  id v4 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global];
  id v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

uint64_t __49__CPUIPlayModeControlView__visibleControlButtons__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden] ^ 1;
}

- (void)setButtonWidth:(double)a3
{
  if (vabdd_f64(a3, self->_buttonWidth) > 0.00000011920929)
  {
    self->_buttonWidth = a3;
    [(CPUIPlayModeControlView *)self _updateButtonLayouts];
  }
}

- (void)setButtonSpacing:(double)a3
{
  if (vabdd_f64(a3, self->_buttonSpacing) > 0.00000011920929)
  {
    self->_buttonSpacing = a3;
    [(CPUIPlayModeControlView *)self _updateButtonLayouts];
  }
}

- (void)layoutSubviews
{
  [(CPUIPlayModeControlView *)self _updateButtonLayouts];
  v3.receiver = self;
  v3.super_class = (Class)CPUIPlayModeControlView;
  [(CPUIPlayModeControlView *)&v3 layoutSubviews];
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F83C20];
  double v3 = 26.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CPUIPlayModeControlView;
  [(CPUIPlayModeControlView *)&v22 traitCollectionDidChange:a3];
  id v4 = [(CPUIPlayModeControlView *)self traitCollection];
  id v5 = CPUIEllipsisGlyph(v4);

  [(CPUIModernButton *)self->_moreButton setImage:v5 forState:0];
  moreButton = self->_moreButton;
  v7 = [MEMORY[0x263F825C8] labelColor];
  v8 = [v7 colorWithAlphaComponent:0.2];
  v9 = [v5 imageWithTintColor:v8];
  [(CPUIModernButton *)moreButton setImage:v9 forState:1];

  v10 = [(CPUIPlayModeControlView *)self traitCollection];
  v11 = CPUIShuffleGlyph(v10);

  [(CPUIModernButton *)self->_shuffleButton setImage:v11 forState:0];
  shuffleButton = self->_shuffleButton;
  v13 = [MEMORY[0x263F825C8] labelColor];
  v14 = [v13 colorWithAlphaComponent:0.2];
  uint64_t v15 = [v11 imageWithTintColor:v14];
  [(CPUIModernButton *)shuffleButton setImage:v15 forState:1];

  v16 = [(CPUIPlayModeControlView *)self traitCollection];
  v17 = CPUIAddGlyph(v16);

  [(CPUIModernButton *)self->_addToLibraryButton setImage:v17 forState:0];
  addToLibraryButton = self->_addToLibraryButton;
  v19 = [MEMORY[0x263F825C8] labelColor];
  uint64_t v20 = [v19 colorWithAlphaComponent:0.2];
  v21 = [v17 imageWithTintColor:v20];
  [(CPUIModernButton *)addToLibraryButton setImage:v21 forState:1];
}

- (void)_updateButtonLayouts
{
  if (self->_activeButtonLayoutConstraints) {
    objc_msgSend(MEMORY[0x263F08938], "deactivateConstraints:");
  }
  double v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(CPUIPlayModeControlView *)self _visibleControlButtons];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __47__CPUIPlayModeControlView__updateButtonLayouts__block_invoke;
  v18 = &unk_26482D2F0;
  id v5 = v3;
  id v19 = v5;
  uint64_t v20 = self;
  [v4 enumerateObjectsUsingBlock:&v15];
  uint64_t v6 = objc_msgSend(v4, "count", v15, v16, v17, v18) - 1;
  v7 = [(UIStackView *)self->_stackView widthAnchor];
  [(CPUIPlayModeControlView *)self buttonWidth];
  double v9 = v8;
  double v10 = (double)(unint64_t)[v4 count];
  [(CPUIPlayModeControlView *)self buttonSpacing];
  v12 = [v7 constraintEqualToConstant:v11 * (double)(unint64_t)v6 + v9 * v10];
  [v5 addObject:v12];

  v13 = (NSArray *)[v5 copy];
  activeButtonLayoutConstraints = self->_activeButtonLayoutConstraints;
  self->_activeButtonLayoutConstraints = v13;

  if ([(NSArray *)self->_activeButtonLayoutConstraints count]) {
    [MEMORY[0x263F08938] activateConstraints:self->_activeButtonLayoutConstraints];
  }
}

void __47__CPUIPlayModeControlView__updateButtonLayouts__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 widthAnchor];
  [*(id *)(a1 + 40) buttonWidth];
  uint64_t v6 = objc_msgSend(v5, "constraintGreaterThanOrEqualToConstant:");
  [v3 addObject:v6];

  v7 = *(void **)(a1 + 32);
  id v9 = [v4 heightAnchor];

  double v8 = [v9 constraintEqualToConstant:26.0];
  [v7 addObject:v8];
}

- (void)playModeButtonTapped:(id)a3
{
  id v7 = a3;
  id v4 = [(CPUIPlayModeControlView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(CPUIPlayModeControlView *)self delegate];
    [v6 playModeControlView:self didSelectButton:v7];
  }
}

- (CPUIPlayModeControlViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CPUIPlayModeControlViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)fuseSubscriberLayout
{
  return self->_fuseSubscriberLayout;
}

- (void)setFuseSubscriberLayout:(BOOL)a3
{
  self->_fuseSubscriberLayout = a3;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (NSArray)mediaButtons
{
  return self->_mediaButtons;
}

- (double)buttonWidth
{
  return self->_buttonWidth;
}

- (double)buttonSpacing
{
  return self->_buttonSpacing;
}

- (BOOL)showsArtwork
{
  return self->_showsArtwork;
}

- (CPUIModernButton)shuffleButton
{
  return self->_shuffleButton;
}

- (CPUIModernButton)addToLibraryButton
{
  return self->_addToLibraryButton;
}

- (CPUIModernButton)moreButton
{
  return self->_moreButton;
}

- (CPUIModernButton)playbackRateButton
{
  return self->_playbackRateButton;
}

- (CPUIRepeatButton)repeatButton
{
  return self->_repeatButton;
}

- (NSArray)activeButtonLayoutConstraints
{
  return self->_activeButtonLayoutConstraints;
}

- (void)setActiveButtonLayoutConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeButtonLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_repeatButton, 0);
  objc_storeStrong((id *)&self->_playbackRateButton, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_addToLibraryButton, 0);
  objc_storeStrong((id *)&self->_shuffleButton, 0);
  objc_storeStrong((id *)&self->_mediaButtons, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end