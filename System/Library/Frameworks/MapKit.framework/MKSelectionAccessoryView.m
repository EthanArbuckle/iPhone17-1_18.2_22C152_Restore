@interface MKSelectionAccessoryView
+ (id)_buttonConfigurationForControlState:(unint64_t)a3;
+ (id)_imageConfigurationWithXColor:(id)a3 circleColor:(id)a4;
- (MKPlaceCardContentSizeDelegate)placeCardContentSizeDelegate;
- (MKSelectionAccessoryView)initWithFrame:(CGRect)a3;
- (MKSelectionAccessoryViewDelegate)delegate;
- (void)_activateDismissButtonConstraints;
- (void)_bringDismissButtonToFront;
- (void)_createDismissButtonIfNeeded;
- (void)_requestDismissal;
- (void)_updateDismissButtonVisibility;
- (void)setDelegate:(id)a3;
- (void)setPlaceCardContentSizeDelegate:(id)a3;
@end

@implementation MKSelectionAccessoryView

- (MKSelectionAccessoryView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKSelectionAccessoryView;
  v3 = -[MKSelectionAccessoryView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MKSelectionAccessoryView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v4;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);

  [(MKSelectionAccessoryView *)self _updateDismissButtonVisibility];
}

- (void)_updateDismissButtonVisibility
{
  [(MKSelectionAccessoryView *)self _createDismissButtonIfNeeded];
  if (self->_dismissButton)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [(UIButton *)self->_dismissButton setHidden:WeakRetained == 0];
  }
}

+ (id)_imageConfigurationWithXColor:(id)a3 circleColor:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F42A98];
  v14[0] = a3;
  v14[1] = a4;
  objc_super v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:v14 count:2];
  v10 = [v5 configurationWithPaletteColors:v9];

  v11 = [MEMORY[0x1E4F42A98] configurationWithPointSize:4 weight:3 scale:23.0];

  v12 = [v11 configurationByApplyingConfiguration:v10];

  return v12;
}

+ (id)_buttonConfigurationForControlState:(unint64_t)a3
{
  v5 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
  objc_super v6 = [MEMORY[0x1E4F42A80] systemImageNamed:@"xmark.circle.fill"];
  [v5 setImage:v6];

  objc_msgSend(v5, "setContentInsets:", *MEMORY[0x1E4F424F0], *(double *)(MEMORY[0x1E4F424F0] + 8), *(double *)(MEMORY[0x1E4F424F0] + 16), *(double *)(MEMORY[0x1E4F424F0] + 24));
  id v7 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  id v8 = v7;
  if (a3 == 1)
  {
    uint64_t v9 = [v7 colorWithAlphaComponent:0.25];

    id v8 = (void *)v9;
  }
  v10 = [MEMORY[0x1E4F428B8] systemGrayColor];
  v11 = [a1 _imageConfigurationWithXColor:v8 circleColor:v10];
  [v5 setPreferredSymbolConfigurationForImage:v11];

  return v5;
}

- (void)_createDismissButtonIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    dismissButton = self->_dismissButton;

    if (!dismissButton)
    {
      v5 = _MKLocalizedStringFromThisBundle(@"Dismiss");
      objc_initWeak(&location, self);
      objc_super v6 = +[MKSelectionAccessoryView _buttonConfigurationForControlState:0];
      id v7 = (void *)MEMORY[0x1E4F427E0];
      id v8 = (void *)MEMORY[0x1E4F426E8];
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __56__MKSelectionAccessoryView__createDismissButtonIfNeeded__block_invoke;
      v15 = &unk_1E54B93D8;
      objc_copyWeak(&v16, &location);
      uint64_t v9 = [v8 actionWithHandler:&v12];
      objc_msgSend(v7, "buttonWithConfiguration:primaryAction:", v6, v9, v12, v13, v14, v15);
      v10 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v11 = self->_dismissButton;
      self->_dismissButton = v10;

      [(UIButton *)self->_dismissButton setConfigurationUpdateHandler:&__block_literal_global_15];
      [(UIButton *)self->_dismissButton setPreferredBehavioralStyle:1];
      [(UIButton *)self->_dismissButton setAccessibilityLabel:v5];
      [(UIButton *)self->_dismissButton setTranslatesAutoresizingMaskIntoConstraints:0];
      [(MKSelectionAccessoryView *)self addSubview:self->_dismissButton];
      [(MKSelectionAccessoryView *)self _activateDismissButtonConstraints];
      objc_destroyWeak(&v16);

      objc_destroyWeak(&location);
    }
  }
}

void __56__MKSelectionAccessoryView__createDismissButtonIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _requestDismissal];
}

void __56__MKSelectionAccessoryView__createDismissButtonIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  +[MKSelectionAccessoryView _buttonConfigurationForControlState:](MKSelectionAccessoryView, "_buttonConfigurationForControlState:", [v2 state]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setConfiguration:v3];
}

- (void)_activateDismissButtonConstraints
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28DC8];
  v4 = [(UIButton *)self->_dismissButton topAnchor];
  v5 = [(MKSelectionAccessoryView *)self safeAreaLayoutGuide];
  objc_super v6 = [v5 topAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6 constant:15.0];
  v13[0] = v7;
  id v8 = [(MKSelectionAccessoryView *)self safeAreaLayoutGuide];
  uint64_t v9 = [v8 trailingAnchor];
  v10 = [(UIButton *)self->_dismissButton trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:15.0];
  v13[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [v3 activateConstraints:v12];
}

- (void)_bringDismissButtonToFront
{
  if (self->_dismissButton) {
    -[MKSelectionAccessoryView bringSubviewToFront:](self, "bringSubviewToFront:");
  }
}

- (void)_requestDismissal
{
  id v3 = [(MKSelectionAccessoryView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MKSelectionAccessoryView *)self delegate];
    [v5 selectionAccessoryViewDidRequestDismissal:self];
  }
}

- (MKPlaceCardContentSizeDelegate)placeCardContentSizeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeCardContentSizeDelegate);

  return (MKPlaceCardContentSizeDelegate *)WeakRetained;
}

- (void)setPlaceCardContentSizeDelegate:(id)a3
{
}

- (MKSelectionAccessoryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKSelectionAccessoryViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_placeCardContentSizeDelegate);

  objc_storeStrong((id *)&self->_dismissButton, 0);
}

@end