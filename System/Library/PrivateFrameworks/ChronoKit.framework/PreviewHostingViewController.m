@interface PreviewHostingViewController
- (BOOL)metricsDefineSize;
- (CHSInlineTextParameters)inlineTextParameters;
- (_TtC9ChronoKit28PreviewHostingViewController)initWithCoder:(id)a3;
- (void)setInlineTextParameters:(id)a3;
- (void)setMetricsDefineSize:(BOOL)a3;
@end

@implementation PreviewHostingViewController

- (CHSInlineTextParameters)inlineTextParameters
{
  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_inlineTextParameters);
  swift_beginAccess();
  return (CHSInlineTextParameters *)*v2;
}

- (void)setInlineTextParameters:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_inlineTextParameters);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC9ChronoKit28PreviewHostingViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_requiresStrictViewFraming) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_inlineTextParameters) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_vibrancyColor) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_metricsDefineSize) = 1;
  id v4 = a3;

  result = (_TtC9ChronoKit28PreviewHostingViewController *)sub_1DA98CBB8();
  __break(1u);
  return result;
}

- (BOOL)metricsDefineSize
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_metricsDefineSize;
  swift_beginAccess();
  return *v2;
}

- (void)setMetricsDefineSize:(BOOL)a3
{
  v5 = (BOOL *)self + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_metricsDefineSize;
  swift_beginAccess();
  BOOL *v5 = a3;
  id v6 = self;
  sub_1DA7FC658();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_inlineTextParameters));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController__vibrancyView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9ChronoKit28PreviewHostingViewController_vibrancyColor);
}

@end