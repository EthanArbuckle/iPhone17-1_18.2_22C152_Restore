@interface ARReplaySensorPublic(ARKitAdditions)
- (void)_subscribeToBackgroundNotifications;
@end

@implementation ARReplaySensorPublic(ARKitAdditions)

- (void)_subscribeToBackgroundNotifications
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:a1 selector:sel_interrupt name:*MEMORY[0x263F1D050] object:0];
  [v2 addObserver:a1 selector:sel_endInterruption name:*MEMORY[0x263F1D0D0] object:0];
}

@end