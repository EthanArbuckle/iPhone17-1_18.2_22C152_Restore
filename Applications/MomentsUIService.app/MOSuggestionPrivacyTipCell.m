@interface MOSuggestionPrivacyTipCell
- (_TtC16MomentsUIService26MOSuggestionPrivacyTipCell)initWithCoder:(id)a3;
- (_TtC16MomentsUIService26MOSuggestionPrivacyTipCell)initWithFrame:(CGRect)a3;
@end

@implementation MOSuggestionPrivacyTipCell

- (_TtC16MomentsUIService26MOSuggestionPrivacyTipCell)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionPrivacyTipCell_tipModel) = 0;
  v5 = (void (**)())((char *)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionPrivacyTipCell_didDismiss);
  *v5 = closure #1 in variable initialization expression of MOSuggestionPrivacyTipCell.didDismiss;
  v5[1] = 0;
  id v6 = a3;

  result = (_TtC16MomentsUIService26MOSuggestionPrivacyTipCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService26MOSuggestionPrivacyTipCell)initWithFrame:(CGRect)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionPrivacyTipCell_tipModel) = 0;
  v4 = (void (**)())((char *)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionPrivacyTipCell_didDismiss);
  *v4 = closure #1 in variable initialization expression of MOSuggestionPrivacyTipCell.didDismiss;
  v4[1] = 0;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for MOSuggestionPrivacyTipCell();
  v8 = -[MOSuggestionPrivacyTipCell initWithFrame:](&v12, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v9 = *(void (**)(void))((swift_isaMask & (uint64_t)v8->super.super.super.super.isa) + 0xB0);
  v10 = v8;
  v9();

  return v10;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();

  swift_release();
}

@end