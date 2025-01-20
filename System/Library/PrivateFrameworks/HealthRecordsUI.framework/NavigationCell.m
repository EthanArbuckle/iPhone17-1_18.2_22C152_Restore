@interface NavigationCell
- (_TtC15HealthRecordsUI14NavigationCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI14NavigationCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)showDetailViewController:(id)a3 viewController:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NavigationCell

- (_TtC15HealthRecordsUI14NavigationCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI14NavigationCell *)sub_1C2349968(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI14NavigationCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI14NavigationCell *)sub_1C2349AF4(a3);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NavigationCell();
  id v2 = v4.receiver;
  [(NavigationCell *)&v4 layoutSubviews];
  sub_1C254CDB0();
  id v3 = (id)*MEMORY[0x1E4F39EA8];
  sub_1C254FE70();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1C2349DF8(a3);
}

- (void)showDetailViewController:(id)a3 viewController:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1C25501E0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a4;
    v9 = self;
  }
  sub_1C234A7FC((uint64_t)v10, a4);

  sub_1C224E3A4((uint64_t)v10);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI14NavigationCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI14NavigationCell____lazy_storage___disclosureImageView));
  id v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI14NavigationCell_item;
  sub_1C2227100((uint64_t)v3);
}

@end