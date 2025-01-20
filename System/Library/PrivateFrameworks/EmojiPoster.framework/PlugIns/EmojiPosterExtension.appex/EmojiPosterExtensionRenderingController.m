@interface EmojiPosterExtensionRenderingController
- (_TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController)init;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)rendererDidInvalidate:(id)a3;
@end

@implementation EmojiPosterExtensionRenderingController

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_100015400(a4);

  swift_unknownObjectRelease();
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000156A4();
}

- (_TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController)init
{
  return (_TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController *)sub_10000CD78();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_logger;
  uint64_t v4 = sub_100017ED8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emoijiLayersViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_backgroundViewController));
  swift_release();
  sub_10000B964((uint64_t)self + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_configuration, &qword_100021B98);
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_renderer);
}

@end