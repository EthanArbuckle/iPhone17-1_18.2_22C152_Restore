@interface CalendarLayoutInvalidationContext
- (_TtC8HealthUI33CalendarLayoutInvalidationContext)init;
@end

@implementation CalendarLayoutInvalidationContext

- (_TtC8HealthUI33CalendarLayoutInvalidationContext)init
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8HealthUI33CalendarLayoutInvalidationContext_shouldInvalidateAllDecorationViews) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CalendarLayoutInvalidationContext();
  return [(UICollectionViewFlowLayoutInvalidationContext *)&v3 init];
}

@end