@interface NSMutableArray(BaseBoard)
- (void)bs_safeAddObject:()BaseBoard;
@end

@implementation NSMutableArray(BaseBoard)

- (void)bs_safeAddObject:()BaseBoard
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end