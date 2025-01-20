@interface AKAuthorizationBiometricImage
+ (id)biometricImage;
@end

@implementation AKAuthorizationBiometricImage

+ (id)biometricImage
{
  v2 = [MEMORY[0x1E4F4F010] currentDevice];
  int v3 = [v2 isFaceIDCapable];

  v4 = [MEMORY[0x1E4F4F010] currentDevice];
  int v5 = [v4 usesTouchID];

  if (v5) {
    v6 = (void *)MEMORY[0x1E4F4EF30];
  }
  else {
    v6 = (void *)MEMORY[0x1E4F4EF28];
  }
  if (v3) {
    v6 = (void *)MEMORY[0x1E4F4EF20];
  }
  v7 = objc_msgSend(MEMORY[0x1E4F42A80], "ak_imageNamed:", *v6);

  return v7;
}

@end