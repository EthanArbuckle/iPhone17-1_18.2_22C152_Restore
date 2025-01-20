@interface ControlCenterModuleLayoutManager
- (HUGridSize)gridSizeForItem:(id)a3;
- (_TtC6HomeUI32ControlCenterModuleLayoutManager)init;
@end

@implementation ControlCenterModuleLayoutManager

- (HUGridSize)gridSizeForItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_1BE4373D8();
  int64_t v8 = v7;

  int64_t v9 = v6;
  int64_t v10 = v8;
  result.columnsAcross = v10;
  result.rowsDown = v9;
  return result;
}

- (_TtC6HomeUI32ControlCenterModuleLayoutManager)init
{
  HUGridSize result = (_TtC6HomeUI32ControlCenterModuleLayoutManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end