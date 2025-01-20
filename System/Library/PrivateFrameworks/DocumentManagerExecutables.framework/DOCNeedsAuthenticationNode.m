@interface DOCNeedsAuthenticationNode
- (NSError)enumeratorError;
- (_TtC26DocumentManagerExecutables26DOCNeedsAuthenticationNode)init;
- (_TtC26DocumentManagerExecutables26DOCNeedsAuthenticationNode)initWithCoder:(id)a3;
- (id)iteratorWithOptions:(unsigned int)a3;
@end

@implementation DOCNeedsAuthenticationNode

- (_TtC26DocumentManagerExecutables26DOCNeedsAuthenticationNode)initWithCoder:(id)a3
{
  return 0;
}

- (NSError)enumeratorError
{
  sub_22BE92CD8();
  id v3 = objc_allocWithZone(MEMORY[0x263F087E8]);
  v4 = self;
  v5 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v3, sel_initWithDomain_code_userInfo_, v5, -1000, 0);

  v7 = (void *)sub_22BE92078();

  return (NSError *)v7;
}

- (id)iteratorWithOptions:(unsigned int)a3
{
  id v4 = objc_allocWithZone(MEMORY[0x263F39798]);
  sub_22BDD9D50(0, (unint64_t *)&unk_26AF00470);
  v5 = self;
  id v6 = (void *)sub_22BE92EA8();
  id v7 = objc_msgSend(v4, sel_initWithChildren_fullyPopulated_options_, v6, 1, 0);

  return v7;
}

- (_TtC26DocumentManagerExecutables26DOCNeedsAuthenticationNode)init
{
  result = (_TtC26DocumentManagerExecutables26DOCNeedsAuthenticationNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables26DOCNeedsAuthenticationNode_domain));
}

@end