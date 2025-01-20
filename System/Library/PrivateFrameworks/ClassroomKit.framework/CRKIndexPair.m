@interface CRKIndexPair
- (id)description;
- (int64_t)destinationIndex;
- (int64_t)sourceIndex;
- (void)setDestinationIndex:(int64_t)a3;
- (void)setSourceIndex:(int64_t)a3;
@end

@implementation CRKIndexPair

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p { source = %ld, destination = %ld }>", objc_opt_class(), self, -[CRKIndexPair sourceIndex](self, "sourceIndex"), -[CRKIndexPair destinationIndex](self, "destinationIndex")];
}

- (int64_t)sourceIndex
{
  return self->_sourceIndex;
}

- (void)setSourceIndex:(int64_t)a3
{
  self->_sourceIndex = a3;
}

- (int64_t)destinationIndex
{
  return self->_destinationIndex;
}

- (void)setDestinationIndex:(int64_t)a3
{
  self->_destinationIndex = a3;
}

@end