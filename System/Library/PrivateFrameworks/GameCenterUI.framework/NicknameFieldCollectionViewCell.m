@interface NicknameFieldCollectionViewCell
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI20DynamicTypeTextField)accessibilityTextLabel;
- (_TtC12GameCenterUI31NicknameFieldCollectionViewCell)initWithCoder:(id)a3;
- (_TtC12GameCenterUI31NicknameFieldCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidChangeSelection:(id)a3;
- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4;
@end

@implementation NicknameFieldCollectionViewCell

- (_TtC12GameCenterUI31NicknameFieldCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI31NicknameFieldCollectionViewCell *)sub_1AF733C28(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI31NicknameFieldCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF733FA4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF7347CC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1AF734AE8(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1AF734F64();
}

- (_TtC12GameCenterUI20DynamicTypeTextField)accessibilityTextLabel
{
  v2 = sub_1AF73601C();

  return (_TtC12GameCenterUI20DynamicTypeTextField *)v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31NicknameFieldCollectionViewCell_previousTitleTextColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31NicknameFieldCollectionViewCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31NicknameFieldCollectionViewCell_loadingIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31NicknameFieldCollectionViewCell_nicknamePresenter));
  sub_1AF379794((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI31NicknameFieldCollectionViewCell_suggestionsChangedSubscription, (uint64_t *)&unk_1E9ACF030);
  sub_1AF379794((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI31NicknameFieldCollectionViewCell_nicknameUpdatedSubscription, &qword_1E9ACD388);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC12GameCenterUI31NicknameFieldCollectionViewCell_accessoryAction);

  sub_1AF368930(v3);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1AF736430(v4);

  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1AF7364E4();
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = sub_1AF7AE0E0();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1AF736694(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textFieldDidChangeSelection:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1AF736B04();
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  double v6 = self;
  sub_1AF736BFC();
}

@end