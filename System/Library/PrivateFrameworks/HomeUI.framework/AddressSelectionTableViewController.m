@interface AddressSelectionTableViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (_TtC6HomeUI35AddressSelectionTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation AddressSelectionTableViewController

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v4 = sub_1BE9C1208();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EA117BD0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  uint64_t v8 = sub_1BE9C1208();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_1BE54EC40(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1BE9C1208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  id v10 = a3;
  v11 = self;
  sub_1BE54DD54(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC6HomeUI35AddressSelectionTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  id v4 = a3;
  result = (_TtC6HomeUI35AddressSelectionTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end