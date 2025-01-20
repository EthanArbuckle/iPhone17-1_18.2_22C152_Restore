@interface MOSuggestionCarouselAssetCell
- (BOOL)isSelected;
- (_TtC16MomentsUIService29MOSuggestionCarouselAssetCell)initWithCoder:(id)a3;
- (_TtC16MomentsUIService29MOSuggestionCarouselAssetCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setSelected:(BOOL)a3;
@end

@implementation MOSuggestionCarouselAssetCell

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MOSuggestionCarouselAssetCell();
  return [(MOSuggestionCarouselAssetCell *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MOSuggestionCarouselAssetCell();
  v4 = (char *)v8.receiver;
  [(MOSuggestionCarouselAssetCell *)&v8 setSelected:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC16MomentsUIService29MOSuggestionCarouselAssetCell_checkPlatterView];
  if (v5)
  {
    v6 = v5;
    id v7 = [v4 isSelected];
    (*(void (**)(id))((swift_isaMask & *v6) + 0xA0))(v7);

    v4 = (char *)v6;
  }
}

- (_TtC16MomentsUIService29MOSuggestionCarouselAssetCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService29MOSuggestionCarouselAssetCell *)specialized MOSuggestionCarouselAssetCell.init(frame:)();
}

- (_TtC16MomentsUIService29MOSuggestionCarouselAssetCell)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionCarouselAssetCell.init(coder:)();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MOSuggestionCarouselAssetCell();
  v2 = (char *)v4.receiver;
  [(MOSuggestionCarouselAssetCell *)&v4 layoutSubviews];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC16MomentsUIService29MOSuggestionCarouselAssetCell_assetView];
  [v2 bounds];
  [v3 setFrame:];
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MOSuggestionCarouselAssetCell();
  v2 = (char *)v7.receiver;
  [(MOSuggestionCarouselAssetCell *)&v7 prepareForReuse];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC16MomentsUIService29MOSuggestionCarouselAssetCell_assetView];
  objc_super v4 = *(void (**)(void *, uint64_t))((swift_isaMask & *v3) + 0xC8);
  v5 = v3;
  v4(v5, v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionCarouselAssetCell_checkPlatterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionCarouselAssetCell_blurEffectView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionCarouselAssetCell_assetView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionCarouselAssetCell_keyColor);
}

@end