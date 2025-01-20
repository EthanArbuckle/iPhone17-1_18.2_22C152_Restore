@interface MUPlaceItemShareItemSource
- (MUPlaceItemShareItemSource)init;
- (MUPlaceItemShareItemSource)initWithPlaceItem:(id)a3 applicationActivities:(id)a4;
- (NSArray)activityProviders;
- (NSArray)applicationActivities;
- (NSArray)excludedActivityTypes;
- (NSArray)includedActivityTypes;
- (void)setActivityProviders:(id)a3;
- (void)setApplicationActivities:(id)a3;
- (void)setIncludedActivityTypes:(id)a3;
@end

@implementation MUPlaceItemShareItemSource

- (NSArray)applicationActivities
{
  swift_beginAccess();
  sub_1931EFC80();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_193341450();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setApplicationActivities:(id)a3
{
  sub_1931EFC80();
  uint64_t v4 = sub_193341460();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MUPlaceItemShareItemSource_applicationActivities);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSArray)activityProviders
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E930F9A8);
  v2 = (void *)sub_193341450();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setActivityProviders:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E930F9A8);
  uint64_t v4 = sub_193341460();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MUPlaceItemShareItemSource_activityProviders);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSArray)excludedActivityTypes
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E930F860);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_193356030;
  *(void *)(v2 + 32) = sub_1933413B0();
  *(void *)(v2 + 40) = v3;
  uint64_t v4 = (void *)sub_193341450();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (NSArray)includedActivityTypes
{
  uint64_t v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___MUPlaceItemShareItemSource_includedActivityTypes);
  swift_beginAccess();
  if (*v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_193341450();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSArray *)v3;
}

- (void)setIncludedActivityTypes:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_193341460();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MUPlaceItemShareItemSource_includedActivityTypes);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (MUPlaceItemShareItemSource)initWithPlaceItem:(id)a3 applicationActivities:(id)a4
{
  sub_1931EFC80();
  uint64_t v4 = sub_193341460();
  uint64_t v5 = swift_unknownObjectRetain();
  v6 = (MUPlaceItemShareItemSource *)sub_1931EF9A4(v5, v4);
  swift_unknownObjectRelease();
  return v6;
}

- (MUPlaceItemShareItemSource)init
{
  result = (MUPlaceItemShareItemSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end