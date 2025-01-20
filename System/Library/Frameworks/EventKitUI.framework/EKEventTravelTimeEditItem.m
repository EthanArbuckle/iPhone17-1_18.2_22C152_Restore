@interface EKEventTravelTimeEditItem
- (BOOL)editItemViewControllerSave:(id)a3;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (id)generatePopupMenu;
- (unint64_t)numberOfSubitems;
- (unint64_t)onSaveEditItemsToRefresh;
- (void)_updateHiddenState;
@end

@implementation EKEventTravelTimeEditItem

- (unint64_t)onSaveEditItemsToRefresh
{
  return 1;
}

- (void)_updateHiddenState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  char v3 = [WeakRetained allowsTravelTimeModifications];
  self->_isHidden = v3 ^ 1;
  if ((v3 & 1) == 0)
  {
    v4 = [(EKEventEditItem *)self event];
    v5 = [v4 travelStartLocation];
    if (v5)
    {
    }
    else
    {
      v6 = [(EKEventEditItem *)self event];
      [v6 travelTime];
      double v8 = v7;

      if (v8 <= 0.0) {
        goto LABEL_6;
      }
    }
    v9 = [(EKEventEditItem *)self event];
    [v9 setTravelStartLocation:0];

    v10 = [(EKEventEditItem *)self event];
    [v10 setTravelTime:0.0];

    [(EKCalendarItemEditItem *)self notifySubitemDidSave:0];
  }
LABEL_6:
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = [EKEventTravelTimeEditViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  id v11 = objc_loadWeakRetained((id *)&self->super.super._store);
  v12 = -[EKEventTravelTimeEditViewController initWithFrame:calendarItem:eventStore:](v9, "initWithFrame:calendarItem:eventStore:", WeakRetained, v11, x, y, width, height);

  v13 = [(EKEventEditItem *)self event];
  [v13 travelTime];
  -[EKEventTravelTimeEditViewController setSelectedTravelTime:](v12, "setSelectedTravelTime:");

  v14 = [(EKEventEditItem *)self event];
  v15 = [v14 structuredLocation];
  int v16 = [v15 isStructured];

  if (v16)
  {
    v17 = [(EKEventEditItem *)self event];
    -[EKEventTravelTimeEditViewController setSelectedRoutingMode:](v12, "setSelectedRoutingMode:", [v17 travelRoutingMode]);

    v18 = [(EKEventEditItem *)self event];
    v19 = [v18 travelStartLocation];
    [(EKEventTravelTimeEditViewController *)v12 setOriginStructuredLocation:v19];

    v20 = [(EKEventEditItem *)self event];
    v21 = [v20 structuredLocation];
    [(EKEventTravelTimeEditViewController *)v12 setDestinationStructuredLocation:v21];

    v22 = [(EKEventEditItem *)self event];
    v23 = [v22 startDate];
    [(EKEventTravelTimeEditViewController *)v12 setArrivalDate:v23];
  }
  else
  {
    [(EKEventTravelTimeEditViewController *)v12 setSelectedRoutingMode:0];
    [(EKEventTravelTimeEditViewController *)v12 setOriginStructuredLocation:0];
    [(EKEventTravelTimeEditViewController *)v12 setDestinationStructuredLocation:0];
    [(EKEventTravelTimeEditViewController *)v12 setArrivalDate:0];
  }

  return v12;
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  id v4 = a3;
  [v4 selectedTravelTime];
  double v6 = v5;
  uint64_t v7 = [v4 selectedRoutingMode];
  double v8 = [v4 originStructuredLocation];

  if (v6 > 0.0)
  {
    uint64_t v9 = [v8 copy];
    v10 = (void *)v9;
    if (v7)
    {
      if (!v9) {
        v10 = objc_opt_new();
      }
      id v11 = (void *)MEMORY[0x1E4F57740];
      uint64_t v12 = v7;
    }
    else
    {
      if (!v9)
      {
LABEL_10:
        v15 = [(EKEventEditItem *)self event];
        [v15 setTravelStartLocation:v10];

        int v16 = [(EKEventEditItem *)self event];
        [v16 setTravelTime:v6];

        goto LABEL_11;
      }
      id v11 = (void *)MEMORY[0x1E4F57740];
      uint64_t v12 = 0;
    }
    v14 = [v11 routeTypeStringForCalLocationRoutingMode:v12];
    [v10 setRouting:v14];

    goto LABEL_10;
  }
  v13 = [(EKEventEditItem *)self event];
  [v13 setTravelStartLocation:0];

  v10 = [(EKEventEditItem *)self event];
  [v10 setTravelTime:0.0];
LABEL_11:

  [(EKCalendarItemEditItem *)self notifySubitemDidSave:0];
  return 1;
}

- (unint64_t)numberOfSubitems
{
  return !self->_isHidden;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  id v4 = [(EKEventEditItem *)self event];
  double v5 = [v4 structuredLocation];
  int v6 = [v5 isStructured];

  if (v6)
  {
    uint64_t v7 = [[EKUITableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
    [(EKUIPopupTableViewCell *)v7 setAccessoryType:1];
    double v8 = [(EKEventEditItem *)self event];
    [v8 travelTime];
    uint64_t v9 = CUIKDisplayStringForTravelTimeUsingShortFormat();
    v10 = [(EKUIPopupTableViewCell *)v7 detailTextLabel];
    [v10 setText:v9];
  }
  else
  {
    uint64_t v7 = [[EKUIPopupTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
    double v8 = [(EKEventTravelTimeEditItem *)self generatePopupMenu];
    [(EKUIPopupTableViewCell *)v7 setPopupMenu:v8];
  }

  id v11 = EventKitUIBundle();
  uint64_t v12 = [v11 localizedStringForKey:@"Travel Time" value:&stru_1F0CC2140 table:0];
  v13 = [(EKUIPopupTableViewCell *)v7 textLabel];
  [v13 setText:v12];

  return v7;
}

- (id)generatePopupMenu
{
  char v3 = objc_alloc_init(EKUITravelUtilities);
  objc_initWeak(&location, self);
  id v4 = [(EKEventEditItem *)self event];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__EKEventTravelTimeEditItem_generatePopupMenu__block_invoke;
  v7[3] = &unk_1E608AA70;
  objc_copyWeak(&v8, &location);
  double v5 = [(EKUITravelUtilities *)v3 travelTimePopupMenuForEvent:v4 selectionHandler:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);

  return v5;
}

void __46__EKEventTravelTimeEditItem_generatePopupMenu__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    id v4 = [WeakRetained event];
    double v5 = v4;
    if (a2 <= 0.0)
    {
      [v4 setTravelStartLocation:0];

      int v6 = [v10 event];
      [v6 setTravelTime:0.0];
    }
    else
    {
      int v6 = [v4 travelStartLocation];

      if (v6)
      {
        uint64_t v7 = [MEMORY[0x1E4F57740] routeTypeStringForCalLocationRoutingMode:0];
        [v6 setRouting:v7];
      }
      id v8 = [v10 event];
      [v8 setTravelStartLocation:v6];

      uint64_t v9 = [v10 event];
      [v9 setTravelTime:a2];
    }
    [v10 notifySubitemDidSave:0];
    id WeakRetained = v10;
  }
}

@end