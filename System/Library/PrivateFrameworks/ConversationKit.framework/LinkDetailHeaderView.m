@interface LinkDetailHeaderView
- (_TtC15ConversationKit20LinkDetailHeaderView)initWithCoder:(id)a3;
- (_TtC15ConversationKit20LinkDetailHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation LinkDetailHeaderView

- (_TtC15ConversationKit20LinkDetailHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit20LinkDetailHeaderView *)LinkDetailHeaderView.init(frame:)();
}

- (_TtC15ConversationKit20LinkDetailHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  LinkDetailHeaderView.init(coder:)();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit20LinkDetailHeaderView__invitedMemberHandles;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Set<TUHandle>?>);
  OUTLINED_FUNCTION_12_0();
  (*(void (**)(char *))(v4 + 8))(v3);
  v5 = (char *)self + OBJC_IVAR____TtC15ConversationKit20LinkDetailHeaderView__title;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<String?>);
  OUTLINED_FUNCTION_12_0();
  (*(void (**)(char *))(v6 + 8))(v5);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit20LinkDetailHeaderView_avatarController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit20LinkDetailHeaderView____lazy_storage___linkLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit20LinkDetailHeaderView____lazy_storage___linkDetailImage));
  swift_bridgeObjectRelease();
}

@end