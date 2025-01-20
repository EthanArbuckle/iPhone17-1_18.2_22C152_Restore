@interface EKUIInviteesViewInvisibleInviteeStatusSection
- (BOOL)_isValidRow:(int64_t)a3;
- (BOOL)canEditRow:(id)a3;
- (BOOL)canSelectRow:(id)a3;
- (BOOL)editable;
- (BOOL)sectionShouldBeShown;
- (BOOL)supportsContextMenuForIndexPath:(id)a3;
- (EKEvent)event;
- (NSMutableArray)participants;
- (NSString)cachedCellReuseIdentifier;
- (double)estimatedHeightForRow:(id)a3;
- (id)actionsForRow:(id)a3;
- (id)cellForIndexPath:(id)a3 inTableView:(id)a4;
- (id)contextMenuDataForIndexPath:(id)a3 interaction:(id)a4;
- (id)debugTitle;
- (id)headerTitle;
- (id)participantRemoved;
- (id)participantSetRole;
- (id)participantTapped;
- (id)tableViewCellHook;
- (id)titleForDeleteConfirmationButtonForRow:(id)a3;
- (int64_t)editingStyleForRow:(id)a3;
- (unint64_t)numberOfRows;
- (unint64_t)reuseIdentifierVersion;
- (void)commitEditingStyle:(int64_t)a3 forRow:(id)a4;
- (void)reloadAndRegisterReusableCellsWithTableView:(id)a3;
- (void)selectRow:(id)a3;
- (void)setCachedCellReuseIdentifier:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setEvent:(id)a3;
- (void)setParticipantRemoved:(id)a3;
- (void)setParticipantSetRole:(id)a3;
- (void)setParticipantTapped:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setReuseIdentifierVersion:(unint64_t)a3;
- (void)setTableViewCellHook:(id)a3;
- (void)updateWithEvent:(id)a3 editable:(BOOL)a4 fromDetail:(BOOL)a5;
@end

@implementation EKUIInviteesViewInvisibleInviteeStatusSection

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
  return [(EKUIInviteesViewInvisibleInviteeStatusSection *)self numberOfRows] != 0;
}

- (unint64_t)numberOfRows
{
  v3 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self participants];

  if (!v3) {
    return 0;
  }
  v4 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self participants];
  unint64_t v5 = [v4 count];

  return v5;
}

- (id)cellForIndexPath:(id)a3 inTableView:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 row];
  v9 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self participants];
  uint64_t v10 = [v9 count];
  if ([(EKUIInviteesViewInvisibleInviteeStatusSection *)self _isValidRow:v8])
  {
    v11 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self cachedCellReuseIdentifier];
    v12 = [v7 dequeueReusableCellWithIdentifier:v11 forIndexPath:v6];

    [(EKUIInviteesViewInviteesCell *)v12 setHideStatus:1];
    v13 = [v9 objectAtIndex:v8];
    [(EKUIInviteesViewInviteesCell *)v12 updateWithParticipantForSorting:v13];
  }
  else
  {
    v14 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v15 = NSNumber;
      v16 = v14;
      v17 = [v15 numberWithInteger:v8];
      v18 = [NSNumber numberWithUnsignedInteger:v10];
      int v20 = 138412546;
      v21 = v17;
      __int16 v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_1B3F4C000, v16, OS_LOG_TYPE_ERROR, "A cell was requested for a nonexistent row.  Giving back a fresh cell.  Row: [%@].  Number of participants: [%@]", (uint8_t *)&v20, 0x16u);
    }
    v12 = objc_alloc_init(EKUIInviteesViewInviteesCell);
    [(EKUIInviteesViewInviteesCell *)v12 setHideStatus:1];
  }

  return v12;
}

- (void)reloadAndRegisterReusableCellsWithTableView:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = [NSString alloc];
  id v7 = NSStringFromClass(v5);
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKUIInviteesViewInvisibleInviteeStatusSection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v9 = (void *)[v6 initWithFormat:@"%@-%@", v7, v8];
  [(EKUIInviteesViewInvisibleInviteeStatusSection *)self setCachedCellReuseIdentifier:v9];

  uint64_t v10 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self cachedCellReuseIdentifier];
  [v4 registerClass:v5 forCellReuseIdentifier:v10];

  unint64_t v11 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self reuseIdentifierVersion] + 1;

  [(EKUIInviteesViewInvisibleInviteeStatusSection *)self setReuseIdentifierVersion:v11];
}

- (BOOL)canSelectRow:(id)a3
{
  return 1;
}

- (void)selectRow:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 row];
  if ([(EKUIInviteesViewInvisibleInviteeStatusSection *)self _isValidRow:v5])
  {
    id v6 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self participants];
    id v7 = [v6 objectAtIndex:v5];

    uint64_t v8 = [v7 participant];
    if (v8)
    {
      v9 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self participantTapped];

      if (v9)
      {
        uint64_t v10 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self participantTapped];
        ((void (**)(void, void *))v10)[2](v10, v8);

LABEL_12:
        goto LABEL_13;
      }
      v12 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      int v14 = 138412290;
      id v15 = v4;
      v13 = "No 'participant tapped' callback defined.  Will not select row.  Index path: [%@]";
    }
    else
    {
      v12 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      int v14 = 138412290;
      id v15 = v4;
      v13 = "Cannot find participant.  Will not select row.  Index path: [%@]";
    }
    _os_log_impl(&dword_1B3F4C000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v14, 0xCu);
    goto LABEL_12;
  }
  unint64_t v11 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_ERROR, "Cannot find row to select.  Will not select row.  Index path: [%@]", (uint8_t *)&v14, 0xCu);
  }
LABEL_13:
}

- (BOOL)canEditRow:(id)a3
{
  id v4 = a3;
  if ([(EKUIInviteesViewInvisibleInviteeStatusSection *)self editable]) {
    BOOL v5 = -[EKUIInviteesViewInvisibleInviteeStatusSection _isValidRow:](self, "_isValidRow:", [v4 row]);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (int64_t)editingStyleForRow:(id)a3
{
  return 1;
}

- (id)titleForDeleteConfirmationButtonForRow:(id)a3
{
  v3 = EventKitUIBundle();
  id v4 = [v3 localizedStringForKey:@"Remove invitee - invisible invitee status section" value:@"Remove" table:0];

  return v4;
}

- (void)commitEditingStyle:(int64_t)a3 forRow:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 row];
  if (a3 == 1)
  {
    uint64_t v8 = v7;
    if ([(EKUIInviteesViewInvisibleInviteeStatusSection *)self _isValidRow:v7])
    {
      v9 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self participantRemoved];

      if (v9)
      {
        uint64_t v10 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self participants];
        unint64_t v11 = [v10 objectAtIndex:v8];

        v12 = [v11 participant];
        v13 = kEKUILogInviteesHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v28 = v12;
          __int16 v29 = 2112;
          id v30 = v6;
          _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_DEBUG, "Invoking participant removed callback with participant [%@] and index path [%@]", buf, 0x16u);
        }
        int v14 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self participantRemoved];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __75__EKUIInviteesViewInvisibleInviteeStatusSection_commitEditingStyle_forRow___block_invoke;
        v22[3] = &unk_1E60877C0;
        id v23 = v12;
        id v24 = v6;
        v25 = self;
        uint64_t v26 = v8;
        id v15 = (void (*)(void *, id, id, void *))v14[2];
        id v16 = v12;
        v15(v14, v16, v24, v22);
      }
    }
    else
    {
      v21 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v6;
        _os_log_impl(&dword_1B3F4C000, v21, OS_LOG_TYPE_ERROR, "Received commit for nonexistent row: [%@]", buf, 0xCu);
      }
    }
  }
  else
  {
    v17 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v18 = NSNumber;
      v19 = v17;
      int v20 = [v18 numberWithInteger:a3];
      *(_DWORD *)buf = 138412290;
      id v28 = v20;
      _os_log_impl(&dword_1B3F4C000, v19, OS_LOG_TYPE_ERROR, "Received commit for unrecognized editing style: [%@]", buf, 0xCu);
    }
  }
}

void __75__EKUIInviteesViewInvisibleInviteeStatusSection_commitEditingStyle_forRow___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B3F4C000, v2, OS_LOG_TYPE_DEBUG, "Removing participant [%@] at index path [%@] from EKUIInviteesViewInvisibleInviteeStatusSection", (uint8_t *)&v6, 0x16u);
  }
  BOOL v5 = [*(id *)(a1 + 48) participants];
  [v5 removeObjectAtIndex:*(void *)(a1 + 56)];
}

- (double)estimatedHeightForRow:(id)a3
{
  return 44.0;
}

- (id)actionsForRow:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[EKUIInviteesViewSectionCommon deleteRowAction:self forRow:v4];
  int v6 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self participants];
  uint64_t v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v4, "row"));

  __int16 v8 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self participantSetRole];
  uint64_t v9 = (void *)MEMORY[0x1E4F28D60];
  uint64_t v10 = [v4 section];

  unint64_t v11 = [v9 indexSetWithIndex:v10];
  v12 = +[EKUIInviteesViewSectionCommon setRoleRowActionWithParticipant:v7 withSetRoleBlock:v8 forSections:v11];

  v15[0] = v5;
  v15[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

  return v13;
}

- (BOOL)supportsContextMenuForIndexPath:(id)a3
{
  return 1;
}

- (id)contextMenuDataForIndexPath:(id)a3 interaction:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self participants];
  uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  uint64_t v10 = [v9 participant];

  unint64_t v11 = [EKUIInviteeContextMenuData alloc];
  v12 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self participantSetRole];
  v13 = [(EKUIInviteeContextMenuData *)v11 initWithDefaultActionsForSection:self indexPath:v7 participant:v10 interaction:v6 participantSetRole:v12];

  return v13;
}

- (void)updateWithEvent:(id)a3 editable:(BOOL)a4 fromDetail:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [(EKUIInviteesViewInvisibleInviteeStatusSection *)self setEvent:v8];
  if (CanSeeAttendeeStatuses((uint64_t)v8))
  {
    uint64_t v9 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v29 = self;
      _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_DEBUG, "Can see attendee statuses.  Will not analyze attendees for section: [%@]", buf, 0xCu);
    }
    uint64_t v10 = 0;
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v12 = [v8 organizer];
    v13 = [(EKUIInviteesViewInvisibleInviteeStatusSection *)self event];
    if (([v13 isExternallyOrganizedInvitation] & 1) == 0
      && ![(EKUIInviteesViewInvisibleInviteeStatusSection *)self editable])
    {
      BOOL v5 = 0;
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v22 = v8;
    int v14 = [v8 attendees];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v19 participantType] != 2
            && ([v19 isEqualToParticipant:v12] & 1) == 0
            && (!v5 || ([v19 isNew] & 1) == 0))
          {
            int v20 = [MEMORY[0x1E4F255C0] participantForSortingWithEKParticipant:v19];
            [v11 addObject:v20];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v16);
    }

    uint64_t v10 = [v11 sortedArrayUsingComparator:&__block_literal_global_27];

    id v8 = v22;
    uint64_t v6 = v6;
  }
  [(EKUIInviteesViewInvisibleInviteeStatusSection *)self setEditable:v6];
  v21 = (void *)[v10 mutableCopy];
  [(EKUIInviteesViewInvisibleInviteeStatusSection *)self setParticipants:v21];
}

uint64_t __85__EKUIInviteesViewInvisibleInviteeStatusSection_updateWithEvent_editable_fromDetail___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)_isValidRow:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0
      && [(EKUIInviteesViewInvisibleInviteeStatusSection *)self numberOfRows] > a3;
}

- (id)participantTapped
{
  return self->_participantTapped;
}

- (void)setParticipantTapped:(id)a3
{
}

- (id)participantRemoved
{
  return self->_participantRemoved;
}

- (void)setParticipantRemoved:(id)a3
{
}

- (id)participantSetRole
{
  return self->_participantSetRole;
}

- (void)setParticipantSetRole:(id)a3
{
}

- (NSMutableArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (NSString)cachedCellReuseIdentifier
{
  return self->_cachedCellReuseIdentifier;
}

- (void)setCachedCellReuseIdentifier:(id)a3
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

- (id)tableViewCellHook
{
  return self->_tableViewCellHook;
}

- (void)setTableViewCellHook:(id)a3
{
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tableViewCellHook, 0);
  objc_storeStrong((id *)&self->_cachedCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong(&self->_participantSetRole, 0);
  objc_storeStrong(&self->_participantRemoved, 0);

  objc_storeStrong(&self->_participantTapped, 0);
}

@end