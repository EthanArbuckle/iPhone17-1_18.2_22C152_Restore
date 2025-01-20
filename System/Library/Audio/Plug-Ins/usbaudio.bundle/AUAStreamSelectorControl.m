@interface AUAStreamSelectorControl
- (BOOL)changeValues:(const unsigned int *)a3 withCount:(int64_t)a4;
- (_TtC9AUASDCore24AUAStreamSelectorControl)initWithIsSettable:(BOOL)a3 forElement:(unsigned int)a4 inScope:(unsigned int)a5 withPlugin:(id)a6 andObjectClassID:(unsigned int)a7;
@end

@implementation AUAStreamSelectorControl

- (BOOL)changeValues:(const unsigned int *)a3 withCount:(int64_t)a4
{
  v5 = self;
  LOBYTE(a3) = sub_100022874((unsigned int *)a3);

  return a3 & 1;
}

- (_TtC9AUASDCore24AUAStreamSelectorControl)initWithIsSettable:(BOOL)a3 forElement:(unsigned int)a4 inScope:(unsigned int)a5 withPlugin:(id)a6 andObjectClassID:(unsigned int)a7
{
  id v7 = a6;
  result = (_TtC9AUASDCore24AUAStreamSelectorControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end