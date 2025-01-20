@interface SyncedLyricsLineView.Line.LineView
- (_TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView)initWithCoder:(id)a3;
- (_TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SyncedLyricsLineView.Line.LineView

- (_TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView_backgroundColorLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView_gradientView) = 0;
  id v4 = a3;

  result = (_TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  v2 = self;
  SyncedLyricsLineView.Line.LineView.tintColorDidChange()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  SyncedLyricsLineView.Line.LineView.traitCollectionDidChange(_:)(v9);
}

- (_TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView)initWithFrame:(CGRect)a3
{
  result = (_TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView_backgroundColorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView_gradientView));
  memcpy(v3, (char *)self + OBJC_IVAR____TtCCC11MusicCoreUI20SyncedLyricsLineView4Line8LineView_specs, 0x219uLL);
  outlined release of SyncedLyricsViewController.Specs((uint64_t)v3);
}

@end