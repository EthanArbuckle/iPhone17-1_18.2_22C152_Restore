@interface CBlurEffect
- (_TtC19ContactlessReaderUI11CBlurEffect)init;
- (_TtC19ContactlessReaderUI11CBlurEffect)initWithCoder:(id)a3;
- (id)effectSettings;
@end

@implementation CBlurEffect

- (_TtC19ContactlessReaderUI11CBlurEffect)initWithCoder:(id)a3
{
  result = (_TtC19ContactlessReaderUI11CBlurEffect *)sub_23EF05BE8();
  __break(1u);
  return result;
}

- (id)effectSettings
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC19ContactlessReaderUI11CBlurEffect_settings));
}

- (_TtC19ContactlessReaderUI11CBlurEffect)init
{
  result = (_TtC19ContactlessReaderUI11CBlurEffect *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI11CBlurEffect_settings));
}

@end