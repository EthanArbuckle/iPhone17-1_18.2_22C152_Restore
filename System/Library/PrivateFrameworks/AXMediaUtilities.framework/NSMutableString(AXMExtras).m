@interface NSMutableString(AXMExtras)
+ (id)axmIndentationString:()AXMExtras;
- (void)axmAppendIndentation:()AXMExtras;
@end

@implementation NSMutableString(AXMExtras)

- (void)axmAppendIndentation:()AXMExtras
{
  objc_msgSend(MEMORY[0x1E4F28E78], "axmIndentationString:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 appendString:v2];
}

+ (id)axmIndentationString:()AXMExtras
{
  v4 = [MEMORY[0x1E4F28E78] string];
  if (a3 >= 1)
  {
    do
    {
      [v4 appendString:@" "];
      --a3;
    }
    while (a3);
  }

  return v4;
}

@end