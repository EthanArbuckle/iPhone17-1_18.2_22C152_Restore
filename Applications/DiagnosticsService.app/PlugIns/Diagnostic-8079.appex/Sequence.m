@interface Sequence
- (NSMutableArray)outputs;
- (NSNumber)completedResultCount;
- (NSNumber)index;
- (void)setCompletedResultCount:(id)a3;
- (void)setIndex:(id)a3;
- (void)setOutputs:(id)a3;
@end

@implementation Sequence

- (NSNumber)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
}

- (NSMutableArray)outputs
{
  return self->_outputs;
}

- (void)setOutputs:(id)a3
{
}

- (NSNumber)completedResultCount
{
  return self->_completedResultCount;
}

- (void)setCompletedResultCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedResultCount, 0);
  objc_storeStrong((id *)&self->_outputs, 0);

  objc_storeStrong((id *)&self->_index, 0);
}

@end