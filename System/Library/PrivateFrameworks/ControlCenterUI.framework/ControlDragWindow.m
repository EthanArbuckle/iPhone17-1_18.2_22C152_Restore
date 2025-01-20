@interface ControlDragWindow
- (_TtC15ControlCenterUI17ControlDragWindow)initWithCoder:(id)a3;
- (_TtC15ControlCenterUI17ControlDragWindow)initWithContentRect:(CGRect)a3;
- (_TtC15ControlCenterUI17ControlDragWindow)initWithFrame:(CGRect)a3;
- (_TtC15ControlCenterUI17ControlDragWindow)initWithWindowScene:(id)a3;
- (void)beginTrackingPlatterView:(id)a3;
- (void)stopTrackingPlatterView:(id)a3;
@end

@implementation ControlDragWindow

- (_TtC15ControlCenterUI17ControlDragWindow)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC15ControlCenterUI17ControlDragWindow_platterViews;
  v6 = self;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_weakObjectsHashTable);

  result = (_TtC15ControlCenterUI17ControlDragWindow *)sub_1D7BB78A8();
  __break(1u);
  return result;
}

- (_TtC15ControlCenterUI17ControlDragWindow)initWithWindowScene:(id)a3
{
  return (_TtC15ControlCenterUI17ControlDragWindow *)sub_1D7BB5AA4(a3);
}

- (void)beginTrackingPlatterView:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15ControlCenterUI17ControlDragWindow_platterViews);
  id v5 = a3;
  v8 = self;
  objc_msgSend(v4, sel_addObject_, v5);
  id v6 = [(ControlDragWindow *)v8 rootViewController];
  id v7 = objc_msgSend(v6, sel_view);

  objc_msgSend(v7, sel_addSubview_, v5);
  [(ControlDragWindow *)v8 setHidden:0];
}

- (void)stopTrackingPlatterView:(id)a3
{
  id v4 = a3;
  id v6 = self;
  objc_msgSend(v4, sel_removeFromSuperview);
  id v5 = *(Class *)((char *)&v6->super.super.super.super.isa
                + OBJC_IVAR____TtC15ControlCenterUI17ControlDragWindow_platterViews);
  objc_msgSend(v5, sel_removeObject_, v4);
  -[ControlDragWindow setHidden:](v6, sel_setHidden_, objc_msgSend(v5, sel_count) == 0);
}

- (_TtC15ControlCenterUI17ControlDragWindow)initWithFrame:(CGRect)a3
{
}

- (_TtC15ControlCenterUI17ControlDragWindow)initWithContentRect:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI17ControlDragWindow_platterViews));
}

@end