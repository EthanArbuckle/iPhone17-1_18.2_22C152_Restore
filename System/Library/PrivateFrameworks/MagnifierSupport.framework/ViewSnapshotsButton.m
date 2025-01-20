@interface ViewSnapshotsButton
- (NSString)largeContentTitle;
- (UIImage)largeContentImage;
- (_TtC16MagnifierSupport19ViewSnapshotsButton)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport19ViewSnapshotsButton)initWithFrame:(CGRect)a3;
- (void)dragExited:(id)a3;
- (void)dragReturned:(id)a3;
- (void)layoutSubviews;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation ViewSnapshotsButton

- (_TtC16MagnifierSupport19ViewSnapshotsButton)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport19ViewSnapshotsButton *)sub_2358277C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MagnifierSupport19ViewSnapshotsButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_235828E64();
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  [(ViewSnapshotsButton *)&v6 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_containerView];
  id v4 = objc_msgSend(v3, sel_layer, v6.receiver, v6.super_class);
  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v4, sel_setCornerRadius_, v5 * 0.5);
}

- (NSString)largeContentTitle
{
  v2 = self;
  sub_235827484();

  id v3 = (void *)sub_235949A88();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (UIImage)largeContentImage
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_icon), sel_image);
  return (UIImage *)v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_icon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_enabledColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_disabledColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_dimmedColor));
  swift_release();
  swift_release();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_2356594B0(0, &qword_2688118F0);
  sub_23577F76C();
  sub_235949FE8();
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_235949FD8();
  v10.receiver = v8;
  v10.super_class = ObjectType;
  [(ViewSnapshotsButton *)&v10 touchesBegan:v9 withEvent:v7];

  *((unsigned char *)&v8->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_isDimmed) = 1;
  sub_235827354();

  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)dragExited:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_23594A6A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    double v5 = self;
  }
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_isDimmed) = 0;
  sub_235827354();

  sub_2356BDF2C((uint64_t)v6);
}

- (void)dragReturned:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_23594A6A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    double v5 = self;
  }
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport19ViewSnapshotsButton_isDimmed) = 1;
  sub_235827354();

  sub_2356BDF2C((uint64_t)v6);
}

@end