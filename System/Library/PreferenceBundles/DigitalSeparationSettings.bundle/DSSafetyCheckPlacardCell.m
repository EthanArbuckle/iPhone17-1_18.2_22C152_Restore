@interface DSSafetyCheckPlacardCell
- (_TtC25DigitalSeparationSettings24DSSafetyCheckPlacardCell)initWithCoder:(id)a3;
- (_TtC25DigitalSeparationSettings24DSSafetyCheckPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC25DigitalSeparationSettings24DSSafetyCheckPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation DSSafetyCheckPlacardCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  sub_83D0();
  sub_83C0();
  sub_83B0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  sub_794C();
  swift_release();
}

- (_TtC25DigitalSeparationSettings24DSSafetyCheckPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  sub_83D0();
  sub_83C0();
  sub_83B0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a4)
  {
    uint64_t v8 = sub_8390();
    a4 = v9;
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v10 = a5;
  v11 = (_TtC25DigitalSeparationSettings24DSSafetyCheckPlacardCell *)sub_740C(a3, v8, (uint64_t)a4, a5);
  swift_release();
  return v11;
}

- (_TtC25DigitalSeparationSettings24DSSafetyCheckPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_83D0();
  sub_83C0();
  sub_83B0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a4)
  {
    sub_8390();
    a4 = sub_8380();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  uint64_t v8 = [(DSSafetyCheckPlacardCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  swift_release();

  return v8;
}

- (_TtC25DigitalSeparationSettings24DSSafetyCheckPlacardCell)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_83D0();
  sub_83C0();
  sub_83B0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(DSSafetyCheckPlacardCell *)&v8 initWithCoder:a3];
  swift_release();
  return v6;
}

@end