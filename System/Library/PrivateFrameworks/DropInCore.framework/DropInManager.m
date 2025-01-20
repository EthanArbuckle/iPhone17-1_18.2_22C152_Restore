@interface DropInManager
- (_TtC10DropInCore13DropInManager)init;
- (void)accessoryDidUpdateName:(id)a3;
- (void)accessoryDidUpdateSupportedCapabilities:(id)a3;
- (void)dealloc;
- (void)didAddHome:(id)a3;
- (void)didRemoveHome:(id)a3;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didAddUser:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveUser:(id)a4;
- (void)home:(id)a3 didUpdateAccessControlForUser:(id)a4;
@end

@implementation DropInManager

- (void)dealloc
{
  v2 = self;
  sub_24D0777A4();
}

- (void).cxx_destruct
{
  swift_release();
  sub_24D0F01C0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_168();
  v3();
  sub_24D0F0190();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_168();
  v4();

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_24D05C8DC((uint64_t)self + OBJC_IVAR____TtC10DropInCore13DropInManager_xpcClientDataSource);
  swift_release();
  sub_24D0949A4((uint64_t)self + OBJC_IVAR____TtC10DropInCore13DropInManager_dropInSessionAnalyticEvent, (void (*)(void))type metadata accessor for DropInSessionAnalyticEvent);
}

- (_TtC10DropInCore13DropInManager)init
{
}

- (void)didAddHome:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D083564();
}

- (void)didRemoveHome:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D083A30();
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24D08443C();
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24D08443C();
}

- (void)accessoryDidUpdateName:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D084A54();
}

- (void)accessoryDidUpdateSupportedCapabilities:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D084A54();
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24D084E7C();
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24D0852CC(v6, v7);
}

- (void)home:(id)a3 didUpdateAccessControlForUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24D0854F4();
}

@end