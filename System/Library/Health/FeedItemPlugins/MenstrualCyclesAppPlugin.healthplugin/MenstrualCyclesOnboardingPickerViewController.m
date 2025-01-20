@interface MenstrualCyclesOnboardingPickerViewController
- (_TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (uint64_t)nextButtonTapped:(void *)a1;
- (void)cancelButtonTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation MenstrualCyclesOnboardingPickerViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2415293F0();
}

- (uint64_t)nextButtonTapped:(void *)a1
{
  swift_unknownObjectRetain();
  id v2 = a1;
  sub_241632CE8();

  swift_unknownObjectRelease();
  return _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v4);
}

- (void)cancelButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_241632CE8();
  swift_unknownObjectRelease();
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  id v6 = sub_2411D33C8((uint64_t)sub_24152A928, v5);
  swift_release_n();
  [(MenstrualCyclesOnboardingPickerViewController *)v4 presentViewController:v6 animated:1 completion:0];

  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v7);
}

- (_TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_24152A930(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController____lazy_storage___dayPickerRange));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController____lazy_storage___datePicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController____lazy_storage___dayPicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController____lazy_storage___dateComponentsFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController____lazy_storage___pickerDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController____lazy_storage___descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController____lazy_storage___nextButton));
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_pinnedContentManager);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  if ((*(unsigned char *)(self
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_pickerType
                 + 16) & 1) != 0)
    return 0;
  uint64_t v4 = *(void *)(self
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_pickerType);
  uint64_t v5 = *(void *)(self
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_pickerType
                 + 8);
  BOOL v6 = __OFSUB__(v5, v4);
  uint64_t v7 = v5 - v4;
  if (v6)
  {
    __break(1u);
    goto LABEL_7;
  }
  self = v7 + 1;
  if (__OFADD__(v7, 1)) {
LABEL_7:
  }
    __break(1u);
  return self;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7 = a3;
  v8 = self;
  sub_24152A820(a4);
  uint64_t v10 = v9;

  if (v10)
  {
    v11 = (void *)sub_241631CC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end