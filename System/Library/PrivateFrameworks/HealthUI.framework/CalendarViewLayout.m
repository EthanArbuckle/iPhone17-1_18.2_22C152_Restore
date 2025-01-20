@interface CalendarViewLayout
+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC8HealthUI18CalendarViewLayout)init;
- (_TtC8HealthUI18CalendarViewLayout)initWithCoder:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
@end

@implementation CalendarViewLayout

+ (Class)layoutAttributesClass
{
  type metadata accessor for CalendarViewLayoutAttributes();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8HealthUI18CalendarViewLayout)initWithCoder:(id)a3
{
  result = (_TtC8HealthUI18CalendarViewLayout *)sub_1E0ECD8F0();
  __break(1u);
  return result;
}

- (void)prepareLayout
{
  v2 = self;
  sub_1E0EAC5D4();
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = objc_allocWithZone((Class)type metadata accessor for CalendarLayoutInvalidationContext());
  v9 = self;
  v10 = objc_msgSend(v8, sel_init);
  id v11 = [(CalendarViewLayout *)v9 collectionView];
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, sel_bounds);
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    BOOL v13 = CGRectEqualToRect(v16, v17);

    if (!v13) {
      v10[OBJC_IVAR____TtC8HealthUI33CalendarLayoutInvalidationContext_shouldInvalidateAllDecorationViews] = 1;
    }
  }

  return v10;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E0EACC6C(v4);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  uint64_t v8 = sub_1E0EACE60(x, y, width, height);

  if (v8)
  {
    sub_1E0EADE84();
    v9 = (void *)sub_1E0ECD320();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_1E0ECBD30();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1E0ECD1D0();
  uint64_t v12 = v11;
  sub_1E0ECBCE0();
  BOOL v13 = self;
  v14 = (void *)sub_1E0EAD318(v10, v12, (uint64_t)v9);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v14;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

+ (Class)invalidationContextClass
{
  type metadata accessor for CalendarLayoutInvalidationContext();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8HealthUI18CalendarViewLayout)init
{
  result = (_TtC8HealthUI18CalendarViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8HealthUI18CalendarViewLayout_calendar;
  uint64_t v3 = sub_1E0ECBB60();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end