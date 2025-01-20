@interface CustomLayoutView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC5JetUI16CustomLayoutView)initWithCoder:(id)a3;
- (_TtC5JetUI16CustomLayoutView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CustomLayoutView

- (_TtC5JetUI16CustomLayoutView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CustomLayoutView();
  return -[CustomLayoutView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  v2 = self;
  CustomLayoutView.layoutSubviews()();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = [(CustomLayoutView *)v2 traitCollection];
  (*(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v2->super.super.super.super.isa) + 0x50))(v11);
  uint64_t v4 = v12;
  uint64_t v5 = v13;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  double v6 = (*(double (**)(id, uint64_t, uint64_t, double, double))(v5 + 8))(v3, v4, v5, 0.0, 0.0);
  double v8 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = self;
  id v6 = [(CustomLayoutView *)v5 traitCollection];
  (*(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v5->super.super.super.super.isa) + 0x50))(v14);
  uint64_t v7 = v15;
  uint64_t v8 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  double v9 = (*(double (**)(id, uint64_t, uint64_t, double, double))(v8 + 8))(v6, v7, v8, width, height);
  double v11 = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (_TtC5JetUI16CustomLayoutView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CustomLayoutView();
  return [(CustomLayoutView *)&v5 initWithCoder:a3];
}

@end