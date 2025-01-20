@interface NSURLQueryItem
@end

@implementation NSURLQueryItem

id __63__NSURLQueryItem_AppleMediaServices__queryItemsFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;

    if (v7) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = [NSString stringWithFormat:@"%@", v6];
LABEL_6:
  id v8 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;

    if (v9) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v9 = [NSString stringWithFormat:@"%@", v8];
LABEL_11:
  v10 = [MEMORY[0x1E4F290C8] queryItemWithName:v7 value:v9];

  return v10;
}

@end