@interface SessionMetadataView
- (_TtC13MediaControls19SessionMetadataView)initWithCoder:(id)a3;
- (_TtC13MediaControls19SessionMetadataView)initWithFrame:(CGRect)a3;
- (void)updateFonts;
@end

@implementation SessionMetadataView

- (_TtC13MediaControls19SessionMetadataView)initWithFrame:(CGRect)a3
{
  return (_TtC13MediaControls19SessionMetadataView *)sub_1AE8F7AB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13MediaControls19SessionMetadataView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AE8F9068();
}

- (void)updateFonts
{
  v2 = self;
  sub_1AE8F8D60();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_symbolImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_subtitleSymbolImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_symbolConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_secondarySymbolConfiguration));
  sub_1AE8F431C(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_viewModel), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC13MediaControls19SessionMetadataView_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_artworkImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_visualStylingProvider));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_customLayoutGuides);
  v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_customLayoutGuides);
  v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_customLayoutGuides);
  objc_release(*(id *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_customLayoutGuides));

  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end