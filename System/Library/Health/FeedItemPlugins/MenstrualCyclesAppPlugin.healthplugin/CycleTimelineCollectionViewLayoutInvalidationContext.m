@interface CycleTimelineCollectionViewLayoutInvalidationContext
- (NSString)description;
- (_TtC24MenstrualCyclesAppPlugin52CycleTimelineCollectionViewLayoutInvalidationContext)init;
@end

@implementation CycleTimelineCollectionViewLayoutInvalidationContext

- (NSString)description
{
  v2 = self;
  sub_24123000C();

  v3 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC24MenstrualCyclesAppPlugin52CycleTimelineCollectionViewLayoutInvalidationContext)init
{
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin52CycleTimelineCollectionViewLayoutInvalidationContext_invalidateItemHeight) = 0;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin52CycleTimelineCollectionViewLayoutInvalidationContext_invalidateZoomArea) = 0;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin52CycleTimelineCollectionViewLayoutInvalidationContext_invalidateForHorizontalSizeChanges) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleTimelineCollectionViewLayoutInvalidationContext();
  return [(CycleTimelineCollectionViewLayoutInvalidationContext *)&v3 init];
}

@end