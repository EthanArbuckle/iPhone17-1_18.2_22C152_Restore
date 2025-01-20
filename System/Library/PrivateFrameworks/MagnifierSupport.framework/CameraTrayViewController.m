@interface CameraTrayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (_TtC16MagnifierSupport24CameraTrayViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport24CameraTrayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (uint64_t)detectionMenuActionTriggered:;
- (uint64_t)didTapSnapshotModeButton:;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)didTapActivitiesButton:(id)a3;
- (void)didTapDetectionModeButton:(id)a3;
- (void)didTapDoneButton:(id)a3;
- (void)didTapReaderButton:(id)a3;
- (void)didTapSettingsButton:(id)a3;
- (void)didTapShareButton:(id)a3;
- (void)didTapSnapshotButton:(id)a3;
- (void)didTapViewSnapshotsButton:(id)a3;
- (void)keyboardWillShowWithNotification:(id)a3;
- (void)switchToDetectionModeControls;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CameraTrayViewController

- (void)didTapActivitiesButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_235700994();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23580CB10();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_23580FB1C(a3);
}

- (void)didTapSettingsButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23581E9FC();
}

- (void)didTapShareButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23581709C(v4, (void (*)(void *))sub_235666544);
}

- (void)didTapReaderButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23581709C(v4, (void (*)(void *))sub_235667CA4);
}

- (void)didTapViewSnapshotsButton:(id)a3
{
}

- (void)didTapDoneButton:(id)a3
{
}

- (void)didTapSnapshotButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23581764C(v4);
}

- (void)didTapDetectionModeButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23581EB18();
}

- (void)keyboardWillShowWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23581F418();
}

- (void)switchToDetectionModeControls
{
  v2 = self;
  sub_23580E5FC();
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport24CameraTrayViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport24CameraTrayViewController *)sub_2358183E8(v5, v7, a4);
}

- (_TtC16MagnifierSupport24CameraTrayViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport24CameraTrayViewController *)sub_235818788(a3);
}

- (void).cxx_destruct
{
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_captureDelegate);
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_detectionModeDelegate);
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_settingsDelegate);
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_switchActivityDelegate);
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_freezeFrameDelegate);
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_quickReaderModeDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___snapshotButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___activitiesButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___microphoneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___snapshotModeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___viewSnapshotsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___detectionModeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___controlsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___shareLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___readerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___readerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___activityLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___snapshotLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___detectionModeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___microphoneLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___controlsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_microphoneInputField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController____lazy_storage___microphoneInputFieldMicButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_scrollView));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_snapshotConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_snapshotButtonContextMenuInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_captureButtonContextMenuTimer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_quickReaderModeActionIdentifier);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = sub_23581F7A4();

  return v7;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_23581F9D4();

  swift_unknownObjectRelease();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v8 = OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_captureButtonContextMenuTimer;
  v9 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport24CameraTrayViewController_captureButtonContextMenuTimer);
  id v10 = a3;
  id v11 = a4;
  swift_unknownObjectRetain();
  v12 = self;
  if (v9)
  {
    objc_msgSend(v9, sel_invalidate);
    id v13 = *(Class *)((char *)&self->super.super.super.isa + v8);
  }
  else
  {
    id v13 = 0;
  }
  *(Class *)((char *)&self->super.super.super.isa + v8) = 0;

  swift_unknownObjectRelease();
}

- (uint64_t)didTapSnapshotModeButton:
{
  if (qword_26880E400 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_235948278();
  __swift_project_value_buffer(v0, (uint64_t)qword_26880F788);
  v1 = sub_235948258();
  os_log_type_t v2 = sub_23594A148();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_235640000, v1, v2, "didTapSnapshotModeButton", v3, 2u);
    MEMORY[0x237DE9F30](v3, -1, -1);
  }

  if (qword_26AF13B78 != -1) {
    swift_once();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2359484D8();
  swift_release();
  uint64_t result = swift_release();
  if ((v5 & 1) == 0) {
    return sub_23581E610(1);
  }
  return result;
}

- (uint64_t)detectionMenuActionTriggered:
{
  uint64_t v0 = sub_2359496D8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2, v3, v4, v5);
  id v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_26AF13B78 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_26AF181E0 + OBJC_IVAR____TtCV16MagnifierSupport13MFEnvironment12UserControls__longPressHintShouldDisplay;
  swift_beginAccess();
  v16[0] = 0;
  if (qword_26AF144C0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_2359496C8();
  MEMORY[0x270FA5388](v9, v10, v11, v12, v13);
  *(void *)&v15[-16] = v16;
  *(void *)&v15[-8] = v8;
  sub_23594A298();
  (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v7, v0);
  swift_endAccess();
  swift_getKeyPath();
  swift_getKeyPath();
  v16[1] = 1;
  sub_2359470F8();
  return sub_2359484E8();
}

@end