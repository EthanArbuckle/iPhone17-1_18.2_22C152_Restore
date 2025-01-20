@interface CNContactCell
+ (BOOL)shouldIndentWhileEditing;
- (BOOL)hasGapBetweenSeparatorAndTrailingEdge;
- (BOOL)shouldPerformAccessoryAction;
- (BOOL)shouldPerformDefaultAction;
- (BOOL)showSeparator;
- (CNCardGroupItem)cardGroupItem;
- (CNContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)constantConstraints;
- (NSArray)variableConstraints;
- (double)minCellHeight;
- (void)_setAnimating:(BOOL)a3 clippingAdjacentCells:(BOOL)a4;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setCardGroupItem:(id)a3;
- (void)setShowSeparator:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation CNContactCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardGroupItem, 0);
  objc_storeStrong((id *)&self->_variableConstraints, 0);

  objc_storeStrong((id *)&self->_constantConstraints, 0);
}

- (void)setCardGroupItem:(id)a3
{
}

- (CNCardGroupItem)cardGroupItem
{
  return self->_cardGroupItem;
}

- (void)_setAnimating:(BOOL)a3 clippingAdjacentCells:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [(CNContactCell *)self layer];
  uint64_t v8 = [v7 allowsGroupBlending];

  if (_setAnimating_clippingAdjacentCells__onceToken != -1) {
    dispatch_once(&_setAnimating_clippingAdjacentCells__onceToken, &__block_literal_global_7773);
  }
  if (_setAnimating_clippingAdjacentCells__respondsToSelector)
  {
    v10.receiver = self;
    v10.super_class = (Class)CNContactCell;
    [(CNContactCell *)&v10 _setAnimating:v5 clippingAdjacentCells:v4];
  }
  v9 = [(CNContactCell *)self layer];
  [v9 setAllowsGroupBlending:v8];
}

uint64_t __53__CNContactCell__setAnimating_clippingAdjacentCells___block_invoke()
{
  uint64_t result = [MEMORY[0x1E4FB1D08] instancesRespondToSelector:sel__setAnimating_clippingAdjacentCells_];
  _setAnimating_clippingAdjacentCells__respondsToSelector = result;
  return result;
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constantConstraints];
    constantConstraints = self->_constantConstraints;
    self->_constantConstraints = 0;
  }

  [(CNContactCell *)self setNeedsUpdateConstraints];
}

- (double)minCellHeight
{
  return 0.0;
}

- (void)updateConstraints
{
  kdebug_trace();
  v7.receiver = self;
  v7.super_class = (Class)CNContactCell;
  [(CNContactCell *)&v7 updateConstraints];
  if (self->_variableConstraints) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
  }
  if (!self->_constantConstraints)
  {
    v3 = [(CNContactCell *)self constantConstraints];
    constantConstraints = self->_constantConstraints;
    self->_constantConstraints = v3;

    [MEMORY[0x1E4F28DC8] activateConstraints:self->_constantConstraints];
  }
  BOOL v5 = [(CNContactCell *)self variableConstraints];
  variableConstraints = self->_variableConstraints;
  self->_variableConstraints = v5;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_variableConstraints];
  kdebug_trace();
}

- (NSArray)variableConstraints
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (NSArray)constantConstraints
{
  v11[1] = *MEMORY[0x1E4F143B8];
  [(CNContactCell *)self minCellHeight];
  if (v3 <= 0.0)
  {
    v9 = [MEMORY[0x1E4F1C978] array];
  }
  else
  {
    BOOL v4 = (void *)MEMORY[0x1E4F28DC8];
    BOOL v5 = [(CNContactCell *)self contentView];
    [(CNContactCell *)self minCellHeight];
    objc_super v7 = [v4 constraintWithItem:v5 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:0.0 constant:v6];

    LODWORD(v8) = 1148829696;
    [v7 setPriority:v8];
    v11[0] = v7;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }

  return (NSArray *)v9;
}

- (BOOL)hasGapBetweenSeparatorAndTrailingEdge
{
  if ([(CNContactCell *)self separatorStyle] != 1) {
    return 0;
  }
  double v3 = [(CNContactCell *)self traitCollection];
  uint64_t v4 = [v3 layoutDirection];

  if (v4 == 1)
  {
    [(CNContactCell *)self _separatorFrame];
    double MinX = CGRectGetMinX(v9);
  }
  else
  {
    [(CNContactCell *)self bounds];
    double v8 = v7;
    [(CNContactCell *)self _separatorFrame];
    double MinX = v8 - CGRectGetMaxX(v10);
  }
  return MinX >= 1.0;
}

- (BOOL)showSeparator
{
  return [(CNContactCell *)self separatorStyle] == 1;
}

- (void)setShowSeparator:(BOOL)a3
{
}

- (BOOL)shouldPerformAccessoryAction
{
  return 1;
}

- (BOOL)shouldPerformDefaultAction
{
  return [(CNContactCell *)self isEditing] ^ 1;
}

- (void)prepareForReuse
{
  [(CNContactCell *)self setCardGroupItem:0];
  v3.receiver = self;
  v3.super_class = (Class)CNContactCell;
  [(CNContactCell *)&v3 prepareForReuse];
}

- (void)dealloc
{
  objc_super v3 = [(CNContactCell *)self contentView];
  uint64_t v4 = [v3 constraints];
  BOOL v5 = (void *)[v4 mutableCopy];

  [v5 addObjectsFromArray:self->_constantConstraints];
  [v5 addObjectsFromArray:self->_variableConstraints];
  [(CNContactCell *)self setCardGroupItem:0];

  v6.receiver = self;
  v6.super_class = (Class)CNContactCell;
  [(CNContactCell *)&v6 dealloc];
}

- (CNContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactCell;
  uint64_t v4 = [(CNContactCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  [(CNContactCell *)v4 setNeedsUpdateConstraints];
  BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:v4 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

  return v4;
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

@end