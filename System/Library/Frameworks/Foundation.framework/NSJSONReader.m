@interface NSJSONReader
@end

@implementation NSJSONReader

BOOL __51___NSJSONReader_validForJSON_depth_allowFragments___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  BOOL result = +[_NSJSONReader validForJSON:a2 depth:*(void *)(a1 + 40) + 1 allowFragments:1];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

uint64_t __51___NSJSONReader_validForJSON_depth_allowFragments___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = +[_NSJSONReader validForJSON:a3 depth:*(void *)(a1 + 40) + 1 allowFragments:1];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      return result;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  *a4 = 1;
  return result;
}

@end