@interface EAREmojiRecognition
@end

@implementation EAREmojiRecognition

void __73___EAREmojiRecognition_recognizeEmojisInInputString_enumerateUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v3);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v13 + 1) + 8 * v8);
        v10 = *(void **)(a1 + 32);
        v11 = [v9 string];
        v12 = [v10 baseStringForEmojiString:v11];

        [v4 addObject:v12];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end