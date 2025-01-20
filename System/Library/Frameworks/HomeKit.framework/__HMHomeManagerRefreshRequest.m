@interface __HMHomeManagerRefreshRequest
- (__HMHomeManagerRefreshRequest)initWithGenerationCounter:(unint64_t)a3 timeout:(double)a4;
- (unint64_t)generationCounter;
@end

@implementation __HMHomeManagerRefreshRequest

- (unint64_t)generationCounter
{
  return self->_generationCounter;
}

- (__HMHomeManagerRefreshRequest)initWithGenerationCounter:(unint64_t)a3 timeout:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)__HMHomeManagerRefreshRequest;
  result = [(HMFOperation *)&v6 initWithTimeout:a4];
  if (result) {
    result->_generationCounter = a3;
  }
  return result;
}

@end