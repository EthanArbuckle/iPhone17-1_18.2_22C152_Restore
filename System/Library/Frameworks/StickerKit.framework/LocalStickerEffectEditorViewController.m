@interface LocalStickerEffectEditorViewController
- (BOOL)_canShowWhileLocked;
- (_TtC10StickerKit38LocalStickerEffectEditorViewController)initWithCoder:(id)a3;
- (_TtC10StickerKit38LocalStickerEffectEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation LocalStickerEffectEditorViewController

- (void)viewIsAppearing:(BOOL)a3
{
  v3 = self;
  sub_245345F50();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = qword_268ECF360;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2453FDBB8();
  __swift_project_value_buffer(v6, (uint64_t)qword_268ED43B0);
  v7 = sub_2453FDB98();
  os_log_type_t v8 = sub_2454000C8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2451E4000, v7, v8, "viewWillDisappear", v9, 2u);
    MEMORY[0x2456A0410](v9, -1, -1);
  }

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for LocalStickerEffectEditorViewController();
  [(LocalStickerEffectEditorViewController *)&v10 viewWillDisappear:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  uint64_t v2 = qword_268ECF360;
  BOOL v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2453FDBB8();
  __swift_project_value_buffer(v4, (uint64_t)qword_268ED43B0);
  v5 = sub_2453FDB98();
  os_log_type_t v6 = sub_2454000C8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2451E4000, v5, v6, "deinit", v7, 2u);
    MEMORY[0x2456A0410](v7, -1, -1);
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for LocalStickerEffectEditorViewController();
  [(LocalStickerEffectEditorViewController *)&v8 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38LocalStickerEffectEditorViewController_stickerEditorController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38LocalStickerEffectEditorViewController_sticker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38LocalStickerEffectEditorViewController_stillRepresentation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38LocalStickerEffectEditorViewController_animatedRepresentation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38LocalStickerEffectEditorViewController_imageGlyph));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit38LocalStickerEffectEditorViewController_previewView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10StickerKit38LocalStickerEffectEditorViewController_effect);
}

- (_TtC10StickerKit38LocalStickerEffectEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_2453FFB38();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC10StickerKit38LocalStickerEffectEditorViewController *)LocalStickerEffectEditorViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit38LocalStickerEffectEditorViewController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit38LocalStickerEffectEditorViewController *)LocalStickerEffectEditorViewController.init(coder:)(a3);
}

@end