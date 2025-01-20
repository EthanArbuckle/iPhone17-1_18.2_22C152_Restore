@interface MUHikingTipViewModel
- (MUHikingTipViewModel)init;
- (NSString)subtitle;
- (NSString)title;
@end

@implementation MUHikingTipViewModel

- (NSString)title
{
  return (NSString *)sub_193271438((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MUHikingTipViewModel_title);
}

- (NSString)subtitle
{
  return (NSString *)sub_193271438((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MUHikingTipViewModel_subtitle);
}

- (MUHikingTipViewModel)init
{
  result = (MUHikingTipViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end