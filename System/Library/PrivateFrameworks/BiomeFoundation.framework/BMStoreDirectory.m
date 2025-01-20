@interface BMStoreDirectory
+ (NSString)artifacts;
+ (NSString)bookmarks;
+ (NSString)client;
+ (NSString)compute;
+ (NSString)databases;
+ (NSString)flexibleStorage;
+ (NSString)localDevice;
+ (NSString)lock;
+ (NSString)metadata;
+ (NSString)nonwaking;
+ (NSString)persistent;
+ (NSString)private;
+ (NSString)public;
+ (NSString)remoteDevices;
+ (NSString)restricted;
+ (NSString)server;
+ (NSString)sessions;
+ (NSString)sets;
+ (NSString)setsMergeableDeltas;
+ (NSString)sharedSync;
+ (NSString)streams;
+ (NSString)subscriptions;
+ (NSString)sync;
+ (NSString)tmp;
+ (NSString)tombstones;
+ (void)setBasePathForTestingWithPath:(id)a3;
+ (void)unsetBasePathForTesting;
@end

@implementation BMStoreDirectory

+ (NSString)remoteDevices
{
  return (NSString *)@"remote";
}

+ (NSString)localDevice
{
  return (NSString *)@"local";
}

+ (NSString)metadata
{
  return (NSString *)@"metadata";
}

+ (NSString)tombstones
{
  return (NSString *)@"tombstone";
}

+ (NSString)sessions
{
  return (NSString *)@"sessions";
}

+ (NSString)bookmarks
{
  return (NSString *)@"bookmarks";
}

+ (NSString)server
{
  return (NSString *)@"server";
}

+ (NSString)tmp
{
  return (NSString *)@"tmp";
}

+ (NSString)compute
{
  return (NSString *)@"compute";
}

+ (NSString)lock
{
  return (NSString *)@"lock";
}

+ (NSString)subscriptions
{
  return (NSString *)@"subscriptions";
}

+ (NSString)client
{
  return (NSString *)@"client";
}

+ (NSString)streams
{
  return (NSString *)@"streams";
}

+ (NSString)restricted
{
  return (NSString *)@"restricted";
}

+ (NSString)public
{
  return (NSString *)@"public";
}

+ (NSString)sets
{
  return (NSString *)@"sets";
}

+ (NSString)flexibleStorage
{
  return (NSString *)@"FlexibleStorage";
}

+ (void)setBasePathForTestingWithPath:(id)a3
{
}

+ (void)unsetBasePathForTesting
{
}

+ (NSString)databases
{
  return (NSString *)@"databases";
}

+ (NSString)private
{
  return (NSString *)@"private";
}

+ (NSString)artifacts
{
  return (NSString *)@"artifacts";
}

+ (NSString)persistent
{
  return (NSString *)@"persistent";
}

+ (NSString)nonwaking
{
  return (NSString *)@"nonwaking";
}

+ (NSString)sync
{
  return (NSString *)@"sync";
}

+ (NSString)sharedSync
{
  return (NSString *)@"sharedSync";
}

+ (NSString)setsMergeableDeltas
{
  return (NSString *)@"setsMergeableDeltas";
}

@end