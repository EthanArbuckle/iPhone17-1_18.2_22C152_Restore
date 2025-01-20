@interface AvatarRecordRenderView
- (_TtC21AvatarPosterExtension22AvatarRecordRenderView)initWithCoder:(id)a3;
- (_TtC21AvatarPosterExtension22AvatarRecordRenderView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation AvatarRecordRenderView

- (void)dealloc
{
  v2 = self;
  sub_10000A66C();
}

- (void).cxx_destruct
{
  sub_100008708((uint64_t)self + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_postponedRenderingConfiguration, (uint64_t *)&unk_100023050);
  sub_100008708((uint64_t)self + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_imageViewDelegate, &qword_100022C48);
  sub_100004148(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_lastPoseData), *(void *)&self->boundingShape[OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_lastPoseData]);
  v3 = (char *)self + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_logger;
  uint64_t v4 = sub_100015A00();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView_avatarImage));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___avatarImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___bodyBlurLayer));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC21AvatarPosterExtension22AvatarRecordRenderView____lazy_storage___bodyMaskLayer);
}

- (_TtC21AvatarPosterExtension22AvatarRecordRenderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10000CB24();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10000AFDC();
}

- (_TtC21AvatarPosterExtension22AvatarRecordRenderView)initWithFrame:(CGRect)a3
{
  result = (_TtC21AvatarPosterExtension22AvatarRecordRenderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end