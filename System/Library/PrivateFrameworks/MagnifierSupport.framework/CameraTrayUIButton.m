@interface CameraTrayUIButton
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (_TtC16MagnifierSupport18CameraTrayUIButton)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport18CameraTrayUIButton)initWithFrame:(CGRect)a3;
@end

@implementation CameraTrayUIButton

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for CameraTrayUIButton();
  id v4 = a3;
  v5 = (char *)v13.receiver;
  [(CameraTrayUIButton *)&v13 menuAttachmentPointForConfiguration:v4];
  double v7 = v6;
  double v8 = *(double *)&v5[OBJC_IVAR____TtC16MagnifierSupport18CameraTrayUIButton_offset + 8];
  double v10 = v9 + *(double *)&v5[OBJC_IVAR____TtC16MagnifierSupport18CameraTrayUIButton_offset];

  double v11 = v7 + v8;
  double v12 = v10;
  result.y = v11;
  result.x = v12;
  return result;
}

- (_TtC16MagnifierSupport18CameraTrayUIButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(_OWORD *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC16MagnifierSupport18CameraTrayUIButton_offset) = xmmword_23595DBF0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CameraTrayUIButton();
  return -[CameraTrayUIButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC16MagnifierSupport18CameraTrayUIButton)initWithCoder:(id)a3
{
  *(_OWORD *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC16MagnifierSupport18CameraTrayUIButton_offset) = xmmword_23595DBF0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CameraTrayUIButton();
  return [(CameraTrayUIButton *)&v5 initWithCoder:a3];
}

@end