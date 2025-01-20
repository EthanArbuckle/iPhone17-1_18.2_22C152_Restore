@interface RecordButton
- (BOOL)isEnabled;
- (_TtC16MagnifierSupport12RecordButton)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport12RecordButton)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
- (void)drawRect:(CGRect)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation RecordButton

- (_TtC16MagnifierSupport12RecordButton)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport12RecordButton *)sub_2358E3434(a3);
}

- (_TtC16MagnifierSupport12RecordButton)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport12RecordButton *)sub_2358E3568(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)awakeFromNib
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RecordButton();
  id v2 = v4.receiver;
  [(RecordButton *)&v4 awakeFromNib];
  v3 = (void *)sub_235949A88();
  objc_msgSend(v2, sel_setTitle_forState_, v3, 0, v4.receiver, v4.super_class);
}

- (void)drawRect:(CGRect)a3
{
  v3 = self;
  sub_2358E3D0C();
}

- (BOOL)isEnabled
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RecordButton();
  return [(RecordButton *)&v3 isEnabled];
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4 = self;
  sub_2358E3804(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12RecordButton__centerShapeFillColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12RecordButton____lazy_storage___squareBezierPath));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport12RecordButton____lazy_storage___circleBezierPath);
}

@end