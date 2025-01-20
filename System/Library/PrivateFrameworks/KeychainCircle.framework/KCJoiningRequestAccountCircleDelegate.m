@interface KCJoiningRequestAccountCircleDelegate
+ (id)delegate;
- (BOOL)processCircleJoinData:(id)a3 version:(int)a4 error:(id *)a5;
- (__OpaqueSOSPeerInfo)copyPeerInfoError:(id *)a3;
@end

@implementation KCJoiningRequestAccountCircleDelegate

- (BOOL)processCircleJoinData:(id)a3 version:(int)a4 error:(id *)a5
{
  return SOSCCJoinWithCircleJoiningBlob();
}

- (__OpaqueSOSPeerInfo)copyPeerInfoError:(id *)a3
{
  return (__OpaqueSOSPeerInfo *)SOSCCCopyApplication();
}

+ (id)delegate
{
  v2 = objc_alloc_init(KCJoiningRequestAccountCircleDelegate);
  return v2;
}

@end