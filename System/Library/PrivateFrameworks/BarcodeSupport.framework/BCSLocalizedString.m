@interface BCSLocalizedString
@end

@implementation BCSLocalizedString

void ___BCSLocalizedString_block_invoke(uint64_t a1)
{
  v2 = (const char *)dyld_image_path_containing_address();
  v3 = [MEMORY[0x263F08850] defaultManager];
  [v3 stringWithFileSystemRepresentation:v2 length:strlen(v2)];
  id v8 = (id)_CFBundleCopyFrameworkURLForExecutablePath();

  uint64_t v4 = (uint64_t)v8;
  if (!v8)
  {
    [NSURL fileURLWithFileSystemRepresentation:v2 isDirectory:0 relativeToURL:0];
    uint64_t v4 = _CFBundleCopyBundleURLForExecutableURL();
  }
  id v9 = (id)v4;
  uint64_t v5 = [MEMORY[0x263F086E0] bundleWithURL:v4];
  v6 = *(void ***)(a1 + 32);
  v7 = *v6;
  *v6 = (void *)v5;
}

@end