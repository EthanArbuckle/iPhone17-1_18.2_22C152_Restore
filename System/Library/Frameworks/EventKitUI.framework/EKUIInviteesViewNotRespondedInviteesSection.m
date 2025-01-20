@interface EKUIInviteesViewNotRespondedInviteesSection
+ (id)_participantAddressForParticipant:(id)a3;
- (BOOL)_isAddInviteesRow:(int64_t)a3;
- (BOOL)_isValidRow:(int64_t)a3;
- (BOOL)_setOfAddressesToInflightOperationsContainsAddress:(id)a3;
- (BOOL)canEditRow:(id)a3;
- (BOOL)canSeeAttendeeStatuses;
- (BOOL)canSelectRow:(id)a3;
- (BOOL)editable;
- (BOOL)sectionShouldBeShown;
- (BOOL)supportsContextMenuForIndexPath:(id)a3;
- (EKEvent)event;
- (EKUIInviteesViewNotRespondedInviteesSection)init;
- (NSMutableArray)participants;
- (NSMutableDictionary)participantAddressesToAvailabilityType;
- (NSMutableDictionary)participantAddressesToParticipantIndex;
- (NSMutableSet)participantAddressesForInFlightAvailabilityOperations;
- (NSOperationQueue)availabilityRequestsQueue;
- (NSString)cachedAddInviteeCellReuseIdentifier;
- (NSString)cachedInviteeCellReuseIdentifier;
- (double)estimatedHeightForRow:(id)a3;
- (id)_lookUpAvailabilityTypeForParticipantAddress:(id)a3;
- (id)_lookUpParticipantIndexForParticipantAddress:(id)a3;
- (id)actionsForRow:(id)a3;
- (id)addInviteesTapped;
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
- (void)_addAddressToSetOfAddressesToInflightOperations:(id)a3;
- (void)_removeAddressFromDictionaryOfAddressesToAvailabilityType:(id)a3;
- (void)_removeAddressFromDictionaryOfAddressesToParticipantIndex:(id)a3;
- (void)_removeAddressFromSetOfAddressesToInflightOperations:(id)a3;
- (void)_removeParticipantAtIndexPath:(id)a3;
- (void)_setAvailabilityType:(id)a3 forParticipantAddress:(id)a4;
- (void)_setParticipantIndex:(id)a3 forParticipantAddress:(id)a4;
- (void)_updateCell:(id)a3 forParticipantAtIndex:(int64_t)a4 animated:(BOOL)a5;
- (void)_updateCellForParticipantWithAddress:(id)a3;
- (void)cancelOutstandingOperations;
- (void)commitEditingStyle:(int64_t)a3 forRow:(id)a4;
- (void)dealloc;
- (void)reloadAndRegisterReusableCellsWithTableView:(id)a3;
- (void)selectRow:(id)a3;
- (void)setAddInviteesTapped:(id)a3;
- (void)setAvailabilityRequestsQueue:(id)a3;
- (void)setCachedAddInviteeCellReuseIdentifier:(id)a3;
- (void)setCachedInviteeCellReuseIdentifier:(id)a3;
- (void)setCanSeeAttendeeStatuses:(BOOL)a3;
- (void)setEditable:(BOOL)a3;
- (void)setEvent:(id)a3;
- (void)setParticipantAddressesForInFlightAvailabilityOperations:(id)a3;
- (void)setParticipantAddressesToAvailabilityType:(id)a3;
- (void)setParticipantAddressesToParticipantIndex:(id)a3;
- (void)setParticipantRemoved:(id)a3;
- (void)setParticipantSetRole:(id)a3;
- (void)setParticipantTapped:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setReuseIdentifierVersion:(unint64_t)a3;
- (void)setTableViewCellHook:(id)a3;
- (void)updateWithEvent:(id)a3 editable:(BOOL)a4 fromDetail:(BOOL)a5;
@end

@implementation EKUIInviteesViewNotRespondedInviteesSection

- (EKUIInviteesViewNotRespondedInviteesSection)init
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)EKUIInviteesViewNotRespondedInviteesSection;
  v2 = [(EKUIInviteesViewNotRespondedInviteesSection *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(EKUIInviteesViewNotRespondedInviteesSection *)v2 setParticipantAddressesToAvailabilityType:v3];

    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(EKUIInviteesViewNotRespondedInviteesSection *)v2 setParticipantAddressesToParticipantIndex:v4];

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(EKUIInviteesViewNotRespondedInviteesSection *)v2 setParticipantAddressesForInFlightAvailabilityOperations:v5];

    id v6 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = (void *)[[NSString alloc] initWithFormat:@"com.apple.mobilecal.%@.availability", v8];
    [v6 setName:v9];

    [(EKUIInviteesViewNotRespondedInviteesSection *)v2 setAvailabilityRequestsQueue:v6];
    v10 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      v11 = v10;
      v12 = [v6 name];
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_DEBUG, "Created availability queue named [%@]", buf, 0xCu);
    }
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [(EKUIInviteesViewNotRespondedInviteesSection *)self availabilityRequestsQueue];
  [v3 cancelAllOperations];

  v4.receiver = self;
  v4.super_class = (Class)EKUIInviteesViewNotRespondedInviteesSection;
  [(EKUIInviteesViewNotRespondedInviteesSection *)&v4 dealloc];
}

- (id)debugTitle
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)headerTitle
{
  id v3 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participants];

  if (v3
    && ([(EKUIInviteesViewNotRespondedInviteesSection *)self participants],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5))
  {
    id v6 = EventKitUIBundle();
    v7 = [v6 localizedStringForKey:@"No Response" value:&stru_1F0CC2140 table:0];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)sectionShouldBeShown
{
  return [(EKUIInviteesViewNotRespondedInviteesSection *)self numberOfRows] != 0;
}

- (unint64_t)numberOfRows
{
  id v3 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participants];

  if (!v3) {
    return 0;
  }
  objc_super v4 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participants];
  unint64_t v5 = [v4 count];

  return v5;
}

- (id)cellForIndexPath:(id)a3 inTableView:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 row];
  if ([(EKUIInviteesViewNotRespondedInviteesSection *)self _isValidRow:v8])
  {
    if ([(EKUIInviteesViewNotRespondedInviteesSection *)self _isAddInviteesRow:v8])
    {
      v9 = [(EKUIInviteesViewNotRespondedInviteesSection *)self cachedAddInviteeCellReuseIdentifier];
      v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];
    }
    else
    {
      v16 = [(EKUIInviteesViewNotRespondedInviteesSection *)self cachedInviteeCellReuseIdentifier];
      v10 = [v7 dequeueReusableCellWithIdentifier:v16 forIndexPath:v6];

      -[EKUIInviteesViewNotRespondedInviteesSection _updateCell:forParticipantAtIndex:animated:](self, "_updateCell:forParticipantAtIndex:animated:", v10, [v6 row], 0);
    }
  }
  else
  {
    v11 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v12 = NSNumber;
      v13 = v11;
      objc_super v14 = [v12 numberWithInteger:v8];
      v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKUIInviteesViewNotRespondedInviteesSection numberOfRows](self, "numberOfRows"));
      int v19 = 138412546;
      v20 = v14;
      __int16 v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_ERROR, "A cell was requested for a nonexistent row.  Giving back a fresh cell.  Row: [%@].  Number of rows: [%@]", (uint8_t *)&v19, 0x16u);
    }
    v10 = objc_alloc_init(EKUIInviteesViewInviteesCell);
  }
  if (EKUICatalyst())
  {
    uint64_t v17 = [v7 backgroundColor];
    [(EKUIInviteesViewInviteesCell *)v10 setBackgroundColor:v17];
  }

  return v10;
}

- (void)reloadAndRegisterReusableCellsWithTableView:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = [NSString alloc];
  id v7 = NSStringFromClass(v5);
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKUIInviteesViewNotRespondedInviteesSection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v9 = (void *)[v6 initWithFormat:@"%@-%@", v7, v8];
  [(EKUIInviteesViewNotRespondedInviteesSection *)self setCachedInviteeCellReuseIdentifier:v9];

  v10 = [(EKUIInviteesViewNotRespondedInviteesSection *)self cachedInviteeCellReuseIdentifier];
  [v4 registerClass:v5 forCellReuseIdentifier:v10];

  v11 = (objc_class *)objc_opt_class();
  id v12 = [NSString alloc];
  v13 = NSStringFromClass(v11);
  objc_super v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKUIInviteesViewNotRespondedInviteesSection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v15 = (void *)[v12 initWithFormat:@"%@-%@", v13, v14];
  [(EKUIInviteesViewNotRespondedInviteesSection *)self setCachedAddInviteeCellReuseIdentifier:v15];

  v16 = [(EKUIInviteesViewNotRespondedInviteesSection *)self cachedAddInviteeCellReuseIdentifier];
  [v4 registerClass:v11 forCellReuseIdentifier:v16];

  unint64_t v17 = [(EKUIInviteesViewNotRespondedInviteesSection *)self reuseIdentifierVersion] + 1;

  [(EKUIInviteesViewNotRespondedInviteesSection *)self setReuseIdentifierVersion:v17];
}

- (BOOL)canSelectRow:(id)a3
{
  return 1;
}

- (void)selectRow:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 row];
  if ([(EKUIInviteesViewNotRespondedInviteesSection *)self _isValidRow:v5])
  {
    if ([(EKUIInviteesViewNotRespondedInviteesSection *)self _isAddInviteesRow:v5])
    {
      id v6 = [(EKUIInviteesViewNotRespondedInviteesSection *)self addInviteesTapped];

      if (v6)
      {
        id v7 = [(EKUIInviteesViewNotRespondedInviteesSection *)self addInviteesTapped];
        v7[2]();
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v8 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412290;
        id v20 = v4;
        v9 = "No 'add invitees tapped' callback defined.  Will not select row.  Index path: [%@]";
        goto LABEL_7;
      }
      goto LABEL_20;
    }
    v10 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participants];
    id v7 = [v10 objectAtIndex:v5];

    v11 = [v7 participant];
    if (v11)
    {
      id v12 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantTapped];

      if (v12)
      {
        v13 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantTapped];
        ((void (**)(void, void *))v13)[2](v13, v11);

LABEL_18:
        goto LABEL_19;
      }
      uint64_t v18 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      int v19 = 138412290;
      id v20 = v4;
      v15 = "No 'participant tapped' callback defined.  Will not select row.  Index path: [%@]";
      v16 = v18;
      uint32_t v17 = 12;
    }
    else
    {
      uint64_t v14 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      int v19 = 138412546;
      id v20 = v4;
      __int16 v21 = 2112;
      v22 = v7;
      v15 = "Cannot find participant.  Index path: [%@]  Participant for sorting: [%@]";
      v16 = v14;
      uint32_t v17 = 22;
    }
    _os_log_impl(&dword_1B3F4C000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v19, v17);
    goto LABEL_18;
  }
  uint64_t v8 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    int v19 = 138412290;
    id v20 = v4;
    v9 = "Cannot find row to select.  Will not select row.  Index path: [%@]";
LABEL_7:
    _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v19, 0xCu);
  }
LABEL_20:
}

- (BOOL)canEditRow:(id)a3
{
  id v4 = a3;
  if ([(EKUIInviteesViewNotRespondedInviteesSection *)self editable]
    && (uint64_t v5 = [v4 row],
        [(EKUIInviteesViewNotRespondedInviteesSection *)self _isValidRow:v5]))
  {
    BOOL v6 = ![(EKUIInviteesViewNotRespondedInviteesSection *)self _isAddInviteesRow:v5];
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (int64_t)editingStyleForRow:(id)a3
{
  return 1;
}

- (id)titleForDeleteConfirmationButtonForRow:(id)a3
{
  id v3 = EventKitUIBundle();
  id v4 = [v3 localizedStringForKey:@"Remove invitee - not responded invitees section" value:@"Remove" table:0];

  return v4;
}

- (void)commitEditingStyle:(int64_t)a3 forRow:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 row];
  if (a3 == 1)
  {
    if ([(EKUIInviteesViewNotRespondedInviteesSection *)self _isValidRow:v7])
    {
      uint64_t v8 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantRemoved];

      if (v8)
      {
        [(EKUIInviteesViewNotRespondedInviteesSection *)self _removeParticipantAtIndexPath:v6];
        goto LABEL_12;
      }
      v13 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      int v15 = 138412290;
      id v16 = v6;
      uint64_t v14 = "No 'participant removed' callback defined.  Will not remove participant.  Index path: [%@]";
    }
    else
    {
      v13 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      int v15 = 138412290;
      id v16 = v6;
      uint64_t v14 = "Received commit for nonexistent row: [%@]";
    }
    _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v15, 0xCu);
    goto LABEL_12;
  }
  v9 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    v10 = NSNumber;
    v11 = v9;
    id v12 = [v10 numberWithInteger:a3];
    int v15 = 138412290;
    id v16 = v12;
    _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_ERROR, "Received commit for unrecognized editing style: [%@]", (uint8_t *)&v15, 0xCu);
  }
LABEL_12:
}

- (double)estimatedHeightForRow:(id)a3
{
  return 44.0;
}

- (void)cancelOutstandingOperations
{
  id v2 = [(EKUIInviteesViewNotRespondedInviteesSection *)self availabilityRequestsQueue];
  [v2 cancelAllOperations];
}

- (id)actionsForRow:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[EKUIInviteesViewSectionCommon deleteRowAction:self forRow:v4];
  id v6 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participants];
  uint64_t v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v4, "row"));

  uint64_t v8 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantSetRole];
  v9 = (void *)MEMORY[0x1E4F28D60];
  uint64_t v10 = [v4 section];

  v11 = [v9 indexSetWithIndex:v10];
  id v12 = +[EKUIInviteesViewSectionCommon setRoleRowActionWithParticipant:v7 withSetRoleBlock:v8 forSections:v11];

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
  uint64_t v8 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participants];
  v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  uint64_t v10 = [v9 participant];

  v11 = [EKUIInviteeContextMenuData alloc];
  id v12 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantSetRole];
  v13 = [(EKUIInviteeContextMenuData *)v11 initWithDefaultActionsForSection:self indexPath:v7 participant:v10 interaction:v6 participantSetRole:v12];

  return v13;
}

- (void)updateWithEvent:(id)a3 editable:(BOOL)a4 fromDetail:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v52 = a4;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  -[EKUIInviteesViewNotRespondedInviteesSection setEvent:](self, "setEvent:");
  id v6 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_DEBUG, "Cancelling existing availability operations.", buf, 2u);
  }
  id v7 = [(EKUIInviteesViewNotRespondedInviteesSection *)self availabilityRequestsQueue];
  [v7 cancelAllOperations];

  uint64_t v8 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesToAvailabilityType];
  [v8 removeAllObjects];

  v9 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesToParticipantIndex];
  [v9 removeAllObjects];

  uint64_t v10 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesForInFlightAvailabilityOperations];
  [v10 removeAllObjects];

  [(EKUIInviteesViewNotRespondedInviteesSection *)self setCanSeeAttendeeStatuses:CanSeeAttendeeStatuses((uint64_t)v53)];
  if ([(EKUIInviteesViewNotRespondedInviteesSection *)self canSeeAttendeeStatuses])
  {
    if ([v53 isStartDateDirty]) {
      char v11 = 1;
    }
    else {
      char v11 = [v53 isEndDateDirty];
    }
    uint64_t v14 = [(EKUIInviteesViewNotRespondedInviteesSection *)self event];
    if (([v14 isExternallyOrganizedInvitation] & 1) == 0
      && ![(EKUIInviteesViewNotRespondedInviteesSection *)self editable])
    {
      BOOL v5 = 0;
    }

    v57 = [v53 organizer];
    int v15 = (void *)MEMORY[0x1E4F25588];
    id v16 = [v53 attendees];
    uint64_t v17 = [v57 eventStore];
    v54 = [v15 objectsIDsExistingInStoreFromObjects:v16 eventStore:v17];

    id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v18 = [v53 attendees];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v68 objects:v73 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v69 != v20) {
            objc_enumerationMutation(v18);
          }
          v22 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          if ([v22 participantType] != 2
            && ((v11 & 1) != 0 || (EKUIAttendeeUtils_AttendeeHasResponded(v22) & 1) == 0))
          {
            int v23 = v5 ? [v22 isNew] : 0;
            if ([v22 isNew])
            {
              int v24 = 0;
            }
            else
            {
              v25 = [v22 CADObjectID];
              int v26 = [v54 containsObject:v25];

              int v24 = v26 ^ 1;
            }
            if ((([v22 isEqualToParticipant:v57] | v23 | v24) & 1) == 0)
            {
              v27 = [MEMORY[0x1E4F255C0] participantForSortingWithEKParticipant:v22];
              [v55 addObject:v27];
            }
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v68 objects:v73 count:16];
      }
      while (v19);
    }

    v51 = [v55 sortedArrayUsingComparator:&__block_literal_global_32];
    v28 = [v53 calendar];
    v29 = [v28 source];
    v30 = [v29 constraints];
    char v31 = [v30 supportsAvailabilityRequests];

    if (v31)
    {
      if ([v51 count])
      {
        id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v32 = v51;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v64 objects:v72 count:16];
        if (v33)
        {
          uint64_t v34 = 0;
          uint64_t v35 = *(void *)v65;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v65 != v35) {
                objc_enumerationMutation(v32);
              }
              v37 = [*(id *)(*((void *)&v64 + 1) + 8 * j) participant];
              v38 = [(id)objc_opt_class() _participantAddressForParticipant:v37];
              if (v38)
              {
                [v56 addObject:v38];
                v39 = (void *)[objc_alloc(NSNumber) initWithInteger:v34 + j];
                [(EKUIInviteesViewNotRespondedInviteesSection *)self _setParticipantIndex:v39 forParticipantAddress:v38];
                [(EKUIInviteesViewNotRespondedInviteesSection *)self _addAddressToSetOfAddressesToInflightOperations:v38];
              }
              else
              {
                v40 = kEKUILogInviteesHandle;
                if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v75 = v37;
                  _os_log_impl(&dword_1B3F4C000, v40, OS_LOG_TYPE_DEBUG, "Could not find address for participant: [%@].  Will not include this participant in final list of participants.", buf, 0xCu);
                }
              }
            }
            uint64_t v33 = [v32 countByEnumeratingWithState:&v64 objects:v72 count:16];
            v34 += j;
          }
          while (v33);
        }

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __83__EKUIInviteesViewNotRespondedInviteesSection_updateWithEvent_editable_fromDetail___block_invoke_41;
        aBlock[3] = &unk_1E60893A0;
        aBlock[4] = self;
        v41 = _Block_copy(aBlock);
        v42 = [v53 calendar];
        v43 = [v42 source];

        v44 = [v53 startDate];
        v45 = [v53 endDateUnadjustedForLegacyClients];
        v46 = (void *)[objc_alloc(MEMORY[0x1E4F25608]) initWithSource:v43 startDate:v44 endDate:v45 ignoredEvent:v53 addresses:v56 resultsBlock:v41];
        objc_initWeak((id *)buf, self);
        objc_initWeak(&location, v46);
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __83__EKUIInviteesViewNotRespondedInviteesSection_updateWithEvent_editable_fromDetail___block_invoke_4;
        v59[3] = &unk_1E6089918;
        objc_copyWeak(&v60, &location);
        objc_copyWeak(&v61, (id *)buf);
        [v46 setCompletionBlock:v59];
        v47 = [(EKUIInviteesViewNotRespondedInviteesSection *)self availabilityRequestsQueue];
        [v47 addOperation:v46];

        objc_destroyWeak(&v61);
        objc_destroyWeak(&v60);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      v48 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3F4C000, v48, OS_LOG_TYPE_DEBUG, "The event's source does not support availability requests.  Will not issue any.", buf, 2u);
      }
    }

    v13 = v51;
  }
  else
  {
    id v12 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v75 = self;
      _os_log_impl(&dword_1B3F4C000, v12, OS_LOG_TYPE_DEBUG, "Cannot see attendee statuses.  Will not analyze attendees for section: [%@]", buf, 0xCu);
    }
    v13 = 0;
  }
  v49 = v13;
  v50 = (void *)[v13 mutableCopy];
  [(EKUIInviteesViewNotRespondedInviteesSection *)self setParticipants:v50];

  [(EKUIInviteesViewNotRespondedInviteesSection *)self setEditable:v52];
}

uint64_t __83__EKUIInviteesViewNotRespondedInviteesSection_updateWithEvent_editable_fromDetail___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __83__EKUIInviteesViewNotRespondedInviteesSection_updateWithEvent_editable_fromDetail___block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__EKUIInviteesViewNotRespondedInviteesSection_updateWithEvent_editable_fromDetail___block_invoke_2;
  v6[3] = &unk_1E6087D68;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __83__EKUIInviteesViewNotRespondedInviteesSection_updateWithEvent_editable_fromDetail___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__EKUIInviteesViewNotRespondedInviteesSection_updateWithEvent_editable_fromDetail___block_invoke_3;
  v3[3] = &unk_1E60893C8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

void __83__EKUIInviteesViewNotRespondedInviteesSection_updateWithEvent_editable_fromDetail___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) _setOfAddressesToInflightOperationsContainsAddress:v8])
  {
    uint64_t v6 = [MEMORY[0x1E4F254B8] summarizedAvailabilityTypeForSpans:v5];
    id v7 = (void *)[objc_alloc(NSNumber) initWithInteger:v6];
    [*(id *)(a1 + 32) _setAvailabilityType:v7 forParticipantAddress:v8];
    [*(id *)(a1 + 32) _removeAddressFromSetOfAddressesToInflightOperations:v8];
    [*(id *)(a1 + 32) _updateCellForParticipantWithAddress:v8];
  }
}

void __83__EKUIInviteesViewNotRespondedInviteesSection_updateWithEvent_editable_fromDetail___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v3)
  {
    uint64_t v4 = kEKUILogInviteesHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    id v5 = "self went away.  Will not proceed.";
LABEL_9:
    _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_DEBUG, v5, buf, 2u);
    goto LABEL_10;
  }
  if (!WeakRetained)
  {
    uint64_t v4 = kEKUILogInviteesHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    id v5 = "The availability operation went away.  Will not proceed.";
    goto LABEL_9;
  }
  if (([WeakRetained isCancelled] & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__EKUIInviteesViewNotRespondedInviteesSection_updateWithEvent_editable_fromDetail___block_invoke_47;
    block[3] = &unk_1E6087570;
    block[4] = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
LABEL_10:
}

void __83__EKUIInviteesViewNotRespondedInviteesSection_updateWithEvent_editable_fromDetail___block_invoke_47(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) participantAddressesForInFlightAvailabilityOperations];
  id v3 = (void *)[v2 copy];

  uint64_t v4 = [*(id *)(a1 + 32) participantAddressesForInFlightAvailabilityOperations];
  [v4 removeAllObjects];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(a1 + 32), "_updateCellForParticipantWithAddress:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_lookUpAvailabilityTypeForParticipantAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesToAvailabilityType];
  uint64_t v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    uint64_t v7 = EKUtils_AdjustedAttendeeAddress();
    uint64_t v8 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesToAvailabilityType];
    uint64_t v6 = [v8 objectForKey:v7];
  }

  return v6;
}

- (void)_setAvailabilityType:(id)a3 forParticipantAddress:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesToAvailabilityType];
  [v8 setObject:v7 forKey:v6];

  EKUtils_AdjustedAttendeeAddress();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesToAvailabilityType];
  [v9 setObject:v7 forKey:v10];
}

- (void)_removeAddressFromDictionaryOfAddressesToAvailabilityType:(id)a3
{
  id v4 = a3;
  id v5 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesToAvailabilityType];
  [v5 removeObjectForKey:v4];

  EKUtils_AdjustedAttendeeAddress();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesToAvailabilityType];
  [v6 removeObjectForKey:v7];
}

- (id)_lookUpParticipantIndexForParticipantAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesToParticipantIndex];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v7 = EKUtils_AdjustedAttendeeAddress();
    uint64_t v8 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesToParticipantIndex];
    id v6 = [v8 objectForKey:v7];
  }

  return v6;
}

- (void)_removeAddressFromDictionaryOfAddressesToParticipantIndex:(id)a3
{
  id v4 = a3;
  id v5 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesToParticipantIndex];
  [v5 removeObjectForKey:v4];

  EKUtils_AdjustedAttendeeAddress();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesToParticipantIndex];
  [v6 removeObjectForKey:v7];
}

- (void)_setParticipantIndex:(id)a3 forParticipantAddress:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesToParticipantIndex];
  [v8 setObject:v7 forKey:v6];

  EKUtils_AdjustedAttendeeAddress();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesToParticipantIndex];
  [v9 setObject:v7 forKey:v10];
}

- (void)_removeAddressFromSetOfAddressesToInflightOperations:(id)a3
{
  id v4 = a3;
  id v5 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesForInFlightAvailabilityOperations];
  [v5 removeObject:v4];

  EKUtils_AdjustedAttendeeAddress();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesForInFlightAvailabilityOperations];
  [v6 removeObject:v7];
}

- (void)_addAddressToSetOfAddressesToInflightOperations:(id)a3
{
  id v4 = a3;
  id v5 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesForInFlightAvailabilityOperations];
  [v5 addObject:v4];

  EKUtils_AdjustedAttendeeAddress();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesForInFlightAvailabilityOperations];
  [v6 addObject:v7];
}

- (BOOL)_setOfAddressesToInflightOperationsContainsAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesForInFlightAvailabilityOperations];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v8 = EKUtils_AdjustedAttendeeAddress();
    uint64_t v9 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantAddressesForInFlightAvailabilityOperations];
    char v7 = [v9 containsObject:v8];
  }
  return v7;
}

- (void)_removeParticipantAtIndexPath:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 row];
  char v6 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participants];
  unint64_t v7 = [v6 count];

  if (v5 < v7)
  {
    uint64_t v8 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participants];
    uint64_t v9 = [v8 objectAtIndex:v5];

    id v10 = [v9 participant];
    long long v11 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_1B3F4C000, v11, OS_LOG_TYPE_DEBUG, "Invoking participant removed callback with participant [%@] and index path [%@]", buf, 0x16u);
    }
    long long v12 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participantRemoved];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__EKUIInviteesViewNotRespondedInviteesSection__removeParticipantAtIndexPath___block_invoke;
    v17[3] = &unk_1E60877C0;
    v17[4] = self;
    id v18 = v10;
    id v19 = v4;
    unint64_t v20 = v5;
    long long v13 = (void (*)(void *, id, id, void *))v12[2];
    id v14 = v10;
    v13(v12, v14, v19, v17);

    goto LABEL_7;
  }
  uint64_t v15 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = v15;
    id v16 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participants];
    *(_DWORD *)buf = 138412546;
    id v22 = v4;
    __int16 v23 = 2112;
    id v24 = v16;
    _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_ERROR, "No participant was found at index path [%@] while trying to remove it. We will not remove anything from participants [%@].", buf, 0x16u);

LABEL_7:
  }
}

void __77__EKUIInviteesViewNotRespondedInviteesSection__removeParticipantAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [(id)objc_opt_class() _participantAddressForParticipant:*(void *)(a1 + 40)];
  id v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_DEBUG, "Removing participant [%@] at index path [%@] from EKUIInviteesViewNotRespondedInviteesSection", (uint8_t *)&v7, 0x16u);
  }
  char v6 = [*(id *)(a1 + 32) participants];
  [v6 removeObjectAtIndex:*(void *)(a1 + 56)];

  [*(id *)(a1 + 32) _removeAddressFromDictionaryOfAddressesToAvailabilityType:v2];
  [*(id *)(a1 + 32) _removeAddressFromDictionaryOfAddressesToParticipantIndex:v2];
  [*(id *)(a1 + 32) _removeAddressFromSetOfAddressesToInflightOperations:v2];
}

- (BOOL)_isValidRow:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0
      && [(EKUIInviteesViewNotRespondedInviteesSection *)self numberOfRows] > a3;
}

- (BOOL)_isAddInviteesRow:(int64_t)a3
{
  uint64_t v4 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participants];
  LOBYTE(a3) = [v4 count] == a3;

  return a3;
}

+ (id)_participantAddressForParticipant:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 URL];
    char v6 = [v5 absoluteString];
  }
  else
  {
    int v7 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v9 = 0;
      _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_ERROR, "No participant given.  Will not return address.", v9, 2u);
    }
    char v6 = 0;
  }

  return v6;
}

- (void)_updateCellForParticipantWithAddress:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EKUIInviteesViewNotRespondedInviteesSection *)self _lookUpParticipantIndexForParticipantAddress:v4];
  if (!v5)
  {
    uint64_t v10 = kEKUILogInviteesHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v16 = 138412290;
    id v17 = v4;
    uint64_t v11 = "Could not find participant index.  Will not update cell for address: [%@].";
LABEL_9:
    _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v16, 0xCu);
    goto LABEL_13;
  }
  char v6 = [(EKUIInviteesViewNotRespondedInviteesSection *)self tableViewCellHook];

  if (!v6)
  {
    uint64_t v10 = kEKUILogInviteesHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v16 = 138412290;
    id v17 = v4;
    uint64_t v11 = "No 'table view cell hook' callback defined.  Will not update cell for address: [%@].";
    goto LABEL_9;
  }
  uint64_t v7 = [v5 integerValue];
  uint64_t v8 = [(EKUIInviteesViewNotRespondedInviteesSection *)self tableViewCellHook];
  __int16 v9 = v8[2](v8, v7);

  if (v9)
  {
    [(EKUIInviteesViewNotRespondedInviteesSection *)self _updateCell:v9 forParticipantAtIndex:v7 animated:1];
  }
  else
  {
    long long v12 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      long long v13 = NSNumber;
      id v14 = v12;
      uint64_t v15 = [v13 numberWithInteger:v7];
      int v16 = 138412546;
      id v17 = v15;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_1B3F4C000, v14, OS_LOG_TYPE_DEBUG, "Could not find cell for index: [%@].  It may be offscreen.  Will not update cell for address: [%@].", (uint8_t *)&v16, 0x16u);
    }
  }

LABEL_13:
}

- (void)_updateCell:(id)a3 forParticipantAtIndex:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  __int16 v9 = [(EKUIInviteesViewNotRespondedInviteesSection *)self participants];
  uint64_t v10 = [v9 objectAtIndex:a4];

  uint64_t v11 = [v10 participant];
  long long v12 = [(id)objc_opt_class() _participantAddressForParticipant:v11];
  if (v12)
  {
    long long v13 = [(EKUIInviteesViewNotRespondedInviteesSection *)self _lookUpAvailabilityTypeForParticipantAddress:v12];
    id v14 = v13;
    if (v13) {
      uint64_t v15 = [v13 integerValue];
    }
    else {
      uint64_t v15 = 0;
    }

    id v17 = (void *)MEMORY[0x1E4F254B8];
    __int16 v18 = [(EKUIInviteesViewNotRespondedInviteesSection *)self event];
    uint64_t v19 = [v17 availabilityPanelVisibilityForEvent:v18];

    if (v19) {
      uint64_t v15 = 3;
    }
    objc_msgSend(v8, "updateWithParticipantForSorting:availabilityType:showSpinner:animated:", v10, v15, -[EKUIInviteesViewNotRespondedInviteesSection _setOfAddressesToInflightOperationsContainsAddress:](self, "_setOfAddressesToInflightOperationsContainsAddress:", v12), v5);
  }
  else
  {
    int v16 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412546;
      __int16 v21 = v11;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_1B3F4C000, v16, OS_LOG_TYPE_ERROR, "Could not find address for participant: [%@].  Will not update cell: [%@]", (uint8_t *)&v20, 0x16u);
    }
  }
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

- (id)addInviteesTapped
{
  return self->_addInviteesTapped;
}

- (void)setAddInviteesTapped:(id)a3
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

- (BOOL)canSeeAttendeeStatuses
{
  return self->_canSeeAttendeeStatuses;
}

- (void)setCanSeeAttendeeStatuses:(BOOL)a3
{
  self->_canSeeAttendeeStatuses = a3;
}

- (NSString)cachedInviteeCellReuseIdentifier
{
  return self->_cachedInviteeCellReuseIdentifier;
}

- (void)setCachedInviteeCellReuseIdentifier:(id)a3
{
}

- (NSString)cachedAddInviteeCellReuseIdentifier
{
  return self->_cachedAddInviteeCellReuseIdentifier;
}

- (void)setCachedAddInviteeCellReuseIdentifier:(id)a3
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

- (BOOL)editable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (NSOperationQueue)availabilityRequestsQueue
{
  return self->_availabilityRequestsQueue;
}

- (void)setAvailabilityRequestsQueue:(id)a3
{
}

- (NSMutableDictionary)participantAddressesToAvailabilityType
{
  return self->_participantAddressesToAvailabilityType;
}

- (void)setParticipantAddressesToAvailabilityType:(id)a3
{
}

- (NSMutableDictionary)participantAddressesToParticipantIndex
{
  return self->_participantAddressesToParticipantIndex;
}

- (void)setParticipantAddressesToParticipantIndex:(id)a3
{
}

- (NSMutableSet)participantAddressesForInFlightAvailabilityOperations
{
  return self->_participantAddressesForInFlightAvailabilityOperations;
}

- (void)setParticipantAddressesForInFlightAvailabilityOperations:(id)a3
{
}

- (id)tableViewCellHook
{
  return self->_tableViewCellHook;
}

- (void)setTableViewCellHook:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tableViewCellHook, 0);
  objc_storeStrong((id *)&self->_participantAddressesForInFlightAvailabilityOperations, 0);
  objc_storeStrong((id *)&self->_participantAddressesToParticipantIndex, 0);
  objc_storeStrong((id *)&self->_participantAddressesToAvailabilityType, 0);
  objc_storeStrong((id *)&self->_availabilityRequestsQueue, 0);
  objc_storeStrong((id *)&self->_cachedAddInviteeCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedInviteeCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong(&self->_participantSetRole, 0);
  objc_storeStrong(&self->_addInviteesTapped, 0);
  objc_storeStrong(&self->_participantRemoved, 0);

  objc_storeStrong(&self->_participantTapped, 0);
}

@end