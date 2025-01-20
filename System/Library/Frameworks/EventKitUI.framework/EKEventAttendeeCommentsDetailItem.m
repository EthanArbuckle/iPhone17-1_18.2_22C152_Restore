@interface EKEventAttendeeCommentsDetailItem
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (unint64_t)_numComments;
- (unint64_t)numberOfSubitems;
@end

@implementation EKEventAttendeeCommentsDetailItem

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  int v5 = [(EKEvent *)self->super._event isSelfOrganized];
  if (v5) {
    LOBYTE(v5) = [(EKEventAttendeeCommentsDetailItem *)self _numComments] != 0;
  }
  return v5;
}

- (unint64_t)_numComments
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(EKEvent *)self->super._event attendees];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) comment];
        v9 = [MEMORY[0x1E4F57BA8] stringWithAutoCommentRemoved:v8];

        if ([v9 length]) {
          ++v5;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  uint64_t v4 = [[EKUITableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
  unint64_t v5 = EventKitUIBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"Comments" value:&stru_1F0CC2140 table:0];
  v7 = [(EKUITableViewCell *)v4 textLabel];
  [v7 setText:v6];

  [(EKEventAttendeeCommentsDetailItem *)self _numComments];
  v8 = CUIKLocalizedStringForInteger();
  v9 = [(EKUITableViewCell *)v4 detailTextLabel];
  [v9 setText:v8];

  [(EKUITableViewCell *)v4 setAccessoryType:1];

  return v4;
}

- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3
{
  return [(EKEventAttendeeCommentsDetailItem *)self _numComments] != 0;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  unint64_t v5 = [[EKEventAttendeeCommentsEditViewController alloc] initWithEKEvent:self->super._event];
  uint64_t v6 = [(EKEventDetailItem *)self viewControllerToPresentFrom];
  v7 = [v6 navigationDelegate];
  [(EKEventAttendeeCommentsEditViewController *)v5 setNavigationDelegate:v7];

  return v5;
}

@end