@interface CCFileTransferSessionInitiatedResponse
+ (id)fileTransferSessionInitiatedResponseFromPeerToPeerMessage:(id)a3 peerPublicKey:(id)a4;
@end

@implementation CCFileTransferSessionInitiatedResponse

+ (id)fileTransferSessionInitiatedResponseFromPeerToPeerMessage:(id)a3 peerPublicKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [CCFileTransferSessionInitiatedResponse alloc];
  v8 = [v6 device];
  uint64_t v9 = [v6 protocolVersion];
  [v6 walltime];
  double v11 = v10;
  v12 = [v6 peerPublicKey];

  v13 = [(CCPeerToPeerMessage *)v7 initWithDevice:v8 protocolVersion:v9 wallTime:v12 peerPublicKey:v11];
  [(CCPeerToPeerMessage *)v13 setPeerPublicKey:v5];

  return v13;
}

@end