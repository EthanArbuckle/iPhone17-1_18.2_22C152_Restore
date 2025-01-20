@interface LANotificationUIAppearance
- (BOOL)didDisappear;
- (id)darwinNotificationForBoolValue:(BOOL)a3;
- (void)newValue:(id)a3 oldValue:(id)a4 completionHandler:(id)a5;
@end

@implementation LANotificationUIAppearance

- (id)darwinNotificationForBoolValue:(BOOL)a3
{
  if (a3) {
    return @"com.apple.LocalAuthentication.ui.presented";
  }
  else {
    return @"com.apple.LocalAuthentication.ui.dismissed";
  }
}

- (BOOL)didDisappear
{
  return ![(LANotificationOfBooleanState *)self BOOLValue];
}

- (void)newValue:(id)a3 oldValue:(id)a4 completionHandler:(id)a5
{
  if (!a3) {
    a3 = (id)MEMORY[0x1E4F1CC28];
  }
  if (!a4) {
    a4 = (id)MEMORY[0x1E4F1CC28];
  }
  v5.receiver = self;
  v5.super_class = (Class)LANotificationUIAppearance;
  [(LANotification *)&v5 newValue:a3 oldValue:a4 completionHandler:a5];
}

@end