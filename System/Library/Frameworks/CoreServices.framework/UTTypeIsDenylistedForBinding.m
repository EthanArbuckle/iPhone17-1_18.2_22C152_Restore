@interface UTTypeIsDenylistedForBinding
@end

@implementation UTTypeIsDenylistedForBinding

void ___UTTypeIsDenylistedForBinding_block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v3[0] = @"com.apple.mobileconfig";
  v3[1] = @"com.apple.mobileprovision";
  v3[2] = @"public.x509-certificate";
  v3[3] = @"com.rsa.pkcs-12";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:4];
  uint64_t v1 = [MEMORY[0x1E4F1CAD0] setWithArray:v0];
  v2 = (void *)_UTTypeIsDenylistedForBinding::denyListedTypes;
  _UTTypeIsDenylistedForBinding::denyListedTypes = v1;
}

@end