@interface EditMenu
- (_TtC19CoreDynamicUIPlugin8EditMenu)init;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (void)dealloc;
- (void)didLongPress:(id)a3;
@end

@implementation EditMenu

- (void)dealloc
{
  v2 = self;
  sub_348B8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19CoreDynamicUIPlugin8EditMenu_longPressGestureRecognizer));

  swift_unknownObjectWeakDestroy();
}

- (void)didLongPress:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_349FC(v4);
}

- (_TtC19CoreDynamicUIPlugin8EditMenu)init
{
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  sub_F040(0, &qword_BC658);
  sub_8FA70();
  v5 = sub_34BD8();
  swift_bridgeObjectRelease();

  return v5;
}

@end