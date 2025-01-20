@interface EKReminderURLDetailItem
+ (id)titleForCell;
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (id)_createEventDetailCell;
- (id)urlAttributedText;
@end

@implementation EKReminderURLDetailItem

- (id)urlAttributedText
{
  v2 = [(REMReminder *)self->super.super.super._reminder attachmentContext];
  v3 = [v2 urlAttachments];
  v4 = [v3 firstObject];
  v5 = [v4 url];

  if (v5)
  {
    v6 = [v5 absoluteString];

    if (v6)
    {
      v6 = CUIKGetAttributedStringForEventDetailWithURL();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  v4 = [(EKReminderURLDetailItem *)self urlAttributedText];
  BOOL v5 = v4 != 0;

  return v5;
}

+ (id)titleForCell
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"URL-reminder-detail" value:@"URL" table:0];

  return v3;
}

- (id)_createEventDetailCell
{
  v3 = [EKReminderDetailTextCell alloc];
  event = self->super.super.super._event;
  reminder = self->super.super.super._reminder;
  BOOL v6 = [(EKReminderTextDetailItem *)self showExtraSpaceAtBottom];
  v7 = [(id)objc_opt_class() titleForCell];
  v8 = [(EKReminderURLDetailItem *)self urlAttributedText];
  v9 = [(EKReminderDetailTextCell *)v3 initWithEvent:event reminder:reminder editable:0 showExtraSpaceAtBottom:v6 title:v7 attributedText:v8];

  return v9;
}

@end