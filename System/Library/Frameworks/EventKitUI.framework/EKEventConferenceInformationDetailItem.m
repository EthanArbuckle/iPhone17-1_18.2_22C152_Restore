@interface EKEventConferenceInformationDetailItem
+ (id)textFromEventBlock;
+ (id)titleForCell;
+ (id)titleForExtendedViewController;
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (id)textForCopyAction;
- (id)textForExtendedViewController;
@end

@implementation EKEventConferenceInformationDetailItem

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  v5 = [(EKEvent *)self->super.super._event virtualConference];
  if (v5)
  {
    v6 = [(EKEvent *)self->super.super._event virtualConference];
    v7 = [v6 joinMethods];
    if ((unint64_t)[v7 count] <= 1)
    {
      v9 = [(EKEvent *)self->super.super._event virtualConference];
      v10 = [v9 conferenceDetails];
      BOOL v8 = [v10 length] != 0;
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)titleForExtendedViewController
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Video Call Information" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (id)titleForCell
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Video Call Information" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (id)textFromEventBlock
{
  return &__block_literal_global_35;
}

uint64_t __60__EKEventConferenceInformationDetailItem_textFromEventBlock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 virtualConferenceTextRepresentation];
}

- (id)textForCopyAction
{
  event = self->super.super._event;
  id v9 = 0;
  id v10 = 0;
  [(EKEvent *)event parsedConference:&v10 andNotes:&v9];
  id v3 = v10;
  id v4 = v9;
  uint64_t v5 = [v3 range];
  v7 = objc_msgSend(v4, "substringWithRange:", v5, v6);

  return v7;
}

- (id)textForExtendedViewController
{
  return (id)[(EKEvent *)self->super.super._event virtualConferenceTextRepresentation];
}

@end