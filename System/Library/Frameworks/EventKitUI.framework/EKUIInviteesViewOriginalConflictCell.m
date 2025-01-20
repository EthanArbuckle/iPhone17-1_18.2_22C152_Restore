@interface EKUIInviteesViewOriginalConflictCell
- (BOOL)conflict;
- (id)participantsTextColor;
- (id)timeTextColor;
- (void)setConflict:(BOOL)a3;
@end

@implementation EKUIInviteesViewOriginalConflictCell

- (id)participantsTextColor
{
  if ([(EKUIInviteesViewOriginalConflictCell *)self conflict]) {
    [MEMORY[0x1E4FB1618] systemRedColor];
  }
  else {
  v2 = [MEMORY[0x1E4FB1618] labelColor];
  }

  return v2;
}

- (id)timeTextColor
{
  if ([(EKUIInviteesViewOriginalConflictCell *)self conflict]) {
    [MEMORY[0x1E4FB1618] systemRedColor];
  }
  else {
  v2 = [MEMORY[0x1E4FB1618] labelColor];
  }

  return v2;
}

- (BOOL)conflict
{
  return self->_conflict;
}

- (void)setConflict:(BOOL)a3
{
  self->_conflict = a3;
}

@end