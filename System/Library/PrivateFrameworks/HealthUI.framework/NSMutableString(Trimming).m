@interface NSMutableString(Trimming)
- (void)_hk_trimCharactersInSet:()Trimming;
- (void)_hk_trimString:()Trimming;
- (void)_hk_trimStrings:()Trimming;
@end

@implementation NSMutableString(Trimming)

- (void)_hk_trimStrings:()Trimming
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(a1, "_hk_trimString:", *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_hk_trimString:()Trimming
{
  id v8 = a3;
  uint64_t v4 = objc_msgSend(a1, "rangeOfString:");
  if (v5) {
    objc_msgSend(a1, "deleteCharactersInRange:", v4, v5);
  }
  uint64_t v6 = [a1 rangeOfString:v8 options:4];
  if (v7) {
    objc_msgSend(a1, "deleteCharactersInRange:", v6, v7);
  }
}

- (void)_hk_trimCharactersInSet:()Trimming
{
  id v8 = a3;
  uint64_t v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:");
  if (v5) {
    objc_msgSend(a1, "deleteCharactersInRange:", v4, v5);
  }
  uint64_t v6 = [a1 rangeOfCharacterFromSet:v8 options:4];
  if (v7) {
    objc_msgSend(a1, "deleteCharactersInRange:", v6, v7);
  }
}

@end