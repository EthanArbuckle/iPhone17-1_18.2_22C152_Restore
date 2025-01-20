@interface EmojiPosterExtensionEditorController
- (_TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController)init;
- (double)editor:(id)a3 luminanceForLook:(id)a4 inRect:(CGRect)a5;
- (id)initialLookIdentifierForEditor:(id)a3;
- (id)leadingMenuElementsForEditor:(id)a3;
- (id)looksForEditor:(id)a3;
- (id)solidColorHomeScreenColorPickerConfigurationForEditor:(id)a3;
- (id)timeColorPickerConfigurationForEditor:(id)a3;
- (id)trailingMenuElementsForEditor:(id)a3;
- (void)editor:(PREditor *)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidFinishInitialLayout:(id)a3;
- (void)editorDidInvalidate:(id)a3;
@end

@implementation EmojiPosterExtensionEditorController

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
}

- (void)editorDidFinishInitialLayout:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000D274(v4);
}

- (id)initialLookIdentifierForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100015F58();

  NSString v6 = sub_100017F78();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = a5;
  v9 = self;
  sub_1000165D0(v7);

  swift_unknownObjectRelease();
}

- (void)editor:(PREditor *)a3 finalizeWithCompletion:(id)a4
{
  uint64_t v7 = sub_100005AFC(&qword_100021C28);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_100018068();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100021C38;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100021C48;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1000148B8((uint64_t)v9, (uint64_t)&unk_100021C58, (uint64_t)v14);
  swift_release();
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100016894();
}

- (id)looksForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100015700();

  sub_10000A4A0(0, &qword_100021C20);
  v6.super.isa = sub_100017FE8().super.isa;
  swift_bridgeObjectRelease();
  return v6.super.isa;
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_100016C8C(a4, v9);

  swift_unknownObjectRelease();
}

- (double)editor:(id)a3 luminanceForLook:(id)a4 inRect:(CGRect)a5
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_luminance);
}

- (id)leadingMenuElementsForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_100011564();

  if (v6)
  {
    sub_10000A4A0(0, &qword_100021C08);
    v7.super.isa = sub_100017FE8().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }
  return v7.super.isa;
}

- (id)trailingMenuElementsForEditor:(id)a3
{
  sub_100005AFC(&qword_1000219A0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100018AB0;
  id v6 = a3;
  NSArray v7 = self;
  *(void *)(v5 + 32) = sub_1000101A0((uint64_t)v6);
  sub_100017FF8();

  sub_10000A4A0(0, &qword_100021C08);
  v8.super.isa = sub_100017FE8().super.isa;
  swift_bridgeObjectRelease();
  return v8.super.isa;
}

- (id)timeColorPickerConfigurationForEditor:(id)a3
{
  id v5 = objc_allocWithZone((Class)PREditorColorPickerConfiguration);
  id v6 = a3;
  NSArray v7 = self;
  id v8 = [v5 init];
  sub_100017B78();
  id v9 = (void *)sub_100017B68();
  [v8 setColorPalette:v9];

  [v8 setColorWellDisplayMode:1];
  return v8;
}

- (id)solidColorHomeScreenColorPickerConfigurationForEditor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = (void *)sub_100017190();

  return v6;
}

- (_TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController)init
{
  return (_TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController *)sub_100013F14();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_logger;
  uint64_t v4 = sub_100017ED8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10000B964((uint64_t)self + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_templateConfiguration, &qword_100021B98);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_editor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_inputAccessoryVC));
  id v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_initialTitleColor);
}

@end