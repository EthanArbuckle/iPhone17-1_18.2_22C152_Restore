@interface AUAMuteControl
- (BOOL)changeValue:(BOOL)a3;
- (_TtC9AUASDCore14AUAMuteControl)initWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7 andObjectClassID:(unsigned int)a8;
@end

@implementation AUAMuteControl

- (BOOL)changeValue:(BOOL)a3
{
  v4 = self;
  char v5 = sub_1000A4364(a3);

  return v5 & 1;
}

- (_TtC9AUASDCore14AUAMuteControl)initWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7 andObjectClassID:(unsigned int)a8
{
  id v8 = a7;
  result = (_TtC9AUASDCore14AUAMuteControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end