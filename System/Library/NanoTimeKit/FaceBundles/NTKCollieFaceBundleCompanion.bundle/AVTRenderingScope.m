@interface AVTRenderingScope
+ (id)ntk_watchFaceAnimojiRenderingScope;
+ (id)ntk_watchFaceMemojiRenderingScope;
@end

@implementation AVTRenderingScope

+ (id)ntk_watchFaceAnimojiRenderingScope
{
  v2 = [a1 listControllerThumbnailScope];
  v3 = +[CLKDevice currentDevice];
  [v3 screenBounds];
  double v5 = v4;
  double v7 = v6;

  id v8 = objc_msgSend(v2, "copyWithSize:framingMode:", AVTFramingModeWatchFace, v5, v7);

  return v8;
}

+ (id)ntk_watchFaceMemojiRenderingScope
{
  v2 = [a1 listControllerThumbnailScope];
  v3 = +[CLKDevice currentDevice];
  [v3 screenBounds];
  double v5 = v4;
  double v7 = v6;

  +[NTKCollieFaceView avatarFramingTopMargin];
  id v9 = objc_msgSend(v2, "copyWithSize:framingMode:", AVTFramingModeWatchFace, v5, v7 + v8);

  return v9;
}

@end