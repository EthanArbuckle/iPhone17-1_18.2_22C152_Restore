@interface CUIKUserActivityRemindersListCategory
- (BOOL)_isMatchForRemindersList:(id)a3;
- (CUIKUserActivityRemindersListCategory)initWithDictionary:(id)a3;
- (CUIKUserActivityRemindersListCategory)initWithRemindersList:(id)a3;
- (CUIKUserActivityRemindersListCategory)initWithRemindersList:(id)a3 forceLocal:(BOOL)a4;
- (id)dictionary;
- (id)remindersListFromStore:(id)a3;
- (void)updateActivity:(id)a3;
@end

@implementation CUIKUserActivityRemindersListCategory

- (CUIKUserActivityRemindersListCategory)initWithRemindersList:(id)a3 forceLocal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (v4)
  {
    v8 = 0;
  }
  else
  {
    v8 = [v6 source];
  }
  v21.receiver = self;
  v21.super_class = (Class)CUIKUserActivityRemindersListCategory;
  v9 = [(CUIKUserActivityWithSource *)&v21 initWithSource:v8 type:1];
  if (!v4) {

  }
  if (!v9) {
    goto LABEL_17;
  }
  uint64_t v10 = [v7 title];
  title = v9->_title;
  v9->_title = (NSString *)v10;

  if (v9->_title)
  {
    v12 = [v7 unlocalizedTitle];
    if ([v12 isEqualToString:@"DEFAULT_TASK_CALENDAR_NAME"]) {
      LOBYTE(v13) = 0;
    }
    else {
      int v13 = [v12 isEqualToString:@"Reminders"] ^ 1;
    }
    v9->_predictable = v13;
    [(CUIKUserActivity *)v9 setActivityTitle:v9->_title];
    v14 = CUIKBundle();
    v15 = [v14 localizedStringForKey:@"Reminder List" value:&stru_1F187C430 table:0];
    [(CUIKUserActivity *)v9 setActivitySubtitle:v15];

    v16 = [v7 source];
    LODWORD(v15) = -[CUIKUserActivityWithSource _supportsConsistentExternalIDAcrossDevices:](v9, "_supportsConsistentExternalIDAcrossDevices:", [v16 sourceType]);

    if (v15)
    {
      uint64_t v17 = [v7 externalID];
      externalID = v9->_externalID;
      v9->_externalID = (NSString *)v17;

      if (!v9->_externalID && !v4)
      {

        goto LABEL_15;
      }
    }

LABEL_17:
    v19 = v9;
    goto LABEL_18;
  }
LABEL_15:
  v19 = 0;
LABEL_18:

  return v19;
}

- (CUIKUserActivityRemindersListCategory)initWithRemindersList:(id)a3
{
  return [(CUIKUserActivityRemindersListCategory *)self initWithRemindersList:a3 forceLocal:0];
}

- (CUIKUserActivityRemindersListCategory)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CUIKUserActivityRemindersListCategory;
  v5 = [(CUIKUserActivityWithSource *)&v15 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_9;
  }
  char v14 = 0;
  uint64_t v6 = [(id)objc_opt_class() _stringFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.title" error:&v14];
  title = v5->_title;
  v5->_title = (NSString *)v6;

  if (!v14)
  {
    if ([(CUIKUserActivityWithSource *)v5 _supportsConsistentExternalIDAcrossDevices])
    {
      uint64_t v9 = [(id)objc_opt_class() _stringFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.externalID" error:&v14];
      externalID = v5->_externalID;
      v5->_externalID = (NSString *)v9;

      if (v14) {
        goto LABEL_3;
      }
    }
    else if ([(CUIKUserActivityWithSource *)v5 _isLocalSource])
    {
      uint64_t v11 = [(id)objc_opt_class() _stringFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.externalID" error:0];
      v12 = v5->_externalID;
      v5->_externalID = (NSString *)v11;
    }
LABEL_9:
    v8 = v5;
    goto LABEL_10;
  }
LABEL_3:
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)dictionary
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v10.receiver = self;
  v10.super_class = (Class)CUIKUserActivityRemindersListCategory;
  id v4 = [(CUIKUserActivityWithSource *)&v10 dictionary];
  v5 = (void *)[v3 initWithDictionary:v4];

  title = self->_title;
  uint64_t v11 = @"com.apple.calendarUIKit.userActivity.title";
  v12[0] = title;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [v5 addEntriesFromDictionary:v7];

  externalID = self->_externalID;
  if (externalID) {
    [v5 setObject:externalID forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.externalID"];
  }

  return v5;
}

- (BOOL)_isMatchForRemindersList:(id)a3
{
  id v4 = a3;
  v5 = [v4 source];
  unint64_t v6 = [(CUIKUserActivityWithSource *)self isMatchForSource:v5];

  if (!v6) {
    goto LABEL_9;
  }
  v7 = [v4 title];
  int v8 = [v7 isEqualToString:self->_title];

  if (!v8) {
    goto LABEL_9;
  }
  if (!-[CUIKUserActivityWithSource _supportsConsistentExternalIDAcrossDevices](self, "_supportsConsistentExternalIDAcrossDevices")|| ([v4 externalID], v9 = objc_claimAutoreleasedReturnValue(), int v10 = objc_msgSend(v9, "isEqualToString:", self->_externalID), v9, v10))
  {
    if ([(CUIKUserActivityWithSource *)self _isLocalSource])
    {
      uint64_t v11 = [v4 source];
      if (-[CUIKUserActivityWithSource _supportsConsistentExternalIDAcrossDevices:](self, "_supportsConsistentExternalIDAcrossDevices:", [v11 sourceType])&& -[NSString length](self->_externalID, "length"))
      {
        v12 = [v4 externalID];
        char v13 = [v12 isEqualToString:self->_externalID];
      }
      else
      {
        char v13 = 1;
      }
    }
    else
    {
      char v13 = 1;
    }
  }
  else
  {
LABEL_9:
    char v13 = 0;
  }

  return v13;
}

- (id)remindersListFromStore:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__15;
  char v13 = __Block_byref_object_dispose__15;
  id v14 = 0;
  v5 = [v4 calendarsForEntityType:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__CUIKUserActivityRemindersListCategory_remindersListFromStore___block_invoke;
  v8[3] = &unk_1E636B2F0;
  v8[4] = self;
  v8[5] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __64__CUIKUserActivityRemindersListCategory_remindersListFromStore___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_isMatchForRemindersList:"))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    int v10 = *(void **)(v7 + 40);
    int v8 = (id *)(v7 + 40);
    uint64_t v9 = v10;
    if (v10)
    {
      id *v8 = 0;

      *a4 = 1;
    }
    else
    {
      objc_storeStrong(v8, a2);
    }
  }
}

- (void)updateActivity:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CUIKUserActivityRemindersListCategory;
  id v4 = a3;
  [(CUIKUserActivity *)&v5 updateActivity:v4];
  objc_msgSend(v4, "_setEligibleForPrediction:", self->_predictable, v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalID, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end