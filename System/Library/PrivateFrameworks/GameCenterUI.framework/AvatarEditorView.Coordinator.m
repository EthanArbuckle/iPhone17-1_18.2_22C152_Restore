@interface AvatarEditorView.Coordinator
- (_TtCV12GameCenterUIP33_A3F53D5CE5AC6C06F2DAA78D55DA747516AvatarEditorView11Coordinator)init;
- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5;
- (void)photoPickerDidCancel:(id)a3;
@end

@implementation AvatarEditorView.Coordinator

- (void)photoPickerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF5581C0(v4);
}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = self;
  sub_1AF558294(v11, v8, v9);
}

- (_TtCV12GameCenterUIP33_A3F53D5CE5AC6C06F2DAA78D55DA747516AvatarEditorView11Coordinator)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)&self->parent[OBJC_IVAR____TtCV12GameCenterUIP33_A3F53D5CE5AC6C06F2DAA78D55DA747516AvatarEditorView11Coordinator_parent
                                  + 8]);

  swift_release();
}

@end