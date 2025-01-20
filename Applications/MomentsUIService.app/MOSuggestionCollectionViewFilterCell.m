@interface MOSuggestionCollectionViewFilterCell
- (BOOL)isSelected;
- (_TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell)initWithCoder:(id)a3;
- (_TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell)initWithFrame:(CGRect)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation MOSuggestionCollectionViewFilterCell

- (_TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell_title);
  void *v8 = 0;
  v8[1] = 0;
  uint64_t v9 = OBJC_IVAR____TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell_filterButton;
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v9) = (Class)closure #1 in variable initialization expression of MOSuggestionCollectionViewFilterCell.filterButton();

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for MOSuggestionCollectionViewFilterCell();
  v11 = -[MOSuggestionCollectionViewFilterCell initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  MOSuggestionCollectionViewFilterCell.setupView()();

  return v11;
}

- (_TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell_title);
  void *v4 = 0;
  v4[1] = 0;
  uint64_t v5 = OBJC_IVAR____TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell_filterButton;
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)closure #1 in variable initialization expression of MOSuggestionCollectionViewFilterCell.filterButton();

  result = (_TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MOSuggestionCollectionViewFilterCell();
  return [(MOSuggestionCollectionViewFilterCell *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MOSuggestionCollectionViewFilterCell();
  id v4 = v5.receiver;
  [(MOSuggestionCollectionViewFilterCell *)&v5 setSelected:v3];
  MOSuggestionCollectionViewFilterCell.isSelected.didset();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionCollectionViewFilterCell_filterButton);
}

@end