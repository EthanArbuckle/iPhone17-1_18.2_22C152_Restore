@interface NSData
@end

@implementation NSData

id __53__NSData_ContactsFoundation___cn_writeToURL_options___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) writeToURL:*(void *)(a1 + 40) options:*(void *)(a1 + 48) error:a2])v3 = *(void **)(a1 + 40); {
  else
  }
    v3 = 0;

  return v3;
}

@end