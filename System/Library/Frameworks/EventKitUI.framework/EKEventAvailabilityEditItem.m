@interface EKEventAvailabilityEditItem
- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3;
- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4;
- (BOOL)saveAndDismissWithForce:(BOOL)a3;
- (id)_choices;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (void)refreshFromCalendarItemAndStore;
@end

@implementation EKEventAvailabilityEditItem

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  id v3 = a3;
  if ([v3 supportedEventAvailabilities]) {
    char v4 = [v3 isAffectingAvailability];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)refreshFromCalendarItemAndStore
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventAvailabilityEditItem;
  [(EKCalendarItemEditItem *)&v4 refreshFromCalendarItemAndStore];
  id v3 = [(EKEventEditItem *)self event];
  self->_availability = [v3 availability];
}

- (id)_choices
{
  v2 = [(EKEventEditItem *)self event];
  id v3 = [v2 calendar];
  char v4 = [v3 supportedEventAvailabilities];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  if (v4)
  {
    v8 = [NSNumber numberWithInt:0];
    [v5 addObject:v8];

    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  v9 = [NSNumber numberWithInt:1];
  [v5 addObject:v9];

  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v10 = [NSNumber numberWithInt:2];
  [v5 addObject:v10];

  if ((v4 & 8) != 0)
  {
LABEL_5:
    v6 = [NSNumber numberWithInt:3];
    [v5 addObject:v6];
  }
LABEL_6:

  return v5;
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  int64_t availability = self->_availability;
  v5 = [(EKEventEditItem *)self event];
  uint64_t v6 = [v5 availability];

  if (availability != v6)
  {
    int64_t v7 = self->_availability;
    v8 = [(EKEventEditItem *)self event];
    [v8 setAvailability:v7];
  }
  return availability != v6;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  EKUIUnscaledCatalyst();
  id v26 = (id)[objc_alloc((Class)objc_opt_class()) initWithStyle:1 reuseIdentifier:0];
  char v4 = EventKitUIBundle();
  v5 = [v4 localizedStringForKey:@"Show As" value:&stru_1F0CC2140 table:0];
  uint64_t v6 = [v26 textLabel];
  [v6 setText:v5];

  objc_initWeak(&location, self);
  v27 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  int64_t v7 = [(EKEventAvailabilityEditItem *)self _choices];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E4FB13F0];
        objc_msgSend(v11, "intValue", v26);
        v13 = CUIKDisplayStringForAvailability();
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __53__EKEventAvailabilityEditItem_cellForSubitemAtIndex___block_invoke;
        v28[3] = &unk_1E6088218;
        objc_copyWeak(&v29, &location);
        v28[4] = v11;
        v14 = [v12 actionWithTitle:v13 image:0 identifier:0 handler:v28];

        int64_t availability = self->_availability;
        if (availability == (int)[v11 intValue]) {
          [v14 setState:1];
        }
        [v27 addObject:v14];

        objc_destroyWeak(&v29);
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v8);
  }

  if (EKUIUnscaledCatalyst())
  {
    [v26 setAccessoryType:0];
    v16 = [MEMORY[0x1E4FB14D0] buttonWithType:124];
    v17 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F0CC2140 image:0 identifier:0 options:1 children:v27];
    [v16 setMenu:v17];

    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [v26 contentView];
    [v18 addSubview:v16];

    v19 = (void *)MEMORY[0x1E4F28DC8];
    v20 = [v26 textLabel];
    v21 = [v19 constraintWithItem:v16 attribute:11 relatedBy:0 toItem:v20 attribute:11 multiplier:1.0 constant:0.0];
    [v21 setActive:1];

    v22 = (void *)MEMORY[0x1E4F28DC8];
    v23 = [v26 contentView];
    v24 = [v22 constraintWithItem:v16 attribute:6 relatedBy:0 toItem:v23 attribute:6 multiplier:1.0 constant:-20.0];
    [v24 setActive:1];
  }
  else
  {
    if (![v27 count]) {
      goto LABEL_15;
    }
    v16 = [MEMORY[0x1E4FB1970] menuWithChildren:v27];
    [v26 setPopupMenu:v16];
  }

LABEL_15:
  objc_destroyWeak(&location);

  return v26;
}

void __53__EKEventAvailabilityEditItem_cellForSubitemAtIndex___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = (int)[*(id *)(a1 + 32) intValue];
    WeakRetained[6] = v2;
    id v3 = [WeakRetained event];
    [v3 setAvailability:v2];

    [WeakRetained notifySubitemDidSave:0];
  }
}

- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4
{
  return 0;
}

- (void).cxx_destruct
{
}

@end