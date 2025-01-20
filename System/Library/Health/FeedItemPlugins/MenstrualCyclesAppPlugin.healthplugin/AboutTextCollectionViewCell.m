@interface AboutTextCollectionViewCell
- (_TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AboutTextCollectionViewCell

- (_TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell_detailTextLabel) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell_item;
  v9 = (objc_class *)type metadata accessor for AboutTextCollectionViewCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[AboutTextCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_241592D90();

  return v10;
}

- (_TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell_detailTextLabel) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell *)sub_241633038();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell_detailTextLabel);
  if (v3)
  {
    v6 = self;
    uint64_t v7 = *MEMORY[0x263F83570];
    id v8 = a3;
    v9 = self;
    id v10 = v3;
    id v11 = objc_msgSend(v6, sel_preferredFontForTextStyle_, v7);
    objc_msgSend(v10, sel_setFont_, v11);
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell_detailTextLabel));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27AboutTextCollectionViewCell_item;

  sub_241299DB8((uint64_t)v3);
}

@end