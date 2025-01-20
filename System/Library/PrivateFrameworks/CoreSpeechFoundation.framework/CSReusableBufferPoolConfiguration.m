@interface CSReusableBufferPoolConfiguration
- (CSReusableBufferPoolConfiguration)initWithBackingStoreCapacity:(unint64_t)a3 minimalNumberOfBackingStores:(unint64_t)a4 maximumNumberOfBackingStores:(unint64_t)a5 backingStoreIdleTimeout:(double)a6;
- (double)backingStoreIdleTimeout;
- (id)description;
- (unint64_t)backingStoreCapacity;
- (unint64_t)maximumNumberOfBackingStores;
- (unint64_t)minimalNumberOfBackingStores;
@end

@implementation CSReusableBufferPoolConfiguration

- (double)backingStoreIdleTimeout
{
  return self->_backingStoreIdleTimeout;
}

- (unint64_t)maximumNumberOfBackingStores
{
  return self->_maximumNumberOfBackingStores;
}

- (unint64_t)minimalNumberOfBackingStores
{
  return self->_minimalNumberOfBackingStores;
}

- (unint64_t)backingStoreCapacity
{
  return self->_backingStoreCapacity;
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)CSReusableBufferPoolConfiguration;
  v4 = [(CSReusableBufferPoolConfiguration *)&v7 description];
  v5 = (void *)[v3 initWithFormat:@"%@ {backingStoreCapacity = %tu (bytes), minimalNumberOfBackingStores = %tu, maximumNumberOfBackingStores = %tu, backingStoreIdleTimeout = %f (seconds)}", v4, self->_backingStoreCapacity, self->_minimalNumberOfBackingStores, self->_maximumNumberOfBackingStores, *(void *)&self->_backingStoreIdleTimeout];

  return v5;
}

- (CSReusableBufferPoolConfiguration)initWithBackingStoreCapacity:(unint64_t)a3 minimalNumberOfBackingStores:(unint64_t)a4 maximumNumberOfBackingStores:(unint64_t)a5 backingStoreIdleTimeout:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)CSReusableBufferPoolConfiguration;
  result = [(CSReusableBufferPoolConfiguration *)&v11 init];
  if (result)
  {
    result->_backingStoreCapacity = a3;
    result->_minimalNumberOfBackingStores = a4;
    result->_maximumNumberOfBackingStores = a5;
    result->_backingStoreIdleTimeout = a6;
  }
  return result;
}

@end