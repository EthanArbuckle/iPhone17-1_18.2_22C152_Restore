@interface MultiSelectionModalCell
- (_TtC13FTMInternal_423MultiSelectionModalCell)initWithCoder:(id)a3;
- (_TtC13FTMInternal_423MultiSelectionModalCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation MultiSelectionModalCell

- (_TtC13FTMInternal_423MultiSelectionModalCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC13FTMInternal_423MultiSelectionModalCell *)sub_10017A1A0((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100179C10);
}

- (_TtC13FTMInternal_423MultiSelectionModalCell)initWithCoder:(id)a3
{
}

- (void)prepareForReuse
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_423MultiSelectionModalCell____lazy_storage___titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13FTMInternal_423MultiSelectionModalCell____lazy_storage___separatorView);
}

@end