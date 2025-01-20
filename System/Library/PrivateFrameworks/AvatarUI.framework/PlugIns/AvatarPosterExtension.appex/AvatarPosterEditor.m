@interface AvatarPosterEditor
- (_TtC21AvatarPosterExtension18AvatarPosterEditor)init;
- (id)leadingMenuElementsForEditor:(id)a3;
- (id)looksForEditor:(id)a3;
- (id)trailingMenuElementsForEditor:(id)a3;
- (void)combinedPickerViewController:(id)a3 didSelectRecord:(id)a4 withStickerConfiguration:(id)a5;
- (void)combinedPickerViewControllerDidCancel:(id)a3;
- (void)editor:(PREditor *)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidInvalidate:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation AvatarPosterEditor

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_10000D060(v6, a4);

  swift_unknownObjectRelease();
}

- (id)looksForEditor:(id)a3
{
  sub_100013E60();
  sub_100008764(0, &qword_1000232D8);
  v3.super.isa = sub_100015B10().super.isa;
  swift_bridgeObjectRelease();
  return v3.super.isa;
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_100014030(a4);

  swift_unknownObjectRelease();
}

- (void)editor:(PREditor *)a3 finalizeWithCompletion:(id)a4
{
  uint64_t v7 = sub_100002B10(&qword_100022F20);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_100015B80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100023258;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100023268;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100012F00((uint64_t)v9, (uint64_t)&unk_100023278, (uint64_t)v14);
  swift_release();
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100014288();
}

- (id)trailingMenuElementsForEditor:(id)a3
{
  return sub_10000FD30(self, (uint64_t)a2, a3, sub_10000F79C);
}

- (id)leadingMenuElementsForEditor:(id)a3
{
  return sub_10000FD30(self, (uint64_t)a2, a3, (uint64_t (*)(id))sub_10000FA68);
}

- (void)combinedPickerViewController:(id)a3 didSelectRecord:(id)a4 withStickerConfiguration:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_1000144A0((uint64_t)a4, (uint64_t)v9);

  swift_unknownObjectRelease();
}

- (void)combinedPickerViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100014808();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100014980();
}

- (_TtC21AvatarPosterExtension18AvatarPosterEditor)init
{
  return (_TtC21AvatarPosterExtension18AvatarPosterEditor *)sub_100012154();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor__backgroundViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor____lazy_storage___avatarStore));
  NSArray v3 = (char *)self + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_logger;
  uint64_t v4 = sub_100015A00();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100014ADC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor____lazy_storage___defaultAvatar));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor__avatarRecordRenderView));
  sub_100008708((uint64_t)self + OBJC_IVAR____TtC21AvatarPosterExtension18AvatarPosterEditor_configuration, (uint64_t *)&unk_100023050);
}

@end