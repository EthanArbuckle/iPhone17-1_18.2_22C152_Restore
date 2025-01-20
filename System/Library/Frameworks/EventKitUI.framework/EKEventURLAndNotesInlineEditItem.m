@interface EKEventURLAndNotesInlineEditItem
- (BOOL)isInline;
- (BOOL)isSaveable;
- (BOOL)saveAndDismissWithForce:(BOOL)a3;
- (EKEventURLAndNotesInlineEditItem)init;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)searchStringForEventAutocomplete;
- (unint64_t)numberOfSubitems;
- (void)dealloc;
- (void)refreshFromCalendarItemAndStore;
- (void)reset;
- (void)setCalendarItem:(id)a3 store:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSelectedResponder:(id)a3;
- (void)tableViewDidScroll;
@end

@implementation EKEventURLAndNotesInlineEditItem

- (EKEventURLAndNotesInlineEditItem)init
{
  v9.receiver = self;
  v9.super_class = (Class)EKEventURLAndNotesInlineEditItem;
  v2 = [(EKEventURLAndNotesInlineEditItem *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(EKEventURLInlineEditItem);
    urlEditItem = v2->_urlEditItem;
    v2->_urlEditItem = v3;

    v5 = objc_alloc_init(EKEventNotesInlineEditItem);
    notesEditItem = v2->_notesEditItem;
    v2->_notesEditItem = v5;

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__contentSizeCategoryChanged name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)EKEventURLAndNotesInlineEditItem;
  [(EKEventURLAndNotesInlineEditItem *)&v4 dealloc];
}

- (void)reset
{
  [(EKEventURLInlineEditItem *)self->_urlEditItem reset];
  notesEditItem = self->_notesEditItem;

  [(EKEventNotesInlineEditItem *)notesEditItem reset];
}

- (void)setCalendarItem:(id)a3 store:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)EKEventURLAndNotesInlineEditItem;
  id v6 = a4;
  id v7 = a3;
  [(EKEventEditItem *)&v8 setCalendarItem:v7 store:v6];
  -[EKEventEditItem setCalendarItem:store:](self->_urlEditItem, "setCalendarItem:store:", v7, v6, v8.receiver, v8.super_class);
  [(EKEventEditItem *)self->_notesEditItem setCalendarItem:v7 store:v6];
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventURLAndNotesInlineEditItem;
  id v4 = a3;
  [(EKCalendarItemEditItem *)&v5 setDelegate:v4];
  -[EKCalendarItemEditItem setDelegate:](self->_urlEditItem, "setDelegate:", v4, v5.receiver, v5.super_class);
  [(EKCalendarItemEditItem *)self->_notesEditItem setDelegate:v4];
}

- (void)setSelectedResponder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventURLAndNotesInlineEditItem;
  id v4 = a3;
  [(EKCalendarItemEditItem *)&v5 setSelectedResponder:v4];
  -[EKCalendarItemEditItem setSelectedResponder:](self->_urlEditItem, "setSelectedResponder:", v4, v5.receiver, v5.super_class);
  [(EKCalendarItemEditItem *)self->_notesEditItem setSelectedResponder:v4];
}

- (unint64_t)numberOfSubitems
{
  unint64_t v3 = [(EKCalendarItemEditItem *)self->_urlEditItem numberOfSubitems];
  return [(EKCalendarItemEditItem *)self->_notesEditItem numberOfSubitems] + v3;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  if (!a3)
  {
    id v4 = &OBJC_IVAR___EKEventURLAndNotesInlineEditItem__urlEditItem;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    id v4 = &OBJC_IVAR___EKEventURLAndNotesInlineEditItem__notesEditItem;
LABEL_5:
    [*(id *)((char *)&self->super.super.super.isa + *v4) defaultCellHeightForSubitemAtIndex:0 forWidth:a4];
    return result;
  }
  return 0.0;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  if (!a3)
  {
    objc_super v5 = &OBJC_IVAR___EKEventURLAndNotesInlineEditItem__urlEditItem;
LABEL_5:
    id v6 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v5), "cellForSubitemAtIndex:", 0, v3);
    return v6;
  }
  if (a3 == 1)
  {
    objc_super v5 = &OBJC_IVAR___EKEventURLAndNotesInlineEditItem__notesEditItem;
    goto LABEL_5;
  }
  id v6 = 0;
  return v6;
}

- (BOOL)isInline
{
  return 1;
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = -[EKEventURLInlineEditItem saveAndDismissWithForce:](self->_urlEditItem, "saveAndDismissWithForce:");
  return v5 | [(EKEventNotesInlineEditItem *)self->_notesEditItem saveAndDismissWithForce:v3];
}

- (void)tableViewDidScroll
{
}

- (BOOL)isSaveable
{
  if ([(EKEventURLInlineEditItem *)self->_urlEditItem isSaveable]) {
    return 1;
  }
  notesEditItem = self->_notesEditItem;

  return [(EKEventNotesInlineEditItem *)notesEditItem isSaveable];
}

- (id)searchStringForEventAutocomplete
{
  return 0;
}

- (void)refreshFromCalendarItemAndStore
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notesEditItem, 0);

  objc_storeStrong((id *)&self->_urlEditItem, 0);
}

@end