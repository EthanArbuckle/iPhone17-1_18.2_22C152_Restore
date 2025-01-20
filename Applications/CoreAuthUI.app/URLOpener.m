@interface URLOpener
+ (id)sharedInstance;
- (id)openURL:(id)a3;
@end

@implementation URLOpener

+ (id)sharedInstance
{
  if (qword_10009E290 != -1) {
    dispatch_once(&qword_10009E290, &stru_100086778);
  }
  v2 = (void *)qword_10009E288;

  return v2;
}

- (id)openURL:(id)a3
{
  id v3 = a3;
  v4 = +[LSApplicationWorkspace defaultWorkspace];
  v9[0] = FBSOpenApplicationOptionKeyUnlockDevice;
  v9[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v10[0] = &__kCFBooleanTrue;
  v10[1] = &__kCFBooleanTrue;
  v5 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v8 = 0;
  [v4 openURL:v3 withOptions:v5 error:&v8];

  id v6 = v8;

  return v6;
}

@end