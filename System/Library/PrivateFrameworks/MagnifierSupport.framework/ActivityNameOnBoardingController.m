@interface ActivityNameOnBoardingController
- (BOOL)_canShowWhileLocked;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC16MagnifierSupport32ActivityNameOnBoardingController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC16MagnifierSupport32ActivityNameOnBoardingController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)activityNameFromTextFieldWithTextField:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ActivityNameOnBoardingController

- (void)viewDidLoad
{
  v2 = self;
  sub_2357567A0();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivityNameOnBoardingController();
  v4 = (char *)v5.receiver;
  [(OBBaseWelcomeController *)&v5 viewDidAppear:v3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_activityNameTextField], sel_becomeFirstResponder, v5.receiver, v5.super_class);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_235756C9C(v4);

  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_23575706C(v6, a4);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  v7 = self;
  id v8 = a3;
  v9 = self;
  objc_msgSend(v7, sel_cancelPreviousPerformRequestsWithTarget_selector_object_, v9, sel_activityNameFromTextFieldWithTextField_, v8);
  [(ActivityNameOnBoardingController *)v9 performSelector:sel_activityNameFromTextFieldWithTextField_ withObject:v8 afterDelay:0.01];

  return 1;
}

- (void)activityNameFromTextFieldWithTextField:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_235757338(v4);
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_activityNameTakenLabel);
  id v5 = a3;
  id v6 = self;
  objc_msgSend(v4, sel_setHidden_, 1);
  v7 = (char *)v6 + OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_createActivityDelegate;
  if (MEMORY[0x237DEA060]((char *)v6 + OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_createActivityDelegate))
  {
    uint64_t v8 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(ObjectType, v8);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport32ActivityNameOnBoardingController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = sub_235949AC8();
  uint64_t v11 = v10;
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    return (_TtC16MagnifierSupport32ActivityNameOnBoardingController *)sub_235757D54(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)sub_235949AC8();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = sub_235949AC8();
  uint64_t v16 = v15;
  return (_TtC16MagnifierSupport32ActivityNameOnBoardingController *)sub_235757D54(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC16MagnifierSupport32ActivityNameOnBoardingController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = sub_235949AC8();
  uint64_t v11 = v10;
  if (a4)
  {
    a4 = (id)sub_235949AC8();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = a5;
  return (_TtC16MagnifierSupport32ActivityNameOnBoardingController *)sub_235757FB0(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_activityNameTextField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_activityNameTakenLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_button));
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_createActivityDelegate);
  BOOL v3 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport32ActivityNameOnBoardingController_delegate;
  sub_23566A2B4((uint64_t)v3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_235758304();
}

@end