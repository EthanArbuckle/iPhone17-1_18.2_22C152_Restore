@interface TransitioningPresentedContainerView
- (_TtC18ASMessagesProvider35TransitioningPresentedContainerView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider35TransitioningPresentedContainerView)initWithFrame:(CGRect)a3;
- (void)didAddSubview:(id)a3;
@end

@implementation TransitioningPresentedContainerView

- (void)didAddSubview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  v5 = v6.receiver;
  [(TransitioningPresentedContainerView *)&v6 didAddSubview:v4];
  if (v5[OBJC_IVAR____TtC18ASMessagesProvider35TransitioningPresentedContainerView_hidesInsertedSubviews] == 1) {
    objc_msgSend(v4, "setHidden:", 1, v6.receiver, v6.super_class);
  }
}

- (_TtC18ASMessagesProvider35TransitioningPresentedContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC18ASMessagesProvider35TransitioningPresentedContainerView_hidesInsertedSubviews) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[TransitioningPresentedContainerView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC18ASMessagesProvider35TransitioningPresentedContainerView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC18ASMessagesProvider35TransitioningPresentedContainerView_hidesInsertedSubviews) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(TransitioningPresentedContainerView *)&v7 initWithCoder:a3];
}

@end