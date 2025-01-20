@interface AAJSON
- (AAJSON)init;
- (AAJSON)initWithData:(id)a3;
- (BOOL)exists;
- (NSArray)array;
- (NSDictionary)object;
- (NSNumber)number;
- (NSString)description;
- (NSString)string;
- (id)any;
- (id)objectAtIndexedSubscript:(int64_t)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)toDataWithOptions:(unint64_t)a3 :(id *)a4;
@end

@implementation AAJSON

- (void).cxx_destruct
{
}

- (AAJSON)initWithData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_1A916AB80();
  unint64_t v6 = v5;

  v7 = (AAJSON *)sub_1A90C0B78();
  sub_1A90A2FD4(v4, v6);
  return v7;
}

- (id)objectForKeyedSubscript:(id)a3
{
  uint64_t v4 = sub_1A916AF90();
  uint64_t v6 = v5;
  v7 = self;
  id v8 = sub_1A90BC120(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (id)objectAtIndexedSubscript:(int64_t)a3
{
  uint64_t v4 = self;
  id v5 = sub_1A90BC2FC(a3);

  return v5;
}

- (BOOL)exists
{
  sub_1A909F130((uint64_t)self + OBJC_IVAR___AAJSON_value, (uint64_t)v4);
  BOOL v2 = v4[3] != 0;
  sub_1A909B5DC((uint64_t)v4);
  return v2;
}

- (id)any
{
  sub_1A909F130((uint64_t)self + OBJC_IVAR___AAJSON_value, (uint64_t)v9);
  uint64_t v2 = v10;
  if (v10)
  {
    id v3 = __swift_project_boxed_opaque_existential_1(v9, v10);
    uint64_t v4 = *(void *)(v2 - 8);
    MEMORY[0x1F4188790](v3);
    uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v4 + 16))(v6);
    v7 = (void *)sub_1A916B9D0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)string
{
  sub_1A909F130((uint64_t)self + OBJC_IVAR___AAJSON_value, (uint64_t)v6);
  if (v7)
  {
    id v3 = self;
    if (swift_dynamicCast())
    {

      uint64_t v4 = (void *)sub_1A916AF60();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
  }
  else
  {
    sub_1A909B5DC((uint64_t)v6);
  }
  uint64_t v4 = 0;
LABEL_7:

  return (NSString *)v4;
}

- (NSArray)array
{
  uint64_t v2 = self;
  uint64_t v3 = sub_1A90BC9D8();

  if (v3)
  {
    type metadata accessor for JSON();
    uint64_t v4 = (void *)sub_1A916B180();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSArray *)v4;
}

- (NSDictionary)object
{
  uint64_t v2 = self;
  uint64_t v3 = sub_1A90BCBF8();

  if (v3)
  {
    type metadata accessor for JSON();
    uint64_t v4 = (void *)sub_1A916AEB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSNumber)number
{
  uint64_t v2 = self;
  id v3 = sub_1A90BD044();

  return (NSNumber *)v3;
}

- (id)toDataWithOptions:(unint64_t)a3 :(id *)a4
{
  uint64_t v5 = self;
  uint64_t v6 = sub_1A90BD1A8(a3);
  unint64_t v8 = v7;

  v9 = (void *)sub_1A916AB60();
  sub_1A90A2FD4((uint64_t)v6, v8);

  return v9;
}

- (AAJSON)init
{
  result = (AAJSON *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (NSString)description
{
  uint64_t v2 = self;
  JSON.description.getter();

  id v3 = (void *)sub_1A916AF60();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end