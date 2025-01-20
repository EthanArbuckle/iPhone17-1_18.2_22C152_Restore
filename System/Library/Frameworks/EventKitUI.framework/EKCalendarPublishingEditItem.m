@interface EKCalendarPublishingEditItem
- (BOOL)configureWithCalendar:(id)a3;
- (BOOL)published;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (id)calendarTitle;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)footerTitle;
- (id)pubishURL;
- (unint64_t)numberOfSubitems;
- (void)_publishChanged:(id)a3;
- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)reset;
- (void)setPublished:(BOOL)a3;
@end

@implementation EKCalendarPublishingEditItem

- (void)reset
{
  spinner = self->_spinner;
  self->_spinner = 0;
}

- (id)footerTitle
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Allow anyone to subscribe to a read-only version of this calendar." value:&stru_1F0CC2140 table:0];

  return v3;
}

- (BOOL)configureWithCalendar:(id)a3
{
  id v4 = a3;
  -[EKCalendarPublishingEditItem setPublished:](self, "setPublished:", [v4 isPublished]);
  LOBYTE(self) = [v4 canBePublished];

  return (char)self;
}

- (unint64_t)numberOfSubitems
{
  if (![(EKCalendar *)self->super._calendar isPublished]) {
    return 1;
  }
  v3 = [(EKCalendar *)self->super._calendar publishURL];
  if (v3) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  if (!EKUIUnscaledCatalyst()) {
    return 45.0;
  }

  return EKUIUnscaledCatalystTableRowHeightDefault();
}

- (void)_publishChanged:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    -[EKCalendarPublishingEditItem setPublished:](self, "setPublished:", [v4 isOn]);
    uint64_t v5 = [v4 isOn];

    [(EKCalendar *)self->super._calendar setIsPublished:v5];
    v6 = [(EKCalendarEditItem *)self delegate];
    v7 = [v6 editorForCalendarEditItem:self];

    calendar = self->super._calendar;
    id v18 = 0;
    char v9 = [v7 saveCalendar:calendar error:&v18];
    id v10 = v18;
    if ((v9 & 1) == 0)
    {
      v11 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v10;
        _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_ERROR, "Error Publishing Calendar: %@", buf, 0xCu);
      }
    }
    v12 = [(EKCalendarEditItem *)self delegate];
    [v12 calendarItemStartedEditing:self];

    [(EKCalendarPublishingEditItem *)self reset];
    v13 = [(EKCalendarEditItem *)self delegate];
    v14 = [v13 tableView];
    v15 = (void *)MEMORY[0x1E4F28D60];
    v16 = [(EKCalendarEditItem *)self delegate];
    v17 = objc_msgSend(v15, "indexSetWithIndex:", (int)objc_msgSend(v16, "sectionForCalendarEditItem:", self));
    [v14 reloadSections:v17 withRowAnimation:100];
  }
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v5 = [[EKUITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"ShareCell"];
    v8 = EventKitUIBundle();
    char v9 = [v8 localizedStringForKey:@"Share Link…" value:&stru_1F0CC2140 table:0];
    id v10 = [(EKUITableViewCell *)v5 textLabel];
    [v10 setText:v9];
  }
  else if (a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v4 = objc_alloc_init(EKUITableViewCell);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __54__EKCalendarPublishingEditItem_cellForSubitemAtIndex___block_invoke;
    uint64_t v21 = &unk_1E6087D68;
    v22 = self;
    uint64_t v5 = v4;
    v23 = v5;
    v6 = (void (**)(void))_Block_copy(&v18);
    if ([(EKCalendar *)self->super._calendar isPublished]
      && ([(EKCalendar *)self->super._calendar publishURL],
          v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          !v7))
    {
      v11 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      spinner = self->_spinner;
      self->_spinner = v11;

      [(UIActivityIndicatorView *)self->_spinner startAnimating];
      [(EKUITableViewCell *)v5 setAccessoryView:self->_spinner];
      dispatch_time_t v13 = dispatch_time(0, 5000000000);
      dispatch_after(v13, MEMORY[0x1E4F14428], v6);
    }
    else
    {
      v6[2](v6);
    }
    v14 = EventKitUIBundle();
    v15 = [v14 localizedStringForKey:@"Public Calendar" value:&stru_1F0CC2140 table:0];
    v16 = [(EKUITableViewCell *)v5 textLabel];
    [v16 setText:v15];

    [(EKUITableViewCell *)v5 setSelectionStyle:0];
  }

  return v5;
}

void __54__EKCalendarPublishingEditItem_cellForSubitemAtIndex___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
  [v2 setOn:*(unsigned __int8 *)(*(void *)(a1 + 32) + 32)];
  [v2 addTarget:*(void *)(a1 + 32) action:sel__publishChanged_ forControlEvents:4096];
  [*(id *)(a1 + 40) setAccessoryView:v2];
}

- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 == 1)
  {
    v7 = [CalendarPublishingActivityViewController alloc];
    v8 = [(EKCalendarPublishingEditItem *)self pubishURL];
    v16[0] = v8;
    char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    id v10 = [(CalendarPublishingActivityViewController *)v7 initWithActivityItems:v9 applicationActivities:0];

    [(CalendarPublishingActivityViewController *)v10 setActivityDelegate:self];
    v11 = [v6 view];
    if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v11))
    {
      v12 = [v6 view];
      BOOL IsRegular = EKUICurrentHeightSizeClassIsRegular(v12);

      if (IsRegular)
      {
        [(CalendarPublishingActivityViewController *)v10 setAllowsCustomPresentationStyle:1];
        [(CalendarPublishingActivityViewController *)v10 setModalPresentationStyle:3];
      }
    }
    else
    {
    }
    v14 = [(EKCalendarEditItem *)self delegate];
    v15 = [v14 owningNavigationController];
    [v15 presentModalViewController:v10 withTransition:8];
  }
}

- (id)calendarTitle
{
  return [(EKCalendar *)self->super._calendar title];
}

- (id)pubishURL
{
  id v2 = [(EKCalendar *)self->super._calendar publishURL];
  v3 = [v2 absoluteString];

  return v3;
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
}

- (BOOL)published
{
  return self->_published;
}

- (void)setPublished:(BOOL)a3
{
  self->_published = a3;
}

- (void).cxx_destruct
{
}

@end