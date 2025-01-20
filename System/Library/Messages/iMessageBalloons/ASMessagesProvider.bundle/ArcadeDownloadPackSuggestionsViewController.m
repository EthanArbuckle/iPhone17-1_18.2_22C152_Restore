@interface ArcadeDownloadPackSuggestionsViewController
- (void)didTapDoneButton;
- (void)didTapGetAllButtonWithSender:(id)a3;
@end

@implementation ArcadeDownloadPackSuggestionsViewController

- (void)didTapDoneButton
{
  v2 = self;
  sub_778F60();
  v4[4] = sub_32C054;
  v4[5] = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256;
  v4[2] = sub_24636C;
  v4[3] = &unk_89A968;
  v3 = _Block_copy(v4);
  [(ArcadeDownloadPackSuggestionsViewController *)v2 dismissViewControllerAnimated:1 completion:v3];
  _Block_release(v3);
}

- (void)didTapGetAllButtonWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_32C2EC(v4);
}

- (void).cxx_destruct
{
  swift_release();

  v3 = *(void **)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC18ASMessagesProvider43ArcadeDownloadPackSuggestionsViewController_primaryGetAllButton];
}

@end