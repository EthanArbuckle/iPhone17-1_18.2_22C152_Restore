@interface EKUIInviteesViewProposedTimeCell
- (BOOL)conflicts;
- (id)participantsTextColor;
- (void)setConflicts:(BOOL)a3;
@end

@implementation EKUIInviteesViewProposedTimeCell

- (id)participantsTextColor
{
  if ([(EKUIInviteesViewProposedTimeCell *)self conflicts]) {
    [MEMORY[0x1E4FB1618] systemRedColor];
  }
  else {
  v2 = [MEMORY[0x1E4FB1618] systemGrayColor];
  }

  return v2;
}

- (BOOL)conflicts
{
  return self->_conflicts;
}

- (void)setConflicts:(BOOL)a3
{
  self->_conflicts = a3;
}

@end