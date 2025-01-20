@interface EKCalendarDeleteButtonEditItem
- (BOOL)_shouldShowDeleteButton;
- (BOOL)configureWithCalendar:(id)a3 store:(id)a4;
@end

@implementation EKCalendarDeleteButtonEditItem

- (BOOL)configureWithCalendar:(id)a3 store:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)EKCalendarDeleteButtonEditItem;
  [(EKCalendarEditItem *)&v6 configureWithCalendar:a3 store:a4];
  return [(EKCalendarDeleteButtonEditItem *)self _shouldShowDeleteButton];
}

- (BOOL)_shouldShowDeleteButton
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [(EKCalendarEditItem *)self calendar];
  char v4 = [v3 isNew];

  if (v4) {
    return 0;
  }
  v5 = [(EKCalendarEditItem *)self calendar];
  char v6 = [v5 isImmutable];

  if (v6) {
    return 0;
  }
  v7 = [(EKCalendarEditItem *)self calendar];
  char v8 = [v7 isSubscribedHolidayCalendar];

  if (v8) {
    return 0;
  }
  v9 = [(EKCalendarEditItem *)self calendar];
  char v10 = [v9 isDefaultSchedulingCalendar];

  if (v10) {
    return 0;
  }
  v13 = [(EKCalendarEditItem *)self calendar];
  uint64_t v14 = [v13 type];

  if (v14) {
    goto LABEL_21;
  }
  [(EKEventStore *)self->super.super._store calendarsForEntityType:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v20, "allowEvents", (void)v26)
          && ([v20 type] == 1 || objc_msgSend(v20, "type") == 2))
        {

          goto LABEL_21;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  v21 = [(EKCalendarEditItem *)self calendar];
  v22 = [v21 source];
  v23 = [v22 calendarsForEntityType:0];
  unint64_t v24 = [v23 count];

  if (v24 < 2) {
    return 0;
  }
LABEL_21:
  v25 = [(EKCalendarEditItem *)self calendar];
  char v11 = [v25 isDeletable];

  return v11;
}

@end