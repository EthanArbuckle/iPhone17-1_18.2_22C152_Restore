@interface AKUIAlertControllerImageProvider
+ (id)imageForUIAlertController;
@end

@implementation AKUIAlertControllerImageProvider

+ (id)imageForUIAlertController
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v3 = +[AKAlertImageURLProvider url];
  v4 = (void *)[v2 initWithContentsOfURL:v3];

  v5 = [MEMORY[0x1E4F42A80] imageWithData:v4];

  return v5;
}

@end