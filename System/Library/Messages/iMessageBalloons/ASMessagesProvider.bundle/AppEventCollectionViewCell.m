@interface AppEventCollectionViewCell
- (_TtC18ASMessagesProvider26AppEventCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider26AppEventCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation AppEventCollectionViewCell

- (_TtC18ASMessagesProvider26AppEventCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider26AppEventCollectionViewCell *)sub_105318();
}

- (_TtC18ASMessagesProvider26AppEventCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider26AppEventCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_771720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC18ASMessagesProvider26AppEventCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v2 = (char *)v9.receiver;
  [(AppEventCollectionViewCell *)&v9 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider26AppEventCollectionViewCell_appEventView];
  objc_msgSend(v2, "bounds", v9.receiver, v9.super_class);
  objc_msgSend(v3, "setBounds:", 0.0, 0.0);
  [v2 bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  double MidX = CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  objc_msgSend(v3, "setCenter:", MidX, CGRectGetMidY(v11));
}

- (void)prepareForReuse
{
  v2 = self;
  sub_101C94();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26AppEventCollectionViewCell_appEventView));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider26AppEventCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
}

@end