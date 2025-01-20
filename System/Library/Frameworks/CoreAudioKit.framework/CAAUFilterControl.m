@interface CAAUFilterControl
- (_TtC12CoreAudioKit17CAAUFilterControl)init;
- (void)layoutSublayersOfLayer:(id)a3;
@end

@implementation CAAUFilterControl

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E599374(v4);
}

- (_TtC12CoreAudioKit17CAAUFilterControl)init
{
  result = (_TtC12CoreAudioKit17CAAUFilterControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit17CAAUFilterControl_delegate);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit17CAAUFilterControl_dataSource);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12CoreAudioKit17CAAUFilterControl_color);
}

@end