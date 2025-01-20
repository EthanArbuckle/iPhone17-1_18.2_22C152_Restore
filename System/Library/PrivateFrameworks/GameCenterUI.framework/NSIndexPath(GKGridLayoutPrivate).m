@interface NSIndexPath(GKGridLayoutPrivate)
- (BOOL)_gkIsGlobal;
@end

@implementation NSIndexPath(GKGridLayoutPrivate)

- (BOOL)_gkIsGlobal
{
  return [a1 length] == 1;
}

@end