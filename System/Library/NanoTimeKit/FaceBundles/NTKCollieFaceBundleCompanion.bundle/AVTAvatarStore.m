@interface AVTAvatarStore
+ (id)avatarStoreForWatch;
@end

@implementation AVTAvatarStore

+ (id)avatarStoreForWatch
{
  v2 = +[AVTUIEnvironment createFunCamEnvironment];
  id v3 = [objc_alloc((Class)AVTAvatarStore) initWithImageGenerator:0 environment:v2];

  return v3;
}

@end