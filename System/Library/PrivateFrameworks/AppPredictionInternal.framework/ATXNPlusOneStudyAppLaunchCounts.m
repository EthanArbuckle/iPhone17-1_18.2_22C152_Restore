@interface ATXNPlusOneStudyAppLaunchCounts
- (int64_t)numAppLaunchPast14Day;
- (int64_t)numAppLaunchPast28Day;
- (int64_t)numAppLaunchPast3Day;
- (int64_t)numAppLaunchPast7Day;
- (int64_t)numAppLaunchPastDay;
- (void)setNumAppLaunchPast14Day:(int64_t)a3;
- (void)setNumAppLaunchPast28Day:(int64_t)a3;
- (void)setNumAppLaunchPast3Day:(int64_t)a3;
- (void)setNumAppLaunchPast7Day:(int64_t)a3;
- (void)setNumAppLaunchPastDay:(int64_t)a3;
@end

@implementation ATXNPlusOneStudyAppLaunchCounts

- (int64_t)numAppLaunchPastDay
{
  return self->_numAppLaunchPastDay;
}

- (void)setNumAppLaunchPastDay:(int64_t)a3
{
  self->_numAppLaunchPastDay = a3;
}

- (int64_t)numAppLaunchPast3Day
{
  return self->_numAppLaunchPast3Day;
}

- (void)setNumAppLaunchPast3Day:(int64_t)a3
{
  self->_numAppLaunchPast3Day = a3;
}

- (int64_t)numAppLaunchPast7Day
{
  return self->_numAppLaunchPast7Day;
}

- (void)setNumAppLaunchPast7Day:(int64_t)a3
{
  self->_numAppLaunchPast7Day = a3;
}

- (int64_t)numAppLaunchPast14Day
{
  return self->_numAppLaunchPast14Day;
}

- (void)setNumAppLaunchPast14Day:(int64_t)a3
{
  self->_numAppLaunchPast14Day = a3;
}

- (int64_t)numAppLaunchPast28Day
{
  return self->_numAppLaunchPast28Day;
}

- (void)setNumAppLaunchPast28Day:(int64_t)a3
{
  self->_numAppLaunchPast28Day = a3;
}

@end