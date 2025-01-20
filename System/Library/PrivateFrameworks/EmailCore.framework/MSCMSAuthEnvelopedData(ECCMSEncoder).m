@interface MSCMSAuthEnvelopedData(ECCMSEncoder)
- (uint64_t)type;
@end

@implementation MSCMSAuthEnvelopedData(ECCMSEncoder)

- (uint64_t)type
{
  return [MEMORY[0x1E4F77E08] OIDWithString:*MEMORY[0x1E4F77D18] error:0];
}

@end