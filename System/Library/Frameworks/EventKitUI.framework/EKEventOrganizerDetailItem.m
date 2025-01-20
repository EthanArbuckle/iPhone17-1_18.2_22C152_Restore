@interface EKEventOrganizerDetailItem
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (BOOL)hideDisclosureIndicator;
- (EKIdentityProtocol)organizerOverride;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (void)_updateDisclosureIndicator;
- (void)reset;
- (void)setHideDisclosureIndicator:(BOOL)a3;
- (void)setOrganizerOverride:(id)a3;
@end

@implementation EKEventOrganizerDetailItem

- (void)reset
{
  cell = self->_cell;
  self->_cell = 0;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  uint64_t v5 = 16;
  v6 = [(EKEvent *)self->super._event organizer];
  if (v6)
  {
    uint64_t v5 = [(EKEvent *)self->super._event organizer];
    if (![(id)v5 isCurrentUser])
    {
      BOOL v7 = 1;
LABEL_5:

      goto LABEL_6;
    }
  }
  v8 = [(EKEventOrganizerDetailItem *)self organizerOverride];
  BOOL v7 = v8 != 0;

  if (v6) {
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    uint64_t v5 = [EKEventDetailOrganizerCell alloc];
    event = self->super._event;
    BOOL v7 = [(EKEventOrganizerDetailItem *)self organizerOverride];
    v8 = [(EKEventDetailOrganizerCell *)v5 initWithEvent:event editable:0 organizerOverride:v7];
    v9 = self->_cell;
    self->_cell = v8;

    [(EKEventOrganizerDetailItem *)self _updateDisclosureIndicator];
    cell = self->_cell;
  }

  return cell;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  if (EKUIUnscaledCatalyst()) {
    return 65.0;
  }
  v10.receiver = self;
  v10.super_class = (Class)EKEventOrganizerDetailItem;
  [(EKEventDetailItem *)&v10 defaultCellHeightForSubitemAtIndex:a3 forWidth:v5 forceUpdate:a4];
  return result;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  BOOL v5 = [(EKEventOrganizerDetailItem *)self organizerOverride];
  if (v5
    || ([(EKEvent *)self->super._event organizer], (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = [[EKIdentityViewController alloc] initWithIdentity:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setHideDisclosureIndicator:(BOOL)a3
{
  if (self->_hideDisclosureIndicator != a3)
  {
    self->_hideDisclosureIndicator = a3;
    [(EKEventOrganizerDetailItem *)self _updateDisclosureIndicator];
  }
}

- (void)_updateDisclosureIndicator
{
}

- (EKIdentityProtocol)organizerOverride
{
  return (EKIdentityProtocol *)objc_getProperty(self, a2, 96, 1);
}

- (void)setOrganizerOverride:(id)a3
{
}

- (BOOL)hideDisclosureIndicator
{
  return self->_hideDisclosureIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizerOverride, 0);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end