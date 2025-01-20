@interface FamilySyncEngine.DataSource
- (_TtCC19FamilyControlsAgent16FamilySyncEngine10DataSource)init;
@end

@implementation FamilySyncEngine.DataSource

- (_TtCC19FamilyControlsAgent16FamilySyncEngine10DataSource)init
{
  result = (_TtCC19FamilyControlsAgent16FamilySyncEngine10DataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC19FamilyControlsAgent16FamilySyncEngine10DataSource_cachedAuthorizationKeyRecord));
  v3 = (char *)self + OBJC_IVAR____TtCC19FamilyControlsAgent16FamilySyncEngine10DataSource_locations;
  uint64_t v4 = type metadata accessor for Locations();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end