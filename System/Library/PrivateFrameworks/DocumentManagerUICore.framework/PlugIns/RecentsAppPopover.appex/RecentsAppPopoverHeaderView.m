@interface RecentsAppPopoverHeaderView
- (_TtC17RecentsAppPopover27RecentsAppPopoverHeaderView)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover27RecentsAppPopoverHeaderView)initWithFrame:(CGRect)a3;
- (void)_layoutUtilityButtonWithScale:(double)a3;
@end

@implementation RecentsAppPopoverHeaderView

- (void)_layoutUtilityButtonWithScale:(double)a3
{
  v4 = self;
  sub_1003B057C(a3);
}

- (_TtC17RecentsAppPopover27RecentsAppPopoverHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = &self->PLPlatterHeaderContentView_opaque[OBJC_IVAR____TtC17RecentsAppPopover27RecentsAppPopoverHeaderView_utilityButtonTransform];
  *(void *)v9 = 0x3FF0000000000000;
  *((void *)v9 + 1) = 0;
  *((void *)v9 + 2) = 0;
  *((void *)v9 + 3) = 0x3FF0000000000000;
  *((void *)v9 + 4) = 0;
  *((void *)v9 + 5) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[RecentsAppPopoverHeaderView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC17RecentsAppPopover27RecentsAppPopoverHeaderView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = &self->PLPlatterHeaderContentView_opaque[OBJC_IVAR____TtC17RecentsAppPopover27RecentsAppPopoverHeaderView_utilityButtonTransform];
  *(void *)v6 = 0x3FF0000000000000;
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = 0;
  *((void *)v6 + 3) = 0x3FF0000000000000;
  *((void *)v6 + 4) = 0;
  *((void *)v6 + 5) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(RecentsAppPopoverHeaderView *)&v8 initWithCoder:a3];
}

@end