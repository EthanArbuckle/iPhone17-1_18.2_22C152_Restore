@interface EKCalendarSubscriptionSpamCheckEditItem
- (EKCalendarSubscriptionSpamCheckEditItemDelegate)subscriptionSpamDelegate;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (unint64_t)numberOfSubitems;
- (void)_receivedSpamCheckResult:(BOOL)a3 forURL:(id)a4;
- (void)_sendSpamCheckRequest;
- (void)_setState:(int)a3;
- (void)_throttlePeriodEnded;
- (void)_updateUI;
- (void)setSubscriptionSpamDelegate:(id)a3;
- (void)setURLToCheck:(id)a3;
@end

@implementation EKCalendarSubscriptionSpamCheckEditItem

- (void)setURLToCheck:(id)a3
{
  id v11 = a3;
  char v5 = [(NSURL *)self->_currentURL isEqual:v11];
  v6 = v11;
  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentURL, a3);
    v7 = [(NSURL *)self->_currentURL absoluteString];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      if (!self->_inThrottlePeriod)
      {
        [(EKCalendarSubscriptionSpamCheckEditItem *)self _setState:1];
        [(EKCalendarSubscriptionSpamCheckEditItem *)self _sendSpamCheckRequest];
        goto LABEL_8;
      }
      v9 = self;
      uint64_t v10 = 2;
    }
    else
    {
      v9 = self;
      uint64_t v10 = 0;
    }
    [(EKCalendarSubscriptionSpamCheckEditItem *)v9 _setState:v10];
LABEL_8:
    v6 = v11;
  }
}

- (void)_setState:(int)a3
{
  self->_state = a3;
  [(EKCalendarSubscriptionSpamCheckEditItem *)self _updateUI];
}

- (void)_sendSpamCheckRequest
{
  self->_inThrottlePeriod = 1;
  dispatch_time_t v3 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__EKCalendarSubscriptionSpamCheckEditItem__sendSpamCheckRequest__block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = self;
  v4 = (void *)MEMORY[0x1E4F14428];
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
  currentURL = self->_currentURL;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__EKCalendarSubscriptionSpamCheckEditItem__sendSpamCheckRequest__block_invoke_2;
  v6[3] = &unk_1E608A050;
  v6[4] = self;
  [MEMORY[0x1E4F57C38] checkURLForSpam:currentURL completionHandler:v6 queue:v4];
}

uint64_t __64__EKCalendarSubscriptionSpamCheckEditItem__sendSpamCheckRequest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _throttlePeriodEnded];
}

uint64_t __64__EKCalendarSubscriptionSpamCheckEditItem__sendSpamCheckRequest__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _receivedSpamCheckResult:a3 forURL:a2];
}

- (void)_throttlePeriodEnded
{
  self->_inThrottlePeriod = 0;
  if (self->_state == 2)
  {
    [(EKCalendarSubscriptionSpamCheckEditItem *)self _setState:1];
    [(EKCalendarSubscriptionSpamCheckEditItem *)self _sendSpamCheckRequest];
  }
}

- (void)_receivedSpamCheckResult:(BOOL)a3 forURL:(id)a4
{
  BOOL v4 = a3;
  if ([a4 isEqual:self->_currentURL])
  {
    if (v4) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 4;
    }
    [(EKCalendarSubscriptionSpamCheckEditItem *)self _setState:v6];
    id v7 = [(EKCalendarSubscriptionSpamCheckEditItem *)self subscriptionSpamDelegate];
    [v7 calendarSubscriptionSpamCheckEditItem:self didDetermineThatURL:self->_currentURL isSpam:v4];
  }
}

- (void)_updateUI
{
  if (!self->_cell) {
    return;
  }
  int state = self->_state;
  if (state == 3)
  {
    BOOL v4 = EventKitUIBundle();
    char v5 = v4;
    uint64_t v6 = @"Warning: This calendar subscription is spam.";
  }
  else
  {
    if (state != 1)
    {
      v13 = @" ";
      goto LABEL_9;
    }
    BOOL v4 = EventKitUIBundle();
    char v5 = v4;
    uint64_t v6 = @"Checking URL…";
  }
  v13 = [v4 localizedStringForKey:v6 value:&stru_1F0CC2140 table:0];

LABEL_9:
  id v7 = [MEMORY[0x1E4FB1948] plainFooterConfiguration];
  [v7 setText:v13];
  uint64_t v8 = [v7 textProperties];
  [v8 setAlignment:1];

  if (self->_state == 3)
  {
    v9 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v10 = [v7 textProperties];
    [v10 setColor:v9];

    [MEMORY[0x1E4FB1618] redColor];
  }
  else
  {
    [MEMORY[0x1E4FB1618] clearColor];
  id v11 = };
  v12 = [(UITableViewCell *)self->_cell contentView];
  [v12 setBackgroundColor:v11];

  [(UITableViewCell *)self->_cell setContentConfiguration:v7];
  [(UITableViewCell *)self->_cell sizeToFit];
  [(UITableViewCell *)self->_cell setNeedsLayout];
}

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    char v5 = (UITableViewCell *)objc_alloc_init(MEMORY[0x1E4FB1D08]);
    uint64_t v6 = self->_cell;
    self->_cell = v5;

    id v7 = [MEMORY[0x1E4FB1948] plainFooterConfiguration];
    [v7 setText:@" "];
    [(UITableViewCell *)self->_cell setContentConfiguration:v7];
    uint64_t v8 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITableViewCell *)self->_cell setBackgroundColor:v8];

    v9 = [MEMORY[0x1E4FB1618] clearColor];
    uint64_t v10 = [(UITableViewCell *)self->_cell contentView];
    [v10 setBackgroundColor:v9];

    [(EKCalendarSubscriptionSpamCheckEditItem *)self _updateUI];
    cell = self->_cell;
  }

  return cell;
}

- (EKCalendarSubscriptionSpamCheckEditItemDelegate)subscriptionSpamDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subscriptionSpamDelegate);

  return (EKCalendarSubscriptionSpamCheckEditItemDelegate *)WeakRetained;
}

- (void)setSubscriptionSpamDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_subscriptionSpamDelegate);
  objc_storeStrong((id *)&self->_cell, 0);

  objc_storeStrong((id *)&self->_currentURL, 0);
}

@end