@interface ASOKeepAlive
- (ASOKeepAlive)init;
- (ASOKeepAlive)initWithName:(id)a3 explanation:(id)a4;
- (void)acquire;
- (void)invalidate;
@end

@implementation ASOKeepAlive

- (ASOKeepAlive)initWithName:(id)a3 explanation:(id)a4
{
  uint64_t v5 = sub_100018930();
  uint64_t v7 = v6;
  uint64_t v8 = sub_100018930();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___ASOKeepAlive_name);
  uint64_t *v9 = v5;
  v9[1] = v7;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___ASOKeepAlive_explanation);
  uint64_t *v10 = v8;
  v10[1] = v11;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for KeepAlive();
  return [(ASOKeepAlive *)&v13 init];
}

- (void)acquire
{
}

- (void)invalidate
{
}

- (ASOKeepAlive)init
{
  result = (ASOKeepAlive *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end