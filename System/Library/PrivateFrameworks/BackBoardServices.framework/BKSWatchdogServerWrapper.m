@interface BKSWatchdogServerWrapper
- (int)_BKSWatchdogGetIsAlive:(unsigned int)a3 isAlive:(char *)a4 timeout:(unsigned int)a5;
@end

@implementation BKSWatchdogServerWrapper

- (int)_BKSWatchdogGetIsAlive:(unsigned int)a3 isAlive:(char *)a4 timeout:(unsigned int)a5
{
  return _BKSWatchdogGetIsAlive(a3, a4, a5);
}

@end