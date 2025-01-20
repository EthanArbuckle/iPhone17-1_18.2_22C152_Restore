@interface XPCWrapper
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC14IdentityLookup10XPCWrapper)init;
- (_TtC14IdentityLookup10XPCWrapper)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCWrapper

+ (BOOL)supportsSecureCoding
{
  return byte_267D1C760;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_267D1C760 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14IdentityLookup10XPCWrapper_data);
  unint64_t v5 = *(void *)&self->data[OBJC_IVAR____TtC14IdentityLookup10XPCWrapper_data];
  id v6 = a3;
  v7 = self;
  sub_21DAE13EC(v4, v5);
  v8 = (void *)sub_21DAE7410();
  sub_21DAE15EC(v4, v5);
  id v9 = (id)sub_21DAE7580();
  objc_msgSend(v6, sel_encodeObject_forKey_, v8, v9);
}

- (_TtC14IdentityLookup10XPCWrapper)initWithCoder:(id)a3
{
  return (_TtC14IdentityLookup10XPCWrapper *)sub_21DAE3BFC(a3);
}

- (_TtC14IdentityLookup10XPCWrapper)init
{
  result = (_TtC14IdentityLookup10XPCWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end