@interface EDSearchableIndexBackgroundScheduler
+ (void)deregister;
- (EDSearchableIndexBackgroundScheduler)init;
@end

@implementation EDSearchableIndexBackgroundScheduler

- (EDSearchableIndexBackgroundScheduler)init
{
  return (EDSearchableIndexBackgroundScheduler *)EDSearchableIndexBackgroundScheduler.init()();
}

+ (void)deregister
{
  if (qword_1EB5F5520 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DB5E17C8();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB5F5500);
  v1 = sub_1DB5E17A8();
  os_log_type_t v2 = sub_1DB5E1A58();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB39C000, v1, v2, "Deregistering background task", v3, 2u);
    MEMORY[0x1E0190C20](v3, -1, -1);
  }

  id v4 = objc_msgSend(self, sel_sharedScheduler);
  v5 = (void *)sub_1DB5E1868();
  unsigned int v6 = objc_msgSend(v4, sel_deregisterTaskWithIdentifier_, v5);

  oslog = sub_1DB5E17A8();
  os_log_type_t v7 = sub_1DB5E1A58();
  if (os_log_type_enabled(oslog, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v13 = v9;
    *(_DWORD *)v8 = 136315138;
    if (v6) {
      uint64_t v10 = 0xD000000000000019;
    }
    else {
      uint64_t v10 = 0xD000000000000016;
    }
    if (v6) {
      unint64_t v11 = 0x80000001DB661790;
    }
    else {
      unint64_t v11 = 0x80000001DB661770;
    }
    sub_1DB5C054C(v10, v11, &v13);
    sub_1DB5E1AF8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1DB39C000, oslog, v7, "%s background task", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E0190C20](v9, -1, -1);
    MEMORY[0x1E0190C20](v8, -1, -1);
  }
  else
  {
  }
}

@end