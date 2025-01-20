@interface NSInvocation
- (int64_t)blockArgumentIndex;
@end

@implementation NSInvocation

- (int64_t)blockArgumentIndex
{
  v2 = [(NSInvocation *)self methodSignature];
  id v3 = [v2 numberOfArguments];
  if ((unint64_t)v3 < 3)
  {
LABEL_5:
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v4 = v3;
    int64_t v5 = 2;
    while (strcmp((const char *)[v2 getArgumentTypeAtIndex:v5], "@?"))
    {
      if (v4 == (id)++v5) {
        goto LABEL_5;
      }
    }
  }

  return v5;
}

@end