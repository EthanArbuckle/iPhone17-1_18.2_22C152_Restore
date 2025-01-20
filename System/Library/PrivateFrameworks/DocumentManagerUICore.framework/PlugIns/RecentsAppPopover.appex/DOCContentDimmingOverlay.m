@interface DOCContentDimmingOverlay
- (BOOL)active;
- (BOOL)autohideWhenPossibleDropTarget;
- (BOOL)isHidden;
- (_TtC17RecentsAppPopover24DOCContentDimmingOverlay)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover24DOCContentDimmingOverlay)initWithFrame:(CGRect)a3;
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
         + OBJC_IVAR____TtC17RecentsAppPopover24DOCContentDimmingOverlay_autohideWhenPossibleDropTarget);
}

- (void)setAutohideWhenPossibleDropTarget:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC17RecentsAppPopover24DOCContentDimmingOverlay_autohideWhenPossibleDropTarget) = a3;
  v3 = self;
  sub_10038D2B0();
  sub_10038D500();
}

- (BOOL)active
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC17RecentsAppPopover24DOCContentDimmingOverlay_active);
}

- (void)setActive:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC17RecentsAppPopover24DOCContentDimmingOverlay_active) = a3;
  v3 = self;
  sub_10038D500();
}

- (id)initForCovering:(id)a3
{
  return sub_10038D01C(a3);
}

- (_TtC17RecentsAppPopover24DOCContentDimmingOverlay)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10038DDEC();
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
  + OBJC_IVAR____TtC17RecentsAppPopover24DOCContentDimmingOverlay_hasDropTargetRequiringAutohide) = v7 != 0;
  sub_10038D500();

  swift_unknownObjectRelease();
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC17RecentsAppPopover24DOCContentDimmingOverlay_hasDropTargetRequiringAutohide) = 0;
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  sub_10038D500();

  swift_unknownObjectRelease();
}

- (_TtC17RecentsAppPopover24DOCContentDimmingOverlay)initWithFrame:(CGRect)a3
{
  result = (_TtC17RecentsAppPopover24DOCContentDimmingOverlay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover24DOCContentDimmingOverlay_dropInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover24DOCContentDimmingOverlay_dragMonitorKVO));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC17RecentsAppPopover24DOCContentDimmingOverlay_dimmable;
  sub_10003CC04((uint64_t)v3);
}

@end