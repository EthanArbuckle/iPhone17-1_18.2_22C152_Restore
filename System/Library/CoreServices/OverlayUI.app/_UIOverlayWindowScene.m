@interface _UIOverlayWindowScene
+ (int64_t)_UIO_sceneType;
- (_UIOverlayWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4;
@end

@implementation _UIOverlayWindowScene

+ (int64_t)_UIO_sceneType
{
  return 1;
}

- (_UIOverlayWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = UIOLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[_UIOverlayWindowScene initWithSession:connectionOptions:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v11.receiver = self;
  v11.super_class = (Class)_UIOverlayWindowScene;
  v9 = [(_UIOverlayWindowScene *)&v11 initWithSession:v7 connectionOptions:v6];

  if (v9) {
    [(_UIOverlayWindowScene *)v9 _setKeepContextAssociationInBackground:1];
  }
  return v9;
}

@end