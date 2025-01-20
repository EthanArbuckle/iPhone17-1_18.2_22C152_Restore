@interface MFCountingDataConsumer
- (int64_t)appendData:(id)a3;
- (unint64_t)count;
@end

@implementation MFCountingDataConsumer

- (int64_t)appendData:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFCountingDataConsumer;
  int64_t result = [(MFNullDataConsumer *)&v5 appendData:a3];
  if (result >= 1) {
    self->_count += result;
  }
  return result;
}

- (unint64_t)count
{
  return self->_count;
}

@end