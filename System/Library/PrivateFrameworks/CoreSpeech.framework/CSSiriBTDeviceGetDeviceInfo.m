@interface CSSiriBTDeviceGetDeviceInfo
@end

@implementation CSSiriBTDeviceGetDeviceInfo

void ___CSSiriBTDeviceGetDeviceInfo_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAddress:v3];
  [v4 setVendorID:*(unsigned int *)(a1 + 40)];
  [v4 setProductID:*(unsigned int *)(a1 + 44)];
  [v4 setIsAdvancedAppleAudioDevice:*(_DWORD *)(a1 + 48) == -1];
  [v4 setSupportsInEarDetection:*(_DWORD *)(a1 + 52) == -1];
  [v4 setSupportsVoiceTrigger:*(_DWORD *)(a1 + 56) == -1];
  [v4 setSupportsSpokenNotification:*(_DWORD *)(a1 + 60) == -1];
  [v4 setSupportsListeningModeANC:*(_DWORD *)(a1 + 64) == -1];
  [v4 setSupportsListeningModeTransparency:*(_DWORD *)(a1 + 68) == -1];
  [v4 setSupportsAnnounceCall:*(_DWORD *)(a1 + 72) == -1];
}

@end