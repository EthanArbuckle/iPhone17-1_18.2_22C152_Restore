@interface DOCFilenameTransitionCoordinator
- (_TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2732DOCFilenameTransitionCoordinator)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation DOCFilenameTransitionCoordinator

- (_TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2732DOCFilenameTransitionCoordinator)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2732DOCFilenameTransitionCoordinator_thumbnail) = 0;
  v4 = (char *)self
     + OBJC_IVAR____TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2732DOCFilenameTransitionCoordinator_thumbnailStyle;
  *(void *)v4 = 0;
  v4[8] = 1;
  v5 = (char *)self
     + OBJC_IVAR____TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2732DOCFilenameTransitionCoordinator_sourceRect;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v5[32] = 1;
  uint64_t v6 = OBJC_IVAR____TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2732DOCFilenameTransitionCoordinator_group;
  v7 = self;
  *(Class *)((char *)&self->super.isa + v6) = (Class)dispatch_group_create();

  v9.receiver = v7;
  v9.super_class = ObjectType;
  return [(DOCFilenameTransitionCoordinator *)&v9 init];
}

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_10041245C((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2732DOCFilenameTransitionCoordinator_thumbnail));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2732DOCFilenameTransitionCoordinator_group);
}

@end