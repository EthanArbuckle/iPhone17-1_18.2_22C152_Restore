@interface CUIKGroupInfo
- (BOOL)isSubscribed;
- (BOOL)selected;
- (BOOL)showAccountErrorActionButton;
- (BOOL)showAccountErrorActionButtonSpinner;
- (BOOL)showAddCalendarButton;
- (BOOL)showCalendarNameIfSolitary;
- (BOOL)showSelectAllButton;
- (CUIKGroupInfo)init;
- (CUIKGroupInfo)initWithCustomGroupType:(unint64_t)a3;
- (CUIKGroupInfo)initWithSource:(id)a3;
- (EKSource)source;
- (NSArray)calendarInfos;
- (NSSet)calendarSet;
- (NSSet)selectedCalendarSet;
- (NSString)footer;
- (NSString)title;
- (NSString)typeTitle;
- (id)calendarAtIndex:(unint64_t)a3;
- (id)copyCalendars;
- (id)description;
- (id)titleForBeginningOfSentence:(BOOL)a3;
- (int)sortOrder;
- (unint64_t)accountError;
- (unint64_t)numCalendars;
- (unint64_t)numSelectableCalendars;
- (unint64_t)numSelectedCalendars;
- (void)insertCalendarInfo:(id)a3;
- (void)removeCalendar:(id)a3;
- (void)selectAll;
- (void)selectNone;
- (void)setAccountError:(unint64_t)a3;
- (void)setCustomTitle:(id)a3 forBeginningOfSentence:(id)a4;
- (void)setFooter:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowAccountErrorActionButton:(BOOL)a3;
- (void)setShowAccountErrorActionButtonSpinner:(BOOL)a3;
- (void)setShowSelectAllButton:(BOOL)a3;
- (void)setSource:(id)a3;
@end

@implementation CUIKGroupInfo

- (CUIKGroupInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUIKGroupInfo;
  v2 = [(CUIKGroupInfo *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    calendars = v2->_calendars;
    v2->_calendars = (NSMutableArray *)v3;

    [(CUIKGroupInfo *)v2 setShowSelectAllButton:1];
  }
  return v2;
}

- (CUIKGroupInfo)initWithSource:(id)a3
{
  id v5 = a3;
  objc_super v6 = [(CUIKGroupInfo *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_source, a3);
    uint64_t v8 = CUIKDisplayedStoreTypeTitleForSource(v7->_source);
    typeTitle = v7->_typeTitle;
    v7->_typeTitle = (NSString *)v8;

    uint64_t v10 = CUIKDisplayedTitleForSource(v7->_source, 0);
    title = v7->_title;
    v7->_title = (NSString *)v10;

    uint64_t v12 = CUIKDisplayedTitleForSource(v7->_source, 1);
    titleForBeginningOfSentence = v7->_titleForBeginningOfSentence;
    v7->_titleForBeginningOfSentence = (NSString *)v12;
  }
  return v7;
}

- (CUIKGroupInfo)initWithCustomGroupType:(unint64_t)a3
{
  v4 = [(CUIKGroupInfo *)self init];
  id v5 = v4;
  if (v4)
  {
    v4->_customGroupType = a3;
    if (a3 == 1)
    {
      objc_super v6 = CUIKBundle();
      v7 = [v6 localizedStringForKey:@"'Other' group mid sentence title" value:@"Other" table:0];
      uint64_t v8 = CUIKBundle();
      v9 = [v8 localizedStringForKey:@"'Other' group title" value:@"Other" table:0];
      [(CUIKGroupInfo *)v5 setCustomTitle:v7 forBeginningOfSentence:v9];

      [(CUIKGroupInfo *)v5 setShowSelectAllButton:0];
    }
  }
  return v5;
}

- (void)insertCalendarInfo:(id)a3
{
  id v10 = a3;
  v4 = [v10 group];

  if (v4 != self)
  {
    id v5 = [v10 group];

    if (v5)
    {
      objc_super v6 = [v10 group];
      [v6 removeCalendar:v10];
    }
    unint64_t v7 = [(NSMutableArray *)self->_calendars count];
    unint64_t v8 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_calendars, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, v7, 1024, &__block_literal_global_32);
    if (v7 >= v8) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = v7;
    }
    [(NSMutableArray *)self->_calendars insertObject:v10 atIndex:v9];
  }
  [v10 setGroup:self];
}

uint64_t __36__CUIKGroupInfo_insertCalendarInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_super v6 = [v4 calendar];
  if (v6)
  {
  }
  else
  {
    uint64_t v7 = [v5 calendar];

    if (!v7) {
      goto LABEL_9;
    }
  }
  unint64_t v8 = [v4 calendar];

  if (v8)
  {
    unint64_t v9 = [v5 calendar];

    if (v9)
    {
      id v10 = [v4 calendar];
      v11 = [v5 calendar];
      uint64_t v7 = CUIKCompareEKCalendars(v10, v11);
    }
    else
    {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }
LABEL_9:

  return v7;
}

- (void)removeCalendar:(id)a3
{
  id v5 = a3;
  id v4 = [v5 group];

  if (v4 == self)
  {
    [(NSMutableArray *)self->_calendars removeObject:v5];
    [v5 setGroup:0];
  }
}

- (NSString)title
{
  return (NSString *)[(CUIKGroupInfo *)self titleForBeginningOfSentence:1];
}

- (id)titleForBeginningOfSentence:(BOOL)a3
{
  customTitle = self->_customTitle;
  if (customTitle && self->_customTitleAtBeginningOfSentence)
  {
    if (a3) {
      customTitle = self->_customTitleAtBeginningOfSentence;
    }
  }
  else
  {
    uint64_t v4 = 48;
    if (a3) {
      uint64_t v4 = 56;
    }
    customTitle = *(NSString **)((char *)&self->super.isa + v4);
  }
  id v5 = customTitle;

  return v5;
}

- (void)setCustomTitle:(id)a3 forBeginningOfSentence:(id)a4
{
  objc_super v6 = (NSString *)a3;
  uint64_t v7 = (NSString *)a4;
  customTitle = self->_customTitle;
  self->_customTitle = v6;
  id v10 = v6;

  customTitleAtBeginningOfSentence = self->_customTitleAtBeginningOfSentence;
  self->_customTitleAtBeginningOfSentence = v7;
}

- (NSString)typeTitle
{
  return self->_typeTitle;
}

- (NSArray)calendarInfos
{
  return (NSArray *)self->_calendars;
}

- (unint64_t)numCalendars
{
  return [(NSMutableArray *)self->_calendars count];
}

- (unint64_t)numSelectableCalendars
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CUIKGroupInfo *)self numCalendars];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(CUIKGroupInfo *)self calendarInfos];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 -= [*(id *)(*((void *)&v10 + 1) + 8 * v8++) filteredByFocus];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)numSelectedCalendars
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_calendars;
  unint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    int v4 = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v4 += objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "selected", (void)v8);
      }
      while (v3 != v6);
      unint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
    unint64_t v3 = v4;
  }

  return v3;
}

- (id)calendarAtIndex:(unint64_t)a3
{
  unint64_t v3 = [(NSMutableArray *)self->_calendars objectAtIndex:a3];
  int v4 = [v3 calendar];

  return v4;
}

- (id)copyCalendars
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v4 = self->_calendars;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = objc_msgSend(v9, "calendar", (void)v13);

        if (v10)
        {
          long long v11 = [v9 calendar];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSSet)calendarSet
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v4 = self->_calendars;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = objc_msgSend(v9, "calendar", (void)v13);

        if (v10)
        {
          long long v11 = [v9 calendar];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (NSSet)selectedCalendarSet
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v4 = self->_calendars;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "selected", (void)v13))
        {
          long long v10 = [v9 calendar];

          if (v10)
          {
            long long v11 = [v9 calendar];
            [v3 addObject:v11];
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (void)selectAll
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  self->_selected = 1;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_calendars;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "isEnabled", (void)v8)) {
          [v7 setSelected:1];
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)selectNone
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  self->_selected = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_calendars;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setSelected:", 0, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)showAddCalendarButton
{
  if ((unint64_t)([(EKSource *)self->_source sourceType] - 4) < 3) {
    return 0;
  }
  uint64_t v4 = [(EKSource *)self->_source constraints];
  char v5 = [v4 allowsCalendarAddDeleteModify];

  return v5;
}

- (BOOL)showCalendarNameIfSolitary
{
  return ([(EKSource *)self->_source sourceType] & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (BOOL)showSelectAllButton
{
  return [(CUIKGroupInfo *)self numSelectableCalendars] >= 2 && self->_showSelectAllButton;
}

- (BOOL)isSubscribed
{
  return [(EKSource *)self->_source sourceType] == EKSourceTypeSubscribed;
}

- (int)sortOrder
{
  unint64_t customGroupType = self->_customGroupType;
  uint64_t v4 = +[CUIKAccountsController sharedInstance];
  char v5 = v4;
  if (customGroupType == 1) {
    int v6 = [v4 sortOrderForSourceType:5];
  }
  else {
    int v6 = [v4 sortOrderForSource:self->_source];
  }
  int v7 = v6;

  return v7;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CUIKGroupInfo;
  uint64_t v3 = [(CUIKGroupInfo *)&v6 description];
  uint64_t v4 = [v3 stringByAppendingFormat:@" - calendars: %@", self->_calendars];

  return v4;
}

- (EKSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void)setShowSelectAllButton:(BOOL)a3
{
  self->_showSelectAllButton = a3;
}

- (BOOL)showAccountErrorActionButton
{
  return self->_showAccountErrorActionButton;
}

- (void)setShowAccountErrorActionButton:(BOOL)a3
{
  self->_showAccountErrorActionButton = a3;
}

- (BOOL)showAccountErrorActionButtonSpinner
{
  return self->_showAccountErrorActionButtonSpinner;
}

- (void)setShowAccountErrorActionButtonSpinner:(BOOL)a3
{
  self->_showAccountErrorActionButtonSpinner = a3;
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (unint64_t)accountError
{
  return self->_accountError;
}

- (void)setAccountError:(unint64_t)a3
{
  self->_accountError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_titleForBeginningOfSentence, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_typeTitle, 0);
  objc_storeStrong((id *)&self->_customTitleAtBeginningOfSentence, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);

  objc_storeStrong((id *)&self->_calendars, 0);
}

@end