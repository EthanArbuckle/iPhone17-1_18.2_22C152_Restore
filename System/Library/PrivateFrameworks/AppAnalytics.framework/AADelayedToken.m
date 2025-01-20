@interface AADelayedToken
- (AADelayedToken)init;
- (void)commit;
@end

@implementation AADelayedToken

- (void)commit
{
  if ((*((unsigned char *)&self->super.isa + OBJC_IVAR___AADelayedToken_sealed) & 1) == 0)
  {
    *((unsigned char *)&self->super.isa + OBJC_IVAR___AADelayedToken_sealed) = 1;
    v2 = *(void (**)(void))((char *)&self->super.isa + OBJC_IVAR___AADelayedToken_block);
    v3 = self;
    v2();
  }
}

- (AADelayedToken)init
{
  result = (AADelayedToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end