@interface PKPassKitSwiftUIObjcBridge
+ (BOOL)didAddPasses:(id)a3;
+ (BOOL)passbookHasBeenDeleted;
+ (CGImage)buttonImageForSize:(CGSize)a3 scale:(double)a4 type:(int64_t)a5 style:(int64_t)a6;
+ (id)accessibilityTitleForType:(int64_t)a3;
+ (id)localizedDeletableWalletStringFor:(id)a3;
+ (void)openInstallWallet;
@end

@implementation PKPassKitSwiftUIObjcBridge

+ (CGImage)buttonImageForSize:(CGSize)a3 scale:(double)a4 type:(int64_t)a5 style:(int64_t)a6
{
  return (CGImage *)MEMORY[0x270F51C30](a5, a6, 0, (__n128)a3, *(__n128 *)&a3.height, a4);
}

+ (id)accessibilityTitleForType:(int64_t)a3
{
  return (id)MEMORY[0x270F51BD8](a3, 0);
}

+ (BOOL)didAddPasses:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 succeeded];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)passbookHasBeenDeleted
{
  v2 = [MEMORY[0x263F5BF78] sharedInstance];
  char v3 = [v2 passbookHasBeenDeleted];

  return v3;
}

+ (id)localizedDeletableWalletStringFor:(id)a3
{
  return (id)MEMORY[0x270F52040](a3, a2);
}

+ (void)openInstallWallet
{
}

@end