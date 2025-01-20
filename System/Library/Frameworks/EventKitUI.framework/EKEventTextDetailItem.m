@interface EKEventTextDetailItem
+ (id)textFromEventBlock;
+ (id)titleForCell;
+ (id)titleForExtendedViewController;
- (BOOL)requiresLayoutForSubitemCount;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5;
- (id)_createEventDetailCell;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)textForCopyAction;
- (id)textForExtendedViewController;
- (unint64_t)numberOfSubitems;
- (void)_updateCellIfNeeded;
- (void)requestShowCellDetail;
- (void)reset;
- (void)setCellPosition:(int)a3;
@end

@implementation EKEventTextDetailItem

- (void)reset
{
  cell = self->_cell;
  self->_cell = 0;
}

- (void)setCellPosition:(int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventTextDetailItem;
  [(EKEventDetailItem *)&v4 setCellPosition:*(void *)&a3];
  self->_cellNeedsUpdate = 1;
}

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (void)_updateCellIfNeeded
{
  if (self->_cellNeedsUpdate)
  {
    [(EKEventDetailCell *)self->_cell update];
    cell = self->_cell;
    [(EKEventDetailCell *)cell frame];
    [(EKEventDetailCell *)cell layoutForWidth:[(EKEventDetailItem *)self cellPosition] position:v4];
    self->_cellNeedsUpdate = 0;
  }
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  if (self->_cell)
  {
    if (a5) {
      self->_cellNeedsUpdate = 1;
    }
    [(EKEventTextDetailItem *)self _updateCellIfNeeded];
  }
  else
  {
    id v6 = -[EKEventTextDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3, a5, a4);
  }
  [(EKEventDetailCell *)self->_cell bounds];
  return v7;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  if (!self->_cell)
  {
    double v4 = [(EKEventTextDetailItem *)self _createEventDetailCell];
    cell = self->_cell;
    self->_cell = v4;

    self->_cellNeedsUpdate = 1;
  }
  [(EKEventTextDetailItem *)self _updateCellIfNeeded];
  id v6 = self->_cell;

  return v6;
}

- (id)_createEventDetailCell
{
  v3 = [EKEventDetailTextCell alloc];
  event = self->super._event;
  v5 = [(id)objc_opt_class() titleForCell];
  id v6 = [(id)objc_opt_class() textFromEventBlock];
  double v7 = [(EKEventDetailTextCell *)v3 initWithEvent:event editable:0 title:v5 textFromEventBlock:v6];

  [(EKEventDetailTextCell *)v7 setDelegate:self];

  return v7;
}

- (BOOL)requiresLayoutForSubitemCount
{
  return 1;
}

- (void)requestShowCellDetail
{
  v3 = [EKEventDetailExtendedTextViewController alloc];
  double v4 = [(EKEventTextDetailItem *)self textForExtendedViewController];
  v5 = [(id)objc_opt_class() titleForExtendedViewController];
  event = self->super._event;
  double v7 = [(EKEventTextDetailItem *)self textForCopyAction];
  v10 = [(EKEventDetailExtendedTextViewController *)v3 initWithText:v4 title:v5 event:event textForCopyAction:v7];

  v8 = [(EKEventDetailItem *)self viewControllerToPresentFrom];
  v9 = [v8 navigationDelegate];
  [v9 pushViewController:v10 animated:1];
}

- (void).cxx_destruct
{
}

+ (id)titleForExtendedViewController
{
  return 0;
}

+ (id)titleForCell
{
  return 0;
}

+ (id)textFromEventBlock
{
  return 0;
}

- (id)textForExtendedViewController
{
  return 0;
}

- (id)textForCopyAction
{
  return 0;
}

@end