@interface BPSCountWindowMetadata
- (BPSCountWindowMetadata)initWithCurrentCount:(unint64_t)a3;
- (unint64_t)currentCount;
@end

@implementation BPSCountWindowMetadata

- (BPSCountWindowMetadata)initWithCurrentCount:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BPSCountWindowMetadata;
  result = [(BPSCountWindowMetadata *)&v5 init];
  if (result) {
    result->_currentCount = a3;
  }
  return result;
}

- (unint64_t)currentCount
{
  return self->_currentCount;
}

@end