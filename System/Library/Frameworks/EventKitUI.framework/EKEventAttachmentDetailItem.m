@interface EKEventAttachmentDetailItem
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (BOOL)detailItemVisibilityChanged;
- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)owningEventForAttachmentCellController:(id)a3;
- (id)parentViewControllerForAttachmentCellController:(id)a3;
- (unint64_t)numberOfSubitems;
- (void)_cleanUpCellControllers;
- (void)_setUpCellControllers;
- (void)dealloc;
- (void)eventViewController:(id)a3 didSelectSubitem:(unint64_t)a4;
- (void)reset;
- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5;
@end

@implementation EKEventAttachmentDetailItem

- (void)_cleanUpCellControllers
{
  cellControllers = self->_cellControllers;
  if (cellControllers)
  {
    self->_cellControllers = 0;
  }
}

- (void)_setUpCellControllers
{
  self->_visibilityChanged = 0;
  v3 = [(EKEvent *)self->super._event calendar];
  id v10 = [v3 source];

  v4 = [MEMORY[0x1E4F57B18] sharedInstance];
  uint64_t v5 = [v4 sourceIsManaged:v10];

  v6 = [(EKEvent *)self->super._event attachments];
  v7 = +[EKEventAttachmentCellController cellControllersForAttachments:v6 givenExistingControllers:self->_cellControllers sourceIsManaged:v5];

  if (!v7)
  {
    v7 = [MEMORY[0x1E4F1C978] array];
  }
  [(NSArray *)self->_cellControllers makeObjectsPerformSelector:sel_setDelegate_ withObject:0];
  cellControllers = self->_cellControllers;
  self->_cellControllers = v7;
  v9 = v7;

  [(NSArray *)self->_cellControllers makeObjectsPerformSelector:sel_setDelegate_ withObject:self];
}

- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)EKEventAttachmentDetailItem;
  [(EKEventDetailItem *)&v6 setEvent:a3 reminder:a4 store:a5];
  [(EKEventAttachmentDetailItem *)self _setUpCellControllers];
}

- (void)reset
{
  cellControllers = self->_cellControllers;
  if (cellControllers)
  {
    if (![(NSArray *)cellControllers count]
      && ([(EKEvent *)self->super._event attachments],
          v4 = objc_claimAutoreleasedReturnValue(),
          v4,
          v4)
      || [(NSArray *)self->_cellControllers count]
      && ([(EKEvent *)self->super._event attachments],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          !v5))
    {
      self->_visibilityChanged = 1;
    }
  }

  [(EKEventAttachmentDetailItem *)self _cleanUpCellControllers];
}

- (void)dealloc
{
  [(EKEventAttachmentDetailItem *)self _cleanUpCellControllers];
  v3.receiver = self;
  v3.super_class = (Class)EKEventAttachmentDetailItem;
  [(EKEventDetailItem *)&v3 dealloc];
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  cellControllers = self->_cellControllers;
  if (!cellControllers)
  {
    [(EKEventAttachmentDetailItem *)self _setUpCellControllers];
    cellControllers = self->_cellControllers;
  }
  return [(NSArray *)cellControllers count] != 0;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cellControllers = self->_cellControllers;
  if (!cellControllers)
  {
    [(EKEventAttachmentDetailItem *)self _setUpCellControllers];
    cellControllers = self->_cellControllers;
  }
  if ([(NSArray *)cellControllers count] <= a3)
  {
    v8 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_ERROR, "No cellControllers found in the attachment detail item.  We shouldn't be drawn, but tableview thinks we want to display, returning empty cell", v10, 2u);
    }
    v7 = objc_opt_new();
  }
  else
  {
    objc_super v6 = [(NSArray *)self->_cellControllers objectAtIndex:a3];
    v7 = [v6 cell];
  }

  return v7;
}

- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3
{
  return 1;
}

- (unint64_t)numberOfSubitems
{
  cellControllers = self->_cellControllers;
  if (!cellControllers)
  {
    [(EKEventAttachmentDetailItem *)self _setUpCellControllers];
    cellControllers = self->_cellControllers;
  }

  return [(NSArray *)cellControllers count];
}

- (void)eventViewController:(id)a3 didSelectSubitem:(unint64_t)a4
{
  if ([(NSArray *)self->_cellControllers count] > a4)
  {
    id v6 = [(NSArray *)self->_cellControllers objectAtIndex:a4];
    [v6 cellSelected];
  }
}

- (BOOL)detailItemVisibilityChanged
{
  return self->_visibilityChanged;
}

- (id)parentViewControllerForAttachmentCellController:(id)a3
{
  v4 = [(EKEventDetailItem *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(EKEventDetailItem *)self delegate];
    v7 = [v6 viewControllerForEventItem:self];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)owningEventForAttachmentCellController:(id)a3
{
  return self->super._event;
}

- (void).cxx_destruct
{
}

@end