@interface AXiTunesStoreGlue
+ (void)accessibilityInitializeBundle;
- (void)_libraryWeakLoaded:(id)a3;
@end

@implementation AXiTunesStoreGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    uint64_t v2 = [objc_allocWithZone((Class)AXiTunesStoreGlue) init];
    v3 = (void *)_Failover;
    _Failover = v2;
  }
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:_Failover selector:sel__libraryWeakLoaded_ name:@"ISWeakLibraryLoaded" object:0];
}

- (void)_libraryWeakLoaded:(id)a3
{
  v3 = [a3 userInfo];
  id v4 = [v3 objectForKey:@"Library"];
  uint64_t v5 = (int)[v4 intValue];

  v6 = @"com.apple.ContactsUI";
  switch(v5)
  {
    case 2:
      goto LABEL_9;
    case 3:
      v6 = @"com.apple.MediaPlayer";
      goto LABEL_9;
    case 4:
      v6 = @"com.apple.messageui";
      goto LABEL_9;
    case 5:
    case 6:
    case 7:
      goto LABEL_10;
    case 8:
      v6 = @"com.apple.PhotoLibrary";
      goto LABEL_9;
    default:
      if (v5 == 19)
      {
        v6 = @"com.apple.StoreKit";
      }
      else
      {
        if (v5 != 20) {
          goto LABEL_10;
        }
        v6 = @"com.apple.ios.StoreKitUI";
      }
LABEL_9:
      v7 = v6;
      AXPerformBlockOnMainThreadAfterDelay();

LABEL_10:
      return;
  }
}

void __40__AXiTunesStoreGlue__libraryWeakLoaded___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:*(void *)(a1 + 32)];
  id v5 = (id)v2;
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    _AXAssert();
    uint64_t v2 = 0;
  }
  objc_msgSend(MEMORY[0x263F811C8], "loadAccessibilityBundleForBundle:didLoadCallback:", v2, 0, v3, v4);
}

@end