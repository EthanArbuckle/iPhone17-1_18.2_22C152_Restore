@interface NSRunLoop(MKAdditions)
+ (id)_mapkit_networkIORunLoop;
+ (void)set_mapkit_networkIORunLoop:()MKAdditions;
@end

@implementation NSRunLoop(MKAdditions)

+ (id)_mapkit_networkIORunLoop
{
  pthread_once(&_initNetworkIOThread, (void (*)(void))initNetworkIOThread);
  v0 = (void *)_mapkit_networkIORunLoop;

  return v0;
}

+ (void)set_mapkit_networkIORunLoop:()MKAdditions
{
  id v4 = a3;
  if ((id)_mapkit_networkIORunLoop != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&_mapkit_networkIORunLoop, a3);
    id v4 = v5;
  }
}

@end