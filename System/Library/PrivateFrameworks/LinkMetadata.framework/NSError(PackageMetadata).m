@interface NSError(PackageMetadata)
+ (id)errorWithErrno:()PackageMetadata forFilePath:;
@end

@implementation NSError(PackageMetadata)

+ (id)errorWithErrno:()PackageMetadata forFilePath:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28798];
  uint64_t v6 = a3;
  if (a4)
  {
    uint64_t v12 = *MEMORY[0x1E4F28328];
    v13[0] = a4;
    v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = a4;
    v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v10 = [v4 errorWithDomain:v5 code:v6 userInfo:v9];
  }
  else
  {
    v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:a3 userInfo:0];
  }
  return v10;
}

@end