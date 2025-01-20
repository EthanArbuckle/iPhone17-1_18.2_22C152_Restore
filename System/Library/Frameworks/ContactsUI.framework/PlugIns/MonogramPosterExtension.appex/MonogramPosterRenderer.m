@interface MonogramPosterRenderer
- (_TtC23MonogramPosterExtension22MonogramPosterRenderer)init;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)rendererDidInvalidate:(id)a3;
@end

@implementation MonogramPosterRenderer

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_100013398(v6, a4);

  swift_unknownObjectRelease();
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_10001597C(a4);

  swift_unknownObjectRelease();
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100015CD0();
}

- (_TtC23MonogramPosterExtension22MonogramPosterRenderer)init
{
  return (_TtC23MonogramPosterExtension22MonogramPosterRenderer *)sub_1000149B4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__backgroundViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer__monogramViewController));
  v3 = (char *)self + OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer_logger;
  uint64_t v4 = sub_100016290();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC23MonogramPosterExtension22MonogramPosterRenderer_configuration;
  uint64_t v6 = sub_1000161D0();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end