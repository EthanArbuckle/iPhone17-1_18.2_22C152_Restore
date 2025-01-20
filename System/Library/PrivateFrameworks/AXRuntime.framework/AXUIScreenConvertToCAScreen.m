@interface AXUIScreenConvertToCAScreen
@end

@implementation AXUIScreenConvertToCAScreen

void ___AXUIScreenConvertToCAScreen_block_invoke()
{
  uint64_t v0 = [NSClassFromString((NSString *)@"UIScreen") valueForKey:@"mainScreen"];
  v1 = (void *)_AXUIScreenConvertToCAScreen_mainScreen;
  _AXUIScreenConvertToCAScreen_mainScreen = v0;

  v2 = [(id)_AXUIScreenConvertToCAScreen_mainScreen valueForKey:@"scale"];
  [v2 doubleValue];
  _AXUIScreenConvertToCAScreen_MainScale = v3;

  v4 = [(id)_AXUIScreenConvertToCAScreen_mainScreen valueForKey:@"_rotation"];
  [v4 doubleValue];
  _AXUIScreenConvertToCAScreen_MainRotation = v5;

  id v8 = [(id)_AXUIScreenConvertToCAScreen_mainScreen valueForKey:@"_unjailedReferenceBoundsInPixels"];
  [v8 rectValue];
  _AXUIScreenConvertToCAScreen_MainScreenSize_0 = v6;
  _AXUIScreenConvertToCAScreen_MainScreenSize_1 = v7;
}

@end