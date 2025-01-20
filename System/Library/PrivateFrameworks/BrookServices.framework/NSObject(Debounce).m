@interface NSObject(Debounce)
- (void)brk_debounce:()Debounce withObject:delay:;
@end

@implementation NSObject(Debounce)

- (void)brk_debounce:()Debounce withObject:delay:
{
  v8 = (void *)MEMORY[0x263F8C6D0];
  id v9 = a5;
  [v8 cancelPreviousPerformRequestsWithTarget:a1 selector:a4 object:v9];
  [a1 performSelector:a4 withObject:v9 afterDelay:a2];
}

@end