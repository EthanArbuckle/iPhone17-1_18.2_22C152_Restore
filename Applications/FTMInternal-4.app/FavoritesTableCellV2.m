@interface FavoritesTableCellV2
- (_TtC13FTMInternal_420FavoritesTableCellV2)initWithCoder:(id)a3;
- (_TtC13FTMInternal_420FavoritesTableCellV2)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation FavoritesTableCellV2

- (_TtC13FTMInternal_420FavoritesTableCellV2)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC13FTMInternal_420FavoritesTableCellV2 *)sub_10017A1A0((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100177AC8);
}

- (_TtC13FTMInternal_420FavoritesTableCellV2)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___valueLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___activityIndicator) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___separatorView) = 0;
  id v4 = a3;

  result = (_TtC13FTMInternal_420FavoritesTableCellV2 *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___activityIndicator));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13FTMInternal_420FavoritesTableCellV2____lazy_storage___separatorView);
}

@end