@interface ETQuickTapMessage
+ (id)doubleTapMessageWithColor:(id)a3;
- (id)messageTypeAsString;
@end

@implementation ETQuickTapMessage

+ (id)doubleTapMessageWithColor:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ETQuickTapMessage);
  -[ETTapMessage addTapAtPoint:time:color:](v4, "addTapAtPoint:time:color:", v3, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 0.0);

  return v4;
}

- (id)messageTypeAsString
{
  return @"QuickTap";
}

@end