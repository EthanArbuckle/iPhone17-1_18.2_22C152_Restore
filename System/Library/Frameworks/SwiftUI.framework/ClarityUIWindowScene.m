@interface ClarityUIWindowScene
- (BOOL)_shouldDeferInitialWindowUpdateBeforeConnection:(id)a3;
- (_TtC7SwiftUI20ClarityUIWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4;
- (void)_performDeferredInitialWindowUpdateForConnection;
- (void)_readySceneForConnection;
@end

@implementation ClarityUIWindowScene

- (void)_readySceneForConnection
{
  v2 = self;
  id v3 = [(ClarityUIWindowScene *)v2 session];
  id v4 = objc_msgSend(v3, sel_configuration);

  id v5 = objc_msgSend(v4, sel_storyboard);
  if (v5) {
    MEMORY[0x18C112B90](0xD000000000000042, 0x80000001883266E0);
  }
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for ClarityUIWindowScene();
  [(ClarityUIWindowScene *)&v6 _readySceneForConnection];
  ClarityUIWindowScene.loadWindowWithRootView()();
}

- (BOOL)_shouldDeferInitialWindowUpdateBeforeConnection:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7SwiftUI20ClarityUIWindowScene_defaultCreatedWindow);
  if (v3)
  {
    type metadata accessor for UIWindow();
    id v6 = a3;
    v7 = self;
    id v8 = v3;
    char v9 = static NSObject.== infix(_:_:)();
  }
  else
  {
    char v9 = 0;
  }
  return v9 & 1;
}

- (void)_performDeferredInitialWindowUpdateForConnection
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7SwiftUI20ClarityUIWindowScene_defaultCreatedWindow);
  if (v3)
  {
    id v4 = self;
    id v5 = v3;
    if (objc_msgSend(v5, sel_isHidden)) {
      objc_msgSend(v5, sel_makeKeyAndVisible);
    }
  }
  else
  {
    id v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ClarityUIWindowScene();
  [(ClarityUIWindowScene *)&v7 _performDeferredInitialWindowUpdateForConnection];
}

- (_TtC7SwiftUI20ClarityUIWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI20ClarityUIWindowScene_defaultCreatedWindow) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ClarityUIWindowScene();
  return [(ClarityUIWindowScene *)&v7 initWithSession:a3 connectionOptions:a4];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI20ClarityUIWindowScene_defaultCreatedWindow));
}

@end