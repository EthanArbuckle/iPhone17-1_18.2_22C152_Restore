@interface HFHeaterCoolerItemUtilities
+ (id)targetHeatingCoolingModeValueInResponse:(id)a3;
@end

@implementation HFHeaterCoolerItemUtilities

+ (id)targetHeatingCoolingModeValueInResponse:(id)a3
{
  v3 = [a3 responseForCharacteristicType:*MEMORY[0x263F0C4D0]];
  v4 = [v3 valueWithExpectedClass:objc_opt_class()];

  return v4;
}

@end