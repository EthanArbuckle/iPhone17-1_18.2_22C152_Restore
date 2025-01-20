@interface CAFUIAutomakerSettingObserver
- (_TtC5CAFUI29CAFUIAutomakerSettingObserver)init;
- (void)BOOLeanSettingService:(id)a3 didUpdateName:(id)a4;
- (void)BOOLeanSettingService:(id)a3 didUpdateOn:(BOOL)a4;
- (void)automakerSettingService:(id)a3 didUpdateDisabled:(BOOL)a4;
- (void)automakerSettingService:(id)a3 didUpdateHidden:(BOOL)a4;
- (void)automakerSettingService:(id)a3 didUpdateLimitableUIElement:(BOOL)a4;
- (void)automakerSettingService:(id)a3 didUpdateProminenceInfo:(id)a4;
- (void)automakerSettingService:(id)a3 didUpdateShowAudioBrandLogo:(BOOL)a4;
- (void)buttonSettingService:(id)a3 didUpdateButtonAction:(unsigned __int8)a4;
- (void)buttonSettingService:(id)a3 didUpdateName:(id)a4;
- (void)deepLinkSettingService:(id)a3 didUpdateName:(id)a4;
- (void)deepLinkSettingService:(id)a3 didUpdateUserVisibleValue:(id)a4;
- (void)floatSettingService:(id)a3 didUpdateMaximumSymbolName:(id)a4;
- (void)floatSettingService:(id)a3 didUpdateMinimumSymbolName:(id)a4;
- (void)floatSettingService:(id)a3 didUpdateName:(id)a4;
- (void)floatSettingService:(id)a3 didUpdateValue:(float)a4;
- (void)integerSettingService:(id)a3 didUpdateMaximumSymbolName:(id)a4;
- (void)integerSettingService:(id)a3 didUpdateMinimumSymbolName:(id)a4;
- (void)integerSettingService:(id)a3 didUpdateName:(id)a4;
- (void)integerSettingService:(id)a3 didUpdateStepperBarHidden:(BOOL)a4;
- (void)integerSettingService:(id)a3 didUpdateUserVisibleValue:(id)a4;
- (void)integerSettingService:(id)a3 didUpdateValue:(int)a4;
- (void)multipleSelectImageSettingService:(id)a3 didUpdateImages:(id)a4;
- (void)multipleSelectImageSettingService:(id)a3 didUpdateIndicesUserVisibleValue:(id)a4;
- (void)multipleSelectImageSettingService:(id)a3 didUpdateListUserVisibleValue:(id)a4;
- (void)multipleSelectImageSettingService:(id)a3 didUpdateName:(id)a4;
- (void)multipleSelectSettingService:(id)a3 didUpdateName:(id)a4;
- (void)multipleSelectSettingService:(id)a3 didUpdateSelectSettingEntryList:(id)a4;
- (void)multipleSelectSettingService:(id)a3 didUpdateSelectedEntryIndices:(id)a4;
- (void)singleSelectImageSettingService:(id)a3 didUpdateCurrentUserVisibleValue:(unsigned __int8)a4;
- (void)singleSelectImageSettingService:(id)a3 didUpdateImages:(id)a4;
- (void)singleSelectImageSettingService:(id)a3 didUpdateListUserVisibleValue:(id)a4;
- (void)singleSelectImageSettingService:(id)a3 didUpdateName:(id)a4;
- (void)singleSelectSettingService:(id)a3 didUpdateName:(id)a4;
- (void)singleSelectSettingService:(id)a3 didUpdateSelectSettingEntryList:(id)a4;
- (void)singleSelectSettingService:(id)a3 didUpdateSelectedEntryIndex:(unsigned __int8)a4;
- (void)staticSettingService:(id)a3 didUpdateName:(id)a4;
- (void)staticSettingService:(id)a3 didUpdateUserVisibleValue:(id)a4;
@end

@implementation CAFUIAutomakerSettingObserver

- (void)automakerSettingService:(id)a3 didUpdateProminenceInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v6, (uint64_t)&unk_26FD23C48, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_263);
}

- (void)automakerSettingService:(id)a3 didUpdateDisabled:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23BF8, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_256);
}

- (void)automakerSettingService:(id)a3 didUpdateLimitableUIElement:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23BA8, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_249);
}

- (void)automakerSettingService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23B58, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_242);
}

- (void)automakerSettingService:(id)a3 didUpdateShowAudioBrandLogo:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23B08, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_235);
}

- (void)BOOLeanSettingService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23AB8, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_228);
}

- (void)BOOLeanSettingService:(id)a3 didUpdateName:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23A68, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_221);
}

- (void)buttonSettingService:(id)a3 didUpdateButtonAction:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23A18, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_214);
}

- (void)buttonSettingService:(id)a3 didUpdateName:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD239C8, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_207);
}

- (void)deepLinkSettingService:(id)a3 didUpdateName:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23978, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_200);
}

- (void)deepLinkSettingService:(id)a3 didUpdateUserVisibleValue:(id)a4
{
}

- (void)floatSettingService:(id)a3 didUpdateValue:(float)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD238D8, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_186);
}

- (void)floatSettingService:(id)a3 didUpdateName:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23888, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_179);
}

- (void)floatSettingService:(id)a3 didUpdateMaximumSymbolName:(id)a4
{
}

- (void)floatSettingService:(id)a3 didUpdateMinimumSymbolName:(id)a4
{
}

- (void)integerSettingService:(id)a3 didUpdateValue:(int)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23798, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_158);
}

- (void)integerSettingService:(id)a3 didUpdateName:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23748, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_151);
}

- (void)integerSettingService:(id)a3 didUpdateStepperBarHidden:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD236F8, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_144);
}

- (void)integerSettingService:(id)a3 didUpdateMaximumSymbolName:(id)a4
{
}

- (void)integerSettingService:(id)a3 didUpdateMinimumSymbolName:(id)a4
{
}

- (void)integerSettingService:(id)a3 didUpdateUserVisibleValue:(id)a4
{
}

- (void)singleSelectSettingService:(id)a3 didUpdateSelectedEntryIndex:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD235B8, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_116);
}

- (void)singleSelectSettingService:(id)a3 didUpdateSelectSettingEntryList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v6, (uint64_t)&unk_26FD23568, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_109);
}

- (void)singleSelectSettingService:(id)a3 didUpdateName:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23518, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_102);
}

- (void)singleSelectImageSettingService:(id)a3 didUpdateCurrentUserVisibleValue:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD234C8, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_95);
}

- (void)singleSelectImageSettingService:(id)a3 didUpdateListUserVisibleValue:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23478, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_88);
}

- (void)singleSelectImageSettingService:(id)a3 didUpdateImages:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23428, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_81);
}

- (void)singleSelectImageSettingService:(id)a3 didUpdateName:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD233D8, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_74_0);
}

- (void)staticSettingService:(id)a3 didUpdateUserVisibleValue:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23388, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_67);
}

- (void)staticSettingService:(id)a3 didUpdateName:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23338, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_60);
}

- (void)multipleSelectSettingService:(id)a3 didUpdateSelectedEntryIndices:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD232E8, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_53);
}

- (void)multipleSelectSettingService:(id)a3 didUpdateSelectSettingEntryList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v6, (uint64_t)&unk_26FD23298, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_46);
}

- (void)multipleSelectSettingService:(id)a3 didUpdateName:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23248, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_39);
}

- (void)multipleSelectImageSettingService:(id)a3 didUpdateIndicesUserVisibleValue:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD231F8, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_32);
}

- (void)multipleSelectImageSettingService:(id)a3 didUpdateListUserVisibleValue:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD231A8, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_25);
}

- (void)multipleSelectImageSettingService:(id)a3 didUpdateImages:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23158, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_18);
}

- (void)multipleSelectImageSettingService:(id)a3 didUpdateName:(id)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFUIAutomakerSettingObserver.automakerSettingService(_:didUpdateProminenceInfo:)(v5, (uint64_t)&unk_26FD23108, (uint64_t)partial apply for closure #1 in CAFUIAutomakerSettingObserver.settingUpdated(_:), (uint64_t)&block_descriptor_1);
}

- (_TtC5CAFUI29CAFUIAutomakerSettingObserver)init
{
  *(void *)&self->delegate[OBJC_IVAR____TtC5CAFUI29CAFUIAutomakerSettingObserver_delegate] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CAFUIAutomakerSettingObserver();
  return [(CAFUIAutomakerSettingObserver *)&v4 init];
}

- (void).cxx_destruct
{
}

@end