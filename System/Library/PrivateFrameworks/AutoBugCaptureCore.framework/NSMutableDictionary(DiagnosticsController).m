@interface NSMutableDictionary(DiagnosticsController)
- (void)setActions:()DiagnosticsController forProcess:;
@end

@implementation NSMutableDictionary(DiagnosticsController)

- (void)setActions:()DiagnosticsController forProcess:
{
  id v7 = a3;
  id v6 = a4;
  if ([v6 length]) {
    [a1 setValue:v7 forKey:v6];
  }
}

@end