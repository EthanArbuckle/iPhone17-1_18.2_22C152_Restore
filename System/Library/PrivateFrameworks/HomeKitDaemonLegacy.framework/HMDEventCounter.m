@interface HMDEventCounter
- (HMDEventCounter)init;
- (HMDEventCounter)initWithCount:(unint64_t)a3;
- (NSArray)observers;
- (unint64_t)count;
- (void)setCount:(unint64_t)a3;
- (void)setObservers:(id)a3;
@end

@implementation HMDEventCounter

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSArray)observers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)count
{
  return self->_count;
}

- (HMDEventCounter)init
{
  return [(HMDEventCounter *)self initWithCount:0];
}

- (HMDEventCounter)initWithCount:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDEventCounter;
  result = [(HMDEventCounter *)&v5 init];
  if (result) {
    result->_count = a3;
  }
  return result;
}

- (void).cxx_destruct
{
}

- (void)setObservers:(id)a3
{
}

@end