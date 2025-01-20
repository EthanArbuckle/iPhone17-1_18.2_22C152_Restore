@interface CalSetupDefaultProdID
@end

@implementation CalSetupDefaultProdID

void ___CalSetupDefaultProdID_block_invoke()
{
  v0 = (void *)MEMORY[0x1E4FB7F00];
  id v1 = (id)[MEMORY[0x1E4F57830] copyString];
  [v0 setDefaultProdid:v1];
}

@end