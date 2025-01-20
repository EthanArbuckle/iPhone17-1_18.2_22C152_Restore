@interface DOCActionToolBarItem
- (_TtC18DocumentAppIntents20DOCActionToolBarItem)init;
- (_TtC18DocumentAppIntents20DOCActionToolBarItem)initWithCoder:(id)a3;
@end

@implementation DOCActionToolBarItem

- (_TtC18DocumentAppIntents20DOCActionToolBarItem)init
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18DocumentAppIntents20DOCActionToolBarItem_docAction) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC18DocumentAppIntents20DOCActionToolBarItem_onSelectedItems) = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCActionToolBarItem();
  return [(DOCActionToolBarItem *)&v3 init];
}

- (_TtC18DocumentAppIntents20DOCActionToolBarItem)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18DocumentAppIntents20DOCActionToolBarItem_docAction) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC18DocumentAppIntents20DOCActionToolBarItem_onSelectedItems) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCActionToolBarItem();
  return [(DOCActionToolBarItem *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents20DOCActionToolBarItem_docAction));
}

@end