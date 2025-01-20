@interface ContactsButtonDrawing
- (CGSize)drawingSize;
- (_TtC24ContactsButtonXPCService21ContactsButtonDrawing)init;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
@end

@implementation ContactsButtonDrawing

- (CGSize)drawingSize
{
  v2 = (double *)(*(char **)((char *)&self->super.isa
                           + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonDrawing_tag)
                + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_frame);
  CGFloat v3 = *v2;
  CGFloat v4 = v2[1];
  CGFloat v5 = v2[2];
  CGFloat v6 = v2[3];
  v7 = self;
  v16.origin.x = v3;
  v16.origin.y = v4;
  v16.size.width = v5;
  v16.size.height = v6;
  CGFloat Width = CGRectGetWidth(v16);
  CGFloat Height = CGRectGetHeight(*(CGRect *)v2);

  v10.n128_f64[0] = Width;
  v11.n128_f64[0] = Height;

  nullsub_2(v10, v11);
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v7 = a3;
  v8 = self;
  sub_1000109F4(v7, x, y);
}

- (_TtC24ContactsButtonXPCService21ContactsButtonDrawing)init
{
  CGSize result = (_TtC24ContactsButtonXPCService21ContactsButtonDrawing *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  CGFloat v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonDrawing_glyph);
}

@end