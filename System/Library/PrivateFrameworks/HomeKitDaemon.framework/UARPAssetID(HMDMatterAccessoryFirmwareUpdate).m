@interface UARPAssetID(HMDMatterAccessoryFirmwareUpdate)
- (BOOL)isMatterAsset;
@end

@implementation UARPAssetID(HMDMatterAccessoryFirmwareUpdate)

- (BOOL)isMatterAsset
{
  return (unint64_t)([a1 type] - 15) < 2;
}

@end