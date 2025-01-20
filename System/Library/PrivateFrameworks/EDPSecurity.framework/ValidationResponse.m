@interface ValidationResponse
- (BOOL)isTrusted;
- (NSArray)certificateChain;
- (NSData)validatedData;
- (void)setCertificateChain:(id)a3;
- (void)setIsTrusted:(BOOL)a3;
- (void)setValidatedData:(id)a3;
@end

@implementation ValidationResponse

- (NSData)validatedData
{
  return self->validatedData;
}

- (void)setValidatedData:(id)a3
{
}

- (BOOL)isTrusted
{
  return self->isTrusted;
}

- (void)setIsTrusted:(BOOL)a3
{
  self->isTrusted = a3;
}

- (NSArray)certificateChain
{
  return self->certificateChain;
}

- (void)setCertificateChain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->certificateChain, 0);
  objc_storeStrong((id *)&self->validatedData, 0);
}

@end