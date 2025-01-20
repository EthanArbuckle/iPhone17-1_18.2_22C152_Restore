@interface NSDictionary(ATXScoreLogSerializable)
- (uint64_t)atx_writeToFile:()ATXScoreLogSerializable;
@end

@implementation NSDictionary(ATXScoreLogSerializable)

- (uint64_t)atx_writeToFile:()ATXScoreLogSerializable
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 count];
  v6 = (void *)((char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v6, 8 * v5);
  [a1 getObjects:0 andKeys:v6 count:v5];
  CFQSortArray();
  fwrite("{\n", 2uLL, 1uLL, a3);
  for (; v5; --v5)
  {
    objc_msgSend((id)*v6, "atx_writeToFile:", a3);
    fwrite(": ", 2uLL, 1uLL, a3);
    v7 = [a1 objectForKeyedSubscript:*v6];
    objc_msgSend(v7, "atx_writeToFile:", a3);

    if (v5 != 1) {
      fputc(44, a3);
    }
    fputc(10, a3);
    ++v6;
  }
  return fputc(125, a3);
}

@end