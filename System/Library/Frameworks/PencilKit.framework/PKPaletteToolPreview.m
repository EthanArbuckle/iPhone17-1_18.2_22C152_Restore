@interface PKPaletteToolPreview
- (BOOL)isToolViewVisible;
- (CGRect)_popoverPresentingSourceRect;
- (NSLayoutConstraint)layoutGuideCenterXConstraint;
- (NSLayoutConstraint)layoutGuideHeightConstraint;
- (NSLayoutConstraint)layoutGuideTopConstraint;
- (NSLayoutConstraint)layoutGuideWidthConstraint;
- (NSLayoutConstraint)toolViewHeightAnchor;
- (NSLayoutConstraint)toolViewTopAnchor;
- (NSString)localeIdentifier;
- (PKPaletteColorPickerController)colorPickerController;
- (PKPalettePopoverPresenting)delegate;
- (PKPaletteToolPreview)initWithFrame:(CGRect)a3;
- (PKPaletteToolView)toolView;
- (UIColor)toolColor;
- (UILayoutGuide)layoutGuide;
- (double)_toolViewTopSpacing;
- (double)scalingFactor;
- (id)_popoverPresentingSourceView;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)colorUserInterfaceStyle;
- (unint64_t)cornerLocation;
- (unint64_t)edgeLocation;
- (void)_animateToolViewToVisible:(BOOL)a3 completion:(id)a4;
- (void)_replaceCurrentToolWithTool:(id)a3;
- (void)_showColorSelectionPopover;
- (void)_updateLayoutGuideConstraints;
- (void)_updateToolViewInkingToolAttributesFromTool:(id)a3;
- (void)_updateUI;
- (void)colorPickerControllerDidChangeSelectedColor:(id)a3 isContinuousColorSelection:(BOOL)a4;
- (void)dismissPalettePopoverWithCompletion:(id)a3;
- (void)flashAlternatePreviewView:(id)a3;
- (void)setColorPickerController:(id)a3;
- (void)setColorUserInterfaceStyle:(int64_t)a3;
- (void)setCornerLocation:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setLayoutGuide:(id)a3;
- (void)setLayoutGuideCenterXConstraint:(id)a3;
- (void)setLayoutGuideHeightConstraint:(id)a3;
- (void)setLayoutGuideTopConstraint:(id)a3;
- (void)setLayoutGuideWidthConstraint:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setScalingFactor:(double)a3;
- (void)setToolView:(id)a3;
- (void)setToolViewHeightAnchor:(id)a3;
- (void)setToolViewTopAnchor:(id)a3;
- (void)setToolViewVisible:(BOOL)a3;
- (void)showPreviewForTool:(id)a3 animated:(BOOL)a4;
- (void)toggleColorSelectionPopover;
- (void)updateConstraints;
@end

@implementation PKPaletteToolPreview

- (PKPaletteToolPreview)initWithFrame:(CGRect)a3
{
  v27[4] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)PKPaletteToolPreview;
  v3 = -[PKPaletteToolPreview initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scalingFactor = 1.0;
    v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    layoutGuide = v4->_layoutGuide;
    v4->_layoutGuide = v5;

    [(PKPaletteToolPreview *)v4 addLayoutGuide:v4->_layoutGuide];
    v7 = [(UILayoutGuide *)v4->_layoutGuide topAnchor];
    v8 = [(PKPaletteToolPreview *)v4 topAnchor];
    uint64_t v9 = [v7 constraintEqualToAnchor:v8];
    layoutGuideTopConstraint = v4->_layoutGuideTopConstraint;
    v4->_layoutGuideTopConstraint = (NSLayoutConstraint *)v9;

    v11 = [(UILayoutGuide *)v4->_layoutGuide widthAnchor];
    v12 = [(PKPaletteToolPreview *)v4 widthAnchor];
    uint64_t v13 = [v11 constraintEqualToAnchor:v12];
    layoutGuideWidthConstraint = v4->_layoutGuideWidthConstraint;
    v4->_layoutGuideWidthConstraint = (NSLayoutConstraint *)v13;

    v15 = [(UILayoutGuide *)v4->_layoutGuide heightAnchor];
    v16 = [(PKPaletteToolPreview *)v4 heightAnchor];
    uint64_t v17 = [v15 constraintEqualToAnchor:v16];
    layoutGuideHeightConstraint = v4->_layoutGuideHeightConstraint;
    v4->_layoutGuideHeightConstraint = (NSLayoutConstraint *)v17;

    v19 = [(UILayoutGuide *)v4->_layoutGuide centerXAnchor];
    v20 = [(PKPaletteToolPreview *)v4 centerXAnchor];
    uint64_t v21 = [v19 constraintEqualToAnchor:v20];
    layoutGuideCenterXConstraint = v4->_layoutGuideCenterXConstraint;
    v4->_layoutGuideCenterXConstraint = (NSLayoutConstraint *)v21;

    v23 = (void *)MEMORY[0x1E4F28DC8];
    v27[0] = v4->_layoutGuideTopConstraint;
    v27[1] = v4->_layoutGuideWidthConstraint;
    v27[2] = v4->_layoutGuideHeightConstraint;
    v27[3] = v4->_layoutGuideCenterXConstraint;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
    [v23 activateConstraints:v24];

    v4->_toolViewVisible = 1;
    [(PKPaletteToolPreview *)v4 _updateLayoutGuideConstraints];
    [(PKPaletteToolPreview *)v4 _updateUI];
  }
  return v4;
}

- (void)_updateUI
{
  unint64_t v3 = [(PKPaletteToolPreview *)self edgeLocation];
  v4 = [(PKPaletteToolPreview *)self toolView];
  [v4 setEdgeLocation:v3];

  int64_t v5 = [(PKPaletteToolPreview *)self colorUserInterfaceStyle];
  v6 = [(PKPaletteToolPreview *)self toolView];
  [v6 setColorUserInterfaceStyle:v5];

  [(PKPaletteToolPreview *)self scalingFactor];
  double v8 = v7;
  uint64_t v9 = [(PKPaletteToolPreview *)self toolView];
  [v9 setScalingFactor:v8];

  int64_t v10 = [(PKPaletteToolPreview *)self colorUserInterfaceStyle];
  id v12 = [(PKPaletteToolPreview *)self colorPickerController];
  v11 = [v12 colorPicker];
  [v11 setColorUserInterfaceStyle:v10];
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  if (self->_colorUserInterfaceStyle != a3)
  {
    self->_colorUserInterfaceStyle = a3;
    [(PKPaletteToolPreview *)self _updateUI];
  }
}

- (void)setLocaleIdentifier:(id)a3
{
  id v4 = a3;
  id v7 = [(PKPaletteToolPreview *)self toolView];
  int64_t v5 = [v7 tool];
  v6 = [v5 handwritingTool];
  [v6 setLocaleIdentifier:v4];
}

- (void)showPreviewForTool:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PKPaletteToolPreview *)self toolView];
  double v8 = [v7 tool];
  if (v8)
  {
    uint64_t v9 = [(PKPaletteToolPreview *)self toolView];
    int64_t v10 = [v9 tool];
    int v11 = PKPaletteToolEqualTools(v10, v6);
  }
  else
  {
    int v11 = 0;
  }

  if ((v11 & 1) == 0 && v4)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__PKPaletteToolPreview_showPreviewForTool_animated___block_invoke;
    v18[3] = &unk_1E64C5F60;
    v18[4] = self;
    id v19 = v6;
    [(PKPaletteToolPreview *)self _animateToolViewToVisible:0 completion:v18];
    id v12 = v19;
LABEL_10:

    goto LABEL_11;
  }
  if (((v11 | v4) & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E4FB1EB0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__PKPaletteToolPreview_showPreviewForTool_animated___block_invoke_2;
    v16[3] = &unk_1E64C5F60;
    v16[4] = self;
    id v17 = v6;
    [v15 performWithoutAnimation:v16];
    id v12 = v17;
    goto LABEL_10;
  }
  [(PKPaletteToolPreview *)self _updateToolViewInkingToolAttributesFromTool:v6];
  uint64_t v13 = [v6 handwritingTool];
  v14 = [v13 localeIdentifier];

  [(PKPaletteToolPreview *)self setLocaleIdentifier:v14];
LABEL_11:
}

uint64_t __52__PKPaletteToolPreview_showPreviewForTool_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _replaceCurrentToolWithTool:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateToolViewInkingToolAttributesFromTool:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 _animateToolViewToVisible:1 completion:0];
}

uint64_t __52__PKPaletteToolPreview_showPreviewForTool_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _replaceCurrentToolWithTool:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateToolViewInkingToolAttributesFromTool:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)flashAlternatePreviewView:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(PKPaletteToolPreview *)self addSubview:v4];
    int64_t v5 = (void *)MEMORY[0x1E4F28DC8];
    id v6 = [v4 centerXAnchor];
    id v7 = [(PKPaletteToolPreview *)self centerXAnchor];
    double v8 = [v6 constraintEqualToAnchor:v7];
    v20[0] = v8;
    uint64_t v9 = [v4 centerYAnchor];
    int64_t v10 = [(PKPaletteToolPreview *)self centerYAnchor];
    int v11 = [v9 constraintEqualToAnchor:v10];
    v20[1] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    [v5 activateConstraints:v12];

    uint64_t v13 = [(PKPaletteToolPreview *)self toolView];
    [v13 setAlpha:0.0];

    [(PKPaletteToolPreview *)self layoutIfNeeded];
    v14 = (void *)MEMORY[0x1E4FB1EB0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50__PKPaletteToolPreview_flashAlternatePreviewView___block_invoke;
    v17[3] = &unk_1E64C5F60;
    id v18 = v4;
    id v19 = self;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__PKPaletteToolPreview_flashAlternatePreviewView___block_invoke_2;
    v15[3] = &unk_1E64C6730;
    id v16 = v18;
    [v14 animateWithDuration:0 delay:v17 options:v15 animations:0.4 completion:2.0];
  }
}

void __50__PKPaletteToolPreview_flashAlternatePreviewView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = [*(id *)(a1 + 40) toolView];
  [v2 setAlpha:1.0];
}

uint64_t __50__PKPaletteToolPreview_flashAlternatePreviewView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_animateToolViewToVisible:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(PKPaletteToolPreview *)self isToolViewVisible] != v4)
  {
    [(PKPaletteToolPreview *)self layoutIfNeeded];
    id v7 = (void *)MEMORY[0x1E4FB1EB0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__PKPaletteToolPreview__animateToolViewToVisible_completion___block_invoke;
    v10[3] = &unk_1E64C8030;
    v10[4] = self;
    BOOL v11 = v4;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__PKPaletteToolPreview__animateToolViewToVisible_completion___block_invoke_2;
    v8[3] = &unk_1E64C6848;
    v8[4] = self;
    id v9 = v6;
    [v7 animateWithDuration:0 delay:v10 usingSpringWithDamping:v8 initialSpringVelocity:0.325 options:0.0 animations:0.65 completion:0.0];
  }
}

uint64_t __61__PKPaletteToolPreview__animateToolViewToVisible_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setToolViewVisible:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateLayoutGuideConstraints];
  id v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

uint64_t __61__PKPaletteToolPreview__animateToolViewToVisible_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLayoutGuideConstraints];
  [*(id *)(a1 + 32) layoutIfNeeded];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    unint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_updateLayoutGuideConstraints
{
  double v3 = 0.0;
  if (![(PKPaletteToolPreview *)self isToolViewVisible])
  {
    [(PKPaletteToolPreview *)self bounds];
    double Height = CGRectGetHeight(v8);
    [(PKPaletteToolPreview *)self _toolViewTopSpacing];
    double v3 = Height - v5;
  }
  id v6 = [(PKPaletteToolPreview *)self layoutGuideTopConstraint];
  [v6 setConstant:v3];
}

- (void)_replaceCurrentToolWithTool:(id)a3
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(PKPaletteToolPreview *)self toolView];
  [v5 removeFromSuperview];

  id v6 = [v4 toolIdentifier];
  id v7 = [v4 toolVariant];
  CGRect v8 = [v4 configuration];

  id v9 = +[PKPaletteToolView toolViewWithIdentifier:v6 variant:v7 configuration:v8];
  [(PKPaletteToolPreview *)self setToolView:v9];

  int64_t v10 = [(PKPaletteToolPreview *)self toolView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  BOOL v11 = [(PKPaletteToolPreview *)self toolView];
  [v11 setSelected:1];

  id v12 = [(PKPaletteToolPreview *)self toolView];
  [(PKPaletteToolPreview *)self addSubview:v12];

  uint64_t v13 = [(PKPaletteToolPreview *)self toolView];
  v14 = [v13 topAnchor];
  v15 = [(PKPaletteToolPreview *)self layoutGuide];
  id v16 = [v15 topAnchor];
  id v17 = [v14 constraintEqualToAnchor:v16 constant:19.0];
  [(PKPaletteToolPreview *)self setToolViewTopAnchor:v17];

  id v18 = [(PKPaletteToolPreview *)self toolView];
  id v19 = [v18 heightAnchor];
  v20 = [v19 constraintEqualToConstant:103.0];
  [(PKPaletteToolPreview *)self setToolViewHeightAnchor:v20];

  uint64_t v21 = (void *)MEMORY[0x1E4F28DC8];
  v22 = [(PKPaletteToolPreview *)self toolViewTopAnchor];
  v23 = [(PKPaletteToolPreview *)self toolViewHeightAnchor];
  v30[1] = v23;
  v24 = [(PKPaletteToolPreview *)self toolView];
  v25 = [v24 centerXAnchor];
  objc_super v26 = [(PKPaletteToolPreview *)self layoutGuide];
  v27 = [v26 centerXAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  v30[2] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  [v21 activateConstraints:v29];

  [(PKPaletteToolPreview *)self _updateUI];
}

- (void)_updateToolViewInkingToolAttributesFromTool:(id)a3
{
  id v15 = a3;
  id v4 = [(PKPaletteToolPreview *)self toolView];
  double v5 = [v4 tool];
  if ([v5 isInkingTool])
  {
    int v6 = [v15 isInkingTool];

    id v7 = v15;
    if (!v6) {
      goto LABEL_5;
    }
    CGRect v8 = [v15 inkingTool];
    id v4 = [v8 ink];

    id v9 = [(PKPaletteToolPreview *)self toolView];
    int64_t v10 = [v9 tool];
    BOOL v11 = [v10 inkingTool];
    id v12 = [v4 color];
    [v11 setInkColor:v12];

    double v5 = [(PKPaletteToolPreview *)self toolView];
    uint64_t v13 = [v5 tool];
    v14 = [v13 inkingTool];
    [v4 weight];
    objc_msgSend(v14, "setInkWeight:");
  }
  id v7 = v15;
LABEL_5:
}

- (void)updateConstraints
{
  [(PKPaletteToolPreview *)self _toolViewTopSpacing];
  double v4 = v3;
  double v5 = [(PKPaletteToolPreview *)self toolViewTopAnchor];
  [v5 setConstant:v4];

  [(PKPaletteToolPreview *)self scalingFactor];
  double v7 = v6 * 103.0;
  CGRect v8 = [(PKPaletteToolPreview *)self toolViewHeightAnchor];
  [v8 setConstant:v7];

  v9.receiver = self;
  v9.super_class = (Class)PKPaletteToolPreview;
  [(PKPaletteToolPreview *)&v9 updateConstraints];
}

- (double)_toolViewTopSpacing
{
  [(PKPaletteToolPreview *)self scalingFactor];
  return v2 * 19.0;
}

- (UIColor)toolColor
{
  double v3 = [(PKPaletteToolPreview *)self toolView];
  double v4 = [v3 tool];
  int v5 = [v4 isInkingTool];

  if (v5)
  {
    double v6 = [(PKPaletteToolPreview *)self toolView];
    double v7 = [v6 tool];
    CGRect v8 = [v7 inkingTool];
    objc_super v9 = [v8 ink];
    int64_t v10 = [v9 color];
  }
  else
  {
    int64_t v10 = 0;
  }

  return (UIColor *)v10;
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_double scalingFactor = a3;
    [(PKPaletteToolPreview *)self _updateUI];
    [(PKPaletteToolPreview *)self setNeedsUpdateConstraints];
  }
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    [(PKPaletteToolPreview *)self _updateUI];
  }
}

- (void)toggleColorSelectionPopover
{
  double v3 = [(PKPaletteToolPreview *)self toolView];
  double v4 = [v3 tool];
  int v5 = [v4 isHandwritingTool];

  if (v5)
  {
    double v6 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v9 = 0;
      _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_INFO, "Can't present color picker popover when the handwriting tool is currently selected.", v9, 2u);
    }
  }
  else
  {
    double v7 = [(PKPaletteToolPreview *)self delegate];
    int v8 = [v7 isPalettePresentingPopover];

    if (v8)
    {
      [(PKPaletteToolPreview *)self dismissPalettePopoverWithCompletion:0];
    }
    else
    {
      [(PKPaletteToolPreview *)self _showColorSelectionPopover];
    }
  }
}

- (void)_showColorSelectionPopover
{
  v80[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(PKPaletteToolPreview *)self delegate];
  double v4 = [v3 palettePopoverPresentingController];

  if (v4)
  {
    int v5 = [(PKPaletteToolPreview *)self _popoverPresentingSourceView];
    if (v5)
    {
      double v6 = +[PKPaletteColorPickerControllerFactory makeColorPickerController];
      [(PKPaletteToolPreview *)self setColorPickerController:v6];

      int64_t v7 = [(PKPaletteToolPreview *)self colorUserInterfaceStyle];
      int v8 = [(PKPaletteToolPreview *)self colorPickerController];
      objc_super v9 = [v8 colorPicker];
      [v9 setColorUserInterfaceStyle:v7];

      int64_t v10 = [(PKPaletteToolPreview *)self toolView];
      uint64_t v11 = [v10 configuration];
      id v12 = (void *)v11;
      if (v11)
      {
        if (*(unsigned char *)(v11 + 18)) {
          BOOL v13 = *(unsigned char *)(v11 + 19) != 0;
        }
        else {
          BOOL v13 = 1;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
      id v15 = [(PKPaletteToolPreview *)self colorPickerController];
      id v16 = [v15 colorPicker];
      [v16 setSupportsAlpha:v13];

      id v17 = [(PKPaletteToolPreview *)self toolColor];
      id v18 = [(PKPaletteToolPreview *)self colorPickerController];
      id v19 = [v18 colorPicker];
      [v19 setSelectedColor:v17];

      v20 = [(PKPaletteToolPreview *)self colorPickerController];
      [v20 setDelegate:self];

      uint64_t v21 = [(PKPaletteToolPreview *)self colorPickerController];
      v22 = [v21 viewController];
      [v22 setModalPresentationStyle:7];

      v23 = [(PKPaletteToolPreview *)self colorPickerController];
      v24 = [v23 viewController];
      v25 = [v24 popoverPresentationController];
      [v25 setDelegate:self];

      objc_super v26 = [(PKPaletteToolPreview *)self delegate];
      uint64_t v27 = [v26 palettePopoverPermittedArrowDirections];
      v28 = [(PKPaletteToolPreview *)self colorPickerController];
      v29 = [v28 viewController];
      v30 = [v29 popoverPresentationController];
      [v30 setPermittedArrowDirections:v27];

      v31 = [(PKPaletteToolPreview *)self colorPickerController];
      v32 = [v31 viewController];
      v33 = [v32 popoverPresentationController];
      [v33 _setShouldDisableInteractionDuringTransitions:0];

      [(PKPaletteToolPreview *)self _popoverPresentingSourceRect];
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      v42 = [(PKPaletteToolPreview *)self colorPickerController];
      v43 = [v42 viewController];
      v44 = [v43 popoverPresentationController];
      objc_msgSend(v44, "setSourceRect:", v35, v37, v39, v41);

      v45 = [(PKPaletteToolPreview *)self colorPickerController];
      v46 = [v45 viewController];
      v47 = [v46 popoverPresentationController];
      [v47 setSourceView:v5];

      v48 = [v4 view];
      v80[0] = v48;
      v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:1];
      v50 = [(PKPaletteToolPreview *)self colorPickerController];
      v51 = [v50 viewController];
      v52 = [v51 popoverPresentationController];
      [v52 setPassthroughViews:v49];

      v53 = [(PKPaletteToolPreview *)self colorPickerController];
      v54 = [v53 viewController];
      v55 = [v54 popoverPresentationController];
      [v55 _setIgnoresKeyboardNotifications:1];

      v56 = [(PKPaletteToolPreview *)self delegate];
      [v56 palettePopoverLayoutMargins];
      double v58 = v57;
      double v60 = v59;
      double v62 = v61;
      double v64 = v63;
      v65 = [(PKPaletteToolPreview *)self colorPickerController];
      v66 = [v65 viewController];
      v67 = [v66 popoverPresentationController];
      objc_msgSend(v67, "setPopoverLayoutMargins:", v58, v60, v62, v64);

      v68 = [(PKPaletteToolPreview *)self colorPickerController];
      v69 = [v68 viewController];
      v70 = [(PKPaletteToolPreview *)self traitCollection];
      objc_msgSend(v69, "setOverrideUserInterfaceStyle:", objc_msgSend(v70, "userInterfaceStyle"));

      v71 = [(PKPaletteToolPreview *)self colorPickerController];
      v72 = [v71 viewController];
      v73 = [v72 parentViewController];
      v74 = [(PKPaletteToolPreview *)self traitCollection];
      v75 = [(PKPaletteToolPreview *)self colorPickerController];
      v76 = [v75 viewController];
      [v73 setOverrideTraitCollection:v74 forChildViewController:v76];

      v77 = [(PKPaletteToolPreview *)self colorPickerController];
      v78 = [v77 viewController];
      [v4 presentViewController:v78 animated:1 completion:0];

      v14 = +[PKStatisticsManager sharedStatisticsManager]();
      -[PKStatisticsManager recordColorPanelInvoked:]((uint64_t)v14, @"open");
    }
    else
    {
      v14 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v79 = 0;
        _os_log_fault_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_FAULT, "sourceView shouldn't be nil when presenting a popover", v79, 2u);
      }
    }
  }
}

- (CGRect)_popoverPresentingSourceRect
{
  [(PKPaletteToolPreview *)self bounds];
  CGRect v22 = CGRectInset(v21, -5.0, -5.0);
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  int64_t v7 = [(PKPaletteToolPreview *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_5:

    goto LABEL_6;
  }
  int v8 = [(PKPaletteToolPreview *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int64_t v7 = [(PKPaletteToolPreview *)self delegate];
    if ([v7 wantsCustomPalettePopoverPresentationSource])
    {
      int64_t v10 = [(PKPaletteToolPreview *)self delegate];
      uint64_t v11 = [(PKPaletteToolPreview *)self colorPickerController];
      id v12 = [v11 viewController];
      [v10 palettePopoverSourceRectToPresentViewController:v12];
      CGFloat x = v13;
      CGFloat y = v14;
      CGFloat width = v15;
      CGFloat height = v16;
    }
    goto LABEL_5;
  }
LABEL_6:
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (id)_popoverPresentingSourceView
{
  double v2 = self;
  double v3 = [(PKPaletteToolPreview *)v2 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  double v4 = [(PKPaletteToolPreview *)v2 delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(PKPaletteToolPreview *)v2 delegate];
    int v7 = [v6 wantsCustomPalettePopoverPresentationSource];

    if (v7)
    {
      int v8 = [(PKPaletteToolPreview *)v2 delegate];
      double v3 = [v8 palettePopoverSourceView];

      if (v3)
      {
        double v3 = v3;

        double v2 = v3;
      }
      goto LABEL_6;
    }
  }
LABEL_7:

  return v2;
}

- (void)colorPickerControllerDidChangeSelectedColor:(id)a3 isContinuousColorSelection:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = [a3 colorPicker];
  id v14 = [v6 selectedColor];

  int v7 = [(PKPaletteToolPreview *)self toolView];
  int v8 = [v7 tool];
  int v9 = [v8 isInkingTool];

  if (v9)
  {
    int64_t v10 = [(PKPaletteToolPreview *)self toolView];
    uint64_t v11 = [v10 tool];
    id v12 = [v11 inkingTool];
    [v12 setInkColor:v14];
  }
  double v13 = [(PKPaletteToolPreview *)self delegate];
  [v13 toolPreviewDidChangeToolColor:self isContinuousColorSelection:v4];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  int v8 = (void (**)(void))a3;
  BOOL v4 = [(PKPaletteToolPreview *)self colorPickerController];
  char v5 = [v4 viewController];

  if (v5)
  {
    double v6 = [(PKPaletteToolPreview *)self colorPickerController];
    int v7 = [v6 viewController];
    [v7 dismissViewControllerAnimated:1 completion:v8];
  }
  else if (v8)
  {
    v8[2]();
  }
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

- (PKPalettePopoverPresenting)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPalettePopoverPresenting *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (PKPaletteToolView)toolView
{
  return self->_toolView;
}

- (void)setToolView:(id)a3
{
}

- (PKPaletteColorPickerController)colorPickerController
{
  return self->_colorPickerController;
}

- (void)setColorPickerController:(id)a3
{
}

- (NSLayoutConstraint)toolViewTopAnchor
{
  return self->_toolViewTopAnchor;
}

- (void)setToolViewTopAnchor:(id)a3
{
}

- (NSLayoutConstraint)toolViewHeightAnchor
{
  return self->_toolViewHeightAnchor;
}

- (void)setToolViewHeightAnchor:(id)a3
{
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (void)setLayoutGuide:(id)a3
{
}

- (NSLayoutConstraint)layoutGuideTopConstraint
{
  return self->_layoutGuideTopConstraint;
}

- (void)setLayoutGuideTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)layoutGuideWidthConstraint
{
  return self->_layoutGuideWidthConstraint;
}

- (void)setLayoutGuideWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)layoutGuideHeightConstraint
{
  return self->_layoutGuideHeightConstraint;
}

- (void)setLayoutGuideHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)layoutGuideCenterXConstraint
{
  return self->_layoutGuideCenterXConstraint;
}

- (void)setLayoutGuideCenterXConstraint:(id)a3
{
}

- (BOOL)isToolViewVisible
{
  return self->_toolViewVisible;
}

- (void)setToolViewVisible:(BOOL)a3
{
  self->_toolViewVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutGuideCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuideWidthConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuideTopConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_toolViewHeightAnchor, 0);
  objc_storeStrong((id *)&self->_toolViewTopAnchor, 0);
  objc_storeStrong((id *)&self->_colorPickerController, 0);
  objc_storeStrong((id *)&self->_toolView, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end