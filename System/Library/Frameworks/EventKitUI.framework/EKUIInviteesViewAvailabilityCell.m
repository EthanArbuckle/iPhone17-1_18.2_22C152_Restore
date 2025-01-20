@interface EKUIInviteesViewAvailabilityCell
+ (id)labelText;
+ (int64_t)accessoryType;
@end

@implementation EKUIInviteesViewAvailabilityCell

+ (id)labelText
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"View Availability" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (int64_t)accessoryType
{
  return 1;
}

@end