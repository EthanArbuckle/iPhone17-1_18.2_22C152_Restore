@interface NSMutableSet(AEAdditions)
- (void)ae_removeFirstMatching:()AEAdditions;
@end

@implementation NSMutableSet(AEAdditions)

- (void)ae_removeFirstMatching:()AEAdditions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
      if (v4[2](v4, v10)) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v11 = v10;

    if (!v11) {
      goto LABEL_13;
    }
    objc_msgSend(v5, "removeObject:", v11, (void)v12);
    id v5 = v11;
  }
LABEL_12:

LABEL_13:
}

@end