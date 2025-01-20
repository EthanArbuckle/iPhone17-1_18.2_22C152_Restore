@interface DetectionModeSettingsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (_TtC16MagnifierSupport35DetectionModeSettingsViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport35DetectionModeSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)didToggleDetectLanguagesSwitch:(id)a3;
- (void)didToggleDetectionSwitch:(id)a3;
- (void)didToggleFeedbackSwitch:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DetectionModeSettingsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_235733194();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_2356E3248(a3);
}

- (void)didToggleDetectionSwitch:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_235734BB8((uint64_t)v4);
}

- (void)didToggleFeedbackSwitch:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23573509C(v4);
}

- (void)didToggleDetectLanguagesSwitch:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2357354A8(v4);
}

- (_TtC16MagnifierSupport35DetectionModeSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_235949AC8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16MagnifierSupport35DetectionModeSettingsViewController *)sub_23573383C(v5, v7, a4);
}

- (_TtC16MagnifierSupport35DetectionModeSettingsViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport35DetectionModeSettingsViewController *)sub_235733A88(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController____lazy_storage___peopleDetectionSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController____lazy_storage___imageCaptionSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController____lazy_storage___doorDetectionSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController____lazy_storage___objectUnderstandingSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController_languageTranslator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController____lazy_storage___pointSpeakSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController____lazy_storage___textDetectionSettingsViewController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController____lazy_storage___dataSource));
  v3 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController_delegate;
  sub_23566A2B4((uint64_t)v3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  if (MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController_delegate, a2))
  {
    id v5 = a3;
    uint64_t v6 = self;
    sub_2357C104C();

    swift_unknownObjectRelease();
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_235947B38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7, v8, v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return 1;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_235947B38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7, v8, v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_235947B38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7, v8, v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  sub_2357340DC(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end