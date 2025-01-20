@interface IdentityProofingPasscodeEntryViewController
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)addButtonClicked;
- (void)cancelButtonClicked;
- (void)configureFonts;
- (void)configureTextFieldViewColors;
- (void)dealloc;
- (void)dismissKeyboard;
- (void)keyboardDidHideWithNotification:(id)a3;
- (void)keyboardDidShowWithNotification:(id)a3;
- (void)textFieldDidChange:(id)a3;
- (void)updateUI:(id)a3 previousTraitCollection:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation IdentityProofingPasscodeEntryViewController

- (_TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21F4DF3F8();
}

- (void)dealloc
{
  id v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for IdentityProofingPasscodeEntryViewController();
  [(IdentityProofingPasscodeEntryViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_config));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_secondaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_primaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_imageViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_textField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_addButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController____lazy_storage___textFieldView);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_21F4DC4D4();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_21F4DC71C(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IdentityProofingPasscodeEntryViewController();
  v4 = (char *)v5.receiver;
  [(IdentityProofingPasscodeEntryViewController *)&v5 viewDidAppear:v3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_textField], sel_becomeFirstResponder, v5.receiver, v5.super_class);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for IdentityProofingPasscodeEntryViewController();
  id v4 = v7.receiver;
  [(IdentityProofingPasscodeEntryViewController *)&v7 viewWillDisappear:v3];
  id v5 = objc_msgSend(v4, sel_view, v7.receiver, v7.super_class);
  if (v5)
  {
    objc_super v6 = v5;
    objc_msgSend(v5, sel_endEditing_, 1);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_21F4DCB50();
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_21F4DCE1C((uint64_t)a3);
}

- (void)textFieldDidChange:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_addButton);
  id v5 = a3;
  objc_super v6 = self;
  objc_msgSend(v4, sel_setEnabled_, (unint64_t)sub_21F4DB6E0() & 1);
}

- (void)keyboardDidShowWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_21F4DE2BC(v4);
}

- (void)keyboardDidHideWithNotification:(id)a3
{
  id v5 = self;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = self;
  v10[4] = sub_21F4DFA4C;
  v10[5] = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_21F46FC24;
  v10[3] = &block_descriptor_18;
  objc_super v7 = _Block_copy(v10);
  v8 = self;
  id v9 = a3;
  swift_release();
  objc_msgSend(v5, sel_animateWithDuration_animations_, v7, 0.5);
  _Block_release(v7);
}

- (void)cancelButtonClicked
{
  uint64_t v2 = (*(void **)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController_proofingFlowManager))[17] & 3;
  BOOL v3 = self;
  id v4 = v3;
  if (v2 == 2) {
    sub_21F5358E0(v3);
  }
  else {
    sub_21F53FAB8(0);
  }
}

- (void)addButtonClicked
{
  uint64_t v2 = self;
  sub_21F4DE658();
}

- (void)updateUI:(id)a3 previousTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_21F4DF830(a4);
}

- (void)dismissKeyboard
{
  uint64_t v2 = self;
  id v3 = [(IdentityProofingPasscodeEntryViewController *)v2 view];
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v3, sel_endEditing_, 1);
  }
  else
  {
    __break(1u);
  }
}

- (void)configureFonts
{
  uint64_t v2 = self;
  sub_21F4DEA54();
}

- (void)configureTextFieldViewColors
{
  uint64_t v2 = self;
  sub_21F4DEBFC();
}

- (_TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9CoreIDVUI43IdentityProofingPasscodeEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if (sub_21F4DB6E0()) {
    sub_21F4DE658();
  }
  id v6 = [(IdentityProofingPasscodeEntryViewController *)v5 view];
  if (v6)
  {
    id v7 = v6;
    objc_msgSend(v6, sel_endEditing_, 1);

    LOBYTE(v6) = 1;
  }
  else
  {
    __break(1u);
  }
  return (char)v6;
}

@end