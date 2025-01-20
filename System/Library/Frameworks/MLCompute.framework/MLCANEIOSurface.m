@interface MLCANEIOSurface
@end

@implementation MLCANEIOSurface

void __30___MLCANEIOSurface_initialize__block_invoke()
{
  if (AppleNeuralEngineLibrary_onceToken != -1) {
    dispatch_once(&AppleNeuralEngineLibrary_onceToken, &__block_literal_global_25);
  }
  char v0 = AppleNeuralEngineLibrary_frameworkLibrary;
  if (AppleNeuralEngineLibrary_frameworkLibrary) {
    char v0 = softLinkClass_ANEIOSurfaceObject() != 0;
  }
  gIsAppleNeuralEngineAvailable = v0;
}

@end