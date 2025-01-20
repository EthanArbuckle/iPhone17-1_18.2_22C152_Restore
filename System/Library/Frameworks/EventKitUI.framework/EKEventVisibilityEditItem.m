@interface EKEventVisibilityEditItem
- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3;
- (BOOL)editItemViewControllerSave:(id)a3;
- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4;
- (BOOL)saveAndDismissWithForce:(BOOL)a3;
- (BOOL)shouldAppear;
- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3;
- (EKEventVisibilityEditItem)init;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (double)footerHeightForWidth:(double)a3;
- (id)_editItemForIndex:(unint64_t)a3;
- (id)_lowestEditItem;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (id)footerTitle;
- (id)footerView;
- (unint64_t)numberOfSubitems;
- (unint64_t)onSaveEditorReloadBehavior;
- (void)reset;
- (void)setCalendarItem:(id)a3 store:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EKEventVisibilityEditItem

- (EKEventVisibilityEditItem)init
{
  v8.receiver = self;
  v8.super_class = (Class)EKEventVisibilityEditItem;
  v2 = [(EKEventVisibilityEditItem *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(EKEventAvailabilityEditItem);
    availabilityEditItem = v2->_availabilityEditItem;
    v2->_availabilityEditItem = v3;

    v5 = objc_alloc_init(EKEventPrivacyLevelInlineEditItem);
    privacyLevelEditItem = v2->_privacyLevelEditItem;
    v2->_privacyLevelEditItem = v5;
  }
  return v2;
}

- (void)reset
{
  [(EKCalendarItemEditItem *)self->_availabilityEditItem reset];
  privacyLevelEditItem = self->_privacyLevelEditItem;

  [(EKCalendarItemEditItem *)privacyLevelEditItem reset];
}

- (unint64_t)onSaveEditorReloadBehavior
{
  unint64_t v3 = [(EKCalendarItemEditItem *)self->_availabilityEditItem onSaveEditorReloadBehavior];
  unint64_t result = [(EKEventPrivacyLevelInlineEditItem *)self->_privacyLevelEditItem onSaveEditorReloadBehavior];
  if (v3 > result) {
    return v3;
  }
  return result;
}

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EKEventAvailabilityEditItem *)self->_availabilityEditItem canBeConfiguredForCalendarConstraints:v4]|| [(EKEventPrivacyLevelInlineEditItem *)self->_privacyLevelEditItem canBeConfiguredForCalendarConstraints:v4];

  return v5;
}

- (BOOL)shouldAppear
{
  if ([(EKCalendarItemEditItem *)self->_availabilityEditItem shouldAppear]) {
    return 1;
  }
  privacyLevelEditItem = self->_privacyLevelEditItem;

  return [(EKEventPrivacyLevelInlineEditItem *)privacyLevelEditItem shouldAppear];
}

- (void)setCalendarItem:(id)a3 store:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)EKEventVisibilityEditItem;
  id v6 = a4;
  id v7 = a3;
  [(EKEventEditItem *)&v8 setCalendarItem:v7 store:v6];
  -[EKEventEditItem setCalendarItem:store:](self->_availabilityEditItem, "setCalendarItem:store:", v7, v6, v8.receiver, v8.super_class);
  [(EKEventEditItem *)self->_privacyLevelEditItem setCalendarItem:v7 store:v6];
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventVisibilityEditItem;
  id v4 = a3;
  [(EKCalendarItemEditItem *)&v5 setDelegate:v4];
  -[EKCalendarItemEditItem setDelegate:](self->_availabilityEditItem, "setDelegate:", v4, v5.receiver, v5.super_class);
  [(EKCalendarItemEditItem *)self->_privacyLevelEditItem setDelegate:v4];
}

- (unint64_t)numberOfSubitems
{
  if ([(EKEventPrivacyLevelInlineEditItem *)self->_privacyLevelEditItem shouldAppear]) {
    unint64_t result = 2;
  }
  else {
    unint64_t result = 1;
  }
  self->_lastKnownNumberOfSubitems = result;
  return result;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  objc_super v5 = [(EKEventVisibilityEditItem *)self _editItemForIndex:a3];
  [v5 defaultCellHeightForSubitemAtIndex:0 forWidth:a4];
  double v7 = v6;

  return v7;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  unint64_t v3 = [(EKEventVisibilityEditItem *)self _editItemForIndex:a3];
  id v4 = [v3 cellForSubitemAtIndex:0];

  return v4;
}

- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4
{
  return a4 == 0;
}

- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3
{
  return a3 == 0;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = [(EKEventVisibilityEditItem *)self _editItemForIndex:a4];
  subitemOfLastDetailViewControllerRequested = self->_subitemOfLastDetailViewControllerRequested;
  self->_subitemOfLastDetailViewControllerRequested = v9;

  v11 = self->_subitemOfLastDetailViewControllerRequested;

  return -[EKCalendarItemEditItem detailViewControllerWithFrame:forSubitemAtIndex:](v11, "detailViewControllerWithFrame:forSubitemAtIndex:", 0, x, y, width, height);
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  return [(EKCalendarItemEditItem *)self->_subitemOfLastDetailViewControllerRequested editItemViewControllerSave:a3];
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = -[EKEventAvailabilityEditItem saveAndDismissWithForce:](self->_availabilityEditItem, "saveAndDismissWithForce:");
  return v5 | [(EKEventPrivacyLevelInlineEditItem *)self->_privacyLevelEditItem saveAndDismissWithForce:v3];
}

- (double)footerHeightForWidth:(double)a3
{
  id v4 = [(EKEventVisibilityEditItem *)self _lowestEditItem];
  [v4 footerHeightForWidth:a3];
  double v6 = v5;

  return v6;
}

- (id)footerTitle
{
  v2 = [(EKEventVisibilityEditItem *)self _lowestEditItem];
  BOOL v3 = [v2 footerTitle];

  return v3;
}

- (id)footerView
{
  v2 = [(EKEventVisibilityEditItem *)self _lowestEditItem];
  BOOL v3 = [v2 footerView];

  return v3;
}

- (id)_lowestEditItem
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t lastKnownNumberOfSubitems = self->_lastKnownNumberOfSubitems;
  if (lastKnownNumberOfSubitems == 2)
  {
    uint64_t v4 = 1;
    goto LABEL_5;
  }
  if (lastKnownNumberOfSubitems == 1)
  {
    uint64_t v4 = 0;
LABEL_5:
    double v5 = [(EKEventVisibilityEditItem *)self _editItemForIndex:v4];
    goto LABEL_9;
  }
  double v6 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    unint64_t v7 = self->_lastKnownNumberOfSubitems;
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2048;
    unint64_t v12 = v7;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_ERROR, "Cannot find lowest edit item for [%@] with number of subitems: [%lu]", (uint8_t *)&v9, 0x16u);
  }
  double v5 = 0;
LABEL_9:

  return v5;
}

- (id)_editItemForIndex:(unint64_t)a3
{
  if (!a3)
  {
    uint64_t v4 = &OBJC_IVAR___EKEventVisibilityEditItem__availabilityEditItem;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.super.super.isa + *v4);
    return v5;
  }
  if (a3 == 1)
  {
    uint64_t v4 = &OBJC_IVAR___EKEventVisibilityEditItem__privacyLevelEditItem;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subitemOfLastDetailViewControllerRequested, 0);
  objc_storeStrong((id *)&self->_privacyLevelEditItem, 0);

  objc_storeStrong((id *)&self->_availabilityEditItem, 0);
}

@end