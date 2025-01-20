@interface GKViceroyNATTypeHelper
+ (BOOL)isClosed:(unint64_t)a3;
+ (BOOL)isUnknown:(unint64_t)a3;
+ (unint64_t)forceRelayNATType;
+ (unint64_t)initialNATType;
@end

@implementation GKViceroyNATTypeHelper

+ (unint64_t)initialNATType
{
  return 0;
}

+ (unint64_t)forceRelayNATType
{
  return 3;
}

+ (BOOL)isUnknown:(unint64_t)a3
{
  return a3 == 0;
}

+ (BOOL)isClosed:(unint64_t)a3
{
  return a3 == 4;
}

@end