@interface NSArray(AXEventPathInfoRepresentationExtension)
- (id)firstPath;
- (id)secondPath;
@end

@implementation NSArray(AXEventPathInfoRepresentationExtension)

- (id)firstPath
{
  v2 = (void *)[a1 count];
  if (v2)
  {
    v3 = [a1 objectAtIndex:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v2 = 0;
    if (isKindOfClass)
    {
      v2 = [a1 objectAtIndex:0];
    }
  }

  return v2;
}

- (id)secondPath
{
  if ((unint64_t)[a1 count] >= 2
    && ([a1 objectAtIndex:1],
        v2 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v2,
        (isKindOfClass & 1) != 0))
  {
    v4 = [a1 objectAtIndex:1];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end