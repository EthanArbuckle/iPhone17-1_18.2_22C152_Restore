@interface _FBDefaultFencingProvider
+ (id)sharedInstance;
- (void)synchronizeDrawingWithFence:(id)a3;
@end

@implementation _FBDefaultFencingProvider

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) { {
    dispatch_once(&sharedInstance___once, &__block_literal_global_2);
  }
  }
  v2 = (void *)sharedInstance___instance;

  return v2;
}

- (void)synchronizeDrawingWithFence:(id)a3
{
  id v4 = a3;
  if (UIKitLibraryCore())
  {
    id v3 = getUIWindowClass();
    if (v3) { {
      [v3 _synchronizeDrawingWithFence:v4];
    }
    }
  }
}

@end