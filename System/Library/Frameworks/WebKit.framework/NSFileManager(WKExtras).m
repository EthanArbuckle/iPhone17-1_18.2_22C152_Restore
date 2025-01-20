@interface NSFileManager(WKExtras)
+ (uint64_t)_web_createTemporaryFileForQuickLook:()WKExtras;
@end

@implementation NSFileManager(WKExtras)

+ (uint64_t)_web_createTemporaryFileForQuickLook:()WKExtras
{
  return MEMORY[0x1F4171FA0](a3);
}

@end