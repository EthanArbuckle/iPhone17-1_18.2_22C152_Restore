@interface ForJetUIOnly
@end

@implementation ForJetUIOnly

double __ForJetUIOnly_MainScreenScale_block_invoke()
{
  MGGetFloat32Answer();
  double result = v0;
  ForJetUIOnly_MainScreenScale_scale = *(void *)&result;
  return result;
}

@end