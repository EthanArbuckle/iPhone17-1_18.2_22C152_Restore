@interface CSAssetControllerFactory
+ (id)defaultController;
@end

@implementation CSAssetControllerFactory

+ (id)defaultController
{
  return +[CSAssetController sharedController];
}

@end