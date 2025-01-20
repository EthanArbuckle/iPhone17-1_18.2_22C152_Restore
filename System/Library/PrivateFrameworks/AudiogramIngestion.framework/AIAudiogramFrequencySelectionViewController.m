@interface AIAudiogramFrequencySelectionViewController
- (AIAudiogramFrequencySelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (AIAudiogramFrequencySelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (AIAudiogramFrequencySelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 selectedFrequencies:(id)a5 delegate:(id)a6 isModal:(BOOL)a7;
- (AIAudiogramFrequencySelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (AIAudiogramFrequencySelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelTapped:(id)a3;
- (void)continueToIndividualSensitivityPointInput:(id)a3;
- (void)doneTapped:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AIAudiogramFrequencySelectionViewController

- (AIAudiogramFrequencySelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 selectedFrequencies:(id)a5 delegate:(id)a6 isModal:(BOOL)a7
{
  uint64_t v9 = sub_23F120DC0();
  uint64_t v11 = v10;
  uint64_t v12 = sub_23F120DC0();
  uint64_t v14 = v13;
  sub_23F10B0D4();
  uint64_t v15 = sub_23F120E60();
  swift_unknownObjectRetain();
  return (AIAudiogramFrequencySelectionViewController *)AudiogramFrequencySelectionViewController.init(title:detailText:selectedFrequencies:delegate:isModal:)(v9, v11, v12, v14, v15, (uint64_t)a6, a7);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_23F10C13C(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23F10C2A0();
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for AudiogramFrequencySelectionViewController();
  [(OBTableWelcomeController *)&v2 viewDidLayoutSubviews];
}

- (void)cancelTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_23F120F80();
  swift_unknownObjectRelease();
  v5 = (void *)MEMORY[0x2455C57F0]((char *)v4 + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_delegate);
  if (v5)
  {
    objc_msgSend(v5, sel_cancelButtonTapped);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v6);
}

- (void)doneTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_23F120F80();
  swift_unknownObjectRelease();
  if (*((unsigned char *)&v4->super.super.super.super.super.super.isa
       + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_isModal) == 1)
    [(AIAudiogramFrequencySelectionViewController *)v4 dismissViewControllerAnimated:1 completion:0];

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_23F120D00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F120CE0();
  id v10 = a3;
  uint64_t v11 = self;
  uint64_t v12 = (void *)sub_23F10C7CC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_frequencies);
  if (!(v4 >> 62)) {
    return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v7 = a3;
  uint64_t v8 = self;
  swift_bridgeObjectRetain();
  int64_t v9 = sub_23F121070();

  swift_bridgeObjectRelease();
  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_23F120D00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  int64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F120CE0();
  id v10 = a3;
  uint64_t v11 = self;
  sub_23F10CD7C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)continueToIndividualSensitivityPointInput:(id)a3
{
  swift_unknownObjectRetain();
  unint64_t v4 = self;
  sub_23F120F80();
  swift_unknownObjectRelease();
  sub_23F10D9E0();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (AIAudiogramFrequencySelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  result = (AIAudiogramFrequencySelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (AIAudiogramFrequencySelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  result = (AIAudiogramFrequencySelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (AIAudiogramFrequencySelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  result = (AIAudiogramFrequencySelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (AIAudiogramFrequencySelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  result = (AIAudiogramFrequencySelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23F10E1E4((uint64_t)self + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_tableViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_audiogram));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_continueButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_doneButton);
}

@end