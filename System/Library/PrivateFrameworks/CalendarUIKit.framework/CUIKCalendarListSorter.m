@interface CUIKCalendarListSorter
+ (id)ekCalendarComparator;
+ (id)ekOtherCalendarComparator;
+ (id)ekSourceComparator;
+ (int64_t)orderForOtherCalendar:(id)a3;
@end

@implementation CUIKCalendarListSorter

+ (id)ekSourceComparator
{
  return &__block_literal_global_16;
}

uint64_t __44__CUIKCalendarListSorter_ekSourceComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (![v4 sourceType] && objc_msgSend(v5, "sourceType")) {
    goto LABEL_10;
  }
  if (![v5 sourceType] && objc_msgSend(v4, "sourceType")) {
    goto LABEL_12;
  }
  if ([v4 isNestedLocalSource] & 1) == 0 && (objc_msgSend(v5, "isNestedLocalSource"))
  {
LABEL_10:
    uint64_t v11 = -1;
    goto LABEL_17;
  }
  if ([v5 isNestedLocalSource] & 1) == 0 && (objc_msgSend(v4, "isNestedLocalSource"))
  {
LABEL_12:
    uint64_t v11 = 1;
    goto LABEL_17;
  }
  v6 = [MEMORY[0x1E4F254E0] calendarPreferences];
  v7 = [v4 sourceIdentifier];
  unint64_t v8 = [v6 displayOrderForAccountWithSourceIdentifier:v7];

  v9 = [v5 sourceIdentifier];
  unint64_t v10 = [v6 displayOrderForAccountWithSourceIdentifier:v9];

  if (v8 >= v10)
  {
    if (v8 > v10)
    {
      uint64_t v11 = 1;
    }
    else
    {
      v12 = [v4 title];
      v13 = [v5 title];
      uint64_t v11 = [v12 compare:v13];
    }
  }
  else
  {
    uint64_t v11 = -1;
  }

LABEL_17:
  return v11;
}

+ (id)ekCalendarComparator
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__CUIKCalendarListSorter_ekCalendarComparator__block_invoke;
  aBlock[3] = &__block_descriptor_40_e35_q24__0__EKCalendar_8__EKCalendar_16l;
  aBlock[4] = a1;
  v2 = _Block_copy(aBlock);

  return v2;
}

uint64_t __46__CUIKCalendarListSorter_ekCalendarComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 source];
  unint64_t v8 = [v6 source];
  if ([v7 isEqual:v8])
  {
  }
  else
  {
    v9 = [*(id *)(a1 + 32) ekSourceComparator];
    unint64_t v10 = [v5 source];
    uint64_t v11 = [v6 source];
    uint64_t v12 = ((uint64_t (**)(void, void *, void *))v9)[2](v9, v10, v11);

    if (v12) {
      goto LABEL_9;
    }
  }
  int v13 = [v5 displayOrder];
  if (v13 >= (int)[v6 displayOrder])
  {
    int v14 = [v5 displayOrder];
    if (v14 <= (int)[v6 displayOrder])
    {
      v15 = [v5 title];
      v16 = [v6 title];
      uint64_t v12 = [v15 compare:v16];
    }
    else
    {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = -1;
  }
LABEL_9:

  return v12;
}

+ (id)ekOtherCalendarComparator
{
  return &__block_literal_global_10_0;
}

uint64_t __51__CUIKCalendarListSorter_ekOtherCalendarComparator__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int64_t v5 = +[CUIKCalendarListSorter orderForOtherCalendar:a2];
  int64_t v6 = +[CUIKCalendarListSorter orderForOtherCalendar:v4];

  if (v5 < v6) {
    return -1;
  }
  else {
    return 1;
  }
}

+ (int64_t)orderForOtherCalendar:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 4 || objc_msgSend(v3, "type") == 6)
  {
    int64_t v4 = 0;
  }
  else if ([v3 isSubscribedHolidayCalendar])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isSuggestedEventCalendar])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v6 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[CUIKCalendarListSorter orderForOtherCalendar:](v3, v6);
    }

    int64_t v4 = -1;
  }

  return v4;
}

+ (void)orderForOtherCalendar:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 uniqueIdentifier];
  int v4 = 138543362;
  int64_t v5 = v3;
  _os_log_error_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_ERROR, "problem with 'other' calendar uid %{public}@", (uint8_t *)&v4, 0xCu);
}

@end