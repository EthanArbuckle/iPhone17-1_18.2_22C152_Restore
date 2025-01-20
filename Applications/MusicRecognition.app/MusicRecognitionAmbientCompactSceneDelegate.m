@interface MusicRecognitionAmbientCompactSceneDelegate
- (UIWindow)window;
- (_TtC16MusicRecognition43MusicRecognitionAmbientCompactSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation MusicRecognitionAmbientCompactSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC16MusicRecognition43MusicRecognitionAmbientCompactSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16MusicRecognition43MusicRecognitionAmbientCompactSceneDelegate_window);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC16MusicRecognition43MusicRecognitionAmbientCompactSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10008482C(v8);
}

- (_TtC16MusicRecognition43MusicRecognitionAmbientCompactSceneDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC16MusicRecognition43MusicRecognitionAmbientCompactSceneDelegate_window) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(MusicRecognitionAmbientCompactSceneDelegate *)&v5 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicRecognition43MusicRecognitionAmbientCompactSceneDelegate_window));
}

@end