@interface NSMethodSignature
- (int64_t)argumentIndexForClass:(Class)a3;
@end

@implementation NSMethodSignature

- (int64_t)argumentIndexForClass:(Class)a3
{
  v4 = NSStringFromClass(a3);
  v5 = +[NSString stringWithFormat:@"@\"%@\"", v4];

  if ([(NSMethodSignature *)self numberOfArguments])
  {
    int64_t v6 = 0;
    while (1)
    {
      v7 = self;
      if (!strcmp(-[NSMethodSignature getArgumentTypeAtIndex:](v7, "getArgumentTypeAtIndex:", v6), (const char *)[v5 UTF8String]))break; {
      if (++v6 >= [(NSMethodSignature *)v7 numberOfArguments])
      }
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

@end