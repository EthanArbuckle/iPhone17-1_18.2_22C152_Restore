@interface ListPickerSectionHeader
- (_TtC8Business23ListPickerSectionHeader)initWithCoder:(id)a3;
- (_TtC8Business23ListPickerSectionHeader)initWithReuseIdentifier:(id)a3;
@end

@implementation ListPickerSectionHeader

- (_TtC8Business23ListPickerSectionHeader)initWithReuseIdentifier:(id)a3
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
  return (_TtC8Business23ListPickerSectionHeader *)sub_10005BB58(v3, v4);
}

- (_TtC8Business23ListPickerSectionHeader)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10005C5D0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23ListPickerSectionHeader_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23ListPickerSectionHeader_topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23ListPickerSectionHeader_bottomSeparator));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business23ListPickerSectionHeader_separatorColor);
}

@end