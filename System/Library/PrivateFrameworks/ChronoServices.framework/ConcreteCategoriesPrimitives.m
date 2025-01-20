@interface ConcreteCategoriesPrimitives
- (id)resolveBundleIdentifier:(id)a3 from:(int64_t)a4 to:(int64_t)a5;
@end

@implementation ConcreteCategoriesPrimitives

- (id)resolveBundleIdentifier:(id)a3 from:(int64_t)a4 to:(int64_t)a5
{
  uint64_t v7 = sub_190D41978();
  uint64_t v9 = v8;
  swift_retain();
  sub_190D02298(v7, v9, a4, a5);
  uint64_t v11 = v10;
  swift_release();
  swift_bridgeObjectRelease();
  if (v11)
  {
    v12 = (void *)sub_190D41948();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

@end