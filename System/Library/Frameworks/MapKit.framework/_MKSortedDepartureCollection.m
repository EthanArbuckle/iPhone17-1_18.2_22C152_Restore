@interface _MKSortedDepartureCollection
- (NSMutableArray)sortedDepartures;
- (NSMutableSet)groupedSequences;
- (void)setGroupedSequences:(id)a3;
- (void)setSortedDepartures:(id)a3;
@end

@implementation _MKSortedDepartureCollection

- (NSMutableArray)sortedDepartures
{
  return self->_sortedDepartures;
}

- (void)setSortedDepartures:(id)a3
{
}

- (NSMutableSet)groupedSequences
{
  return self->_groupedSequences;
}

- (void)setGroupedSequences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupedSequences, 0);

  objc_storeStrong((id *)&self->_sortedDepartures, 0);
}

@end