@interface BuddyAppleIDRestoreHostController
+ (id)cloudConfigSkipKey;
- (BuddyAppleIDRestoreHostController)init;
@end

@implementation BuddyAppleIDRestoreHostController

+ (id)cloudConfigSkipKey
{
  return 0;
}

- (BuddyAppleIDRestoreHostController)init
{
  id v8 = self;
  location[1] = (id)a2;
  id v2 = +[BuddyAccountTools sharedBuddyAccountTools];
  location[0] = [v2 primaryAccount];

  id v3 = v8;
  id v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BuddyAppleIDRestoreHostController;
  id v8 = [(BuddyAppleIDHostController *)&v6 initWithAccount:location[0] mode:1];
  v4 = (BuddyAppleIDRestoreHostController *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

@end