@interface HFDashboardStaticSectionListItem
- (HFDashboardStaticSectionListItem)initWithResults:(id)a3;
- (HFDashboardStaticSectionListItem)initWithResultsBlock:(id)a3;
- (NSString)uuidString;
- (void)setUuidString:(id)a3;
@end

@implementation HFDashboardStaticSectionListItem

- (NSString)uuidString
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_20BCE75E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setUuidString:(id)a3
{
  uint64_t v4 = sub_20BCE7620();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___HFDashboardStaticSectionListItem_uuidString);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (HFDashboardStaticSectionListItem)initWithResults:(id)a3
{
  result = (HFDashboardStaticSectionListItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HFDashboardStaticSectionListItem)initWithResultsBlock:(id)a3
{
  v3 = _Block_copy(a3);
  _Block_release(v3);
  result = (HFDashboardStaticSectionListItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end