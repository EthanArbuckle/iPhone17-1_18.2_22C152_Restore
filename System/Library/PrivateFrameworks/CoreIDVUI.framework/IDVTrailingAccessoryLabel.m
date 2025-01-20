@interface IDVTrailingAccessoryLabel
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9CoreIDVUI25IDVTrailingAccessoryLabel)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI25IDVTrailingAccessoryLabel)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)registerAccessoryWithView:(id)a3 withSize:(CGSize)a4 for:(id)a5;
- (void)unregisterAccessories;
@end

@implementation IDVTrailingAccessoryLabel

- (_TtC9CoreIDVUI25IDVTrailingAccessoryLabel)initWithFrame:(CGRect)a3
{
  return (_TtC9CoreIDVUI25IDVTrailingAccessoryLabel *)sub_21F519F70(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9CoreIDVUI25IDVTrailingAccessoryLabel)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_contentInsets);
  long long v5 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  _OWORD *v4 = *MEMORY[0x263F834E8];
  v4[1] = v5;
  uint64_t v6 = OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_registeredAccessories;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)sub_21F4718E0(MEMORY[0x263F8EE78]);
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_maxAccessorySize);
  void *v8 = 0;
  v8[1] = 0;

  result = (_TtC9CoreIDVUI25IDVTrailingAccessoryLabel *)sub_21F551B40();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_21F51A47C(1, 0.0, 0.0, width, 1.79769313e308);

  double v6 = width;
  double v7 = v5;
  result.height = v7;
  result.double width = v6;
  return result;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v2 = v7.receiver;
  [(IDVTrailingAccessoryLabel *)&v7 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v7.receiver, v7.super_class);
  sub_21F51A47C(0, v3, v4, v5, v6);
}

- (void)registerAccessoryWithView:(id)a3 withSize:(CGSize)a4 for:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v9 = sub_21F5515A0();
  uint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  sub_21F519E0C(v12, v9, v11, width, height);

  swift_bridgeObjectRelease();
}

- (void)unregisterAccessories
{
  id v2 = self;
  sub_21F51A780();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_textView));

  swift_bridgeObjectRelease();
}

@end