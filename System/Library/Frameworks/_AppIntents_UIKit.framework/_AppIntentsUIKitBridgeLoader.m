@interface _AppIntentsUIKitBridgeLoader
+ (void)loadBridge;
- (_AppIntentsUIKitBridgeLoader)init;
@end

@implementation _AppIntentsUIKitBridgeLoader

- (_AppIntentsUIKitBridgeLoader)init
{
  return (_AppIntentsUIKitBridgeLoader *)UIKitBridgeLoader.init()();
}

+ (void)loadBridge
{
}

@end