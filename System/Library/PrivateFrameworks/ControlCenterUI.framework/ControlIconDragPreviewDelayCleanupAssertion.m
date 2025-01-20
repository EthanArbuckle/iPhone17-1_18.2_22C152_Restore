@interface ControlIconDragPreviewDelayCleanupAssertion
- (NSString)description;
- (_TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion)init;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)invalidate;
@end

@implementation ControlIconDragPreviewDelayCleanupAssertion

- (void)dealloc
{
  if (*((unsigned char *)&self->super.isa
       + OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_isInvalidated) == 1)
  {
    v3 = self;
  }
  else
  {
    *((unsigned char *)&self->super.isa
    + OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_isInvalidated) = 1;
    sub_1D7B65580((uint64_t)self);
  }
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ControlIconDragPreviewDelayCleanupAssertion();
  [(ControlIconDragPreviewDelayCleanupAssertion *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_dragPreview));

  swift_bridgeObjectRelease();
}

- (void)invalidate
{
  if ((*((unsigned char *)&self->super.isa
        + OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_isInvalidated) & 1) == 0)
  {
    *((unsigned char *)&self->super.isa
    + OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_isInvalidated) = 1;
    v2 = self;
    sub_1D7B65580((uint64_t)v2);
  }
}

- (NSString)description
{
  v2 = self;
  sub_1D7B65EC0();

  v3 = (void *)sub_1D7BB7228();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (id)succinctDescription
{
  id v3 = objc_allocWithZone(MEMORY[0x1E4F4F718]);
  objc_super v4 = self;
  id result = objc_msgSend(v3, sel_initWithObject_, v4);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v6 = result;
  id v7 = objc_msgSend(result, sel_build);

  if (!v7)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  sub_1D7BB7258();

  v8 = (void *)sub_1D7BB7228();
  swift_bridgeObjectRelease();

  return v8;
}

- (id)succinctDescriptionBuilder
{
  id v3 = objc_allocWithZone(MEMORY[0x1E4F4F718]);
  objc_super v4 = self;
  id result = objc_msgSend(v3, sel_initWithObject_, v4);
  if (result)
  {
    id v6 = result;

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  if (a3) {
    sub_1D7BB7258();
  }
  objc_super v4 = self;
  sub_1D7B65EC0();

  swift_bridgeObjectRelease();
  v5 = (void *)sub_1D7BB7228();
  swift_bridgeObjectRelease();

  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  if (a3) {
    sub_1D7BB7258();
  }
  id v4 = objc_allocWithZone(MEMORY[0x1E4F4F718]);
  v5 = self;
  id result = objc_msgSend(v4, sel_initWithObject_, v5);
  if (result)
  {
    id v7 = result;
    v8 = (void *)sub_1D7BB7228();
    v9 = (void *)sub_1D7BB7228();
    objc_msgSend(v7, sel_appendString_withName_, v8, v9);

    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion)init
{
  id result = (_TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end