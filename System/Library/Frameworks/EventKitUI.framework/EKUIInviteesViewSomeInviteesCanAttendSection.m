@interface EKUIInviteesViewSomeInviteesCanAttendSection
- (BOOL)searchingForMoreTimes;
- (Class)customTimeCellClass;
- (id)headerTitle;
- (id)searcherTimeSlots;
- (unint64_t)initialNumberOfTimeSlotsToShow;
- (void)searchForMoreTimes;
@end

@implementation EKUIInviteesViewSomeInviteesCanAttendSection

- (id)headerTitle
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Some Invitees Can Attend" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (unint64_t)initialNumberOfTimeSlotsToShow
{
  return 3;
}

- (id)searcherTimeSlots
{
  v2 = [(EKUIInviteesViewAlternativeTimeSection *)self availabilitySearcher];
  v3 = [v2 timesWhenSomeAttendeesCanAttend];

  return v3;
}

- (Class)customTimeCellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)searchingForMoreTimes
{
  v2 = [(EKUIInviteesViewAlternativeTimeSection *)self availabilitySearcher];
  char v3 = [v2 searchingForMoreTimesWhenSomeAttendeesCanAttend];

  return v3;
}

- (void)searchForMoreTimes
{
  id v2 = [(EKUIInviteesViewAlternativeTimeSection *)self availabilitySearcher];
  [v2 searchForMoreTimesWhenSomeAttendeesCanAttend];
}

@end