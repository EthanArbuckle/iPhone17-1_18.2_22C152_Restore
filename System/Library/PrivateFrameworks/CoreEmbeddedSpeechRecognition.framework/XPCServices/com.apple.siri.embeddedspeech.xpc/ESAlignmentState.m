@interface ESAlignmentState
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

@implementation ESAlignmentState

- (void)setTotalCost:(int64_t)a3
{
  self->_totalCost = a3;
}

- (int64_t)totalCost
{
  return self->_totalCost;
}

- (void)setNumberOfSubstitutions:(int64_t)a3
{
  self->_numberOfSubstitutions = a3;
}

- (int64_t)numberOfSubstitutions
{
  return self->_numberOfSubstitutions;
}

- (void)setNumberOfDeletions:(int64_t)a3
{
  self->_numberOfDeletions = a3;
}

- (int64_t)numberOfDeletions
{
  return self->_numberOfDeletions;
}

- (void)setNumberOfInsertions:(int64_t)a3
{
  self->_numberOfInsertions = a3;
}

- (int64_t)numberOfInsertions
{
  return self->_numberOfInsertions;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[ESAlignmentState allocWithZone:a3] init];
  [(ESAlignmentState *)v4 setNumberOfInsertions:[(ESAlignmentState *)self numberOfInsertions]];
  [(ESAlignmentState *)v4 setNumberOfSubstitutions:[(ESAlignmentState *)self numberOfSubstitutions]];
  [(ESAlignmentState *)v4 setNumberOfDeletions:[(ESAlignmentState *)self numberOfDeletions]];
  [(ESAlignmentState *)v4 setTotalCost:[(ESAlignmentState *)self totalCost]];
  return v4;
}

- (void)incrementCost
{
}

- (void)incrementSubstitutions
{
}

- (void)incrementDeletions
{
}

- (void)incrementInsertions
{
}

@end