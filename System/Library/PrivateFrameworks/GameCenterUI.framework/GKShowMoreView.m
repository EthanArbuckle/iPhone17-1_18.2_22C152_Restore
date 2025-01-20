@interface GKShowMoreView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)loading;
- (BOOL)showShowAll;
- (GKLabel)label;
- (GKShowMoreView)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)horizontalContraint;
- (NSLayoutConstraint)verticalContraint;
- (SEL)showMoreAction;
- (UIActivityIndicatorView)spinner;
- (UICollectionView)collectionView;
- (double)textAlignmentOffset;
- (id)baseTextStyle;
- (int64_t)numberToShow;
- (int64_t)sectionIndex;
- (void)applyLayoutAttributes:(id)a3;
- (void)prepareForReuse;
- (void)setCollectionView:(id)a3;
- (void)setHorizontalContraint:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setNumberToShow:(int64_t)a3;
- (void)setSectionIndex:(int64_t)a3;
- (void)setShowMoreAction:(SEL)a3;
- (void)setShowShowAll:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)setTextAlignmentOffset:(double)a3;
- (void)setVerticalContraint:(id)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updateConstraints;
- (void)updateLabel;
@end

@implementation GKShowMoreView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (GKShowMoreView)initWithFrame:(CGRect)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)GKShowMoreView;
  v3 = -[GKShowMoreView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(GKShowMoreView *)v3 baseTextStyle];
    v6 = [v5 buttonTitle];

    v7 = objc_alloc_init(GKLabel);
    label = v4->_label;
    v4->_label = v7;

    v9 = GKGameCenterUIFrameworkBundle();
    v10 = GKGetLocalizedStringFromTableInBundle();
    v11 = [v10 _gkAttributedStringByApplyingStyle:v6];
    [(GKLabel *)v4->_label setAttributedText:v11];

    [(GKLabel *)v4->_label setBackgroundColor:0];
    v12 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if (v13 == 1)
    {
      if (*MEMORY[0x1E4F63830]) {
        BOOL v14 = *MEMORY[0x1E4F63A38] == 0;
      }
      else {
        BOOL v14 = 0;
      }
      uint64_t v15 = v14;
    }
    else
    {
      uint64_t v15 = 1;
    }
    [(GKLabel *)v4->_label setShouldInhibitReplay:v15];
    [(GKLabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKLabel *)v4->_label setOpaque:0];
    v4->_textAlignmentOffset = 2.22507386e-308;
    [(GKShowMoreView *)v4 addSubview:v4->_label];
    uint64_t v16 = [MEMORY[0x1E4F28DC8] _gkConstraintForView:v4->_label centeredYInView:v4];
    verticalContraint = v4->_verticalContraint;
    v4->_verticalContraint = (NSLayoutConstraint *)v16;

    [(GKShowMoreView *)v4 addConstraint:v4->_verticalContraint];
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:2];
    spinner = v4->_spinner;
    v4->_spinner = (UIActivityIndicatorView *)v18;

    [(UIActivityIndicatorView *)v4->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = [MEMORY[0x1E4F639B0] sharedPalette];
    v21 = [v20 activityIndicatorColor];
    [(UIActivityIndicatorView *)v4->_spinner setColor:v21];

    [(GKShowMoreView *)v4 addSubview:v4->_spinner];
    v22 = (void *)MEMORY[0x1E4F28DC8];
    v28[0] = @"label";
    v23 = v4->_label;
    v28[1] = @"spinner";
    v29[0] = v23;
    v29[1] = v4->_spinner;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
    v25 = [v22 constraintsWithVisualFormat:@"H:[spinner]-gap-[label]" options:1024 metrics:&unk_1F08127E8 views:v24];
    [(GKShowMoreView *)v4 addConstraints:v25];
  }
  return v4;
}

- (id)baseTextStyle
{
  v2 = [MEMORY[0x1E4F639F8] textStyle];
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != 1 || (*MEMORY[0x1E4F63830] ? (BOOL v5 = *MEMORY[0x1E4F63A38] == 0) : (BOOL v5 = 0), v5))
  {
    uint64_t v6 = [v2 header3];
  }
  else
  {
    uint64_t v6 = [v2 header4];
  }
  v7 = (void *)v6;

  return v7;
}

- (void)updateConstraints
{
  v6.receiver = self;
  v6.super_class = (Class)GKShowMoreView;
  [(GKShowMoreView *)&v6 updateConstraints];
  [(GKShowMoreView *)self removeConstraint:self->_horizontalContraint];
  [(GKShowMoreView *)self addConstraint:self->_verticalContraint];
  double textAlignmentOffset = self->_textAlignmentOffset;
  if (self->_loading)
  {
    [(UIActivityIndicatorView *)self->_spinner frame];
    double textAlignmentOffset = textAlignmentOffset + v4 + 6.0;
  }
  BOOL v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_label attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:textAlignmentOffset];
  [(GKShowMoreView *)self setHorizontalContraint:v5];

  [(GKShowMoreView *)self addConstraint:self->_horizontalContraint];
}

- (void)setLoading:(BOOL)a3
{
  if (self->_loading != a3)
  {
    BOOL v3 = a3;
    self->_loading = a3;
    id v12 = [(GKShowMoreView *)self baseTextStyle];
    BOOL v5 = GKGameCenterUIFrameworkBundle();
    GKGetLocalizedStringFromTableInBundle();
    if (v3) {
      objc_super v6 = {;
    }
      v7 = [v12 info];
      v8 = [v6 _gkAttributedStringByApplyingStyle:v7];
      [(GKLabel *)self->_label setAttributedText:v8];

      [(UIActivityIndicatorView *)self->_spinner startAnimating];
    }
    else {
      v9 = {;
    }
      v10 = [v12 buttonTitle];
      v11 = [v9 _gkAttributedStringByApplyingStyle:v10];
      [(GKLabel *)self->_label setAttributedText:v11];

      [(UIActivityIndicatorView *)self->_spinner stopAnimating];
    }
    [(GKShowMoreView *)self setNeedsUpdateConstraints];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GKShowMoreView;
  [(GKShowMoreView *)&v17 touchesEnded:v6 withEvent:v7];
  p_showMoreAction = &self->_showMoreAction;
  if (self->_showMoreAction && !self->_loading)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v9 = v6;
    if ([v9 countByEnumeratingWithState:&v13 objects:v18 count:16])
    {
      v10 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", v13, v14, v15, v16);
      if (*p_showMoreAction) {
        SEL v11 = *p_showMoreAction;
      }
      else {
        SEL v11 = 0;
      }
      id v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:self->_sectionIndex];
      [v10 _gkSendAction:v11 viaResponder:self withObject:v12];
    }
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GKShowMoreView;
  [(GKShowMoreView *)&v16 applyLayoutAttributes:v4];
  BOOL v5 = [v4 indexPath];
  -[GKShowMoreView setSectionIndex:](self, "setSectionIndex:", [v5 section]);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    uint64_t v7 = [v6 maxTotalItemCount];
    int64_t v8 = v7 - [v6 currentVisibleItemCount];
    id v9 = [v6 sectionMetrics];
    self->_int64_t numberToShow = [v9 incrementalRevealItemCount];

    int64_t numberToShow = self->_numberToShow;
    BOOL v12 = v8 < numberToShow || numberToShow == -1;
    self->_showShowAll = v12;
    long long v13 = [MEMORY[0x1E4FB1438] sharedApplication];
    long long v14 = [v13 _gkTargetForAction:sel_applyShowMoreLayoutAttributesForShowMoreView_atIndexPath_ viaResponder:self];

    long long v15 = [v6 indexPath];
    [v14 applyShowMoreLayoutAttributesForShowMoreView:self atIndexPath:v15];
  }
}

- (void)setTextAlignmentOffset:(double)a3
{
  if (self->_textAlignmentOffset != a3)
  {
    self->_double textAlignmentOffset = a3;
    [(GKShowMoreView *)self setNeedsUpdateConstraints];
  }
}

- (void)setCollectionView:(id)a3
{
  BOOL v5 = (UICollectionView *)a3;
  collectionView = self->_collectionView;
  if (collectionView != v5)
  {
    uint64_t v7 = v5;
    [(UICollectionView *)collectionView removeConstraint:self->_horizontalContraint];
    objc_storeStrong((id *)&self->_collectionView, a3);
    collectionView = (UICollectionView *)[(GKShowMoreView *)self setNeedsUpdateConstraints];
    BOOL v5 = v7;
  }

  MEMORY[0x1F41817F8](collectionView, v5);
}

- (void)updateLabel
{
  BOOL v3 = [(GKShowMoreView *)self baseTextStyle];
  id v11 = [v3 buttonTitle];

  if (self->_showShowAll)
  {
    id v4 = GKGameCenterUIFrameworkBundle();
    BOOL v5 = GKGetLocalizedStringFromTableInBundle();
    id v6 = [v5 _gkAttributedStringByApplyingStyle:v11];
    uint64_t v7 = [(GKShowMoreView *)self label];
    [v7 setAttributedText:v6];
  }
  else
  {
    int64_t v8 = NSString;
    id v4 = GKGameCenterUIFrameworkBundle();
    BOOL v5 = GKGetLocalizedStringFromTableInBundle();
    id v6 = GKFormattedStringWithGroupingFromInteger();
    uint64_t v7 = objc_msgSend(v8, "stringWithFormat:", v5, v6);
    id v9 = [v7 _gkAttributedStringByApplyingStyle:v11];
    v10 = [(GKShowMoreView *)self label];
    [v10 setAttributedText:v9];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)GKShowMoreView;
  [(GKShowMoreView *)&v3 prepareForReuse];
  self->_showMoreAction = 0;
}

- (SEL)showMoreAction
{
  if (self->_showMoreAction) {
    return self->_showMoreAction;
  }
  else {
    return 0;
  }
}

- (void)setShowMoreAction:(SEL)a3
{
  if (a3) {
    objc_super v3 = a3;
  }
  else {
    objc_super v3 = 0;
  }
  self->_showMoreAction = v3;
}

- (BOOL)loading
{
  return self->_loading;
}

- (double)textAlignmentOffset
{
  return self->_textAlignmentOffset;
}

- (GKLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (NSLayoutConstraint)horizontalContraint
{
  return self->_horizontalContraint;
}

- (void)setHorizontalContraint:(id)a3
{
}

- (NSLayoutConstraint)verticalContraint
{
  return self->_verticalContraint;
}

- (void)setVerticalContraint:(id)a3
{
}

- (BOOL)showShowAll
{
  return self->_showShowAll;
}

- (void)setShowShowAll:(BOOL)a3
{
  self->_showShowAll = a3;
}

- (int64_t)numberToShow
{
  return self->_numberToShow;
}

- (void)setNumberToShow:(int64_t)a3
{
  self->_int64_t numberToShow = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_verticalContraint, 0);
  objc_storeStrong((id *)&self->_horizontalContraint, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end