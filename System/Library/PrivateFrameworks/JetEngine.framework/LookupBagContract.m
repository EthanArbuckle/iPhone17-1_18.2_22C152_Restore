@interface LookupBagContract
- (id)unpersonalizedLookupURL;
@end

@implementation LookupBagContract

- (id)unpersonalizedLookupURL
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9JetEngine17LookupBagContract_backing);
  v3 = self;
  v4 = (void *)sub_19F1DBD4C();
  id v5 = objc_msgSend(v2, sel_URLForKey_, v4);

  return v5;
}

- (void).cxx_destruct
{
}

@end