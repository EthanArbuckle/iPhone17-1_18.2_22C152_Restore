@interface BPSNTKCustomization
- (BOOL)handlePresentationOfNotification:(id)a3 fromNotificationCenter:(id)a4 withCompletionHandler:(id)a5;
- (BOOL)handleUserNotificationResponse:(id)a3 fromNotificationCenter:(id)a4 withCompletionHandler:(id)a5;
- (id)facesViewController;
- (id)galleryViewController;
- (id)userNotificationCategories;
@end

@implementation BPSNTKCustomization

- (id)facesViewController
{
  return 0;
}

- (id)galleryViewController
{
  return 0;
}

- (id)userNotificationCategories
{
  return (id)[MEMORY[0x263EFFA08] set];
}

- (BOOL)handleUserNotificationResponse:(id)a3 fromNotificationCenter:(id)a4 withCompletionHandler:(id)a5
{
  return 0;
}

- (BOOL)handlePresentationOfNotification:(id)a3 fromNotificationCenter:(id)a4 withCompletionHandler:(id)a5
{
  return 0;
}

@end