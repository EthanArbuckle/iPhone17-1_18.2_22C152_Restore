@interface SignatureResponse
- (NSData)signature;
- (NSError)error;
- (void)setError:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation SignatureResponse

- (NSData)signature
{
  return self->signature;
}

- (void)setSignature:(id)a3
{
}

- (NSError)error
{
  return self->error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->error, 0);
  objc_storeStrong((id *)&self->signature, 0);
}

@end