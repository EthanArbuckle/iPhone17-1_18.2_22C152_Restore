@interface EKConferenceInformationInlineEditItem
- (BOOL)isInline;
- (BOOL)isSaveable;
- (BOOL)shouldAppear;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)searchStringForEventAutocomplete;
- (void)reset;
@end

@implementation EKConferenceInformationInlineEditItem

- (BOOL)shouldAppear
{
  v3 = [(EKEventEditItem *)self event];
  v4 = [v3 virtualConference];
  if (v4)
  {
    v5 = [(EKEventEditItem *)self event];
    v6 = [v5 virtualConference];
    v7 = [v6 joinMethods];
    if ((unint64_t)[v7 count] <= 1)
    {
      v9 = [(EKEventEditItem *)self event];
      v10 = [v9 virtualConference];
      v11 = [v10 conferenceDetails];
      BOOL v8 = [v11 length] != 0;
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

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:183.0];
  return result;
}

- (void)reset
{
  cell = self->_cell;
  self->_cell = 0;
}

- (BOOL)isInline
{
  return 1;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    v5 = [[CalendarNotesCell alloc] initWithStyle:0 reuseIdentifier:0];
    v6 = self->_cell;
    self->_cell = v5;

    v7 = [(CalendarNotesCell *)self->_cell textView];
    [v7 setEditable:0];

    BOOL v8 = [(CalendarNotesCell *)self->_cell textView];
    [v8 setDataDetectorTypes:-1];

    v9 = [(EKEventEditItem *)self event];
    v10 = [v9 virtualConferenceTextRepresentation];
    v11 = [(CalendarNotesCell *)self->_cell textView];
    [v11 setText:v10];

    v12 = [(CalendarNotesCell *)self->_cell textView];
    CalDisableFocusRingForView();

    cell = self->_cell;
  }

  return cell;
}

- (BOOL)isSaveable
{
  return 0;
}

- (id)searchStringForEventAutocomplete
{
  return 0;
}

- (void).cxx_destruct
{
}

@end