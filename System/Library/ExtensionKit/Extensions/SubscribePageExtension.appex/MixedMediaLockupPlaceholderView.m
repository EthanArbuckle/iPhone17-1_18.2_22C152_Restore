@interface MixedMediaLockupPlaceholderView
- (_TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MixedMediaLockupPlaceholderView

- (_TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView *)sub_1000A9138(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000AA024();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000A98C0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView_artworkPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView_smallLockupPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView_supplementaryTextPlaceholder));
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView_contentType;
  uint64_t v4 = sub_1007635F0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end