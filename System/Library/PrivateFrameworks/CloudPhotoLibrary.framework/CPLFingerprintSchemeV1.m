@interface CPLFingerprintSchemeV1
- (BOOL)isValidSignatureBytes:(const void *)a3;
- (id)fingerprintSchemeDescription;
- (void)_createSignatureGenerator;
@end

@implementation CPLFingerprintSchemeV1

- (BOOL)isValidSignatureBytes:(const void *)a3
{
  return +[CPLFingerprintScheme isMMCSv1SignatureBytes:a3];
}

- (id)fingerprintSchemeDescription
{
  return @"MMCSv1";
}

- (void)_createSignatureGenerator
{
  return (void **)MEMORY[0x1F412C458](self, a2);
}

@end