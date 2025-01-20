@interface WallpaperMetalView
+ (Class)layerClass;
- (_TtC22MercuryPosterExtension18WallpaperMetalView)initWithCoder:(id)a3;
- (_TtC22MercuryPosterExtension18WallpaperMetalView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)displayLayer:(id)a3;
- (void)displayLinkFired;
@end

@implementation WallpaperMetalView

- (_TtC22MercuryPosterExtension18WallpaperMetalView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100037B6C();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22MercuryPosterExtension18WallpaperMetalView_displayLink);
  if (v2)
  {
    id v3 = self;
    [v2 invalidate];
    v4.receiver = v3;
    v4.super_class = (Class)type metadata accessor for WallpaperMetalView(0);
    [(WallpaperMetalView *)&v4 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  sub_100012030(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC22MercuryPosterExtension18WallpaperMetalView_drawingHandler));
  sub_100014D24((uint64_t)self + OBJC_IVAR____TtC22MercuryPosterExtension18WallpaperMetalView_log, (uint64_t *)&unk_100099B20);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22MercuryPosterExtension18WallpaperMetalView_displayLink));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22MercuryPosterExtension18WallpaperMetalView_continuousRenderingTimer));
  sub_100014D24((uint64_t)self + OBJC_IVAR____TtC22MercuryPosterExtension18WallpaperMetalView_timedRenderingInfo, (uint64_t *)&unk_1000992A0);
}

+ (Class)layerClass
{
  sub_100038030();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)displayLayer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100037CA8();
}

- (void)displayLinkFired
{
}

- (_TtC22MercuryPosterExtension18WallpaperMetalView)initWithFrame:(CGRect)a3
{
  result = (_TtC22MercuryPosterExtension18WallpaperMetalView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end