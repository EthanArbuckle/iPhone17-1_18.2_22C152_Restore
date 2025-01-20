@interface UIDevice(HUAdditions)
+ (id)hu_modelAndNetworkLocalizedStringKeyForKey:()HUAdditions;
@end

@implementation UIDevice(HUAdditions)

+ (id)hu_modelAndNetworkLocalizedStringKeyForKey:()HUAdditions
{
  v1 = objc_msgSend(a1, "modelSpecificLocalizedStringKeyForKey:");
  int v2 = [MEMORY[0x1E4F69758] useWLANInsteadOfWiFi];
  v3 = @"WIFI";
  if (v2) {
    v3 = @"WLAN";
  }
  v4 = [NSString stringWithFormat:@"%@_%@", v1, v3];

  return v4;
}

@end