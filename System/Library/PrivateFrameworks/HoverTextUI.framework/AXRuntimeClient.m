@interface AXRuntimeClient
- (_TtC11HoverTextUI15AXRuntimeClient)init;
@end

@implementation AXRuntimeClient

- (_TtC11HoverTextUI15AXRuntimeClient)init
{
  result = (_TtC11HoverTextUI15AXRuntimeClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_logger;
  uint64_t v4 = sub_2269B8550();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  sub_22696C20C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_nativeFocusItemDidChange));
  sub_22696C20C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_valueChanged));
  sub_22696C20C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_elementVisualsUpdated));
  sub_22696C20C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_focusedApplicationsDidChange));
  sub_22696C20C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveAnnouncement));
  sub_22696C20C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillHide));
  sub_22696C20C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_currentInputModeDidChange));
  sub_22696C20C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_keyboardWillChangeFrame));
  sub_22696C20C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_loupeStateChanged));
  sub_22696C20C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_updateTypingDisplayMode));
  sub_22696C20C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_didReceiveNotification));
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11HoverTextUI15AXRuntimeClient_axObserver);
}

@end