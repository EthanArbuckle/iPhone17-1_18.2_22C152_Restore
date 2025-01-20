@interface HMHomePersonManagerSettings(HMD)
- (id)createHMIHomePersonManagerSettings;
- (uint64_t)createHMIExternalPersonManagerSettings;
- (uint64_t)createHMPhotosPersonManagerSettings;
@end

@implementation HMHomePersonManagerSettings(HMD)

- (uint64_t)createHMPhotosPersonManagerSettings
{
  return 0;
}

- (id)createHMIHomePersonManagerSettings
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F69810]);
  objc_msgSend(v2, "setFaceClassificationEnabled:", objc_msgSend(a1, "isFaceClassificationEnabled"));
  v3 = (void *)[v2 copy];

  return v3;
}

- (uint64_t)createHMIExternalPersonManagerSettings
{
  return 0;
}

@end