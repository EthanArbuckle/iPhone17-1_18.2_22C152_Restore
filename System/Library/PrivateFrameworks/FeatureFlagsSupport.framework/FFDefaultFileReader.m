@interface FFDefaultFileReader
- (id)contentsOfDirectoryAtURL:(id)a3 error:(id *)a4;
- (id)dictionaryWithContentsOfURL:(id)a3 error:(id *)a4;
@end

@implementation FFDefaultFileReader

- (id)dictionaryWithContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:a3];
  v6 = (void *)v5;
  if (a4 && !v5)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
  }
  return v6;
}

- (id)contentsOfDirectoryAtURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28CB8];
  id v6 = a3;
  v7 = [v5 defaultManager];
  v8 = [v7 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:0 options:5 error:a4];

  return v8;
}

@end