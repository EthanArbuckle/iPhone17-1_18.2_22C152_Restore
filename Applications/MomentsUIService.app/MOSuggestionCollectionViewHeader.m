@interface MOSuggestionCollectionViewHeader
- (_TtC16MomentsUIService32MOSuggestionCollectionViewHeader)initWithCoder:(id)a3;
- (_TtC16MomentsUIService32MOSuggestionCollectionViewHeader)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MOSuggestionCollectionViewHeader

- (_TtC16MomentsUIService32MOSuggestionCollectionViewHeader)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionCollectionViewHeader_titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionCollectionViewHeader_subTitleLabel) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for MOSuggestionCollectionViewHeader();
  v7 = -[MOSuggestionCollectionViewHeader initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  v8 = self;
  v9 = v7;
  id v10 = [v8 secondarySystemBackgroundColor];
  [(MOSuggestionCollectionViewHeader *)v9 setBackgroundColor:v10];

  return v9;
}

- (_TtC16MomentsUIService32MOSuggestionCollectionViewHeader)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionCollectionViewHeader_titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionCollectionViewHeader_subTitleLabel) = 0;
  id v4 = a3;

  result = (_TtC16MomentsUIService32MOSuggestionCollectionViewHeader *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  MOSuggestionCollectionViewHeader.layoutSubviews()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionCollectionViewHeader_titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionCollectionViewHeader_subTitleLabel);
}

@end