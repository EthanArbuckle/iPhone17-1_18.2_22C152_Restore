@interface DOCViewEditMenuInteraction
- (_TtC33com_apple_DocumentManager_Service26DOCViewEditMenuInteraction)init;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)longPressGesture:(id)a3;
@end

@implementation DOCViewEditMenuInteraction

- (void)longPressGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10030EBD8(v4);
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  Class v10 = sub_10030F620();

  return v10;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  v5 = (char *)self
     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service26DOCViewEditMenuInteraction_activePresentationContext;
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[24] = 0;
  *((void *)v5 + 2) = 0;
  swift_bridgeObjectRelease();
}

- (_TtC33com_apple_DocumentManager_Service26DOCViewEditMenuInteraction)init
{
  result = (_TtC33com_apple_DocumentManager_Service26DOCViewEditMenuInteraction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_10003EA7C((uint64_t)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service26DOCViewEditMenuInteraction_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service26DOCViewEditMenuInteraction_longPressGesture));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service26DOCViewEditMenuInteraction_editMenuInteraction));
  swift_bridgeObjectRelease();
}

@end