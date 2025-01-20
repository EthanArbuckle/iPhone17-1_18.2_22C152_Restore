@interface PKPaletteUndoRedoView
- (BOOL)isRedoEnabled;
- (BOOL)isUndoEnabled;
- (CGSize)_buttonSize;
- (CGSize)intrinsicContentSize;
- (NSLayoutConstraint)redoButtonHeightConstraint;
- (NSLayoutConstraint)redoButtonWidthConstraint;
- (NSLayoutConstraint)undoButtonHeightConstraint;
- (NSLayoutConstraint)undoButtonWidthConstraint;
- (PKPaletteButton)redoButton;
- (PKPaletteButton)undoButton;
- (PKPaletteUndoRedoView)initWithFrame:(CGRect)a3;
- (PKPaletteUndoRedoViewDelegate)delegate;
- (UIStackView)stackView;
- (double)interItemSpacing;
- (double)scalingFactor;
- (unint64_t)cornerLocation;
- (unint64_t)edgeLocation;
- (void)_installRedoButton;
- (void)_installStackView;
- (void)_installUndoButton;
- (void)_updateUI;
- (void)handleRedo:(id)a3;
- (void)handleUndo:(id)a3;
- (void)setCornerLocation:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setInterItemSpacing:(double)a3;
- (void)setRedoButton:(id)a3;
- (void)setRedoButtonHeightConstraint:(id)a3;
- (void)setRedoButtonWidthConstraint:(id)a3;
- (void)setRedoEnabled:(BOOL)a3;
- (void)setScalingFactor:(double)a3;
- (void)setStackView:(id)a3;
- (void)setUndoButton:(id)a3;
- (void)setUndoButtonHeightConstraint:(id)a3;
- (void)setUndoButtonWidthConstraint:(id)a3;
- (void)setUndoEnabled:(BOOL)a3;
@end

@implementation PKPaletteUndoRedoView

- (PKPaletteUndoRedoView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaletteUndoRedoView;
  v3 = -[PKPaletteUndoRedoView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scalingFactor = 1.0;
    v3->_interItemSpacing = 0.0;
    [(PKPaletteUndoRedoView *)v3 _installStackView];
    if ([(PKPaletteUndoRedoView *)v4 effectiveUserInterfaceLayoutDirection])
    {
      [(PKPaletteUndoRedoView *)v4 _installRedoButton];
      [(PKPaletteUndoRedoView *)v4 _installUndoButton];
    }
    else
    {
      [(PKPaletteUndoRedoView *)v4 _installUndoButton];
      [(PKPaletteUndoRedoView *)v4 _installRedoButton];
    }
    [(PKPaletteUndoRedoView *)v4 _updateUI];
  }
  return v4;
}

- (void)_installStackView
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
  [(PKPaletteUndoRedoView *)self setStackView:v3];

  v4 = [(PKPaletteUndoRedoView *)self stackView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(PKPaletteUndoRedoView *)self stackView];
  [v5 setAlignment:3];

  objc_super v6 = [(PKPaletteUndoRedoView *)self stackView];
  [v6 setSemanticContentAttribute:2];

  v7 = [(PKPaletteUndoRedoView *)self stackView];
  [(PKPaletteUndoRedoView *)self addSubview:v7];

  v18 = (void *)MEMORY[0x1E4F28DC8];
  v25 = [(PKPaletteUndoRedoView *)self stackView];
  v24 = [v25 topAnchor];
  v23 = [(PKPaletteUndoRedoView *)self topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v26[0] = v22;
  v21 = [(PKPaletteUndoRedoView *)self stackView];
  v20 = [v21 bottomAnchor];
  v19 = [(PKPaletteUndoRedoView *)self bottomAnchor];
  v8 = [v20 constraintEqualToAnchor:v19];
  v26[1] = v8;
  v9 = [(PKPaletteUndoRedoView *)self stackView];
  v10 = [v9 leadingAnchor];
  v11 = [(PKPaletteUndoRedoView *)self leadingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v26[2] = v12;
  v13 = [(PKPaletteUndoRedoView *)self stackView];
  v14 = [v13 trailingAnchor];
  v15 = [(PKPaletteUndoRedoView *)self trailingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v26[3] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  [v18 activateConstraints:v17];
}

- (void)_installUndoButton
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = +[PKPaletteButton undoButton];
  [(PKPaletteUndoRedoView *)self setUndoButton:v3];

  v4 = [(PKPaletteUndoRedoView *)self undoButton];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(PKPaletteUndoRedoView *)self undoButton];
  [v5 addTarget:self action:sel_handleUndo_ forControlEvents:64];

  objc_super v6 = [(PKPaletteUndoRedoView *)self stackView];
  v7 = [(PKPaletteUndoRedoView *)self undoButton];
  [v6 addArrangedSubview:v7];

  v8 = [(PKPaletteUndoRedoView *)self undoButton];
  v9 = [v8 widthAnchor];
  v10 = [v9 constraintEqualToConstant:0.0];
  undoButtonWidthConstraint = self->_undoButtonWidthConstraint;
  self->_undoButtonWidthConstraint = v10;

  v12 = [(PKPaletteUndoRedoView *)self undoButton];
  v13 = [v12 heightAnchor];
  v14 = [v13 constraintEqualToConstant:0.0];
  undoButtonHeightConstraint = self->_undoButtonHeightConstraint;
  self->_undoButtonHeightConstraint = v14;

  v16 = (void *)MEMORY[0x1E4F28DC8];
  v17 = self->_undoButtonHeightConstraint;
  v19[0] = self->_undoButtonWidthConstraint;
  v19[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  [v16 activateConstraints:v18];
}

- (void)_installRedoButton
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = +[PKPaletteButton redoButton];
  [(PKPaletteUndoRedoView *)self setRedoButton:v3];

  v4 = [(PKPaletteUndoRedoView *)self redoButton];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(PKPaletteUndoRedoView *)self redoButton];
  [v5 addTarget:self action:sel_handleRedo_ forControlEvents:64];

  objc_super v6 = [(PKPaletteUndoRedoView *)self stackView];
  v7 = [(PKPaletteUndoRedoView *)self redoButton];
  [v6 addArrangedSubview:v7];

  v8 = [(PKPaletteUndoRedoView *)self redoButton];
  v9 = [v8 widthAnchor];
  v10 = [v9 constraintEqualToConstant:0.0];
  redoButtonWidthConstraint = self->_redoButtonWidthConstraint;
  self->_redoButtonWidthConstraint = v10;

  v12 = [(PKPaletteUndoRedoView *)self redoButton];
  v13 = [v12 heightAnchor];
  v14 = [v13 constraintEqualToConstant:0.0];
  redoButtonHeightConstraint = self->_redoButtonHeightConstraint;
  self->_redoButtonHeightConstraint = v14;

  v16 = (void *)MEMORY[0x1E4F28DC8];
  v17 = self->_redoButtonHeightConstraint;
  v19[0] = self->_redoButtonWidthConstraint;
  v19[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  [v16 activateConstraints:v18];
}

- (CGSize)_buttonSize
{
  id v3 = [(PKPaletteUndoRedoView *)self traitCollection];
  v4 = [(PKPaletteUndoRedoView *)self window];
  v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);

  if (v6) {
    double v7 = 28.0;
  }
  else {
    double v7 = 36.0;
  }
  [(PKPaletteUndoRedoView *)self scalingFactor];
  double v9 = v7 * v8;
  double v10 = v9;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setInterItemSpacing:(double)a3
{
  double interItemSpacing = self->_interItemSpacing;
  if (interItemSpacing != a3 && vabdd_f64(interItemSpacing, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_double interItemSpacing = a3;
    [(PKPaletteUndoRedoView *)self _updateUI];
    [(PKPaletteUndoRedoView *)self invalidateIntrinsicContentSize];
  }
}

- (void)_updateUI
{
  [(PKPaletteUndoRedoView *)self interItemSpacing];
  double v4 = v3;
  [(PKPaletteUndoRedoView *)self scalingFactor];
  double v6 = v4 * v5;
  double v7 = [(PKPaletteUndoRedoView *)self stackView];
  [v7 setSpacing:v6];

  [(PKPaletteUndoRedoView *)self _buttonSize];
  double v9 = v8;
  double v11 = v10;
  v12 = [(PKPaletteUndoRedoView *)self undoButtonWidthConstraint];
  [v12 setConstant:v9];

  v13 = [(PKPaletteUndoRedoView *)self undoButtonHeightConstraint];
  [v13 setConstant:v11];

  v14 = [(PKPaletteUndoRedoView *)self redoButtonWidthConstraint];
  [v14 setConstant:v9];

  v15 = [(PKPaletteUndoRedoView *)self redoButtonHeightConstraint];
  [v15 setConstant:v11];

  BOOL v16 = [(PKPaletteUndoRedoView *)self isUndoEnabled];
  v17 = [(PKPaletteUndoRedoView *)self undoButton];
  [v17 setEnabled:v16];

  BOOL v18 = [(PKPaletteUndoRedoView *)self isRedoEnabled];
  id v19 = [(PKPaletteUndoRedoView *)self redoButton];
  [v19 setEnabled:v18];
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_double scalingFactor = a3;
    [(PKPaletteUndoRedoView *)self _updateUI];
    [(PKPaletteUndoRedoView *)self invalidateIntrinsicContentSize];
  }
}

- (void)handleUndo:(id)a3
{
  id v4 = [(PKPaletteUndoRedoView *)self delegate];
  [v4 undoRedoViewDidTapUndo:self];
}

- (void)handleRedo:(id)a3
{
  id v4 = [(PKPaletteUndoRedoView *)self delegate];
  [v4 undoRedoViewDidTapRedo:self];
}

- (void)setUndoEnabled:(BOOL)a3
{
  self->_undoEnabled = a3;
  [(PKPaletteUndoRedoView *)self _updateUI];
}

- (void)setRedoEnabled:(BOOL)a3
{
  self->_redoEnabled = a3;
  [(PKPaletteUndoRedoView *)self _updateUI];
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    [(PKPaletteUndoRedoView *)self invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  [(PKPaletteUndoRedoView *)self _buttonSize];
  double v4 = v3;
  double v6 = v5;
  [(PKPaletteUndoRedoView *)self interItemSpacing];
  double v8 = v7 + v4 * 2.0;
  [(PKPaletteUndoRedoView *)self scalingFactor];
  double v10 = v8 * v9;
  [(PKPaletteUndoRedoView *)self scalingFactor];
  double v12 = v6 * v11;
  double v13 = v10;
  result.height = v12;
  result.width = v13;
  return result;
}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (void)setCornerLocation:(unint64_t)a3
{
  self->_cornerLocation = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (PKPaletteUndoRedoViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaletteUndoRedoViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaletteButton)undoButton
{
  return self->_undoButton;
}

- (void)setUndoButton:(id)a3
{
}

- (PKPaletteButton)redoButton
{
  return self->_redoButton;
}

- (void)setRedoButton:(id)a3
{
}

- (BOOL)isUndoEnabled
{
  return self->_undoEnabled;
}

- (BOOL)isRedoEnabled
{
  return self->_redoEnabled;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (NSLayoutConstraint)undoButtonWidthConstraint
{
  return self->_undoButtonWidthConstraint;
}

- (void)setUndoButtonWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)undoButtonHeightConstraint
{
  return self->_undoButtonHeightConstraint;
}

- (void)setUndoButtonHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)redoButtonWidthConstraint
{
  return self->_redoButtonWidthConstraint;
}

- (void)setRedoButtonWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)redoButtonHeightConstraint
{
  return self->_redoButtonHeightConstraint;
}

- (void)setRedoButtonHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redoButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_redoButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_undoButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_undoButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_redoButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end