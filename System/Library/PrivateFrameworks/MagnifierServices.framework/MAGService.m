@interface MAGService
- (_TtC17MagnifierServices10MAGService)init;
- (void)dealloc;
@end

@implementation MAGService

- (void)dealloc
{
  v2 = self;
  MAGService.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17MagnifierServices10MAGService__connection);
}

- (_TtC17MagnifierServices10MAGService)init
{
  return (_TtC17MagnifierServices10MAGService *)MAGService.init()();
}

@end