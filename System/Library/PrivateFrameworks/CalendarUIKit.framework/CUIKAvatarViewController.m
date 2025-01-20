@interface CUIKAvatarViewController
+ (id)createAvatarViewController;
@end

@implementation CUIKAvatarViewController

+ (id)createAvatarViewController
{
  v2 = [MEMORY[0x1E4F1BB58] defaultSettings];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1BB48]) initWithSettings:v2];

  return v3;
}

@end