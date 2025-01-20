@interface MixedMediaLockupPlaceholderView
- (_TtC18ASMessagesProvider31MixedMediaLockupPlaceholderView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider31MixedMediaLockupPlaceholderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MixedMediaLockupPlaceholderView

- (_TtC18ASMessagesProvider31MixedMediaLockupPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider31MixedMediaLockupPlaceholderView *)sub_9C348(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider31MixedMediaLockupPlaceholderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_9D234();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_9CAD0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31MixedMediaLockupPlaceholderView_artworkPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31MixedMediaLockupPlaceholderView_smallLockupPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31MixedMediaLockupPlaceholderView_supplementaryTextPlaceholder));
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider31MixedMediaLockupPlaceholderView_contentType;
  uint64_t v4 = sub_779650();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end