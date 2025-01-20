@interface GMFooterUtility
- (_TtC24AssistantSettingsSupport15GMFooterUtility)init;
- (id)fetchEnglishVariants;
- (id)openAppleIntelligenceURL;
- (id)openStorageManagement;
- (void)updateFooterWithSpecifier:(id)a3 settings:(id)a4 wifiAvailable:(BOOL)a5 isChinaSKU:(BOOL)a6;
@end

@implementation GMFooterUtility

- (_TtC24AssistantSettingsSupport15GMFooterUtility)init
{
  return (_TtC24AssistantSettingsSupport15GMFooterUtility *)GMFooterUtility.init()();
}

- (id)fetchEnglishVariants
{
  sub_220C749A0();
  v2 = (void *)sub_220C74F10();
  swift_bridgeObjectRelease();

  return v2;
}

- (void)updateFooterWithSpecifier:(id)a3 settings:(id)a4 wifiAvailable:(BOOL)a5 isChinaSKU:(BOOL)a6
{
  BOOL v7 = a5;
  id v12 = a3;
  id v10 = a4;
  v11 = self;
  sub_220C5D294(v12, v10, v7, a6);
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

- (id)openStorageManagement
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BC18);
  MEMORY[0x270FA5388](v0 - 8);
  v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_220C745F0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267F2BA88 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_220C74920();
  __swift_project_value_buffer(v7, (uint64_t)qword_267F2D3A8);
  v8 = sub_220C74900();
  os_log_type_t v9 = sub_220C74F60();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_220C23000, v8, v9, "openStorageManagement being called", v10, 2u);
    MEMORY[0x223C72360](v10, -1, -1);
  }

  sub_220C745E0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1) {
    return (id)sub_220C54404((uint64_t)v2, &qword_267F2BC18);
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  id result = objc_msgSend(self, sel_defaultWorkspace);
  if (result)
  {
    id v12 = result;
    v13 = (void *)sub_220C745C0();
    objc_msgSend(v12, sel_openSensitiveURL_withOptions_, v13, 0);

    return (id)(*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)openAppleIntelligenceURL
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BC18);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v22 - v4;
  uint64_t v6 = sub_220C745F0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  id v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  id v12 = (char *)&v22 - v11;
  id v13 = objc_msgSend(self, sel_currentDevice);
  unsigned int v14 = objc_msgSend(v13, sel_sf_isiPad);

  v15 = (unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v14)
  {
    sub_220C745E0();
    if ((*v15)(v5, 1, v6) == 1)
    {
      uint64_t v16 = (uint64_t)v5;
      return (id)sub_220C54404(v16, &qword_267F2BC18);
    }
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
    id result = objc_msgSend(self, sel_defaultWorkspace);
    if (result)
    {
      v18 = result;
      v19 = (void *)sub_220C745C0();
      objc_msgSend(v18, sel_openSensitiveURL_withOptions_, v19, 0);

      return (id)(*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    }
    __break(1u);
    goto LABEL_13;
  }
  sub_220C745E0();
  if ((*v15)(v3, 1, v6) == 1)
  {
    uint64_t v16 = (uint64_t)v3;
    return (id)sub_220C54404(v16, &qword_267F2BC18);
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v3, v6);
  id result = objc_msgSend(self, sel_defaultWorkspace);
  if (!result)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  v20 = result;
  v21 = (void *)sub_220C745C0();
  objc_msgSend(v20, sel_openSensitiveURL_withOptions_, v21, 0);

  return (id)(*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

@end