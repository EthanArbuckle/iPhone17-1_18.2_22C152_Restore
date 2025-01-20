@interface EKUIInviteesViewAllInviteesCanAttendCell
- (id)participantsTextColor;
- (id)timeTextColor;
@end

@implementation EKUIInviteesViewAllInviteesCanAttendCell

- (id)timeTextColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

- (id)participantsTextColor
{
  return (id)[MEMORY[0x1E4FB1618] systemGrayColor];
}

@end