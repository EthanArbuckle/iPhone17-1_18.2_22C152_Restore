@interface TextFieldCollectionViewCell
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (_TtC18HealthExperienceUI27TextFieldCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI27TextFieldCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TextFieldCollectionViewCell

- (_TtC18HealthExperienceUI27TextFieldCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI27TextFieldCollectionViewCell *)TextFieldCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI27TextFieldCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  _s18HealthExperienceUI27TextFieldCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1AD5E5D6C(a3);
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v3 = self;
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.super.super.super.isa) + 0x190);
  id v5 = a3;
  id v6 = v3;
  LOBYTE(v3) = v4();

  return v3 & 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  v4 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.super.super.super.isa) + 0x198);
  id v5 = a3;
  id v6 = self;
  v4();
}

- (void)textFieldDidEndEditing:(id)a3
{
  v4 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.super.super.super.isa) + 0x1A0);
  id v5 = a3;
  id v6 = self;
  v4();
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  id v9 = a3;
  v10 = self;
  LOBYTE(length) = sub_1AD5E7230(v9, location, length);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void).cxx_destruct
{
  sub_1AD206D18((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI27TextFieldCollectionViewCell_item, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27TextFieldCollectionViewCell____lazy_storage___proxy));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27TextFieldCollectionViewCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27TextFieldCollectionViewCell____lazy_storage___valueField));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end