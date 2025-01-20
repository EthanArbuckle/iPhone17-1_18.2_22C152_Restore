@interface AvatarPosterRenderer
- (_TtC21AvatarPosterExtension20AvatarPosterRenderer)init;
- (void)dealloc;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)rendererDidInvalidate:(id)a3;
- (void)rendererDidInvalidate:(id)a3 completion:(id)a4;
@end

@implementation AvatarPosterRenderer

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1000044C8(v6, a4);

  swift_unknownObjectRelease();
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_100007B54(a4);

  swift_unknownObjectRelease();
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100007D4C();
}

- (void)rendererDidInvalidate:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_100007F9C(v7, (char *)v8, (void (**)(void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_extendedRenderingSession);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_extendedRenderingSession) = 0;
  v5 = self;

  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(AvatarPosterRenderer *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer__backgroundViewController));
  sub_100008708((uint64_t)self + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_configuration, (uint64_t *)&unk_100023050);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer__avatarRecordRenderView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_extendedRenderingSession));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21AvatarPosterExtension20AvatarPosterRenderer_delayInvalidationAssertion);
}

- (_TtC21AvatarPosterExtension20AvatarPosterRenderer)init
{
  return (_TtC21AvatarPosterExtension20AvatarPosterRenderer *)sub_100006410();
}

@end