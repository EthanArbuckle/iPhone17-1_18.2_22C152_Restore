@interface CKUnexpectedlyLoggedOutHandleDependentValueChanged
@end

@implementation CKUnexpectedlyLoggedOutHandleDependentValueChanged

void ___CKUnexpectedlyLoggedOutHandleDependentValueChanged_block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"com.apple.ChatKit.IsUnexpectedlyLoggedOutChanged" object:0];
}

@end