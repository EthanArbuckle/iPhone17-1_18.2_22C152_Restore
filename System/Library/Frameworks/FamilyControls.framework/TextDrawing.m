@interface TextDrawing
- (CGSize)drawingSize;
- (_TtC19FamilyControlsAgent11TextDrawing)init;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
- (void)setDrawingSize:(CGSize)a3;
@end

@implementation TextDrawing

- (CGSize)drawingSize
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC19FamilyControlsAgent11TextDrawing_drawingSize);
  double v3 = *(double *)&self->tag[OBJC_IVAR____TtC19FamilyControlsAgent11TextDrawing_drawingSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setDrawingSize:(CGSize)a3
{
  *(CGSize *)((char *)&self->super.isa + OBJC_IVAR____TtC19FamilyControlsAgent11TextDrawing_drawingSize) = a3;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
}

- (_TtC19FamilyControlsAgent11TextDrawing)init
{
  CGSize result = (_TtC19FamilyControlsAgent11TextDrawing *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19FamilyControlsAgent11TextDrawing_title);
}

@end