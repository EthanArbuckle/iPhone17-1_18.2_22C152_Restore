@interface ADMultilineSubtitleCell
- (_TtC23AppInstallationSettings23ADMultilineSubtitleCell)initWithCoder:(id)a3;
- (_TtC23AppInstallationSettings23ADMultilineSubtitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC23AppInstallationSettings23ADMultilineSubtitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation ADMultilineSubtitleCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = [(ADMultilineSubtitleCell *)v6 detailTextLabel];
  if (v7)
  {
    v8 = v7;
    [v7 setNumberOfLines:0];
  }
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for ADMultilineSubtitleCell();
  [(ADMultilineSubtitleCell *)&v9 refreshCellContentsWithSpecifier:v5];
  swift_release();

  swift_release();
}

- (_TtC23AppInstallationSettings23ADMultilineSubtitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  return (_TtC23AppInstallationSettings23ADMultilineSubtitleCell *)sub_14E6C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, a5, 517, (uint64_t (*)(uint64_t))type metadata accessor for ADMultilineSubtitleCell);
}

- (_TtC23AppInstallationSettings23ADMultilineSubtitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC23AppInstallationSettings23ADMultilineSubtitleCell *)sub_14F84(self, (uint64_t)a2, a3, a4, 517, (uint64_t (*)(uint64_t))type metadata accessor for ADMultilineSubtitleCell);
}

- (_TtC23AppInstallationSettings23ADMultilineSubtitleCell)initWithCoder:(id)a3
{
  return (_TtC23AppInstallationSettings23ADMultilineSubtitleCell *)sub_150A0(self, (uint64_t)a2, (uint64_t)a3, 517, (uint64_t (*)(uint64_t))type metadata accessor for ADMultilineSubtitleCell);
}

@end