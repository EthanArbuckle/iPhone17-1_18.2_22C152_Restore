@interface NSString(MRUTextSize)
- (double)mru_textSizeForFont:()MRUTextSize boundingSize:;
@end

@implementation NSString(MRUTextSize)

- (double)mru_textSizeForFont:()MRUTextSize boundingSize:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = *MEMORY[0x1E4FB06F8];
  v15[0] = a5;
  v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a5;
  v10 = [v8 dictionaryWithObjects:v15 forKeys:&v14 count:1];

  objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:", 1, v10, 0, a2, a3);
  double v12 = v11;

  return v12;
}

@end