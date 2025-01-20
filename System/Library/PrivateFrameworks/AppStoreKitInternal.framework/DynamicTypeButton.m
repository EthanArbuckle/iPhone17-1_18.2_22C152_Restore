@interface DynamicTypeButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal17DynamicTypeButton)initWithCoder:(id)a3;
- (_TtC19AppStoreKitInternal17DynamicTypeButton)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DynamicTypeButton

- (_TtC19AppStoreKitInternal17DynamicTypeButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19AppStoreKitInternal17DynamicTypeButton_fontUseCaseContentSizeCategory) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal17DynamicTypeButton_fontUseCase;
  uint64_t v9 = sub_1E1D57FB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DynamicTypeButton();
  return -[ImageAlignedButton initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19AppStoreKitInternal17DynamicTypeButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19AppStoreKitInternal17DynamicTypeButton_fontUseCaseContentSizeCategory) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal17DynamicTypeButton_fontUseCase;
  uint64_t v6 = sub_1E1D57FB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC19AppStoreKitInternal17DynamicTypeButton *)sub_1E1D5D108();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for DynamicTypeButton();
  id v5 = v16.receiver;
  -[DynamicTypeButton sizeThatFits:](&v16, sel_sizeThatFits_, width, height);
  double v7 = v6;
  double v9 = v8;
  id v10 = objc_msgSend(v5, sel_titleLabel, v16.receiver, v16.super_class);
  if (v10)
  {
    objc_super v11 = v10;
    objc_msgSend(v10, sel_measurementsWithFitting_in_, v5, width, height);
    double v13 = v12;

    if (v9 <= v13) {
      double v9 = v13;
    }
  }
  else
  {
  }
  double v14 = v7;
  double v15 = v9;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1E1875D08((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal17DynamicTypeButton_fontUseCaseContentSizeCategory));
  sub_1E15B07DC((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal17DynamicTypeButton_fontUseCase, (uint64_t *)&unk_1EBF36650);
}

@end