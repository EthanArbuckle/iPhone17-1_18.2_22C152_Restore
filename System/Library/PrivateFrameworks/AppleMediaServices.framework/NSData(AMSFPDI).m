@interface NSData(AMSFPDI)
+ (id)ams_createDataWithFPDIResult:()AMSFPDI length:;
@end

@implementation NSData(AMSFPDI)

+ (id)ams_createDataWithFPDIResult:()AMSFPDI length:
{
  if (a4)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a3 length:a4 deallocator:&__block_literal_global_51];
  }
  else
  {
    v4 = [MEMORY[0x1E4F1C9B8] data];
  }
  return v4;
}

@end