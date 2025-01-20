@interface EKUIInviteesViewAvailabilitySection
- (BOOL)canEditRow:(id)a3;
- (BOOL)canSelectRow:(id)a3;
- (BOOL)checked;
- (BOOL)isForAttendeeProposedTime;
- (BOOL)sectionShouldBeShown;
- (BOOL)supportsContextMenuForIndexPath:(id)a3;
- (EKEvent)event;
- (NSString)cachedAvailabilityCellReuseIdentifier;
- (NSString)cachedCellReuseIdentifier;
- (NSString)cachedConflictCellReuseIdentifier;
- (double)estimatedHeightForRow:(id)a3;
- (id)actionsForRow:(id)a3;
- (id)cellForIndexPath:(id)a3 inTableView:(id)a4;
- (id)contextMenuDataForIndexPath:(id)a3 interaction:(id)a4;
- (id)debugTitle;
- (id)headerTitle;
- (id)tableViewCellHook;
- (id)titleForDeleteConfirmationButtonForRow:(id)a3;
- (id)viewAvailabilityTapped;
- (int64_t)editingStyleForRow:(id)a3;
- (unint64_t)numberOfRows;
- (unint64_t)reuseIdentifierVersion;
- (void)reloadAndRegisterReusableCellsWithTableView:(id)a3;
- (void)selectRow:(id)a3;
- (void)setCachedAvailabilityCellReuseIdentifier:(id)a3;
- (void)setCachedCellReuseIdentifier:(id)a3;
- (void)setCachedConflictCellReuseIdentifier:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setEvent:(id)a3;
- (void)setIsForAttendeeProposedTime:(BOOL)a3;
- (void)setReuseIdentifierVersion:(unint64_t)a3;
- (void)setTableViewCellHook:(id)a3;
- (void)setViewAvailabilityTapped:(id)a3;
@end

@implementation EKUIInviteesViewAvailabilitySection

- (id)debugTitle
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)headerTitle
{
  return 0;
}

- (BOOL)sectionShouldBeShown
{
  v3 = (void *)MEMORY[0x1E4F254B8];
  v4 = [(EKUIInviteesViewAvailabilitySection *)self event];
  uint64_t v5 = [v3 availabilityPanelVisibilityForEvent:v4];

  if ([(EKUIInviteesViewAvailabilitySection *)self isForAttendeeProposedTime])
  {
    char v6 = 1;
  }
  else
  {
    v7 = [(EKUIInviteesViewAvailabilitySection *)self event];
    char v6 = [v7 allowsAttendeesModifications];
  }
  if (v5) {
    return 0;
  }
  else {
    return v6;
  }
}

- (unint64_t)numberOfRows
{
  return 1;
}

- (id)cellForIndexPath:(id)a3 inTableView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(EKUIInviteesViewAvailabilitySection *)self cachedAvailabilityCellReuseIdentifier];
  v9 = [v6 dequeueReusableCellWithIdentifier:v8 forIndexPath:v7];

  if (EKUICatalyst())
  {
    v10 = [v6 backgroundColor];
    [v9 setBackgroundColor:v10];
  }

  return v9;
}

- (BOOL)canSelectRow:(id)a3
{
  return 1;
}

- (void)selectRow:(id)a3
{
  v3 = [(EKUIInviteesViewAvailabilitySection *)self viewAvailabilityTapped];
  v3[2]();
}

- (void)reloadAndRegisterReusableCellsWithTableView:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKUIInviteesViewAvailabilitySection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v10 = (void *)[v6 initWithFormat:@"%@-%@", v8, v9];
  [(EKUIInviteesViewAvailabilitySection *)self setCachedAvailabilityCellReuseIdentifier:v10];

  uint64_t v11 = objc_opt_class();
  v12 = [(EKUIInviteesViewAvailabilitySection *)self cachedAvailabilityCellReuseIdentifier];
  [v5 registerClass:v11 forCellReuseIdentifier:v12];

  id v13 = [NSString alloc];
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKUIInviteesViewAvailabilitySection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v17 = (void *)[v13 initWithFormat:@"%@-%@", v15, v16];
  [(EKUIInviteesViewAvailabilitySection *)self setCachedConflictCellReuseIdentifier:v17];

  uint64_t v18 = objc_opt_class();
  v19 = [(EKUIInviteesViewAvailabilitySection *)self cachedConflictCellReuseIdentifier];
  [v5 registerClass:v18 forCellReuseIdentifier:v19];

  unint64_t v20 = [(EKUIInviteesViewAvailabilitySection *)self reuseIdentifierVersion] + 1;

  [(EKUIInviteesViewAvailabilitySection *)self setReuseIdentifierVersion:v20];
}

- (BOOL)canEditRow:(id)a3
{
  return 0;
}

- (int64_t)editingStyleForRow:(id)a3
{
  return 1;
}

- (id)titleForDeleteConfirmationButtonForRow:(id)a3
{
  return @"Not Implemented";
}

- (double)estimatedHeightForRow:(id)a3
{
  return 44.0;
}

- (id)actionsForRow:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)contextMenuDataForIndexPath:(id)a3 interaction:(id)a4
{
  return 0;
}

- (BOOL)supportsContextMenuForIndexPath:(id)a3
{
  return 0;
}

- (BOOL)isForAttendeeProposedTime
{
  return self->_isForAttendeeProposedTime;
}

- (void)setIsForAttendeeProposedTime:(BOOL)a3
{
  self->_isForAttendeeProposedTime = a3;
}

- (id)viewAvailabilityTapped
{
  return self->_viewAvailabilityTapped;
}

- (void)setViewAvailabilityTapped:(id)a3
{
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (BOOL)checked
{
  return self->_checked;
}

- (void)setChecked:(BOOL)a3
{
  self->_checked = a3;
}

- (NSString)cachedCellReuseIdentifier
{
  return self->_cachedCellReuseIdentifier;
}

- (void)setCachedCellReuseIdentifier:(id)a3
{
}

- (id)tableViewCellHook
{
  return self->_tableViewCellHook;
}

- (void)setTableViewCellHook:(id)a3
{
}

- (NSString)cachedAvailabilityCellReuseIdentifier
{
  return self->_cachedAvailabilityCellReuseIdentifier;
}

- (void)setCachedAvailabilityCellReuseIdentifier:(id)a3
{
}

- (NSString)cachedConflictCellReuseIdentifier
{
  return self->_cachedConflictCellReuseIdentifier;
}

- (void)setCachedConflictCellReuseIdentifier:(id)a3
{
}

- (unint64_t)reuseIdentifierVersion
{
  return self->_reuseIdentifierVersion;
}

- (void)setReuseIdentifierVersion:(unint64_t)a3
{
  self->_reuseIdentifierVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConflictCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedAvailabilityCellReuseIdentifier, 0);
  objc_storeStrong(&self->_tableViewCellHook, 0);
  objc_storeStrong((id *)&self->_cachedCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong(&self->_viewAvailabilityTapped, 0);
}

@end