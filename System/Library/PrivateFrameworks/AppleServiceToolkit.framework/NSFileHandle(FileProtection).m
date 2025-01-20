@interface NSFileHandle(FileProtection)
+ (id)fileHandleForCreatingURL:()FileProtection protection:error:;
@end

@implementation NSFileHandle(FileProtection)

+ (id)fileHandleForCreatingURL:()FileProtection protection:error:
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqual:*MEMORY[0x263F08080]])
  {
    int v7 = 1;
  }
  else if ([v6 isEqual:*MEMORY[0x263F08088]])
  {
    int v7 = 2;
  }
  else if ([v6 isEqual:*MEMORY[0x263F080B0]])
  {
    int v7 = 4;
  }
  else
  {
    int v7 = 3;
  }
  id v8 = [v5 path];
  uint64_t v9 = open_dprotected_np((const char *)[v8 UTF8String], 2562, v7, 0, 416);

  if ((v9 & 0x80000000) != 0) {
    v10 = 0;
  }
  else {
    v10 = (void *)[objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v9];
  }

  return v10;
}

@end