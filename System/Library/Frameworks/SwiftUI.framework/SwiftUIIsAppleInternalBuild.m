@interface SwiftUIIsAppleInternalBuild
@end

@implementation SwiftUIIsAppleInternalBuild

uint64_t ___SwiftUIIsAppleInternalBuild_block_invoke()
{
  uint64_t result = os_variant_allows_internal_security_policies();
  if (result) {
    uint64_t result = os_variant_has_internal_content();
  }
  _SwiftUIIsAppleInternalBuild_isInternal = result;
  return result;
}

@end