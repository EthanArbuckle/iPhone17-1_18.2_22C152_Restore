@interface CAUAssetLibraryManager._ClientProxy
- (_TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy)init;
- (void)invalidate;
- (void)refreshVariants;
@end

@implementation CAUAssetLibraryManager._ClientProxy

- (_TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy)init
{
  swift_weakInit();

  result = (_TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy *)sub_24982E678();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy_connectionQueue));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy_connection);
}

- (void)invalidate
{
  v2 = self;
  sub_24981B110();
}

- (void)refreshVariants
{
  uint64_t v2 = qword_2696D0928;
  v7 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_24982E3E8();
  __swift_project_value_buffer(v3, (uint64_t)qword_2696D0D30);
  v4 = sub_24982E3C8();
  os_log_type_t v5 = sub_24982E598();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_24980F000, v4, v5, "refreshVariants", v6, 2u);
    MEMORY[0x24C5AB450](v6, -1, -1);
  }

  sub_24981A390();
}

@end