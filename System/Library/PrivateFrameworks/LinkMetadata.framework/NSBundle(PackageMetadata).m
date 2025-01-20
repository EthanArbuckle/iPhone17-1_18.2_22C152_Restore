@interface NSBundle(PackageMetadata)
- (id)executablePathWithError:()PackageMetadata;
@end

@implementation NSBundle(PackageMetadata)

- (id)executablePathWithError:()PackageMetadata
{
  uint64_t v5 = [a1 executablePath];
  v6 = (void *)v5;
  if (a3 && !v5)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    v8 = [a1 bundlePath];
    *a3 = [v7 errorWithErrno:79 forFilePath:v8];
  }
  return v6;
}

@end