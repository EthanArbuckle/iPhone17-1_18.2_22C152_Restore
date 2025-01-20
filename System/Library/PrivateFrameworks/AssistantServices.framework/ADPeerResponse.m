@interface ADPeerResponse
- (ADPeerInfo)peer;
- (NSError)error;
- (PBCodable)proto;
- (void)setError:(id)a3;
- (void)setPeer:(id)a3;
- (void)setProto:(id)a3;
@end

@implementation ADPeerResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_proto, 0);
  objc_storeStrong((id *)&self->_peer, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setProto:(id)a3
{
}

- (PBCodable)proto
{
  return self->_proto;
}

- (void)setPeer:(id)a3
{
}

- (ADPeerInfo)peer
{
  return self->_peer;
}

@end