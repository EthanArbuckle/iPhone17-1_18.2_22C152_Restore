@interface CKSettingsCheckInDevicesList
- (_TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList)init;
- (_TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList)initWithFullDataSharing:(BOOL)a3;
- (id)getView;
@end

@implementation CKSettingsCheckInDevicesList

- (_TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList)initWithFullDataSharing:(BOOL)a3
{
  if (a3) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  v5 = self;
  v6 = self;
  id v7 = objc_msgSend(v5, sel_mainScreen);
  objc_msgSend(v7, sel_bounds);
  uint64_t v9 = v8;

  v10 = (char *)v6 + OBJC_IVAR____TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList_view;
  *(void *)v10 = v9;
  v10[8] = v4;

  v12.receiver = v6;
  v12.super_class = (Class)type metadata accessor for CKSettingsCheckInDevicesList();
  return [(CKSettingsCheckInDevicesList *)&v12 init];
}

- (id)getView
{
  sub_21ED9D238();
  MEMORY[0x270FA5388]();
  id v3 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267EA6E00));
  char v4 = self;
  v5 = (void *)sub_21ED9D1F8();
  sub_21ED9D228();
  sub_21ED9D1E8();

  return v5;
}

- (_TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList)init
{
  result = (_TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end