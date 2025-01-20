@interface TiledViewRenderer
- (_TtC9PencilKit17TiledViewRenderer)init;
@end

@implementation TiledViewRenderer

- (_TtC9PencilKit17TiledViewRenderer)init
{
  uint64_t v3 = OBJC_IVAR____TtC9PencilKit17TiledViewRenderer_startTime;
  v4 = self;
  v5 = self;
  objc_msgSend(v4, sel_timeIntervalSinceReferenceDate);
  *(Class *)((char *)&self->super.isa + v3) = v6;
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC9PencilKit17TiledViewRenderer_duration) = (Class)0x3FF0000000000000;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for TiledViewRenderer();
  return [(TiledViewRenderer *)&v8 init];
}

@end