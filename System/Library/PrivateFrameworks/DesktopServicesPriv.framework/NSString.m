@interface NSString
@end

@implementation NSString

void __56__NSString_DSAdditions__ds_commonParentPathForItemURLs___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count] > a3)
  {
    v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:a3];
    char v8 = [v12 isEqualToString:v7];

    if (v8) {
      goto LABEL_5;
    }
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 0, a3);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  *a4 = 1;
LABEL_5:
}

@end