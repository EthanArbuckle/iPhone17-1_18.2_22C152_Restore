@interface DigestVerifier
@end

@implementation DigestVerifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashDigest, 0);
  objc_storeStrong((id *)&self->_digest, 0);
}

@end