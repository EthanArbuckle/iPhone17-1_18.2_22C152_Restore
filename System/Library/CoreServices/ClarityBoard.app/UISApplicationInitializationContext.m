@interface UISApplicationInitializationContext
+ (id)clb_contextForDisplayStyle:(int64_t)a3 canRequestScenes:(BOOL)a4;
@end

@implementation UISApplicationInitializationContext

+ (id)clb_contextForDisplayStyle:(int64_t)a3 canRequestScenes:(BOOL)a4
{
  BOOL v4 = a4;
  BSDispatchQueueAssertMain();
  id v7 = objc_alloc((Class)a1);
  v8 = +[UISDisplayContext clb_contextForDisplayStyle:a3];
  v9 = +[UISDeviceContext clb_contextForDisplayStyle:a3];
  id v10 = [v7 initWithMainDisplayContext:v8 launchDisplayContext:0 deviceContext:v9 persistedSceneIdentifiers:0 supportAppSceneRequests:v4];

  return v10;
}

@end