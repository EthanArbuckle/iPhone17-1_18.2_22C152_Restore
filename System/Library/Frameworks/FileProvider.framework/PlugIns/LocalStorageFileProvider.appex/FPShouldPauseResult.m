@interface FPShouldPauseResult
- (BOOL)shouldPause;
- (OS_dispatch_semaphore)semaphore;
- (_TtC9libfssync19FPShouldPauseResult)init;
- (_TtC9libfssync19FPShouldPauseResult)initWithShouldPause:(BOOL)a3 semaphore:(id)a4;
@end

@implementation FPShouldPauseResult

- (BOOL)shouldPause
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9libfssync19FPShouldPauseResult_shouldPause);
}

- (OS_dispatch_semaphore)semaphore
{
  return (OS_dispatch_semaphore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC9libfssync19FPShouldPauseResult_semaphore));
}

- (_TtC9libfssync19FPShouldPauseResult)initWithShouldPause:(BOOL)a3 semaphore:(id)a4
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9libfssync19FPShouldPauseResult_shouldPause) = a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync19FPShouldPauseResult_semaphore) = (Class)a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FPShouldPauseResult();
  id v5 = a4;
  return [(FPShouldPauseResult *)&v7 init];
}

- (_TtC9libfssync19FPShouldPauseResult)init
{
  result = (_TtC9libfssync19FPShouldPauseResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end