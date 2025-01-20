@interface CUIKCalendarInfo
- (BOOL)filteredByFocus;
- (BOOL)isEditable;
- (BOOL)isEnabled;
- (BOOL)isIntegration;
- (BOOL)isPublished;
- (BOOL)isShared;
- (BOOL)isSubscribed;
- (BOOL)selected;
- (CUIKCalendarInfo)initWithCalendar:(id)a3;
- (CUIKGroupInfo)group;
- (EKCalendar)calendar;
- (NSArray)otherCalendars;
- (NSString)title;
- (UIColor)color;
- (id)description;
- (id)stringForSharedCalendar;
- (int)displayOrder;
- (unint64_t)customGroupType;
- (void)_updateCustomGroupType;
- (void)addCalendar:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setColor:(id)a3;
- (void)setCustomGroupType:(unint64_t)a3;
- (void)setFilteredByFocus:(BOOL)a3;
- (void)setGroup:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setOtherCalendars:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation CUIKCalendarInfo

- (void)_updateCustomGroupType
{
  if (([(EKCalendar *)self->_calendar isSubscribedHolidayCalendar] & 1) == 0)
  {
    v3 = [(EKCalendar *)self->_calendar source];
    if ([v3 sourceType] != 5)
    {
      v5 = [(EKCalendar *)self->_calendar source];
      unint64_t v4 = [v5 sourceType] == 6;

      goto LABEL_6;
    }
  }
  unint64_t v4 = 1;
LABEL_6:
  self->_customGroupType = v4;
}

- (CUIKCalendarInfo)initWithCalendar:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CUIKCalendarInfo;
  v6 = [(CUIKCalendarInfo *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_calendar, a3);
    uint64_t v8 = CUIKDisplayedTitleForCalendar(v7->_calendar);
    title = v7->_title;
    v7->_title = (NSString *)v8;

    v7->_isEnabled = 1;
    [(CUIKCalendarInfo *)v7 _updateCustomGroupType];
  }

  return v7;
}

- (void)setCalendar:(id)a3
{
  id v5 = (EKCalendar *)a3;
  if (self->_calendar != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_calendar, a3);
    [(CUIKCalendarInfo *)self _updateCustomGroupType];
    id v5 = v6;
  }
}

- (void)addCalendar:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectID];
  int v7 = [v6 databaseID];
  uint64_t v8 = [(EKCalendar *)self->_calendar objectID];
  int v9 = [v8 databaseID];

  if (v7 >= v9)
  {
    v10 = (EKCalendar *)v5;
  }
  else
  {
    v10 = self->_calendar;
    objc_storeStrong((id *)&self->_calendar, a3);
  }
  otherCalendars = self->_otherCalendars;
  if (otherCalendars)
  {
    v12 = [(NSArray *)otherCalendars arrayByAddingObject:v10];
  }
  else
  {
    v14[0] = v10;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  v13 = self->_otherCalendars;
  self->_otherCalendars = v12;
}

- (NSString)title
{
  return self->_title;
}

- (int)displayOrder
{
  return [(EKCalendar *)self->_calendar displayOrder];
}

- (BOOL)isSubscribed
{
  return [(EKCalendar *)self->_calendar isSubscribed];
}

- (BOOL)isShared
{
  return [(EKCalendar *)self->_calendar sharingStatus] != 0;
}

- (BOOL)isPublished
{
  v2 = [(EKCalendar *)self->_calendar publishURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isEditable
{
  return [(EKCalendar *)self->_calendar type] != (EKCalendarTypeBirthday|EKCalendarTypeCalDAV)
      && [(EKCalendar *)self->_calendar type] != EKCalendarTypeBirthday
      && [(EKCalendar *)self->_calendar type] != (EKCalendarTypeBirthday|EKCalendarTypeExchange);
}

- (BOOL)isIntegration
{
  return [(EKCalendar *)self->_calendar type] == (EKCalendarTypeBirthday|EKCalendarTypeExchange);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)CUIKCalendarInfo;
  BOOL v3 = [(CUIKCalendarInfo *)&v8 description];
  unint64_t v4 = v3;
  if (self->_selected) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  v6 = [v3 stringByAppendingFormat:@" - calendar: %@, selected: %@", self->_calendar, v5];

  return v6;
}

- (id)stringForSharedCalendar
{
  BOOL v3 = [(EKCalendar *)self->_calendar sharees];
  unint64_t v4 = [v3 allObjects];

  if ([(EKCalendar *)self->_calendar sharingStatus] == 1
    && [v4 count] == 1
    && ([(EKCalendar *)self->_calendar isPublished] & 1) == 0)
  {
    id v5 = [v4 objectAtIndex:0];
    v6 = +[CUIKAttendeeUtils displayStringForIdentity:v5 useAddressAsFallback:1 contactIdentifier:0];
    int v7 = NSString;
    objc_super v8 = CUIKBundle();
    int v9 = v8;
    v10 = @"Shared with %@";
    goto LABEL_19;
  }
  if ([(EKCalendar *)self->_calendar sharingStatus] == 1
    && (unint64_t)[v4 count] >= 2
    && ([(EKCalendar *)self->_calendar isPublished] & 1) == 0)
  {
    id v5 = [v4 objectAtIndex:0];
    v6 = +[CUIKAttendeeUtils displayStringForIdentity:v5 useAddressAsFallback:1 contactIdentifier:0];
    int v7 = NSString;
    objc_super v8 = CUIKBundle();
    int v9 = v8;
    v10 = @"Shared with %@ and…";
    goto LABEL_19;
  }
  if ([(EKCalendar *)self->_calendar sharingStatus] == 1
    && [v4 count]
    && [(EKCalendar *)self->_calendar isPublished])
  {
    id v5 = [v4 objectAtIndex:0];
    v6 = +[CUIKAttendeeUtils displayStringForIdentity:v5 useAddressAsFallback:1 contactIdentifier:0];
    int v7 = NSString;
    objc_super v8 = CUIKBundle();
    int v9 = v8;
    v10 = @"Public and Shared with %@…";
LABEL_19:
    v16 = [v8 localizedStringForKey:v10 value:&stru_1F187C430 table:0];
    objc_super v11 = objc_msgSend(v7, "localizedStringWithFormat:", v16, v6);

    goto LABEL_20;
  }
  if ([(EKCalendar *)self->_calendar isPublished])
  {
    id v5 = CUIKBundle();
    objc_super v11 = [v5 localizedStringForKey:@"Public Calendar" value:&stru_1F187C430 table:0];
  }
  else
  {
    if ([(EKCalendar *)self->_calendar sharingStatus] != 2
      || ([(EKCalendar *)self->_calendar sharedOwnerName],
          v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          !v12))
    {
      objc_super v11 = 0;
      goto LABEL_21;
    }
    v13 = NSString;
    id v5 = CUIKBundle();
    v14 = [v5 localizedStringForKey:@"Shared by %@" value:&stru_1F187C430 table:0];
    v15 = [(EKCalendar *)self->_calendar sharedOwnerName];
    objc_super v11 = objc_msgSend(v13, "localizedStringWithFormat:", v14, v15);
  }
LABEL_20:

LABEL_21:

  return v11;
}

- (EKCalendar)calendar
{
  return self->_calendar;
}

- (NSArray)otherCalendars
{
  return self->_otherCalendars;
}

- (void)setOtherCalendars:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
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

- (CUIKGroupInfo)group
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_group);

  return (CUIKGroupInfo *)WeakRetained;
}

- (void)setGroup:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (unint64_t)customGroupType
{
  return self->_customGroupType;
}

- (void)setCustomGroupType:(unint64_t)a3
{
  self->_customGroupType = a3;
}

- (BOOL)filteredByFocus
{
  return self->_filteredByFocus;
}

- (void)setFilteredByFocus:(BOOL)a3
{
  self->_filteredByFocus = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_group);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_otherCalendars, 0);
  objc_storeStrong((id *)&self->_calendar, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end