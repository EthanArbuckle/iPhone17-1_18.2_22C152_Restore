@interface TextWithIconCell
- (_TtC15HealthRecordsUI16TextWithIconCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI16TextWithIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TextWithIconCell

- (_TtC15HealthRecordsUI16TextWithIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1C254F470();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC15HealthRecordsUI16TextWithIconCell *)sub_1C23C3838(a3, (uint64_t)a4, v6);
}

- (_TtC15HealthRecordsUI16TextWithIconCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI16TextWithIconCell____lazy_storage___iconView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI16TextWithIconCell____lazy_storage___titleLabel) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC15HealthRecordsUI16TextWithIconCell_baseAccessibilityIdentifier);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC15HealthRecordsUI16TextWithIconCell *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TextWithIconCell();
  id v2 = v5.receiver;
  [(TextWithIconCell *)&v5 prepareForReuse];
  id v3 = sub_1C23C348C();
  objc_msgSend(v3, sel_setImage_, 0, v5.receiver, v5.super_class);

  id v4 = sub_1C23C3528();
  objc_msgSend(v4, sel_setText_, 0);
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for TextWithIconCell();
  id v2 = v15.receiver;
  [(TextWithIconCell *)&v15 layoutSubviews];
  id v3 = sub_1C23C3528();
  objc_msgSend(v3, sel_bounds, v15.receiver, v15.super_class);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = sub_1C23C3528();
  objc_msgSend(v2, sel_convertRect_fromCoordinateSpace_, v12, v5, v7, v9, v11);
  double v14 = v13;

  objc_msgSend(v2, sel_setSeparatorInset_, 0.0, v14, 0.0, 0.0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI16TextWithIconCell____lazy_storage___iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI16TextWithIconCell____lazy_storage___titleLabel));
  swift_bridgeObjectRelease();
}

@end