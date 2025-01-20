@interface PartsAndServicePlacardCell
- (_TtC12CoreRepairUI26PartsAndServicePlacardCell)initWithCoder:(id)a3;
- (_TtC12CoreRepairUI26PartsAndServicePlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC12CoreRepairUI26PartsAndServicePlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PartsAndServicePlacardCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  sub_239776F98();
  sub_239776F88();
  sub_239776F78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  sub_239775454();
  swift_release();
}

- (_TtC12CoreRepairUI26PartsAndServicePlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  sub_239776F98();
  sub_239776F88();
  sub_239776F78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a4)
  {
    uint64_t v8 = sub_239776F48();
    a4 = v9;
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v10 = a5;
  v11 = (_TtC12CoreRepairUI26PartsAndServicePlacardCell *)sub_239774924(a3, v8, (uint64_t)a4, a5);
  swift_release();
  return v11;
}

- (_TtC12CoreRepairUI26PartsAndServicePlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_239776F98();
  sub_239776F88();
  sub_239776F78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a4)
  {
    sub_239776F48();
    a4 = (id)sub_239776F18();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  uint64_t v8 = [(PartsAndServicePlacardCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  swift_release();

  return v8;
}

- (_TtC12CoreRepairUI26PartsAndServicePlacardCell)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_239776F98();
  sub_239776F88();
  sub_239776F78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(PartsAndServicePlacardCell *)&v8 initWithCoder:a3];
  swift_release();
  return v6;
}

@end