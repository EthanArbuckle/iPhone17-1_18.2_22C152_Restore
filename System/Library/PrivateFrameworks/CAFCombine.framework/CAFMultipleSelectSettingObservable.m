@interface CAFMultipleSelectSettingObservable
- (NSString)description;
- (_TtC10CAFCombine34CAFMultipleSelectSettingObservable)init;
- (void)automakerSettingService:(id)a3 didUpdateCategory:(unsigned __int8)a4;
- (void)automakerSettingService:(id)a3 didUpdateDisabled:(BOOL)a4;
- (void)automakerSettingService:(id)a3 didUpdateHidden:(BOOL)a4;
- (void)automakerSettingService:(id)a3 didUpdateIdentifier:(id)a4;
- (void)automakerSettingService:(id)a3 didUpdateLimitableUIElement:(BOOL)a4;
- (void)automakerSettingService:(id)a3 didUpdateProminenceInfo:(id)a4;
- (void)automakerSettingService:(id)a3 didUpdateSectionIdentifier:(id)a4;
- (void)automakerSettingService:(id)a3 didUpdateShowAudioBrandLogo:(BOOL)a4;
- (void)automakerSettingService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4;
- (void)automakerSettingService:(id)a3 didUpdateSymbolName:(id)a4;
- (void)automakerSettingService:(id)a3 didUpdateUserVisibleLabel:(id)a4;
- (void)automakerSettingService:(id)a3 didUpdateVehicleLayoutKey:(id)a4;
- (void)dealloc;
- (void)multipleSelectSettingService:(id)a3 didUpdateName:(id)a4;
- (void)multipleSelectSettingService:(id)a3 didUpdateSelectSettingEntryList:(id)a4;
- (void)multipleSelectSettingService:(id)a3 didUpdateSelectedEntryIndices:(id)a4;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFMultipleSelectSettingObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFMultipleSelectSettingObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFMultipleSelectSettingObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10CAFCombine34CAFMultipleSelectSettingObservable_observed));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC10CAFCombine34CAFMultipleSelectSettingObservable)init
{
}

- (void)automakerSettingService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
}

- (void)automakerSettingService:(id)a3 didUpdateSectionIdentifier:(id)a4
{
}

- (void)automakerSettingService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4
{
  id v5 = a3;
  v6 = self;
  CAFMultipleSelectSettingObservable.automakerSettingService(_:didUpdateSortOrder:)();
}

- (void)automakerSettingService:(id)a3 didUpdateCategory:(unsigned __int8)a4
{
  id v5 = a3;
  v6 = self;
  CAFMultipleSelectSettingObservable.automakerSettingService(_:didUpdateCategory:)();
}

- (void)automakerSettingService:(id)a3 didUpdateIdentifier:(id)a4
{
}

- (void)automakerSettingService:(id)a3 didUpdateDisabled:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  CAFMultipleSelectSettingObservable.automakerSettingService(_:didUpdateDisabled:)();
}

- (void)automakerSettingService:(id)a3 didUpdateLimitableUIElement:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  CAFMultipleSelectSettingObservable.automakerSettingService(_:didUpdateLimitableUIElement:)();
}

- (void)automakerSettingService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  CAFMultipleSelectSettingObservable.automakerSettingService(_:didUpdateHidden:)();
}

- (void)automakerSettingService:(id)a3 didUpdateShowAudioBrandLogo:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  CAFMultipleSelectSettingObservable.automakerSettingService(_:didUpdateShowAudioBrandLogo:)();
}

- (void)automakerSettingService:(id)a3 didUpdateVehicleLayoutKey:(id)a4
{
}

- (void)automakerSettingService:(id)a3 didUpdateSymbolName:(id)a4
{
}

- (void)automakerSettingService:(id)a3 didUpdateProminenceInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CAFMultipleSelectSettingObservable.automakerSettingService(_:didUpdateProminenceInfo:)((uint64_t)v8, a4);
}

- (void)multipleSelectSettingService:(id)a3 didUpdateSelectSettingEntryList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CAFMultipleSelectSettingObservable.multipleSelectSettingService(_:didUpdateSelectSettingEntryList:)((uint64_t)v8, v7);
}

- (void)multipleSelectSettingService:(id)a3 didUpdateSelectedEntryIndices:(id)a4
{
  type metadata accessor for CAFTemperature(0, &lazy cache variable for type metadata for NSNumber);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  CAFMultipleSelectSettingObservable.multipleSelectSettingService(_:didUpdateSelectedEntryIndices:)((uint64_t)v8, v6);

  swift_bridgeObjectRelease();
}

- (void)multipleSelectSettingService:(id)a3 didUpdateName:(id)a4
{
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = self;
  CAFMultipleSelectSettingObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  CAFMultipleSelectSettingObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CAFMultipleSelectSettingObservable.serviceDidFinishGroupUpdate(_:)();
}

@end