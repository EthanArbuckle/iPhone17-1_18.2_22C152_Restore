@interface GCVirtualControllerSaturationVibrancyEffect
@end

@implementation GCVirtualControllerSaturationVibrancyEffect

void __GCVirtualControllerSaturationVibrancyEffect_block_invoke(id a1)
{
  v3[0] = xmmword_DE50;
  v3[1] = xmmword_DE60;
  v3[2] = xmmword_DE70;
  v3[3] = xmmword_DE80;
  v3[4] = xmmword_DE90;
  uint64_t v1 = +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:v3 alpha:0.5];
  v2 = (void *)GCVirtualControllerSaturationVibrancyEffect_sharedEffect;
  GCVirtualControllerSaturationVibrancyEffect_sharedEffect = v1;
}

@end