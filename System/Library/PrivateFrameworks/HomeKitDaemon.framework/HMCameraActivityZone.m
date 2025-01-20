@interface HMCameraActivityZone
@end

@implementation HMCameraActivityZone

id __66__HMCameraActivityZone_HMI__createHMIActivityZoneWithIsInclusion___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F47CD0];
  id v3 = a2;
  id v4 = [v2 alloc];
  [v3 point];
  double v6 = v5;
  double v8 = v7;

  v9 = objc_msgSend(v4, "initWithPoint:", v6, v8);
  return v9;
}

@end