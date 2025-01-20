@interface PreviewPaletteView
- (_TtC18HealthExperienceUI18PreviewPaletteView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI18PreviewPaletteView)initWithFrame:(CGRect)a3;
@end

@implementation PreviewPaletteView

- (_TtC18HealthExperienceUI18PreviewPaletteView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC18HealthExperienceUI18PreviewPaletteView_previewButton;
  v9 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)sub_1AD4587B0();

  v15.receiver = v9;
  v15.super_class = (Class)type metadata accessor for PreviewPaletteView();
  v10 = -[PreviewPaletteView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v11 = *(Class *)((char *)&v10->super.super.super.isa
                 + OBJC_IVAR____TtC18HealthExperienceUI18PreviewPaletteView_previewButton);
  v12 = v10;
  [(PreviewPaletteView *)v12 addSubview:v11];
  id v13 = v11;
  objc_msgSend(v13, sel_hk_alignConstraintsWithView_, v12);

  return v12;
}

- (_TtC18HealthExperienceUI18PreviewPaletteView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC18HealthExperienceUI18PreviewPaletteView_previewButton;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_1AD4587B0();

  result = (_TtC18HealthExperienceUI18PreviewPaletteView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI18PreviewPaletteView_previewButton));
}

@end