@interface CollectionHeaderSuplementaryCell
- (_TtC13FTMInternal_432CollectionHeaderSuplementaryCell)initWithCoder:(id)a3;
- (_TtC13FTMInternal_432CollectionHeaderSuplementaryCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation CollectionHeaderSuplementaryCell

- (_TtC13FTMInternal_432CollectionHeaderSuplementaryCell)initWithFrame:(CGRect)a3
{
  return (_TtC13FTMInternal_432CollectionHeaderSuplementaryCell *)sub_100177500(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13FTMInternal_432CollectionHeaderSuplementaryCell)initWithCoder:(id)a3
{
}

- (void)prepareForReuse
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_432CollectionHeaderSuplementaryCell____lazy_storage___headerLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13FTMInternal_432CollectionHeaderSuplementaryCell____lazy_storage___subHeaderLabel);
}

@end