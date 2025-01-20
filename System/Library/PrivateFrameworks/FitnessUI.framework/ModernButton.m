@interface ModernButton
- (_TtC9FitnessUI12ModernButton)initWithCoder:(id)a3;
- (_TtC9FitnessUI12ModernButton)initWithFrame:(CGRect)a3;
- (void)touchCancel:(id)a3;
- (void)touchDown:(id)a3;
- (void)touchDownRepeat:(id)a3;
- (void)touchDragEnter:(id)a3;
- (void)touchDragExit:(id)a3;
- (void)touchDragInside:(id)a3;
- (void)touchDragOutside:(id)a3;
- (void)touchUpInside:(id)a3;
- (void)touchUpOutside:(id)a3;
@end

@implementation ModernButton

- (void)touchDown:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E4B83D8();
}

- (void)touchDownRepeat:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E4B849C();
}

- (void)touchDragInside:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E4B8560();
}

- (void)touchDragOutside:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E4B8624();
}

- (void)touchDragEnter:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E4B86E8();
}

- (void)touchDragExit:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E4B87AC();
}

- (void)touchUpInside:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E4B8870();
}

- (void)touchUpOutside:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E4B8934();
}

- (void)touchCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E4B89F8();
}

- (_TtC9FitnessUI12ModernButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9FitnessUI12ModernButton_handlersForControlEvents) = (Class)MEMORY[0x263F8EE80];
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ModernButton();
  return -[ModernButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9FitnessUI12ModernButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9FitnessUI12ModernButton_handlersForControlEvents) = (Class)MEMORY[0x263F8EE80];
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ModernButton();
  return [(ModernButton *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end