@interface CCFetchMergeableDeltasResponse
+ (id)fetchMergeableDeltasResponseFromPeerToPeerMessage:(id)a3;
@end

@implementation CCFetchMergeableDeltasResponse

+ (id)fetchMergeableDeltasResponseFromPeerToPeerMessage:(id)a3
{
  id v3 = a3;
  v4 = [CCFetchMergeableDeltasResponse alloc];
  v5 = [v3 device];
  uint64_t v6 = [v3 protocolVersion];
  [v3 walltime];
  double v8 = v7;
  v9 = [v3 peerPublicKey];

  v10 = [(CCPeerToPeerMessage *)v4 initWithDevice:v5 protocolVersion:v6 wallTime:v9 peerPublicKey:v8];
  return v10;
}

@end