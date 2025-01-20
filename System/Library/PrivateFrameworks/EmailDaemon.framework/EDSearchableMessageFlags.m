@interface EDSearchableMessageFlags
- (EDSearchableMessageFlags)init;
- (EDSearchableMessageFlags)initWithRead:(BOOL)a3 flagged:(BOOL)a4 flagColor:(unint64_t)a5 replied:(BOOL)a6;
- (void)addToAttributes:(id)a3;
@end

@implementation EDSearchableMessageFlags

- (EDSearchableMessageFlags)initWithRead:(BOOL)a3 flagged:(BOOL)a4 flagColor:(unint64_t)a5 replied:(BOOL)a6
{
  return (EDSearchableMessageFlags *)sub_1DB5C3390(a3, a4, a5, a6);
}

- (void)addToAttributes:(id)a3
{
  sub_1DB5BEEB4((uint64_t)self + OBJC_IVAR___EDSearchableMessageFlags__underlying, (uint64_t)v11);
  id v5 = a3;
  v6 = self;
  swift_dynamicCast();
  if (v10) {
    int v7 = 0x10000;
  }
  else {
    int v7 = 0;
  }
  sub_1DB5D1A60(v5, v7 | (v9 << 8) | v8);
}

- (EDSearchableMessageFlags)init
{
  result = (EDSearchableMessageFlags *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end