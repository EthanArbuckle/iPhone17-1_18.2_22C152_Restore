@interface LNDialog(CATSupport)
- (void)getResultWithCompletionHandler:()CATSupport;
@end

@implementation LNDialog(CATSupport)

- (void)getResultWithCompletionHandler:()CATSupport
{
  id v3 = a3;
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-[LNDialog getResultWithCompletionHandler:] must be overridden"];
  __break(1u);
}

@end