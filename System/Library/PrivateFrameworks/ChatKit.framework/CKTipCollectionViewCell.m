@interface CKTipCollectionViewCell
- (NSString)reuseIdentifier;
- (UIView)miniTipUIView;
- (_TtC7ChatKit23CKTipCollectionViewCell)initWithCoder:(id)a3;
- (_TtC7ChatKit23CKTipCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)setMiniTipUIView:(id)a3;
- (void)setTipHostingView:(id)a3;
@end

@implementation CKTipCollectionViewCell

- (NSString)reuseIdentifier
{
  v2 = (void *)sub_18F7B97A0();

  return (NSString *)v2;
}

- (UIView)miniTipUIView
{
  v2 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC7ChatKit23CKTipCollectionViewCell_miniTipUIView);
  swift_beginAccess();
  return (UIView *)*v2;
}

- (void)setMiniTipUIView:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC7ChatKit23CKTipCollectionViewCell_miniTipUIView);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC7ChatKit23CKTipCollectionViewCell)initWithFrame:(CGRect)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit23CKTipCollectionViewCell_miniTipUIView) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[CKTipCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC7ChatKit23CKTipCollectionViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit23CKTipCollectionViewCell_miniTipUIView) = 0;
  id v4 = a3;

  result = (_TtC7ChatKit23CKTipCollectionViewCell *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (void)setTipHostingView:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  CKTipCollectionViewCell.setTipHostingView(_:)((UIView_optional *)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit23CKTipCollectionViewCell_miniTipUIView));
}

@end