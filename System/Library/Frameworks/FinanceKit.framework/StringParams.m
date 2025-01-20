@interface StringParams
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_TtC10FinanceKit12StringParams)init;
- (_TtC10FinanceKit12StringParams)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation StringParams

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_243959140();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = StringParams.isEqual(_:)((uint64_t)v8);

  sub_24337C1BC((uint64_t)v8, &qword_26B0C5CA0);
  return v6 & 1;
}

- (int64_t)hash
{
  sub_243959B50();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit12StringParams_value);
  v4 = self;
  swift_bridgeObjectRetain();
  sub_2433B54FC((uint64_t)v7, v3);
  swift_bridgeObjectRelease();
  long long v11 = v7[2];
  long long v12 = v7[3];
  uint64_t v13 = v8;
  long long v9 = v7[0];
  long long v10 = v7[1];
  int64_t v5 = sub_243959B30();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC10FinanceKit12StringParams)initWithCoder:(id)a3
{
  return (_TtC10FinanceKit12StringParams *)StringParams.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit12StringParams_value);
  id v5 = a3;
  char v6 = self;
  sub_2433B423C(v4);
  sub_2433B56C4();
  sub_2433B5920((unint64_t *)&qword_268D97948, (void (*)(uint64_t))sub_2433B56C4);
  v7 = (void *)sub_243958180();
  swift_bridgeObjectRelease();
  id v8 = (id)sub_2439582A0();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);
}

- (_TtC10FinanceKit12StringParams)init
{
  result = (_TtC10FinanceKit12StringParams *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end