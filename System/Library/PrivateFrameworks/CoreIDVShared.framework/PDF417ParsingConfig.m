@interface PDF417ParsingConfig
+ (BOOL)supportsSecureCoding;
- (_TtC13CoreIDVShared19PDF417ParsingConfig)init;
- (_TtC13CoreIDVShared19PDF417ParsingConfig)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDF417ParsingConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared19PDF417ParsingConfig)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1D78C4038(0, (unint64_t *)&qword_1EBDF8260);
  id v6 = a3;
  v7 = self;
  result = (_TtC13CoreIDVShared19PDF417ParsingConfig *)sub_1D7A9C908();
  if (result)
  {
    v9 = result;
    uint64_t v10 = sub_1D7A9BFC8();
    uint64_t v12 = v11;

    v13 = (uint64_t *)((char *)v7 + OBJC_IVAR____TtC13CoreIDVShared19PDF417ParsingConfig_aamvaHeader);
    uint64_t *v13 = v10;
    v13[1] = v12;

    v15.receiver = v7;
    v15.super_class = ObjectType;
    v14 = [(PDF417ParsingConfig *)&v15 init];

    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (void *)sub_1D7A9BF98();
  id v7 = (id)sub_1D7A9BF98();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);
}

- (_TtC13CoreIDVShared19PDF417ParsingConfig)init
{
  result = (_TtC13CoreIDVShared19PDF417ParsingConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end