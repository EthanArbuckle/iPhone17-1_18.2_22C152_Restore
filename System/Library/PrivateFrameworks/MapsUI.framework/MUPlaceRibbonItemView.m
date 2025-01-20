@interface MUPlaceRibbonItemView
- (BOOL)showTrailingHairline;
- (MUPlaceRibbonItemView)initWithFrame:(CGRect)a3;
- (MUPlaceRibbonItemViewModel)viewModel;
- (id)actionHandler;
- (void)_handleTap;
- (void)_setAXIdentifierWithItemType:(id)a3;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)_updateGestureRecognizers;
- (void)_updateLabelWithAlpha:(double)a3;
- (void)_updateValueText;
- (void)beginAnimatingActivityIndicator;
- (void)endAnimatingActivityIndicatorWithError:(id)a3;
- (void)ribbonItemViewModelDidUpdate:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setShowTrailingHairline:(BOOL)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MUPlaceRibbonItemView

- (MUPlaceRibbonItemView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MUPlaceRibbonItemView;
  v3 = -[MUPlaceRibbonItemView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v4 = v3;
  if (v3)
  {
    [(MUPlaceRibbonItemView *)v3 _setupSubviews];
    [(MUPlaceRibbonItemView *)v4 _setupConstraints];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__updateAppearance name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v4;
}

- (void)_setupSubviews
{
  v3 = +[MUInfoCardStyle labelForProminence:1];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  [(MULabelViewProtocol *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MULabelViewProtocol *)self->_titleLabel setNumberOfLines:1];
  [(MULabelViewProtocol *)self->_titleLabel setAccessibilityIdentifier:@"RibbonItemTitle"];
  [(MUPlaceRibbonItemView *)self addSubview:self->_titleLabel];
  v5 = +[MUInfoCardStyle labelForProminence:0];
  valueLabel = self->_valueLabel;
  self->_valueLabel = v5;

  [(MULabelViewProtocol *)self->_valueLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MULabelViewProtocol *)self->_valueLabel setNumberOfLines:1];
  [(MULabelViewProtocol *)self->_valueLabel setAccessibilityIdentifier:@"RibbonItemValue"];
  [(MUPlaceRibbonItemView *)self addSubview:self->_valueLabel];
  objc_super v7 = [MUHairlineView alloc];
  v8 = -[MUHairlineView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  trailingHairlineView = self->_trailingHairlineView;
  self->_trailingHairlineView = v8;

  [(MUHairlineView *)self->_trailingHairlineView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUHairlineView *)self->_trailingHairlineView setVertical:1];
  [(MUPlaceRibbonItemView *)self setShowTrailingHairline:0];
  [(MUPlaceRibbonItemView *)self addSubview:self->_trailingHairlineView];
  MURegisterForButtonShapeEnablementChanges(self, (uint64_t)sel__updateValueText);
}

- (void)_setupConstraints
{
  v39[10] = *MEMORY[0x1E4F143B8];
  v28 = (void *)MEMORY[0x1E4F28DC8];
  titleLabel = self->_titleLabel;
  v4 = self->_trailingHairlineView;
  v5 = self;
  v38 = [(MULabelViewProtocol *)titleLabel leadingAnchor];
  v37 = [(MUPlaceRibbonItemView *)v5 leadingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v39[0] = v36;
  v35 = [(MULabelViewProtocol *)self->_titleLabel trailingAnchor];
  v34 = [(MUHairlineView *)v4 leadingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34 constant:-16.0];
  v39[1] = v33;
  v32 = [(MULabelViewProtocol *)self->_titleLabel topAnchor];
  v31 = [(MUPlaceRibbonItemView *)v5 topAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v39[2] = v30;
  v29 = [(MULabelViewProtocol *)self->_titleLabel bottomAnchor];
  v27 = [(MULabelViewProtocol *)v5->_valueLabel topAnchor];
  v26 = [v29 constraintEqualToAnchor:v27 constant:-1.0];
  v39[3] = v26;
  v25 = [(MULabelViewProtocol *)v5->_valueLabel leadingAnchor];
  v24 = [(MUPlaceRibbonItemView *)v5 leadingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v39[4] = v23;
  v22 = [(MULabelViewProtocol *)v5->_valueLabel trailingAnchor];
  v21 = [(MUHairlineView *)v4 leadingAnchor];
  v19 = [v22 constraintEqualToAnchor:v21 constant:-16.0];
  v39[5] = v19;
  v18 = [(MULabelViewProtocol *)v5->_valueLabel bottomAnchor];
  v17 = [(MUPlaceRibbonItemView *)v5 bottomAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v39[6] = v16;
  v6 = [(MUHairlineView *)v4 topAnchor];
  objc_super v7 = [(MUPlaceRibbonItemView *)v5 topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7 constant:2.0];
  v39[7] = v8;
  v20 = v4;
  v9 = [(MUHairlineView *)v4 bottomAnchor];
  v10 = [(MUPlaceRibbonItemView *)v5 bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:-2.0];
  v39[8] = v11;
  v12 = [(MUHairlineView *)v4 trailingAnchor];
  v13 = [(MUPlaceRibbonItemView *)v5 trailingAnchor];

  v14 = [v12 constraintEqualToAnchor:v13];
  v39[9] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:10];
  [v28 activateConstraints:v15];
}

- (void)_updateAppearance
{
  v3 = [(MUPlaceRibbonItemViewModel *)self->_viewModel titleStringProvider];

  if (v3)
  {
    v4 = [(MUPlaceRibbonItemViewModel *)self->_viewModel titleStringProvider];
    v5 = v4[2]();
    [(MULabelViewProtocol *)self->_titleLabel setAttributedText:v5];
  }
  v6 = [(MUPlaceRibbonItemViewModel *)self->_viewModel valueStringProvider];

  if (v6) {
    [(MUPlaceRibbonItemView *)self _updateValueText];
  }
  objc_super v7 = [(MUPlaceRibbonItemViewModel *)self->_viewModel preferredAccessibilityValue];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    v9 = [(MUPlaceRibbonItemViewModel *)self->_viewModel preferredAccessibilityValue];
    [(MULabelViewProtocol *)self->_valueLabel setAccessibilityLabel:v9];
  }
  [(MUPlaceRibbonItemView *)self _updateGestureRecognizers];
}

- (void)_updateGestureRecognizers
{
  BOOL v3 = [(MUPlaceRibbonItemViewModel *)self->_viewModel isTappable];
  tapRecognizer = self->_tapRecognizer;
  if (v3)
  {
    if (!tapRecognizer)
    {
      v5 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
      v6 = self->_tapRecognizer;
      self->_tapRecognizer = v5;

      [(UITapGestureRecognizer *)self->_tapRecognizer addTarget:self action:sel__handleTap];
      tapRecognizer = self->_tapRecognizer;
    }
    [(MUPlaceRibbonItemView *)self addGestureRecognizer:tapRecognizer];
    selectRecognizer = self->_selectRecognizer;
    if (!selectRecognizer)
    {
      uint64_t v8 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
      v9 = self->_selectRecognizer;
      self->_selectRecognizer = v8;

      [(UITapGestureRecognizer *)self->_selectRecognizer addTarget:self action:sel__handleTap];
      [(UITapGestureRecognizer *)self->_selectRecognizer setAllowedPressTypes:&unk_1EE4050C0];
      [(UITapGestureRecognizer *)self->_selectRecognizer setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
      selectRecognizer = self->_selectRecognizer;
    }
    [(MUPlaceRibbonItemView *)self addGestureRecognizer:selectRecognizer];
  }
  else
  {
    [(MUPlaceRibbonItemView *)self removeGestureRecognizer:tapRecognizer];
    v10 = self->_selectRecognizer;
    [(MUPlaceRibbonItemView *)self removeGestureRecognizer:v10];
  }
}

- (void)_updateValueText
{
  v10[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MUPlaceRibbonItemViewModel *)self->_viewModel valueStringProvider];
  v4 = v3[2]();

  if ([v4 length])
  {
    if ([(MUPlaceRibbonItemViewModel *)self->_viewModel isTappable]
      && UIAccessibilityButtonShapesEnabled())
    {
      v5 = (void *)[v4 mutableCopy];
      uint64_t v9 = *MEMORY[0x1E4FB0808];
      v10[0] = &unk_1EE404A90;
      v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      objc_msgSend(v5, "addAttributes:range:", v6, 0, objc_msgSend(v5, "length"));

      uint64_t v7 = [v5 copy];
      v4 = (void *)v7;
    }
    [(MULabelViewProtocol *)self->_valueLabel setAttributedText:v4];
    uint64_t v8 = [v4 string];
    [(MULabelViewProtocol *)self->_valueLabel setAccessibilityLabel:v8];
  }
}

- (void)setViewModel:(id)a3
{
  p_viewModel = &self->_viewModel;
  id v7 = a3;
  if (!-[MUPlaceRibbonItemViewModel isEqual:](*p_viewModel, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(MUPlaceRibbonItemViewModel *)*p_viewModel setUpdateDelegate:self];
    [(MUPlaceRibbonItemView *)self _updateAppearance];
    v6 = [(MUPlaceRibbonItemViewModel *)*p_viewModel typeStringForAX];
    [(MUPlaceRibbonItemView *)self _setAXIdentifierWithItemType:v6];
  }
}

- (BOOL)showTrailingHairline
{
  return [(MUHairlineView *)self->_trailingHairlineView isHidden] ^ 1;
}

- (void)setShowTrailingHairline:(BOOL)a3
{
}

- (void)_handleTap
{
  BOOL v3 = [(MUPlaceRibbonItemView *)self actionHandler];

  if (v3)
  {
    v4 = [(MUPlaceRibbonItemView *)self actionHandler];
    v4[2](v4, self);
  }
}

- (void)_updateLabelWithAlpha:(double)a3
{
}

- (void)_setAXIdentifierWithItemType:(id)a3
{
  v4 = (__CFString *)a3;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = @"Unknown";
  }
  id v7 = v5;
  v6 = objc_msgSend(@"RibbonItemType", "stringByAppendingString:");
  [(MUPlaceRibbonItemView *)self setAccessibilityIdentifier:v6];
}

- (void)beginAnimatingActivityIndicator
{
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
}

- (void)ribbonItemViewModelDidUpdate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E4FB1EB0];
  valueLabel = self->_valueLabel;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__MUPlaceRibbonItemView_ribbonItemViewModelDidUpdate___block_invoke;
  v7[3] = &unk_1E574F3A8;
  objc_copyWeak(&v8, &location);
  [v5 transitionWithView:valueLabel duration:5242880 options:v7 animations:0 completion:0.300000012];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __54__MUPlaceRibbonItemView_ribbonItemViewModelDidUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateAppearance];
    id WeakRetained = v2;
  }
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (MUPlaceRibbonItemViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_selectRecognizer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_trailingHairlineView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end