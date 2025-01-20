@interface GPVFXView
- (CGRect)frame;
- (_TtC15ImagePlayground9GPVFXView)init;
- (_TtC15ImagePlayground9GPVFXView)initWithCoder:(id)a3;
- (_TtC15ImagePlayground9GPVFXView)initWithFrame:(CGRect)a3;
- (_TtC15ImagePlayground9GPVFXView)initWithFrame:(CGRect)a3 options:(id)a4;
- (void)setFrame:(CGRect)a3;
@end

@implementation GPVFXView

- (_TtC15ImagePlayground9GPVFXView)init
{
  v2 = -[GPVFXView initWithFrame:options:](self, sel_initWithFrame_options_, 0, 0.0, 0.0, 0.0, 0.0);
  [(VFXView *)v2 vfx_setClearBackground];
  [(GPVFXView *)v2 setPixelFormat:115];
  [(VFXView *)v2 vfx_setExtendedLinearSRGBColorSpace];
  [(GPVFXView *)v2 setAntialiasingMode:0];
  [(GPVFXView *)v2 setLowLatency:1];

  return v2;
}

- (_TtC15ImagePlayground9GPVFXView)initWithCoder:(id)a3
{
  return (_TtC15ImagePlayground9GPVFXView *)sub_243EB0440(a3);
}

- (_TtC15ImagePlayground9GPVFXView)initWithFrame:(CGRect)a3 options:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4) {
    uint64_t v8 = sub_2443BA310();
  }
  else {
    uint64_t v8 = 0;
  }
  return (_TtC15ImagePlayground9GPVFXView *)sub_243EB057C(v8, x, y, width, height);
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  [(GPVFXView *)&v6 frame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double v21 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v23.receiver = self;
  v23.super_class = ObjectType;
  v9 = self;
  [(GPVFXView *)&v23 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v24.origin.double x = x;
  v24.origin.double y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double v18 = height;
  double v19 = CGRectGetHeight(v24);
  v25.origin.double x = v11;
  v25.origin.double y = v13;
  v25.size.CGFloat width = v15;
  v25.size.CGFloat height = v17;
  if (CGRectGetHeight(v25) < v19) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = 2;
  }
  [(GPVFXView *)v9 setContentMode:v20];
  v22.receiver = v9;
  v22.super_class = ObjectType;
  -[GPVFXView setFrame:](&v22, sel_setFrame_, x, y, v21, v18);
}

- (_TtC15ImagePlayground9GPVFXView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC15ImagePlayground9GPVFXView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end