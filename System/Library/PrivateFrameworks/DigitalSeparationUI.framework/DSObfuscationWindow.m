@interface DSObfuscationWindow
+ (id)showDSObfuscationWindowForApplicationWindow:(id)a3;
@end

@implementation DSObfuscationWindow

+ (id)showDSObfuscationWindowForApplicationWindow:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F82E10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v5 view];
  v7 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v6 setBackgroundColor:v7];

  v8 = [DSObfuscationWindow alloc];
  v9 = [v4 windowScene];

  v10 = [(DSObfuscationWindow *)v8 initWithWindowScene:v9];
  [(DSObfuscationWindow *)v10 setRootViewController:v5];
  [(DSObfuscationWindow *)v10 setWindowLevel:*MEMORY[0x263F83C60] + -1.0];
  [(DSObfuscationWindow *)v10 makeKeyAndVisible];

  return v10;
}

@end