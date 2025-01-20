@interface MUConstraintLayoutInternal
- (MUConstraintLayoutInternal)init;
- (NSArray)layoutConstraints;
- (NSArray)layoutGuides;
- (UIView)viewForForwardingSetNeedsUpdateConstraints;
- (int64_t)mode;
- (void)activate;
- (void)deactivate;
- (void)prepare;
- (void)setMode:(int64_t)a3;
- (void)setViewForForwardingSetNeedsUpdateConstraints:(id)a3;
@end

@implementation MUConstraintLayoutInternal

- (NSArray)layoutConstraints
{
  uint64_t v3 = *(void *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  uint64_t ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v6 = self;
  v5(ObjectType, v3);

  sub_1931F9204(0, (unint64_t *)&qword_1EB4F6F10);
  v7 = (void *)sub_193341450();
  swift_bridgeObjectRelease();
  return (NSArray *)v7;
}

- (NSArray)layoutGuides
{
  uint64_t v3 = *(void *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  uint64_t ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  v6 = self;
  v5(ObjectType, v3);

  sub_1931F9204(0, &qword_1EB4F6ED8);
  v7 = (void *)sub_193341450();
  swift_bridgeObjectRelease();
  return (NSArray *)v7;
}

- (int64_t)mode
{
  uint64_t v3 = *(void *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  uint64_t ObjectType = swift_getObjectType();
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 24);
  v6 = self;
  int64_t v7 = v5(ObjectType, v3);

  return v7;
}

- (void)setMode:(int64_t)a3
{
  uint64_t v5 = *(void *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  uint64_t ObjectType = swift_getObjectType();
  int64_t v7 = *(void (**)(int64_t, uint64_t, uint64_t))(v5 + 32);
  v8 = self;
  v7(a3, ObjectType, v5);
}

- (void)deactivate
{
  uint64_t v3 = *(void *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(void, uint64_t, uint64_t))(v3 + 32);
  v6 = self;
  v5(0, ObjectType, v3);
}

- (void)prepare
{
  uint64_t v3 = *(void *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
  v6 = self;
  v5(1, ObjectType, v3);
}

- (void)activate
{
  uint64_t v3 = *(void *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
  v6 = self;
  v5(2, ObjectType, v3);
}

- (UIView)viewForForwardingSetNeedsUpdateConstraints
{
  uint64_t v3 = *(void *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 48);
  v6 = self;
  int64_t v7 = (void *)v5(ObjectType, v3);

  return (UIView *)v7;
}

- (void)setViewForForwardingSetNeedsUpdateConstraints:(id)a3
{
  uint64_t v5 = *(void *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  uint64_t ObjectType = swift_getObjectType();
  int64_t v7 = *(void (**)(id, uint64_t, uint64_t))(v5 + 56);
  id v8 = a3;
  v9 = self;
  v7(a3, ObjectType, v5);
}

- (MUConstraintLayoutInternal)init
{
  result = (MUConstraintLayoutInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end