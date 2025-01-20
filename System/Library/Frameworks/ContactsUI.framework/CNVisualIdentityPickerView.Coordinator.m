@interface CNVisualIdentityPickerView.Coordinator
- (_TtCV10ContactsUI26CNVisualIdentityPickerView11Coordinator)init;
- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5;
- (void)photoPickerDidCancel:(id)a3;
@end

@implementation CNVisualIdentityPickerView.Coordinator

- (void)photoPickerDidCancel:(id)a3
{
  v4 = *(void (**)(void))&self->parent[OBJC_IVAR____TtCV10ContactsUI26CNVisualIdentityPickerView11Coordinator_parent + 8];
  id v5 = a3;
  v6 = self;
  v4();
}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v9 = objc_allocWithZone((Class)CNVisualIdentity);
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = self;
  id v14 = objc_msgSend(v9, sel_initWithContact_, v11);
  (*(void (**)(void))&v13->parent[OBJC_IVAR____TtCV10ContactsUI26CNVisualIdentityPickerView11Coordinator_parent + 24])();
}

- (_TtCV10ContactsUI26CNVisualIdentityPickerView11Coordinator)init
{
  result = (_TtCV10ContactsUI26CNVisualIdentityPickerView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV10ContactsUI26CNVisualIdentityPickerView11Coordinator_parent);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end