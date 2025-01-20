@interface EKEventNotesDetailItem
+ (id)textFromEventBlock;
+ (id)titleForCell;
+ (id)titleForExtendedViewController;
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (id)textForCopyAction;
- (id)textForExtendedViewController;
@end

@implementation EKEventNotesDetailItem

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  v5 = [(EKEvent *)self->super.super._event displayNotes];
  if ([v5 length])
  {
    v6 = [(EKEvent *)self->super.super._event displayNotes];
    char v7 = CUIKShouldDisplayNotes();
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)titleForExtendedViewController
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Notes" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (id)titleForCell
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Notes" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (id)textFromEventBlock
{
  return &__block_literal_global_52;
}

id __44__EKEventNotesDetailItem_textFromEventBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 displayNotes];
  v4 = [v2 calendar];
  uint64_t v5 = [v4 type];

  if (v5 == 2)
  {
    v6 = [v2 displayNotes];
    uint64_t v7 = CUIKStripInlineExchangeAttachmentsFromNotes();

    v3 = (void *)v7;
  }

  return v3;
}

- (id)textForCopyAction
{
  return (id)[(EKEvent *)self->super.super._event displayNotes];
}

- (id)textForExtendedViewController
{
  return (id)[(EKEvent *)self->super.super._event displayNotes];
}

@end