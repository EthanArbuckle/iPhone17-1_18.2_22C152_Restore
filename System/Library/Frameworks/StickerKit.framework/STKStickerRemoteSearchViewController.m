@interface STKStickerRemoteSearchViewController
- (BOOL)_canShowWhileLocked;
- (STKStickerRemoteSearchViewController)initWithCoder:(id)a3;
- (STKStickerRemoteSearchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (STKStickerRemoteSearchViewControllerDelegate)delegate;
- (void)configureWithConfiguration:(id)a3;
- (void)dealloc;
- (void)didRequestEmojiCreationWithSearchString:(id)a3;
- (void)didSelectEmoji:(id)a3 indexPath:(id)a4;
- (void)didSelectSticker:(id)a3 indexPath:(id)a4;
- (void)emojiGenerationRemoteController:(id)a3 didGenerateEmoji:(id)a4 shouldInsert:(BOOL)a5;
- (void)emojiGenerationRemoteControllerDidCancel:(id)a3;
- (void)layoutDirectionDidChange;
- (void)presentAvatarEditor;
- (void)presentCreateStickerPhotoPickerController;
- (void)presentEmojiGenerationControllerWithInputString:(id)a3;
- (void)searchWithQuery:(id)a3;
- (void)setDelegate:(id)a3;
- (void)toggleGlow:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation STKStickerRemoteSearchViewController

- (STKStickerRemoteSearchViewControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___STKStickerRemoteSearchViewController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x2456A0530](v2);

  return (STKStickerRemoteSearchViewControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  StickerRemoteSearchViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = qword_268ECF410;
  v7 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_2453FDBB8();
  __swift_project_value_buffer(v8, (uint64_t)qword_268ED5410);
  v9 = sub_2453FDB98();
  os_log_type_t v10 = sub_2454000C8();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2451E4000, v9, v10, "viewDidAppear", v11, 2u);
    MEMORY[0x2456A0410](v11, -1, -1);
  }

  v12.receiver = v7;
  v12.super_class = ObjectType;
  [(STKStickerRemoteSearchViewController *)&v12 viewDidAppear:v3];
  sub_245397418();
}

- (void)layoutDirectionDidChange
{
  v2 = self;
  sub_245397418();
}

- (void)searchWithQuery:(id)a3
{
  id v4 = a3;
  v5 = self;
  StickerRemoteSearchViewController.search(withQuery:)(v4);
}

- (void)configureWithConfiguration:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = a3;
  uint64_t v6 = self;
  sub_245400168();
  swift_release();
  swift_release();
  id v7 = v5;
  id v8 = sub_2452B02D8(1, v7, 0, 0);

  objc_msgSend(v9, sel_sendAction_, v8);
}

- (void)didSelectEmoji:(id)a3 indexPath:(id)a4
{
  sub_2453FFB38();
  uint64_t v5 = sub_2453FCDC8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCD68();
  v9 = (char *)self + OBJC_IVAR___STKStickerRemoteSearchViewController_delegate;
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x2456A0530](v9);
  if (v10)
  {
    v11 = (void *)v10;
    objc_super v12 = self;
    v13 = (void *)sub_2453FFB08();
    v14 = (void *)sub_2453FCD58();
    objc_msgSend(v11, sel_didSelectEmoji_indexPath_, v13, v14);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)didSelectSticker:(id)a3 indexPath:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2453FCDC8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  objc_super v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCD68();
  uint64_t v13 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  sub_2453FFE28();
  id v14 = a3;
  uint64_t v15 = self;
  uint64_t v16 = sub_2453FFE18();
  v17 = (void *)swift_allocObject();
  uint64_t v18 = MEMORY[0x263F8F500];
  v17[2] = v16;
  v17[3] = v18;
  v17[4] = v14;
  sub_245262154((uint64_t)v8, (uint64_t)&unk_268ED5528, (uint64_t)v17);

  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)toggleGlow:(BOOL)a3
{
  id v4 = self;
  StickerRemoteSearchViewController.toggleGlow(_:)(a3);
}

- (void)didRequestEmojiCreationWithSearchString:(id)a3
{
}

- (void)presentEmojiGenerationControllerWithInputString:(id)a3
{
}

- (void)presentCreateStickerPhotoPickerController
{
  v2 = self;
  StickerRemoteSearchViewController.presentCreateStickerPhotoPickerController()();
}

- (void)presentAvatarEditor
{
  v2 = self;
  StickerRemoteSearchViewController.presentAvatarEditor()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_268ECF410;
  uint64_t v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2453FDBB8();
  __swift_project_value_buffer(v6, (uint64_t)qword_268ED5410);
  uint64_t v7 = sub_2453FDB98();
  os_log_type_t v8 = sub_2454000C8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_2451E4000, v7, v8, "deinit", v9, 2u);
    MEMORY[0x2456A0410](v9, -1, -1);
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  [(STKStickerRemoteSearchViewController *)&v10 dealloc];
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR___STKStickerRemoteSearchViewController__sceneHostingController;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED3D70);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR___STKStickerRemoteSearchViewController_delegate;

  sub_245203A28((uint64_t)v5);
}

- (STKStickerRemoteSearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_2453FFB38();
    a3 = v8;
  }
  sub_245203D98(0, (unint64_t *)&unk_268ED3CE0);
  uint64_t v9 = self;
  id v10 = a4;
  sub_245400188();
  swift_unknownObjectWeakInit();

  if (a3)
  {
    uint64_t v11 = (void *)sub_2453FFB08();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
  }
  v14.receiver = v9;
  v14.super_class = ObjectType;
  objc_super v12 = [(STKStickerRemoteSearchViewController *)&v14 initWithNibName:v11 bundle:v10];

  return v12;
}

- (STKStickerRemoteSearchViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_245203D98(0, (unint64_t *)&unk_268ED3CE0);
  id v6 = a3;
  uint64_t v7 = self;
  sub_245400188();
  swift_unknownObjectWeakInit();

  v10.receiver = v7;
  v10.super_class = ObjectType;
  os_log_type_t v8 = [(STKStickerRemoteSearchViewController *)&v10 initWithCoder:v6];

  return v8;
}

- (void)emojiGenerationRemoteController:(id)a3 didGenerateEmoji:(id)a4 shouldInsert:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = self;
  StickerRemoteSearchViewController.emojiGenerationRemoteController(_:didGenerateEmoji:shouldInsert:)(v8, v9, a5);
}

- (void)emojiGenerationRemoteControllerDidCancel:(id)a3
{
  uint64_t v5 = self;
  id v6 = a3;
  uint64_t v7 = self;
  objc_msgSend(v5, sel_setRestoresToEmojiInputMode);
  if (qword_268ECF2C8 != -1) {
    swift_once();
  }
  sub_24530B1E8(v6, 0, 0);
}

@end