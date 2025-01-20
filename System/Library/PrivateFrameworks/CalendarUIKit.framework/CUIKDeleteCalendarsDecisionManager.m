@interface CUIKDeleteCalendarsDecisionManager
+ (id)_cancelButtonText;
+ (id)_deleteAndDontNotifyButtonText;
+ (id)_deleteAndNotifyButtonText;
+ (id)_deleteButtonText;
+ (id)_removeButtonText;
+ (id)_shouldDeleteCalendarContainingMeetingsWithTitle:(id)a3 isDualType:(BOOL)a4 hasInvitations:(BOOL)a5;
+ (id)_shouldDeleteSharedToMeCalendarWithTitle:(id)a3;
+ (id)_shouldDeleteSubscribedCalendarWithTitle:(id)a3 canBeJunk:(BOOL)a4;
+ (id)_thisCalendarCantBeDeletedPlural:(BOOL)a3;
+ (id)_unsubscribeAndReportJunkButtonText;
+ (id)_unsubscribeButtonText;
+ (id)_yesNoConfirmationWithPrompt:(id)a3 dialog:(id)a4 yesText:(id)a5;
- (BOOL)_validateDeletableWithError:(id *)a3;
- (BOOL)rejected;
- (BOOL)selectConfirmationOptionAtIndex:(int64_t)a3;
- (CUIKDeleteCalendarsConfirmationInfo)nextConfirmation;
- (CUIKDeleteCalendarsDecisionManager)initWithCalendars:(id)a3;
- (NSString)rejectionDetails;
- (NSString)rejectionTitle;
- (unint64_t)commitDecision;
- (unint64_t)rejectionReason;
- (void)_addConfirmation:(id)a3;
- (void)_process;
- (void)_rejectDeleteCalendarFromUnwriteableAccountPlural:(BOOL)a3;
- (void)_rejectRemainingCalendarCannotBeDefaultSchedulingCalendarPlural:(BOOL)a3;
- (void)perform;
@end

@implementation CUIKDeleteCalendarsDecisionManager

- (CUIKDeleteCalendarsDecisionManager)initWithCalendars:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUIKDeleteCalendarsDecisionManager;
  v6 = [(CUIKDeleteCalendarsDecisionManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_calendars, a3);
    [(CUIKDeleteCalendarsDecisionManager *)v7 _process];
  }

  return v7;
}

- (BOOL)rejected
{
  return self->_rejectionReason != 0;
}

- (CUIKDeleteCalendarsConfirmationInfo)nextConfirmation
{
  return (CUIKDeleteCalendarsConfirmationInfo *)[(NSMutableArray *)self->_confirmations firstObject];
}

- (BOOL)selectConfirmationOptionAtIndex:(int64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = [(NSMutableArray *)self->_confirmations firstObject];
  if (!v5) {
    goto LABEL_12;
  }
  [(NSMutableArray *)self->_confirmations removeObjectAtIndex:0];
  uint64_t v6 = [v5 type];
  if (!v6)
  {
    uint64_t v7 = 1;
LABEL_8:
    self->_canceled = v7 == a3;
    goto LABEL_9;
  }
  if (v6 == 1)
  {
    if (a3 == 1) {
      self->_reportSpam = 1;
    }
    uint64_t v7 = 2;
    goto LABEL_8;
  }
LABEL_9:
  v8 = [(CUIKDeleteCalendarsDecisionManager *)self nextConfirmation];
  if (v8 || self->_canceled)
  {
  }
  else if (self->_reportSpam)
  {
    v22 = v5;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v11 = self->_calendars;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v16 isSubscribed] && (objc_msgSend(v16, "isHolidayCalendar") & 1) == 0)
          {
            v17 = [MEMORY[0x1E4F57660] defaultProvider];
            uint64_t v18 = [v16 subcalAccountID];
            v19 = [v17 accountWithIdentifier:v18];

            v20 = [v19 parentAccount];
            LOBYTE(v18) = [v20 calIsiCloudCalDAVAccount];

            if ((v18 & 1) == 0)
            {
              v21 = [v16 subcalURL];
              +[CUIKSubscribedCalendarUtilities reportLocalSubscribedCalendarAsJunkWithoutRemoval:v21];
            }
            [v16 setIsSubscribedCalendarJunk:1];
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    id v5 = v22;
  }
LABEL_12:
  BOOL v9 = !self->_canceled;

  return v9;
}

- (void)perform
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 localizedDescription];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_ERROR, "Failed to delete calendars: %{public}@", (uint8_t *)&v4, 0xCu);
}

- (unint64_t)commitDecision
{
  if (self->_canceled) {
    return 4;
  }
  v3 = [(CUIKDeleteCalendarsDecisionManager *)self nextConfirmation];
  unint64_t v2 = v3 == 0;

  return v2;
}

- (void)_process
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSArray *)self->_calendars count];
  id v35 = 0;
  BOOL v4 = [(CUIKDeleteCalendarsDecisionManager *)self _validateDeletableWithError:&v35];
  id v5 = v35;
  uint64_t v6 = v5;
  if (!v4)
  {
    if ([v5 code] == 51)
    {
      [(CUIKDeleteCalendarsDecisionManager *)self _rejectRemainingCalendarCannotBeDefaultSchedulingCalendarPlural:v3 > 1];
      goto LABEL_32;
    }
    if ([v6 code] == 52)
    {
      [(CUIKDeleteCalendarsDecisionManager *)self _rejectDeleteCalendarFromUnwriteableAccountPlural:v3 > 1];
      goto LABEL_32;
    }
    if ([v6 code] == 53)
    {
      self->_rejectionReason = 3;
      long long v25 = [(id)objc_opt_class() _thisCalendarCantBeDeletedPlural:v3 > 1];
      rejectionTitle = self->_rejectionTitle;
      self->_rejectionTitle = v25;

      goto LABEL_32;
    }
  }
  unint64_t v27 = v3;
  uint64_t v28 = self;
  v29 = v6;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v7 = self->_calendars;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    int v11 = 0;
    char v30 = 0;
    char v12 = 0;
    BOOL v13 = 0;
    int v14 = 0;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v7);
        }
        v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v17, "isSubscribed", v27))
        {
          v11 |= [v17 isHolidayCalendar] ^ 1;
          char v10 = 1;
        }
        else
        {
          unint64_t v18 = [v17 deletionWarningsMask];
          if ((v18 & 0x10) != 0)
          {
            char v30 = 1;
          }
          else
          {
            v12 |= (v18 & 2) >> 1;
            if ((v18 & 2) != 0) {
              BOOL v13 = (v18 & 8) != 0;
            }
            v14 |= (v18 >> 2) & 1;
          }
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v9);
  }
  else
  {
    char v10 = 0;
    LOBYTE(v11) = 0;
    char v30 = 0;
    char v12 = 0;
    BOOL v13 = 0;
    LOBYTE(v14) = 0;
  }

  if (v27 > 1)
  {
    v19 = 0;
    v20 = v28;
    if ((v10 & 1) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  v20 = v28;
  v21 = [(NSArray *)v28->_calendars firstObject];
  v19 = [v21 title];

  if (v10)
  {
LABEL_26:
    v22 = [(id)objc_opt_class() _shouldDeleteSubscribedCalendarWithTitle:v19 canBeJunk:v11 & 1];
    [(CUIKDeleteCalendarsDecisionManager *)v20 _addConfirmation:v22];
  }
LABEL_27:
  if (v30)
  {
    long long v23 = [(id)objc_opt_class() _shouldDeleteSharedToMeCalendarWithTitle:v19];
    [(CUIKDeleteCalendarsDecisionManager *)v20 _addConfirmation:v23];
  }
  uint64_t v6 = v29;
  if (v12)
  {
    long long v24 = [(id)objc_opt_class() _shouldDeleteCalendarContainingMeetingsWithTitle:v19 isDualType:v13 hasInvitations:v14 & 1];
    [(CUIKDeleteCalendarsDecisionManager *)v20 _addConfirmation:v24];
  }
LABEL_32:
}

- (void)_addConfirmation:(id)a3
{
  id v4 = a3;
  confirmations = self->_confirmations;
  id v8 = v4;
  if (!confirmations)
  {
    uint64_t v6 = (NSMutableArray *)objc_opt_new();
    uint64_t v7 = self->_confirmations;
    self->_confirmations = v6;

    id v4 = v8;
    confirmations = self->_confirmations;
  }
  [(NSMutableArray *)confirmations addObject:v4];
}

- (BOOL)_validateDeletableWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = [(NSArray *)self->_calendars firstObject];
  uint64_t v6 = [v5 eventStore];
  uint64_t v7 = [v6 _allCalendars];
  id v8 = (void *)[v7 mutableCopy];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = self->_calendars;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        [v8 removeObject:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v11);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v14 = self->_calendars;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    while (2)
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "_validateDeletableWithAllKnownCalendars:error:", v8, a3, (void)v21))
        {
          BOOL v19 = 0;
          goto LABEL_18;
        }
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 1;
LABEL_18:

  return v19;
}

+ (id)_cancelButtonText
{
  unint64_t v2 = CUIKBundle();
  NSUInteger v3 = [v2 localizedStringForKey:@"CUIKDeleteCalendarsDecisionManager_Cancel" value:@"Cancel" table:0];

  return v3;
}

+ (id)_deleteButtonText
{
  unint64_t v2 = CUIKBundle();
  NSUInteger v3 = [v2 localizedStringForKey:@"CUIKDeleteCalendarsDecisionManager_Delete" value:@"Delete" table:0];

  return v3;
}

+ (id)_removeButtonText
{
  unint64_t v2 = CUIKBundle();
  NSUInteger v3 = [v2 localizedStringForKey:@"CUIKDeleteCalendarsDecisionManager_Remove" value:@"Remove" table:0];

  return v3;
}

+ (id)_deleteAndNotifyButtonText
{
  unint64_t v2 = CUIKBundle();
  NSUInteger v3 = [v2 localizedStringForKey:@"CUIKDeleteCalendarsDecisionManager_DeleteAndNotify" value:@"Delete and Notify" table:0];

  return v3;
}

+ (id)_deleteAndDontNotifyButtonText
{
  unint64_t v2 = CUIKBundle();
  NSUInteger v3 = [v2 localizedStringForKey:@"CUIKDeleteCalendarsDecisionManager_DeleteAndDontNotify" value:@"Delete and Don’t Notify" table:0];

  return v3;
}

+ (id)_unsubscribeButtonText
{
  unint64_t v2 = CUIKBundle();
  NSUInteger v3 = [v2 localizedStringForKey:@"CUIKDeleteCalendarsDecisionManager_Unsubscribe" value:@"Unsubscribe" table:0];

  return v3;
}

+ (id)_unsubscribeAndReportJunkButtonText
{
  unint64_t v2 = CUIKBundle();
  NSUInteger v3 = [v2 localizedStringForKey:@"CUIKDeleteCalendarsDecisionManager_UnsubscribeAndReportJunk" value:@"Unsubscribe and Report Junk" table:0];

  return v3;
}

+ (id)_thisCalendarCantBeDeletedPlural:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = CUIKBundle();
  id v5 = v4;
  if (v3) {
    uint64_t v6 = @"A selected calendar can't be deleted.";
  }
  else {
    uint64_t v6 = @"This calendar can’t be deleted.";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_1F187C430 table:0];

  return v7;
}

- (void)_rejectRemainingCalendarCannotBeDefaultSchedulingCalendarPlural:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = CUIKBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"If you perform this deletion, then the only remaining calendar will become the default calendar from the server because it is used for incoming events, and the remaining calendar doesn’t support that. If you would like to delete this calendar, you must first make another calendar.", &stru_1F187C430, 0 value table];

  self->_rejectionReason = 1;
  uint64_t v7 = [(id)objc_opt_class() _thisCalendarCantBeDeletedPlural:v3];
  rejectionTitle = self->_rejectionTitle;
  self->_rejectionTitle = v7;

  rejectionDetails = self->_rejectionDetails;
  self->_rejectionDetails = v6;
}

- (void)_rejectDeleteCalendarFromUnwriteableAccountPlural:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = CUIKBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"You can’t delete calendars from an account with read-only privileges." value:&stru_1F187C430 table:0];

  self->_rejectionReason = 2;
  uint64_t v7 = [(id)objc_opt_class() _thisCalendarCantBeDeletedPlural:v3];
  rejectionTitle = self->_rejectionTitle;
  self->_rejectionTitle = v7;

  rejectionDetails = self->_rejectionDetails;
  self->_rejectionDetails = v6;
}

+ (id)_yesNoConfirmationWithPrompt:(id)a3 dialog:(id)a4 yesText:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [CUIKDeleteCalendarsConfirmationInfo alloc];
  v16[0] = v8;
  uint64_t v12 = [a1 _cancelButtonText];
  v16[1] = v12;
  BOOL v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];

  int v14 = [(CUIKDeleteCalendarsConfirmationInfo *)v11 initWithType:0 prompt:v10 dialog:v9 options:v13];

  return v14;
}

+ (id)_shouldDeleteSubscribedCalendarWithTitle:(id)a3 canBeJunk:(BOOL)a4
{
  BOOL v4 = a4;
  v21[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = CUIKBundle();
  id v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v7 localizedStringForKey:@"Are you sure you want to unsubscribe from the calendar “%@”?" value:&stru_1F187C430 table:0];

    id v10 = objc_msgSend(NSString, "localizedStringWithFormat:", v9, v6);
    id v8 = (void *)v9;
  }
  else
  {
    id v10 = [v7 localizedStringForKey:@"You are unsubscribing from a subscribed calendar." value:&stru_1F187C430 table:0];
  }

  uint64_t v11 = CUIKBundle();
  uint64_t v12 = [v11 localizedStringForKey:@"If you unsubscribe from this calendar, all events associated with the calendar will also be deleted.", &stru_1F187C430, 0 value table];

  if (v4)
  {
    BOOL v13 = [CUIKDeleteCalendarsConfirmationInfo alloc];
    int v14 = [a1 _unsubscribeButtonText];
    v21[0] = v14;
    uint64_t v15 = [a1 _unsubscribeAndReportJunkButtonText];
    v21[1] = v15;
    uint64_t v16 = [a1 _cancelButtonText];
    v21[2] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    unint64_t v18 = [(CUIKDeleteCalendarsConfirmationInfo *)v13 initWithType:1 prompt:v10 dialog:v12 options:v17];
  }
  else
  {
    BOOL v19 = [a1 _unsubscribeButtonText];
    unint64_t v18 = [a1 _yesNoConfirmationWithPrompt:v10 dialog:v12 yesText:v19];
  }

  return v18;
}

+ (id)_shouldDeleteSharedToMeCalendarWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = CUIKBundle();
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 localizedStringForKey:@"Are you sure you want to remove the calendar “%@”?" value:&stru_1F187C430 table:0];

    id v8 = objc_msgSend(NSString, "localizedStringWithFormat:", v7, v4);
    id v6 = (void *)v7;
  }
  else
  {
    id v8 = [v5 localizedStringForKey:@"You are removing a shared calendar." value:&stru_1F187C430 table:0];
  }

  uint64_t v9 = CUIKBundle();
  id v10 = [v9 localizedStringForKey:@"If you remove this calendar, your view of the calendar will be removed. Events associated with the calendar will not be deleted for other users.", &stru_1F187C430, 0 value table];

  uint64_t v11 = [a1 _removeButtonText];
  uint64_t v12 = [a1 _yesNoConfirmationWithPrompt:v8 dialog:v10 yesText:v11];

  return v12;
}

+ (id)_shouldDeleteCalendarContainingMeetingsWithTitle:(id)a3 isDualType:(BOOL)a4 hasInvitations:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = CUIKBundle();
  id v10 = v9;
  if (v5)
  {
    if (v8)
    {
      uint64_t v11 = [v9 localizedStringForKey:@"Are you sure you want to delete the calendar “%@” which contains invitations and meetings?" value:&stru_1F187C430 table:0];

      uint64_t v12 = objc_msgSend(NSString, "localizedStringWithFormat:", v11, v8);
      id v10 = (void *)v11;
    }
    else
    {
      uint64_t v12 = [v9 localizedStringForKey:@"You are deleting a calendar that contains invitations and meetings." value:&stru_1F187C430 table:0];
    }

    int v14 = CUIKBundle();
    if (v6) {
      uint64_t v15 = @"Deleting this calendar will delete all events on the calendar. All reminders in the calendar will persist in Reminders. Invitees of events you proposed will be notified that events have been canceled, and organizers of events you’ve accepted will be notified that you’ve declined the events. You can’t undo this action.";
    }
    else {
      uint64_t v15 = @"Deleting this calendar will delete all events on the calendar. Invitees of events you proposed will be notified that events have been canceled, and organizers of events you’ve accepted will be notified that you’ve declined the events. You can’t undo this action.";
    }
  }
  else
  {
    if (v8)
    {
      uint64_t v13 = [v9 localizedStringForKey:@"Are you sure you want to delete the calendar “%@”?" value:&stru_1F187C430 table:0];

      uint64_t v12 = objc_msgSend(NSString, "localizedStringWithFormat:", v13, v8);
      id v10 = (void *)v13;
    }
    else
    {
      uint64_t v12 = [v9 localizedStringForKey:@"You are deleting a calendar that contains events." value:&stru_1F187C430 table:0];
    }

    int v14 = CUIKBundle();
    if (v6) {
      uint64_t v15 = @"If you delete this calendar, all events associated with the calendar will also be deleted. All reminders in the calendar will persist in Reminders.";
    }
    else {
      uint64_t v15 = @"If you delete this calendar, all events associated with the calendar will also be deleted.";
    }
  }
  uint64_t v16 = [v14 localizedStringForKey:v15 value:&stru_1F187C430 table:0];

  uint64_t v17 = [a1 _deleteButtonText];
  unint64_t v18 = [a1 _yesNoConfirmationWithPrompt:v12 dialog:v16 yesText:v17];

  return v18;
}

- (unint64_t)rejectionReason
{
  return self->_rejectionReason;
}

- (NSString)rejectionTitle
{
  return self->_rejectionTitle;
}

- (NSString)rejectionDetails
{
  return self->_rejectionDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rejectionDetails, 0);
  objc_storeStrong((id *)&self->_rejectionTitle, 0);
  objc_storeStrong((id *)&self->_confirmations, 0);

  objc_storeStrong((id *)&self->_calendars, 0);
}

@end