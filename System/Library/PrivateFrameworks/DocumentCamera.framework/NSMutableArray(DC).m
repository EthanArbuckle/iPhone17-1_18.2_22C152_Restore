@interface NSMutableArray(DC)
- (void)dc_addNonNilObject:()DC;
- (void)dc_insertNonNilObject:()DC atIndex:;
@end

@implementation NSMutableArray(DC)

- (void)dc_addNonNilObject:()DC
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

- (void)dc_insertNonNilObject:()DC atIndex:
{
  id v6 = a3;
  if ((a4 & 0x8000000000000000) != 0)
  {
    v8 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NSMutableArray(DC) dc_insertNonNilObject:atIndex:](a4, v8);
    }
  }
  else if ([a1 count] >= a4)
  {
    if (v6) {
      [a1 insertObject:v6 atIndex:a4];
    }
  }
  else
  {
    v7 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NSMutableArray(DC) dc_insertNonNilObject:atIndex:](a1, a4, v7);
    }
  }
}

- (void)dc_insertNonNilObject:()DC atIndex:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217885000, a2, OS_LOG_TYPE_ERROR, "Trying to insert object in mutableArray at negative index %ld", (uint8_t *)&v2, 0xCu);
}

- (void)dc_insertNonNilObject:()DC atIndex:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = [a1 count];
  _os_log_error_impl(&dword_217885000, a3, OS_LOG_TYPE_ERROR, "Trying to insert object in mutableArray at index (%ld) greater than count (%ld)", (uint8_t *)&v4, 0x16u);
}

@end