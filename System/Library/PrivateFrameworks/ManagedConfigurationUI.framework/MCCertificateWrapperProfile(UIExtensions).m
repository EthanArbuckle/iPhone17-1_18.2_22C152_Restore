@interface MCCertificateWrapperProfile(UIExtensions)
- (uint64_t)shouldHideUnstrustedLabel;
- (uint64_t)shouldUseTrustedNomenclature;
@end

@implementation MCCertificateWrapperProfile(UIExtensions)

- (uint64_t)shouldHideUnstrustedLabel
{
  return 1;
}

- (uint64_t)shouldUseTrustedNomenclature
{
  return 1;
}

@end