@interface GCVirtualControllerAdditiveVibrancyEffectView
@end

@implementation GCVirtualControllerAdditiveVibrancyEffectView

void __GCVirtualControllerAdditiveVibrancyEffectView_block_invoke(id a1)
{
  id v3 = +[UIColor colorWithWhite:1.0 alpha:0.800000012];
  uint64_t v1 = +[UIVibrancyEffect vibrantEffectWithCompositingMode:24 compositingColor:v3];
  v2 = (void *)GCVirtualControllerAdditiveVibrancyEffectView_sharedEffect;
  GCVirtualControllerAdditiveVibrancyEffectView_sharedEffect = v1;
}

@end