@interface EFLocalizedStringFromTable
@end

@implementation EFLocalizedStringFromTable

void ___EFLocalizedStringFromTable_block_invoke(uint64_t a1)
{
  if (**(void **)(a1 + 32)) {
    ___EFLocalizedStringFromTable_block_invoke_cold_1();
  }
  v2 = (const char *)dyld_image_path_containing_address();
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v8 stringWithFileSystemRepresentation:v2 length:strlen(v2)];
  uint64_t v3 = _CFBundleCopyFrameworkURLForExecutablePath();

  uint64_t v4 = v3;
  if (!v3)
  {
    [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v2 isDirectory:0 relativeToURL:0];
    uint64_t v4 = _CFBundleCopyBundleURLForExecutableURL();
    if (!v4) {
      __assert_rtn("_EFLocalizedStringFromTable_block_invoke", "EFLocalizableStrings.m", 32, "URL");
    }
  }
  id v9 = (id)v4;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithURL:");
  v6 = *(void ***)(a1 + 32);
  v7 = *v6;
  *v6 = (void *)v5;

  if (!**(void **)(a1 + 32)) {
    __assert_rtn("_EFLocalizedStringFromTable_block_invoke", "EFLocalizableStrings.m", 35, "*bundle");
  }
}

void ___EFLocalizedStringFromTable_block_invoke_cold_1()
{
}

@end