@interface AdaptiveValueTableCell
- (_TtC15JournalSettings22AdaptiveValueTableCell)initWithCoder:(id)a3;
- (_TtC15JournalSettings22AdaptiveValueTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC15JournalSettings22AdaptiveValueTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation AdaptiveValueTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AdaptiveValueTableCell();
  id v4 = a3;
  id v5 = v6.receiver;
  [(AdaptiveValueTableCell *)&v6 refreshCellContentsWithSpecifier:v4];
  objc_msgSend(v5, "setNeedsUpdateConfiguration", v6.receiver, v6.super_class);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1457B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1457A0();
  v8 = self;
  sub_129CF4((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC15JournalSettings22AdaptiveValueTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
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
  return (_TtC15JournalSettings22AdaptiveValueTableCell *)sub_12A178(a3, v7, v9, a5);
}

- (_TtC15JournalSettings22AdaptiveValueTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_145BC0();
    NSString v6 = sub_145B80();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AdaptiveValueTableCell();
  uint64_t v7 = [(AdaptiveValueTableCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC15JournalSettings22AdaptiveValueTableCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AdaptiveValueTableCell();
  return [(AdaptiveValueTableCell *)&v5 initWithCoder:a3];
}

@end