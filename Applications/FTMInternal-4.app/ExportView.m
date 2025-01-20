@interface ExportView
- (_TtC13FTMInternal_410ExportView)initWithCoder:(id)a3;
- (_TtC13FTMInternal_410ExportView)initWithFrame:(CGRect)a3;
- (void)didTapExportButton:(id)a3;
@end

@implementation ExportView

- (_TtC13FTMInternal_410ExportView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC13FTMInternal_410ExportView_label;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0, 0.0, 0.0, 0.0];
  *(void *)&self->label[OBJC_IVAR____TtC13FTMInternal_410ExportView_delegate] = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC13FTMInternal_410ExportView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)didTapExportButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10015DE24();
}

- (_TtC13FTMInternal_410ExportView)initWithFrame:(CGRect)a3
{
  result = (_TtC13FTMInternal_410ExportView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10015E120((uint64_t)self + OBJC_IVAR____TtC13FTMInternal_410ExportView_delegate);

  swift_bridgeObjectRelease();
}

@end