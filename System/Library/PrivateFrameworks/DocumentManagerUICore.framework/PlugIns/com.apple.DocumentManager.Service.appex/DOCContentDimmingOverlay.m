@interface DOCContentDimmingOverlay
- (BOOL)active;
- (BOOL)autohideWhenPossibleDropTarget;
- (BOOL)isHidden;
- (_TtC33com_apple_DocumentManager_Service24DOCContentDimmingOverlay)initWithCoder:(id)a3;
- (_TtC33com_apple_DocumentManager_Service24DOCContentDimmingOverlay)initWithFrame:(CGRect)a3;
- (id)initForCovering:(id)a3;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setAutohideWhenPossibleDropTarget:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
@end

@implementation DOCContentDimmingOverlay

- (BOOL)autohideWhenPossibleDropTarget
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCContentDimmingOverlay_autohideWhenPossibleDropTarget);
}

- (void)setAutohideWhenPossibleDropTarget:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCContentDimmingOverlay_autohideWhenPossibleDropTarget) = a3;
  v3 = self;
  sub_100190AB0();
  sub_100190D00();
}

- (BOOL)active
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCContentDimmingOverlay_active);
}

- (void)setActive:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCContentDimmingOverlay_active) = a3;
  v3 = self;
  sub_100190D00();
}

- (id)initForCovering:(id)a3
{
  return sub_10019081C(a3);
}

- (_TtC33com_apple_DocumentManager_Service24DOCContentDimmingOverlay)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001915EC();
}

- (BOOL)isHidden
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCContentDimmingOverlay();
  return [(DOCContentDimmingOverlay *)&v3 isHidden];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCContentDimmingOverlay();
  [(DOCContentDimmingOverlay *)&v4 setHidden:v3];
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v8 = self;
  id v7 = [a4 localDragSession];
  if (v7) {
    swift_unknownObjectRelease();
  }
  *((unsigned char *)&v8->super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCContentDimmingOverlay_hasDropTargetRequiringAutohide) = v7 != 0;
  sub_100190D00();

  swift_unknownObjectRelease();
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCContentDimmingOverlay_hasDropTargetRequiringAutohide) = 0;
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  sub_100190D00();

  swift_unknownObjectRelease();
}

- (_TtC33com_apple_DocumentManager_Service24DOCContentDimmingOverlay)initWithFrame:(CGRect)a3
{
  result = (_TtC33com_apple_DocumentManager_Service24DOCContentDimmingOverlay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCContentDimmingOverlay_dropInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCContentDimmingOverlay_dragMonitorKVO));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCContentDimmingOverlay_dimmable;
  sub_10003EA7C((uint64_t)v3);
}

@end