@interface _EARAlignmentState
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)numberOfDeletions;
- (int64_t)numberOfInsertions;
- (int64_t)numberOfSubstitutions;
- (int64_t)totalCost;
- (void)incrementCost;
- (void)incrementDeletions;
- (void)incrementInsertions;
- (void)incrementSubstitutions;
- (void)setNumberOfDeletions:(int64_t)a3;
- (void)setNumberOfInsertions:(int64_t)a3;
- (void)setNumberOfSubstitutions:(int64_t)a3;
- (void)setTotalCost:(int64_t)a3;
@end

@implementation _EARAlignmentState

- (void)incrementInsertions
{
}

- (void)incrementDeletions
{
}

- (void)incrementSubstitutions
{
}

- (void)incrementCost
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[_EARAlignmentState allocWithZone:a3] init];
  [(_EARAlignmentState *)v4 setNumberOfInsertions:[(_EARAlignmentState *)self numberOfInsertions]];
  [(_EARAlignmentState *)v4 setNumberOfSubstitutions:[(_EARAlignmentState *)self numberOfSubstitutions]];
  [(_EARAlignmentState *)v4 setNumberOfDeletions:[(_EARAlignmentState *)self numberOfDeletions]];
  [(_EARAlignmentState *)v4 setTotalCost:[(_EARAlignmentState *)self totalCost]];
  return v4;
}

- (int64_t)numberOfInsertions
{
  return self->_numberOfInsertions;
}

- (void)setNumberOfInsertions:(int64_t)a3
{
  self->_numberOfInsertions = a3;
}

- (int64_t)numberOfDeletions
{
  return self->_numberOfDeletions;
}

- (void)setNumberOfDeletions:(int64_t)a3
{
  self->_numberOfDeletions = a3;
}

- (int64_t)numberOfSubstitutions
{
  return self->_numberOfSubstitutions;
}

- (void)setNumberOfSubstitutions:(int64_t)a3
{
  self->_numberOfSubstitutions = a3;
}

- (int64_t)totalCost
{
  return self->_totalCost;
}

- (void)setTotalCost:(int64_t)a3
{
  self->_totalCost = a3;
}

@end