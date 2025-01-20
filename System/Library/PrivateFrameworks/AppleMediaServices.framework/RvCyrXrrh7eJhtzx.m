@interface RvCyrXrrh7eJhtzx
- (NSData)challengeResponse;
- (NSData)hostChallenge;
- (NSData)nonce;
- (NSString)seid;
- (void)setChallengeResponse:(id)a3;
- (void)setHostChallenge:(id)a3;
- (void)setNonce:(id)a3;
- (void)setSeid:(id)a3;
@end

@implementation RvCyrXrrh7eJhtzx

- (NSData)hostChallenge
{
  return self->_hostChallenge;
}

- (void)setHostChallenge:(id)a3
{
}

- (NSData)challengeResponse
{
  return self->_challengeResponse;
}

- (void)setChallengeResponse:(id)a3
{
}

- (NSString)seid
{
  return self->_seid;
}

- (void)setSeid:(id)a3
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_challengeResponse, 0);
  objc_storeStrong((id *)&self->_hostChallenge, 0);
}

@end