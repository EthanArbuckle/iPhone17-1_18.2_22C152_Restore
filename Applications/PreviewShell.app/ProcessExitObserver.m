@interface ProcessExitObserver
- (_TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver)init;
- (void)processDidExit:(id)a3;
@end

@implementation ProcessExitObserver

- (void)processDidExit:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100007200();
}

- (_TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver)init
{
  result = (_TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_process));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler);

  sub_100007674(v3);
}

@end