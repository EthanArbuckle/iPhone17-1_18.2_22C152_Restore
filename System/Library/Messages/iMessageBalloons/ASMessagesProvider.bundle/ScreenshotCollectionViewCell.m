@interface ScreenshotCollectionViewCell
- (_TtC18ASMessagesProvider28ScreenshotCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider28ScreenshotCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ScreenshotCollectionViewCell

- (_TtC18ASMessagesProvider28ScreenshotCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider28ScreenshotCollectionViewCell *)sub_330CB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider28ScreenshotCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider28ScreenshotCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_771720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider28ScreenshotCollectionViewCell_artworkDisplaySize;
  *(void *)v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  id v8 = a3;

  result = (_TtC18ASMessagesProvider28ScreenshotCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_330F60();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_331070();
}

- (void).cxx_destruct
{
  sub_411F8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider28ScreenshotCollectionViewCell_itemLayoutContext);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider28ScreenshotCollectionViewCell_borderedScreenshotView);
}

@end