@interface NSArray
@end

@implementation NSArray

void __50__NSArray_AVTExtension__avt_mutableContainersCopy__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  char v3 = objc_opt_respondsToSelector();
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = objc_msgSend(v7, "avt_mutableContainersCopy");

    id v6 = (id)v5;
  }
  else
  {
    id v6 = v7;
  }
  id v8 = v6;
  [v4 addObject:v6];
}

@end