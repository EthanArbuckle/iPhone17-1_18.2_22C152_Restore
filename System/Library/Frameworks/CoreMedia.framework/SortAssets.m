@interface SortAssets
@end

@implementation SortAssets

uint64_t __figMobileAsset_SortAssets_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "attributes"), "objectForKey:", @"_ContentVersion");
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectForKey:", @"_ContentVersion");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = (void *)v4;
  }
  else {
    v6 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (v7) {
      uint64_t v9 = -1;
    }
    else {
      uint64_t v9 = 0;
    }
    if (v6) {
      return 1;
    }
    else {
      return v9;
    }
  }
  else
  {
    return [v6 compare:v7];
  }
}

@end