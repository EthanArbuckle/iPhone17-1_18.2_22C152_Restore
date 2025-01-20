@interface EKEventAvailabilityDetailItem
- (BOOL)_canChangeAvailability;
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (id)_choices;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (void)reset;
- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5;
@end

@implementation EKEventAvailabilityDetailItem

- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)EKEventAvailabilityDetailItem;
  [(EKEventDetailItem *)&v6 setEvent:a3 reminder:a4 store:a5];
  self->_availability = [(EKEvent *)self->super._event availability];
}

- (id)_choices
{
  v2 = [(EKEvent *)self->super._event calendar];
  char v3 = [v2 supportedEventAvailabilities];

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = v4;
  if (v3)
  {
    [v4 addObject:&unk_1F0D03970];
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:&unk_1F0D03988];
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v5 addObject:&unk_1F0D039A0];
  if ((v3 & 8) != 0) {
LABEL_5:
  }
    [v5 addObject:&unk_1F0D039B8];
LABEL_6:

  return v5;
}

- (void)reset
{
  cell = self->_cell;
  self->_cell = 0;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventAvailabilityDetailItem;
  [(EKEventDetailItem *)&v5 defaultCellHeightForSubitemAtIndex:a3 forWidth:a4];
  return result;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  return !a4 && objc_msgSend(a3, "supportedEventAvailabilities", v4, v5) != 0;
}

- (BOOL)_canChangeAvailability
{
  if ([(EKEventDetailItem *)self isPrivateEvent]) {
    return 0;
  }
  else {
    return ![(EKEventDetailItem *)self isReadOnlyDelegateCalendar];
  }
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  cell = self->_cell;
  if (cell) {
    goto LABEL_19;
  }
  EKUIUnscaledCatalyst();
  uint64_t v5 = (UITableViewCell *)[objc_alloc((Class)objc_opt_class()) initWithStyle:1 reuseIdentifier:0];
  objc_super v6 = self->_cell;
  self->_cell = v5;

  objc_initWeak(&location, self);
  v31 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v7 = [(EKEventAvailabilityDetailItem *)self _choices];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E4FB13F0];
        [v11 intValue];
        v13 = CUIKDisplayStringForAvailability();
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __55__EKEventAvailabilityDetailItem_cellForSubitemAtIndex___block_invoke;
        v32[3] = &unk_1E6088218;
        objc_copyWeak(&v33, &location);
        v32[4] = v11;
        v14 = [v12 actionWithTitle:v13 image:0 identifier:0 handler:v32];

        int64_t availability = self->_availability;
        if (availability == (int)[v11 intValue]) {
          [v14 setState:1];
        }
        [v31 addObject:v14];

        objc_destroyWeak(&v33);
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v8);
  }

  if (EKUIUnscaledCatalyst())
  {
    v16 = [MEMORY[0x1E4FB14D0] buttonWithType:124];
    v17 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F0CC2140 image:0 identifier:0 options:1 children:v31];
    [v16 setMenu:v17];

    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [(UITableViewCell *)self->_cell contentView];
    [v18 addSubview:v16];

    v19 = (void *)MEMORY[0x1E4F28DC8];
    v20 = [(UITableViewCell *)self->_cell textLabel];
    v21 = [v19 constraintWithItem:v16 attribute:11 relatedBy:0 toItem:v20 attribute:11 multiplier:1.0 constant:0.0];
    [v21 setActive:1];

    v22 = (void *)MEMORY[0x1E4F28DC8];
    v23 = [(UITableViewCell *)self->_cell contentView];
    v24 = [v22 constraintWithItem:v16 attribute:6 relatedBy:0 toItem:v23 attribute:6 multiplier:1.0 constant:-20.0];
    [v24 setActive:1];

LABEL_15:
    goto LABEL_16;
  }
  if ([v31 count])
  {
    v16 = [MEMORY[0x1E4FB1970] menuWithChildren:v31];
    [(UITableViewCell *)self->_cell setPopupMenu:v16];
    goto LABEL_15;
  }
LABEL_16:
  v25 = [MEMORY[0x1E4FB1618] labelColor];
  v26 = [(UITableViewCell *)self->_cell textLabel];
  [v26 setTextColor:v25];

  v27 = EventKitUIBundle();
  v28 = [v27 localizedStringForKey:@"Show As" value:&stru_1F0CC2140 table:0];
  v29 = [(UITableViewCell *)self->_cell textLabel];
  [v29 setText:v28];

  [(UITableViewCell *)self->_cell setAccessoryType:0];
  if ([(EKEventDetailItem *)self shouldIndent]) {
    [(UITableViewCell *)self->_cell setIndentationLevel:2];
  }

  objc_destroyWeak(&location);
  cell = self->_cell;
LABEL_19:

  return cell;
}

void __55__EKEventAvailabilityDetailItem_cellForSubitemAtIndex___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[11];
    objc_super v6 = WeakRetained;
    int v5 = [*(id *)(a1 + 32) intValue];
    char v3 = v6;
    if (v4 != (id)v5)
    {
      v6[11] = (id)v5;
      objc_msgSend(v6[2], "setAvailability:");
      [v6 notifySubitemDidSave:0];
      [v6 editItemViewController:0 didCompleteWithAction:3];
      char v3 = v6;
    }
  }
}

- (void).cxx_destruct
{
}

@end