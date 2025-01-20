@interface EKEventTitleDetailItem
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (BOOL)hasMapItemLaunchOptionFromTimeToLeaveNotification;
- (BOOL)hidesBottomSeparator;
- (BOOL)hidesTopSeparator;
- (BOOL)minimalMode;
- (BOOL)nonInteractivePlatterMode;
- (BOOL)shouldShowEditButtonInline;
- (BOOL)shouldShowNextButton;
- (BOOL)shouldShowPreviousButton;
- (BOOL)showsDetectedConferenceItem;
- (BOOL)titleCellShouldPresentShareSheet:(id)a3;
- (EKEventTitleDetailItemDelegate)editDelegate;
- (NSDate)proposedTime;
- (UIView)sourceViewForPopover;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5;
- (double)titleHeight;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)owningViewController;
- (unint64_t)numberOfTitleLines;
- (void)_updateCellIfNeededForWidth:(double)a3;
- (void)editButtonPressed;
- (void)nextButtonPressed;
- (void)predictionWasActedOn;
- (void)previousButtonPressed;
- (void)refreshCopiedEvents;
- (void)refreshForHeightChange;
- (void)reset;
- (void)setCellPosition:(int)a3;
- (void)setEditDelegate:(id)a3;
- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5;
- (void)setHasMapItemLaunchOptionFromTimeToLeaveNotification:(BOOL)a3;
- (void)setHidesBottomSeparator:(BOOL)a3;
- (void)setHidesTopSeparator:(BOOL)a3;
- (void)setNonInteractivePlatterMode:(BOOL)a3;
- (void)setNumberOfTitleLines:(unint64_t)a3;
- (void)setProposedTime:(id)a3;
- (void)titleCell:(id)a3 requestPresentShareSheetWithActivityItems:(id)a4 withPopoverSourceView:(id)a5;
@end

@implementation EKEventTitleDetailItem

- (void)reset
{
  self->_cellNeedsUpdate = 1;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  return 1;
}

- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)EKEventTitleDetailItem;
  id v8 = a3;
  [(EKEventDetailItem *)&v9 setEvent:v8 reminder:a4 store:a5];
  -[EKEventDetailCell setEvent:](self->_cell, "setEvent:", v8, v9.receiver, v9.super_class);
}

- (void)setCellPosition:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(EKEventDetailItem *)self cellPosition] != a3) {
    self->_cellNeedsUpdate = 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)EKEventTitleDetailItem;
  [(EKEventDetailItem *)&v5 setCellPosition:v3];
}

- (void)_updateCellIfNeededForWidth:(double)a3
{
  if (self->_cellNeedsUpdate)
  {
    [(EKEventDetailTitleCell *)self->_cell update];
    [(EKEventDetailTitleCell *)self->_cell layoutForWidth:[(EKEventDetailItem *)self cellPosition] position:a3];
    self->_cellNeedsUpdate = 0;
  }
}

- (double)titleHeight
{
  [(EKEventDetailTitleCell *)self->_cell titleHeight];
  return result;
}

- (void)setHidesTopSeparator:(BOOL)a3
{
  self->_hidesTopSeparator = a3;
  cell = self->_cell;
  if (cell) {
    -[EKEventDetailTitleCell setHideTopCellSeparator:](cell, "setHideTopCellSeparator:");
  }
}

- (void)setHidesBottomSeparator:(BOOL)a3
{
  self->_hidesBottomSeparator = a3;
  cell = self->_cell;
  if (cell) {
    -[EKEventDetailTitleCell setHideBottomCellSeparator:](cell, "setHideBottomCellSeparator:");
  }
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  if (self->_cell)
  {
    if (a5) {
      self->_cellNeedsUpdate = 1;
    }
    -[EKEventTitleDetailItem _updateCellIfNeededForWidth:](self, "_updateCellIfNeededForWidth:", a3, a4);
  }
  else
  {
    id v6 = -[EKEventTitleDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", 0, a5, a4);
  }
  [(EKEventDetailTitleCell *)self->_cell frame];
  return v7;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    objc_super v5 = [(EKEventDetailCell *)[EKEventDetailTitleCell alloc] initWithEvent:self->super._event editable:0];
    [(EKEventDetailTitleCell *)v5 setNumberOfTitleLines:[(EKEventTitleDetailItem *)self numberOfTitleLines]];
    [(EKEventDetailTitleCell *)v5 setDelegate:self];
    [(EKEventDetailTitleCell *)v5 setNonInteractivePlatterMode:[(EKEventTitleDetailItem *)self nonInteractivePlatterMode]];
    if ([(EKEventTitleDetailItem *)self hidesBottomSeparator]) {
      [(EKEventDetailTitleCell *)v5 setHideBottomCellSeparator:1];
    }
    if ([(EKEventTitleDetailItem *)self hidesTopSeparator]) {
      [(EKEventDetailTitleCell *)v5 setHideTopCellSeparator:1];
    }
    [(EKEventDetailTitleCell *)v5 setHasMapItemLaunchOptionFromTimeToLeaveNotification:[(EKEventTitleDetailItem *)self hasMapItemLaunchOptionFromTimeToLeaveNotification]];
    id v6 = self->_cell;
    self->_cell = v5;

    self->_cellNeedsUpdate = 1;
    cell = self->_cell;
  }
  [(EKEventDetailTitleCell *)cell frame];
  [(EKEventTitleDetailItem *)self _updateCellIfNeededForWidth:v7];
  id v8 = self->_cell;

  return v8;
}

- (void)setNumberOfTitleLines:(unint64_t)a3
{
  if (self->_numberOfTitleLines != a3)
  {
    self->_numberOfTitleLines = a3;
    -[EKEventDetailTitleCell setNumberOfTitleLines:](self->_cell, "setNumberOfTitleLines:");
  }
}

- (void)refreshCopiedEvents
{
}

- (UIView)sourceViewForPopover
{
  return [(EKEventDetailTitleCell *)self->_cell sourceViewForPopover];
}

- (void)editButtonPressed
{
  id v2 = [(EKEventTitleDetailItem *)self editDelegate];
  [v2 editButtonPressed];
}

- (BOOL)shouldShowEditButtonInline
{
  uint64_t v3 = [(EKEventTitleDetailItem *)self editDelegate];

  if (!v3) {
    return 0;
  }
  v4 = [(EKEventTitleDetailItem *)self editDelegate];
  char v5 = [v4 shouldShowEditButtonInline];

  return v5;
}

- (BOOL)shouldShowNextButton
{
  uint64_t v3 = [(EKEventTitleDetailItem *)self editDelegate];

  if (!v3) {
    return 0;
  }
  v4 = [(EKEventTitleDetailItem *)self editDelegate];
  char v5 = [v4 shouldShowNextButton];

  return v5;
}

- (BOOL)shouldShowPreviousButton
{
  uint64_t v3 = [(EKEventTitleDetailItem *)self editDelegate];

  if (!v3) {
    return 0;
  }
  v4 = [(EKEventTitleDetailItem *)self editDelegate];
  char v5 = [v4 shouldShowPreviousButton];

  return v5;
}

- (void)nextButtonPressed
{
  id v2 = [(EKEventTitleDetailItem *)self editDelegate];
  [v2 nextButtonPressed];
}

- (void)previousButtonPressed
{
  id v2 = [(EKEventTitleDetailItem *)self editDelegate];
  [v2 previousButtonPressed];
}

- (void)predictionWasActedOn
{
}

- (BOOL)minimalMode
{
  id v2 = [(EKEventTitleDetailItem *)self editDelegate];
  char v3 = [v2 minimalMode];

  return v3;
}

- (id)owningViewController
{
  char v3 = [(EKEventDetailItem *)self delegate];
  v4 = [v3 viewControllerForEventItem:self];

  return v4;
}

- (BOOL)showsDetectedConferenceItem
{
  id v2 = [(EKEventDetailItem *)self delegate];
  char v3 = [v2 showsDetectedConferenceItem];

  return v3;
}

- (void)refreshForHeightChange
{
  id v2 = [(EKEventDetailItem *)self delegate];
  [v2 eventDetailItemWantsRefeshForHeightChange];
}

- (NSDate)proposedTime
{
  return self->_proposedTime;
}

- (BOOL)titleCellShouldPresentShareSheet:(id)a3
{
  v4 = [(EKEventDetailItem *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 1;
  }
  id v6 = [(EKEventDetailItem *)self delegate];
  char v7 = [v6 eventDetailItemShouldPresentShareSheet:self];

  return v7;
}

- (void)titleCell:(id)a3 requestPresentShareSheetWithActivityItems:(id)a4 withPopoverSourceView:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(EKEventDetailItem *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(EKEventDetailItem *)self delegate];
    [v10 eventDetailItem:self requestPresentShareSheetWithActivityItems:v11 withPopoverSourceView:v7];
  }
}

- (BOOL)hidesTopSeparator
{
  return self->_hidesTopSeparator;
}

- (BOOL)hidesBottomSeparator
{
  return self->_hidesBottomSeparator;
}

- (void)setProposedTime:(id)a3
{
}

- (EKEventTitleDetailItemDelegate)editDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editDelegate);

  return (EKEventTitleDetailItemDelegate *)WeakRetained;
}

- (void)setEditDelegate:(id)a3
{
}

- (BOOL)nonInteractivePlatterMode
{
  return self->_nonInteractivePlatterMode;
}

- (void)setNonInteractivePlatterMode:(BOOL)a3
{
  self->_nonInteractivePlatterMode = a3;
}

- (BOOL)hasMapItemLaunchOptionFromTimeToLeaveNotification
{
  return self->_hasMapItemLaunchOptionFromTimeToLeaveNotification;
}

- (void)setHasMapItemLaunchOptionFromTimeToLeaveNotification:(BOOL)a3
{
  self->_hasMapItemLaunchOptionFromTimeToLeaveNotification = a3;
}

- (unint64_t)numberOfTitleLines
{
  return self->_numberOfTitleLines;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editDelegate);
  objc_storeStrong((id *)&self->_proposedTime, 0);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end