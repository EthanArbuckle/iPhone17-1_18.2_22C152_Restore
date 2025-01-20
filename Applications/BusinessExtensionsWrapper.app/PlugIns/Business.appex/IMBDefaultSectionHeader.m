@interface IMBDefaultSectionHeader
- (UILabel)headerLabel;
- (_TtC8Business23IMBDefaultSectionHeader)initWithCoder:(id)a3;
- (_TtC8Business23IMBDefaultSectionHeader)initWithReuseIdentifier:(id)a3;
@end

@implementation IMBDefaultSectionHeader

- (UILabel)headerLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC8Business23IMBDefaultSectionHeader_headerLabel));
}

- (_TtC8Business23IMBDefaultSectionHeader)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_1000BBAC8();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC8Business23IMBDefaultSectionHeader *)sub_100099FFC(v3, v4);
}

- (_TtC8Business23IMBDefaultSectionHeader)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8Business23IMBDefaultSectionHeader_headerLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business23IMBDefaultSectionHeader____lazy_storage___separatorView) = 0;

  result = (_TtC8Business23IMBDefaultSectionHeader *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23IMBDefaultSectionHeader_headerLabel));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business23IMBDefaultSectionHeader____lazy_storage___separatorView);
}

@end