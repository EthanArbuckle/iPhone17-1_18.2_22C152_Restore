@interface CSLDeviceIsVictory
@end

@implementation CSLDeviceIsVictory

void ___CSLDeviceIsVictory_block_invoke()
{
  id v0 = (id)MGCopyAnswer();
  _CSLDeviceIsVictory_isVictory = [v0 intValue] == 2;
}

@end