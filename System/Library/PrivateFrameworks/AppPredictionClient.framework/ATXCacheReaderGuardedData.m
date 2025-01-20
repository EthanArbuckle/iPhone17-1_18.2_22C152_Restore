@interface ATXCacheReaderGuardedData
- (ATXCacheReaderGuardedData)init;
@end

@implementation ATXCacheReaderGuardedData

- (ATXCacheReaderGuardedData)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATXCacheReaderGuardedData;
  result = [(ATXCacheReaderGuardedData *)&v3 init];
  if (result) {
    result->_cacheFileDescriptor = -1;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end