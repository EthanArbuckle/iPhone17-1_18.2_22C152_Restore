@interface HMCameraActivityZone(HMI)
- (id)createHMIActivityZoneWithIsInclusion:()HMI;
@end

@implementation HMCameraActivityZone(HMI)

- (id)createHMIActivityZoneWithIsInclusion:()HMI
{
  v4 = [a1 points];
  v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_181187);

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F697D8]) initWithPoints:v5 isInclusion:a3];
  return v6;
}

@end