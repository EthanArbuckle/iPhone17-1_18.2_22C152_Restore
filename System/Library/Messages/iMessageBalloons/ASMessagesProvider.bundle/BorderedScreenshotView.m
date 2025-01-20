@interface BorderedScreenshotView
- (_TtC18ASMessagesProvider22BorderedScreenshotView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider22BorderedScreenshotView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BorderedScreenshotView

- (_TtC18ASMessagesProvider22BorderedScreenshotView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider22BorderedScreenshotView *)sub_506D68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider22BorderedScreenshotView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider22BorderedScreenshotView_platform) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider22BorderedScreenshotView_chromeBorderView) = 0;
  uint64_t v4 = OBJC_IVAR____TtC18ASMessagesProvider22BorderedScreenshotView_displayConfiguration;
  uint64_t v5 = qword_94D608;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  v7 = (char *)self + v4;
  uint64_t v8 = qword_9ADE38;
  char v9 = byte_9ADE40;
  uint64_t v10 = qword_9ADE48;
  char v11 = byte_9ADE50;
  uint64_t v12 = qword_9ADE58;
  v13 = (void *)qword_9ADE60;
  long long v14 = unk_9ADE68;
  long long v15 = unk_9ADE78;
  *(void *)v7 = qword_9ADE30;
  *((void *)v7 + 1) = v8;
  v7[16] = v9;
  *((void *)v7 + 3) = v10;
  v7[32] = v11;
  *((void *)v7 + 5) = v12;
  *((void *)v7 + 6) = v13;
  *(_OWORD *)(v7 + 56) = v14;
  *(_OWORD *)(v7 + 72) = v15;
  id v16 = v13;

  result = (_TtC18ASMessagesProvider22BorderedScreenshotView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_507058();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider22BorderedScreenshotView_chromeBorderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider22BorderedScreenshotView_artworkView));
  v3 = *(void **)&self->displayConfiguration[OBJC_IVAR____TtC18ASMessagesProvider22BorderedScreenshotView_displayConfiguration
                                           + 16];
}

@end