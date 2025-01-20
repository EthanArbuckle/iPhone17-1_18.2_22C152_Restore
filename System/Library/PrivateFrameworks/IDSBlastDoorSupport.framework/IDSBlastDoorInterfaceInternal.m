@interface IDSBlastDoorInterfaceInternal
- (IDSBlastDoorInterfaceInternal)init;
- (void)unpackClientMessage:(id)a3 context:(id)a4 resultHandler:(id)a5;
- (void)unpackPayloadDictionary:(id)a3 resultHandler:(id)a4;
@end

@implementation IDSBlastDoorInterfaceInternal

- (void)unpackPayloadDictionary:(id)a3 resultHandler:(id)a4
{
  v5 = _Block_copy(a4);
  v6 = (void *)sub_1D4692478();
  _Block_copy(v5);
  v7 = self;
  sub_1D4691258(v6, (uint64_t)v7, (void (**)(void, void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)unpackClientMessage:(id)a3 context:(id)a4 resultHandler:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_1D4692478();
  uint64_t v8 = sub_1D4692478();
  _Block_copy(v6);
  v9 = self;
  sub_1D46919CC(v7, v8, (uint64_t)v9, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (IDSBlastDoorInterfaceInternal)init
{
  return (IDSBlastDoorInterfaceInternal *)IDSBlastDoorInterface.init()();
}

- (void).cxx_destruct
{
}

@end