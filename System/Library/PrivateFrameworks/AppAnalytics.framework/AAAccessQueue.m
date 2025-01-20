@interface AAAccessQueue
- (AAAccessQueue)init;
- (AAAccessQueue)initWithQueue:(id)a3;
- (BOOL)isEqual:(id)a3;
@end

@implementation AAAccessQueue

- (AAAccessQueue)initWithQueue:(id)a3
{
  id v3 = a3;
  v4 = (AAAccessQueue *)sub_1A90F90B4(v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A916B5F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = AccessQueue.isEqual(_:)((uint64_t)v8);

  sub_1A909B5DC((uint64_t)v8);
  return v6;
}

- (AAAccessQueue)init
{
  result = (AAAccessQueue *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end