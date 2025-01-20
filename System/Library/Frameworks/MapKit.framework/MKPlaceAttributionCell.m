@interface MKPlaceAttributionCell
+ (id)fontForLabel;
- (BOOL)isHighlighted;
- (MKPlaceAttributionCell)initWithFrame:(CGRect)a3;
- (MKPlaceAttributionCellButton)labelButton;
- (MKPlaceAttributionCellDelegate)cellDelegate;
- (NSLayoutConstraint)labelBaselineToTop;
- (NSLayoutConstraint)labelLastBaselineToBottom;
- (UITapGestureRecognizer)selectGestureRecognizer;
- (_MKUILabel)label;
- (double)currentHeight;
- (void)_contentSizeDidChange;
- (void)attributionCellButton:(id)a3 isHighighted:(BOOL)a4 executeAction:(BOOL)a5;
- (void)attributionClicked;
- (void)createConstraints;
- (void)setAttributionString:(id)a3;
- (void)setCellDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLabelBaselineToTop:(id)a3;
- (void)setLabelButton:(id)a3;
- (void)setLabelLastBaselineToBottom:(id)a3;
- (void)setSelectGestureRecognizer:(id)a3;
- (void)updateConstraints;
@end

@implementation MKPlaceAttributionCell

- (MKPlaceAttributionCell)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)MKPlaceAttributionCell;
  v3 = -[MKPlaceSectionItemView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MKPlaceAttributionCell *)v3 setPreservesSuperviewLayoutMargins:1];
    v5 = [MKPlaceAttributionLabel alloc];
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = -[MKPlaceAttributionLabel initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    v11 = *(void **)&v4->_highlighted;
    *(void *)&v4->_highlighted = v10;

    v12 = *(void **)&v4->_highlighted;
    v13 = [MEMORY[0x1E4F428B8] clearColor];
    [v12 setBackgroundColor:v13];

    [*(id *)&v4->_highlighted setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = +[MKPlaceAttributionCell fontForLabel];
    [*(id *)&v4->_highlighted setFont:v14];

    [*(id *)&v4->_highlighted setNumberOfLines:3];
    LODWORD(v15) = 1132068864;
    objc_msgSend(*(id *)&v4->_highlighted, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v15);
    objc_msgSend(*(id *)&v4->_highlighted, "set_mapkit_themeColorProvider:", &__block_literal_global_51);
    [(MKPlaceAttributionCell *)v4 addSubview:*(void *)&v4->_highlighted];
    v16 = -[MKPlaceAttributionCellButton initWithFrame:]([MKPlaceAttributionCellButton alloc], "initWithFrame:", v6, v7, v8, v9);
    label = v4->_label;
    v4->_label = (_MKUILabel *)v16;

    [(_MKUILabel *)v4->_label setButtonDelegate:v4];
    [(_MKUILabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = v4->_label;
    v19 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIView *)v18 _mapkit_setBackgroundColor:v19];

    [(_MKUILabel *)v4->_label addTarget:v4 action:sel_attributionClicked forControlEvents:64];
    [(MKPlaceAttributionCell *)v4 addSubview:v4->_label];
    v20 = (MKPlaceAttributionCellDelegate *)objc_alloc_init(MEMORY[0x1E4F42EC8]);
    cellDelegate = v4->_cellDelegate;
    v4->_cellDelegate = v20;

    [(MKPlaceAttributionCellDelegate *)v4->_cellDelegate setAllowedPressTypes:&unk_1ED97F398];
    [(MKPlaceAttributionCellDelegate *)v4->_cellDelegate setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
    [(MKPlaceAttributionCell *)v4 addGestureRecognizer:v4->_cellDelegate];
    [(MKPlaceAttributionCellDelegate *)v4->_cellDelegate addTarget:v4 action:sel_attributionClicked];
    [(MKPlaceAttributionCell *)v4 createConstraints];
    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v4 selector:sel__contentSizeDidChange name:*MEMORY[0x1E4F43788] object:0];
  }
  return v4;
}

uint64_t __40__MKPlaceAttributionCell_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  return [a2 tintColor];
}

- (void)createConstraints
{
  v43[8] = *MEMORY[0x1E4F143B8];
  v41 = [MEMORY[0x1E4F1CA48] array];
  v3 = +[MKPlaceAttributionCell fontForLabel];
  v4 = [*(id *)&self->_highlighted firstBaselineAnchor];
  v5 = [(MKPlaceAttributionCell *)self topAnchor];
  v42 = v3;
  objc_msgSend(v3, "_mapkit_scaledValueForValue:", 27.0);
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5);
  double v6 = (MKPlaceAttributionCellButton *)objc_claimAutoreleasedReturnValue();
  labelButton = self->_labelButton;
  self->_labelButton = v6;

  double v8 = [*(id *)&self->_highlighted lastBaselineAnchor];
  double v9 = [(MKPlaceAttributionCell *)self bottomAnchor];
  objc_msgSend(v3, "_mapkit_scaledValueForValue:", 18.0);
  v11 = [v8 constraintEqualToAnchor:v9 constant:-v10];
  labelBaselineToTop = self->_labelBaselineToTop;
  self->_labelBaselineToTop = v11;

  LODWORD(v13) = 1148829696;
  [(NSLayoutConstraint *)self->_labelBaselineToTop setPriority:v13];
  v14 = self->_labelButton;
  v43[0] = self->_labelBaselineToTop;
  v43[1] = v14;
  v39 = [*(id *)&self->_highlighted leadingAnchor];
  v40 = [(MKPlaceAttributionCell *)self layoutMarginsGuide];
  v38 = [v40 leadingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v43[2] = v37;
  v35 = [*(id *)&self->_highlighted trailingAnchor];
  v36 = [(MKPlaceAttributionCell *)self layoutMarginsGuide];
  v34 = [v36 trailingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v43[3] = v33;
  v32 = [*(id *)&self->_highlighted topAnchor];
  v31 = [(_MKUILabel *)self->_label topAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v43[4] = v30;
  v29 = [*(id *)&self->_highlighted bottomAnchor];
  v28 = [(_MKUILabel *)self->_label bottomAnchor];
  double v15 = [v29 constraintEqualToAnchor:v28];
  v43[5] = v15;
  v16 = [*(id *)&self->_highlighted leadingAnchor];
  v17 = [(_MKUILabel *)self->_label leadingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v43[6] = v18;
  v19 = [*(id *)&self->_highlighted trailingAnchor];
  v20 = [(_MKUILabel *)self->_label trailingAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v43[7] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:8];
  [v41 addObjectsFromArray:v22];

  uint64_t v23 = [v41 copy];
  objc_super v24 = *(void **)&self->super._selected;
  *(void *)&self->super._selected = v23;

  v25 = [(MKPlaceAttributionCell *)self heightAnchor];
  v26 = [v25 constraintEqualToConstant:0.0];
  visibleConstraints = self->_visibleConstraints;
  self->_visibleConstraints = v26;

  [(NSArray *)self->_visibleConstraints setActive:1];
  [(UIView *)self _mapkit_setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v3 = [*(id *)&self->_highlighted attributedText];
  if ([v3 length])
  {
    int v4 = [(NSArray *)self->_visibleConstraints isActive];

    if (v4)
    {
      [(NSArray *)self->_visibleConstraints setActive:0];
      [MEMORY[0x1E4F28DC8] activateConstraints:*(void *)&self->super._selected];
      goto LABEL_9;
    }
  }
  else
  {
  }
  v5 = [*(id *)&self->_highlighted attributedText];
  if ([v5 length])
  {
  }
  else
  {
    char v6 = [(NSArray *)self->_visibleConstraints isActive];

    if ((v6 & 1) == 0)
    {
      [MEMORY[0x1E4F28DC8] deactivateConstraints:*(void *)&self->super._selected];
      [(NSArray *)self->_visibleConstraints setActive:1];
    }
  }
LABEL_9:
  v7.receiver = self;
  v7.super_class = (Class)MKPlaceAttributionCell;
  [(MKPlaceAttributionCell *)&v7 updateConstraints];
}

- (void)_contentSizeDidChange
{
  id v4 = +[MKPlaceAttributionCell fontForLabel];
  [*(id *)&self->_highlighted setFont:v4];
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 27.0);
  -[MKPlaceAttributionCellButton setConstant:](self->_labelButton, "setConstant:");
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 18.0);
  [(NSLayoutConstraint *)self->_labelBaselineToTop setConstant:-v3];
}

- (void)attributionClicked
{
  id v2 = [(MKPlaceAttributionCell *)self cellDelegate];
  [v2 openURL];
}

- (void)setAttributionString:(id)a3
{
  id v4 = *(void **)&self->_highlighted;
  id v5 = a3;
  [v4 setAttributedText:v5];
  char v6 = [v5 string];

  [(_MKUILabel *)self->_label setAccessibilityLabel:v6];
  objc_super v7 = [(_MKUILabel *)self->_label accessibilityLabel];
  [(MKPlaceAttributionCell *)self setAccessibilityLabel:v7];

  [(UIView *)self _mapkit_setNeedsUpdateConstraints];
}

+ (id)fontForLabel
{
  id v2 = +[MKFontManager sharedManager];
  double v3 = [v2 subtitleFont];

  return v3;
}

- (double)currentHeight
{
  id v2 = +[MKPlaceAttributionCell fontForLabel];
  objc_msgSend(v2, "_mapkit_scaledValueForValue:", 27.0);
  double v4 = v3;
  objc_msgSend(v2, "_mapkit_scaledValueForValue:", 18.0);
  double v6 = v4 + v5;

  return v6;
}

- (void)attributionCellButton:(id)a3 isHighighted:(BOOL)a4 executeAction:(BOOL)a5
{
  BOOL v5 = a4;
  objc_super v7 = (_MKUILabel *)a3;
  if (self->_label == v7)
  {
    double v9 = v7;
    double v8 = 1.0;
    if (v5) {
      double v8 = 0.25;
    }
    [*(id *)&self->_highlighted setAlpha:v8];
    objc_super v7 = v9;
  }
}

- (_MKUILabel)label
{
  return *(_MKUILabel **)&self->_highlighted;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)isHighlighted
{
  return (BOOL)self->_collapsedConstraint;
}

- (void)setHighlighted:(BOOL)a3
{
  LOBYTE(self->_collapsedConstraint) = a3;
}

- (MKPlaceAttributionCellButton)labelButton
{
  return (MKPlaceAttributionCellButton *)self->_label;
}

- (void)setLabelButton:(id)a3
{
}

- (NSLayoutConstraint)labelBaselineToTop
{
  return (NSLayoutConstraint *)self->_labelButton;
}

- (void)setLabelBaselineToTop:(id)a3
{
}

- (NSLayoutConstraint)labelLastBaselineToBottom
{
  return self->_labelBaselineToTop;
}

- (void)setLabelLastBaselineToBottom:(id)a3
{
}

- (MKPlaceAttributionCellDelegate)cellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelLastBaselineToBottom);

  return (MKPlaceAttributionCellDelegate *)WeakRetained;
}

- (void)setCellDelegate:(id)a3
{
}

- (UITapGestureRecognizer)selectGestureRecognizer
{
  return (UITapGestureRecognizer *)self->_cellDelegate;
}

- (void)setSelectGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellDelegate, 0);
  objc_destroyWeak((id *)&self->_labelLastBaselineToBottom);
  objc_storeStrong((id *)&self->_labelBaselineToTop, 0);
  objc_storeStrong((id *)&self->_labelButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_highlighted, 0);
  objc_storeStrong((id *)&self->_visibleConstraints, 0);

  objc_storeStrong((id *)&self->super._selected, 0);
}

@end