@interface NSDictionary
@end

@implementation NSDictionary

void __48__NSDictionary_IAMSubset__isSubsetOfDictionary___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  id v7 = a3;
  v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
  if ([v7 isNSDictionary] && objc_msgSend(v8, "isNSDictionary"))
  {
    v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
    char v10 = [v7 isSubsetOfDictionary:v9];
LABEL_4:
    char v11 = v10;

    if (v11) {
      goto LABEL_16;
    }
LABEL_15:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_16;
  }
  if ([v8 isNSNumber])
  {
    if ([v7 isNSString])
    {
      v9 = [v8 stringValue];
      if (([v7 isEqual:v9] & 1) == 0)
      {

        goto LABEL_15;
      }
      if (([v7 isNSNumber] & 1) == 0)
      {

        goto LABEL_16;
      }
      char v10 = [v7 isEqual:v8];
      goto LABEL_4;
    }
    if (([v7 isNSNumber] & 1) == 0) {
      goto LABEL_16;
    }
  }
  if (([v7 isEqual:v8] & 1) == 0) {
    goto LABEL_15;
  }
LABEL_16:
}

@end