@interface PrivacyCategoryCollectionViewCell
- (_TtC18ASMessagesProvider19PrivacyCategoryView)accessibilityCategoryView;
- (_TtC18ASMessagesProvider33PrivacyCategoryCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider33PrivacyCategoryCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PrivacyCategoryCollectionViewCell

- (_TtC18ASMessagesProvider33PrivacyCategoryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider33PrivacyCategoryCollectionViewCell *)sub_40DE84();
}

- (_TtC18ASMessagesProvider33PrivacyCategoryCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProvider33PrivacyCategoryCollectionViewCell_privacyCategoryView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for PrivacyCategoryView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v8 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider33PrivacyCategoryCollectionViewCell_itemLayoutContext;
  uint64_t v9 = sub_771720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider33PrivacyCategoryCollectionViewCell_privacyCategory) = 0;

  result = (_TtC18ASMessagesProvider33PrivacyCategoryCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v2 = (char *)v13.receiver;
  [(PrivacyCategoryCollectionViewCell *)&v13 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider33PrivacyCategoryCollectionViewCell_privacyCategoryView];
  id v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_40D9EC();
}

- (_TtC18ASMessagesProvider19PrivacyCategoryView)accessibilityCategoryView
{
  return (_TtC18ASMessagesProvider19PrivacyCategoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC18ASMessagesProvider33PrivacyCategoryCollectionViewCell_privacyCategoryView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33PrivacyCategoryCollectionViewCell_privacyCategoryView));
  sub_411F8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider33PrivacyCategoryCollectionViewCell_itemLayoutContext);

  swift_release();
}

@end