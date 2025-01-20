@interface NSArray(ATXScoreLogSerializable)
- (uint64_t)atx_writeToFile:()ATXScoreLogSerializable;
@end

@implementation NSArray(ATXScoreLogSerializable)

- (uint64_t)atx_writeToFile:()ATXScoreLogSerializable
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 count];
  fwrite("[\n", 2uLL, 1uLL, a3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    uint64_t v11 = 1 - v5;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "atx_writeToFile:", a3, (void)v14);
        if (v11 + v9 + i) {
          fprintf(a3, ",\n");
        }
        else {
          fprintf(a3, "\n");
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      v9 += i;
    }
    while (v8);
  }

  return fputc(93, a3);
}

@end