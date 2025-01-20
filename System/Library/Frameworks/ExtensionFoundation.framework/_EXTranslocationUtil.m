@interface _EXTranslocationUtil
+ (id)makeSecureDirectoryForURL:(id)a3 error:(id *)a4;
@end

@implementation _EXTranslocationUtil

+ (id)makeSecureDirectoryForURL:(id)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "_EX_unimplementedError", a3);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

@end