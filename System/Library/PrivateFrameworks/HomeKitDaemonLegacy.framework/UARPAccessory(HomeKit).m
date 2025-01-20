@interface UARPAccessory(HomeKit)
- (id)availableSoftwareVersion;
@end

@implementation UARPAccessory(HomeKit)

- (id)availableSoftwareVersion
{
  v2 = [a1 availableFirmwareVersion];

  if (v2
    && (v3 = (void *)MEMORY[0x1E4F65558],
        [a1 availableFirmwareVersion],
        v4 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v3) = [v3 isValidVersionString:v4],
        v4,
        v3))
  {
    id v5 = objc_alloc(MEMORY[0x1E4F65558]);
    v6 = [a1 availableFirmwareVersion];
    v7 = (void *)[v5 initWithVersionString:v6];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end