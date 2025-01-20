@interface EKUIInviteesViewAllInviteesCanAttendSection
- (BOOL)searchingForMoreTimes;
- (Class)customTimeCellClass;
- (id)headerTitle;
- (id)searcherTimeSlots;
- (unint64_t)initialNumberOfTimeSlotsToShow;
- (void)searchForMoreTimes;
@end

@implementation EKUIInviteesViewAllInviteesCanAttendSection

- (id)headerTitle
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"All Invitees Can Attend" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (unint64_t)initialNumberOfTimeSlotsToShow
{
  return 1;
}

- (id)searcherTimeSlots
{
  v2 = [(EKUIInviteesViewAlternativeTimeSection *)self availabilitySearcher];
  v3 = [v2 timesWhenAllAttendeesCanAttend];

  return v3;
}

- (Class)customTimeCellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)searchingForMoreTimes
{
  v2 = [(EKUIInviteesViewAlternativeTimeSection *)self availabilitySearcher];
  char v3 = [v2 searchingForMoreTimesWhenAllAttendeesCanAttend];

  return v3;
}

- (void)searchForMoreTimes
{
  id v2 = [(EKUIInviteesViewAlternativeTimeSection *)self availabilitySearcher];
  [v2 searchForMoreTimesWhenAllAttendeesCanAttend];
}

@end