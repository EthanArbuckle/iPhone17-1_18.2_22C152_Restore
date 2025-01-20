@interface UIImage(UserInterfaceStyleSpecific)
+ (id)userInterfaceStyleSpecificImageInBundle:()UserInterfaceStyleSpecific;
@end

@implementation UIImage(UserInterfaceStyleSpecific)

+ (id)userInterfaceStyleSpecificImageInBundle:()UserInterfaceStyleSpecific
{
  id v4 = a3;
  v5 = +[BKUIDevice sharedInstance];
  int v6 = [v5 isIdiomPad];

  if (v6) {
    v7 = @"ipad";
  }
  else {
    v7 = @"iphone";
  }
  v8 = [MEMORY[0x1E4F42F80] _currentTraitCollection];
  uint64_t v9 = [v8 userInterfaceStyle];

  if (v9 == 2) {
    v10 = @"-dark";
  }
  else {
    v10 = @"-light";
  }
  v11 = [(__CFString *)v7 stringByAppendingString:v10];
  v12 = [a1 imageNamed:v11 inBundle:v4];

  return v12;
}

@end