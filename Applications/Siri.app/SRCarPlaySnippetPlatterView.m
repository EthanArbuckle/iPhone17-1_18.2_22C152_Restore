@interface SRCarPlaySnippetPlatterView
- (_TtC4Siri27SRCarPlaySnippetPlatterView)initWithCoder:(id)a3;
- (_TtC4Siri27SRCarPlaySnippetPlatterView)initWithFrame:(CGRect)a3;
@end

@implementation SRCarPlaySnippetPlatterView

- (_TtC4Siri27SRCarPlaySnippetPlatterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000A87BC();
}

- (_TtC4Siri27SRCarPlaySnippetPlatterView)initWithFrame:(CGRect)a3
{
  return (_TtC4Siri27SRCarPlaySnippetPlatterView *)sub_1000A7194(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_coloredPlatterView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_materialView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_intelligenceContentLightEffect));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_intelligenceInsideLightEffect));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_intelligenceOutsideLightEffect));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_intelligenceRimHighlightEffect));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_intelligenceContentEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_intelligenceShimmerEffectView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_intelligenceDarkeningView);
}

@end