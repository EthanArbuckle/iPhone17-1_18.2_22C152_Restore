@interface EKEventStore(CUIKCalendarListSorter)
- (id)sortedCalendarsForEntityType:()CUIKCalendarListSorter;
- (id)sortedCalendarsForEntityType:()CUIKCalendarListSorter passingTest:;
- (id)sortedSourcesEnabledForEntityType:()CUIKCalendarListSorter;
@end

@implementation EKEventStore(CUIKCalendarListSorter)

- (id)sortedSourcesEnabledForEntityType:()CUIKCalendarListSorter
{
  v1 = objc_msgSend(a1, "sourcesEnabledForEntityType:");
  v2 = +[CUIKCalendarListSorter ekSourceComparator];
  v3 = [v1 sortedArrayUsingComparator:v2];

  return v3;
}

- (id)sortedCalendarsForEntityType:()CUIKCalendarListSorter
{
  v1 = objc_msgSend(a1, "calendarsForEntityType:");
  v2 = +[CUIKCalendarListSorter ekCalendarComparator];
  v3 = [v1 sortedArrayUsingComparator:v2];

  return v3;
}

- (id)sortedCalendarsForEntityType:()CUIKCalendarListSorter passingTest:
{
  id v6 = a4;
  v7 = [a1 calendarsForEntityType:a3];
  v8 = [v7 CalFilter:v6];

  v9 = +[CUIKCalendarListSorter ekCalendarComparator];
  v10 = [v8 sortedArrayUsingComparator:v9];

  return v10;
}

@end