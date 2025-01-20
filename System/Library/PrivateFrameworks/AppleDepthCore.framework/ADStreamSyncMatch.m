@interface ADStreamSyncMatch
- (NSMutableArray)matchedStreams;
- (id)matchedObjectsForStream:(unint64_t)a3;
- (void)setMatchedStreams:(id)a3;
@end

@implementation ADStreamSyncMatch

- (void).cxx_destruct
{
}

- (void)setMatchedStreams:(id)a3
{
}

- (NSMutableArray)matchedStreams
{
  return self->_matchedStreams;
}

- (id)matchedObjectsForStream:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_matchedStreams objectAtIndexedSubscript:a3];
}

@end