@interface UIAppEntityInteraction
- (UIView)view;
- (_TtC17_AppIntents_UIKit22UIAppEntityInteraction)init;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation UIAppEntityInteraction

- (UIView)view
{
  v2 = (void *)sub_22F3AEA18();

  return (UIView *)v2;
}

- (void)setView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_22F3AEAB8(a3);
}

- (void)willMoveToView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_22F3AF648();
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_22F3AF910(a3);
}

- (void)dealloc
{
  v2 = self;
  UIAppEntityInteraction.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entityIdentifier;
  sub_22F3BD108();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(char *))(v4 + 8))(v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entity);
  id v5 = (char *)self + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_state;
  sub_22F3BCE38();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(char *))(v6 + 8))(v5);

  swift_unknownObjectWeakDestroy();
}

- (_TtC17_AppIntents_UIKit22UIAppEntityInteraction)init
{
}

@end