@interface EKCalendarItemTitleInlineEditItem
- (BOOL)drawsOwnRowSeparators;
- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4;
- (BOOL)focusTitleAndSelectTitle:(BOOL)a3;
- (BOOL)isInline;
- (BOOL)isSaveable;
- (BOOL)saveAndDismissWithForce:(BOOL)a3;
- (BOOL)titleShouldClear;
- (BOOL)titleShouldReturn;
- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3;
- (EKCalendarItemTitleInlineEditItem)init;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (id)_makeCell;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)searchStringForEventAutocomplete;
- (unint64_t)numberOfSubitems;
- (void)_setDrawsOwnRowSeparatorsForCell:(id)a3;
- (void)dealloc;
- (void)refreshFromCalendarItemAndStore;
- (void)reset;
- (void)setDrawsOwnRowSeparators:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)titleDidBeginEditing:(id)a3;
- (void)titleDidChange;
- (void)titleDidEndEditing;
@end

@implementation EKCalendarItemTitleInlineEditItem

- (EKCalendarItemTitleInlineEditItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)EKCalendarItemTitleInlineEditItem;
  v2 = [(EKCalendarItemTitleInlineEditItem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(EKCalendarItemTitleInlineEditItem *)v2 setDrawsOwnRowSeparators:0];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__contentSizeCategoryChanged_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)EKCalendarItemTitleInlineEditItem;
  [(EKCalendarItemTitleInlineEditItem *)&v4 dealloc];
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  [(id)objc_opt_class() scaledHeightOfSystemTableViewCell];
  double v7 = v6;
  double v8 = v6 * 3.0;
  [(EKUITitleTableViewCell *)self->_titleCell idealHeightForWidth:a4];
  return fmax(v7, fmin(v9 + 22.0, v8));
}

- (BOOL)isInline
{
  return 1;
}

- (void)refreshFromCalendarItemAndStore
{
  p_calendarItem = &self->super._calendarItem;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._calendarItem);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_calendarItem);
    v5 = [v6 title];
    [(EKUITitleTableViewCell *)self->_titleCell setTitle:v5];
  }
}

- (void)reset
{
  titleCell = self->_titleCell;
  self->_titleCell = 0;
}

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (id)_makeCell
{
  v2 = [[EKUISingleLineTitleTableViewCell alloc] initWithDelegate:self];

  return v2;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)focusTitleAndSelectTitle:(BOOL)a3
{
  BOOL v3 = a3;
  titleCell = self->_titleCell;
  if (!titleCell)
  {
    id v6 = [(EKCalendarItemTitleInlineEditItem *)self cellForSubitemAtIndex:0];
    titleCell = self->_titleCell;
  }
  [(EKUITitleTableViewCell *)titleCell focusTitleAndSelectTitle:v3];
  return 1;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  titleCell = self->_titleCell;
  if (!titleCell)
  {
    v5 = [(EKCalendarItemTitleInlineEditItem *)self _makeCell];
    id v6 = self->_titleCell;
    self->_titleCell = v5;

    titleCell = self->_titleCell;
  }
  double v7 = titleCell;
  double v8 = [(EKCalendarItemEditItem *)self calendarItem];
  double v9 = [v8 title];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    v11 = [(EKCalendarItemEditItem *)self calendarItem];
    v12 = [v11 title];
    v13 = _StringWithLineEndingsRemoved(v12);
    [(EKUITitleTableViewCell *)v7 setTitle:v13];
  }
  [(EKCalendarItemTitleInlineEditItem *)self _setDrawsOwnRowSeparatorsForCell:v7];

  return v7;
}

- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3
{
  return 0;
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  titleCell = self->_titleCell;
  if (titleCell)
  {
    v5 = [(EKUITitleTableViewCell *)titleCell title];
    id v6 = _StringWithLineEndingsRemoved(v5);
    double v7 = [(EKCalendarItemEditItem *)self calendarItem];
    [v7 setTitle:v6];
  }
  [(EKCalendarItemEditItem *)self notifySubitemDidSave:0];
  return 1;
}

- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4
{
  objc_super v4 = [(EKCalendarItemEditItem *)self selectedResponder];
  BOOL v5 = v4 == 0;

  return v5;
}

- (void)titleDidBeginEditing:(id)a3
{
  [(EKCalendarItemEditItem *)self setSelectedResponder:a3];

  [(EKCalendarItemEditItem *)self notifyDidStartEditing];
}

- (void)titleDidChange
{
  [(EKCalendarItemEditItem *)self notifyTextChanged];

  [(EKCalendarItemEditItem *)self notifyRequiresHeightChange];
}

- (void)titleDidEndEditing
{
  [(EKCalendarItemEditItem *)self notifyDidEndEditing];

  [(EKCalendarItemEditItem *)self setSelectedResponder:0];
}

- (BOOL)titleShouldClear
{
  return 1;
}

- (BOOL)titleShouldReturn
{
  v2 = [(EKCalendarItemEditItem *)self selectedResponder];
  [v2 resignFirstResponder];

  return 0;
}

- (id)searchStringForEventAutocomplete
{
  return (id)[(EKUITitleTableViewCell *)self->_titleCell title];
}

- (BOOL)isSaveable
{
  BOOL v3 = [(EKUITitleTableViewCell *)self->_titleCell title];
  objc_super v4 = [(EKCalendarItemEditItem *)self calendarItem];
  BOOL v5 = [v4 title];
  if ([v3 isEqualToString:v5])
  {
    BOOL v6 = 0;
  }
  else
  {
    double v7 = [(EKUITitleTableViewCell *)self->_titleCell title];
    BOOL v6 = [v7 length] != 0;
  }
  return v6;
}

- (void)setDrawsOwnRowSeparators:(BOOL)a3
{
  if (self->_drawsOwnRowSeparators != a3)
  {
    self->_drawsOwnRowSeparators = a3;
    objc_super v4 = [(EKCalendarItemEditItem *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      BOOL v6 = [(EKCalendarItemEditItem *)self delegate];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __62__EKCalendarItemTitleInlineEditItem_setDrawsOwnRowSeparators___block_invoke;
      v7[3] = &unk_1E60874D0;
      v7[4] = self;
      [v6 editItem:self performActionsOnCellAtSubitem:0 actions:v7];
    }
  }
}

uint64_t __62__EKCalendarItemTitleInlineEditItem_setDrawsOwnRowSeparators___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setDrawsOwnRowSeparatorsForCell:a2];
}

- (void)_setDrawsOwnRowSeparatorsForCell:(id)a3
{
  id v9 = a3;
  objc_msgSend(v9, "setDrawsOwnRowSeparators:", -[EKCalendarItemTitleInlineEditItem drawsOwnRowSeparators](self, "drawsOwnRowSeparators"));
  objc_super v4 = [MEMORY[0x1E4FB1618] separatorColor];
  [v9 setRowSeparatorColor:v4];

  if ([(EKCalendarItemTitleInlineEditItem *)self drawsOwnRowSeparators])
  {
    double v5 = *MEMORY[0x1E4FB2848];
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    double v5 = *MEMORY[0x1E4FB2F28];
    double v6 = *MEMORY[0x1E4FB2F28];
    double v7 = *MEMORY[0x1E4FB2F28];
    double v8 = *MEMORY[0x1E4FB2F28];
  }
  objc_msgSend(v9, "setSeparatorInset:", v5, v6, v7, v8);
}

- (BOOL)drawsOwnRowSeparators
{
  return self->_drawsOwnRowSeparators;
}

- (void).cxx_destruct
{
}

@end