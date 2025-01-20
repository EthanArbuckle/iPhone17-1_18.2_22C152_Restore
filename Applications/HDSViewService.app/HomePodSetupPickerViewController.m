@interface HomePodSetupPickerViewController
- (_TtC14HDSViewService32HomePodSetupPickerViewController)initWithContentView:(id)a3;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HomePodSetupPickerViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100065DC8();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupPickerViewController();
  id v4 = v5.receiver;
  [(HomePodSetupPickerViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10007E75C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return *(void *)(*(void *)&self->PRXPickerContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupPickerViewController_options]
                   + 16);
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v5 = self;
  uint64_t v6 = *(void *)((char *)self + OBJC_IVAR____TtC14HDSViewService32HomePodSetupPickerViewController_options);
  if (*(void *)(v6 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return self;
  }
  sub_10003DE98(v6 + 40 * a4 + 32, (uint64_t)v14);
  uint64_t v8 = v15;
  uint64_t v9 = v16;
  sub_10000F6E8(v14, v15);
  v10 = *(void (**)(uint64_t, uint64_t))(v9 + 16);
  id v11 = a3;
  id v12 = v5;
  v10(v8, v9);
  sub_10000E470((uint64_t)v14);

  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v13;
}

- (_TtC14HDSViewService32HomePodSetupPickerViewController)initWithContentView:(id)a3
{
  *(void *)&self->presenter[OBJC_IVAR____TtC14HDSViewService32HomePodSetupPickerViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&self->PRXPickerContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupPickerViewController_options] = _swiftEmptyArrayStorage;
  id v5 = &self->PRXPickerContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupPickerViewController_viewModel];
  uint64_t v6 = type metadata accessor for HomePodSetupViewModel(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HomePodSetupPickerViewController();
  return [(HomePodSetupPickerViewController *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end