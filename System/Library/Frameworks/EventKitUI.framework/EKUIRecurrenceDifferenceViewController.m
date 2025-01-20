@interface EKUIRecurrenceDifferenceViewController
+ (BOOL)shouldShowRecurrenceDiff:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (EKUIRecurrenceDifferenceViewController)initWithEvent:(id)a3 andSummary:(id)a4;
- (id)dateTimeStringForEvent:(id)a3;
- (id)descriptionForDiffType:(int64_t)a3 row:(BOOL)a4;
- (id)stringForAlarms:(id)a3;
- (id)stringForAttendees:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)titleForDiffType:(int64_t)a3;
- (int64_t)diffTypeForIndexPath:(id)a3;
- (int64_t)diffTypeForSection:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)rowCountForDiffType:(int64_t)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)findSemanticAlarmDifferenceFromOriginal:(id)a3;
- (void)findSemanticAttendeeDifferenceFromOriginal:(id)a3;
- (void)loadView;
- (void)revertChangeForDiffType:(int64_t)a3 row:(int64_t)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
@end

@implementation EKUIRecurrenceDifferenceViewController

- (EKUIRecurrenceDifferenceViewController)initWithEvent:(id)a3 andSummary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EKUIRecurrenceDifferenceViewController;
  v9 = [(EKUIRecurrenceDifferenceViewController *)&v13 initWithStyle:2];
  if (v9)
  {
    v10 = EventKitUIBundle();
    v11 = [v10 localizedStringForKey:@"Event Changes" value:&stru_1F0CC2140 table:0];
    [(EKUIRecurrenceDifferenceViewController *)v9 setTitle:v11];

    objc_storeStrong((id *)&v9->_event, a3);
    objc_storeStrong((id *)&v9->_diffSummary, a4);
    [(EKUIRecurrenceDifferenceViewController *)v9 findSemanticAlarmDifferenceFromOriginal:v9->_event];
    [(EKUIRecurrenceDifferenceViewController *)v9 findSemanticAttendeeDifferenceFromOriginal:v9->_event];
  }

  return v9;
}

+ (BOOL)shouldShowRecurrenceDiff:(id)a3
{
  id v3 = a3;
  if (shouldShowRecurrenceDiff__onceToken != -1) {
    dispatch_once(&shouldShowRecurrenceDiff__onceToken, &__block_literal_global_30);
  }
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__EKUIRecurrenceDifferenceViewController_shouldShowRecurrenceDiff___block_invoke_2;
  v6[3] = &unk_1E60897C0;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __67__EKUIRecurrenceDifferenceViewController_shouldShowRecurrenceDiff___block_invoke()
{
  v12[18] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F253D0];
  v12[0] = *MEMORY[0x1E4F25428];
  v12[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F25418];
  v12[2] = *MEMORY[0x1E4F25360];
  v12[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F25420];
  v12[4] = *MEMORY[0x1E4F253B8];
  v12[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F25430];
  v12[6] = *MEMORY[0x1E4F253C0];
  v12[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F253E8];
  v12[8] = *MEMORY[0x1E4F25398];
  v12[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F25438];
  v12[10] = *MEMORY[0x1E4F253D8];
  v12[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F25358];
  v12[12] = *MEMORY[0x1E4F25348];
  v12[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F25380];
  v12[14] = *MEMORY[0x1E4F25350];
  v12[15] = v7;
  uint64_t v8 = *MEMORY[0x1E4F25388];
  v12[16] = *MEMORY[0x1E4F25390];
  v12[17] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:18];
  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  v11 = (void *)shouldShowRecurrenceDiff__changesToShowDiffFor;
  shouldShowRecurrenceDiff__changesToShowDiffFor = v10;
}

uint64_t __67__EKUIRecurrenceDifferenceViewController_shouldShowRecurrenceDiff___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [(id)shouldShowRecurrenceDiff__changesToShowDiffFor containsObject:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)loadView
{
  v29.receiver = self;
  v29.super_class = (Class)EKUIRecurrenceDifferenceViewController;
  [(EKUIRecurrenceDifferenceViewController *)&v29 loadView];
  uint64_t v4 = (NSMutableArray *)objc_opt_new();
  changedRows = self->_changedRows;
  self->_changedRows = v4;

  uint64_t v6 = [(NSDictionary *)self->_diffSummary allKeys];
  int v7 = [v6 containsObject:*MEMORY[0x1E4F25428]];

  if (v7) {
    [(NSMutableArray *)self->_changedRows addObject:&unk_1F0D03730];
  }
  uint64_t v8 = [(NSDictionary *)self->_diffSummary allKeys];
  int v9 = [v8 containsObject:*MEMORY[0x1E4F253D0]];

  if (v9) {
    [(NSMutableArray *)self->_changedRows addObject:&unk_1F0D03748];
  }
  uint64_t v10 = [(NSDictionary *)self->_diffSummary allKeys];
  if ([v10 containsObject:*MEMORY[0x1E4F25360]]) {
    goto LABEL_12;
  }
  v11 = [(NSDictionary *)self->_diffSummary allKeys];
  if ([v11 containsObject:*MEMORY[0x1E4F25418]])
  {
LABEL_11:

LABEL_12:
LABEL_13:
    [(NSMutableArray *)self->_changedRows addObject:&unk_1F0D03760];
    goto LABEL_14;
  }
  uint64_t v2 = [(NSDictionary *)self->_diffSummary allKeys];
  if ([v2 containsObject:*MEMORY[0x1E4F253B8]])
  {
LABEL_10:

    goto LABEL_11;
  }
  v12 = [(NSDictionary *)self->_diffSummary allKeys];
  if ([v12 containsObject:*MEMORY[0x1E4F25420]])
  {

    goto LABEL_10;
  }
  v27 = [(NSDictionary *)self->_diffSummary allKeys];
  char v28 = [v27 containsObject:*MEMORY[0x1E4F253C0]];

  if (v28) {
    goto LABEL_13;
  }
LABEL_14:
  objc_super v13 = [(NSDictionary *)self->_diffSummary allKeys];
  int v14 = [v13 containsObject:*MEMORY[0x1E4F25430]];

  if (v14) {
    [(NSMutableArray *)self->_changedRows addObject:&unk_1F0D03778];
  }
  v15 = [(NSDictionary *)self->_diffSummary allKeys];
  int v16 = [v15 containsObject:*MEMORY[0x1E4F25398]];

  if (v16) {
    [(NSMutableArray *)self->_changedRows addObject:&unk_1F0D03790];
  }
  v17 = [(NSDictionary *)self->_diffSummary allKeys];
  int v18 = [v17 containsObject:*MEMORY[0x1E4F253D8]];

  if (v18) {
    [(NSMutableArray *)self->_changedRows addObject:&unk_1F0D037A8];
  }
  v19 = [(NSDictionary *)self->_diffSummary allKeys];
  v20 = (void *)[v19 containsObject:*MEMORY[0x1E4F25438]];

  if (v20)
  {
    v21 = [(EKEvent *)self->_event URL];
    if (!v21)
    {
      v20 = [(EKEvent *)self->_event originalItem];
      uint64_t v22 = [v20 URL];
      if (!v22)
      {

        goto LABEL_30;
      }
      uint64_t v2 = (void *)v22;
    }
    v23 = [(EKEvent *)self->_event URL];
    v24 = [(EKEvent *)self->_event originalItem];
    v25 = [v24 URL];
    char v26 = [v23 isEqual:v25];

    if (v21)
    {

      if (v26) {
        goto LABEL_30;
      }
      goto LABEL_28;
    }

    if ((v26 & 1) == 0) {
LABEL_28:
    }
      [(NSMutableArray *)self->_changedRows addObject:&unk_1F0D037C0];
  }
LABEL_30:
  if ([(NSArray *)self->_attendeesAdded count] || [(NSArray *)self->_attendeesRemoved count]) {
    [(NSMutableArray *)self->_changedRows addObject:&unk_1F0D037D8];
  }
  if ([(NSArray *)self->_alarmsAdded count] || [(NSArray *)self->_alarmsRemoved count]) {
    [(NSMutableArray *)self->_changedRows addObject:&unk_1F0D037F0];
  }
}

- (id)titleForDiffType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      uint64_t v3 = EventKitUIBundle();
      uint64_t v4 = v3;
      uint64_t v5 = @"Title";
      goto LABEL_12;
    case 1:
      uint64_t v3 = EventKitUIBundle();
      uint64_t v4 = v3;
      uint64_t v5 = @"Location";
      goto LABEL_12;
    case 2:
      uint64_t v3 = EventKitUIBundle();
      uint64_t v4 = v3;
      uint64_t v5 = @"Date and Time";
      goto LABEL_12;
    case 3:
      uint64_t v3 = EventKitUIBundle();
      uint64_t v4 = v3;
      uint64_t v5 = @"Travel Time";
      goto LABEL_12;
    case 4:
      uint64_t v3 = EventKitUIBundle();
      uint64_t v4 = v3;
      uint64_t v5 = @"Availability";
      goto LABEL_12;
    case 5:
      uint64_t v3 = EventKitUIBundle();
      uint64_t v4 = v3;
      uint64_t v5 = @"Notes";
      goto LABEL_12;
    case 6:
      uint64_t v3 = EventKitUIBundle();
      uint64_t v4 = v3;
      uint64_t v5 = @"URL";
      goto LABEL_12;
    case 7:
      uint64_t v3 = EventKitUIBundle();
      uint64_t v4 = v3;
      uint64_t v5 = @"Alarms";
      goto LABEL_12;
    case 8:
      uint64_t v3 = EventKitUIBundle();
      uint64_t v4 = v3;
      uint64_t v5 = @"Attendees";
LABEL_12:
      uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_1F0CC2140 table:0];

      break;
    default:
      uint64_t v6 = 0;
      break;
  }

  return v6;
}

- (int64_t)rowCountForDiffType:(int64_t)a3
{
  uint64_t v5 = [(EKEvent *)self->_event originalItem];
  int64_t v6 = 2;
  switch(a3)
  {
    case 0:
    case 2:
    case 4:
      break;
    case 1:
      int v7 = [(EKEvent *)self->_event location];
      uint64_t v8 = [v7 length];
      int v9 = [v5 location];
      goto LABEL_8;
    case 3:
      [(EKEvent *)self->_event travelTime];
      double v11 = v10;
      [v5 travelTime];
      if (v11 <= 0.0) {
        int64_t v6 = v12 > 0.0;
      }
      else {
        int64_t v6 = (v12 > 0.0) + 1;
      }
      break;
    case 5:
      int v7 = [(EKEvent *)self->_event displayNotes];
      uint64_t v8 = [v7 length];
      int v9 = [v5 displayNotes];
LABEL_8:
      objc_super v13 = v9;
      uint64_t v14 = [v9 length];
      if (v8) {
        int64_t v6 = (v14 != 0) + 1;
      }
      else {
        int64_t v6 = v14 != 0;
      }
      goto LABEL_15;
    case 6:
      int v7 = [(EKEvent *)self->_event URL];
      objc_super v13 = [v7 absoluteString];
      uint64_t v15 = [v13 length];
      int v16 = [v5 URL];
      v17 = [v16 absoluteString];
      uint64_t v18 = [v17 length];
      if (v15) {
        int64_t v6 = (v18 != 0) + 1;
      }
      else {
        int64_t v6 = v18 != 0;
      }

LABEL_15:
      break;
    case 7:
      NSUInteger v19 = [(NSArray *)self->_alarmsAdded count];
      uint64_t v20 = 1056;
      goto LABEL_18;
    case 8:
      NSUInteger v19 = [(NSArray *)self->_attendeesAdded count];
      uint64_t v20 = 1072;
LABEL_18:
      uint64_t v21 = [*(id *)((char *)&self->super.super.super.super.isa + v20) count];
      if (v19) {
        int64_t v6 = (v21 != 0) + 1;
      }
      else {
        int64_t v6 = v21 != 0;
      }
      break;
    default:
      int64_t v6 = 0;
      break;
  }

  return v6;
}

- (id)dateTimeStringForEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKUIRecurrenceDifferenceViewController *)self traitCollection];
  unint64_t v6 = [v5 horizontalSizeClass];

  id v17 = 0;
  id v18 = 0;
  if (v6 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6;
  }
  id v15 = 0;
  id v16 = 0;
  CalDetailStringsForCalendarEvent(v4, v7, &v18, &v17, &v16, &v15, 0, 0);

  id v8 = v18;
  id v9 = v17;
  unint64_t v10 = (unint64_t)v16;
  unint64_t v11 = (unint64_t)v15;
  double v12 = objc_opt_new();
  objc_super v13 = v12;
  if (v8)
  {
    [v12 appendString:v8];
    if (!v9 && !v10 && !v11) {
      goto LABEL_17;
    }
    [v13 appendString:@"\n"];
  }
  if (v9)
  {
    [v13 appendString:v9];
    if (!(v10 | v11)) {
      goto LABEL_17;
    }
    [v13 appendString:@"\n"];
  }
  if (v10)
  {
    [v13 appendString:v10];
    if (!v11) {
      goto LABEL_17;
    }
    [v13 appendString:@"\n"];
  }
  else if (!v11)
  {
    goto LABEL_17;
  }
  [v13 appendString:v11];
LABEL_17:

  return v13;
}

- (void)findSemanticAlarmDifferenceFromOriginal:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v5 = [v3 alarms];
  v30 = [v4 arrayWithArray:v5];

  unint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
  v25 = v3;
  uint64_t v7 = [v3 originalItem];
  id v8 = [v7 alarms];
  id v9 = [v6 arrayWithArray:v8];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v27 = v9;
  obuint64_t j = (id)[(NSArray *)v9 copy];
  uint64_t v29 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        double v12 = (void *)[(NSArray *)v30 copy];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v32;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v32 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = *(void **)(*((void *)&v31 + 1) + 8 * j);
              id v18 = [v11 semanticIdentifier];
              NSUInteger v19 = [v17 semanticIdentifier];
              int v20 = [v18 isEqualToString:v19];

              if (v20)
              {
                [(NSArray *)v27 removeObject:v11];
                [(NSArray *)v30 removeObject:v17];
                goto LABEL_16;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v29);
  }

  alarmsAdded = self->_alarmsAdded;
  self->_alarmsAdded = v30;
  uint64_t v22 = v30;

  alarmsRemoved = self->_alarmsRemoved;
  self->_alarmsRemoved = v27;
}

- (void)findSemanticAttendeeDifferenceFromOriginal:(id)a3
{
  long long v36 = self;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v5 = [v3 attendees];
  v43 = [v4 arrayWithArray:v5];

  unint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v7 = [v3 originalItem];
  id v8 = [v7 attendees];
  id v9 = [v6 arrayWithArray:v8];

  uint64_t v41 = v3;
  long long v37 = [v3 selfAttendee];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v39 = v9;
  obuint64_t j = (id)[(NSArray *)v9 copy];
  uint64_t v42 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v42)
  {
    uint64_t v40 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v53 != v40) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        double v12 = (void *)[(NSArray *)v43 copy];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v57 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v49;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v49 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = *(void **)(*((void *)&v48 + 1) + 8 * j);
              id v18 = [v11 semanticIdentifier];
              NSUInteger v19 = [v17 semanticIdentifier];
              int v20 = [v18 isEqualToString:v19];

              if (v20)
              {
                [(NSArray *)v39 removeObject:v11];
                [(NSArray *)v43 removeObject:v17];
                goto LABEL_16;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v48 objects:v57 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
LABEL_16:

        if (([v41 isExternallyOrganizedInvitation] & 1) == 0)
        {
          uint64_t v21 = [v11 semanticIdentifier];
          uint64_t v22 = [v37 semanticIdentifier];
          int v23 = [v21 isEqualToString:v22];

          if (v23) {
            [(NSArray *)v39 removeObject:v11];
          }
        }
      }
      uint64_t v42 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v42);
  }

  if (([v41 isExternallyOrganizedInvitation] & 1) == 0)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v24 = (void *)[(NSArray *)v43 copy];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v45;
      while (2)
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v45 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void **)(*((void *)&v44 + 1) + 8 * k);
          v30 = objc_msgSend(v29, "semanticIdentifier", v36);
          long long v31 = [v37 semanticIdentifier];
          int v32 = [v30 isEqualToString:v31];

          if (v32)
          {
            [(NSArray *)v43 removeObject:v29];
            goto LABEL_32;
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v56 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }
LABEL_32:
  }
  attendeesAdded = v36->_attendeesAdded;
  v36->_attendeesAdded = v43;
  long long v34 = v43;

  attendeesRemoved = v36->_attendeesRemoved;
  v36->_attendeesRemoved = v39;
}

- (id)stringForAlarms:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__EKUIRecurrenceDifferenceViewController_stringForAlarms___block_invoke;
  v11[3] = &unk_1E60897E8;
  id v6 = v5;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v4;
  id v7 = v4;
  [v7 enumerateObjectsUsingBlock:v11];
  id v8 = v14;
  id v9 = v6;

  return v9;
}

uint64_t __58__EKUIRecurrenceDifferenceViewController_stringForAlarms___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  [a2 relativeOffset];
  id v7 = CalStringForRelativeOffset([*(id *)(*(void *)(a1 + 40) + 1024) isAllDay], v6);
  [v5 appendString:v7];

  uint64_t result = [*(id *)(a1 + 48) count];
  if (result - 1 > a3)
  {
    id v9 = *(void **)(a1 + 32);
    return [v9 appendString:@"\n"];
  }
  return result;
}

- (id)stringForAttendees:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__EKUIRecurrenceDifferenceViewController_stringForAttendees___block_invoke;
  v10[3] = &unk_1E6089810;
  id v5 = v4;
  id v11 = v5;
  id v12 = v3;
  id v6 = v3;
  [v6 enumerateObjectsUsingBlock:v10];
  id v7 = v12;
  id v8 = v5;

  return v8;
}

void __61__EKUIRecurrenceDifferenceViewController_stringForAttendees___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id v5 = [MEMORY[0x1E4F255C0] participantForSortingWithEKParticipant:a2];
  id v6 = *(void **)(a1 + 32);
  id v8 = v5;
  id v7 = [v5 displayName];
  [v6 appendString:v7];

  if ([*(id *)(a1 + 40) count] - 1 > a3) {
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
}

- (id)descriptionForDiffType:(int64_t)a3 row:(BOOL)a4
{
  v59[2] = *MEMORY[0x1E4F143B8];
  long long v53 = objc_opt_new();
  uint64_t v57 = *MEMORY[0x1E4FB06F8];
  uint64_t v7 = v57;
  id v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v59[0] = v8;
  uint64_t v58 = *MEMORY[0x1E4FB0700];
  uint64_t v9 = v58;
  unint64_t v10 = [MEMORY[0x1E4FB1618] labelColor];
  v59[1] = v10;
  long long v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:&v57 count:2];

  v55[0] = v7;
  id v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v55[1] = v9;
  v56[0] = v11;
  id v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v56[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];

  id v14 = self;
  uint64_t v15 = [(EKEvent *)self->_event originalItem];
  id v16 = v15;
  if (a4)
  {
    BOOL v17 = (unint64_t)(a3 - 7) >= 2;
    id v18 = v53;
    int64_t v19 = a3;
    int v20 = v14;
    if (v17)
    {
LABEL_8:
      id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v22 = EventKitUIBundle();
      int v23 = v22;
      v24 = @"This Occurrence:\n <no loc>";
      uint64_t v25 = @"This Occurrence:\n";
    }
    else
    {
LABEL_3:
      id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v22 = EventKitUIBundle();
      int v23 = v22;
      v24 = @"Removed:\n <no loc>";
      uint64_t v25 = @"Removed:\n";
    }
    v30 = [v22 localizedStringForKey:v24 value:v25 table:0];
    uint64_t v27 = (void *)v13;
    long long v31 = (void *)[v21 initWithString:v30 attributes:v13];
    int v28 = 0;
  }
  else
  {
    int64_t v19 = a3;
    id v18 = v53;
    int v20 = v14;
    switch((unint64_t)v14)
    {
      case 0uLL:
      case 2uLL:
      case 4uLL:
        goto LABEL_14;
      case 1uLL:
        uint64_t v26 = [(EKEvent *)v15 location];
        goto LABEL_13;
      case 3uLL:
        [(EKEvent *)v15 travelTime];
        if (v29 <= 0.0) {
          goto LABEL_8;
        }
        goto LABEL_14;
      case 5uLL:
        uint64_t v26 = [(EKEvent *)v15 displayNotes];
LABEL_13:
        long long v33 = v26;
        uint64_t v34 = [v26 length];

        if (v34) {
          goto LABEL_14;
        }
        goto LABEL_8;
      case 6uLL:
        long long v48 = [(EKEvent *)v15 URL];
        long long v49 = [v48 absoluteString];
        uint64_t v50 = [v49 length];

        if (!v50) {
          goto LABEL_8;
        }
LABEL_14:
        id v35 = objc_alloc(MEMORY[0x1E4F28B18]);
        long long v36 = EventKitUIBundle();
        long long v37 = [v36 localizedStringForKey:@"Original:\n <no loc>" value:@"Original:\n" table:0];
        uint64_t v27 = (void *)v13;
        long long v38 = (void *)[v35 initWithString:v37 attributes:v13];
        [v53 appendAttributedString:v38];

        int v28 = 0;
        event = v16;
        goto LABEL_15;
      case 7uLL:
        uint64_t v51 = 1048;
        goto LABEL_38;
      case 8uLL:
        uint64_t v51 = 1064;
LABEL_38:
        if (![*(id *)((char *)&v14->super.super.super.super.isa + v51) count]) {
          goto LABEL_3;
        }
        id v52 = objc_alloc(MEMORY[0x1E4F28B18]);
        int v23 = EventKitUIBundle();
        v30 = [v23 localizedStringForKey:@"Added:\n <no loc>" value:@"Added:\n" table:0];
        uint64_t v27 = (void *)v13;
        long long v31 = (void *)[v52 initWithString:v30 attributes:v13];
        int v28 = 1;
        break;
      default:
        uint64_t v27 = (void *)v13;
        int v28 = 0;
        id v18 = v53;
        int v20 = v14;
        goto LABEL_11;
    }
  }
  [v18 appendAttributedString:v31];

LABEL_11:
  event = v20->_event;
LABEL_15:
  v39 = event;
  uint64_t v40 = v39;
  switch(v19)
  {
    case 0:
      uint64_t v41 = [(EKEvent *)v39 title];
      goto LABEL_29;
    case 1:
    case 5:
      uint64_t v41 = [(EKEvent *)v39 location];
      goto LABEL_29;
    case 2:
      uint64_t v41 = [(EKUIRecurrenceDifferenceViewController *)v20 dateTimeStringForEvent:v39];
      goto LABEL_29;
    case 3:
      [(EKEvent *)v39 travelTime];
      uint64_t v41 = CUIKDisplayStringTravelTimeAndDuration();
      goto LABEL_29;
    case 4:
      [(EKEvent *)v39 availability];
      uint64_t v41 = CUIKDisplayStringForAvailability();
      goto LABEL_29;
    case 6:
      uint64_t v42 = [(EKEvent *)v39 URL];
      v43 = [v42 absoluteString];

      if (!v43) {
        break;
      }
      goto LABEL_30;
    case 7:
      long long v44 = &OBJC_IVAR___EKUIRecurrenceDifferenceViewController__alarmsRemoved;
      if (v28) {
        long long v44 = &OBJC_IVAR___EKUIRecurrenceDifferenceViewController__alarmsAdded;
      }
      uint64_t v41 = [(EKUIRecurrenceDifferenceViewController *)v20 stringForAlarms:*(Class *)((char *)&v20->super.super.super.super.isa + *v44)];
      goto LABEL_29;
    case 8:
      long long v45 = &OBJC_IVAR___EKUIRecurrenceDifferenceViewController__attendeesRemoved;
      if (v28) {
        long long v45 = &OBJC_IVAR___EKUIRecurrenceDifferenceViewController__attendeesAdded;
      }
      uint64_t v41 = [(EKUIRecurrenceDifferenceViewController *)v20 stringForAttendees:*(Class *)((char *)&v20->super.super.super.super.isa + *v45)];
LABEL_29:
      v43 = (void *)v41;
      if (v41)
      {
LABEL_30:
        long long v46 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v43 attributes:v54];
        [v18 appendAttributedString:v46];
      }
      break;
    default:
      break;
  }

  return v18;
}

- (void)revertChangeForDiffType:(int64_t)a3 row:(int64_t)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = [(EKEvent *)self->_event shallowCopyWithoutChanges];
  uint64_t v7 = [v6 originalItem];
  id v8 = v7;
  switch(a3)
  {
    case 0:
      uint64_t v9 = [v7 title];
      [v6 setTitle:v9];
      goto LABEL_63;
    case 1:
      uint64_t v9 = [v6 originalItem];
      unint64_t v10 = [(NSArray *)v9 structuredLocationWithoutPrediction];
      [v6 setStructuredLocationWithoutPrediction:v10];
      goto LABEL_5;
    case 2:
      id v11 = [v6 originalStartDate];
      [v6 setStartDate:v11];

      uint64_t v9 = [v6 startDate];
      [v8 duration];
      unint64_t v10 = -[NSArray dateByAddingTimeInterval:](v9, "dateByAddingTimeInterval:");
      [v6 setEndDate:v10];
LABEL_5:

      goto LABEL_63;
    case 3:
      [v7 travelTime];
      objc_msgSend(v6, "setTravelTime:");
      break;
    case 4:
      objc_msgSend(v6, "setAvailability:", objc_msgSend(v7, "availability"));
      break;
    case 5:
      uint64_t v9 = [v7 displayNotes];
      [v6 setDisplayNotes:v9];
      goto LABEL_63;
    case 6:
      uint64_t v9 = [v7 URL];
      [v6 setURL:v9];
      goto LABEL_63;
    case 7:
      if (a4 == 1 || ![(NSArray *)self->_alarmsAdded count])
      {
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        obuint64_t j = self->_alarmsRemoved;
        uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v73 objects:v82 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v74;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v74 != v25) {
                objc_enumerationMutation(obj);
              }
              [v6 addAlarm:*(void *)(*((void *)&v73 + 1) + 8 * i)];
            }
            uint64_t v24 = [(NSArray *)obj countByEnumeratingWithState:&v73 objects:v82 count:16];
          }
          while (v24);
        }
      }
      else
      {
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        obuint64_t j = [v6 alarms];
        uint64_t v49 = [(NSArray *)obj countByEnumeratingWithState:&v69 objects:v81 count:16];
        if (v49)
        {
          int64_t v43 = a4;
          long long v44 = v8;
          id v46 = *(id *)v70;
          do
          {
            for (uint64_t j = 0; j != v49; ++j)
            {
              if (*(id *)v70 != v46) {
                objc_enumerationMutation(obj);
              }
              uint64_t v13 = *(void **)(*((void *)&v69 + 1) + 8 * j);
              long long v65 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              long long v68 = 0u;
              id v14 = self->_alarmsAdded;
              uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v65 objects:v80 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v17 = *(void *)v66;
                do
                {
                  for (uint64_t k = 0; k != v16; ++k)
                  {
                    if (*(void *)v66 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    int64_t v19 = *(void **)(*((void *)&v65 + 1) + 8 * k);
                    int v20 = [v13 semanticIdentifier];
                    id v21 = [v19 semanticIdentifier];
                    int v22 = [v20 isEqualToString:v21];

                    if (v22) {
                      [v6 removeAlarm:v13];
                    }
                  }
                  uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v65 objects:v80 count:16];
                }
                while (v16);
              }
            }
            uint64_t v49 = [(NSArray *)obj countByEnumeratingWithState:&v69 objects:v81 count:16];
          }
          while (v49);
          a4 = v43;
          id v8 = v44;
        }
      }

      goto LABEL_37;
    case 8:
LABEL_37:
      if (a4 == 1 || ![(NSArray *)self->_attendeesAdded count])
      {
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v9 = self->_attendeesRemoved;
        uint64_t v38 = [(NSArray *)v9 countByEnumeratingWithState:&v61 objects:v79 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v62;
          do
          {
            for (uint64_t m = 0; m != v39; ++m)
            {
              if (*(void *)v62 != v40) {
                objc_enumerationMutation(v9);
              }
              [v6 addAttendee:*(void *)(*((void *)&v61 + 1) + 8 * m)];
            }
            uint64_t v39 = [(NSArray *)v9 countByEnumeratingWithState:&v61 objects:v79 count:16];
          }
          while (v39);
        }
LABEL_63:
      }
      else
      {
        long long v45 = v8;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v47 = [v6 attendees];
        id obja = (id)[v47 countByEnumeratingWithState:&v57 objects:v78 count:16];
        if (obja)
        {
          uint64_t v48 = *(void *)v58;
          do
          {
            for (n = 0; n != obja; n = (char *)n + 1)
            {
              if (*(void *)v58 != v48) {
                objc_enumerationMutation(v47);
              }
              int v28 = *(void **)(*((void *)&v57 + 1) + 8 * (void)n);
              long long v53 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              double v29 = self->_attendeesAdded;
              uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v53 objects:v77 count:16];
              if (v30)
              {
                uint64_t v31 = v30;
                uint64_t v32 = *(void *)v54;
                do
                {
                  for (iuint64_t i = 0; ii != v31; ++ii)
                  {
                    if (*(void *)v54 != v32) {
                      objc_enumerationMutation(v29);
                    }
                    uint64_t v34 = *(void **)(*((void *)&v53 + 1) + 8 * ii);
                    id v35 = [v28 semanticIdentifier];
                    long long v36 = [v34 semanticIdentifier];
                    int v37 = [v35 isEqualToString:v36];

                    if (v37) {
                      [v6 removeAttendee:v28];
                    }
                  }
                  uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v53 objects:v77 count:16];
                }
                while (v31);
              }
            }
            id obja = (id)[v47 countByEnumeratingWithState:&v57 objects:v78 count:16];
          }
          while (obja);
        }

        id v8 = v45;
      }
      break;
    default:
      break;
  }
  uint64_t v42 = [v6 eventStore];
  [v42 saveEvent:v6 span:0 error:0];
}

- (int64_t)diffTypeForSection:(int64_t)a3
{
  int64_t v3 = a3 - 1;
  if (a3 < 1 || [(NSMutableArray *)self->_changedRows count] < (unint64_t)a3) {
    return 0;
  }
  id v6 = [(NSMutableArray *)self->_changedRows objectAtIndexedSubscript:v3];
  int64_t v7 = [v6 integerValue];

  return v7;
}

- (int64_t)diffTypeForIndexPath:(id)a3
{
  uint64_t v4 = [a3 section];

  return [(EKUIRecurrenceDifferenceViewController *)self diffTypeForSection:v4];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSMutableArray *)self->_changedRows count] + 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!a4) {
    return 0;
  }
  int64_t v5 = [(EKUIRecurrenceDifferenceViewController *)self diffTypeForSection:a4];

  return [(EKUIRecurrenceDifferenceViewController *)self rowCountForDiffType:v5];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  int64_t v5 = (objc_class *)MEMORY[0x1E4FB1D08];
  id v6 = a4;
  int64_t v7 = (void *)[[v5 alloc] initWithStyle:0 reuseIdentifier:@"DifferenceCell"];
  int64_t v8 = [(EKUIRecurrenceDifferenceViewController *)self diffTypeForIndexPath:v6];
  uint64_t v9 = [v6 row];

  unint64_t v10 = [(EKUIRecurrenceDifferenceViewController *)self descriptionForDiffType:v8 row:v9 != 0];
  id v11 = [v7 textLabel];
  [v11 setAttributedText:v10];

  id v12 = [v7 textLabel];
  [v12 setNumberOfLines:0];

  uint64_t v13 = [v7 textLabel];
  [v13 setLineBreakMode:0];

  id v14 = [v7 textLabel];
  [v14 sizeToFit];

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    uint64_t v4 = [(EKUIRecurrenceDifferenceViewController *)self titleForDiffType:[(EKUIRecurrenceDifferenceViewController *)self diffTypeForSection:a4]];
  }
  else
  {
    int64_t v5 = EventKitUIBundle();
    uint64_t v4 = [v5 localizedStringForKey:@"This event is an occurrence of a repeating event. It has some differences from the repeating event it originated from." value:&stru_1F0CC2140 table:0];
  }

  return v4;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  uint64_t v4 = EventKitUIBundle();
  int64_t v5 = [v4 localizedStringForKey:@"Revert" value:&stru_1F0CC2140 table:0];

  return v5;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(EKEvent *)self->_event isEditable]
    && ([(EKEvent *)self->_event isExternallyOrganizedInvitation] & 1) == 0)
  {
    int64_t v7 = [(EKUIRecurrenceDifferenceViewController *)self diffTypeForIndexPath:v5];
    BOOL v6 = (unint64_t)(v7 - 7) < 2
      || (int64_t v8 = v7, [v5 row] == 1)
      || [(EKUIRecurrenceDifferenceViewController *)self rowCountForDiffType:v8] == 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (a4 == 1)
  {
    int64_t v10 = [(EKUIRecurrenceDifferenceViewController *)self diffTypeForIndexPath:v9];
    -[EKUIRecurrenceDifferenceViewController revertChangeForDiffType:row:](self, "revertChangeForDiffType:row:", v10, [v9 row]);
    -[NSMutableArray removeObjectAtIndex:](self->_changedRows, "removeObjectAtIndex:", [v9 section] - 1);
    [v8 beginUpdates];
    int64_t v11 = [(EKUIRecurrenceDifferenceViewController *)self rowCountForDiffType:v10];
    if (v11 == 2)
    {
      if ((unint64_t)(v10 - 7) > 1)
      {
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, objc_msgSend(v9, "section"));
        v16[0] = v13;
        v16[1] = v9;
        id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
        [v8 deleteRowsAtIndexPaths:v14 withRowAnimation:100];

        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v9, "section"));
        [v8 deleteSections:v15 withRowAnimation:100];
      }
      else
      {
        id v17 = v9;
        uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
        [v8 deleteRowsAtIndexPaths:v13 withRowAnimation:100];
      }
    }
    else
    {
      if (v11 != 1)
      {
LABEL_9:
        [v8 endUpdates];
        goto LABEL_10;
      }
      v18[0] = v9;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      [v8 deleteRowsAtIndexPaths:v12 withRowAnimation:100];

      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v9, "section"));
      [v8 deleteSections:v13 withRowAnimation:100];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attendeesRemoved, 0);
  objc_storeStrong((id *)&self->_attendeesAdded, 0);
  objc_storeStrong((id *)&self->_alarmsRemoved, 0);
  objc_storeStrong((id *)&self->_alarmsAdded, 0);
  objc_storeStrong((id *)&self->_changedRows, 0);
  objc_storeStrong((id *)&self->_diffSummary, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end