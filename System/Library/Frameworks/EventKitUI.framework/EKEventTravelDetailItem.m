@interface EKEventTravelDetailItem
- (BOOL)_canChangeTravelTime;
- (BOOL)editItemViewControllerSave:(id)a3;
- (BOOL)editItemViewControllerShouldShowDetachAlert;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (id)generatePopupMenu;
@end

@implementation EKEventTravelDetailItem

- (BOOL)_canChangeTravelTime
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
  v4 = [(EKEvent *)self->super._event structuredLocation];
  int v5 = [v4 isStructured];

  if (v5)
  {
    v6 = [[EKUITableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
    [(EKUIPopupTableViewCell *)v6 setAccessoryType:[(EKEventTravelDetailItem *)self _canChangeTravelTime]];
    [(EKEvent *)self->super._event travelTime];
    v7 = CUIKDisplayStringForTravelTimeUsingShortFormat();
    v8 = [(EKUIPopupTableViewCell *)v6 detailTextLabel];
    [v8 setText:v7];
  }
  else
  {
    v6 = [[EKUIPopupTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
    v7 = [(EKEventTravelDetailItem *)self generatePopupMenu];
    [(EKUIPopupTableViewCell *)v6 setPopupMenu:v7];
  }

  v9 = EventKitUIBundle();
  v10 = [v9 localizedStringForKey:@"Travel Time" value:&stru_1F0CC2140 table:0];
  v11 = [(EKUIPopupTableViewCell *)v6 textLabel];
  [v11 setText:v10];

  return v6;
}

- (id)generatePopupMenu
{
  v3 = objc_alloc_init(EKUITravelUtilities);
  objc_initWeak(&location, self);
  event = self->super._event;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__EKEventTravelDetailItem_generatePopupMenu__block_invoke;
  v7[3] = &unk_1E60884D8;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  int v5 = [(EKUITravelUtilities *)v3 travelTimePopupMenuForEvent:event selectionHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

void __44__EKEventTravelDetailItem_generatePopupMenu__block_invoke(uint64_t a1, double a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[2];
    v9 = v5;
    if (a2 <= 0.0)
    {
      [v6 setTravelStartLocation:0];
      [v9[2] setTravelTime:0.0];
    }
    else
    {
      v7 = [v6 travelStartLocation];
      if (v7)
      {
        id v8 = [MEMORY[0x1E4F57740] routeTypeStringForCalLocationRoutingMode:0];
        [v7 setRouting:v8];
      }
      [v9[2] setTravelStartLocation:v7];
      [v9[2] setTravelTime:a2];
    }
    [*(id *)(a1 + 32) notifySubitemDidSave:0];
    [*(id *)(a1 + 32) editItemViewController:0 didCompleteWithAction:3];
    int v5 = v9;
  }
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(EKEventTravelDetailItem *)self _canChangeTravelTime])
  {
    v9 = -[EKEventTravelTimeEditViewController initWithFrame:calendarItem:eventStore:]([EKEventTravelTimeEditViewController alloc], "initWithFrame:calendarItem:eventStore:", self->super._event, self->super._store, x, y, width, height);
    [(EKEvent *)self->super._event travelTime];
    -[EKEventTravelTimeEditViewController setSelectedTravelTime:](v9, "setSelectedTravelTime:");
    v10 = [(EKEvent *)self->super._event structuredLocation];
    int v11 = [v10 isStructured];

    if (v11)
    {
      [(EKEventTravelTimeEditViewController *)v9 setSelectedRoutingMode:[(EKEvent *)self->super._event travelRoutingMode]];
      v12 = [(EKEvent *)self->super._event travelStartLocation];
      [(EKEventTravelTimeEditViewController *)v9 setOriginStructuredLocation:v12];

      v13 = [(EKEvent *)self->super._event structuredLocation];
      [(EKEventTravelTimeEditViewController *)v9 setDestinationStructuredLocation:v13];

      v14 = [(EKEvent *)self->super._event startDate];
      [(EKEventTravelTimeEditViewController *)v9 setArrivalDate:v14];
    }
    else
    {
      [(EKEventTravelTimeEditViewController *)v9 setSelectedRoutingMode:0];
      [(EKEventTravelTimeEditViewController *)v9 setOriginStructuredLocation:0];
      [(EKEventTravelTimeEditViewController *)v9 setDestinationStructuredLocation:0];
      [(EKEventTravelTimeEditViewController *)v9 setArrivalDate:0];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  id v4 = a3;
  [v4 selectedTravelTime];
  double v6 = v5;
  uint64_t v7 = [v4 selectedRoutingMode];
  id v8 = [v4 originStructuredLocation];

  if (v6 > 0.0)
  {
    uint64_t v9 = [v8 duplicate];
    v10 = (void *)v9;
    if (v7)
    {
      if (!v9) {
        v10 = objc_opt_new();
      }
      int v11 = (void *)MEMORY[0x1E4F57740];
      uint64_t v12 = v7;
    }
    else
    {
      if (!v9)
      {
LABEL_10:
        [(EKEvent *)self->super._event setTravelStartLocation:v10];
        [(EKEvent *)self->super._event setTravelTime:v6];

        goto LABEL_11;
      }
      int v11 = (void *)MEMORY[0x1E4F57740];
      uint64_t v12 = 0;
    }
    v13 = [v11 routeTypeStringForCalLocationRoutingMode:v12];
    [v10 setRouting:v13];

    goto LABEL_10;
  }
  [(EKEvent *)self->super._event setTravelStartLocation:0];
  [(EKEvent *)self->super._event setTravelTime:0.0];
LABEL_11:
  [(EKEventDetailItem *)self notifySubitemDidSave:0];
  [(EKEventDetailItem *)self editItemViewController:0 didCompleteWithAction:3];

  return 1;
}

- (BOOL)editItemViewControllerShouldShowDetachAlert
{
  int v3 = [(EKEvent *)self->super._event hasChanges];
  if (v3)
  {
    event = self->super._event;
    LOBYTE(v3) = [(EKEvent *)event isOrWasPartOfRecurringSeries];
  }
  return v3;
}

@end