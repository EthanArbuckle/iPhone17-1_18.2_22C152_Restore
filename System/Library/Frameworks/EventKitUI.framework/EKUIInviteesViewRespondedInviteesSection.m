@interface EKUIInviteesViewRespondedInviteesSection
- (BOOL)_isValidRow:(int64_t)a3;
- (BOOL)canEditRow:(id)a3;
- (BOOL)canSelectRow:(id)a3;
- (BOOL)editable;
- (BOOL)sectionShouldBeShown;
- (BOOL)supportsContextMenuForIndexPath:(id)a3;
- (EKEvent)event;
- (EKUIInviteesViewRespondedInviteesSection)initWithResponseType:(int)a3;
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
- (int)responseType;
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
- (void)setResponseType:(int)a3;
- (void)setReuseIdentifierVersion:(unint64_t)a3;
- (void)setTableViewCellHook:(id)a3;
- (void)updateWithEvent:(id)a3 editable:(BOOL)a4;
@end

@implementation EKUIInviteesViewRespondedInviteesSection

- (EKUIInviteesViewRespondedInviteesSection)initWithResponseType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKUIInviteesViewRespondedInviteesSection;
  result = [(EKUIInviteesViewRespondedInviteesSection *)&v5 init];
  if (result) {
    result->_responseType = a3;
  }
  return result;
}

- (id)debugTitle
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)headerTitle
{
  int v2 = [(EKUIInviteesViewRespondedInviteesSection *)self responseType];
  if (v2 == 2)
  {
    v3 = EventKitUIBundle();
    v4 = v3;
    objc_super v5 = @"Header_Maybe";
    v6 = @"Maybe";
  }
  else if (v2 == 1)
  {
    v3 = EventKitUIBundle();
    v4 = v3;
    objc_super v5 = @"Header_Declined";
    v6 = @"Declined";
  }
  else if (v2)
  {
    v3 = EventKitUIBundle();
    v4 = v3;
    objc_super v5 = @"Header_Responded";
    v6 = @"Responded";
  }
  else
  {
    v3 = EventKitUIBundle();
    v4 = v3;
    objc_super v5 = @"Header_Accepted";
    v6 = @"Accepted";
  }
  v7 = [v3 localizedStringForKey:v5 value:v6 table:0];

  return v7;
}

- (BOOL)sectionShouldBeShown
{
  return [(EKUIInviteesViewRespondedInviteesSection *)self numberOfRows] != 0;
}

- (unint64_t)numberOfRows
{
  v3 = [(EKUIInviteesViewRespondedInviteesSection *)self participants];

  if (!v3) {
    return 0;
  }
  v4 = [(EKUIInviteesViewRespondedInviteesSection *)self participants];
  unint64_t v5 = [v4 count];

  return v5;
}

- (id)cellForIndexPath:(id)a3 inTableView:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 row];
  if ([(EKUIInviteesViewRespondedInviteesSection *)self _isValidRow:v8])
  {
    v9 = [(EKUIInviteesViewRespondedInviteesSection *)self cachedCellReuseIdentifier];
    v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

    [(EKUIInviteesViewInviteesCell *)v10 setHideStatus:0];
    v11 = [(EKUIInviteesViewRespondedInviteesSection *)self participants];
    v12 = [v11 objectAtIndex:v8];

    [(EKUIInviteesViewInviteesCell *)v10 updateWithParticipantForSorting:v12];
  }
  else
  {
    v13 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v14 = NSNumber;
      v15 = v13;
      v16 = [v14 numberWithInteger:v8];
      v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKUIInviteesViewRespondedInviteesSection numberOfRows](self, "numberOfRows"));
      int v19 = 138412546;
      v20 = v16;
      __int16 v21 = 2112;
      v22 = v17;
      _os_log_impl(&dword_1B3F4C000, v15, OS_LOG_TYPE_ERROR, "A cell was requested for a nonexistent row.  Giving back a fresh cell.  Row: [%@].  Number of rows: [%@]", (uint8_t *)&v19, 0x16u);
    }
    v10 = objc_alloc_init(EKUIInviteesViewInviteesCell);
  }

  return v10;
}

- (void)reloadAndRegisterReusableCellsWithTableView:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = [NSString alloc];
  id v7 = NSStringFromClass(v5);
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKUIInviteesViewRespondedInviteesSection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v9 = (void *)[v6 initWithFormat:@"%@-%@", v7, v8];
  [(EKUIInviteesViewRespondedInviteesSection *)self setCachedCellReuseIdentifier:v9];

  v10 = [(EKUIInviteesViewRespondedInviteesSection *)self cachedCellReuseIdentifier];
  [v4 registerClass:v5 forCellReuseIdentifier:v10];

  unint64_t v11 = [(EKUIInviteesViewRespondedInviteesSection *)self reuseIdentifierVersion] + 1;

  [(EKUIInviteesViewRespondedInviteesSection *)self setReuseIdentifierVersion:v11];
}

- (BOOL)canSelectRow:(id)a3
{
  return 1;
}

- (void)selectRow:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 row];
  if ([(EKUIInviteesViewRespondedInviteesSection *)self _isValidRow:v5])
  {
    id v6 = [(EKUIInviteesViewRespondedInviteesSection *)self participants];
    id v7 = [v6 objectAtIndex:v5];

    uint64_t v8 = [v7 participant];
    if (v8)
    {
      v9 = [(EKUIInviteesViewRespondedInviteesSection *)self participantTapped];

      if (v9)
      {
        v10 = [(EKUIInviteesViewRespondedInviteesSection *)self participantTapped];
        ((void (**)(void, void *))v10)[2](v10, v8);

LABEL_12:
        goto LABEL_13;
      }
      uint64_t v16 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      int v17 = 138412290;
      id v18 = v4;
      v13 = "No 'participant tapped' callback defined.  Will not select row.  Index path: [%@]";
      v14 = v16;
      uint32_t v15 = 12;
    }
    else
    {
      uint64_t v12 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      int v17 = 138412546;
      id v18 = v4;
      __int16 v19 = 2112;
      v20 = v7;
      v13 = "Cannot find participant.  Index path: [%@]  Participant for sorting: [%@]";
      v14 = v12;
      uint32_t v15 = 22;
    }
    _os_log_impl(&dword_1B3F4C000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, v15);
    goto LABEL_12;
  }
  unint64_t v11 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_ERROR, "Cannot find row to select.  Index path: [%@]", (uint8_t *)&v17, 0xCu);
  }
LABEL_13:
}

- (BOOL)canEditRow:(id)a3
{
  id v4 = a3;
  if ([(EKUIInviteesViewRespondedInviteesSection *)self editable]) {
    BOOL v5 = -[EKUIInviteesViewRespondedInviteesSection _isValidRow:](self, "_isValidRow:", [v4 row]);
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
  id v4 = [v3 localizedStringForKey:@"Remove invitee - responded invitees section" value:@"Remove" table:0];

  return v4;
}

- (void)commitEditingStyle:(int64_t)a3 forRow:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 row];
  if (a3 == 1)
  {
    uint64_t v8 = v7;
    if ([(EKUIInviteesViewRespondedInviteesSection *)self _isValidRow:v7])
    {
      v9 = [(EKUIInviteesViewRespondedInviteesSection *)self participantRemoved];

      if (v9)
      {
        v10 = [(EKUIInviteesViewRespondedInviteesSection *)self participants];
        unint64_t v11 = [v10 objectAtIndex:v8];

        uint64_t v12 = [v11 participant];
        v13 = kEKUILogInviteesHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v29 = v12;
          __int16 v30 = 2112;
          id v31 = v6;
          _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_DEBUG, "Invoking participant removed callback with participant [%@] and index path [%@]", buf, 0x16u);
        }
        v14 = [(EKUIInviteesViewRespondedInviteesSection *)self participantRemoved];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __70__EKUIInviteesViewRespondedInviteesSection_commitEditingStyle_forRow___block_invoke;
        v23[3] = &unk_1E60877C0;
        id v24 = v12;
        id v25 = v6;
        v26 = self;
        uint64_t v27 = v8;
        uint32_t v15 = (void (*)(void *, id, id, void *))v14[2];
        id v16 = v12;
        v15(v14, v16, v25, v23);

        goto LABEL_14;
      }
      uint64_t v21 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      v22 = "No 'participant removed' callback defined.  Will not remove participant.  Index path: [%@]";
    }
    else
    {
      uint64_t v21 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      v22 = "Received commit for nonexistent row: [%@]";
    }
    _os_log_impl(&dword_1B3F4C000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
    goto LABEL_14;
  }
  int v17 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    id v18 = NSNumber;
    __int16 v19 = v17;
    v20 = [v18 numberWithInteger:a3];
    *(_DWORD *)buf = 138412290;
    id v29 = v20;
    _os_log_impl(&dword_1B3F4C000, v19, OS_LOG_TYPE_ERROR, "Received commit for unrecognized editing style: [%@]", buf, 0xCu);
  }
LABEL_14:
}

void __70__EKUIInviteesViewRespondedInviteesSection_commitEditingStyle_forRow___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B3F4C000, v2, OS_LOG_TYPE_DEBUG, "Removing participant [%@] at index path [%@] from EKUIInviteesViewRespondedInviteesSection", (uint8_t *)&v6, 0x16u);
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
  int v6 = [(EKUIInviteesViewRespondedInviteesSection *)self participants];
  uint64_t v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v4, "row"));

  __int16 v8 = [(EKUIInviteesViewRespondedInviteesSection *)self participantSetRole];
  uint64_t v9 = (void *)MEMORY[0x1E4F28D60];
  uint64_t v10 = [v4 section];

  unint64_t v11 = [v9 indexSetWithIndex:v10];
  uint64_t v12 = +[EKUIInviteesViewSectionCommon setRoleRowActionWithParticipant:v7 withSetRoleBlock:v8 forSections:v11];

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
  __int16 v8 = [(EKUIInviteesViewRespondedInviteesSection *)self participants];
  uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  uint64_t v10 = [v9 participant];

  unint64_t v11 = [EKUIInviteeContextMenuData alloc];
  uint64_t v12 = [(EKUIInviteesViewRespondedInviteesSection *)self participantSetRole];
  v13 = [(EKUIInviteeContextMenuData *)v11 initWithDefaultActionsForSection:self indexPath:v7 participant:v10 interaction:v6 participantSetRole:v12];

  return v13;
}

- (void)updateWithEvent:(id)a3 editable:(BOOL)a4
{
  uint64_t v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(EKUIInviteesViewRespondedInviteesSection *)self setEvent:v6];
  if ((CanSeeAttendeeStatuses((uint64_t)v6) & 1) == 0)
  {
    unint64_t v11 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v38 = self;
      _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_DEBUG, "Cannot see attendee statuses.  Will not analyze attendees for section: [%@]", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if (([v6 isStartDateDirty] & 1) != 0 || objc_msgSend(v6, "isEndDateDirty"))
  {
    id v7 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      __int16 v8 = v7;
      [v6 isStartDateDirty];
      uint64_t v9 = CalBooleanAsString();
      [v6 isEndDateDirty];
      uint64_t v10 = CalBooleanAsString();
      *(_DWORD *)buf = 138412802;
      v38 = self;
      __int16 v39 = 2112;
      v40 = v9;
      __int16 v41 = 2112;
      v42 = v10;
      _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_DEBUG, "This event has a dirty date, thus invitee responses are invalid for this time.  Will not show section: [%@].  Start date is dirty: [%@].  End date is dirty: [%@]", buf, 0x20u);
    }
LABEL_8:
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  unsigned int v29 = v4;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14 = [v6 organizer];
  uint32_t v15 = (void *)MEMORY[0x1E4F25588];
  id v16 = [v6 attendees];
  int v17 = [v14 eventStore];
  id v18 = [v15 objectsIDsExistingInStoreFromObjects:v16 eventStore:v17];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v30 = v6;
  __int16 v19 = [v6 attendees];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v24 participantType] != 2 && (objc_msgSend(v24, "isEqualToParticipant:", v14) & 1) == 0)
        {
          if (EKUIAttendeeUtils_AttendeeHasResponded(v24))
          {
            id v25 = [v24 CADObjectID];
            int v26 = [v18 containsObject:v25];

            if (v26)
            {
              uint64_t v27 = [v24 participantStatus];
              if (([(EKUIInviteesViewRespondedInviteesSection *)self responseType] || v27 == 2)
                && ([(EKUIInviteesViewRespondedInviteesSection *)self responseType] != 1 || v27 == 3)
                && ([(EKUIInviteesViewRespondedInviteesSection *)self responseType] != 2
                 || (v27 & 0xFFFFFFFFFFFFFFFELL) != 2))
              {
                v28 = [MEMORY[0x1E4F255C0] participantForSortingWithEKParticipant:v24];
                [v31 addObject:v28];
              }
            }
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v21);
  }

  uint64_t v12 = [v31 sortedArrayUsingComparator:&__block_literal_global_3];

  id v6 = v30;
  uint64_t v4 = v29;
LABEL_9:
  [(EKUIInviteesViewRespondedInviteesSection *)self setEditable:v4];
  v13 = (void *)[v12 mutableCopy];
  [(EKUIInviteesViewRespondedInviteesSection *)self setParticipants:v13];
}

uint64_t __69__EKUIInviteesViewRespondedInviteesSection_updateWithEvent_editable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)_isValidRow:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0
      && [(EKUIInviteesViewRespondedInviteesSection *)self numberOfRows] > a3;
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

- (int)responseType
{
  return self->_responseType;
}

- (void)setResponseType:(int)a3
{
  self->_responseType = a3;
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