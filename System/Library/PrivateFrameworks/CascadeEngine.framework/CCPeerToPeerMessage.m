@interface CCPeerToPeerMessage
- (CCDevice)device;
- (CCPeerToPeerMessage)initWithDevice:(id)a3 protocolVersion:(unint64_t)a4 wallTime:(double)a5 peerPublicKey:(id)a6;
- (NSData)peerPublicKey;
- (double)walltime;
- (id)dictionaryRepresentation;
- (id)initFromDictionary:(id)a3;
- (unint64_t)protocolVersion;
- (void)setPeerPublicKey:(id)a3;
@end

@implementation CCPeerToPeerMessage

- (CCPeerToPeerMessage)initWithDevice:(id)a3 protocolVersion:(unint64_t)a4 wallTime:(double)a5 peerPublicKey:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CCPeerToPeerMessage;
  v13 = [(CCPeerToPeerMessage *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_device, a3);
    v14->_protocolVersion = a4;
    v14->_walltime = a5;
    objc_storeStrong((id *)&v14->_peerPublicKey, a6);
  }

  return v14;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CCPeerToPeerMessage;
  v5 = [(CCPeerToPeerMessage *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"protocolVersion"];
    v5->_protocolVersion = [v6 unsignedIntegerValue];

    v7 = [v4 objectForKeyedSubscript:@"walltime"];
    [v7 doubleValue];
    v5->_walltime = v8;

    id v9 = objc_alloc(MEMORY[0x263F31700]);
    v10 = [v4 objectForKeyedSubscript:@"deviceIdentifier"];
    uint64_t v11 = [v9 initWithIdentifier:v10 options:0];
    device = v5->_device;
    v5->_device = (CCDevice *)v11;

    uint64_t v13 = [v4 objectForKeyedSubscript:@"peerPublicKey"];
    peerPublicKey = v5->_peerPublicKey;
    v5->_peerPublicKey = (NSData *)v13;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v12[4] = *MEMORY[0x263EF8340];
  v11[0] = @"protocolVersion";
  v3 = [NSNumber numberWithUnsignedInteger:self->_protocolVersion];
  v12[0] = v3;
  v11[1] = @"walltime";
  id v4 = [NSNumber numberWithDouble:self->_walltime];
  v12[1] = v4;
  v11[2] = @"deviceIdentifier";
  v5 = [(CCDevice *)self->_device identifier];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x263EFF9D0] null];
  }
  v12[2] = v6;
  v11[3] = @"peerPublicKey";
  peerPublicKey = self->_peerPublicKey;
  double v8 = peerPublicKey;
  if (!peerPublicKey)
  {
    double v8 = [MEMORY[0x263EFF8F8] data];
  }
  v12[3] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  if (peerPublicKey)
  {
    if (v5) {
      goto LABEL_7;
    }
  }
  else
  {

    if (v5) {
      goto LABEL_7;
    }
  }

LABEL_7:
  return v9;
}

- (CCDevice)device
{
  return self->_device;
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (double)walltime
{
  return self->_walltime;
}

- (NSData)peerPublicKey
{
  return self->_peerPublicKey;
}

- (void)setPeerPublicKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPublicKey, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end