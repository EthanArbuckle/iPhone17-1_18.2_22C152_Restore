@interface BootstrapSession
- (_TtC19appstorecomponentsd16BootstrapSession)init;
@end

@implementation BootstrapSession

- (_TtC19appstorecomponentsd16BootstrapSession)init
{
  return (_TtC19appstorecomponentsd16BootstrapSession *)sub_1000B2478();
}

- (void).cxx_destruct
{
  swift_release();

  unint64_t v3 = *(unint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_bootstrapState);

  sub_1000B39D0(v3);
}

@end