@interface NSInvocation(NSInvocationDebugDescription)
- (NSMutableString)debugDescription;
@end

@implementation NSInvocation(NSInvocationDebugDescription)

- (NSMutableString)debugDescription
{
  v2 = (void *)[a1 methodSignature];
  uint64_t v3 = [v2 _frameDescriptor];
  uint64_t v4 = [v2 numberOfArguments];
  v5 = [[NSMutableString alloc] initWithCapacity:100];
  [(NSMutableString *)v5 appendFormat:@"<NSInvocation: %p>\n", a1];
  [(NSMutableString *)v5 appendFormat:@"return value: "];
  appendArgumentInfoToDescription(a1, 0, *(uint64_t **)v3, 1, v5);
  if (v4)
  {
    [(NSMutableString *)v5 appendFormat:@"target: "];
    v6 = *(uint64_t **)(v3 + 8);
    appendArgumentInfoToDescription(a1, 0, v6, 0, v5);
    if (v4 != 1)
    {
      uint64_t v7 = v6[1];
      if (v7)
      {
        uint64_t v8 = 1;
        do
        {
          if (v8 == 1 && *(unsigned char *)(v7 + 36) == 58)
          {
            v9 = v5;
            v10 = @"selector: ";
          }
          else
          {
            uint64_t v12 = v8;
            v9 = v5;
            v10 = @"argument %lu: ";
          }
          -[NSMutableString appendFormat:](v9, "appendFormat:", v10, v12);
          appendArgumentInfoToDescription(a1, v8++, (uint64_t *)v7, 0, v5);
          uint64_t v7 = *(void *)(v7 + 8);
        }
        while (v7);
      }
    }
  }

  return v5;
}

@end