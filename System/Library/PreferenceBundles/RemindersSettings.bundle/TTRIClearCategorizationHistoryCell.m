@interface TTRIClearCategorizationHistoryCell
- (_TtC17RemindersSettings34TTRIClearCategorizationHistoryCell)initWithCoder:(id)a3;
- (_TtC17RemindersSettings34TTRIClearCategorizationHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC17RemindersSettings34TTRIClearCategorizationHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation TTRIClearCategorizationHistoryCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(TTRIClearCategorizationHistoryCell *)&v6 refreshCellContentsWithSpecifier:v4];
  objc_msgSend(v5, "setAlignment:", 2, v6.receiver, v6.super_class);
}

- (_TtC17RemindersSettings34TTRIClearCategorizationHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_14230();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC17RemindersSettings34TTRIClearCategorizationHistoryCell *)sub_11D48(a3, v7, v9, a5);
}

- (_TtC17RemindersSettings34TTRIClearCategorizationHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_14230();
    a4 = sub_14200();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  uint64_t v8 = [(TTRIClearCategorizationHistoryCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];

  return v8;
}

- (_TtC17RemindersSettings34TTRIClearCategorizationHistoryCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(TTRIClearCategorizationHistoryCell *)&v5 initWithCoder:a3];
}

@end