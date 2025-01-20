@interface SyncedLyricsLineView
- (BOOL)isHighlighted;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11MusicCoreUI20SyncedLyricsLineView)initWithCoder:(id)a3;
- (_TtC11MusicCoreUI20SyncedLyricsLineView)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animator:(id)a4;
@end

@implementation SyncedLyricsLineView

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SyncedLyricsLineView();
  return [(SyncedLyricsLineView *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for SyncedLyricsLineView();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  char v7 = [(SyncedLyricsLineView *)&v9 isHighlighted];
  v8.receiver = v6;
  v8.super_class = v5;
  [(SyncedLyricsLineView *)&v8 setHighlighted:v3];
  SyncedLyricsLineView.isHighlighted.didset(v7);
}

- (_TtC11MusicCoreUI20SyncedLyricsLineView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized SyncedLyricsLineView.init(coder:)();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = SyncedLyricsLineView.sizeThatFits(_:)(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)setSelected:(BOOL)a3 animator:(id)a4
{
  id v7 = a4;
  double v8 = self;
  v11.is_nil = (char)v8;
  double v9 = v8;
  v11.value.super.isa = (Class)a4;
  SyncedLyricsLineView.setSelected(_:animator:)(a3, v11);
}

- (_TtC11MusicCoreUI20SyncedLyricsLineView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC11MusicCoreUI20SyncedLyricsLineView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  memcpy(v3, (char *)self + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView_specs, 0x219uLL);
  outlined release of SyncedLyricsViewController.Specs((uint64_t)v3);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView_line);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView____lazy_storage___backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView_blurFilter));
}

@end