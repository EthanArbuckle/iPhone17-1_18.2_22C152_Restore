@interface MOSuggestionSheetStateOfMindTipCell
- (_TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell)initWithCoder:(id)a3;
- (_TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell)initWithFrame:(CGRect)a3;
@end

@implementation MOSuggestionSheetStateOfMindTipCell

- (_TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell_tipModel) = 0;
  id v5 = a3;

  result = (_TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell)initWithFrame:(CGRect)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService35MOSuggestionSheetStateOfMindTipCell_tipModel) = 0;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MOSuggestionSheetStateOfMindTipCell();
  v7 = -[MOSuggestionSheetStateOfMindTipCell initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = *(void (**)(void))((swift_isaMask & (uint64_t)v7->super.super.super.super.isa) + 0x98);
  v9 = v7;
  v8();

  return v9;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_release();
}

@end