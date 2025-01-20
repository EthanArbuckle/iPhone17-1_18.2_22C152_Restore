@interface EKUIInviteesViewAddInviteeCell
+ (id)labelText;
+ (int64_t)accessoryType;
@end

@implementation EKUIInviteesViewAddInviteeCell

+ (id)labelText
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Cell title - Add Invitees" value:@"Add Invitees" table:0];

  return v3;
}

+ (int64_t)accessoryType
{
  return 1;
}

@end