@interface PQLConnection(SwiftWorkaround)
- (void)setAutoRollbackHandlerForSwift:()SwiftWorkaround;
@end

@implementation PQLConnection(SwiftWorkaround)

- (void)setAutoRollbackHandlerForSwift:()SwiftWorkaround
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__PQLConnection_SwiftWorkaround__setAutoRollbackHandlerForSwift___block_invoke;
  v6[3] = &unk_265307660;
  id v7 = v4;
  id v5 = v4;
  [a1 setAutoRollbackHandler:v6];
}

@end