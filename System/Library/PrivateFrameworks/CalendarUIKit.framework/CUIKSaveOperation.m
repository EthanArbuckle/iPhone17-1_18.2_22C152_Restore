@interface CUIKSaveOperation
+ (id)alarmsAddedActionName:(id)a3;
+ (id)alarmsModifiedActionName:(id)a3;
+ (id)alarmsRemovedActionName:(id)a3;
+ (id)attachmentsAddedActionName:(id)a3;
+ (id)attachmentsModifiedActionName:(id)a3;
+ (id)attachmentsRemovedActionName:(id)a3;
+ (id)attendeesAddedActionName:(id)a3;
+ (id)attendeesModifiedActionName:(id)a3;
+ (id)attendeesRemovedActionName:(id)a3;
+ (id)changedAllDayActionNameWithCurrentEvent:(id)a3 previousEvent:(id)a4;
+ (id)changedAvailablityActionName:(id)a3;
+ (id)changedCalendarActionName:(id)a3;
+ (id)changedColorOfCalendar:(id)a3;
+ (id)changedCompletionActionName:(id)a3;
+ (id)changedLocationActionNameWithCurrentEvent:(id)a3 previousEvent:(id)a4;
+ (id)changedNotesActionName:(id)a3;
+ (id)changedParticipationStatusActionName:(id)a3;
+ (id)changedPrivacyActionName:(id)a3;
+ (id)changedRecurrenceRuleActionNameWithCurrentEvent:(id)a3 previousEvent:(id)a4;
+ (id)changedResponseCommentActionName:(id)a3;
+ (id)changedTimeActionName:(id)a3;
+ (id)changedTimeZoneActionName:(id)a3;
+ (id)changedTitleActionName:(id)a3;
+ (id)changedTitleOfCalendar:(id)a3;
+ (id)changedTravelTimeActionNameWithCurrentEvent:(id)a3 previousEvent:(id)a4;
+ (id)changedURLActionName:(id)a3;
+ (id)genericEventChangedActionName:(id)a3;
+ (id)multipleEventsChangedActionName;
+ (id)shareesAddedActionName:(id)a3;
+ (id)shareesModifiedActionName:(id)a3;
+ (id)shareesRemovedActionName:(id)a3;
- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4;
- (Class)_inverseOperationClass;
- (NSArray)previousObjects;
- (NSArray)previousSliceInfo;
- (NSDictionary)objectsRequiringAlteredSpan;
- (id)_actionName;
- (id)_inverseOperation;
- (id)_invertedNonSliceObjects;
- (id)_objectsForInverse;
- (id)_objectsRequiringAlteredSpan:(id)a3;
- (int64_t)_spanForObject:(id)a3;
- (void)_actionName;
- (void)_storePreviousObjects;
- (void)_storePreviousState;
- (void)setObjectsRequiringAlteredSpan:(id)a3;
- (void)setPreviousObjects:(id)a3;
- (void)setPreviousSliceInfo:(id)a3;
@end

@implementation CUIKSaveOperation

+ (id)multipleEventsChangedActionName
{
  v2 = CUIKBundle();
  v3 = [v2 localizedStringForKey:@"Action: Changes to Events" value:@"Changes to Events" table:0];

  return v3;
}

+ (id)genericEventChangedActionName:(id)a3
{
  id v3 = a3;
  v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Changes to “%@”" value:@"Changes to “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)changedTimeActionName:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = CUIKBundle();
    v6 = [v5 localizedStringForKey:@"Action: Change Time of “%@”" value:@"Change Time of “%@”" table:0];

    v7 = NSString;
    v8 = [v4 title];

    v9 = objc_msgSend(v7, "localizedStringWithFormat:", v6, v8);

LABEL_5:
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = CUIKBundle();
    v9 = [v6 localizedStringForKey:@"Action: Completion Change" value:@"Completion Change" table:0];
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

+ (id)changedTitleActionName:(id)a3
{
  id v3 = a3;
  id v4 = [v3 actionStringsDisplayTitle];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = CUIKBundle();
    v6 = v5;
    v7 = @"Action: Rename event to “%@”";
    v8 = @"Rename event to “%@”";
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v5 = CUIKBundle();
    v6 = v5;
    if (isKindOfClass)
    {
      v7 = @"Action: Rename calendar to “%@”";
      v8 = @"Rename calendar to “%@”";
    }
    else
    {
      v7 = @"Action: Rename to “%@”";
      v8 = @"Rename to “%@”";
    }
  }
  v10 = [v5 localizedStringForKey:v7 value:v8 table:0];

  v11 = objc_msgSend(NSString, "localizedStringWithFormat:", v10, v4);

  return v11;
}

+ (id)changedTimeZoneActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Change Time Zone of “%@”" value:@"Change Time Zone of “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)changedCalendarActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Change Calendar of “%@”" value:@"Change Calendar of “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)changedAvailablityActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Change Availability for “%@”" value:@"Change Availability for “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)changedPrivacyActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Change Privacy for “%@”" value:@"Change Privacy for “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)changedNotesActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Change Notes for “%@”" value:@"Change Notes for “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)changedURLActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Change URL for “%@”" value:@"Change URL for “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)changedParticipationStatusActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Change Participation Status for “%@”" value:@"Change Participation Status for “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)changedResponseCommentActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Response Comment for “%@”" value:@"Change Response Comment for “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)alarmsAddedActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Add Alert to “%@”" value:@"Add Alert to “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)alarmsRemovedActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Remove Alert from “%@”" value:@"Remove Alert from “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)alarmsModifiedActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Change Alert for “%@”" value:@"Change Alert for “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)attachmentsAddedActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Add Attachment to “%@”" value:@"Add Attachment to “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)attachmentsRemovedActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Remove Attachment from “%@”" value:@"Remove Attachment from “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)attachmentsModifiedActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Change Attachment for “%@”" value:@"Change Attachment for “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)attendeesAddedActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Add Attendee to “%@”" value:@"Add Attendee to “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)attendeesRemovedActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Remove Attendee from “%@”" value:@"Remove Attendee from “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)attendeesModifiedActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Change Attendee for “%@”" value:@"Change Attendee for “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)shareesAddedActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Add Sharee to “%@”" value:@"Add Sharee to “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)shareesRemovedActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Remove Sharee from “%@”" value:@"Remove Sharee from “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)shareesModifiedActionName:(id)a3
{
  id v3 = a3;
  id v4 = CUIKBundle();
  v5 = [v4 localizedStringForKey:@"Action: Change Sharee for “%@”" value:@"Change Sharee for “%@”" table:0];

  v6 = NSString;
  v7 = [v3 title];

  v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);

  return v8;
}

+ (id)changedAllDayActionNameWithCurrentEvent:(id)a3 previousEvent:(id)a4
{
  id v5 = a3;
  if ([a4 isAllDay])
  {
    v6 = +[CUIKSaveOperation changedTimeActionName:v5];
  }
  else
  {
    v7 = CUIKBundle();
    v8 = [v7 localizedStringForKey:@"Action: Make “%@” All-Day" value:@"Make “%@” All-Day" table:0];

    v9 = NSString;
    v10 = [v5 title];
    v6 = objc_msgSend(v9, "localizedStringWithFormat:", v8, v10);
  }

  return v6;
}

+ (id)changedCompletionActionName:(id)a3
{
  id v3 = a3;
  int v4 = [v3 completed];
  id v5 = CUIKBundle();
  v6 = v5;
  if (v4)
  {
    v7 = @"Action: Mark “%@” Complete";
    v8 = @"Mark “%@” Complete";
  }
  else
  {
    v7 = @"Action: Mark “%@” Incomplete";
    v8 = @"Mark “%@” Incomplete";
  }
  v9 = [v5 localizedStringForKey:v7 value:v8 table:0];

  v10 = NSString;
  v11 = [v3 title];

  v12 = objc_msgSend(v10, "localizedStringWithFormat:", v9, v11);

  return v12;
}

+ (id)changedTravelTimeActionNameWithCurrentEvent:(id)a3 previousEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = CUIKBundle();
  v8 = [v7 localizedStringForKey:@"Action: Add Travel Time for “%@”" value:@"Add Travel Time for “%@”" table:0];

  v9 = CUIKBundle();
  v10 = [v9 localizedStringForKey:@"Action: Remove Travel Time for “%@”" value:@"Remove Travel Time for “%@”" table:0];

  v11 = CUIKBundle();
  v12 = [v11 localizedStringForKey:@"Action: Change Travel Time for “%@”" value:@"Change Travel Time for “%@”" table:0];

  v13 = [v5 title];
  [v6 travelTime];
  if (v14 != 0.0 || ([v5 travelTime], v15 = v8, v16 == 0.0))
  {
    [v6 travelTime];
    if (v17 == 0.0 || ([v5 travelTime], v15 = v10, v18 != 0.0)) {
      v15 = v12;
    }
  }
  v19 = objc_msgSend(NSString, "localizedStringWithFormat:", v15, v13);

  return v19;
}

+ (id)changedRecurrenceRuleActionNameWithCurrentEvent:(id)a3 previousEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = CUIKBundle();
  v8 = [v7 localizedStringForKey:@"Action: Add Repeat for “%@”" value:@"Add Repeat for “%@”" table:0];

  v9 = CUIKBundle();
  v10 = [v9 localizedStringForKey:@"Action: Remove Repeat for “%@”" value:@"Remove Repeat for “%@”" table:0];

  v11 = CUIKBundle();
  v12 = [v11 localizedStringForKey:@"Action: Change Repeat for “%@”" value:@"Change Repeat for “%@”" table:0];

  v13 = [v5 title];
  double v14 = [v6 recurrenceRules];
  if (v14)
  {
  }
  else
  {
    double v16 = [v5 recurrenceRules];

    v15 = v8;
    if (v16) {
      goto LABEL_7;
    }
  }
  uint64_t v17 = objc_msgSend(v6, "recurrenceRules", v15);
  if (!v17
    || (double v18 = (void *)v17,
        [v5 recurrenceRules],
        v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        v15 = v10,
        v19))
  {
    v15 = v12;
  }
LABEL_7:
  v20 = objc_msgSend(NSString, "localizedStringWithFormat:", v15, v13);

  return v20;
}

+ (id)changedLocationActionNameWithCurrentEvent:(id)a3 previousEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = CUIKBundle();
  v8 = [v7 localizedStringForKey:@"Action: Add Location to “%@”" value:@"Add Location to “%@”" table:0];

  v9 = CUIKBundle();
  v10 = [v9 localizedStringForKey:@"Action: Remove Location from “%@”" value:@"Remove Location from “%@”" table:0];

  v11 = CUIKBundle();
  v12 = [v11 localizedStringForKey:@"Action: Change Location of “%@”" value:@"Change Location of “%@”" table:0];

  v13 = [v5 title];
  double v14 = [v6 location];
  if (v14)
  {
  }
  else
  {
    double v16 = [v5 location];

    v15 = v8;
    if (v16) {
      goto LABEL_7;
    }
  }
  uint64_t v17 = objc_msgSend(v6, "location", v15);
  if (!v17
    || (double v18 = (void *)v17,
        [v5 location],
        v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        v15 = v10,
        v19))
  {
    v15 = v12;
  }
LABEL_7:
  v20 = objc_msgSend(NSString, "localizedStringWithFormat:", v15, v13);

  return v20;
}

+ (id)changedColorOfCalendar:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = CUIKBundle();
  id v6 = [v5 localizedStringForKey:@"Action: Change Calendar Color" value:@"Change Color of “%@”" table:0];
  v7 = [v4 title];

  v8 = objc_msgSend(v3, "localizedStringWithFormat:", v6, v7);

  return v8;
}

+ (id)changedTitleOfCalendar:(id)a3
{
  id v3 = a3;
  if ([v3 allowedEntityTypes])
  {
    id v5 = CUIKBundle();
    id v6 = [v5 localizedStringForKey:@"Action: Rename calendar to “%@”" value:@"Rename calendar to “%@”" table:0];

    v7 = NSString;
    v8 = [v3 title];
    id v4 = objc_msgSend(v7, "localizedStringWithFormat:", v6, v8);
  }
  else
  {
    if (([v3 allowedEntityTypes] & 2) == 0)
    {
      id v4 = 0;
      goto LABEL_7;
    }
    id v6 = CUIKBundle();
    id v4 = [v6 localizedStringForKey:@"Action: Rename List" value:@"Rename List" table:0];
  }

LABEL_7:

  return v4;
}

- (id)_actionName
{
  id v3 = [(CUIKUserOperation *)self objects];
  if ([v3 count] != 1)
  {

    goto LABEL_8;
  }
  id v4 = [(CUIKUserOperation *)self objects];
  id v5 = [v4 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_8:
    double v16 = +[CUIKSaveOperation multipleEventsChangedActionName];
    goto LABEL_9;
  }
  v7 = [(CUIKUserOperation *)self objects];
  v8 = [v7 firstObject];

  v9 = [v8 shallowCopyWithoutChanges];
  v10 = [MEMORY[0x1E4F25590] diffSummaryBetweenObject:v9 andObject:v8];
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  v12 = [v10 allKeys];
  v13 = [v11 setWithArray:v12];

  double v14 = +[CUIKLogSubsystem userActions];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    [(CUIKSaveOperation *)(uint64_t)v13 _actionName];
  }

  if ([v13 containsObject:*MEMORY[0x1E4F25360]])
  {
    uint64_t v15 = +[CUIKSaveOperation changedAllDayActionNameWithCurrentEvent:v8 previousEvent:v9];
LABEL_14:
    double v16 = (void *)v15;
    int v18 = 1;
    goto LABEL_27;
  }
  if ([v13 containsObject:*MEMORY[0x1E4F253A0]])
  {
    uint64_t v15 = +[CUIKSaveOperation changedCalendarActionName:v8];
    goto LABEL_14;
  }
  v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F25418], *MEMORY[0x1E4F253B8], 0);
  if (![v13 isSubsetOfSet:v19])
  {
    uint64_t v20 = *MEMORY[0x1E4F25348];
    uint64_t v21 = *MEMORY[0x1E4F25350];
    uint64_t v22 = *MEMORY[0x1E4F25358];
    v23 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F25348], *MEMORY[0x1E4F25350], *MEMORY[0x1E4F25358], 0);
    if ((unint64_t)[v10 count] >= 2 && objc_msgSend(v13, "isSubsetOfSet:", v23)) {
      goto LABEL_19;
    }
    if ([v10 count] != 1)
    {
      uint64_t v24 = +[CUIKSaveOperation genericEventChangedActionName:v8];
      goto LABEL_24;
    }
    v25 = [v10 objectForKey:*MEMORY[0x1E4F25428]];

    if (v25)
    {
      uint64_t v24 = +[CUIKSaveOperation changedTitleActionName:v8];
      goto LABEL_24;
    }
    v26 = [v10 objectForKey:*MEMORY[0x1E4F253D0]];

    if (v26)
    {
      uint64_t v24 = +[CUIKSaveOperation changedLocationActionNameWithCurrentEvent:v8 previousEvent:v9];
      goto LABEL_24;
    }
    v27 = [v10 objectForKey:*MEMORY[0x1E4F25430]];

    if (v27)
    {
      uint64_t v24 = +[CUIKSaveOperation changedTravelTimeActionNameWithCurrentEvent:v8 previousEvent:v9];
      goto LABEL_24;
    }
    v28 = [v10 objectForKey:*MEMORY[0x1E4F25420]];

    if (v28)
    {
      uint64_t v24 = +[CUIKSaveOperation changedTimeZoneActionName:v8];
      goto LABEL_24;
    }
    v29 = [v10 objectForKey:*MEMORY[0x1E4F253F0]];

    if (v29)
    {
      uint64_t v24 = +[CUIKSaveOperation changedRecurrenceRuleActionNameWithCurrentEvent:v8 previousEvent:v9];
      goto LABEL_24;
    }
    v30 = [v10 objectForKey:*MEMORY[0x1E4F25398]];

    if (v30)
    {
      uint64_t v24 = +[CUIKSaveOperation changedAvailablityActionName:v8];
      goto LABEL_24;
    }
    v31 = [v10 objectForKey:*MEMORY[0x1E4F253E8]];

    if (v31)
    {
      uint64_t v24 = +[CUIKSaveOperation changedPrivacyActionName:v8];
      goto LABEL_24;
    }
    v32 = [v10 objectForKey:*MEMORY[0x1E4F253D8]];

    if (v32)
    {
      uint64_t v24 = +[CUIKSaveOperation changedNotesActionName:v8];
      goto LABEL_24;
    }
    v33 = [v10 objectForKey:*MEMORY[0x1E4F25438]];

    if (v33)
    {
      uint64_t v24 = +[CUIKSaveOperation changedURLActionName:v8];
      goto LABEL_24;
    }
    v34 = [v10 objectForKey:v20];

    if (v34)
    {
      uint64_t v24 = +[CUIKSaveOperation alarmsAddedActionName:v8];
      goto LABEL_24;
    }
    v35 = [v10 objectForKey:v21];

    if (v35)
    {
LABEL_19:
      uint64_t v24 = +[CUIKSaveOperation alarmsModifiedActionName:v8];
    }
    else
    {
      v36 = [v10 objectForKey:v22];

      if (v36)
      {
        uint64_t v24 = +[CUIKSaveOperation alarmsRemovedActionName:v8];
      }
      else
      {
        v37 = [v10 objectForKey:*MEMORY[0x1E4F25368]];

        if (v37)
        {
          uint64_t v24 = +[CUIKSaveOperation attachmentsAddedActionName:v8];
        }
        else
        {
          v38 = [v10 objectForKey:*MEMORY[0x1E4F25378]];

          if (v38)
          {
            uint64_t v24 = +[CUIKSaveOperation attachmentsRemovedActionName:v8];
          }
          else
          {
            v39 = [v10 objectForKey:*MEMORY[0x1E4F25370]];

            if (v39)
            {
              uint64_t v24 = +[CUIKSaveOperation attachmentsModifiedActionName:v8];
            }
            else
            {
              v40 = [v10 objectForKey:*MEMORY[0x1E4F25380]];

              if (v40)
              {
                uint64_t v24 = +[CUIKSaveOperation attendeesAddedActionName:v8];
              }
              else
              {
                v41 = [v10 objectForKey:*MEMORY[0x1E4F25390]];

                if (v41)
                {
                  uint64_t v24 = +[CUIKSaveOperation attendeesRemovedActionName:v8];
                }
                else
                {
                  v42 = [v10 objectForKey:*MEMORY[0x1E4F25388]];

                  if (v42)
                  {
                    uint64_t v24 = +[CUIKSaveOperation attendeesModifiedActionName:v8];
                  }
                  else
                  {
                    v43 = [v10 objectForKey:*MEMORY[0x1E4F253E0]];

                    if (v43)
                    {
                      uint64_t v24 = +[CUIKSaveOperation changedParticipationStatusActionName:v8];
                    }
                    else
                    {
                      v44 = [v10 objectForKey:*MEMORY[0x1E4F253F8]];

                      if (v44)
                      {
                        uint64_t v24 = +[CUIKSaveOperation changedResponseCommentActionName:v8];
                      }
                      else
                      {
                        v45 = [v10 objectForKey:*MEMORY[0x1E4F253A8]];

                        if (v45)
                        {
                          uint64_t v24 = +[CUIKSaveOperation changedColorOfCalendar:v8];
                        }
                        else
                        {
                          v46 = [v10 objectForKey:*MEMORY[0x1E4F253B0]];

                          if (v46)
                          {
                            uint64_t v24 = +[CUIKSaveOperation changedTitleOfCalendar:v8];
                          }
                          else
                          {
                            v47 = [v10 objectForKey:*MEMORY[0x1E4F25400]];

                            if (v47)
                            {
                              uint64_t v24 = +[CUIKSaveOperation shareesAddedActionName:v8];
                            }
                            else
                            {
                              v48 = [v10 objectForKey:*MEMORY[0x1E4F25410]];

                              if (v48)
                              {
                                uint64_t v24 = +[CUIKSaveOperation shareesRemovedActionName:v8];
                              }
                              else
                              {
                                v49 = [v10 objectForKey:*MEMORY[0x1E4F25408]];

                                if (v49)
                                {
                                  uint64_t v24 = +[CUIKSaveOperation shareesModifiedActionName:v8];
                                }
                                else
                                {
                                  double v16 = [v10 objectForKey:*MEMORY[0x1E4F253C8]];

                                  if (!v16)
                                  {
                                    int v18 = 0;
                                    goto LABEL_25;
                                  }
                                  uint64_t v24 = +[CUIKSaveOperation changedCompletionActionName:v8];
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_24:
    double v16 = (void *)v24;
    int v18 = 1;
LABEL_25:

    goto LABEL_26;
  }
  double v16 = +[CUIKSaveOperation changedTimeActionName:v8];
  int v18 = 1;
LABEL_26:

LABEL_27:
  if (!v18) {
    goto LABEL_8;
  }
LABEL_9:

  return v16;
}

- (int64_t)_spanForObject:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CUIKUserOperation *)self span];
  id v6 = [(CUIKSaveOperation *)self objectsRequiringAlteredSpan];
  v7 = [v4 uniqueIdentifier];
  v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    v9 = [(CUIKSaveOperation *)self objectsRequiringAlteredSpan];
    v10 = [v4 uniqueIdentifier];
    v11 = [v9 objectForKeyedSubscript:v10];
    int64_t v5 = [v11 integerValue];
  }
  return v5;
}

- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(CUIKUserOperation *)self _precomputeActionName];
  [(CUIKSaveOperation *)self _storePreviousState];
  [(CUIKUserOperation *)self _precomputeInverseOperation];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v23 = self;
  id obj = [(CUIKUserOperation *)self objects];
  uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v25)
  {
    uint64_t v22 = *(void *)v27;
    char v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v26 + 1) + 8 * i);
        v9 = v8;
        if (v5)
        {
          id v10 = [v5 objectToSaveForUndoingChangeToObject:v8];

          v9 = v8;
          if (v10 != v8)
          {
            [v10 addChangesFromObject:v8 copyingBackingObjects:0];
            v9 = v10;
          }
        }
        uint64_t v11 = [(CUIKSaveOperation *)v23 _spanForObject:v9];
        v12 = [v9 specificIdentifier];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          char v13 = [v9 isUndetached];
        }
        else {
          char v13 = 0;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v14 = [v9 isDetached];
        }
        else {
          int v14 = 0;
        }
        char v15 = objc_msgSend(v9, "CUIKEditingContext_saveWithSpan:error:", v11, a4);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ((v14 | [v9 isDetached] ^ 1) & 1) == 0)
        {
          id v16 = [v5 objectToSaveForRevertingChangeToObject:v8];
          uint64_t v17 = v16;
          if (v16 != v8) {
            [v16 addChangesFromObject:v8 copyingBackingObjects:0];
          }
          [v5 setRevertObject:v17 forSpecificIdentifier:v12];
        }
        if ((v13 & 1) == 0)
        {
          int v18 = [v9 specificIdentifier];
          char v19 = [v18 isEqualToString:v12];

          if ((v19 & 1) == 0) {
            [v5 setUndoObject:v9 forSpecificIdentifier:v12];
          }
        }
        v6 &= v15;
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v25);
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (void)_storePreviousState
{
  [(CUIKSaveOperation *)self _storePreviousObjects];

  [(CUIKUserOperation *)self _storeOriginalSliceDescriptions];
}

- (void)_storePreviousObjects
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(CUIKUserOperation *)self objects];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v6 = [(CUIKUserOperation *)self objects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) previouslySavedCopy];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(CUIKSaveOperation *)self setPreviousObjects:v5];
}

- (Class)_inverseOperationClass
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(CUIKUserOperation *)self span] == 4)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v3 = [(CUIKUserOperation *)self objects];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v26;
      while (2)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v26 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * v7);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v9 = [v8 detachedItems];
            uint64_t v10 = [v9 count];

            if (v10)
            {

              goto LABEL_28;
            }
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
  }
  else if ([(CUIKUserOperation *)self span])
  {
LABEL_28:
    char v19 = 0;
    goto LABEL_29;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v11 = [(CUIKUserOperation *)self objects];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v16;
          if (([v17 hasRecurrenceRuleAdditionOrRemoval] & 1) != 0
            || ([v17 hasCalendarChangeThatRequiresDeleteAndAdd] & 1) != 0)
          {

LABEL_27:
            goto LABEL_28;
          }
          char v18 = [v17 requiresDetach];

          if (v18) {
            goto LABEL_27;
          }
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  char v19 = objc_opt_class();
LABEL_29:

  return (Class)v19;
}

- (id)_inverseOperation
{
  v7.receiver = self;
  v7.super_class = (Class)CUIKSaveOperation;
  id v3 = [(CUIKUserOperation *)&v7 _inverseOperation];
  if ([(CUIKUserOperation *)self span])
  {
    uint64_t v4 = [(CUIKUserOperation *)self actionName];
    [v3 setPrecomputedActionName:v4];
  }
  else
  {
    uint64_t v5 = [v3 objects];
    uint64_t v4 = [(CUIKSaveOperation *)self _objectsRequiringAlteredSpan:v5];

    [v3 setObjectsRequiringAlteredSpan:v4];
  }

  return v3;
}

- (id)_objectsRequiringAlteredSpan:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v10, "hasChangesRequiringSpanAll", (void)v13))
        {
          uint64_t v11 = [v10 uniqueIdentifier];
          [v4 setObject:&unk_1F1891F70 forKeyedSubscript:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_objectsForInverse
{
  if ([(CUIKUserOperation *)self span] && [(CUIKUserOperation *)self span] != 4)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"CUIKSaveOperation.m", 601, @"Undo for slice operations isn't supported, and we never should have reached this point" object file lineNumber description];

    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [(CUIKSaveOperation *)self _invertedNonSliceObjects];
  }

  return v4;
}

- (id)_invertedNonSliceObjects
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v4 = [(CUIKUserOperation *)self objects];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  uint64_t v6 = [(CUIKUserOperation *)self objects];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
LABEL_16:
    id v29 = v5;
    goto LABEL_19;
  }
  unint64_t v8 = 0;
  uint64_t v33 = *MEMORY[0x1E4F56C80];
  uint64_t v31 = *MEMORY[0x1E4F56BA0];
  v32 = v5;
  while (1)
  {
    uint64_t v9 = [(CUIKUserOperation *)self objects];
    uint64_t v10 = [v9 objectAtIndexedSubscript:v8];

    uint64_t v11 = [(CUIKSaveOperation *)self previousObjects];
    uint64_t v12 = [v11 objectAtIndexedSubscript:v8];

    id v34 = 0;
    long long v13 = [v10 inverseObjectWithObject:v12 diff:&v34];
    id v14 = v34;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    id v15 = v12;
    long long v16 = [v14 differentRelationshipMultiValueKeys];
    int v17 = [v16 containsObject:v33];

    if (v17) {
      break;
    }
LABEL_7:
    long long v21 = [v14 relationshipMultiValueAdds];
    long long v22 = [v21 allKeys];
    char v23 = [v22 containsObject:v31];

    if (v23) {
      goto LABEL_18;
    }
    int64_t v24 = [(CUIKSaveOperation *)self _spanForObject:v10];
    if (([v15 isDetached] & 1) == 0
      && [v15 isOrWasPartOfRecurringSeries]
      && !v24
      && ([v10 isUndetached] & 1) == 0)
    {
      long long v27 = [v15 startDate];
      long long v28 = [v15 endDateUnadjustedForLegacyClients];
      [v13 markAsUndetachedWithStartDate:v27 endDate:v28];
    }
    id v5 = v32;
LABEL_10:
    [v5 addObject:v13];

    ++v8;
    long long v25 = [(CUIKUserOperation *)self objects];
    unint64_t v26 = [v25 count];

    if (v26 <= v8) {
      goto LABEL_16;
    }
  }
  uint64_t v18 = [v15 attendees];
  if (![v18 count])
  {
    char v19 = [v15 detachedItems];
    uint64_t v20 = [v19 count];

    if (v20) {
      goto LABEL_18;
    }
    goto LABEL_7;
  }

LABEL_18:
  id v29 = 0;
  id v5 = v32;
LABEL_19:

  return v29;
}

- (NSArray)previousObjects
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPreviousObjects:(id)a3
{
}

- (NSArray)previousSliceInfo
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPreviousSliceInfo:(id)a3
{
}

- (NSDictionary)objectsRequiringAlteredSpan
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setObjectsRequiringAlteredSpan:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsRequiringAlteredSpan, 0);
  objc_storeStrong((id *)&self->_previousSliceInfo, 0);

  objc_storeStrong((id *)&self->_previousObjects, 0);
}

- (void)_actionName
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_DEBUG, "Changes: %@", (uint8_t *)&v2, 0xCu);
}

@end