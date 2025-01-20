@interface AppleDeviceQueryLockerSupport
- (AppleDeviceQueryCacheSupport)keysCacheForCopyValue;
- (void)initData;
- (void)logHandler;
- (void)setKeysCacheForCopyValue:(id)a3;
- (void)setLogHandler:(void *)a3;
@end

@implementation AppleDeviceQueryLockerSupport

- (void)initData
{
  initPthreadRecursiveMutex(&self->recursiveMutexForCopyValue);
  self->_keysCacheForCopyValue = [[AppleDeviceQueryCacheSupport alloc] initWithName:@"ZCV" andCapacity:&unk_26FC2CE60 andCacheType:0];

  MEMORY[0x270F9A758]();
}

- (void)logHandler
{
  return self->_logHandler;
}

- (void)setLogHandler:(void *)a3
{
  self->_logHandler = a3;
}

- (AppleDeviceQueryCacheSupport)keysCacheForCopyValue
{
  return (AppleDeviceQueryCacheSupport *)objc_getProperty(self, a2, 80, 1);
}

- (void)setKeysCacheForCopyValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end