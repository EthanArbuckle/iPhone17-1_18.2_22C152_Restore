@interface DOCContentDimmingOverlay
- (BOOL)active;
- (BOOL)autohideWhenPossibleDropTarget;
- (BOOL)isHidden;
- (_TtC14RecentsAvocado24DOCContentDimmingOverlay)initWithCoder:(id)a3;
- (_TtC14RecentsAvocado24DOCContentDimmingOverlay)initWithFrame:(CGRect)a3;
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
         + OBJC_IVAR____TtC14RecentsAvocado24DOCContentDimmingOverlay_autohideWhenPossibleDropTarget);
}

- (void)setAutohideWhenPossibleDropTarget:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC14RecentsAvocado24DOCContentDimmingOverlay_autohideWhenPossibleDropTarget) = a3;
  v3 = self;
  sub_1003C36A4();
  sub_1003C38F4();
}

- (BOOL)active
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC14RecentsAvocado24DOCContentDimmingOverlay_active);
}

- (void)setActive:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC14RecentsAvocado24DOCContentDimmingOverlay_active) = a3;
  v3 = self;
  sub_1003C38F4();
}

- (id)initForCovering:(id)a3
{
  return sub_1003C3410(a3);
}

- (_TtC14RecentsAvocado24DOCContentDimmingOverlay)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003C41E0();
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
  + OBJC_IVAR____TtC14RecentsAvocado24DOCContentDimmingOverlay_hasDropTargetRequiringAutohide) = v7 != 0;
  sub_1003C38F4();

  swift_unknownObjectRelease();
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC14RecentsAvocado24DOCContentDimmingOverlay_hasDropTargetRequiringAutohide) = 0;
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  sub_1003C38F4();

  swift_unknownObjectRelease();
}

- (_TtC14RecentsAvocado24DOCContentDimmingOverlay)initWithFrame:(CGRect)a3
{
  result = (_TtC14RecentsAvocado24DOCContentDimmingOverlay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado24DOCContentDimmingOverlay_dropInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado24DOCContentDimmingOverlay_dragMonitorKVO));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC14RecentsAvocado24DOCContentDimmingOverlay_dimmable;
  sub_1000391D4((uint64_t)v3);
}

@end