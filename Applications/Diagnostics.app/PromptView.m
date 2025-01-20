@interface PromptView
- (UIActivityIndicatorView)infoActivityIndicatorView;
- (UILabel)infoLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIProgressView)infoProgressIndicatorView;
- (UIStackView)buttonStackView;
- (UIStackView)infoLabelHorizontalStackView;
- (UIStackView)infoVerticalStackView;
- (_TtC11Diagnostics10PromptView)initWithCoder:(id)a3;
- (_TtC11Diagnostics10PromptView)initWithFrame:(CGRect)a3;
- (void)setInfoLabel:(id)a3;
- (void)setInfoLabelHorizontalStackView:(id)a3;
- (void)setInfoVerticalStackView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation PromptView

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11Diagnostics10PromptView_titleLabel));
}

- (void)setTitleLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11Diagnostics10PromptView_titleLabel);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11Diagnostics10PromptView_titleLabel) = (Class)a3;
  id v3 = a3;
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11Diagnostics10PromptView_subtitleLabel));
}

- (void)setSubtitleLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11Diagnostics10PromptView_subtitleLabel);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11Diagnostics10PromptView_subtitleLabel) = (Class)a3;
  id v3 = a3;
}

- (UIStackView)infoVerticalStackView
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC11Diagnostics10PromptView_infoVerticalStackView));
}

- (void)setInfoVerticalStackView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics10PromptView_infoVerticalStackView);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11Diagnostics10PromptView_infoVerticalStackView) = (Class)a3;
  id v3 = a3;
}

- (UIProgressView)infoProgressIndicatorView
{
  return (UIProgressView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                   + OBJC_IVAR____TtC11Diagnostics10PromptView_infoProgressIndicatorView));
}

- (UIActivityIndicatorView)infoActivityIndicatorView
{
  return (UIActivityIndicatorView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                            + OBJC_IVAR____TtC11Diagnostics10PromptView_infoActivityIndicatorView));
}

- (UIStackView)infoLabelHorizontalStackView
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC11Diagnostics10PromptView_infoLabelHorizontalStackView));
}

- (void)setInfoLabelHorizontalStackView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics10PromptView_infoLabelHorizontalStackView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11Diagnostics10PromptView_infoLabelHorizontalStackView) = (Class)a3;
  id v3 = a3;
}

- (UILabel)infoLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11Diagnostics10PromptView_infoLabel));
}

- (void)setInfoLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11Diagnostics10PromptView_infoLabel);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11Diagnostics10PromptView_infoLabel) = (Class)a3;
  id v3 = a3;
}

- (UIStackView)buttonStackView
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC11Diagnostics10PromptView_buttonStackView));
}

- (_TtC11Diagnostics10PromptView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100084B00();
}

- (_TtC11Diagnostics10PromptView)initWithFrame:(CGRect)a3
{
  result = (_TtC11Diagnostics10PromptView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics10PromptView_promptStackView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics10PromptView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics10PromptView_infoVerticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics10PromptView_infoProgressIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics10PromptView_infoActivityIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics10PromptView_infoLabelHorizontalStackView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics10PromptView_buttonStackView));
  sub_10003B0B8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC11Diagnostics10PromptView_containerLayoutUpdateHandler));

  swift_bridgeObjectRelease();
}

@end