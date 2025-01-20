@interface MusicInstrumentalContentView
- (MusicInstrumentalContentView)initWithCoder:(id)a3;
- (MusicInstrumentalContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MusicInstrumentalContentView

- (MusicInstrumentalContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized SyncedLyricsLineView.InstrumentalContentView.init(coder:)();
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for SyncedLyricsLineView.InstrumentalContentView();
  v2 = (char *)v16.receiver;
  [(MusicInstrumentalContentView *)&v16 layoutSubviews];
  id v3 = &v2[OBJC_IVAR___MusicInstrumentalContentView_lastSeenBounds];
  CGFloat v4 = *(double *)&v2[OBJC_IVAR___MusicInstrumentalContentView_lastSeenBounds];
  CGFloat v5 = *(double *)&v2[OBJC_IVAR___MusicInstrumentalContentView_lastSeenBounds + 8];
  CGFloat v6 = *(double *)&v2[OBJC_IVAR___MusicInstrumentalContentView_lastSeenBounds + 16];
  CGFloat v7 = *(double *)&v2[OBJC_IVAR___MusicInstrumentalContentView_lastSeenBounds + 24];
  objc_msgSend(v2, "bounds", v16.receiver, v16.super_class);
  v18.origin.x = v8;
  v18.origin.y = v9;
  v18.size.width = v10;
  v18.size.height = v11;
  v17.origin.x = v4;
  v17.origin.y = v5;
  v17.size.width = v6;
  v17.size.height = v7;
  if (!CGRectEqualToRect(v17, v18))
  {
    [v2 bounds];
    *(void *)id v3 = v12;
    *((void *)v3 + 1) = v13;
    *((void *)v3 + 2) = v14;
    *((void *)v3 + 3) = v15;
    SyncedLyricsLineView.InstrumentalContentView.layoutDots()();
  }
}

- (MusicInstrumentalContentView)initWithFrame:(CGRect)a3
{
  result = (MusicInstrumentalContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  memcpy(v2, (char *)self + OBJC_IVAR___MusicInstrumentalContentView_specs, 0x219uLL);
  outlined release of SyncedLyricsViewController.Specs((uint64_t)v2);
  swift_bridgeObjectRelease();
}

@end