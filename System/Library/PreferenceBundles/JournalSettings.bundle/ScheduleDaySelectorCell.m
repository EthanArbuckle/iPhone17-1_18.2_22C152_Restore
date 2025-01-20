@interface ScheduleDaySelectorCell
- (BOOL)canReload;
- (_TtC15JournalSettings23ScheduleDaySelectorCell)initWithCoder:(id)a3;
- (_TtC15JournalSettings23ScheduleDaySelectorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC15JournalSettings23ScheduleDaySelectorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)titleLabel;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation ScheduleDaySelectorCell

- (_TtC15JournalSettings23ScheduleDaySelectorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_145BC0();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  sub_129588(a3, v7, v9, a5);
  return result;
}

- (_TtC15JournalSettings23ScheduleDaySelectorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_145BC0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC15JournalSettings23ScheduleDaySelectorCell *)sub_129770(a3, (uint64_t)a4, v6);
}

- (_TtC15JournalSettings23ScheduleDaySelectorCell)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC15JournalSettings23ScheduleDaySelectorCell_daySelector;
  type metadata accessor for ScheduleDaySelector();
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v6 = self;
  id v7 = [v5 init];
  *(void *)&self->PSTableCell_opaque[v4] = v7;

  type metadata accessor for ScheduleDaySelectorCell();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_129918((uint64_t)v4);
}

- (BOOL)canReload
{
  return 1;
}

- (id)titleLabel
{
  return 0;
}

- (void).cxx_destruct
{
}

@end